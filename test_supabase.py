from dotenv import load_dotenv
from db_config import get_supabase_client, is_supabase_configured
from db_supabase import SupabaseHelper
import os
import time

# Load environment variables
load_dotenv()

# Print Supabase configuration (without revealing the full key)
supabase_url = os.getenv('SUPABASE_URL')
supabase_key = os.getenv('SUPABASE_KEY')

if supabase_url:
    print(f"SUPABASE_URL is configured: {supabase_url}")
else:
    print("SUPABASE_URL is not configured")

if supabase_key:
    # Only show the first 10 characters of the key for security
    masked_key = supabase_key[:10] + "..." if supabase_key else None
    print(f"SUPABASE_KEY is configured: {masked_key}")
else:
    print("SUPABASE_KEY is not configured")

# Check basic Supabase connection
if is_supabase_configured():
    print("\nChecking Supabase connection...")
    try:
        supabase = get_supabase_client()
        print("Successfully connected to Supabase")

        # Check for existing tables
        print("\nChecking for tables...")
        try:
            # Check if the essential tables exist
            table_checks = [
                ("chats", supabase.table("chats").select("count", count="exact").execute()),
                ("messages", supabase.table("messages").select("count", count="exact").execute()),
                ("master_vehicles", supabase.table("master_vehicles").select("count", count="exact").execute())
            ]
            
            tables_exist = True
            for table_name, response in table_checks:
                if hasattr(response, 'count') and response.count is not None:
                    print(f"Table '{table_name}' exists with {response.count} records")
                else:
                    print(f"Table '{table_name}' might not exist or returned no count")
                    tables_exist = False
            
            if not tables_exist:
                print("\nThe essential tables don't seem to exist in Supabase.")
                print("Please run the 'create_essential_tables.sql' script in the Supabase SQL Editor first.")
                print("File path: ./create_essential_tables.sql")
                exit(1)
            
        except Exception as e:
            print(f"Error checking tables: {str(e)}")
            print("\nThe essential tables don't seem to exist in Supabase.")
            print("Please run the 'create_essential_tables.sql' script in the Supabase SQL Editor first.")
            print("File path: ./create_essential_tables.sql")
            exit(1)
    
    except Exception as e:
        print(f"Error connecting to Supabase: {str(e)}")
        exit(1)

# Create a SupabaseHelper instance
db_helper = SupabaseHelper()
print(f"\nUsing Supabase: {db_helper.use_supabase}")

# Test functions
def test_create_chat():
    print("\n=== Testing create_new_chat ===")
    chat_id = db_helper.create_new_chat()
    print(f"Created chat with ID: {chat_id}")
    return chat_id

def test_save_message(chat_id):
    print("\n=== Testing save_message ===")
    success = db_helper.save_message(chat_id, "user", "This is a test message from the user")
    print(f"Message saved: {success}")
    
    success = db_helper.save_message(chat_id, "assistant", "This is a test response from the assistant")
    print(f"Message saved: {success}")
    return success

def test_get_messages(chat_id):
    print("\n=== Testing get_chat_messages ===")
    messages = db_helper.get_chat_messages(chat_id)
    print(f"Retrieved {len(messages)} messages")
    for msg in messages:
        print(f"- {msg.get('role')}: {msg.get('content')[:50]}...")
    return messages

def test_update_chat_name(chat_id):
    print("\n=== Testing update_chat_name ===")
    new_name = f"Test Chat {int(time.time())}"
    success = db_helper.update_chat_name(chat_id, new_name)
    print(f"Chat name updated to '{new_name}': {success}")
    return success

def test_get_chats():
    print("\n=== Testing get_chats ===")
    chats = db_helper.get_chats()
    print(f"Retrieved {len(chats)} chats")
    for chat in chats[:5]:  # Show the first 5 chats
        print(f"- {chat.get('chat_id')}: {chat.get('chat_name')}")
    return chats

def test_pin_chat(chat_id):
    print("\n=== Testing toggle_pin_chat ===")
    is_pinned = db_helper.toggle_pin_chat(chat_id)
    print(f"Chat {chat_id} is now pinned: {is_pinned}")
    
    is_pinned = db_helper.toggle_pin_chat(chat_id)
    print(f"Chat {chat_id} is now pinned: {is_pinned}")
    return is_pinned

def test_vehicle_info():
    print("\n=== Testing query_vehicle_database ===")
    # Test with a known vehicle
    results = db_helper.query_vehicle_database("Honda", "ACCORD")
    print(f"Found {len(results)} results for Honda ACCORD")
    
    # Test with another vehicle
    results = db_helper.query_vehicle_database("Toyota", "CAMRY")
    print(f"Found {len(results)} results for Toyota CAMRY")
    
    # Test with a vehicle that shouldn't exist
    results = db_helper.query_vehicle_database("NonExistent", "Vehicle")
    print(f"Found {len(results)} results for NonExistent Vehicle")

def cleanup_test_chats(test_chat_id):
    print("\n=== Cleaning up test chat ===")
    success = db_helper.delete_chat(test_chat_id)
    print(f"Deleted test chat: {success}")
    return success

# Run the tests
if __name__ == "__main__":
    # Create a new chat
    test_chat_id = test_create_chat()
    
    if test_chat_id:
        # Test saving messages
        test_save_message(test_chat_id)
        
        # Test retrieving messages
        test_get_messages(test_chat_id)
        
        # Test updating chat name
        test_update_chat_name(test_chat_id)
        
        # Test pinning chat
        test_pin_chat(test_chat_id)
        
        # Test retrieving chats
        test_get_chats()
        
        # Test vehicle info
        test_vehicle_info()
        
        # Clean up test chat
        cleanup_test_chats(test_chat_id)
    else:
        print("Failed to create a test chat, skipping remaining tests") 