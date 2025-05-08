import sqlite3
import sys

def main():
    try:
        conn = sqlite3.connect('NiccDB.db')
        cursor = conn.cursor()

        # First check if POI table exists and its structure
        cursor.execute("SELECT sql FROM sqlite_master WHERE type='table' AND name='poi'")
        current_schema = cursor.fetchone()
        
        if current_schema:
            print("Current POI table schema:")
            print(current_schema[0])
            
            # Show sample data if any exists
            cursor.execute("SELECT * FROM poi LIMIT 5")
            rows = cursor.fetchall()
            if rows:
                print("\nSample POI data:")
                for row in rows:
                    print(row)
        else:
            print("POI table does not exist yet")
            
            # Create new POI table
            cursor.execute("""
            CREATE TABLE IF NOT EXISTS poi (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                position_number INTEGER NOT NULL,
                position_name TEXT NOT NULL,
                location_description TEXT NOT NULL,
                system_type TEXT NOT NULL,
                notes TEXT
            )
            """)
            
            # Create systems_hardware table
            cursor.execute("""
            CREATE TABLE IF NOT EXISTS systems_hardware (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                system_type TEXT NOT NULL,
                hardware_name TEXT NOT NULL,
                hardware_description TEXT,
                manufacturer TEXT,
                part_number TEXT,
                notes TEXT
            )
            """)
            
            # Insert sample POI data
            sample_pois = [
                (1, "Front Left Corner", "Located at front left corner of vehicle", "Radar/Camera"),
                (2, "Front Left Side", "Located on left front door/fender area", "Side Sensor"),
                (3, "Rear Left Side", "Located on left rear door/quarter panel", "Side Sensor"),
                (4, "Rear Left Corner", "Located at rear left corner", "Parking Sensor"),
                (5, "Front Center", "Located in front grille/bumper center", "Forward Sensing"),
                (6, "Front Right Corner", "Located at front right corner", "Radar/Camera"),
                (7, "Front Right Side", "Located on right front door/fender area", "Side Sensor"),
                (8, "Rear Right Side", "Located on right rear door/quarter panel", "Side Sensor"),
                (9, "Rear Right Corner", "Located at rear right corner", "Parking Sensor"),
                (10, "Windshield", "Located on windshield, typically behind rearview mirror", "Forward Camera"),
                (11, "Rear Center", "Located in rear bumper center", "Backup Sensor"),
                (12, "Trunk/Liftgate", "Located on trunk or liftgate", "Backup Camera"),
                (13, "Center Console", "Located in vehicle interior center console", "Control Module")
            ]
            
            cursor.executemany("""
            INSERT INTO poi (position_number, position_name, location_description, system_type)
            VALUES (?, ?, ?, ?)
            """, sample_pois)
            
            conn.commit()
            print("Created new POI table with sample data")

    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
    finally:
        if 'conn' in locals():
            conn.close()

if __name__ == "__main__":
    main() 