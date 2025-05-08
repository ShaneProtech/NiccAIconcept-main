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

def get_table_data(conn, table_name, batch_size=1000):
    """Get data from a table in batches for INSERT statements"""
    cursor = conn.cursor()
    
    # Get the total count of rows in the table
    cursor.execute(f"SELECT COUNT(*) FROM {table_name}")
    total_rows = cursor.fetchone()[0]
    print(f"Table {table_name} has {total_rows} rows")
    
    # Get column names for this table
    cursor.execute(f"PRAGMA table_info({table_name})")
    columns = [row[1] for row in cursor.fetchall()]
    
    # Process the data in batches
    batches = []
    for offset in range(0, total_rows, batch_size):
        cursor.execute(f"SELECT * FROM {table_name} LIMIT {batch_size} OFFSET {offset}")
        rows = [dict(row) for row in cursor.fetchall()]
        batches.append(rows)
        print(f"  Processed batch {len(batches)}: {offset+1}-{min(offset+batch_size, total_rows)}")
    
    return columns, batches

def create_insert_sql(table_name, columns, data_batch):
    """Create SQL statements to insert data into a table"""
    if not data_batch:
        return ""
    
    # Quote column names to handle special characters
    quoted_columns = [f'"{col}"' for col in columns]
    
    # Generate the INSERT statements
    sql = f"INSERT INTO \"{table_name}\" ({', '.join(quoted_columns)}) VALUES\n"
    
    values_list = []
    for record in data_batch:
        row_values = []
        for col in columns:
            value = record.get(col)
            if value is None:
                row_values.append("NULL")
            elif isinstance(value, (int, float)):
                row_values.append(str(value))
            else:
                # Escape single quotes and format for SQL
                try:
                    # Replace single quotes with two single quotes (SQL standard)
                    value_str = str(value).replace("'", "''")
                    # Replace any problematic characters
                    value_str = value_str.replace('\\', '\\\\')
                except UnicodeEncodeError:
                    value_str = "Unicode text that couldn't be encoded"
                row_values.append(f"'{value_str}'")
        
        values_list.append(f"({', '.join(row_values)})")
    
    # Join all value sets with commas
    sql += ",\n".join(values_list)
    sql += ";\n"
    
    return sql

def generate_data_import_sql(output_dir="migration_sql"):
    """Generate SQL files for importing data to Supabase"""
    # Create output directory if it doesn't exist
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)
        print(f"Created directory: {output_dir}")
    
    # Connect to the SQLite database
    conn = get_sqlite_connection('NiccDB.db')
    
    # Get all tables
    all_tables = get_tables(conn)
    
    # Filter out system tables and tables we don't want to migrate
    tables_to_include = [t for t in all_tables if not t.startswith('sqlite_') and t not in [
        'master_vehicles'  # Exclude tables already created in Supabase
    ]]
    
    # Process each table
    for table_name in tables_to_include:
        output_file = f"{output_dir}/NiccDB_{table_name}_data.sql"
        print(f"Generating import SQL for {table_name}...")
        
        try:
            # Get column names and data batches
            columns, data_batches = get_table_data(conn, table_name)
            
            # Write the SQL file
            with open(output_file, 'w', encoding='utf-8') as f:
                f.write(f"-- Data import for {table_name} table\n")
                f.write(f"-- Generated on {datetime.datetime.now()}\n")
                f.write(f"-- Contains {sum(len(batch) for batch in data_batches)} records\n\n")
                
                # Write BEGIN/COMMIT for each batch
                for batch_index, batch in enumerate(data_batches):
                    f.write(f"-- Batch {batch_index + 1} of {len(data_batches)}\n")
                    f.write("BEGIN;\n")
                    f.write(create_insert_sql(table_name, columns, batch))
                    f.write("COMMIT;\n\n")
            
            print(f"  SQL import file created: {output_file}")
        except Exception as e:
            print(f"Error processing table {table_name}: {str(e)}")
    
    # Generate a master import script that references all the individual files
    master_file = f"{output_dir}/import_all_data.sql"
    with open(master_file, 'w', encoding='utf-8') as f:
        f.write(f"-- Master data import script for NiccDB\n")
        f.write(f"-- Generated on {datetime.datetime.now()}\n")
        f.write(f"-- This script will import data for all tables\n\n")
        
        f.write("-- NOTE: Run this script in sections if you encounter timeouts\n")
        f.write("-- For large tables, open and run the individual SQL files separately\n\n")
        
        # First add small tables directly
        small_tables = []
        for table_name in tables_to_include:
            cursor = conn.cursor()
            cursor.execute(f"SELECT COUNT(*) FROM {table_name}")
            row_count = cursor.fetchone()[0]
            
            # For tables with fewer than 50 rows, include the content directly
            if row_count < 50:
                small_tables.append(table_name)
                
                # Read the content from the individual file
                table_file = f"{output_dir}/NiccDB_{table_name}_data.sql"
                try:
                    with open(table_file, 'r', encoding='utf-8') as tf:
                        sql_content = tf.read()
                        
                        # Write the SQL directly to master file
                        f.write(f"-- Table: {table_name} ({row_count} rows)\n")
                        f.write("-- Small table - included directly\n")
                        f.write(sql_content)
                        f.write("\n\n")
                except Exception as e:
                    f.write(f"-- ERROR reading {table_file}: {str(e)}\n\n")
        
        # For larger tables, add a comment telling the user to run them separately
        large_tables = [t for t in tables_to_include if t not in small_tables]
        if large_tables:
            f.write("-- LARGER TABLES\n")
            f.write("-- For tables below, open and run the individual SQL files separately\n")
            f.write("-- Copy the content from each file into the Supabase SQL Editor\n\n")
            
            # Just list the larger tables with their sizes
            for table_name in large_tables:
                cursor = conn.cursor()
                cursor.execute(f"SELECT COUNT(*) FROM {table_name}")
                row_count = cursor.fetchone()[0]
                
                f.write(f"-- Table: {table_name} ({row_count} rows)\n")
                f.write(f"-- Run contents from: migration_sql/NiccDB_{table_name}_data.sql\n\n")
        
    print(f"Master import script created: {master_file}")
    
    # Clean up
    conn.close()
    
    print("\nData import SQL files generated successfully!")
    print(f"1. Individual table data files are in the '{output_dir}' directory")
    print(f"2. The master import script is '{master_file}'")
    print("\nTo import data:")
    print("1. Go to your Supabase dashboard")
    print("2. Navigate to the SQL Editor")
    print("3. You can either:")
    print("   a. Run each file individually for specific tables")
    print("   b. Run the master script to import all data")
    print("   c. For large tables, run each batch separately")

if __name__ == "__main__":
    generate_data_import_sql() 