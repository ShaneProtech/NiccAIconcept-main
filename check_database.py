import sqlite3
import os

def check_database_structure():
    """Check the structure of the SQLite database and report findings."""
    db_path = 'NICCDB.db'
    
    if not os.path.exists(db_path):
        print(f"Database file {db_path} does not exist.")
        return
    
    print(f"Database file {db_path} exists. Size: {os.path.getsize(db_path) / (1024*1024):.2f} MB")
    
    try:
        conn = sqlite3.connect(db_path)
        cursor = conn.cursor()
        
        # Get all tables
        cursor.execute("SELECT name FROM sqlite_master WHERE type='table'")
        tables = cursor.fetchall()
        
        print(f"\nFound {len(tables)} tables in the database:")
        for i, table in enumerate(tables, 1):
            table_name = table[0]
            cursor.execute(f"SELECT COUNT(*) FROM '{table_name}'")
            row_count = cursor.fetchone()[0]
            print(f"{i}. {table_name}: {row_count} rows")
            
            # For volkswagen table, show sample data
            if table_name.lower() == 'volkswagen':
                print("\nSample data from volkswagen table:")
                cursor.execute(f"SELECT * FROM '{table_name}' LIMIT 2")
                rows = cursor.fetchall()
                
                # Get column names
                cursor.execute(f"PRAGMA table_info('{table_name}')")
                columns = [col[1] for col in cursor.fetchall()]
                print("Columns:", columns)
                
                # Print sample rows
                for row_num, row in enumerate(rows, 1):
                    print(f"Row {row_num}:")
                    for col_idx, value in enumerate(row):
                        if col_idx < len(columns):
                            print(f"  {columns[col_idx]}: {value}")
                
        conn.close()
        print("\nDatabase check complete.")
        
    except sqlite3.Error as e:
        print(f"SQLite error: {e}")
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    check_database_structure() 