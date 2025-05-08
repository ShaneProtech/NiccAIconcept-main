import sqlite3
import json
from collections import OrderedDict

def get_table_info(cursor, table_name):
    cursor.execute(f"PRAGMA table_info({table_name})")
    return cursor.fetchall()

def get_sample_data(cursor, table_name, limit=1):
    try:
        cursor.execute(f"SELECT * FROM {table_name} LIMIT {limit}")
        return cursor.fetchall()
    except:
        return []

def main():
    try:
        conn = sqlite3.connect('NiccDB.db')
        cursor = conn.cursor()
        
        # Get all tables
        cursor.execute("SELECT name FROM sqlite_master WHERE type='table'")
        tables = cursor.fetchall()
        
        db_structure = OrderedDict()
        
        print("NiccDB Database Structure:")
        print("==========================")
        
        for table in tables:
            table_name = table[0]
            print(f"\n📋 Table: {table_name}")
            
            # Get column information
            columns = get_table_info(cursor, table_name)
            print("  Columns:")
            for col in columns:
                col_id, name, type_, notnull, default, pk = col
                constraints = []
                if pk: constraints.append("PRIMARY KEY")
                if notnull: constraints.append("NOT NULL")
                if default: constraints.append(f"DEFAULT {default}")
                constraints_str = f" ({', '.join(constraints)})" if constraints else ""
                print(f"    - {name} ({type_}){constraints_str}")
            
            # Get sample row
            sample = get_sample_data(cursor, table_name)
            if sample:
                print("  Sample Data:")
                for row in sample:
                    print(f"    {row}")
            
            # Get row count
            try:
                cursor.execute(f"SELECT COUNT(*) FROM {table_name}")
                count = cursor.fetchone()[0]
                print(f"  Total Rows: {count}")
            except:
                print("  Total Rows: Unable to count")

    except Exception as e:
        print(f"Error: {e}")
    finally:
        if 'conn' in locals():
            conn.close()

if __name__ == "__main__":
    main() 