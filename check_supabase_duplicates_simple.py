import os
import time
from dotenv import load_dotenv
from supabase import create_client
import pandas as pd

def get_supabase_client():
    """Get a connection to Supabase."""
    load_dotenv()
    
    supabase_url = os.getenv("SUPABASE_URL")
    supabase_key = os.getenv("SUPABASE_KEY")
    
    if not supabase_url or not supabase_key:
        print("ERROR: Missing Supabase credentials in .env file")
        print("Make sure SUPABASE_URL and SUPABASE_KEY are set in your .env file")
        return None
    
    try:
        return create_client(supabase_url, supabase_key)
    except Exception as e:
        print(f"Supabase connection error: {e}")
        return None

def get_table_info(supabase):
    """Get information about all tables in Supabase."""
    try:
        # First, get a list of tables
        response = supabase.from_("information_schema.tables").select("table_name") \
            .eq("table_schema", "public") \
            .execute()
            
        if not response.data:
            print("No tables found or unable to access table information.")
            return []
            
        # Extract table names
        table_names = [row.get("table_name") for row in response.data]
        
        tables_info = []
        for table_name in table_names:
            # Get a sample record to extract column names
            try:
                sample = supabase.from_(table_name).select("*").limit(1).execute()
                if sample.data:
                    # Assume id is the primary key if it exists
                    columns = list(sample.data[0].keys())
                    has_id = "id" in columns
                    
                    tables_info.append({
                        "name": table_name,
                        "columns": columns,
                        "primary_key": "id" if has_id else columns[0]  # Default to first column if no id
                    })
                else:
                    print(f"No data in table {table_name}, skipping schema detection")
                    # Add basic info without schema
                    tables_info.append({
                        "name": table_name,
                        "columns": [],
                        "primary_key": "id"  # Default
                    })
            except Exception as e:
                print(f"Error getting schema for {table_name}: {e}")
        
        return tables_info
    except Exception as e:
        print(f"Error accessing table information: {e}")
        return []

def find_and_remove_duplicates(supabase, table_info):
    """Find and remove duplicate records from a Supabase table."""
    table_name = table_info["name"]
    primary_key = table_info["primary_key"]
    print(f"\nProcessing table '{table_name}'...")
    
    try:
        # Get all records
        response = supabase.from_(table_name).select("*").execute()
        
        if not response.data:
            print(f"  No data in table '{table_name}'")
            return 0
            
        print(f"  Found {len(response.data)} total records")
        
        # Convert to DataFrame for easier duplicate detection
        df = pd.DataFrame(response.data)
        
        if len(df.columns) <= 1:
            print(f"  Table '{table_name}' has only {len(df.columns)} column(s), can't check for duplicates")
            return 0
            
        # Exclude primary key when checking for duplicates
        non_pk_columns = [col for col in df.columns if col != primary_key]
        
        if not non_pk_columns:
            print(f"  No non-primary key columns found in '{table_name}'")
            return 0
            
        # Find duplicates
        duplicate_mask = df.duplicated(subset=non_pk_columns, keep='first')
        duplicates = df[duplicate_mask]
        duplicate_count = len(duplicates)
        
        print(f"  Found {duplicate_count} duplicate records")
        
        if duplicate_count > 0:
            # Ask for confirmation
            confirm = input(f"  Do you want to delete {duplicate_count} duplicates from '{table_name}'? (y/n): ")
            
            if confirm.lower() != 'y':
                print("  Deletion cancelled")
                return duplicate_count
                
            # Delete duplicates
            deleted_count = 0
            for _, row in duplicates.iterrows():
                pk_value = row[primary_key]
                try:
                    # Delete the record
                    supabase.from_(table_name).delete().eq(primary_key, pk_value).execute()
                    deleted_count += 1
                    
                    # Add a small delay to avoid rate limiting
                    time.sleep(0.1)
                except Exception as e:
                    print(f"  Error deleting record with {primary_key}={pk_value}: {e}")
            
            print(f"  Successfully deleted {deleted_count} of {duplicate_count} duplicate records")
            return duplicate_count
        else:
            return 0
    except Exception as e:
        print(f"  Error processing table {table_name}: {e}")
        return 0

def main():
    print("Starting Supabase database duplicate check and cleanup...")
    
    # Connect to Supabase
    supabase = get_supabase_client()
    if not supabase:
        print("Failed to connect to Supabase. Please check your credentials.")
        return
        
    # Get table information
    print("Getting table information...")
    tables_info = get_table_info(supabase)
    
    if not tables_info:
        print("No tables found or could not access table information.")
        return
        
    print(f"Found {len(tables_info)} tables in the database.")
    
    # Process each table
    total_duplicates = 0
    tables_with_duplicates = []
    
    for table_info in tables_info:
        duplicates = find_and_remove_duplicates(supabase, table_info)
        if duplicates > 0:
            total_duplicates += duplicates
            tables_with_duplicates.append({
                "name": table_info["name"],
                "duplicates": duplicates
            })
    
    # Summary
    print("\n=== Summary ===")
    if total_duplicates > 0:
        print(f"Found and processed {total_duplicates} duplicate records across {len(tables_with_duplicates)} tables:")
        for table in tables_with_duplicates:
            print(f"  - {table['name']}: {table['duplicates']} duplicates")
    else:
        print("No duplicate records found in any table.")

if __name__ == "__main__":
    main() 