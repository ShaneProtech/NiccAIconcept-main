import pandas as pd
import sqlite3
import os
from datetime import datetime

def import_volkswagen_to_sqlite():
    """Import Volkswagen data from Excel file to SQLite database"""
    print(f"Starting Volkswagen import at {datetime.now()}")
    
    # Excel file path
    excel_file = "longsheets/Volkswagen Pre-Quals Long Sheet v7.1.xlsx"
    
    if not os.path.exists(excel_file):
        print(f"Error: File not found: {excel_file}")
        return False
    
    # Connect to SQLite database
    conn = sqlite3.connect('NiccDB.db')
    cursor = conn.cursor()
    
    try:
        # Read Excel file into pandas DataFrame
        print(f"Reading Excel file: {excel_file}")
        df = pd.read_excel(excel_file)
        
        # Clean column names (remove spaces, special chars)
        df.columns = [col.lower().replace(' ', '_').replace('-', '_').replace('(', '').replace(')', '') 
                     for col in df.columns]
        
        # Check if volkswagen table exists
        cursor.execute("SELECT name FROM sqlite_master WHERE type='table' AND name='volkswagen'")
        table_exists = cursor.fetchone() is not None
        
        if table_exists:
            # Ask for confirmation to overwrite
            response = input("Table 'volkswagen' already exists. Overwrite? (y/n): ")
            if response.lower() != 'y':
                print("Import cancelled.")
                return False
            
            # Drop the existing table
            print("Dropping existing volkswagen table")
            cursor.execute("DROP TABLE IF EXISTS volkswagen")
            conn.commit()
        
        # Create the volkswagen table schema
        # Get schema from another similar table (e.g., honda or toyota)
        print("Creating new volkswagen table")
        cursor.execute("PRAGMA table_info(honda)")
        columns_info = cursor.fetchall()
        
        if not columns_info:
            print("Error: Could not get schema from honda table")
            return False
        
        # Generate CREATE TABLE statement from honda schema
        create_table_sql = "CREATE TABLE volkswagen (\n"
        column_defs = []
        
        for col_info in columns_info:
            col_name = col_info[1]  # Column name
            col_type = col_info[2]  # Column type
            col_notnull = "NOT NULL" if col_info[3] == 1 else ""
            col_default = f"DEFAULT {col_info[4]}" if col_info[4] is not None else ""
            
            column_def = f"    {col_name} {col_type} {col_notnull} {col_default}".strip()
            column_defs.append(column_def)
        
        create_table_sql += ",\n".join(column_defs)
        create_table_sql += "\n)"
        
        # Create the table
        cursor.execute(create_table_sql)
        conn.commit()
        
        # List of known columns in the honda table
        cursor.execute("PRAGMA table_info(honda)")
        honda_columns = [col_info[1] for col_info in cursor.fetchall()]
        
        # Filter DataFrame to only include columns that exist in the honda table
        common_columns = [col for col in df.columns if col in honda_columns]
        
        # Add any missing required columns with default values
        for col in honda_columns:
            if col not in df.columns:
                if col in ['make']:
                    df[col] = 'Volkswagen'
                else:
                    df[col] = None
        
        # Select only the columns that exist in the honda table
        df_to_import = df[honda_columns]
        
        # Convert DataFrame to list of tuples for SQLite
        records = df_to_import.to_dict('records')
        
        # Insert data into the table
        print(f"Inserting {len(records)} Volkswagen records")
        
        # Generate placeholders for the prepared statement
        placeholders = ', '.join(['?'] * len(honda_columns))
        insert_sql = f"INSERT INTO volkswagen ({', '.join(honda_columns)}) VALUES ({placeholders})"
        
        # Execute the insert
        for record in records:
            values = [record.get(col) for col in honda_columns]
            cursor.execute(insert_sql, values)
        
        # Commit the changes
        conn.commit()
        
        # Verify the import
        cursor.execute("SELECT COUNT(*) FROM volkswagen")
        count = cursor.fetchone()[0]
        print(f"Successfully imported {count} Volkswagen records")
        
        # Create indices
        print("Creating indices on the volkswagen table")
        cursor.execute("CREATE INDEX IF NOT EXISTS idx_volkswagen_make_model ON volkswagen (make, model)")
        cursor.execute("CREATE INDEX IF NOT EXISTS idx_volkswagen_year ON volkswagen (year)")
        conn.commit()
        
        return True
    
    except Exception as e:
        print(f"Error importing Volkswagen data: {str(e)}")
        return False
    
    finally:
        conn.close()
        print(f"Volkswagen import completed at {datetime.now()}")

if __name__ == "__main__":
    if import_volkswagen_to_sqlite():
        print("Now you can import the Volkswagen table to Supabase using:")
        print(".\env\Scripts\python.exe direct_supabase_import.py --tables volkswagen") 