import sqlite3
import os
import datetime

def cleanup_chats(keep_recent=5):
    """
    Clean up the chats database by removing all but the most recent conversations.
    
    Args:
        keep_recent (int): Number of most recent chats to keep for each user
    """
    try:
        # Check if the database exists
        if not os.path.exists('chats.db'):
            print("Chats database not found.")
            return
            
        print(f"Starting chat cleanup, keeping {keep_recent} most recent chats per user...")
        
        # Connect to the database
        conn = sqlite3.connect('chats.db')
        cursor = conn.cursor()
        
        # Get all users
        cursor.execute("SELECT DISTINCT user_id FROM chats")
        users = [row[0] for row in cursor.fetchall()]
        
        total_deleted = 0
        total_kept = 0
        
        # For each user, keep only the most recent chats
        for user_id in users:
            # Get all chats for this user, ordered by updated_at (most recent first)
            cursor.execute(
                "SELECT chat_id, chat_name, updated_at FROM chats WHERE user_id = ? ORDER BY updated_at DESC",
                (user_id,)
            )
            user_chats = cursor.fetchall()
            
            # Keep the most recent chats, delete the rest
            chats_to_keep = user_chats[:keep_recent]
            chats_to_delete = user_chats[keep_recent:]
            
            for chat_id, chat_name, updated_at in chats_to_delete:
                # Delete messages for this chat
                cursor.execute("DELETE FROM messages WHERE chat_id = ?", (chat_id,))
                # Delete the chat
                cursor.execute("DELETE FROM chats WHERE chat_id = ?", (chat_id,))
                print(f"Deleted chat: {chat_name} (ID: {chat_id}, Last updated: {updated_at})")
                total_deleted += 1
            
            total_kept += len(chats_to_keep)
            
            # Print information about kept chats
            for chat_id, chat_name, updated_at in chats_to_keep:
                print(f"Kept chat: {chat_name} (ID: {chat_id}, Last updated: {updated_at})")
        
        # Commit the changes
        conn.commit()
        conn.close()
        
        print(f"\nCleanup completed: {total_deleted} chats deleted, {total_kept} chats kept.")
        
    except Exception as e:
        print(f"Error during cleanup: {str(e)}")
        if 'conn' in locals():
            conn.close()

if __name__ == "__main__":
    # Keep only the 5 most recent chats per user
    cleanup_chats(keep_recent=5) 