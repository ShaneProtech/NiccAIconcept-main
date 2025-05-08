"""
Test script to verify Supabase connection and query functionality
"""

import os
from dotenv import load_dotenv
from supabase import create_client
from db_supabase import SupabaseHelper

# Load environment variables
load_dotenv()

def main():
    """Main function to test Supabase connection"""
    print("Testing Supabase connection...")
    
    # Get Supabase credentials
    supabase_url = os.getenv('SUPABASE_URL')
    supabase_key = os.getenv('SUPABASE_KEY')
    
    print(f"Supabase URL: {supabase_url}")
    print(f"Supabase Key: {supabase_key[:10]}...")
    
    if not supabase_url or not supabase_key:
        print("ERROR: Supabase credentials are not set properly in .env file")
        return
    
    # Test direct connection to Supabase
    try:
        print("\nTesting direct Supabase connection...")
        supabase = create_client(supabase_url, supabase_key)
        print("Direct connection successful")
        
        # Try a simple query
        response = supabase.table('chats').select('count', count='exact').limit(1).execute()
        print(f"Query executed successfully. Count: {response.count if hasattr(response, 'count') else 'N/A'}")
    except Exception as e:
        print(f"ERROR connecting directly to Supabase: {str(e)}")
    
    # Test using SupabaseHelper
    try:
        print("\nTesting SupabaseHelper connection...")
        helper = SupabaseHelper()
        print(f"SupabaseHelper initialized, use_supabase={helper.use_supabase}")
        
        # Test vehicle query
        print("\nTesting vehicle query...")
        # Test with different makes/models
        test_queries = [
            {"make": "Hyundai", "model": "Tucson", "year": "2017"},
            {"make": "Toyota", "model": "Camry", "year": "2020"},
            {"make": "Honda", "model": "Accord", "year": "2019"}
        ]
        
        for query in test_queries:
            print(f"\nQuerying: {query['make']} {query['model']} {query['year']}")
            try:
                result = helper.query_vehicle_database(
                    make=query['make'], 
                    model=query['model'], 
                    year=query['year']
                )
                
                print(f"Query result: {result['found']}")
                if result['found']:
                    print(f"Found {len(result['data'])} records")
                    # Print first record for debugging
                    if result['data']:
                        print("First record keys:", list(result['data'][0].keys()))
                else:
                    print("No data found")
            except Exception as e:
                print(f"Error in query: {str(e)}")
        
        # Test table existence
        print("\nTesting table existence...")
        tables_to_check = ["hyundai", "toyota", "honda", "master_vehicles"]
        
        for table in tables_to_check:
            try:
                response = helper.supabase.table(table).select('count', count='exact').limit(1).execute()
                count = response.count if hasattr(response, 'count') else 'unknown'
                print(f"Table {table}: exists, count={count}")
            except Exception as e:
                print(f"Table {table}: error - {str(e)}")
    
    except Exception as e:
        print(f"ERROR testing SupabaseHelper: {str(e)}")

if __name__ == "__main__":
    main() 