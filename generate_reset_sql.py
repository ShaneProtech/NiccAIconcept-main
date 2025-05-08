import os
import time
from dotenv import load_dotenv
from supabase import create_client

# Load environment variables
load_dotenv()

def get_supabase_client():
    """Get a connection to Supabase"""
    supabase_url = os.getenv("SUPABASE_URL")
    supabase_key = os.getenv("SUPABASE_KEY")
    
    if not supabase_url or not supabase_key:
        raise ValueError("SUPABASE_URL and SUPABASE_KEY must be set in .env file")
    
    return create_client(supabase_url, supabase_key)

def get_supabase_tables(supabase):
    """Get a list of all tables in the Supabase database"""
    try:
        # Try to get tables from information_schema
        response = supabase.from_("information_schema.tables").select("table_name") \
            .eq("table_schema", "public") \
            .execute()
            
        if response.data:
            return [row.get("table_name") for row in response.data]
        else:
            # If we can't get tables using the schema, use a list of known tables
            print("Could not retrieve tables from information_schema, using predefined list...")
            return [
                "chats", "messages", "master_vehicles", "volkswagen", "acura", "alfa_romeo",
                "audi", "bmw", "brightdrop", "buick", "cadillac", "chevrolet", "chrysler",
                "dodge", "fiat", "ford", "genesis", "gmc", "honda", "hyundai", "infiniti",
                "jaguar", "jeep", "kia", "land_rover", "lexus", "lincoln", "mazda", "mercedes",
                "mini", "mitsubishi", "nissan", "porsche", "ram", "rolls_royce", "subaru",
                "toyota", "volvo", "poi", "systems_hardware"
            ]
    except Exception as e:
        print(f"Error getting tables from Supabase: {e}")
        print("Using predefined list of tables instead...")
        return [
            "chats", "messages", "master_vehicles", "volkswagen", "acura", "alfa_romeo",
            "audi", "bmw", "brightdrop", "buick", "cadillac", "chevrolet", "chrysler",
            "dodge", "fiat", "ford", "genesis", "gmc", "honda", "hyundai", "infiniti",
            "jaguar", "jeep", "kia", "land_rover", "lexus", "lincoln", "mazda", "mercedes",
            "mini", "mitsubishi", "nissan", "porsche", "ram", "rolls_royce", "subaru",
            "toyota", "volvo", "poi", "systems_hardware"
        ]

def generate_reset_sql():
    """Generate SQL statements to reset all Supabase tables"""
    print("Generating SQL statements to reset Supabase tables...")
    
    try:
        # Connect to Supabase
        supabase = get_supabase_client()
        
        # Get all tables
        tables = get_supabase_tables(supabase)
        
        if not tables:
            print("No tables found in Supabase database.")
            return
        
        print(f"Found {len(tables)} tables in Supabase")
        
        # Create SQL statements to delete all data from tables
        sql_statements = []
        
        # Add transaction markers
        sql_statements.append("-- SQL to reset all data in Supabase tables")
        sql_statements.append(f"-- Generated on {time.strftime('%Y-%m-%d %H:%M:%S')}")
        sql_statements.append("-- WARNING: This will delete ALL data from these tables!")
        sql_statements.append("")
        sql_statements.append("BEGIN;")
        sql_statements.append("")
        
        # First add statements for tables with foreign key dependencies
        child_tables = [t for t in tables if t in ["messages"]]
        parent_tables = [t for t in tables if t not in child_tables]
        
        # Add child tables first
        if child_tables:
            sql_statements.append("-- First delete from tables with foreign key dependencies")
            for table in child_tables:
                sql_statements.append(f'DELETE FROM "{table}";')
            sql_statements.append("")
        
        # Then parent tables
        if parent_tables:
            sql_statements.append("-- Then delete from parent tables")
            for table in parent_tables:
                sql_statements.append(f'DELETE FROM "{table}";')
            sql_statements.append("")
        
        # Commit transaction
        sql_statements.append("COMMIT;")
        
        # Write statements to file
        sql_file = "reset_supabase_tables.sql"
        with open(sql_file, "w") as f:
            f.write("\n".join(sql_statements))
        
        print(f"SQL statements written to {sql_file}")
        print("\nTo use this SQL:")
        print("1. Log in to your Supabase dashboard")
        print("2. Go to the SQL Editor")
        print("3. Copy and paste the contents of the SQL file")
        print("4. Review carefully, then execute")
        print("\nAfter resetting the data, you can run the import script:")
        print("python direct_supabase_import.py")
        
    except Exception as e:
        print(f"Error generating SQL: {e}")

if __name__ == "__main__":
    generate_reset_sql() 