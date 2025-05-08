import os
import time
import sqlite3
import datetime
import argparse
from dotenv import load_dotenv
from supabase import create_client

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

def get_supabase_tables(supabase):
    """Get a list of all tables in the Supabase database"""
    try:
        # Try to get tables from information_schema
        response = supabase.from_("information_schema.tables").select("table_name") \
            .eq("table_schema", "public") \
            .execute()
            
        if response.data:
            return [row.get("table_name") for row in response.data]
        else:
            # If we can't get tables using the schema, try with a list of known tables
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

def clear_table(supabase, table_name):
    """Delete all data from a table in Supabase"""
    try:
        print(f"Clearing data from table: {table_name}")
        result = supabase.from_(table_name).delete().neq("id", "impossible-value").execute()
        return True
    except Exception as e:
        print(f"  Error clearing table {table_name}: {e}")
        return False

def reset_supabase_data():
    """Remove all data from Supabase tables"""
    print("Starting Supabase data reset process...")
    
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
            clear_table(supabase, table_name)
        
        # Then clear parent tables
        for table_name in parent_tables:
            clear_table(supabase, table_name)
        
        print("Data reset completed successfully.")
        return True
        
    except Exception as e:
        print(f"Error in data reset process: {e}")
        return False

def run_import_script(tables=None, batch_size=50):
    """Run the direct_supabase_import.py script"""
    print("\nStarting data import process...")
    
    # Construct the command arguments
    cmd = "python direct_supabase_import.py"
    if tables:
        cmd += " --tables " + " ".join(tables)
    if batch_size:
        cmd += f" --batch-size {batch_size}"
    
    # Execute the command
    print(f"Running command: {cmd}")
    
    try:
        # Import directly using the direct_data_import function from the module
        from direct_supabase_import import direct_data_import
        direct_data_import(tables, batch_size)
        return True
    except Exception as e:
        print(f"Error running import: {e}")
        return False

def main():
    """Main function to reset and reimport data"""
    parser = argparse.ArgumentParser(description='Reset and reimport data from SQLite to Supabase')
    parser.add_argument('--tables', nargs='+', help='Specific tables to import (space separated)')
    parser.add_argument('--batch-size', type=int, default=50, help='Batch size for import (default: 50)')
    parser.add_argument('--skip-reset', action='store_true', help='Skip the data reset step')
    parser.add_argument('--skip-import', action='store_true', help='Skip the data import step')
    args = parser.parse_args()
    
    start_time = datetime.datetime.now()
    print(f"Starting reset and reimport process at {start_time}")
    
    # Step 1: Reset data (unless skipped)
    if not args.skip_reset:
        reset_success = reset_supabase_data()
        if not reset_success:
            print("Data reset failed or was incomplete.")
            if input("Do you want to continue with import anyway? (y/n): ").lower() != 'y':
                return
    else:
        print("Skipping data reset step as requested.")
    
    # Step 2: Reimport data (unless skipped)
    if not args.skip_import:
        import_success = run_import_script(args.tables, args.batch_size)
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