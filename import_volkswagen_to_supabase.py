import os
import time
import sqlite3
import json
import datetime
import logging
from dotenv import load_dotenv
from supabase import create_client

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

"""
VOLKSWAGEN DATA IMPORT SCRIPT
=============================

This script imports Volkswagen data from the local SQLite database to Supabase.

BEFORE RUNNING:
1. Make sure the volkswagen table exists in Supabase
   - Open Supabase SQL Editor
   - Copy and execute the SQL from create_volkswagen_table_sql.sql
   - Verify the table was created in the Table Editor

2. Make sure your .env file contains Supabase credentials:
   SUPABASE_URL=your-supabase-url
   SUPABASE_KEY=your-supabase-key

3. Run this script to import the data:
   .\env\Scripts\python.exe import_volkswagen_to_supabase.py
"""

def get_sqlite_connection():
    """Get a connection to the SQLite database."""
    try:
        conn = sqlite3.connect('NICCDB.db')
        return conn
    except sqlite3.Error as e:
        logger.error(f"SQLite connection error: {e}")
        return None

def get_supabase_client():
    """Get a connection to Supabase."""
    load_dotenv()
    
    supabase_url = os.getenv("SUPABASE_URL")
    supabase_key = os.getenv("SUPABASE_KEY")
    
    if not supabase_url or not supabase_key:
        logger.error("Missing Supabase credentials in .env file")
        print("ERROR: Missing Supabase credentials in .env file")
        print("Make sure SUPABASE_URL and SUPABASE_KEY are set in your .env file")
        return None
    
    try:
        return create_client(supabase_url, supabase_key)
    except Exception as e:
        logger.error(f"Supabase connection error: {e}")
        return None

def check_table_exists(supabase, table_name):
    """Check if a table exists in Supabase by attempting to select a test record."""
    try:
        # Try to select from the table with a limit of 1
        result = supabase.table(table_name).select('*').limit(1).execute()
        # If we get a result (even empty), the table exists
        return True
    except Exception as e:
        error_message = str(e)
        if "relation" in error_message and "does not exist" in error_message:
            return False
        # For other errors, log but assume the table might exist
        logger.warning(f"Error checking if table exists: {e}")
        return False  # Safer to assume it doesn't exist if we can't verify

def import_volkswagen_data(batch_size=50):
    """Import Volkswagen data from SQLite to Supabase."""
    start_time = datetime.datetime.now()
    logger.info(f"Starting Volkswagen import at {start_time}")
    print(f"Starting Volkswagen import at {start_time}")
    
    # Connect to SQLite
    sqlite_conn = get_sqlite_connection()
    if not sqlite_conn:
        print("Failed to connect to SQLite database.")
        return
    
    # Get Supabase client
    supabase = get_supabase_client()
    if not supabase:
        print("Failed to connect to Supabase.")
        sqlite_conn.close()
        return
    
    # Check if volkswagen table exists
    print("Checking if volkswagen table exists in Supabase...")
    if not check_table_exists(supabase, "volkswagen"):
        print("")
        print("The volkswagen table doesn't exist in Supabase yet!")
        print("Follow these steps to create it:")
        print("1. Open Supabase SQL Editor")
        print("2. Copy and paste the SQL from create_volkswagen_table_sql.sql")
        print("3. Run the SQL to create the table")
        print("4. Run this script again")
        print("")
        sqlite_conn.close()
        end_time = datetime.datetime.now()
        logger.info(f"Import process terminated at {end_time}")
        print(f"Import process terminated at {end_time}")
        return
    
    try:
        # Get all records from the volkswagen table
        cursor = sqlite_conn.cursor()
        cursor.execute("SELECT * FROM volkswagen")
        rows = cursor.fetchall()
        
        # Get column names
        column_names = [description[0] for description in cursor.description]
        
        # Count of rows
        total_rows = len(rows)
        logger.info(f"Found {total_rows} volkswagen records to import")
        print(f"Found {total_rows} volkswagen records to import")
        
        if total_rows == 0:
            print("No volkswagen data found to import.")
            return
        
        # Import in batches
        success_count = 0
        batch_count = (total_rows // batch_size) + (1 if total_rows % batch_size > 0 else 0)
        
        for batch_num in range(batch_count):
            start_idx = batch_num * batch_size
            end_idx = min(start_idx + batch_size, total_rows)
            batch = rows[start_idx:end_idx]
            
            # Convert to list of dictionaries
            batch_dicts = []
            for row in batch:
                row_dict = {}
                for i, col_name in enumerate(column_names):
                    row_dict[col_name] = row[i]
                batch_dicts.append(row_dict)
            
            # Show progress
            print(f"Importing batch {batch_num+1}/{batch_count} (records {start_idx+1}-{end_idx})")
            
            try:
                # Try to insert the batch
                result = supabase.table("volkswagen").insert(batch_dicts).execute()
                if hasattr(result, 'data') and isinstance(result.data, list):
                    batch_success = len(result.data)
                    success_count += batch_success
                    print(f"Batch {batch_num+1}: Successfully imported {batch_success} records")
                else:
                    print(f"Batch {batch_num+1}: No confirmation of successful import")
                    
            except Exception as e:
                logger.error(f"Error importing batch {batch_num+1}: {e}")
                print(f"Error importing batch {batch_num+1}: {str(e)}")
                
                # If batch fails, try smaller batches recursively
                if batch_size > 10:
                    print(f"Retrying with smaller batch size...")
                    # Close resources before recursive call
                    cursor.close()
                    sqlite_conn.close()
                    # Try again with smaller batch size
                    return import_volkswagen_data(batch_size=batch_size // 2)
        
        print(f"Successfully imported {success_count} of {total_rows} records")
        
    except Exception as e:
        logger.error(f"Error during import: {e}")
        print(f"Error during import: {e}")
    
    finally:
        # Clean up
        if sqlite_conn:
            sqlite_conn.close()
        
        end_time = datetime.datetime.now()
        duration = end_time - start_time
        logger.info(f"Import process finished at {end_time}")
        logger.info(f"Total duration: {duration}")
        print(f"Import process finished at {end_time}")
        print(f"Total duration: {duration}")

if __name__ == "__main__":
    import_volkswagen_data() 