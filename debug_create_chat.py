import requests
import json
import time

def test_create_chat_api():
    print("Testing create chat API...")
    
    try:
        # Make sure the server is running on localhost:5000
        # Make the API call
        response = requests.post('http://localhost:5000/api/chats/new')
        
        # Check if the request was successful
        print(f"Status code: {response.status_code}")
        
        # Try to parse the response body
        try:
            data = response.json()
            print(f"Response data: {json.dumps(data, indent=2)}")
            
            # Check if the response has the expected structure
            if 'success' in data and data['success'] and 'chat_id' in data:
                print("Chat created successfully!")
                return data['chat_id']
            else:
                print("Chat creation response doesn't have the expected structure")
                return None
        except json.JSONDecodeError:
            print(f"Response is not valid JSON: {response.text}")
            return None
    except requests.RequestException as e:
        print(f"Request failed: {str(e)}")
        return None

def test_get_chats_api():
    print("\nTesting get chats API...")
    
    try:
        # Make the API call
        response = requests.get('http://localhost:5000/api/chats')
        
        # Check if the request was successful
        print(f"Status code: {response.status_code}")
        
        # Try to parse the response body
        try:
            data = response.json()
            print(f"Number of chats: {len(data)}")
            
            # Print the first few chats
            for i, chat in enumerate(data[:5]):
                print(f"Chat {i+1}: ID={chat.get('chat_id')}, Name={chat.get('chat_name')}")
            
            return data
        except json.JSONDecodeError:
            print(f"Response is not valid JSON: {response.text}")
            return None
    except requests.RequestException as e:
        print(f"Request failed: {str(e)}")
        return None

def simulate_new_chat_workflow():
    print("Simulating new chat workflow...\n")
    
    # 1. Create a new chat
    chat_id = test_create_chat_api()
    
    if not chat_id:
        print("Could not create a new chat. Workflow simulation failed.")
        return
    
    print(f"\nCreated chat with ID: {chat_id}")
    
    # 2. Wait briefly for the server to process
    time.sleep(1)
    
    # 3. Get the updated list of chats
    chats = test_get_chats_api()
    
    if not chats:
        print("Could not get the list of chats. Workflow simulation incomplete.")
        return
    
    # 4. Check if our new chat is in the list
    found = any(chat.get('chat_id') == chat_id for chat in chats)
    if found:
        print(f"\nSuccess! New chat (ID: {chat_id}) was found in the chat list.")
    else:
        print(f"\nError: New chat (ID: {chat_id}) was not found in the chat list.")

if __name__ == "__main__":
    simulate_new_chat_workflow() 