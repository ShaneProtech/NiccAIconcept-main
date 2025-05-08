import sqlite3
import sys

def main():
    try:
        # Connect to the database
        conn = sqlite3.connect('NiccDB.db')
        cursor = conn.cursor()
        
        # Get table list
        cursor.execute("SELECT name FROM sqlite_master WHERE type='table'")
        tables = cursor.fetchall()
        print("Tables in database:")
        for table in tables:
            print(f"- {table[0]}")
            
        # Get count from master_vehicles
        cursor.execute("SELECT COUNT(*) FROM master_vehicles")
        count = cursor.fetchone()[0]
        print(f"\nTotal entries in master_vehicles: {count}")
        
        # Get column information
        cursor.execute("PRAGMA table_info(master_vehicles)")
        columns = cursor.fetchall()
        print("\nColumns in master_vehicles:")
        for col in columns:
            print(f"- {col[1]} ({col[2]})")
            
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
    finally:
        if 'conn' in locals():
            conn.close()

if __name__ == "__main__":
    main() 