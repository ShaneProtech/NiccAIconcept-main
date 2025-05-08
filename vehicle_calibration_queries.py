import sqlite3
import textwrap

def print_results(results, header=None):
    if header:
        print("\n" + "="*80)
        print(header)
        print("="*80)
    
    if not results:
        print("No results found")
        return
        
    for row in results:
        print("\n" + "-"*80)
        for i, value in enumerate(row):
            if value and str(value).lower() not in ['nan', 'none', 'null']:
                print(f"{header.split(',')[i] if header else f'Column {i}'}: {value}")

def execute_query(cursor, query, params=None):
    try:
        if params:
            return cursor.execute(query, params).fetchall()
        return cursor.execute(query).fetchall()
    except sqlite3.Error as e:
        print(f"Database error: {e}")
        return []
    except Exception as e:
        print(f"Error executing query: {e}")
        return []

def main():
    try:
        conn = sqlite3.connect('NiccDB.db')
        cursor = conn.cursor()

        # Example 1: Get all calibration requirements for a 2023 Toyota RAV4
        query1 = """
        SELECT year, make, model, 
               parent_component,
               calibration_type,
               parts_code_table_value,
               calibration_prerequisites_short_hand,
               autel_target__part_number
        FROM toyota
        WHERE year = '2023' 
        AND model = 'RAV4'
        AND parent_component IS NOT NULL
        AND calibration_type IS NOT NULL
        AND calibration_type != 'nan'
        AND parts_code_table_value != 'No Calibration Required'
        """
        print_results(execute_query(cursor, query1),
        "Year,Make,Model,Component,Calibration Type,Calibration Required,Prerequisites,Hardware Required")

        # Example 2: Get specific ADAS system calibration for a 2023 Lexus RX
        query2 = """
        SELECT year, make, model,
               parent_component,
               calibration_type,
               parts_code_table_value,
               calibration_prerequisites_short_hand,
               autel_target__part_number,
               additional_recommended_calibrations
        FROM lexus
        WHERE year = '2023'
        AND model = 'RX'
        AND parent_component = 'Windshield Camera'
        AND calibration_type IS NOT NULL
        AND calibration_type != 'nan'
        """
        print_results(execute_query(cursor, query2),
        "Year,Make,Model,Component,Calibration Type,Calibration Required,Prerequisites,Hardware,Additional Calibrations")

        # Example 3: Find all systems requiring static calibration for a specific vehicle
        query3 = """
        SELECT year, make, model,
               parent_component,
               calibration_type,
               parts_code_table_value,
               point_of_impact_,
               calibration_prerequisites_short_hand
        FROM master_vehicles
        WHERE make = 'Honda'
        AND model = 'ACCORD'
        AND year = '2023'
        AND calibration_type = 'Static'
        """
        print_results(execute_query(cursor, query3),
        "Year,Make,Model,Component,Calibration Type,Calibration Required,Impact Points,Prerequisites")

        # Example 4: Get comprehensive calibration requirements including hardware and prerequisites
        query4 = """
        SELECT m.year, m.make, m.model,
               m.parent_component,
               m.calibration_type,
               m.parts_code_table_value,
               m.calibration_prerequisites,
               m.autel_target__part_number,
               m.additional_recommended_calibrations,
               m.service_information_hyperlink
        FROM master_vehicles m
        WHERE m.year = '2023'
        AND m.make = 'Toyota'
        AND m.model = 'Camry'
        AND m.calibration_type IS NOT NULL
        AND m.calibration_type != 'nan'
        AND m.parts_code_table_value != 'No Calibration Required'
        """
        print_results(execute_query(cursor, query4),
        "Year,Make,Model,Component,Calibration Type,Calibration Required,Prerequisites,Hardware,Additional Calibrations,Service Info")

    except Exception as e:
        print(f"Error: {e}")
    finally:
        if 'conn' in locals():
            conn.close()

if __name__ == "__main__":
    main() 