import sqlite3
import pandas as pd

def check_database():
    # Connect to the database
    conn = sqlite3.connect('NiccDB.db')
    cursor = conn.cursor()
    
    # Get list of tables
    cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
    tables = cursor.fetchall()
    
    print("Tables in the database:")
    for table in tables:
        print(f"\n{table[0]}:")
        # Get table schema
        cursor.execute(f"PRAGMA table_info({table[0]});")
        columns = cursor.fetchall()
        print("Columns:")
        for col in columns:
            print(f"  - {col[1]} ({col[2]})")
        
        # Get row count
        cursor.execute(f"SELECT COUNT(*) FROM {table[0]};")
        count = cursor.fetchone()[0]
        print(f"Number of rows: {count}")
    
    conn.close()

if __name__ == "__main__":
    check_database() 