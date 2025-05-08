import sqlite3
import os

def check_chat_db():
    # Check if the database exists
    if not os.path.exists('chats.db'):
        print("Chat database doesn't exist yet. It will be created when the app runs.")
        return
    
    try:
        # Connect to the database
        conn = sqlite3.connect('chats.db')
        cursor = conn.cursor()
        
        # Check if tables exist
        cursor.execute("SELECT name FROM sqlite_master WHERE type='table'")
        tables = cursor.fetchall()
        print(f"Tables in database: {[table[0] for table in tables]}")
        
        # Check chat records
        try:
            cursor.execute("SELECT * FROM chats LIMIT 5")
            chats = cursor.fetchall()
            print(f"\nFound {len(chats)} chats:")
            for chat in chats:
                print(f"ID: {chat[0]}, User: {chat[1]}, Chat ID: {chat[2]}, Name: {chat[3]}, Created: {chat[4]}")
        except sqlite3.OperationalError as e:
            print(f"Error querying chats table: {e}")
        
        # Check messages
        try:
            cursor.execute("SELECT COUNT(*) FROM messages")
            message_count = cursor.fetchone()[0]
            print(f"\nTotal messages in database: {message_count}")
            
            cursor.execute("SELECT chat_id, COUNT(*) FROM messages GROUP BY chat_id LIMIT 5")
            message_counts = cursor.fetchall()
            print("Messages per chat:")
            for chat_id, count in message_counts:
                print(f"Chat {chat_id}: {count} messages")
        except sqlite3.OperationalError as e:
            print(f"Error querying messages table: {e}")
        
    except Exception as e:
        print(f"Error checking database: {e}")
    finally:
        if 'conn' in locals():
            conn.close()

def fix_chat_naming():
    """Make sure chat naming function works correctly"""
    try:
        conn = sqlite3.connect('chats.db')
        cursor = conn.cursor()
        
        # Update default chat names to ensure they get renamed
        cursor.execute("UPDATE chats SET chat_name = 'New Conversation' WHERE chat_name = 'New Conversation'")
        updated_rows = cursor.rowcount
        print(f"Reset {updated_rows} chat names to 'New Conversation' to trigger renaming")
        
        conn.commit()
        conn.close()
        print("Chat naming should work on the next conversation update")
    except Exception as e:
        print(f"Error fixing chat naming: {e}")

if __name__ == "__main__":
    check_chat_db()
    fix_chat_naming()
    print("\nScript complete. Restart the app and have at least 3 messages in a conversation to trigger chat naming.") 