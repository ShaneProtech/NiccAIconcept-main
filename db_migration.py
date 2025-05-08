import os
import sqlite3
import json
import time
from db_config import get_supabase_client

def get_sqlite_connection(db_name):
    """Get a connection to the SQLite database"""
    conn = sqlite3.connect(db_name)
    conn.row_factory = sqlite3.Row
    return conn

def get_tables(conn):
    """Get a list of all tables in the SQLite database"""
    cursor = conn.cursor()
    cursor.execute("SELECT name FROM sqlite_master WHERE type='table'")
    return [row[0] for row in cursor.fetchall()]

def get_table_schema(conn, table_name):
    """Get the schema for a specific table"""
    cursor = conn.cursor()
    cursor.execute(f"PRAGMA table_info({table_name})")
    return cursor.fetchall()

def get_table_data(conn, table_name):
    """Get all data from a specific table"""
    cursor = conn.cursor()
    cursor.execute(f"SELECT * FROM {table_name}")
    return [dict(row) for row in cursor.fetchall()]

def create_supabase_table(supabase, table_name, schema):
    """Create a table in Supabase based on SQLite schema"""
    # Map SQLite types to PostgreSQL types
    type_map = {
        'INTEGER': 'bigint',
        'REAL': 'float8',
        'TEXT': 'text',
        'BLOB': 'bytea',
        'NULL': 'text'
    }
    
    columns = []
    for col in schema:
        col_name = col[1]
        col_type = col[2]
        col_nullable = not col[3]  # NOT NULL flag
        col_default = col[4]
        col_pk = col[5]  # PRIMARY KEY flag
        
        # Map the SQLite type to PostgreSQL type
        pg_type = type_map.get(col_type.upper(), 'text')
        
        # Build the column definition
        col_def = f"{col_name} {pg_type}"
        if col_pk:
            col_def += " PRIMARY KEY"
        if not col_nullable:
            col_def += " NOT NULL"
        if col_default is not None:
            col_def += f" DEFAULT {col_default}"
            
        columns.append(col_def)
    
    # Generate the CREATE TABLE SQL statement
    sql = f"CREATE TABLE IF NOT EXISTS {table_name} (\n  "
    sql += ",\n  ".join(columns)
    sql += "\n);"
    
    print(f"SQL for creating {table_name}:")
    print(sql)
    print("\n")
    
    try:
        # Actually execute the SQL in Supabase using RPC
        response = supabase.rpc(
            "execute_sql", 
            {"sql": sql}
        ).execute()
        print(f"Table creation response: {response}")
        return True
    except Exception as e:
        print(f"Error creating table {table_name}: {str(e)}")
        
        # If RPC fails, try direct RESTful API
        try:
            print("Attempting to create table via REST API...")
            headers = {
                "apikey": os.environ.get("SUPABASE_KEY"),
                "Authorization": f"Bearer {os.environ.get('SUPABASE_KEY')}",
                "Content-Type": "application/json",
                "Prefer": "return=minimal"
            }
            
            import requests
            url = f"{os.environ.get('SUPABASE_URL')}/rest/v1/rpc/execute_sql"
            data = {"sql": sql}
            response = requests.post(url, headers=headers, json=data)
            
            if response.status_code == 200:
                print(f"Table {table_name} created successfully via REST API")
                return True
            else:
                print(f"Failed to create table via REST API: {response.status_code} - {response.text}")
                return False
        except Exception as rest_error:
            print(f"Error with REST API approach: {str(rest_error)}")
            return False

def migrate_table_data(supabase, table_name, data):
    """Migrate data from SQLite to Supabase"""
    batch_size = 100  # Insert data in batches for better performance
    
    total_rows = len(data)
    print(f"Migrating {total_rows} rows to {table_name} table")
    
    if total_rows == 0:
        print(f"No data to migrate for table {table_name}")
        return 0
    
    # Process in batches
    success_count = 0
    for i in range(0, total_rows, batch_size):
        batch = data[i:i+batch_size]
        print(f"Processing batch {i//batch_size + 1}/{(total_rows+batch_size-1)//batch_size}: {len(batch)} rows")
        
        try:
            # Actually insert the data into Supabase
            response = supabase.table(table_name).insert(batch).execute()
            batch_success = len(response.data) if hasattr(response, 'data') else 0
            success_count += batch_success
            print(f"Inserted {batch_success} rows successfully")
        except Exception as e:
            print(f"Error inserting batch into {table_name}: {str(e)}")
            
            # Try inserting records one by one
            print("Attempting to insert records one by one...")
            for record in batch:
                try:
                    response = supabase.table(table_name).insert(record).execute()
                    if hasattr(response, 'data') and response.data:
                        success_count += 1
                except Exception as single_error:
                    print(f"Error inserting single record: {str(single_error)}")
    
    print(f"Migration completed for {table_name}. Successfully migrated {success_count}/{total_rows} rows.")
    return success_count

def migrate_nicc_database():
    """Migrate the NICC database from SQLite to Supabase"""
    # Connect to the SQLite database
    sqlite_conn = get_sqlite_connection('NiccDB.db')
    
    # Get a Supabase client
    supabase = get_supabase_client()
    
    # Get all tables in the SQLite database
    tables = get_tables(sqlite_conn)
    print(f"Found {len(tables)} tables in NiccDB.db: {', '.join(tables)}")
    
    # For each table, create a corresponding table in Supabase and migrate the data
    for table_name in tables:
        if table_name.startswith('sqlite_'):
            print(f"Skipping system table: {table_name}")
            continue
            
        print(f"\nProcessing table: {table_name}")
        
        # Get the table schema
        schema = get_table_schema(sqlite_conn, table_name)
        
        # Create the table in Supabase
        create_supabase_table(supabase, table_name, schema)
        
        # Get the table data
        data = get_table_data(sqlite_conn, table_name)
        
        # Migrate the data to Supabase
        migrate_table_data(supabase, table_name, data)
    
    sqlite_conn.close()
    print("\nNiccDB migration completed successfully")

def migrate_chats_database():
    """Migrate the chats database from SQLite to Supabase"""
    # Connect to the SQLite database
    sqlite_conn = get_sqlite_connection('chats.db')
    
    # Get a Supabase client
    supabase = get_supabase_client()
    
    # Get all tables in the SQLite database
    tables = get_tables(sqlite_conn)
    print(f"Found {len(tables)} tables in chats.db: {', '.join(tables)}")
    
    # For each table, create a corresponding table in Supabase and migrate the data
    for table_name in tables:
        if table_name.startswith('sqlite_'):
            print(f"Skipping system table: {table_name}")
            continue
            
        print(f"\nProcessing table: {table_name}")
        
        # Get the table schema
        schema = get_table_schema(sqlite_conn, table_name)
        
        # Create the table in Supabase
        create_supabase_table(supabase, table_name, schema)
        
        # Get the table data
        data = get_table_data(sqlite_conn, table_name)
        
        # Migrate the data to Supabase
        migrate_table_data(supabase, table_name, data)
    
    sqlite_conn.close()
    print("\nChats migration completed successfully")

if __name__ == "__main__":
    # Before running this script, make sure to set SUPABASE_URL and SUPABASE_KEY
    # in your environment variables or .env file
    print("Starting database migration to Supabase...")
    
    # Migrate the NICC database
    migrate_nicc_database()
    
    # Migrate the chats database
    migrate_chats_database()
    
    print("Database migration completed successfully!") 