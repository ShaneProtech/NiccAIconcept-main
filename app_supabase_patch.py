from flask import Flask, request, jsonify, session
from flask_socketio import SocketIO
import sqlite3
from db_supabase import SupabaseHelper

# Create Flask app and SocketIO instance
app = Flask(__name__, static_folder='static')
app.config['SECRET_KEY'] = 'your_secret_key'  # Replace with your actual secret key
socketio = SocketIO(app)

# Initialize Supabase helper
db_helper = SupabaseHelper()

# 1. Replace query_vehicle_database with:
def query_vehicle_database(make, model, year=None):
    """Query the database for vehicle information using a flexible approach"""
    return db_helper.query_vehicle_database(make, model, year)

# 2. Replace create_new_chat with:
def create_new_chat(user_id="anonymous"):
    """Create a new chat and return its ID"""
    return db_helper.create_new_chat(user_id)

# 3. Replace get_chat_messages with:
def get_chat_messages(chat_id):
    """Get all messages for a specific chat"""
    return db_helper.get_chat_messages(chat_id)

# 4. Replace save_message with:
def save_message(chat_id, role, content):
    """Save a message to the database"""
    return db_helper.save_message(chat_id, role, content)

# 5. Replace update_chat_name with:
def update_chat_name(chat_id, new_name):
    """Update a chat's name"""
    return db_helper.update_chat_name(chat_id, new_name)

# 6. In get_chats_api() function, replace the code with:
@app.route('/api/chats', methods=['GET'])
def get_chats_api():
    """API endpoint to get all chats"""
    try:
        # Get the user ID from the session
        user_id = session.get('user_id', 'anonymous')
        
        # Get chats using the helper
        chats = db_helper.get_chats(user_id)
        
        return jsonify(chats)
    except Exception as e:
        print(f"Error getting chats: {str(e)}")
        return jsonify([])

# 7. In delete_chat_api() function, replace the code with:
@app.route('/api/chats/<chat_id>/delete', methods=['DELETE'])
def delete_chat_api(chat_id):
    """API endpoint to delete a chat"""
    try:
        # Delete the chat using the helper
        success = db_helper.delete_chat(chat_id)
        
        return jsonify({'success': success})
    except Exception as e:
        print(f"Error deleting chat: {str(e)}")
        return jsonify({'success': False, 'error': str(e)})

# 8. In cleanup_chats_api() function, replace the code with:
@app.route('/api/chats/cleanup', methods=['POST'])
def cleanup_chats_api():
    """API endpoint to clean up old chats"""
    try:
        # Get the user ID from the session
        user_id = session.get('user_id', 'anonymous')
        
        # Get parameter for how many chats to keep (default to 5)
        data = request.json or {}
        keep_recent = data.get('keep_recent', 5)
        
        # Use the helper to cleanup chats
        result = db_helper.cleanup_chats(user_id, keep_recent)
        
        return jsonify(result)
    except Exception as e:
        print(f"Error cleaning up chats: {str(e)}")
        return jsonify({'success': False, 'error': str(e)})

# 9. Replace the database initialization at the end of the file:
if __name__ == "__main__":
    # Initialize the database if needed (this still uses SQLite as a fallback)
    try:
        if not db_helper.use_supabase:
            # Only initialize SQLite if we're not using Supabase
            conn = sqlite3.connect('chats.db')
            cursor = conn.cursor()
            
            # Create chats table if it doesn't exist
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
            
            # Create messages table if it doesn't exist
            cursor.execute('''
            CREATE TABLE IF NOT EXISTS messages (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                chat_id TEXT,
                role TEXT,
                content TEXT,
                timestamp TEXT,
                FOREIGN KEY (chat_id) REFERENCES chats (chat_id)
            )
            ''')
            
            conn.commit()
            conn.close()
            print("SQLite database initialized successfully")
    except Exception as e:
        print(f"Error initializing database: {str(e)}")
    
    # Start the Flask server with SocketIO
    socketio.run(app, host='0.0.0.0', port=5000, debug=True) 