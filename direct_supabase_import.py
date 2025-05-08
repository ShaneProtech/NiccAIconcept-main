import os
import sqlite3
import datetime
import argparse
from dotenv import load_dotenv
from supabase import create_client
import time

# Load environment variables
load_dotenv()

def get_sqlite_connection(db_name):
    """Get a connection to the SQLite database"""
    conn = sqlite3.connect(db_name)
    conn.row_factory = sqlite3.Row
    return conn

def get_supabase_client():
    """Get a connection to Supabase"""
    supabase_url = os.getenv("SUPABASE_URL")
    supabase_key = os.getenv("SUPABASE_KEY")
    
    if not supabase_url or not supabase_key:
        raise ValueError("SUPABASE_URL and SUPABASE_KEY must be set in .env file")
    
    return create_client(supabase_url, supabase_key)

def get_tables(conn):
    """Get a list of all tables in the SQLite database"""
    cursor = conn.cursor()
    cursor.execute("SELECT name FROM sqlite_master WHERE type='table'")
    return [row[0] for row in cursor.fetchall()]

def import_table_data(sqlite_conn, supabase, table_name, batch_size=100):
    """Import data from SQLite to Supabase for a single table"""
    cursor = sqlite_conn.cursor()
    
    # Get total rows count
    cursor.execute(f"SELECT COUNT(*) FROM {table_name}")
    total_rows = cursor.fetchone()[0]
    print(f"Table {table_name} has {total_rows} rows")
    
    if total_rows == 0:
        print(f"  Skipping {table_name} - no data to import")
        return 0
    
    # Get column names
    cursor.execute(f"PRAGMA table_info({table_name})")
    columns = [row[1] for row in cursor.fetchall()]
    
    rows_imported = 0
    batch_num = 0
    
    # Process in batches
    for offset in range(0, total_rows, batch_size):
        batch_num += 1
        limit = min(batch_size, total_rows - offset)
        print(f"  Processing batch {batch_num}: rows {offset+1}-{offset+limit} of {total_rows}")
        
        # Get batch of data
        cursor.execute(f"SELECT * FROM {table_name} LIMIT {limit} OFFSET {offset}")
        rows = [dict(row) for row in cursor.fetchall()]
        
        if not rows:
            break
        
        # Insert batch into Supabase
        try:
            # Insert data into Supabase
            result = supabase.table(table_name).insert(rows).execute()
            
            # Check for errors
            if hasattr(result, 'error') and result.error:
                print(f"  Error in batch {batch_num}: {result.error}")
                if batch_size > 10:
                    # Try again with smaller batches if we get an error
                    print(f"  Retrying with smaller batches...")
                    smaller_batch_size = max(1, batch_size // 5)
                    # Move offset back to retry this batch
                    offset = max(0, offset - batch_size)
                    batch_size = smaller_batch_size
                    batch_num -= 1
                    continue
            else:
                rows_imported += len(rows)
                print(f"  Imported {len(rows)} rows (Total: {rows_imported})")
            
            # Small pause to avoid rate limiting
            time.sleep(0.5)
            
        except Exception as e:
            print(f"  Error importing batch {batch_num}: {str(e)}")
            if "timeout" in str(e).lower() or "too large" in str(e).lower():
                # If timeout, reduce batch size
                if batch_size > 5:
                    print(f"  Timeout - retrying with smaller batches...")
                    smaller_batch_size = max(1, batch_size // 2)
                    # Move offset back to retry this batch
                    offset = max(0, offset - batch_size)
                    batch_size = smaller_batch_size
                    batch_num -= 1
                    continue
            elif "already exists" in str(e).lower() or "duplicate" in str(e).lower():
                # Skip records that already exist
                print(f"  Skipping duplicates in this batch")
                rows_imported += len(rows)
            else:
                # For non-timeout errors, print details and continue with next batch
                print(f"  Error details: {str(e)}")
    
    return rows_imported

def direct_data_import(tables=None, batch_size=100):
    """Import data from SQLite to Supabase directly"""
    start_time = datetime.datetime.now()
    
    print(f"Starting direct import from SQLite to Supabase at {start_time}")
    
    try:
        # Connect to SQLite and Supabase
        sqlite_conn = get_sqlite_connection('NiccDB.db')
        supabase = get_supabase_client()
        
        # Get all tables from SQLite
        all_tables = get_tables(sqlite_conn)
        
        # Filter out system tables and tables we don't want to migrate
        available_tables = [t for t in all_tables if not t.startswith('sqlite_') and t not in [
            'master_vehicles',  # Exclude tables already created in Supabase
        ]]
        
        # Determine which tables to import
        if tables is None or len(tables) == 0:
            # Default - import all tables, starting with small ones
            small_tables = ['poi', 'systems_hardware', 'poi_backup']
            tables_to_import = small_tables + sorted([t for t in available_tables if t not in small_tables])
        else:
            # Import only specified tables, validating they exist first
            tables_to_import = [t for t in tables if t in available_tables]
            if len(tables_to_import) < len(tables):
                missing_tables = set(tables) - set(tables_to_import)
                print(f"WARNING: Some specified tables were not found: {', '.join(missing_tables)}")
        
        print(f"Found {len(available_tables)} tables in database")
        print(f"Will import {len(tables_to_import)} tables: {', '.join(tables_to_import)}")
        
        # Import each table
        for i, table_name in enumerate(tables_to_import):
            print(f"\n[{i+1}/{len(tables_to_import)}] Importing {table_name}...")
            rows_imported = import_table_data(sqlite_conn, supabase, table_name, batch_size)
            print(f"Completed {table_name}: {rows_imported} rows imported")
        
        # Close connections
        sqlite_conn.close()
        
        # Final report
        end_time = datetime.datetime.now()
        duration = end_time - start_time
        print(f"\nImport completed at {end_time}")
        print(f"Total duration: {duration}")
        
    except Exception as e:
        print(f"Error in direct import: {str(e)}")

def parse_arguments():
    """Parse command line arguments"""
    parser = argparse.ArgumentParser(description='Import data from SQLite to Supabase')
    parser.add_argument('--tables', nargs='+', help='Specific tables to import (space separated)')
    parser.add_argument('--batch-size', type=int, default=100, help='Batch size for import (default: 100)')
    parser.add_argument('--list', action='store_true', help='List available tables and exit')
    return parser.parse_args()

if __name__ == "__main__":
    args = parse_arguments()
    
    if args.list:
        # Just list available tables
        conn = get_sqlite_connection('NiccDB.db')
        all_tables = get_tables(conn)
        available_tables = [t for t in all_tables if not t.startswith('sqlite_')]
        
        # Get row counts
        print("Available tables in SQLite database:")
        for table in sorted(available_tables):
            cursor = conn.cursor()
            cursor.execute(f"SELECT COUNT(*) FROM {table}")
            row_count = cursor.fetchone()[0]
            print(f"  {table} ({row_count} rows)")
        
        conn.close()
    else:
        # Run the import
        direct_data_import(args.tables, args.batch_size) 