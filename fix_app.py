import os
import re

def fix_app_py():
    # Read the file content
    with open('app.py', 'r', encoding='utf-8') as file:
        content = file.read()
    
    # Fix the before_first_request issue
    pattern = r'@app\.before_first_request\s+def\s+initialize_database\(\):'
    replacement = """# Initialize the database
with app.app_context():
    create_chat_db()

# Add new API routes for chat management"""
    
    # Apply the fix
    fixed_content = re.sub(pattern, replacement, content)
    
    # Ensure the file ends properly
    if "if __name__ == '__main__':" not in fixed_content:
        fixed_content = fixed_content.rstrip() + "\n\n"
        fixed_content += """# Note: Helper functions are defined inside handle_message to ensure proper access to session_id and chat_id variables

if __name__ == '__main__':
    socketio.run(app, host='0.0.0.0', port=5001, debug=True)
"""
    
    # Create a backup
    with open('app.py.backup', 'w', encoding='utf-8') as backup:
        backup.write(content)
    
    # Write the fixed content
    with open('app.py', 'w', encoding='utf-8') as file:
        file.write(fixed_content)
    
    print("Fixed app.py successfully!")
    print("A backup was created as app.py.backup")

if __name__ == "__main__":
    fix_app_py() 