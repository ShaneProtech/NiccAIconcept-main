import requests
import json
import sqlite3
import time
import os

def print_section(title):
    """Print a section title with formatting"""
    print("\n" + "=" * 80)
    print(f" {title} ".center(80, "="))
    print("=" * 80)

def check_sqlite_db():
    """Check the chats.db SQLite database"""
    print_section("SQLite Database Check")
    
    try:
        if not os.path.exists('chats.db'):
            print("ERROR: chats.db file does not exist!")
            return
            
        print(f"chats.db exists: {os.path.getsize('chats.db')} bytes")
        
        # Connect to the database
        conn = sqlite3.connect('chats.db')
        conn.row_factory = sqlite3.Row
        cursor = conn.cursor()
        
        # Get tables in the database
        cursor.execute("SELECT name FROM sqlite_master WHERE type='table'")
        tables = [row[0] for row in cursor.fetchall()]
        print(f"Tables in chats.db: {tables}")
        
        # Check chats table
        if 'chats' in tables:
            # Get column info
            cursor.execute("PRAGMA table_info(chats)")
            columns = [row[1] for row in cursor.fetchall()]
            print(f"Columns in chats table: {columns}")
            
            # Get all chats
            cursor.execute("SELECT * FROM chats")
            chats = [dict(row) for row in cursor.fetchall()]
            
            print(f"Found {len(chats)} chats in the database")
            
            # Display all chats
            for chat in chats:
                print(f"  Chat ID: {chat.get('chat_id')}")
                print(f"  Name: {chat.get('chat_name')}")
                print(f"  User ID: {chat.get('user_id')}")
                print(f"  Created: {chat.get('created_at')}")
                print(f"  Updated: {chat.get('updated_at')}")
                print("-" * 40)
        else:
            print("ERROR: chats table does not exist!")
            
        # Close the connection
        conn.close()
    except Exception as e:
        print(f"Error checking SQLite database: {str(e)}")

def create_test_session():
    """Create a test session by accessing the index page"""
    print_section("Creating Test Session")
    
    try:
        print("Accessing index page to create session...")
        response = requests.get('http://localhost:5000/')
        
        if response.status_code == 200:
            print(f"Success! Status code: {response.status_code}")
            cookies = response.cookies
            print(f"Session cookie: {cookies.get('session')}")
            return cookies
        else:
            print(f"Error accessing index page. Status code: {response.status_code}")
            return None
    except Exception as e:
        print(f"Error creating test session: {str(e)}")
        return None

def test_get_chats_api(cookies=None):
    """Test the /api/chats API endpoint"""
    print_section("Testing GET /api/chats API")
    
    try:
        print("Fetching chats from API...")
        response = requests.get('http://localhost:5000/api/chats', cookies=cookies)
        
        if response.status_code == 200:
            print(f"Success! Status code: {response.status_code}")
            
            # Parse the response
            try:
                data = response.json()
                print(f"API returned {len(data)} chats")
                
                if isinstance(data, dict) and 'success' in data:
                    # API returns {success: true, chats: [...]}
                    if data.get('success'):
                        chats = data.get('chats', [])
                        print(f"Found {len(chats)} chats in the API response")
                        
                        for chat in chats:
                            print(f"  Chat ID: {chat.get('chat_id')}")
                            print(f"  Name: {chat.get('chat_name')}")
                            print("-" * 40)
                    else:
                        print(f"API returned error: {data.get('error')}")
                elif isinstance(data, list):
                    # API returns directly the list of chats
                    chats = data
                    print(f"Found {len(chats)} chats in the API response")
                    
                    for chat in chats:
                        print(f"  Chat ID: {chat.get('chat_id')}")
                        print(f"  Name: {chat.get('chat_name')}")
                        print("-" * 40)
                else:
                    print(f"Unexpected API response format: {data}")
            except json.JSONDecodeError:
                print(f"Error parsing JSON response: {response.text}")
        else:
            print(f"Error fetching chats. Status code: {response.status_code}")
            print(f"Response: {response.text}")
    except Exception as e:
        print(f"Error testing get_chats API: {str(e)}")

def test_create_chat_api(cookies=None):
    """Test the /api/chats/new API endpoint"""
    print_section("Testing POST /api/chats/new API")
    
    try:
        print("Creating new chat via API...")
        response = requests.post(
            'http://localhost:5000/api/chats/new', 
            json={'chat_name': 'API Test Chat'}, 
            cookies=cookies
        )
        
        if response.status_code == 200:
            print(f"Success! Status code: {response.status_code}")
            
            # Parse the response
            try:
                data = response.json()
                
                if data.get('success'):
                    print(f"Successfully created chat with ID: {data.get('chat_id')}")
                    return data.get('chat_id')
                else:
                    print(f"API returned error: {data.get('error')}")
                    return None
            except json.JSONDecodeError:
                print(f"Error parsing JSON response: {response.text}")
                return None
        else:
            print(f"Error creating chat. Status code: {response.status_code}")
            print(f"Response: {response.text}")
            return None
    except Exception as e:
        print(f"Error testing create_chat API: {str(e)}")
        return None

def check_frontend_javascript():
    """Check frontend JavaScript for chat display"""
    print_section("Frontend JavaScript Check")
    
    try:
        if not os.path.exists('static/js/main.js'):
            print("ERROR: static/js/main.js file does not exist!")
            return
            
        # Look for key functions related to chat display
        with open('static/js/main.js', 'r') as f:
            content = f.read()
            
            # Check for fetchChats function
            if 'function fetchChats()' in content:
                print("✓ fetchChats() function found")
                
                # Check if it's processing the response correctly
                if 'data.success' in content and 'data.chats' in content:
                    print("✓ fetchChats() checks data.success and data.chats")
                elif 'data.length' in content or 'data.forEach' in content:
                    print("✓ fetchChats() processes data as array")
                else:
                    print("✗ fetchChats() may not be correctly processing the response")
            else:
                print("✗ fetchChats() function not found!")
                
            # Check for addChatToSidebar function  
            if 'function addChatToSidebar' in content:
                print("✓ addChatToSidebar() function found")
            else:
                print("✗ addChatToSidebar() function not found!")
    except Exception as e:
        print(f"Error checking frontend JavaScript: {str(e)}")

def run_full_diagnostics():
    """Run all diagnostics to debug the chat sidebar issue"""
    # First check SQLite database
    check_sqlite_db()
    
    # Check frontend JavaScript
    check_frontend_javascript()
    
    # Create a session
    cookies = create_test_session()
    
    # Test getting chats
    test_get_chats_api(cookies)
    
    # Test creating a new chat
    chat_id = test_create_chat_api(cookies)
    
    if chat_id:
        print("\nWaiting 2 seconds for the database to update...")
        time.sleep(2)
        
        # Check if the new chat was added to the database
        check_sqlite_db()
        
        # Test getting chats again to see if the new chat is returned
        test_get_chats_api(cookies)
    
    print_section("Diagnostics Complete")
    print("Possible issues:")
    print("1. Frontend is expecting a different format than what the API returns")
    print("2. User ID in the session doesn't match the user ID in the database")
    print("3. API is not correctly retrieving chats from the database")
    print("4. Network issue preventing API communication")
    print("5. JavaScript error preventing sidebar update")

if __name__ == "__main__":
    run_full_diagnostics() 