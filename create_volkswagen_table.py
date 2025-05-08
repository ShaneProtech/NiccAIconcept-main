import os
import sqlite3
from dotenv import load_dotenv
from supabase import create_client

# Load environment variables
load_dotenv()

def get_sqlite_connection(db_name="NiccDB.db"):
    """Get connection to SQLite database"""
    conn = sqlite3.connect(db_name)
    return conn

def get_supabase_client():
    """Get connection to Supabase"""
    supabase_url = os.getenv("SUPABASE_URL")
    supabase_key = os.getenv("SUPABASE_KEY")
    
    if not supabase_url or not supabase_key:
        raise ValueError("SUPABASE_URL and SUPABASE_KEY must be set in .env file")
    
    return create_client(supabase_url, supabase_key)

def create_volkswagen_table():
    """Create the Volkswagen table in Supabase"""
    print("Getting table schema from SQLite...")
    
    # Get schema from SQLite
    conn = get_sqlite_connection()
    cursor = conn.cursor()
    
    # Get column information from the volkswagen table in SQLite
    cursor.execute("PRAGMA table_info(volkswagen)")
    columns_info = cursor.fetchall()
    
    if not columns_info:
        print("Error: Could not get schema for volkswagen table from SQLite")
        return False
    
    # Generate CREATE TABLE SQL for Supabase
    create_table_sql = 'CREATE TABLE IF NOT EXISTS "volkswagen" (\n'
    column_defs = []
    
    for col_info in columns_info:
        col_name = col_info[1]  # Column name is at index 1
        col_type = col_info[2].lower()  # Column type is at index 2
        
        # Map SQLite types to PostgreSQL types
        if col_type == "integer":
            pg_type = "integer"
        elif col_type in ["real", "double", "float"]:
            pg_type = "numeric"
        elif col_type.startswith("varchar") or col_type == "text":
            pg_type = "text"
        elif col_type == "boolean":
            pg_type = "boolean"
        elif col_type == "date":
            pg_type = "date"
        elif col_type == "datetime":
            pg_type = "timestamp"
        else:
            pg_type = "text"  # Default to text for unknown types
        
        # Add column definition
        column_def = f'    "{col_name}" {pg_type}'
        column_defs.append(column_def)
    
    create_table_sql += ",\n".join(column_defs)
    create_table_sql += '\n);'
    
    # Add index creation statements
    create_table_sql += '\nCREATE INDEX IF NOT EXISTS idx_volkswagen_make_model ON "volkswagen" ("make", "model");'
    create_table_sql += '\nCREATE INDEX IF NOT EXISTS idx_volkswagen_year ON "volkswagen" ("year");'
    
    print("Connecting to Supabase...")
    supabase = get_supabase_client()
    
    # Execute the SQL in Supabase
    print("Creating volkswagen table in Supabase...")
    print(create_table_sql)
    
    try:
        # Most Supabase instances don't have the exec_sql RPC function by default
        # Instead, we'll create the table directly using the SQL Editor in the Supabase dashboard
        # This script will print the SQL for manual execution
        
        print("\n===== COPY AND EXECUTE THIS SQL IN SUPABASE SQL EDITOR =====")
        print(create_table_sql)
        print("=========================================================\n")
        
        proceed = input("Have you executed the SQL in Supabase? (y/n): ")
        if proceed.lower() == 'y':
            print("Volkswagen table created successfully!")
            return True
        else:
            print("Table creation cancelled.")
            return False
    
    except Exception as e:
        print(f"Error creating table: {str(e)}")
        return False
    
    finally:
        conn.close()

if __name__ == "__main__":
    if create_volkswagen_table():
        print("Now you can import data using:")
        print(".\env\Scripts\python.exe direct_supabase_import.py --tables volkswagen") 