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

# List of application tables to check
APP_TABLES = [
    # Application data tables
    "master_vehicles",
    "volkswagen",
    "acura",
    "alfa_romeo",
    "audi",
    "bmw",
    "brightdrop",
    "buick",
    "cadillac",
    "chevrolet",
    "chrysler",
    "dodge",
    "fiat",
    "ford",
    "genesis",
    "gmc",
    "honda",
    "hyundai",
    "infiniti",
    "jaguar",
    "jeep",
    "kia",
    "land_rover",
    "lexus",
    "lincoln",
    "mazda",
    "mercedes",
    "mini",
    "mitsubishi",
    "nissan",
    "porsche",
    "ram",
    "rolls_royce",
    "subaru",
    "toyota",
    "volvo",
    "poi",
    "systems_hardware",
    # Chat tables
    "chats",
    "messages",
]

def find_duplicates(supabase, table_name, primary_key='id'):
    """Find duplicate records in a table based on non-primary key columns."""
    try:
        print(f"\nChecking table '{table_name}' for duplicates...")
        
        # Try to get all records from the table
        try:
            response = supabase.table(table_name).select("*").execute()
        except Exception:
            # If table() fails, try from_() instead
            response = supabase.from_(table_name).select("*").execute()
        
        if not response.data:
            print(f"  No data found in table '{table_name}'")
            return 0, []
        
        print(f"  Found {len(response.data)} total records")
        
        # Convert to dataframe for easier processing
        df = pd.DataFrame(response.data)
        
        # Define what we consider a duplicate
        # For vehicle tables, we'll use a specific set of columns
        if table_name in ["master_vehicles"] or table_name in [t for t in APP_TABLES if t not in ["chats", "messages", "poi", "systems_hardware"]]:
            # For vehicle tables, check for duplicates based on make, model, year and component
            duplicate_columns = []
            possible_keys = ['make', 'model', 'year', 'parent_component']
            
            # Check which columns actually exist in this table
            for col in possible_keys:
                if col in df.columns:
                    duplicate_columns.append(col)
            
            if not duplicate_columns:
                print(f"  Could not find appropriate columns for deduplication in '{table_name}'")
                return 0, []
            
            print(f"  Using columns for duplicate detection: {duplicate_columns}")
        elif table_name == "chats":
            # For chats, consider duplicates based on user_id and chat_name
            duplicate_columns = []
            possible_keys = ['user_id', 'chat_name', 'created_at']
            for col in possible_keys:
                if col in df.columns:
                    duplicate_columns.append(col)
        elif table_name == "messages":
            # For messages, consider duplicates based on chat_id, role, and content
            duplicate_columns = []
            possible_keys = ['chat_id', 'role', 'content']
            for col in possible_keys:
                if col in df.columns:
                    duplicate_columns.append(col)
        else:
            # For other tables, use all non-primary key columns
            duplicate_columns = [col for col in df.columns if col != primary_key]
        
        # Ensure we have columns to check
        if not duplicate_columns:
            print(f"  No suitable columns found in '{table_name}' for duplicate detection")
            return 0, []
        
        # Check for duplicates based on the selected columns
        duplicate_mask = df.duplicated(subset=duplicate_columns, keep='first')
        duplicates = df[duplicate_mask]
        
        duplicate_count = len(duplicates)
        print(f"  Found {duplicate_count} duplicate records in '{table_name}'")
        
        if duplicate_count > 0 and len(duplicates) > 0:
            # For debugging, show a sample of the duplicates
            print("  Sample of duplicates:")
            sample_size = min(3, len(duplicates))
            for i in range(sample_size):
                row = duplicates.iloc[i]
                # Only print the primary key and duplicate columns for clarity
                sample_data = {primary_key: row.get(primary_key, "N/A")}
                for col in duplicate_columns:
                    if col in row:
                        sample_data[col] = row[col]
                print(f"    Record {i+1}: {sample_data}")
        
        return duplicate_count, duplicates
    except Exception as e:
        print(f"  Error checking for duplicates in {table_name}: {e}")
        return 0, []

def remove_duplicates(supabase, table_name, duplicates, primary_key='id'):
    """Remove duplicate records from a table."""
    try:
        if not duplicates.empty:
            duplicate_count = len(duplicates)
            print(f"\nRemoving {duplicate_count} duplicates from '{table_name}'...")
            
            # Delete each duplicate record by its primary key
            deleted_count = 0
            for _, row in duplicates.iterrows():
                try:
                    # Skip if primary key is missing
                    if primary_key not in row or pd.isna(row[primary_key]):
                        print(f"  Skipping record - no valid {primary_key}")
                        continue
                        
                    pk_value = row[primary_key]
                    
                    # Delete the record
                    try:
                        supabase.table(table_name).delete().eq(primary_key, pk_value).execute()
                    except Exception:
                        # If table() method fails, try from_() method
                        supabase.from_(table_name).delete().eq(primary_key, pk_value).execute()
                        
                    deleted_count += 1
                    
                    # Add a small delay to avoid rate limiting
                    time.sleep(0.1)
                except Exception as e:
                    print(f"  Error deleting record with {primary_key}={pk_value}: {e}")
            
            print(f"  Successfully deleted {deleted_count} of {duplicate_count} duplicate records from '{table_name}'")
            return deleted_count
        else:
            return 0
    except Exception as e:
        print(f"Error deleting duplicates from {table_name}: {e}")
        return 0

def main():
    print("Starting duplicate record check for NICC application tables...")
    
    # Get Supabase client
    supabase = get_supabase_client()
    if not supabase:
        print("Failed to connect to Supabase. Check your credentials.")
        return
    
    # Track tables with duplicates
    tables_with_duplicates = []
    
    # Check each application table for duplicates
    for table_name in APP_TABLES:
        try:
            # Try to determine primary key - assume 'id' if not found
            primary_key = 'id'
            
            # Find duplicates
            duplicate_count, duplicates = find_duplicates(supabase, table_name, primary_key)
            
            if duplicate_count > 0:
                tables_with_duplicates.append({
                    'name': table_name,
                    'count': duplicate_count,
                    'duplicates': duplicates,
                    'primary_key': primary_key
                })
        except Exception as e:
            print(f"Error processing table {table_name}: {e}")
    
    # Summary of duplicates found
    if tables_with_duplicates:
        print("\nDuplicates found in the following tables:")
        for table in tables_with_duplicates:
            print(f"  - {table['name']}: {table['count']} duplicates")
        
        # Ask user for confirmation before deleting
        response = input("\nDo you want to remove these duplicate records? (y/n): ")
        if response.lower() == 'y':
            # Delete duplicates from each table
            for table in tables_with_duplicates:
                remove_duplicates(supabase, table['name'], table['duplicates'], table['primary_key'])
            print("\nDuplicate removal completed.")
        else:
            print("Duplicate removal cancelled.")
    else:
        print("\nNo duplicates found in any application table.")

if __name__ == "__main__":
    main() 