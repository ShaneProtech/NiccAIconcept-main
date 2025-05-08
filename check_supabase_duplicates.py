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

def get_all_tables(supabase):
    """Get a list of all tables in the Supabase database."""
    try:
        # This query gets all tables from the Postgres information_schema
        response = supabase.table("information_schema.tables").select("table_name") \
            .eq("table_schema", "public") \
            .execute()
        
        # Extract table names from the response
        tables = [row['table_name'] for row in response.data]
        return tables
    except Exception as e:
        print(f"Error getting tables: {e}")
        return []

def get_primary_key(supabase, table_name):
    """Get the primary key column(s) for a given table."""
    try:
        # Query to get primary key columns
        query = f"""
        SELECT a.attname as column_name
        FROM pg_index i
        JOIN pg_attribute a ON a.attrelid = i.indrelid AND a.attnum = ANY(i.indkey)
        WHERE i.indrelid = '{table_name}'::regclass
        AND i.indisprimary;
        """
        
        # Execute the raw SQL query
        response = supabase.rpc('exec_sql', {'query': query}).execute()
        
        if response.data:
            # Return list of primary key columns
            return [row['column_name'] for row in response.data]
        else:
            # If no primary key, return a default column
            print(f"No primary key found for {table_name}, will check for id column")
            return ['id']
    except Exception as e:
        print(f"Error getting primary key for {table_name}: {e}")
        return ['id']  # Default to 'id' as a fallback

def check_for_duplicates(supabase, table_name):
    """Check a table for duplicate records based on all columns except primary key."""
    try:
        print(f"\nChecking table '{table_name}' for duplicates...")
        # Get all records from the table
        response = supabase.table(table_name).select("*").execute()
        
        if not response.data:
            print(f"  No data found in table '{table_name}'")
            return 0
        
        # Convert to dataframe for easier processing
        df = pd.DataFrame(response.data)
        
        # Get primary key column(s)
        pk_columns = get_primary_key(supabase, table_name)
        
        # Get all non-primary key columns
        non_pk_columns = [col for col in df.columns if col not in pk_columns]
        
        if not non_pk_columns:
            print(f"  No non-primary key columns found in '{table_name}', cannot check for duplicates")
            return 0
        
        # Check for duplicates based on non-primary key columns
        duplicate_mask = df.duplicated(subset=non_pk_columns, keep='first')
        duplicates = df[duplicate_mask]
        
        duplicate_count = len(duplicates)
        print(f"  Found {duplicate_count} duplicate records in '{table_name}'")
        
        return duplicate_count
    except Exception as e:
        print(f"Error checking for duplicates in {table_name}: {e}")
        return 0

def delete_duplicates(supabase, table_name):
    """Delete duplicate records from a table."""
    try:
        print(f"\nRemoving duplicates from '{table_name}'...")
        
        # Get all records from the table
        response = supabase.table(table_name).select("*").execute()
        
        if not response.data:
            print(f"  No data found in table '{table_name}'")
            return 0
        
        # Convert to dataframe for easier processing
        df = pd.DataFrame(response.data)
        
        # Get primary key column(s)
        pk_columns = get_primary_key(supabase, table_name)
        primary_key = pk_columns[0] if pk_columns else 'id'
        
        # Get all non-primary key columns
        non_pk_columns = [col for col in df.columns if col not in pk_columns]
        
        if not non_pk_columns:
            print(f"  No non-primary key columns found in '{table_name}', cannot identify duplicates")
            return 0
        
        # Find duplicate records (keeping the first occurrence)
        df['is_duplicate'] = df.duplicated(subset=non_pk_columns, keep='first')
        duplicates = df[df['is_duplicate']]
        
        duplicate_count = len(duplicates)
        
        if duplicate_count == 0:
            print(f"  No duplicates to remove from '{table_name}'")
            return 0
        
        print(f"  Attempting to delete {duplicate_count} duplicate records from '{table_name}'")
        
        # Delete each duplicate record by its primary key
        deleted_count = 0
        for _, row in duplicates.iterrows():
            try:
                # Extract the primary key value
                pk_value = row[primary_key]
                
                # Delete the record
                supabase.table(table_name).delete().eq(primary_key, pk_value).execute()
                deleted_count += 1
                
                # Add a small delay to avoid rate limiting
                time.sleep(0.1)
            except Exception as e:
                print(f"  Error deleting record with {primary_key}={pk_value}: {e}")
        
        print(f"  Successfully deleted {deleted_count} duplicate records from '{table_name}'")
        return deleted_count
    except Exception as e:
        print(f"Error deleting duplicates from {table_name}: {e}")
        return 0

def main():
    print("Starting Supabase database inspection for duplicate records...")
    
    # Get Supabase client
    supabase = get_supabase_client()
    if not supabase:
        print("Failed to connect to Supabase. Check your credentials.")
        return
    
    # Get all tables
    tables = get_all_tables(supabase)
    
    if not tables:
        print("No tables found in Supabase database or unable to retrieve tables.")
        return
    
    print(f"Found {len(tables)} tables in Supabase database: {', '.join(tables)}")
    
    # Check each table for duplicates
    tables_with_duplicates = []
    for table in tables:
        duplicate_count = check_for_duplicates(supabase, table)
        if duplicate_count > 0:
            tables_with_duplicates.append((table, duplicate_count))
    
    # Summary of duplicates found
    if tables_with_duplicates:
        print("\nDuplicates found in the following tables:")
        for table, count in tables_with_duplicates:
            print(f"  - {table}: {count} duplicates")
        
        # Ask user for confirmation before deleting
        response = input("\nDo you want to remove these duplicate records? (y/n): ")
        if response.lower() == 'y':
            # Delete duplicates from each table
            for table, _ in tables_with_duplicates:
                delete_duplicates(supabase, table)
            print("\nDuplicate removal completed.")
        else:
            print("Duplicate removal cancelled.")
    else:
        print("\nNo duplicates found in any table.")

if __name__ == "__main__":
    main() 