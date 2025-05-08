import sqlite3
import os

def check_chats_db():
    print("Checking chats.db...")
    
    # Check if the file exists
    if not os.path.exists('chats.db'):
        print("chats.db does not exist!")
        return
    
    print("chats.db exists.")
    
    # Connect to the database
    try:
        conn = sqlite3.connect('chats.db')
        cursor = conn.cursor()
        
        # Check for tables
        cursor.execute("SELECT name FROM sqlite_master WHERE type='table'")
        tables = cursor.fetchall()
        
        if not tables:
            print("No tables found in chats.db")
        else:
            print(f"Tables in chats.db: {', '.join([t[0] for t in tables])}")
            
            # Check chats table structure
            if ('chats',) in tables:
                cursor.execute("PRAGMA table_info(chats)")
                columns = cursor.fetchall()
                print(f"Columns in chats table: {', '.join([col[1] for col in columns])}")
                
                # Count chats
                cursor.execute("SELECT COUNT(*) FROM chats")
                count = cursor.fetchone()[0]
                print(f"Number of chats: {count}")
                
                # Show some chats
                if count > 0:
                    cursor.execute("SELECT chat_id, chat_name, created_at FROM chats LIMIT 5")
                    for row in cursor.fetchall():
                        print(f"Chat: {row[0]}, Name: {row[1]}, Created: {row[2]}")
            
            # Check messages table structure
            if ('messages',) in tables:
                cursor.execute("PRAGMA table_info(messages)")
                columns = cursor.fetchall()
                print(f"Columns in messages table: {', '.join([col[1] for col in columns])}")
                
                # Count messages
                cursor.execute("SELECT COUNT(*) FROM messages")
                count = cursor.fetchone()[0]
                print(f"Number of messages: {count}")
        
        conn.close()
    except Exception as e:
        print(f"Error checking database: {str(e)}")

# Test adding a chat directly
def test_add_chat():
    print("\nTesting direct chat creation...")
    try:
        conn = sqlite3.connect('chats.db')
        cursor = conn.cursor()
        
        # Create tables if they don't exist
        cursor.execute('''
        CREATE TABLE IF NOT EXISTS chats (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            user_id TEXT,
            chat_id TEXT UNIQUE,
            chat_name TEXT,
            created_at TEXT,
            updated_at TEXT
        )
        ''')
        
        # Create a test chat
        import time
        import uuid
        import datetime
        
        chat_id = f"chat_{int(time.time())}_{uuid.uuid4().hex[:8]}"
        timestamp = datetime.datetime.now().isoformat()
        
        cursor.execute(
            "INSERT INTO chats (user_id, chat_id, chat_name, created_at, updated_at) VALUES (?, ?, ?, ?, ?)",
            ("test_user", chat_id, "Test Chat", timestamp, timestamp)
        )
        
        conn.commit()
        print(f"Created test chat with ID: {chat_id}")
        
        conn.close()
        return True
    except Exception as e:
        print(f"Error creating test chat: {str(e)}")
        return False

if __name__ == "__main__":
    check_chats_db()
    test_add_chat()
    check_chats_db() # Check again after adding a chat 