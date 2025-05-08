import os
import pandas as pd
import sqlite3
from pathlib import Path
import re
import traceback

def sanitize_table_name(name):
    # Remove version numbers and other special characters
    name = re.sub(r'v\d+\.\d+', '', name)
    name = re.sub(r'[^a-zA-Z0-9_]', '_', name)
    return name.lower().strip('_')

def sanitize_column_name(name):
    # Convert to lowercase and replace spaces with underscores
    name = str(name).lower().replace(' ', '_')
    # Remove any special characters
    name = re.sub(r'[^a-z0-9_]', '', name)
    return name

def create_database():
    try:
        # Create database connection
        conn = sqlite3.connect('NiccDB.db')
        cursor = conn.cursor()

        # Process each Excel file
        excel_files = [f for f in os.listdir('.') if f.endswith('.xlsx') and 'Pre-Qual Long Sheet' in f]
        print(f"Found {len(excel_files)} Excel files to process")
        
        # First, collect all unique columns from all Excel files
        all_columns = set()
        for excel_file in excel_files:
            try:
                print(f"Reading columns from {excel_file}...")
                df = pd.read_excel(excel_file)
                all_columns.update([sanitize_column_name(col) for col in df.columns])
            except Exception as e:
                print(f"Error reading {excel_file}: {str(e)}")
                traceback.print_exc()
                continue
        
        print(f"Found {len(all_columns)} unique columns across all files")
        
        # Create master table with all possible columns
        master_columns = ['id INTEGER PRIMARY KEY AUTOINCREMENT']
        master_columns.extend([f"{col} TEXT" for col in sorted(all_columns)])
        master_columns.append('source_file TEXT')
        
        create_master_sql = f'''
        CREATE TABLE IF NOT EXISTS master_vehicles (
            {', '.join(master_columns)}
        )
        '''
        print("Creating master table...")
        cursor.execute(create_master_sql)

        # Create POI table
        cursor.execute('''
        CREATE TABLE IF NOT EXISTS poi (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            vehicle_id INTEGER,
            poi_type TEXT,
            poi_location TEXT,
            poi_description TEXT,
            calibration_required BOOLEAN,
            FOREIGN KEY (vehicle_id) REFERENCES master_vehicles(id)
        )
        ''')

        # Process each Excel file
        for excel_file in excel_files:
            try:
                # Extract make name and sanitize it
                make = excel_file.split(' Pre-Qual')[0]
                table_name = sanitize_table_name(make)
                
                # Read Excel file
                print(f"\nProcessing {make}...")
                df = pd.read_excel(excel_file)
                print(f"Read {len(df)} rows from {excel_file}")
                
                # Clean and standardize column names
                df.columns = [sanitize_column_name(col) for col in df.columns]
                
                # Add make column if not exists
                if 'make' not in df.columns:
                    df['make'] = make
                
                # Create make-specific table
                create_table_sql = f'''
                CREATE TABLE IF NOT EXISTS {table_name} (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    {', '.join(f"{sanitize_column_name(col)} TEXT" for col in df.columns if col != 'id')}
                )
                '''
                print(f"Creating table {table_name}...")
                cursor.execute(create_table_sql)
                
                # Convert all columns to string to avoid type issues
                for col in df.columns:
                    df[col] = df[col].astype(str)
                
                # Insert into make-specific table
                print(f"Inserting data into {table_name}...")
                df.to_sql(table_name, conn, if_exists='replace', index=False)
                
                # Add source file column and insert into master table
                df['source_file'] = excel_file
                print("Inserting data into master_vehicles...")
                df.to_sql('master_vehicles', conn, if_exists='append', index=False)
                
                print(f"Successfully processed {make}")
                
            except Exception as e:
                print(f"Error processing {make}: {str(e)}")
                traceback.print_exc()
                continue

        # Create indexes for better query performance
        print("\nCreating indexes...")
        cursor.execute('CREATE INDEX IF NOT EXISTS idx_master_make ON master_vehicles(make)')
        cursor.execute('CREATE INDEX IF NOT EXISTS idx_master_model ON master_vehicles(model)')
        cursor.execute('CREATE INDEX IF NOT EXISTS idx_master_year ON master_vehicles(year)')
        
        conn.commit()
        conn.close()
        print("\nDatabase creation completed successfully!")
        
    except Exception as e:
        print(f"Fatal error: {str(e)}")
        traceback.print_exc()
        if 'conn' in locals():
            conn.close()

if __name__ == "__main__":
    create_database() 