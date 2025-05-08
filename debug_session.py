import requests
import json
import time

def check_session_values():
    """Test the session state and chats API"""
    print("Testing session and chats API...")
    
    # Base URL for the API
    base_url = "http://localhost:5000"
    
    # Create a session to maintain cookies
    s = requests.Session()
    
    # First, request the index page to initialize session
    r = s.get(f"{base_url}/")
    if r.status_code != 200:
        print(f"Error accessing index page: {r.status_code}")
        return
    
    print("Session initialized")
    
    # Check if we can create a new chat
    print("\nTesting chat creation API...")
    r = s.post(f"{base_url}/api/chats/new")
    
    if r.status_code != 200:
        print(f"Error creating chat: {r.status_code}")
    else:
        response = r.json()
        print(f"Chat creation response: {json.dumps(response, indent=2)}")
        
        if response.get('success'):
            chat_id = response.get('chat_id')
            print(f"Created chat with ID: {chat_id}")
            
            # Wait a moment for the database to update
            time.sleep(1)
            
            # Now try to get the list of chats
            print("\nTesting get chats API...")
            r = s.get(f"{base_url}/api/chats")
            
            if r.status_code != 200:
                print(f"Error getting chats: {r.status_code}")
            else:
                chats = r.json()
                print(f"Number of chats returned: {len(chats)}")
                
                if len(chats) > 0:
                    print("Chats found:")
                    for chat in chats[:5]:  # Show up to 5 chats
                        print(f"  - {chat.get('chat_id')}: {chat.get('chat_name')}")
                else:
                    print("No chats returned from API!")
                    print("This indicates a problem with the get_chats API or user_id mismatch.")

if __name__ == "__main__":
    check_session_values() 