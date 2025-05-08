import os
import sqlite3
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

def get_sample_data(conn, table_name, limit=5):
    """Get a sample of data from a table for INSERT statements"""
    cursor = conn.cursor()
    cursor.execute(f"SELECT * FROM {table_name} LIMIT {limit}")
    return [dict(row) for row in cursor.fetchall()]

def create_insert_sql(table_name, data):
    """Create SQL statements to insert sample data into a table"""
    if not data:
        return ""
    
    # Get column names from the first record
    columns = list(data[0].keys())
    quoted_columns = [f'"{col}"' for col in columns]
    
    # Generate the INSERT statements
    sql = ""
    for record in data:
        values = []
        for col in columns:
            value = record.get(col)
            if value is None:
                values.append("NULL")
            elif isinstance(value, (int, float)):
                values.append(str(value))
            else:
                # Escape single quotes and properly format string values
                try:
                    value_str = str(value).replace("'", "''")
                except UnicodeEncodeError:
                    # Replace problematic characters with a placeholder
                    value_str = "Unicode text that couldn't be encoded"
                values.append(f"'{value_str}'")
        
        sql += f"INSERT INTO \"{table_name}\" ({', '.join(quoted_columns)}) VALUES ({', '.join(values)});\n"
    
    return sql

def create_index_sql(table_name, schema):
    """Create SQL statements to add indexes to the tables"""
    # Check if make, model, and year columns exist in the schema
    column_names = [col[1].lower() for col in schema]
    
    indexes = []
    
    # Only create make/model index if both columns exist
    if 'make' in column_names and 'model' in column_names:
        indexes.append(f'CREATE INDEX IF NOT EXISTS idx_{table_name}_make_model ON "{table_name}" ("make", "model");')
    
    # Only create year index if the column exists
    if 'year' in column_names:
        indexes.append(f'CREATE INDEX IF NOT EXISTS idx_{table_name}_year ON "{table_name}" ("year");')
    
    # If no standard indexes could be created, create an index on the primary key if it exists
    if not indexes:
        for col in schema:
            # Check if column is primary key
            if col[5] == 1:  # PRIMARY KEY flag
                indexes.append(f'CREATE INDEX IF NOT EXISTS idx_{table_name}_{col[1]} ON "{table_name}" ("{col[1]}");')
                break
    
    return "\n".join(indexes)

def generate_simplified_migration(conn, tables_to_include, output_file="simplified_migration.sql"):
    """Generate a simplified migration SQL file with just the most common makes"""
    # Common vehicle makes to include
    common_makes = ['honda', 'toyota', 'nissan', 'ford', 'chevrolet', 'gmc', 'jeep', 'dodge', 'bmw', 'mercedes']
    simplified_tables = [t for t in tables_to_include if t in common_makes]
    
    print(f"Generating simplified SQL for {len(simplified_tables)} tables...")
    
    # Create the simplified SQL file
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(f"-- Simplified migration for most common vehicle makes\n")
        f.write(f"-- Generated on {datetime.datetime.now()}\n\n")
        
        # Write all CREATE TABLE statements
        f.write("-- Table creation statements\n")
        f.write("BEGIN;\n\n")
        
        for table_name in simplified_tables:
            print(f"Processing simplified table schema: {table_name}")
            
            # Get the table schema
            schema = get_table_schema(conn, table_name)
            
            # Create the table creation SQL
            sql = create_table_sql(table_name, schema)
            f.write(f"-- Table: {table_name}\n")
            f.write(sql)
            f.write("\n")
            
            # Add indexes
            f.write(create_index_sql(table_name, schema))
            f.write("\n")
        
        f.write("COMMIT;\n\n")
        
        # Add instruction on how to bulk import data
        f.write("-- INSTRUCTIONS FOR DATA IMPORT\n")
        f.write("-- To import data for these tables, use the corresponding data SQL files.\n")
        f.write("-- For example, to import all honda data:\n")
        f.write("-- Run the SQL commands in the file: 'migration_sql/NiccDB_honda_data.sql'\n")
    
    print(f"Simplified migration SQL generated in {output_file}")

def generate_full_migration_sql(output_file="full_migration.sql"):
    """Generate a consolidated SQL file for full migration to Supabase"""
    # Connect to the SQLite database
    conn = get_sqlite_connection('NiccDB.db')
    
    # Get all tables in the SQLite database
    all_tables = get_tables(conn)
    
    # Filter out system tables and tables that have already been created in Supabase
    tables_to_include = [t for t in all_tables if not t.startswith('sqlite_') and t not in [
        'master_vehicles'  # Exclude tables already created
    ]]
    
    print(f"Generating SQL for {len(tables_to_include)} tables...")
    
    # Create a consolidated SQL file
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(f"-- Full migration for NiccDB.db vehicle tables\n")
        f.write(f"-- Generated on {datetime.datetime.now()}\n\n")
        
        # First, write all CREATE TABLE statements
        f.write("-- Table creation statements\n")
        f.write("BEGIN;\n\n")
        
        for table_name in tables_to_include:
            print(f"Processing table schema: {table_name}")
            
            # Get the table schema
            schema = get_table_schema(conn, table_name)
            
            # Create the table creation SQL
            sql = create_table_sql(table_name, schema)
            f.write(f"-- Table: {table_name}\n")
            f.write(sql)
            f.write("\n")
            
            # Add indexes
            f.write(create_index_sql(table_name, schema))
            f.write("\n")
        
        f.write("COMMIT;\n\n")
        
        # Then, write sample INSERT statements for each table
        f.write("-- Sample data insertion statements\n")
        f.write("-- Note: These are only sample records. For full data import, use the individual SQL files.\n")
        f.write("BEGIN;\n\n")
        
        for table_name in tables_to_include:
            print(f"Processing sample data: {table_name}")
            
            # Get sample data
            data = get_sample_data(conn, table_name)
            
            if data:
                f.write(f"-- Sample data for table: {table_name}\n")
                f.write(create_insert_sql(table_name, data))
                f.write("\n")
        
        f.write("COMMIT;\n\n")
        
        # Add instruction on how to bulk import data
        f.write("-- INSTRUCTIONS FOR FULL DATA IMPORT\n")
        f.write("-- To import all data for a specific table, use the corresponding data SQL file.\n")
        f.write("-- For example, to import all honda data:\n")
        f.write("-- Run the SQL commands in the file: 'migration_sql/NiccDB_honda_data.sql'\n\n")
        
        # Add a note about how to handle large data sets
        f.write("-- NOTE: For large tables, you may need to split the data import into batches\n")
        f.write("-- to avoid timeouts or memory issues in the SQL Editor.\n")
    
    print(f"Full migration SQL generated in {output_file}")
    
    # Generate a simplified version
    generate_simplified_migration(conn, tables_to_include)
    
    conn.close()

if __name__ == "__main__":
    generate_full_migration_sql()
    print("\nMigration SQL files have been generated!")
    print("\nTo complete the full migration:")
    print("1. Go to your Supabase dashboard")
    print("2. Navigate to the SQL Editor")
    print("3. For a complete migration, execute the 'full_migration.sql' file")
    print("4. For a simplified migration with common makes, execute 'simplified_migration.sql'")
    print("5. For specific makes, use the individual SQL files in 'migration_sql' directory") 