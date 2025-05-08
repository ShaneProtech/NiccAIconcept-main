import os
from dotenv import load_dotenv
from supabase import create_client

# Load environment variables
load_dotenv()

# Supabase configuration
SUPABASE_URL = os.getenv('SUPABASE_URL')
SUPABASE_KEY = os.getenv('SUPABASE_KEY')

# Initialize Supabase client
def get_supabase_client():
    """Get a Supabase client for database operations"""
    if not SUPABASE_URL or not SUPABASE_KEY:
        raise ValueError("Supabase URL and API Key must be set in environment variables")
    
    return create_client(SUPABASE_URL, SUPABASE_KEY)

# Function to check if Supabase is configured properly
def is_supabase_configured():
    """Check if Supabase is properly configured"""
    return bool(SUPABASE_URL and SUPABASE_KEY) 