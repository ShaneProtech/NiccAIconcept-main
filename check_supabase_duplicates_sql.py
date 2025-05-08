import os
import time
import json
import pandas as pd
from dotenv import load_dotenv
from supabase import create_client

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
    "master_vehicles",
    "poi",
    "systems_hardware",
    # Chat tables
    "chats",
    "messages",
]

def find_duplicates(supabase, table_name):
    """Find duplicate records in a table and generate SQL to remove them."""
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
            return 0, None
        
        # Convert to dataframe for easier processing
        df = pd.DataFrame(response.data)
        total_records = len(df)
        print(f"  Found {total_records} total records")
        
        # Define what we consider a duplicate - specific to the table type
        # For vehicle tables, use make, model, year, component
        if table_name in ["master_vehicles"] or table_name in [t for t in APP_TABLES if t not in ["chats", "messages", "poi", "systems_hardware"]]:
            duplicate_columns = []
            possible_keys = ['make', 'model', 'year', 'parent_component']
            
            # Check which columns actually exist in this table
            for col in possible_keys:
                if col in df.columns:
                    duplicate_columns.append(col)
            
            if not duplicate_columns:
                print(f"  Could not find appropriate columns for deduplication in '{table_name}'")
                return 0, None
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
            # For other tables, use all columns except id or created/updated timestamps
            skip_columns = ['id', 'created_at', 'updated_at']
            duplicate_columns = [col for col in df.columns if col not in skip_columns]
        
        print(f"  Using columns for duplicate detection: {duplicate_columns}")
        
        # Check for duplicates based on the selected columns
        if not duplicate_columns:
            print(f"  No suitable columns found in '{table_name}' for duplicate detection")
            return 0, None
            
        # Find duplicates (mark first occurrence as False, duplicates as True)
        df['is_duplicate'] = df.duplicated(subset=duplicate_columns, keep='first')
        duplicates = df[df['is_duplicate']]
        
        duplicate_count = len(duplicates)
        print(f"  Found {duplicate_count} duplicate records in '{table_name}'")
        
        if duplicate_count == 0:
            return 0, None
        
        # Generate SQL to delete duplicates
        sql_statements = []
        
        for idx, row in duplicates.iterrows():
            # Create a WHERE clause that uniquely identifies this record
            conditions = []
            
            # Try to use primary key if available
            if 'id' in row and pd.notna(row['id']):
                conditions.append(f"id = {row['id']}")
            else:
                # Otherwise use all non-null columns to identify the record
                for col in df.columns:
                    if col not in ['is_duplicate'] and pd.notna(row[col]):
                        if isinstance(row[col], (int, float)):
                            conditions.append(f"{col} = {row[col]}")
                        else:
                            # Handle text, including escaping single quotes
                            value = str(row[col]).replace("'", "''")
                            conditions.append(f"{col} = '{value}'")
            
            # Create the DELETE statement
            if conditions:
                where_clause = " AND ".join(conditions)
                sql = f"DELETE FROM \"{table_name}\" WHERE {where_clause};"
                sql_statements.append(sql)
        
        return duplicate_count, sql_statements
    except Exception as e:
        print(f"  Error checking for duplicates in {table_name}: {e}")
        return 0, None

def main():
    print("Starting duplicate record check for Supabase tables...")
    
    # Get Supabase client
    supabase = get_supabase_client()
    if not supabase:
        print("Failed to connect to Supabase. Check your credentials.")
        return
    
    # Track tables with duplicates
    tables_with_duplicates = []
    all_sql_statements = []
    
    # Check each application table for duplicates
    for table_name in APP_TABLES:
        try:
            # Find duplicates and get SQL statements to remove them
            duplicate_count, sql_statements = find_duplicates(supabase, table_name)
            
            if duplicate_count > 0 and sql_statements:
                tables_with_duplicates.append({
                    'name': table_name,
                    'count': duplicate_count,
                    'sql_statements': sql_statements
                })
                all_sql_statements.extend(sql_statements)
        except Exception as e:
            print(f"Error processing table {table_name}: {e}")
    
    # Summary of duplicates found
    if tables_with_duplicates:
        print("\nDuplicates found in the following tables:")
        for table in tables_with_duplicates:
            print(f"  - {table['name']}: {table['count']} duplicates")
        
        # Write SQL statements to a file
        with open('remove_duplicates.sql', 'w') as f:
            f.write("-- SQL statements to remove duplicate records from Supabase tables\n")
            f.write(f"-- Generated on {time.strftime('%Y-%m-%d %H:%M:%S')}\n")
            f.write("-- THIS SCRIPT WILL DELETE DATA! Review carefully before running\n\n")
            
            # Add a transaction wrapper
            f.write("BEGIN;\n\n")
            
            # Group by table
            for table in tables_with_duplicates:
                f.write(f"-- Remove duplicates from {table['name']} ({table['count']} duplicates)\n")
                for sql in table['sql_statements']:
                    f.write(f"{sql}\n")
                f.write("\n")
            
            # End transaction
            f.write("COMMIT;\n")
            
            # Add rollback comment
            f.write("\n-- If you want to test without deleting, change BEGIN to BEGIN; and COMMIT to ROLLBACK;\n")
        
        print(f"\nGenerated SQL script to remove {len(all_sql_statements)} duplicate records.")
        print("SQL statements written to 'remove_duplicates.sql'")
        print("Review this file carefully before executing it in Supabase SQL Editor.")
    else:
        print("\nNo duplicates found in any application table.")

if __name__ == "__main__":
    main() 