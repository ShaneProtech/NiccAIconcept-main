import os
import sqlite3
from dotenv import load_dotenv

def main():
    # Load environment variables
    load_dotenv()
    
    # Check if Supabase is configured
    supabase_url = os.getenv('SUPABASE_URL')
    supabase_key = os.getenv('SUPABASE_KEY')
    
    print(f"Supabase URL exists: {bool(supabase_url)}")
    print(f"Supabase key exists: {bool(supabase_key)}")
    
    # Check SQLite chats database
    try:
        print("\nChecking SQLite chats.db:")
        conn = sqlite3.connect('chats.db')
        cursor = conn.cursor()
        
        # Get tables
        cursor.execute("SELECT name FROM sqlite_master WHERE type='table'")
        tables = cursor.fetchall()
        print(f"Tables in chats.db: {[table[0] for table in tables]}")
        
        # Check chats table
        if ('chats',) in tables:
            cursor.execute("SELECT COUNT(*) FROM chats")
            chat_count = cursor.fetchone()[0]
            print(f"Number of chats in SQLite: {chat_count}")
            
            # Get all chats
            cursor.execute("SELECT chat_id, chat_name, user_id, created_at, updated_at FROM chats")
            chats = cursor.fetchall()
            print("\nChats in SQLite:")
            for chat in chats:
                print(f"  Chat ID: {chat[0]}, Name: {chat[1]}, User: {chat[2]}")
        
        # Close connection
        conn.close()
    except Exception as e:
        print(f"Error checking SQLite: {str(e)}")
    
    # Check session user ID (common issue with retrieving chats)
    print("\nNote: The API might be using a different user_id than 'anonymous'")
    print("Make sure the app.py session['user_id'] matches the user_id in the database")

if __name__ == "__main__":
    main() 