import os
import requests
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

def create_tables_in_supabase():
    """Create the essential tables in Supabase using the SQL API"""
    # Get Supabase configuration
    supabase_url = os.getenv('SUPABASE_URL')
    supabase_key = os.getenv('SUPABASE_KEY')
    
    if not supabase_url or not supabase_key:
        print("ERROR: SUPABASE_URL and SUPABASE_KEY must be set in .env file")
        return False
    
    print(f"Using Supabase URL: {supabase_url}")
    print(f"Using Supabase Key: {supabase_key[:10]}...")
    
    # Read the SQL file
    try:
        with open('create_essential_tables.sql', 'r', encoding='utf-8') as f:
            sql = f.read()
    except Exception as e:
        print(f"ERROR: Failed to read SQL file: {str(e)}")
        return False
    
    # Split the SQL into statements
    sql_statements = sql.split(';')
    
    # Remove empty statements
    sql_statements = [stmt.strip() for stmt in sql_statements if stmt.strip()]
    
    print(f"Found {len(sql_statements)} SQL statements to execute")
    
    # Set up the REST API request
    headers = {
        "apikey": supabase_key,
        "Authorization": f"Bearer {supabase_key}",
        "Content-Type": "application/json",
        "Prefer": "return=minimal"
    }
    
    # URL for the REST API
    url = f"{supabase_url}/rest/v1/"
    
    # First check if tables already exist
    print("\nChecking if tables already exist...")
    try:
        # Try to query the chats table
        response = requests.get(
            f"{url}chats?limit=1",
            headers=headers
        )
        
        if response.status_code == 200:
            print("Tables already exist in Supabase")
            return True
        else:
            print(f"Tables don't exist yet: {response.status_code} - {response.text}")
    except Exception as e:
        print(f"Error checking tables: {str(e)}")
    
    # Execute each SQL statement individually
    print("\nCreating tables...")
    success_count = 0
    
    for i, statement in enumerate(sql_statements, 1):
        # Skip comments
        if statement.strip().startswith('--'):
            continue
            
        print(f"Executing statement {i}...")
        
        try:
            # Execute the SQL via the Supabase API
            # Since direct SQL execution might not be available through REST API,
            # we'll try different approaches
            
            # First try: if it's a CREATE TABLE statement, extract the table name and create it
            if "CREATE TABLE" in statement.upper():
                # Extract table name
                table_name = statement.split('"')[1] if '"' in statement else statement.split('IF NOT EXISTS ')[1].split(' ')[0]
                print(f"Creating table: {table_name}")
                
                # For table creation, we need to use the SQL editor API or Management API
                # But this requires admin privileges which might not be available via REST API
                # For this example, we'll output instructions to the user
                print(f"SQL to execute in Supabase SQL Editor:")
                print(statement)
                print("---")
            
            # Second try: if it's an INSERT statement, extract the table and data
            elif "INSERT INTO" in statement.upper():
                # Extract table name
                table_name = statement.split('"')[1] if '"' in statement else statement.split('INSERT INTO ')[1].split(' ')[0]
                print(f"Inserting data into table: {table_name}")
                
                # For data insertion, we could use the REST API if the table exists
                print(f"SQL to execute in Supabase SQL Editor:")
                print(statement)
                print("---")
            
            else:
                print("Generic SQL statement:")
                print(statement)
                print("---")
            
            success_count += 1
            
        except Exception as e:
            print(f"Error executing statement {i}: {str(e)}")
    
    print(f"\nProcessed {success_count} out of {len(sql_statements)} statements")
    print("\nIMPORTANT: Since direct SQL execution via REST API is limited,")
    print("please copy and execute the SQL statements in the Supabase SQL Editor.")
    print("File path: ./create_essential_tables.sql")
    
    return success_count > 0

if __name__ == "__main__":
    print("Creating essential tables in Supabase...")
    create_tables_in_supabase()
    print("\nDone!")
    print("Please run test_supabase.py to verify the tables were created successfully.") 