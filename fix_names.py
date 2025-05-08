import sqlite3
import os
import sys
import time
import json
import random
import datetime
import requests

def fix_all_chat_names():
    """Fix all chat names that are still set to default"""
    try:
        # Connect to the database
        conn = sqlite3.connect('chats.db')
        conn.row_factory = sqlite3.Row
        cursor = conn.cursor()
        
        # Get all chats with message counts
        cursor.execute("""
            SELECT c.chat_id, c.chat_name, COUNT(m.id) as message_count 
            FROM chats c
            LEFT JOIN messages m ON c.chat_id = m.chat_id
            GROUP BY c.chat_id
        """)
        
        chat_info = [dict(row) for row in cursor.fetchall()]
        print(f"Found {len(chat_info)} chats in database")
        
        # Find chats that need renaming
        default_name_chats = [chat for chat in chat_info 
                             if chat['chat_name'] == 'New Conversation' and chat['message_count'] >= 2]
        
        if not default_name_chats:
            print("No chats with default names found that need fixing")
            return
            
        print(f"Found {len(default_name_chats)} chats with default names and enough messages")
        
        for chat in default_name_chats:
            chat_id = chat['chat_id']
            
            # Get messages for this chat
            cursor.execute(
                "SELECT role, content FROM messages WHERE chat_id = ? ORDER BY timestamp",
                (chat_id,)
            )
            messages = [dict(row) for row in cursor.fetchall()]
            
            # Generate a name based on content
            new_name = generate_chat_name(messages)
            
            if new_name and new_name != "New Conversation":
                print(f"Renaming chat {chat_id} to '{new_name}'")
                
                # Update name in database
                cursor.execute(
                    "UPDATE chats SET chat_name = ? WHERE chat_id = ?",
                    (new_name, chat_id)
                )
                conn.commit()
                
                # Try to call the API endpoint to notify clients
                try:
                    requests.get(f"http://localhost:5001/api/debug/fix-chat-names")
                    print("Notified server about name changes")
                except:
                    print("Could not notify server (is it running?)")
            else:
                print(f"Could not generate name for chat {chat_id}")
        
        conn.close()
        print("Done fixing chat names!")
        
    except Exception as e:
        print(f"Error fixing chat names: {str(e)}")

def generate_chat_name(messages):
    """Generate a chat name based on message content"""
    # Extract message content
    user_messages = [msg['content'] for msg in messages if msg['role'] == 'user']
    
    if not user_messages:
        return "New Conversation"
    
    # Try to extract a meaningful name
    topics = []
    
    # Keywords to look for
    vehicle_keywords = ['honda', 'toyota', 'ford', 'acura', 'lexus', 'nissan', 'hyundai', 
                     'accord', 'camry', 'mustang', 'rdx', 'mdx', 'rav4', 'rogue']
    
    system_keywords = ['adas', 'calibration', 'camera', 'radar', 'sensor', 'collision',
                     'windshield', 'repair', 'systems', 'vehicle']
    
    # Check for keywords in messages
    for msg in user_messages:
        msg_lower = msg.lower()
        
        # Check for vehicle mentions
        for kw in vehicle_keywords:
            if kw in msg_lower:
                topics.append(kw.title())
        
        # Check for system keywords
        for kw in system_keywords:
            if kw in msg_lower:
                topics.append(kw.title())
    
    # Remove duplicates while preserving order
    unique_topics = []
    for topic in topics:
        if topic not in unique_topics:
            unique_topics.append(topic)
    
    # Create name based on topics
    if unique_topics:
        if len(unique_topics) == 1:
            return f"{unique_topics[0]} Chat"
        else:
            return f"{unique_topics[0]} and {unique_topics[1]}"
    
    # If no topics found, use the first few words of the first message
    first_msg = user_messages[0]
    words = first_msg.split()
    if len(words) > 2:
        return " ".join(words[:3]) + "..."
    
    # Fallback
    return "ADAS Conversation"

if __name__ == "__main__":
    fix_all_chat_names()
    print("\nScript complete. All chats with default names should now have meaningful names.") 