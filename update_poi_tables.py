import sqlite3
import sys

def main():
    try:
        conn = sqlite3.connect('NiccDB.db')
        cursor = conn.cursor()

        # Rename existing POI table to backup
        cursor.execute("ALTER TABLE poi RENAME TO poi_backup")
        
        # Create new POI table with desired structure
        cursor.execute("""
        CREATE TABLE poi (
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
            notes TEXT,
            UNIQUE(system_type, hardware_name)
        )
        """)
        
        # Insert sample POI data based on the vehicle diagram
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
        
        # Insert POI data
        cursor.executemany("""
        INSERT INTO poi (position_number, position_name, location_description, system_type)
        VALUES (?, ?, ?, ?)
        """, sample_pois)
        
        # Insert sample systems hardware data
        sample_hardware = [
            ("Forward Camera", "Windshield Camera", "Front-facing camera for ADAS systems", "Various", "Multiple", "Usually mounted behind rearview mirror"),
            ("Radar/Camera", "Corner Radar", "Short/mid-range radar for cross traffic and blind spot", "Various", "Multiple", "Mounted in bumper corners"),
            ("Side Sensor", "Side Radar", "Side-mounted sensors for blind spot detection", "Various", "Multiple", "Mounted in side panels"),
            ("Parking Sensor", "Ultrasonic Sensor", "Short-range parking aid sensor", "Various", "Multiple", "Mounted in bumpers"),
            ("Forward Sensing", "Front Radar", "Long-range forward radar for ACC/FCW", "Various", "Multiple", "Mounted in front grille/bumper"),
            ("Backup Sensor", "Rear Ultrasonic", "Rear parking aid sensor", "Various", "Multiple", "Mounted in rear bumper"),
            ("Backup Camera", "Rear Camera", "Rear view camera for parking", "Various", "Multiple", "Mounted near license plate or handle"),
            ("Control Module", "ADAS Control Unit", "Central processing unit for ADAS systems", "Various", "Multiple", "Usually under dash or center console")
        ]
        
        # Insert systems hardware data
        cursor.executemany("""
        INSERT INTO systems_hardware (system_type, hardware_name, hardware_description, manufacturer, part_number, notes)
        VALUES (?, ?, ?, ?, ?, ?)
        """, sample_hardware)
        
        conn.commit()
        
        # Show the new tables' contents
        print("POI Table Contents:")
        cursor.execute("SELECT * FROM poi")
        for row in cursor.fetchall():
            print(row)
            
        print("\nSystems Hardware Table Contents:")
        cursor.execute("SELECT * FROM systems_hardware")
        for row in cursor.fetchall():
            print(row)

    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
    finally:
        if 'conn' in locals():
            conn.close()

if __name__ == "__main__":
    main() 