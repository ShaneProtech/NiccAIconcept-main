import os
import time
import sqlite3
import argparse
import datetime
from dotenv import load_dotenv
from supabase import create_client

# Load environment variables
load_dotenv()

# Common functions
def get_sqlite_connection(db_name="NiccDB.db"):
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

def get_sqlite_tables(conn=None):
    """Get a list of all tables in the SQLite database"""
    if conn is None:
        conn = get_sqlite_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT name FROM sqlite_master WHERE type='table'")
    tables = [row[0] for row in cursor.fetchall()]
    # Filter out system tables
    return [t for t in tables if not t.startswith('sqlite_')]

def get_supabase_tables(supabase=None):
    """Get a list of all tables in the Supabase database"""
    if supabase is None:
        supabase = get_supabase_client()
        
    try:
        # Try to get tables from information_schema
        response = supabase.from_("information_schema.tables").select("table_name") \
            .eq("table_schema", "public") \
            .execute()
            
        if response.data:
            return [row.get("table_name") for row in response.data]
        else:
            # If we can't get tables using the schema, use a list of known tables
            print("Could not retrieve tables from information_schema, using predefined list...")
            return [
                "chats", "messages", "master_vehicles", "volkswagen", "acura", "alfa_romeo",
                "audi", "bmw", "brightdrop", "buick", "cadillac", "chevrolet", "chrysler",
                "dodge", "fiat", "ford", "genesis", "gmc", "honda", "hyundai", "infiniti",
                "jaguar", "jeep", "kia", "land_rover", "lexus", "lincoln", "mazda", "mercedes",
                "mini", "mitsubishi", "nissan", "porsche", "ram", "rolls_royce", "subaru",
                "toyota", "volvo", "poi", "systems_hardware"
            ]
    except Exception as e:
        print(f"Error getting tables from Supabase: {e}")
        print("Using predefined list of tables instead...")
        return [
            "chats", "messages", "master_vehicles", "volkswagen", "acura", "alfa_romeo",
            "audi", "bmw", "brightdrop", "buick", "cadillac", "chevrolet", "chrysler",
            "dodge", "fiat", "ford", "genesis", "gmc", "honda", "hyundai", "infiniti",
            "jaguar", "jeep", "kia", "land_rover", "lexus", "lincoln", "mazda", "mercedes",
            "mini", "mitsubishi", "nissan", "porsche", "ram", "rolls_royce", "subaru",
            "toyota", "volvo", "poi", "systems_hardware"
        ]

# Function to reset Supabase data using API
def reset_supabase_data_api():
    """Remove all data from Supabase tables using the API"""
    print("\nStarting Supabase data reset using API...")
    
    try:
        # Connect to Supabase
        supabase = get_supabase_client()
        
        # Get all tables
        tables = get_supabase_tables(supabase)
        
        if not tables:
            print("No tables found in Supabase database.")
            return False
        
        print(f"Found {len(tables)} tables in Supabase: {', '.join(tables)}")
        
        # Delete data from each table (in reverse order to handle dependencies)
        # First clear tables with foreign key dependencies
        child_tables = [t for t in tables if t in ["messages"]]
        parent_tables = [t for t in tables if t not in child_tables]
        
        # Clear child tables first
        for table_name in child_tables:
            print(f"Clearing data from table: {table_name}")
            try:
                supabase.from_(table_name).delete().neq("id", "impossible-value").execute()
                print(f"  Successfully cleared table: {table_name}")
            except Exception as e:
                print(f"  Error clearing table {table_name}: {e}")
        
        # Then clear parent tables
        for table_name in parent_tables:
            print(f"Clearing data from table: {table_name}")
            try:
                supabase.from_(table_name).delete().neq("id", "impossible-value").execute()
                print(f"  Successfully cleared table: {table_name}")
            except Exception as e:
                print(f"  Error clearing table {table_name}: {e}")
        
        print("Data reset completed using API.")
        return True
        
    except Exception as e:
        print(f"Error in data reset process: {e}")
        return False

# Function to generate SQL for resetting Supabase
def generate_reset_sql():
    """Generate SQL statements to reset all Supabase tables"""
    print("\nGenerating SQL statements to reset Supabase tables...")
    
    try:
        # Connect to Supabase
        supabase = get_supabase_client()
        
        # Get all tables
        tables = get_supabase_tables(supabase)
        
        if not tables:
            print("No tables found in Supabase database.")
            return False
        
        print(f"Found {len(tables)} tables in Supabase")
        
        # Create SQL statements to delete all data from tables
        sql_statements = []
        
        # Add transaction markers
        sql_statements.append("-- SQL to reset all data in Supabase tables")
        sql_statements.append(f"-- Generated on {time.strftime('%Y-%m-%d %H:%M:%S')}")
        sql_statements.append("-- WARNING: This will delete ALL data from these tables!")
        sql_statements.append("")
        sql_statements.append("BEGIN;")
        sql_statements.append("")
        
        # First add statements for tables with foreign key dependencies
        child_tables = [t for t in tables if t in ["messages"]]
        parent_tables = [t for t in tables if t not in child_tables]
        
        # Add child tables first
        if child_tables:
            sql_statements.append("-- First delete from tables with foreign key dependencies")
            for table in child_tables:
                sql_statements.append(f'DELETE FROM "{table}";')
            sql_statements.append("")
        
        # Then parent tables
        if parent_tables:
            sql_statements.append("-- Then delete from parent tables")
            for table in parent_tables:
                sql_statements.append(f'DELETE FROM "{table}";')
            sql_statements.append("")
        
        # Commit transaction
        sql_statements.append("COMMIT;")
        
        # Write statements to file
        sql_file = "reset_supabase_tables.sql"
        with open(sql_file, "w") as f:
            f.write("\n".join(sql_statements))
        
        print(f"SQL statements written to {sql_file}")
        print("\nTo use this SQL:")
        print("1. Log in to your Supabase dashboard")
        print("2. Go to the SQL Editor")
        print("3. Copy and paste the contents of the SQL file")
        print("4. Review carefully, then execute")
        
        return True
        
    except Exception as e:
        print(f"Error generating SQL: {e}")
        return False

# Function to import data from SQLite to Supabase
def import_data_to_supabase(tables=None, batch_size=50):
    """Import data from SQLite to Supabase"""
    print("\nStarting data import process...")
    
    try:
        # Import the direct_data_import function from the script
        from direct_supabase_import import direct_data_import
        
        # Check which tables to import
        if tables is None or len(tables) == 0:
            # Get tables from SQLite
            sqlite_conn = get_sqlite_connection()
            all_tables = get_sqlite_tables(sqlite_conn)
            # Filter out system tables
            tables_to_import = [t for t in all_tables if not t.startswith('sqlite_')]
            sqlite_conn.close()
        else:
            tables_to_import = tables
            
        print(f"Will import {len(tables_to_import)} tables: {', '.join(tables_to_import)}")
        
        # Call the import function
        direct_data_import(tables_to_import, batch_size)
        return True
        
    except ImportError:
        print("ERROR: Could not import direct_supabase_import.py module.")
        print("Make sure it exists in the current directory.")
        return False
    except Exception as e:
        print(f"Error running import: {e}")
        return False

# Function to list available tables
def list_available_tables():
    """List all tables in the SQLite database with row counts"""
    print("\nListing available tables in SQLite database...")
    
    try:
        conn = get_sqlite_connection()
        cursor = conn.cursor()
        
        # Get all tables
        all_tables = get_sqlite_tables(conn)
        
        # Get row counts
        print("Available tables in SQLite database:")
        for table in sorted(all_tables):
            cursor.execute(f"SELECT COUNT(*) FROM {table}")
            row_count = cursor.fetchone()[0]
            print(f"  {table} ({row_count} rows)")
        
        conn.close()
        return True
        
    except Exception as e:
        print(f"Error listing tables: {e}")
        return False

# Main function
def main():
    """Main function to reset and reimport data"""
    parser = argparse.ArgumentParser(description='Reset and reimport data from SQLite to Supabase')
    parser.add_argument('--reset-method', choices=['api', 'sql', 'none'], default='api',
                        help='Method to reset data: api (use Supabase API), sql (generate SQL file), or none (skip reset)')
    parser.add_argument('--tables', nargs='+', help='Specific tables to import (space separated)')
    parser.add_argument('--batch-size', type=int, default=50, help='Batch size for import (default: 50)')
    parser.add_argument('--skip-import', action='store_true', help='Skip the data import step')
    parser.add_argument('--list-tables', action='store_true', help='List available tables in SQLite and exit')
    args = parser.parse_args()
    
    # Just list tables if requested
    if args.list_tables:
        list_available_tables()
        return
    
    start_time = datetime.datetime.now()
    print(f"Starting reset and reimport process at {start_time}")
    
    # Step 1: Reset data based on method
    if args.reset_method == 'api':
        reset_success = reset_supabase_data_api()
        if not reset_success:
            print("Data reset failed or was incomplete.")
            if input("Do you want to continue with import anyway? (y/n): ").lower() != 'y':
                return
    elif args.reset_method == 'sql':
        generate_reset_sql()
        print("\nPlease execute the SQL script in your Supabase SQL Editor before continuing.")
        if input("Have you executed the SQL reset script? (y/n): ").lower() != 'y':
            print("Import cancelled. Please run the script again after executing the SQL.")
            return
    else:
        print("Skipping data reset step as requested.")
    
    # Step 2: Reimport data (unless skipped)
    if not args.skip_import:
        import_success = import_data_to_supabase(args.tables, args.batch_size)
        if not import_success:
            print("Data import failed or was incomplete.")
    else:
        print("Skipping data import step as requested.")
    
    # Final report
    end_time = datetime.datetime.now()
    duration = end_time - start_time
    print(f"\nProcess completed at {end_time}")
    print(f"Total duration: {duration}")

if __name__ == "__main__":
    main() 