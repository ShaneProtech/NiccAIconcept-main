import os
import sqlite3
import json
import time
import datetime

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

def get_table_data(conn, table_name, limit=1000):
    """Get data from a specific table with a limit"""
    cursor = conn.cursor()
    cursor.execute(f"SELECT * FROM {table_name} LIMIT {limit}")
    return [dict(row) for row in cursor.fetchall()]

def create_table_sql(table_name, schema):
    """Create a SQL statement to create a table in PostgreSQL"""
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
        col_def = f"\"{col_name}\" {pg_type}"
        if col_pk:
            col_def += " PRIMARY KEY"
        if not col_nullable:
            col_def += " NOT NULL"
        if col_default is not None:
            col_def += f" DEFAULT {col_default}"
            
        columns.append(col_def)
    
    # Generate the CREATE TABLE SQL statement
    sql = f"CREATE TABLE IF NOT EXISTS \"{table_name}\" (\n  "
    sql += ",\n  ".join(columns)
    sql += "\n);\n"
    
    return sql

def create_insert_sql(table_name, data):
    """Create SQL statements to insert data into a table"""
    if not data:
        return ""
    
    # Get column names from the first record
    columns = list(data[0].keys())
    quoted_columns = [f'"{col}"' for col in columns]
    
    # Generate the INSERT statements
    sql = ""
    for i, record in enumerate(data):
        values = []
        for col in columns:
            value = record.get(col)
            if value is None:
                values.append("NULL")
            elif isinstance(value, (int, float)):
                values.append(str(value))
            else:
                # Escape single quotes and properly format string values
                # Handle Unicode characters by replacing them if they cause issues
                try:
                    value_str = str(value).replace("'", "''")
                except UnicodeEncodeError:
                    # Replace problematic characters with a placeholder
                    value_str = "Unicode text that couldn't be encoded"
                values.append(f"'{value_str}'")
        
        sql += f"INSERT INTO \"{table_name}\" ({', '.join(quoted_columns)}) VALUES ({', '.join(values)});\n"
        
        # Add a commit every 100 records to avoid transaction timeouts
        if (i + 1) % 100 == 0:
            sql += "COMMIT;\n"
    
    return sql

def generate_migration_sql(db_name, output_dir, include_data=True, tables_to_include=None):
    """Generate SQL files for migrating a SQLite database to PostgreSQL"""
    # Create the output directory if it doesn't exist
    os.makedirs(output_dir, exist_ok=True)
    
    # Connect to the SQLite database
    conn = get_sqlite_connection(db_name)
    
    # Get all tables in the SQLite database
    all_tables = get_tables(conn)
    
    # Filter tables if a specific list is provided
    if tables_to_include:
        tables = [t for t in all_tables if t in tables_to_include]
    else:
        tables = all_tables
    
    print(f"Found {len(all_tables)} tables in {db_name}, processing {len(tables)} tables")
    
    # Create a file with all table creation statements
    schema_file = os.path.join(output_dir, f"{os.path.splitext(db_name)[0]}_schema.sql")
    with open(schema_file, 'w', encoding='utf-8') as f:
        f.write(f"-- Schema migration for {db_name}\n")
        f.write(f"-- Generated on {datetime.datetime.now()}\n\n")
        
        for table_name in tables:
            if table_name.startswith('sqlite_'):
                print(f"Skipping system table: {table_name}")
                continue
                
            print(f"Processing table schema: {table_name}")
            
            # Get the table schema
            schema = get_table_schema(conn, table_name)
            
            # Create the table creation SQL
            sql = create_table_sql(table_name, schema)
            f.write(f"-- Table: {table_name}\n")
            f.write(sql)
            f.write("\n")
    
    # If data should be included, create separate files for each table's data
    if include_data:
        for table_name in tables:
            if table_name.startswith('sqlite_'):
                continue
                
            print(f"Processing table data: {table_name}")
            
            # Get the table data
            data = get_table_data(conn, table_name)
            
            # Create a file for this table's data
            data_file = os.path.join(output_dir, f"{os.path.splitext(db_name)[0]}_{table_name}_data.sql")
            with open(data_file, 'w', encoding='utf-8') as f:
                f.write(f"-- Data migration for table {table_name} from {db_name}\n")
                f.write(f"-- Generated on {datetime.datetime.now()}\n")
                f.write(f"-- Contains {len(data)} records\n\n")
                
                # Insert statements
                f.write("BEGIN;\n")
                f.write(create_insert_sql(table_name, data))
                f.write("COMMIT;\n")
    
    conn.close()
    print(f"Migration SQL files generated in {output_dir}")

if __name__ == "__main__":
    # Create a directory for the migration files
    output_dir = "migration_sql"
    
    # Generate SQL for migrating essential vehicle tables from NiccDB.db
    generate_migration_sql('NiccDB.db', output_dir, tables_to_include=[
        'master_vehicles', 'honda', 'toyota', 'nissan', 'poi', 'systems_hardware'
    ])
    
    # Generate SQL for migrating chats.db
    generate_migration_sql('chats.db', output_dir)
    
    print("\nSQL files have been generated successfully!")
    print(f"To complete the migration:")
    print("1. Go to your Supabase dashboard")
    print("2. Navigate to the SQL Editor")
    print("3. First execute the `create_essential_tables.sql` file to set up the base structure")
    print("4. Execute the *_schema.sql files next to create any additional tables")
    print("5. Execute the *_data.sql files to import the data")
    print("6. If the data files are too large, you may need to execute them in chunks") 