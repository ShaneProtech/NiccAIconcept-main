"""
Debug version of the application to run with enhanced logging
"""
import os
import sys
import logging

# Set up logging
logging.basicConfig(
    level=logging.DEBUG,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    handlers=[
        logging.StreamHandler(sys.stdout)
    ]
)

# Import the Flask app
from app import app

if __name__ == "__main__":
    # Enable Flask debug mode
    app.debug = True
    app.config['PROPAGATE_EXCEPTIONS'] = True
    
    # Print key app configuration
    print("\n*** Debug App Configuration ***")
    print(f"FLASK_ENV: {os.environ.get('FLASK_ENV', 'development')}")
    print(f"Using SQLite DB: {os.path.exists('chats.db')}")
    print(f"Supabase URL present: {bool(os.environ.get('SUPABASE_URL'))}")
    print(f"Supabase Key present: {bool(os.environ.get('SUPABASE_KEY'))}")
    print("*****************************\n")
    
    # Run the app in debug mode
    app.run(debug=True, use_reloader=True, host='0.0.0.0', port=5000) 