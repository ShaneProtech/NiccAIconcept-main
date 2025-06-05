import os
import time
import re
import sqlite3
import random
import datetime
import json
import traceback
from flask import Flask, render_template, request, jsonify, send_from_directory, session
from flask_socketio import SocketIO
import google.generativeai as genai
from dotenv import load_dotenv
from google.api_core import retry
from tenacity import retry, stop_after_attempt, wait_fixed
import requests
from db_supabase import SupabaseHelper  # Add Supabase helper import

# Import spaCy for NLP processing
try:
    import spacy  # type: ignore # pyright: ignore[reportMissingImports]
    # Try to load the English model
    try:
        nlp = spacy.load("en_core_web_sm")
        HAS_SPACY = True
        print("Successfully loaded spaCy model for NLP processing")
    except OSError:
        # If the model isn't installed, use a simple fallback
        print("SpaCy model not found. Using basic language processing instead.")
        nlp = None
        HAS_SPACY = False
except ImportError:
    print("SpaCy not installed. Using basic language processing instead.")
    nlp = None
    HAS_SPACY = False

# Debug helper functions
def debug_database_info():
    """Gather debug information about tables and columns in the database"""
    try:
        conn = sqlite3.connect('NiccDB.db')
        cursor = conn.cursor()
        
        # Get list of tables
        cursor.execute("SELECT name FROM sqlite_master WHERE type='table'")
        tables = [row[0] for row in cursor.fetchall()]
        print(f"Database tables ({len(tables)}): {', '.join(tables[:10])}...")
        
        # Print schema and sample data for each table
        for i, table_name in enumerate(tables):
            if table_name.startswith('sqlite_'):
                continue
                
            # Get column info
            cursor.execute(f"PRAGMA table_info({table_name})")
            columns = [row[1] for row in cursor.fetchall()]
            
            # Sample row count
            cursor.execute(f"SELECT COUNT(*) FROM {table_name}")
            row_count = cursor.fetchone()[0]
            print(f"Table {table_name} columns: {', '.join(columns[:5])}...")
            print(f"Table {table_name} has {row_count} rows")
            
            # Get a sample row if the table has data
            if row_count > 0:
                cursor.execute(f"SELECT * FROM {table_name} LIMIT 1")
                row = cursor.fetchone()
                print(f"Sample data from {table_name}: {row[:3]}...")
                
                # For vehicle tables, log available makes and models
                if table_name in ['master_vehicles', 'honda', 'toyota', 'nissan', 'ford', 'chevrolet']:
                    try:
                        if 'make' in columns and 'model' in columns:
                            cursor.execute(f"SELECT DISTINCT make, model FROM {table_name} LIMIT 10")
                            sample_vehicles = cursor.fetchall()
                            print(f"Sample vehicles in {table_name}: {sample_vehicles}")
                    except Exception as e:
                        print(f"Error getting sample vehicles: {str(e)}")
        
        print("Database debug info completed")
        return True
    except Exception as e:
        print(f"Error in debug_database_info: {str(e)}")
        return False
    finally:
        if 'conn' in locals():
            conn.close()

# Run database debugging on startup
debug_database_info()

# Load environment variables
load_dotenv()

# Configure Google Generative AI (Gemini)
GOOGLE_API_KEY = os.getenv('GOOGLE_API_KEY')
if not GOOGLE_API_KEY:
    print("WARNING: GOOGLE_API_KEY not found in environment variables. Using fallback API key.")
    GOOGLE_API_KEY = "AIzaSyD_AyN6m7QiDsk6Kfn5A5rtpQktdqyZlRY"

try:
    genai.configure(api_key=GOOGLE_API_KEY)
    # Test the API key with a simple request - try different model versions
    models = genai.list_models()
    available_models = [model.name for model in models if "generateContent" in model.supported_generation_methods]
    
    if available_models:
        print(f"Available Gemini models: {available_models}")
        # Choose the most appropriate model based on capabilities
        selected_model = None
        
        # Prioritize models in this order (newer/more capable first)
        model_preferences = [
            "models/gemini-1.5-pro", 
            "models/gemini-1.5-flash",
            "models/gemini-1.0-pro", 
            "models/gemini-pro"
        ]
        
        # Find the first available model from our preference list
        for preferred_model in model_preferences:
            matching_models = [m for m in available_models if preferred_model in m]
            if matching_models:
                # Choose the first match (usually the latest version)
                selected_model = matching_models[0]
                break
        
        # If no preferred model found, use the first available model
        if not selected_model and available_models:
            selected_model = available_models[0]
            
        model = genai.GenerativeModel(selected_model)
        print(f"Using Gemini model: {model.model_name}")
        HAS_GEMINI_ACCESS = True
    else:
        print("No available Gemini models found. Using fallback processing.")
        HAS_GEMINI_ACCESS = False
        model = None  # Initialize model to None to avoid errors
except Exception as e:
    print(f"Error configuring Gemini API: {str(e)}")
    HAS_GEMINI_ACCESS = False
    model = None  # Initialize model to None to avoid errors

# Retry decorator for Gemini API calls
@retry(stop=stop_after_attempt(3), wait=wait_fixed(2))
def generate_content_with_retry(model, prompt_parts):
    """Generate content with retry logic to handle API errors"""
    try:
        return model.generate_content(prompt_parts)
    except Exception as e:
        print(f"Error calling Gemini API: {str(e)}")
        raise

# Initialize Flask app
app = Flask(__name__, static_folder='static')
app.config['SECRET_KEY'] = os.urandom(24)
socketio = SocketIO(app)

# Initialize Supabase helper
from db_supabase import SupabaseHelper
db_helper = SupabaseHelper()

# Database connection
def get_db_connection():
    conn = sqlite3.connect('NiccDB.db')
    conn.row_factory = sqlite3.Row
    # Enable GROUP_CONCAT function
    conn.create_aggregate("GROUP_CONCAT", 1, GroupConcat)
    return conn

# Add GROUP_CONCAT implementation
class GroupConcat:
    def __init__(self):
        self.items = []
    
    def step(self, value):
        if value is not None:
            self.items.append(str(value))
    
    def finalize(self):
        if not self.items:
            return None
        return ','.join(self.items)

# Initialize Gemini model with safety settings
generation_config = {
    "temperature": 0.3,  # Reduced for more focused responses
    "top_p": 0.8,
    "top_k": 40,
    "max_output_tokens": 1024,
}

safety_settings = [
    {
        "category": "HARM_CATEGORY_HARASSMENT",
        "threshold": "BLOCK_NONE"
    },
    {
        "category": "HARM_CATEGORY_HATE_SPEECH",
        "threshold": "BLOCK_NONE"
    },
    {
        "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
        "threshold": "BLOCK_NONE"
    },
    {
        "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
        "threshold": "BLOCK_NONE"
    }
]

def is_adas_query(message):
    """Determine if the message is asking about vehicles, ADAS, or calibrations."""
    adas_keywords = [
        'calibration', 'calibrate', 'adas', 'sensor', 'camera', 'radar', 'lidar', 
        'alignment', 'windshield', 'procedure', 'requirements', 'systems', 'table', 
        'show me', 'tell me', 'list', 'what are', 'what systems', 'what adas', 
        'what calibration', 'does it have', 'hit', 'accident', 'crash', 'collision',
        'safety systems', 'driver assistance', 'front', 'rear', 'side', 'damaged',
        'blind spot', 'emergency braking', 'lane', 'cruise control', 'parking',
        'adaptive', 'assist', 'warning', 'automation', 'autonomous', 'fca', 'lka',
        'acc', 'aeb', 'bsm', 'fcw', 'ldw', 'surround view', 'backup', 'back up',
        'front facing', 'forward facing', 'replace', 'replaced', 'repair', 'repaired'
    ]
    
    # Vehicle make keywords - if these appear with a year, likely an ADAS query
    vehicle_makes = [
        'honda', 'toyota', 'ford', 'chevrolet', 'chevy', 'bmw', 'audi', 'mercedes',
        'lexus', 'acura', 'nissan', 'hyundai', 'kia', 'volkswagen', 'vw', 'subaru',
        'mazda', 'dodge', 'jeep', 'cadillac', 'chrysler', 'buick', 'gmc', 'ram',
        'tesla', 'porsche', 'volvo', 'infiniti', 'lincoln', 'genesis', 'mitsubishi',
        'fiat', 'mini', 'alfa', 'romeo', 'maserati', 'jaguar', 'land rover', 'range rover'
    ]
    
    # Check for model mentions without the make (common in follow-up questions)
    vehicle_models = [
        'mdx', 'rdx', 'tlx', 'ilx', 'accord', 'civic', 'pilot', 'cr-v', 'crv',
        'camry', 'corolla', 'rav4', 'mustang', 'f-150', 'f150', 'silverado',
        'malibu', 'altima', 'sentra', 'elantra', 'sonata', 'wrangler', 'cherokee',
        'grand cherokee', 'model 3', 'model s', 'model x', 'model y', 'tacoma',
        'tundra', 'highlander', 'outback', 'forester', 'impreza', 'legacy',
        'equinox', 'tahoe', 'suburban', 'escalade', 'yukon', 'sierra', 'colorado',
        'jetta', 'passat', 'tiguan', 'atlas', 'golf', 'a4', 'a6', 'q5', 'q7',
        'x3', 'x5', '3 series', '5 series', 'rx', 'es', 'nx', 'gx', 'rogue',
        'murano', 'pathfinder', 'santa fe', 'tucson', 'sorento', 'telluride', 'focus'
    ]
    
    # New: Keywords that indicate general automotive questions
    general_auto_keywords = [
        'what years', 'when was', 'when did', 'how long', 'generation', 'model year',
        'discontinued', 'introduced', 'debut', 'launch', 'history', 'available',
        'production', 'manufactured', 'made', 'built', 'sold', 'release', 'version'
    ]
    
    message_lower = message.lower()
    
    # Check for ADAS keywords
    has_adas_keyword = any(keyword in message_lower for keyword in adas_keywords)
    
    # Check for vehicle references
    has_vehicle_reference = (
        any(make in message_lower for make in vehicle_makes) or
        any(model in message_lower for model in vehicle_models) or
        any(year in message_lower for year in [str(y) for y in range(2000, 2025)])
    )
    
    # Check for collision or damage related words
    collision_words = ['hit', 'accident', 'crash', 'collision', 'damaged', 'damage', 'repair', 
                       'replace', 'fixed', 'broken', 'bumper', 'front end', 'rear end', 'side']
    has_collision_reference = any(word in message_lower for word in collision_words)
    
    # Check for general automotive keywords
    has_general_auto_keyword = any(keyword in message_lower for keyword in general_auto_keywords)
    
    # Check for follow-up questions about a previously mentioned vehicle
    is_followup = (
        'all of them' in message_lower or
        'systems on' in message_lower or
        'systems for' in message_lower or
        'tell me about' in message_lower or
        'show me the' in message_lower or
        'what about' in message_lower or
        'how about' in message_lower or
        'what if' in message_lower
    )
    
    # Check if this is likely a question about vehicle information rather than ADAS
    is_vehicle_info_query = has_vehicle_reference and has_general_auto_keyword
    
    # If it has any combination of keywords that suggests a vehicle ADAS query
    # or if it's a general automotive question about a specific vehicle
    return (has_adas_keyword or 
            (has_vehicle_reference and (has_adas_keyword or has_collision_reference)) or 
            is_followup or
            has_collision_reference or
            is_vehicle_info_query)

def extract_vehicle_info(message):
    """Extract vehicle information from the message using more sophisticated parsing."""
    info = {
        'year': None,
        'make': None,
        'model': None,
        'component': None
    }
    
    # Extract year (4 digit number between 1900 and 2025)
    year_match = re.search(r'\b(19|20)\d{2}\b', message)
    if year_match:
        info['year'] = year_match.group(0)
    
    # Expanded list of vehicle makes with common variations and misspellings
    makes_variations = {
        'honda': 'Honda',
        'toyota': 'Toyota',
        'ford': 'Ford',
        'chevrolet': 'Chevrolet',
        'chevy': 'Chevrolet',
        'bmw': 'BMW',
        'audi': 'Audi',
        'mercedes': 'Mercedes-Benz',
        'benz': 'Mercedes-Benz',
        'lexus': 'Lexus',
        'acura': 'Acura',
        'nissan': 'Nissan',
        'hyundai': 'Hyundai',
        'kia': 'Kia',
        'volkswagen': 'Volkswagen',
        'vw': 'Volkswagen',
        'subaru': 'Subaru',
        'mazda': 'Mazda',
        'dodge': 'Dodge',
        'jeep': 'Jeep',
        'cadillac': 'Cadillac',
        'chrysler': 'Chrysler',
        'buick': 'Buick',
        'gmc': 'GMC',
        'ram': 'RAM',
        'tesla': 'Tesla',
        'porsche': 'Porsche',
        'volvo': 'Volvo',
        'infiniti': 'Infiniti',
        'lincoln': 'Lincoln',
        'genesis': 'Genesis',
        'mitsubishi': 'Mitsubishi',
        'fiat': 'Fiat',
        'mini': 'MINI',
        'alfa': 'Alfa Romeo',
        'romeo': 'Alfa Romeo',
        'maserati': 'Maserati',
        'jaguar': 'Jaguar',
        'land rover': 'Land Rover',
        'range rover': 'Land Rover'
    }
    
    # Check for make in message
    message_lower = message.lower()
    for variation, make in makes_variations.items():
        if variation in message_lower:
            info['make'] = make
            break
    
    # Comprehensive model mapping for all makes (with more vehicles and variations)
    models_by_make = {
        'Honda': ['accord', 'civic', 'cr-v', 'crv', 'pilot', 'odyssey', 'fit', 'hr-v', 'hrv', 'ridgeline', 'passport', 'insight', 'clarity'],
        'Acura': ['mdx', 'rdx', 'tlx', 'ilx', 'rlx', 'nsx', 'tsx', 'tl', 'zdx', 'integra', 'cl', 'rsx', 'legend', 'rl'],
        'Toyota': ['camry', 'corolla', 'rav4', 'highlander', 'tacoma', 'tundra', 'sienna', '4runner', 'prius', 'avalon', 'venza', 'c-hr', 'chr', 'sequoia', 'land cruiser', 'gr86', 'supra', 'mirai', 'yaris', 'matrix'],
        'Ford': ['f-150', 'f150', 'f250', 'f-250', 'f350', 'f-350', 'mustang', 'escape', 'explorer', 'edge', 'focus', 'fusion', 'expedition', 'ranger', 'bronco', 'maverick', 'ecosport', 'mach-e', 'mach e', 'transit'],
        'Chevrolet': ['silverado', 'malibu', 'equinox', 'tahoe', 'suburban', 'traverse', 'cruze', 'impala', 'camaro', 'colorado', 'blazer', 'trailblazer', 'bolt', 'spark', 'sonic', 'trax', 'corvette'],
        'Nissan': ['altima', 'sentra', 'rogue', 'pathfinder', 'murano', 'maxima', 'frontier', 'titan', 'armada', 'versa', 'kicks', 'juke', 'leaf', 'z', '370z', '350z', 'gt-r', 'gtr'],
        'Hyundai': ['elantra', 'sonata', 'tucson', 'santa fe', 'kona', 'palisade', 'accent', 'venue', 'veloster', 'ioniq', 'nexo', 'santa cruz'],
        'Kia': ['optima', 'k5', 'sportage', 'sorento', 'telluride', 'forte', 'soul', 'seltos', 'carnival', 'stinger', 'niro', 'rio', 'ev6', 'cadenza'],
        'Subaru': ['outback', 'forester', 'impreza', 'legacy', 'crosstrek', 'ascent', 'wrx', 'brz', 'sti', 'baja', 'tribeca'],
        'Mazda': ['mazda3', 'mazda6', 'cx-5', 'cx-9', 'mx-5', 'cx-30', 'cx-3', 'cx-50', 'cx-90', 'miata', 'rx-8', 'rx8'],
        'Volkswagen': ['jetta', 'passat', 'tiguan', 'atlas', 'golf', 'taos', 'arteon', 'id.4', 'id4', 'beetle', 'eos', 'touareg', 'gti', 'cc', 'gli']
    }
    
    # Try to match model for the detected make
    if info['make'] and info['make'] in models_by_make:
        for model in models_by_make[info['make']]:
            # Try different matching patterns for more flexibility
            if (model in message_lower or 
                model.replace('-', '') in message_lower or
                model.replace(' ', '') in message_lower):
                # Store model in original format
                info['model'] = model
                break
    
    # If no make-model pair found, try to match any model as a fallback
    if not info['model']:
        all_models = []
        for make_models in models_by_make.values():
            all_models.extend(make_models)
        
        for model in all_models:
            # More flexible model matching
            if (model in message_lower or 
                model.replace('-', '') in message_lower or
                model.replace(' ', '') in message_lower):
                # Store model in original format
                info['model'] = model
                # If no make was detected but we found a model, assign the likely make
                if not info['make']:
                    # Determine which make this model belongs to
                    for make, models in models_by_make.items():
                        if model.lower() in [m.lower() for m in models]:
                            info['make'] = make
                            break
                break
    
    # Special case for known vehicles without detected make
    if not info['make'] and info['model']:
        # Check for common GM models
        gm_models = ['tahoe', 'suburban', 'yukon', 'escalade', 'silverado', 'sierra', 'corvette', 'camaro']
        if info['model'].lower() in gm_models:
            if info['model'].lower() in ['tahoe', 'suburban', 'silverado', 'camaro', 'corvette', 'blazer', 'equinox', 'malibu']:
                info['make'] = 'Chevrolet'
            elif info['model'].lower() in ['yukon', 'sierra', 'acadia', 'terrain']:
                info['make'] = 'GMC'
            elif info['model'].lower() in ['escalade']:
                info['make'] = 'Cadillac'
    
    # Enhanced component extraction with more variations and system types
    component_keywords = {
        'camera': [
            'camera', 'cam', 'windshield camera', 'windshield cam', 'front camera', 'front cam',
            'rear camera', 'rear cam', 'backup camera', 'backup cam', 'back up camera', 'back up cam',
            'surround view', 'surround camera', '360 camera', '360 cam', 'lane camera', 'lane cam',
            'parking camera', 'parking cam', 'forward facing camera', 'forward facing cam'
        ],
        'radar': [
            'radar', 'front radar', 'rear radar', 'side radar', 'blind spot radar', 'corner radar',
            'adaptive cruise radar', 'acc radar', 'distance sensor', 'distance radar', 'collision radar',
            'emergency braking radar', 'aeb radar', 'fcw radar'
        ],
        'lidar': [
            'lidar', 'laser sensor', 'laser detection', 'lidar sensor', 'laser radar'
        ],
        'sensor': [
            'sensor', 'parking sensor', 'ultrasonic', 'ultrasonic sensor', 'proximity sensor',
            'yaw sensor', 'steering sensor', 'wheel sensor', 'acceleration sensor'
        ],
        'system': [
            'lane keep', 'lane departure', 'blind spot', 'emergency braking', 'automatic braking',
            'cruise control', 'adaptive cruise', 'acc', 'fcw', 'forward collision', 'pedestrian detection',
            'cross traffic', 'parking assist', 'auto park', 'lane centering', 'traffic sign recognition'
        ]
    }
    
    for component_type, keywords in component_keywords.items():
        for keyword in keywords:
            if keyword in message_lower:
                info['component'] = component_type.title()
                break
        if info['component']:
            break
    
    print(f"Extracted vehicle info: {info}")
    return info

# Function to query vehicle information from database
def query_vehicle_database(make, model, year=None):
    """Query the database for vehicle information using a flexible approach"""
    print(f"DEBUG: Vehicle query wrapper called with Year: '{year}', Make: '{make}', Model: '{model}'")
    print(f"DEBUG: Year parameter type: {type(year)}")
    return db_helper.query_vehicle_database(make, model, year)

def handle_vehicle_info_query(message):
    """Handle queries about general vehicle information"""
    vehicle_info = extract_vehicle_info(message)
    
    # Empty vehicle_info structure would mean nothing was found at all
    if not vehicle_info:
        return "I couldn't identify a specific vehicle in your message. Could you provide the make, model, and year of the vehicle you're asking about?"
    
    make = vehicle_info['make']
    model = vehicle_info['model']
    year = vehicle_info['year']
    collision_area = None
    
    # Check for collision area in message
    if any(area in message.lower() for area in ['front', 'rear', 'side']):
        if 'front' in message.lower():
            collision_area = 'front'
        elif 'rear' in message.lower() or 'back' in message.lower():
            collision_area = 'rear'
        elif 'side' in message.lower():
            collision_area = 'side'
    
    print(f"Processing vehicle info query for: '{make}' '{model}' '{year}', collision area: '{collision_area}'")
    
    # Check for incomplete information
    missing_info = []
    if not make:
        missing_info.append("make")
    if not model:
        missing_info.append("model")
    if not year:
        missing_info.append("year")
    
    # Check if asking about production years
    year_keywords = ['what years', 'years made', 'production years', 'when was', 'how long', 'still made', 'discontinued']
    query_type = "years" if any(keyword in message.lower() for keyword in year_keywords) else "general"
    
    # Check if user wants a table format
    wants_table = any(keyword in message.lower() for keyword in ['table', 'chart', 'tabular', 'spreadsheet', 'list of', 'make a table', 'create a table'])
    table_format = None
    
    if wants_table:
        if any(word in message.lower() for word in ['calibration', 'requirements', 'prerequisites']):
            table_format = "calibration"
        elif any(word in message.lower() for word in ['hit', 'impact', 'collision', 'crash', 'accident', 'damage']):
            table_format = "impact"
        else:
            table_format = "general"
    
    # If we have missing information, call the fallback function with the missing info
    if missing_info:
        return provide_vehicle_info(make, model, year, query_type, wants_table, table_format, missing_info=missing_info)
    
    # Try the database first if we have all the needed information
    try:
        # Use our helper function to query the database
        result = query_vehicle_database(make, model, year)
        
        if result["found"]:
            # We have data for this vehicle - construct a response
            vehicle_data = result["data"][0] if result["data"] else {}
            
            # Format the response based on query type
            if query_type == "years":
                response = f"**{make} {model} Years in Database**\n\n"
                response += f"I have information for the {vehicle_data.get('year')} {make} {model}."
                return response
            else:
                # Check if the query is about a collision or if we should display all components
                if any(word in message.lower() for word in ['hit', 'impact', 'collision', 'crash', 'accident', 'damage', 'front', 'rear', 'side']) or 'components' in message.lower() or 'all' in message.lower():
                    # Get all systems for this vehicle - treat "all components" as a special case
                    all_systems = ["All Systems"] if 'components' in message.lower() or 'all' in message.lower() else None
                    # Return formatted calibration info with collision area
                    return format_calibration_info(result["data"], vehicle_info.get('component'), collision_area, all_systems=all_systems, requested_year=year)
                
                # For general vehicle info, return information about ALL components
                print(f"DEBUG: Displaying all component information for vehicle {make} {model} {year}")
                # Default to "All Systems" for general vehicle info
                all_systems = ["All Systems"]
                return format_calibration_info(result["data"], vehicle_info.get('component'), None, all_systems=all_systems, requested_year=year)
                
        # If we get here, we don't have database info for this vehicle
        # Fall back to provide_vehicle_info function
        return provide_vehicle_info(make, model, year, query_type, wants_table, table_format)
            
    except Exception as e:
        print(f"Database error in handle_vehicle_info_query: {e}")
        # Fall back to provide_vehicle_info function if database search fails
        return provide_vehicle_info(make, model, year, query_type, wants_table, table_format)

# System prompts for different types of interactions
ADAS_PROMPT = """
You are Nicc AI, an expert automotive intelligence specializing in ADAS (Advanced Driver Assistance Systems). Your primary expertise is in calibration requirements and procedures, but you also have extensive knowledge of:

1. Vehicle repair and diagnostics
2. ADAS technology capabilities and limitations
3. Safety system interactions and dependencies
4. Automotive repair industry standards and best practices
5. Common issues with ADAS systems after repairs

When analyzing vehicle information:
- Prioritize safety-critical systems first
- Explain why certain systems need calibration, not just what needs it
- Connect calibration requirements to real-world outcomes and consequences
- Consider the full repair context and system interdependencies
- Be precise about requirements but conversational in explanations

Your responses should be authoritative, professional, and insightful - demonstrate expertise while being approachable.
"""

GENERAL_PROMPT = """
You are Nicc AI, an intelligent automotive assistant with deep expertise in Advanced Driver Assistance Systems (ADAS). Your specialized knowledge focuses on calibration, but you can intelligently discuss:

- Vehicle diagnostics and repair
- Modern automotive technologies
- Safety systems and their proper functioning
- The relationships between different vehicle systems
- Industry best practices for repairs

When responding to users:
1. Be conversational yet professional
2. Demonstrate automotive expertise even in casual exchanges
3. Link topics back to safety and proper vehicle functioning when relevant
4. Provide genuinely helpful insights rather than just facts
5. Use technical terminology appropriately but explain it clearly

Always maintain your identity as a specialized automotive intelligence focused on ADAS systems. Your primary goal is to ensure vehicles are repaired correctly with properly functioning safety systems.
"""

@app.route('/')
def index():
    # Ensure user_id is set in session when a user first accesses the app
    if 'user_id' not in session:
        # Generate a unique user ID if not already in session
        session['user_id'] = 'anonymous'
        print(f"DEBUG: Set new user_id in session: {session['user_id']}")
    else:
        print(f"DEBUG: Using existing user_id from session: {session['user_id']}")
    
    return render_template('index.html')

@app.route('/static/<path:path>')
def serve_static(path):
    return send_from_directory('static', path)

def format_calibration_info(results, selected_system=None, collision_area=None, all_systems=None, requested_year=None):
    """Format calibration information in clean Markdown structure.
    
    Args:
        results: The database query results
        selected_system: Optional primary system to filter results by
        collision_area: Optional collision area to filter results by (front, rear, side)
        all_systems: Optional list of systems to include in the results (overrides selected_system)
        requested_year: Optional originally requested year that might differ from the data
    """
    print(f"DEBUG: Formatting calibration info with selected_system='{selected_system}', collision_area='{collision_area}', all_systems={all_systems}")
    systems = {}
    
    # Check if results include a note about using non-exact year match
    has_fallback_note = False
    fallback_note = ""
    original_results = results  # Save the original results object
    
    # Handle the case where results is a dictionary with data and note
    if isinstance(results, dict):
        if 'note' in results:
            has_fallback_note = True
            fallback_note = results.get('note', '')
        
        # Update results to just the data array
        if 'data' in results:
            results = results.get('data', [])
        # If 'data' isn't present but 'found' is, this might be the entire results object
        elif 'found' in results:
            print(f"DEBUG: Results object has 'found' but no 'data'. Using original object.")
            results = original_results
    
    # Ensure results is iterable before proceeding
    if not isinstance(results, list):
        print(f"DEBUG: Results is not a list: {type(results)}. Converting to list.")
        if isinstance(results, dict):
            # If it's still a dict at this point, it might be a single result
            results = [results]
        else:
            # If it's something else entirely, return an error message
            return f"Error: Unable to process results of type {type(results)}"
    
    # Format years to remove decimals
    if results and len(results) > 0:
        for row in results:
            # Skip non-dict rows
            if not isinstance(row, dict):
                print(f"DEBUG: Skipping non-dict row: {row}")
                continue
                
            if 'year' in row and row['year']:
                try:
                    # Remove decimal from year if present
                    if isinstance(row['year'], str) and '.' in row['year']:
                        row['year'] = row['year'].split('.')[0]
                    elif isinstance(row['year'], (int, float)):
                        row['year'] = str(int(row['year']))
                except (ValueError, TypeError):
                    pass  # Keep original if conversion fails
    
    # First pass: Collect only actual systems (cameras, radars, sensors)
    for row in results:
        # Skip non-dict rows
        if not isinstance(row, dict):
            print(f"DEBUG: Skipping non-dict row during system collection: {row}")
            continue
            
        component = row.get('parent_component', '')
        cal_type = row.get('calibration_type', '')
        
        # Skip invalid entries
        if not component or str(component).lower() in ['nan', 'none'] or not cal_type or str(cal_type).lower() in ['nan', 'none']:
            continue

        # Check if we should include this system based on selected systems
        should_include = True
        
        # If multiple systems are specified, check against the list
        if all_systems and len(all_systems) > 0 and 'All Systems' not in all_systems:
            # Check if this component matches any of the specified systems
            should_include = False
            for sys in all_systems:
                if (sys and str(component).lower() == str(sys).lower() or 
                    str(component).lower().startswith(str(sys).lower())):
                    should_include = True
                    break
        # Otherwise, use the traditional single system filter
        elif selected_system and selected_system != "" and selected_system != "All Systems":
            if str(component).lower() != str(selected_system).lower() and not str(component).lower().startswith(str(selected_system).lower()):
                should_include = False
            
        # Skip this component if it doesn't match our filter criteria
        if not should_include:
            continue
            
        # Only add if it's a main system (camera, radar, sensor)
        if any(sys_type in str(component).lower() for sys_type in ['camera', 'radar', 'sensor', 'lidar']):
            if component not in systems:
                service_info = row.get('service_information_hyperlink', '')
                if not service_info or str(service_info).lower() in ['nan', 'none', 'null', 'na', '']:
                    service_info = row.get('oe_glass_service_info_hyperlink', '')
                
                # Get impact areas (for collision relevance)
                impact_areas = []
                poi = row.get('point_of_impact_', '')
                if poi and str(poi).lower() not in ['nan', 'none', 'null', 'na', '']:
                    impact_areas = [area.strip() for area in str(poi).split(',')]
                
                systems[component] = {
                    'calibration_type': cal_type,
                    'requirements': set(),  # Using set to avoid duplicates
                    'service_info': service_info,
                    'impact_areas': impact_areas
                }
                
                # Add initial requirements if present
                prereqs = row.get('calibration_prerequisites_short_hand', '')
                if prereqs and str(prereqs).lower() not in ['nan', 'none', 'null']:
                    # Clean up the requirements text
                    prereqs = (str(prereqs).replace('1.', '')
                                  .replace('2.', '')
                                  .replace('3.', '')
                                  .replace('4.', '')
                                  .replace('No Pre-Quals', 'No prerequisites required')
                                  .replace('No Pre-quals', 'No prerequisites required'))
                    
                    # Split by commas and clean each requirement
                    for req in prereqs.split(','):
                        clean_req = req.strip()
                        if clean_req and clean_req.lower() not in ['nan', 'none', 'null']:
                            systems[component]['requirements'].add(clean_req)
    
    # For each row, check if it's a requirement and add it to the appropriate system
    for row in results:
        # Skip non-dict rows
        if not isinstance(row, dict):
            print(f"DEBUG: Skipping non-dict row during requirements collection: {row}")
            continue
            
        component = row.get('parent_component', '')
        
        # Skip if this is a main system row or invalid component
        if not component or str(component).lower() in ['nan', 'none'] or any(sys_type in str(component).lower() 
               for sys_type in ['camera', 'radar', 'sensor', 'lidar']):
            continue
            
        # Check if this looks like a requirement
        requirement_keywords = [
            'cargo', 'passenger', 'fuel', 'ride height', 'alignment', 'bumper',
            'level ground', 'empty', 'unmodified', 'r&i', 'remove', 'install'
        ]
        
        if any(keyword in str(component).lower() for keyword in requirement_keywords):
            # Find which system this requirement belongs to
            # Default to the first radar/camera system
            target_system = None
            for sys_name in systems:
                if 'radar' in sys_name.lower():
                    target_system = sys_name
                    break
                elif 'camera' in sys_name.lower():
                    target_system = sys_name
            
            # Add to the target system's requirements
            if target_system:
                systems[target_system]['requirements'].add(component)
    
    # If no valid systems found, return appropriate message
    if not systems:
        return "No ADAS systems requiring calibration were found for this vehicle."
    
    # Get vehicle info from first result
    if results and len(results) > 0:
        # Ensure first row is a dict
        first_row = results[0]
        if not isinstance(first_row, dict):
            print(f"DEBUG: First row is not a dict: {first_row}")
            # Try to find the first dict row
            for row in results:
                if isinstance(row, dict):
                    first_row = row
                    break
            else:
                # If no dict rows found, use empty values
                first_row = {}
        
        year = first_row.get('year', '')
        make = first_row.get('make', '')
        model = first_row.get('model', '')
        
        print(f"DEBUG: Vehicle info from results - Year: '{year}', Make: '{make}', Model: '{model}'")
        
        # Remove decimal point from year if present
        if year and isinstance(year, str) and '.' in year:
            year = year.split('.')[0]
        elif year and isinstance(year, (int, float)):
            year = str(int(year))
            
        vehicle = f"{year} {make} {model}"
        print(f"DEBUG: Final vehicle string for display: '{vehicle}'")

        # If we have a requested year that's different from the data's year, show both
        if requested_year and str(requested_year) != str(year):
            print(f"DEBUG: Using data from year {year} to display for requested year {requested_year}")
            # Save the original vehicle title
            data_vehicle = vehicle
            # Create a more descriptive title that includes both years
            vehicle = f"{requested_year} {make} {model} ADAS Calibration Requirements"
            # Ensure the fallback note is set
            if not has_fallback_note:
                has_fallback_note = True
                fallback_note = f"Note: Showing data for {data_vehicle} as the closest match for your {requested_year} {make} {model} query."
    else:
        vehicle = "Vehicle"
    
    # Organize systems by location (front, side, rear, etc.)
    front_systems = {}
    rear_systems = {}
    side_systems = {}
    other_systems = {}
    
    for component, info in systems.items():
        comp_lower = component.lower()
        # More comprehensive classification of systems by location
        if any(term in comp_lower for term in ['front', 'forward', 'windshield', 'fwd', 'front-facing', 
                                              'forward collision', 'fcw', 'aeb', 'ffc', 'front camera',
                                              'automatic emergency braking']):
            front_systems[component] = info
            print(f"DEBUG: Classified as FRONT system: {component}")
        elif any(term in comp_lower for term in ['rear', 'back', 'backup', 'rearview', 'rear-facing', 
                                                'back-up', 'reverse', 'trunk', 'tailgate', 'rcta', 
                                                'rear cross traffic', 'rear camera']):
            rear_systems[component] = info
            print(f"DEBUG: Classified as REAR system: {component}")
        elif any(term in comp_lower for term in ['side', 'blind spot', 'bsm', 'blind-spot', 'lane', 
                                                'ldw', 'lka', 'lkas', 'door', 'mirror', 'blis']):
            side_systems[component] = info
            print(f"DEBUG: Classified as SIDE system: {component}")
        else:
            other_systems[component] = info
            print(f"DEBUG: Classified as OTHER system: {component}")
    
    # Build response as HTML directly for better table control
    formatted_response = f"""
    <div class="calibration-results">
      <h2>{vehicle}</h2>
    """
    
    # Display fallback note if present
    if has_fallback_note and fallback_note:
        formatted_response += f"""
        <div class="alert alert-warning" style="background-color: #fff3cd; color: #856404; padding: 12px; margin: 15px 0; border-radius: 5px; border-left: 5px solid #ffeeba; font-weight: bold;">
            <strong>⚠️ Important:</strong> {fallback_note}
        </div>
        """
    
    # Show info about what's being displayed
    if collision_area:
        formatted_response += f"<p>Showing calibration requirements for <strong>{collision_area} collision</strong> impact areas.</p>"
    elif all_systems and len(all_systems) > 0:
        if 'All Systems' in all_systems:
            formatted_response += "<p>Showing calibration requirements for <strong>all ADAS systems</strong>.</p>"
        elif len(all_systems) == 1:
            formatted_response += f"<p>Showing calibration requirements for: <strong>{all_systems[0]}</strong></p>"
        else:
            formatted_response += f"<p>Showing calibration requirements for multiple systems: <strong>{', '.join(all_systems)}</strong></p>"
    elif selected_system:
        formatted_response += f"<p>Showing calibration requirements for: <strong>{selected_system}</strong></p>"
    else:
        formatted_response += "<p>The following systems may require calibration based on the damage area:</p>"
    
    # Function to format a table of systems
    def format_systems_table(title, systems_dict):
        if not systems_dict:
            return ""
            
        table_html = f"""
        <h3>{title}</h3>
        <table class="calibration-table">
          <thead>
            <tr>
              <th>System</th>
              <th>Calibration Type</th>
              <th>Requirements</th>
              <th>Service Info</th>
            </tr>
          </thead>
          <tbody>
        """
        
        # Sort systems for consistent output
        for component in sorted(systems_dict.keys()):
            info = systems_dict[component]
            
            # Get calibration type with indicator
            cal_type = str(info['calibration_type']).lower()
            if cal_type == 'static':
                cal_indicator = "Static ⚫"
            elif cal_type == 'dynamic':
                cal_indicator = "Dynamic 🔵"
            elif cal_type in ['p&p', 'plug & play']:
                cal_indicator = "Plug & Play 🟢"
                # Override requirements for Plug & Play systems
                info['requirements'] = set(['No prerequisites required'])
            else:
                cal_indicator = info['calibration_type']
            
            # Filter requirements (remove actual systems)
            valid_reqs = {req for req in info['requirements'] 
                         if not any(sys_type in str(req).lower() 
                                   for sys_type in ['camera', 'radar', 'sensor', 'lidar'])}
            
            if not valid_reqs:
                valid_reqs = {'No prerequisites required'}
            
            # Create HTML for requirements with proper closing tags
            req_html = '<ul>'
            sorted_reqs = sorted(valid_reqs)
            if len(sorted_reqs) == 1:
                # If only one requirement, just add it directly
                req_html += f'<li>{sorted_reqs[0]}</li>'
            else:
                # For multiple requirements, separate them with line breaks within one list item
                req_html += '<li>' + '</li><li>'.join(sorted_reqs) + '</li>'
            req_html += '</ul>'
            
            # Add service info link if available
            service_info_html = "Not available"
            if 'service_info' in info and info['service_info'] and str(info['service_info']).lower() not in ['nan', 'none', 'null', 'na', '']:
                service_info_html = f'<a href="{info["service_info"]}" target="_blank" rel="noopener noreferrer">View Procedure</a>'
            
            # Add row to table
            table_html += f"""
              <tr>
                <td>{component}</td>
                <td>{cal_indicator}</td>
                <td>{req_html}</td>
                <td>{service_info_html}</td>
              </tr>
            """
        
        # Close the table
        table_html += """
            </tbody>
          </table>
        """
        return table_html
    
    # Add tables for each location based on collision area if specified
    if collision_area:
        print(f"DEBUG: Filtering systems by collision area: {collision_area}")
        print(f"DEBUG: Available systems - Front: {len(front_systems)}, Rear: {len(rear_systems)}, Side: {len(side_systems)}, Other: {len(other_systems)}")
        
        if collision_area.lower() == 'front':
            if front_systems:
                print(f"DEBUG: Showing {len(front_systems)} front impact systems")
                formatted_response += format_systems_table("Front Impact Systems", front_systems)
            else:
                print(f"DEBUG: No front impact systems found")
                formatted_response += "<p>No front impact systems requiring calibration were found for this vehicle.</p>"
        elif collision_area.lower() == 'rear':
            if rear_systems:
                print(f"DEBUG: Showing {len(rear_systems)} rear impact systems")
                formatted_response += format_systems_table("Rear Impact Systems", rear_systems)
            else:
                print(f"DEBUG: No rear impact systems found")
                formatted_response += "<p>No rear impact systems requiring calibration were found for this vehicle.</p>"
        elif collision_area.lower() == 'side':
            if side_systems:
                print(f"DEBUG: Showing {len(side_systems)} side impact systems")
                formatted_response += format_systems_table("Side Impact Systems", side_systems)
            else:
                print(f"DEBUG: No side impact systems found")
                formatted_response += "<p>No side impact systems requiring calibration were found for this vehicle.</p>"
    else:
        # Show all areas if no specific collision area was specified
        print(f"DEBUG: No collision area specified, showing all systems")
        if front_systems:
            formatted_response += format_systems_table("Front Impact Systems", front_systems)
        
        if rear_systems:
            formatted_response += format_systems_table("Rear Impact Systems", rear_systems)
            
        if side_systems:
            formatted_response += format_systems_table("Side Impact Systems", side_systems)
            
        if other_systems:
            formatted_response += format_systems_table("Other Systems", other_systems)
    
    # Add note about OEM procedures
    formatted_response += """
    <div class="important-note">
      <p><strong>Important Note:</strong> Always refer to manufacturer-specific procedures and requirements for accurate calibration information. 
      Use the service information links when available for detailed procedures. 
      This information is a guide only and specific procedures may vary by trim level and equipment.</p>
    </div>
    """
    
    formatted_response += "</div>"
    
    return formatted_response

# After the imports, add a conversation history store
conversation_history = {}
# Add a store for the last vehicle info to maintain context
last_vehicle_info = {}

@socketio.on('connect')
def handle_connect():
    """Initialize conversation history for new connections"""
    session_id = request.sid
    print(f"DEBUG: New client connected with session_id: {session_id}")
    
    # Initialize empty conversation history for this session
    conversation_history[session_id] = []
    last_vehicle_info[session_id] = None
    
    # Don't automatically create a new chat - just initialize the session
    print(f"New connection: {session_id}, no chat created")
    
    # Do not emit a current chat ID, as none exists yet

@socketio.on('disconnect')
def handle_disconnect():
    """Clean up conversation history on disconnect"""
    session_id = request.sid
    if session_id in conversation_history:
        del conversation_history[session_id]
    if session_id in last_vehicle_info:
        del last_vehicle_info[session_id]
    print(f"Client disconnected: {session_id}")

@socketio.on('select_chat')
def handle_select_chat(data):
    """Handle when a user selects a different chat"""
    session_id = request.sid
    chat_id = data.get('chat_id')
    
    if not chat_id:
        print(f"DEBUG: No chat_id provided in select_chat event")
        return
    
    print(f"DEBUG: Handling select_chat for {chat_id}")
        
    # Load the chat history
    messages = get_chat_messages(chat_id)
    print(f"DEBUG: Retrieved {len(messages)} messages for chat {chat_id}")
    
    # Convert to our internal format for conversation_history
    conversation_history[session_id] = [
        {'role': msg['role'], 'message': msg['content']} 
        for msg in messages
    ]
    
    # Update the session
    session['chat_id'] = chat_id
    
    # Send the chat history to the client
    socketio.emit('chat_history', {
        'messages': messages,
        'chat_id': chat_id
    }, room=session_id)
    
    print(f"DEBUG: Sent {len(messages)} messages to client for chat {chat_id}")

def extract_last_vehicle_from_history(history):
    """Extract the most recent vehicle information from conversation history"""
    if not history:
        return None
    
    most_recent_vehicle = None
        
    # Process messages in reverse order (most recent first)
    for message in reversed(history):
        # Only process user messages (they contain the queries)
        if message['role'] == 'user':
            vehicle_info = extract_vehicle_info(message['message'])
            
            # If we find any vehicle information, merge it with what we've found so far
            if vehicle_info['make'] or vehicle_info['model'] or vehicle_info['year']:
                if most_recent_vehicle is None:
                    most_recent_vehicle = vehicle_info
                    print(f"DEBUG: Initial vehicle from history: {vehicle_info}")
                else:
                    # Fill in missing information from earlier messages
                    if not most_recent_vehicle['make'] and vehicle_info['make']:
                        most_recent_vehicle['make'] = vehicle_info['make']
                    if not most_recent_vehicle['model'] and vehicle_info['model']:
                        most_recent_vehicle['model'] = vehicle_info['model']
                    if not most_recent_vehicle['year'] and vehicle_info['year']:
                        most_recent_vehicle['year'] = vehicle_info['year']
                    print(f"DEBUG: Updated vehicle from history: {most_recent_vehicle}")
                
                # If we have complete information, we can stop
                if most_recent_vehicle['make'] and most_recent_vehicle['model'] and most_recent_vehicle['year']:
                    break
    
    return most_recent_vehicle

@socketio.on('message')
def handle_message(data):
    try:
        # Get user message and session ID
        user_message = data['message']
        session_id = request.sid
        
        # Initialize has_vehicle_in_message variable to prevent UnboundLocalError
        has_vehicle_in_message = False
        # Initialize vehicle_info_to_use to prevent UnboundLocalError
        vehicle_info_to_use = None
        # Initialize collision_area 
        collision_area = None
        # Initialize flags to track source of vehicle information
        info_from_current_message = {
            'year': False,
            'make': False, 
            'model': False
        }
        
        # Get chat_id from message data if provided (client-side creation), otherwise use session
        chat_id = data.get('chat_id')
        if not chat_id:
            chat_id = session.get('chat_id')
        
        # Get vehicle context from the frontend if available
        vehicle_context = data.get('vehicleContext', {})
        
        if not chat_id:
            # Create a new chat if not exists
            user_id = session.get('user_id', 'anonymous') 
            chat_id = create_new_chat(user_id)
            session['chat_id'] = chat_id
        else:
            # Update the session with the chat ID from the message
            session['chat_id'] = chat_id
        
        print(f"DEBUG: Processing message for chat {chat_id}: {user_message[:50]}...")
        if vehicle_context:
            print(f"DEBUG: Vehicle context: {vehicle_context}")
        
        # Initialize conversation history for this session if it doesn't exist
        if session_id not in conversation_history:
            conversation_history[session_id] = []
        
        # Initialize last_vehicle_info for this session if it doesn't exist
        if session_id not in last_vehicle_info:
            last_vehicle_info[session_id] = None
            
        # Store user message in conversation history
        conversation_history[session_id].append({
            'role': 'user',
            'message': user_message
        })
        
        # Save the message to the database
        save_message(chat_id, 'user', user_message)
        
        # Helper function to save assistant responses and avoid code duplication
        def save_assistant_response(response_text):
            # Save to conversation history
            conversation_history[session_id].append({
                'role': 'assistant',
                'message': response_text
            })
            
            # Save to database
            save_message(chat_id, 'assistant', response_text)
        
        # Helper function to send response to client
        def send_response(response_text, context="", is_markdown=True):
            # Check if this is HTML content that needs special handling
            is_html = False
            if response_text.startswith('<div') or response_text.startswith('<table') or '<h2>' in response_text:
                is_html = True
                is_markdown = False
                print(f"DEBUG: Detected HTML content in response, setting is_html=True and is_markdown=False")
            
            # Save the response first
            save_assistant_response(response_text)
            
            # Then emit to client
            print(f"DEBUG: Sending response with isHTML={is_html}, isMarkdown={is_markdown}")
            socketio.emit('response', {
                'message': response_text,
                'context': context,
                'isMarkdown': is_markdown,
                'isHTML': is_html
            }, room=session_id)
            
            return True  # Return success flag to caller
        
        # First determine if this is a vehicle/ADAS question
        is_vehicle_question = is_adas_query(user_message)
        
        # Extract vehicle information from the current message first
        message_vehicle_info = extract_vehicle_info(user_message)
        print(f"DEBUG: Extracted vehicle info from current message: {message_vehicle_info}")
        
        # Track if we found vehicle info in this message
        message_has_vehicle = bool(message_vehicle_info['make'] or message_vehicle_info['model'] or message_vehicle_info['year'])
        has_vehicle_in_message = message_has_vehicle
        
        # Set which vehicle information came from the current message
        if message_vehicle_info['year']:
            info_from_current_message['year'] = True
        if message_vehicle_info['make']:
            info_from_current_message['make'] = True
        if message_vehicle_info['model']:
            info_from_current_message['model'] = True
            
        # Create a vehicle info object that will be used, starting with message extraction
        current_vehicle_info = {
            'year': message_vehicle_info['year'],
            'make': message_vehicle_info['make'],
            'model': message_vehicle_info['model'],
            'component': message_vehicle_info['component'],
            'all_systems': []
        }
        
        # Now handle dropdown context - only using it for fields not found in message
        if vehicle_context and (any(vehicle_context.get(key) for key in ['year', 'make', 'model']) or vehicle_context.get('systems')):
            print(f"DEBUG: Processing vehicle context from dropdowns")
            
            # Check for explicit flags indicating text-extracted values
            year_from_text = vehicle_context.get('yearFromText', False)
            make_from_text = vehicle_context.get('makeFromText', False)
            model_from_text = vehicle_context.get('modelFromText', False)
            
            # Only use dropdown values for fields not found in the message
            # Note: text extraction in frontend has priority over our backend extraction
            if not current_vehicle_info['year'] or not info_from_current_message['year']:
                if year_from_text:
                    print(f"DEBUG: Using year explicitly mentioned in text (from frontend): {vehicle_context.get('year')}")
                    current_vehicle_info['year'] = vehicle_context.get('year')
                    info_from_current_message['year'] = True
                elif vehicle_context.get('year'):
                    current_vehicle_info['year'] = vehicle_context.get('year')
                    print(f"DEBUG: Using year from previous context: {current_vehicle_info['year']}")
            
            if not current_vehicle_info['make'] or not info_from_current_message['make']:
                if make_from_text:
                    print(f"DEBUG: Using make explicitly mentioned in text (from frontend): {vehicle_context.get('make')}")
                    current_vehicle_info['make'] = vehicle_context.get('make')
                    info_from_current_message['make'] = True
                elif vehicle_context.get('make'):
                    current_vehicle_info['make'] = vehicle_context.get('make')
                    print(f"DEBUG: Using make from previous context: {current_vehicle_info['make']}")
            
            if not current_vehicle_info['model'] or not info_from_current_message['model']:
                if model_from_text:
                    print(f"DEBUG: Using model explicitly mentioned in text (from frontend): {vehicle_context.get('model')}")
                    current_vehicle_info['model'] = vehicle_context.get('model')
                    info_from_current_message['model'] = True
                elif vehicle_context.get('model'):
                    current_vehicle_info['model'] = vehicle_context.get('model')
                    print(f"DEBUG: Using model from previous context: {current_vehicle_info['model']}")
            
            # Handle multiple systems
            if vehicle_context.get('systems') and len(vehicle_context.get('systems')) > 0:
                systems = vehicle_context.get('systems')
                # Store all systems
                current_vehicle_info['all_systems'] = systems
                
                # For backward compatibility with existing code, set component to first non-"All Systems" system or "All Systems" if that's the only one
                if 'All Systems' in systems and len(systems) == 1:
                    current_vehicle_info['component'] = 'All Systems'
                else:
                    # Get first non-"All Systems" system if available
                    non_all_systems = [s for s in systems if s != 'All Systems']
                    if non_all_systems:
                        current_vehicle_info['component'] = non_all_systems[0]
                    elif systems:
                        current_vehicle_info['component'] = systems[0]
            
            # Check for POI information in the vehicle context
            poi_areas = vehicle_context.get('poi_areas', [])
            
            # Determine primary collision area if POIs are selected
            if poi_areas:
                print(f"DEBUG: POI areas selected: {poi_areas}")
                # Prioritize areas in this order: front, rear, side, other
                if 'front' in poi_areas:
                    collision_area = 'front'
                elif 'rear' in poi_areas:
                    collision_area = 'rear'
                elif 'side' in poi_areas:
                    collision_area = 'side'
                elif len(poi_areas) > 0:
                    collision_area = poi_areas[0]  # Use the first one if none of the priority areas
                
                print(f"DEBUG: Primary collision area determined: {collision_area}")
        
        # Update has_vehicle_in_message based on the combined info
        has_vehicle_in_message = bool(current_vehicle_info['make'] or current_vehicle_info['model'] or current_vehicle_info['year'])
        
        # Set vehicle_info_to_use to prevent UnboundLocalError
        vehicle_info_to_use = current_vehicle_info
        
        # Store the combined info in last_vehicle_info
        last_vehicle_info[session_id] = current_vehicle_info
        print(f"DEBUG: Updated vehicle context: {current_vehicle_info}")
        print(f"DEBUG: Info sources - Year from message: {info_from_current_message['year']}, Make from message: {info_from_current_message['make']}, Model from message: {info_from_current_message['model']}")
        
        # If the user is asking about the vehicle, use the vehicle context to respond
        if is_vehicle_question:
            make = current_vehicle_info['make']
            model = current_vehicle_info['model']
            year = current_vehicle_info['year']
            
            print(f"DEBUG: Vehicle query with Year: '{year}', Make: '{make}', Model: '{model}'")
            
            # Get primary system for database query
            system = current_vehicle_info['component']
            
            # Store all selected systems for potential multi-system query
            all_systems = current_vehicle_info.get('all_systems', [system] if system else [])
        
            # Check for collision area mentions in the message if not already determined from POI
            if not collision_area:
                user_message_lower = user_message.lower()
                # Check for specific collision areas with more comprehensive pattern matching
                if any(term in user_message_lower for term in ['front collision', 'front end', 'front damage', 'hit in the front', 'front impact', 
                                                             'hit from front', 'damaged in front', 'front bumper', 'front of vehicle', 'forward collision']):
                    collision_area = 'front'
                    print(f"DEBUG: Detected front collision area from query: '{user_message}'")
                elif any(term in user_message_lower for term in ['rear collision', 'rear end', 'rear damage', 'hit in the rear', 'rear impact',
                                                               'hit from behind', 'back end', 'hit in the back', 'back impact', 'back of vehicle', 
                                                               'rear bumper', 'bumper damage', 'rear of vehicle', 'back damage', 'tailgate']):
                    collision_area = 'rear'
                    print(f"DEBUG: Detected rear collision area from query: '{user_message}'")
                elif any(term in user_message_lower for term in ['side collision', 'side damage', 'hit on the side', 'side impact',
                                                               'side of vehicle', 'passenger side', 'driver side', 't-bone', 't bone']):
                    collision_area = 'side'
                    print(f"DEBUG: Detected side collision area from query: '{user_message}'")
            
            # Check for incomplete information
            missing_info = []
            if not make:
                missing_info.append("make")
            if not model:
                missing_info.append("model")
            if not year:
                missing_info.append("year")
            
            # Add transparency about assumed information
            assumed_info = []
            if make and not info_from_current_message['make']:
                assumed_info.append(f"make ({make})")
            if model and not info_from_current_message['model']:
                assumed_info.append(f"model ({model})")
            if year and not info_from_current_message['year']:
                assumed_info.append(f"year ({year})")
            
            # Check if asking about production years
            year_keywords = ['what years', 'years made', 'production years', 'when was', 'how long', 'still made', 'discontinued']
            query_type = "years" if any(keyword in user_message.lower() for keyword in year_keywords) else "general"
            
            # Check if user wants a table format
            wants_table = any(keyword in user_message.lower() for keyword in ['table', 'chart', 'tabular', 'spreadsheet', 'list of', 'make a table', 'create a table'])
            table_format = None
            
            if wants_table:
                if any(word in user_message.lower() for word in ['calibration', 'requirements', 'prerequisites']):
                    table_format = "calibration"
                elif any(word in user_message.lower() for word in ['hit', 'impact', 'collision', 'crash', 'accident', 'damage']):
                    table_format = "impact"
                else:
                    table_format = "general"
                
            if make or model:
                # Try database lookup
                print(f"DEBUG: Performing database lookup with Year: '{year}', Make: '{make}', Model: '{model}'")
                result = query_vehicle_database(make, model, year)
                
                if result["found"]:
                    print(f"DEBUG: Found vehicle data in database. Data year: {result['data'][0].get('year') if result['data'] else 'unknown'}")
                    
                    # Add a note about assumed information if needed
                    if assumed_info:
                        assumed_note = f"Note: I'm using the {', '.join(assumed_info)} from your previous query, as you didn't specify this in your current question."
                        # Add the note to the result
                        if isinstance(result, dict) and 'note' not in result:
                            result = {"data": result["data"], "found": True, "note": assumed_note}
                        
                    # Format response with calibration info - pass all_systems parameter
                    response = format_calibration_info(result["data"], vehicle_info_to_use.get('component'), collision_area, all_systems=all_systems, requested_year=year)
                    send_response(response, is_markdown=False)  # Send as HTML for better formatting
                    return
                else:
                    # Try a more flexible search without year constraint
                    if year:
                        print(f"DEBUG: Trying ADAS request again without year constraint for {make} {model}")
                        result = query_vehicle_database(make, model, None)
                        if result["found"]:
                            print(f"DEBUG: Found vehicle with flexible year search. Data year: {result['data'][0].get('year') if result['data'] else 'unknown'}")
                            
                            # Build note combining year flexibility and assumed information
                            note_parts = []
                            if assumed_info:
                                note_parts.append(f"I'm using the {', '.join(assumed_info)} from your previous query, as you didn't specify this in your current question.")
                            
                            note_parts.append(f"I couldn't find specific information for a {year} {make} {model}, so I'm showing you information for a similar year.")
                            note = "Note: " + " ".join(note_parts)
                            
                            result_with_note = {"data": result["data"], "found": True, "note": note}
                            # Pass all_systems parameter here too
                            response = format_calibration_info(result_with_note, vehicle_info_to_use.get('component'), collision_area, all_systems=all_systems, requested_year=year)
                            send_response(response, is_markdown=False)
                            return
                    
                    # Add a note about assumed information to the fallback response
                    if assumed_info:
                        missing_info.append("_assumed_info")  # Special flag for provide_vehicle_info
                    
                    # Call provide_vehicle_info with missing and assumed info
                    # Pass the original user message to help with web-based information retrieval
                    response = provide_vehicle_info(make, model, year, query_type, wants_table, table_format, 
                                                   missing_info=missing_info, assumed_info=assumed_info, user_message=user_message)
                    send_response(response)
                    return
            else:
                # No make or model, call provide_vehicle_info with missing and assumed info
                # Pass the original user message to help with web-based information retrieval
                response = provide_vehicle_info(make, model, year, query_type, wants_table, table_format, 
                                               missing_info=missing_info, assumed_info=assumed_info, user_message=user_message)
                send_response(response)
                return
        
        # Get recent conversation for context (last 5 messages)
        recent_msgs = conversation_history[session_id][-5:] if conversation_history[session_id] else []
        context_text = "\n".join([f"{'User' if msg['role'] == 'user' else 'Assistant'}: {msg['message']}" 
                              for msg in recent_msgs])
        
        # Create a descriptive chat name based on the vehicle and query content
        if last_vehicle_info[session_id]:
            current_context = last_vehicle_info[session_id]
            year_str = current_context.get('year', '')
            make_str = current_context.get('make', '')
            model_str = current_context.get('model', '')
            
            # Add context based on message content
            context_suffix = ""
            if any(word in user_message.lower() for word in ['collision', 'crash', 'hit', 'accident', 'damage']):
                context_suffix = "Collision"
            elif any(word in user_message.lower() for word in ['calibration', 'calibrate', 'adas']):
                context_suffix = "Calibration"
            elif any(word in user_message.lower() for word in ['document', 'manual', 'service']):
                context_suffix = "Documentation"
            else:
                context_suffix = "Information"
            
            # Combine into a name, making sure to only add non-empty components
            chat_name_parts = []
            if year_str:
                chat_name_parts.append(year_str)
            if make_str:
                chat_name_parts.append(make_str)
            if model_str:
                chat_name_parts.append(model_str)
            if context_suffix:
                chat_name_parts.append(context_suffix)
                
            chat_name = " ".join(chat_name_parts).strip()
            
            # Only update the name if we have a meaningful name to use
            if chat_name and len(chat_name_parts) >= 2:
                update_chat_name(chat_id, chat_name)
                
                # Notify clients of the name change
                socketio.emit('chat_renamed', {
                    'chat_id': chat_id,
                    'new_name': chat_name
                })
                print(f"DEBUG: Updated chat name to: {chat_name}")
        
        # Check if user is asking about service info for a previously mentioned vehicle
        service_info_request = any(phrase in user_message.lower() for phrase in [
            'service info', 'service information', 'documentation', 'links',
            'service docs', 'give me the service', 'show me service', 'give me',
            'links for this vehicle', 'information links'
        ])
        
        if service_info_request and (has_vehicle_in_message or last_vehicle_info[session_id]):
            print(f"DEBUG: Detected service info request: '{user_message}'")
            
            # First check if there's a vehicle in the current message
            if has_vehicle_in_message:
                vehicle_info_to_use = current_vehicle_info
                print(f"DEBUG: Using vehicle from current message: {current_vehicle_info}")
            # Otherwise use the last mentioned vehicle if available
            elif last_vehicle_info[session_id]:
                vehicle_info_to_use = last_vehicle_info[session_id]
                print(f"DEBUG: Using last mentioned vehicle: {last_vehicle_info[session_id]}")
            else:
                print("DEBUG: No vehicle context found for service info request")
                send_response("I need to know which vehicle you're asking about. Please mention the make, model, and ideally the year of the vehicle you need service information for.")
                return
            
            # Extract vehicle information
            make = vehicle_info_to_use.get('make', '')
            model = vehicle_info_to_use.get('model', '')
            year = vehicle_info_to_use.get('year', '')
            
            print(f"DEBUG: Providing service info for: {year} {make} {model}")
            
            # Verify we have at least some vehicle information
            if not make and not model:
                send_response("I need to know which vehicle you're asking about. Please mention the make, model, and ideally the year of the vehicle you need service information for.")
                return
                
            # Get actual links from the database
            service_links = get_vehicle_service_links(make, model, year)
            
            # Start building a response
            response = f"## Service Information for {year} {make} {model}\n\n"
            
            # Add actual service links if found
            if service_links and len(service_links) > 0:
                print(f"DEBUG: Found {len(service_links)} specific service links for this vehicle")
                
                # Group links by component
                response += "### Vehicle-Specific Service Information\n\n"
                
                # First, group links by component and deduplicate
                component_groups = {}
                seen_urls = set()
                
                for link in service_links:
                    component = link.get('component', 'General')
                    url = link.get('url', '')
                    
                    # Skip if we've already seen this URL
                    if url in seen_urls:
                        print(f"DEBUG: Skipping duplicate URL: {url}")
                        continue
                        
                    # Add to seen URLs
                    seen_urls.add(url)
                    
                    # Add to component group
                    if component not in component_groups:
                        component_groups[component] = []
                    component_groups[component].append(link)
                
                # Display links grouped by component
                for component, links in component_groups.items():
                    # Skip None/null components
                    if not component or component in ['None', 'null', 'nan', 'NA']:
                        continue
                        
                    # Add component header
                    response += f"**{component}**\n"
                    
                    # Get unique links for this component (based on name)
                    seen_names = set()
                    filtered_links = []
                    
                    for link in links:
                        name = link.get('name', '')
                        # Skip duplicates by name within this component
                        if name in seen_names:
                            continue
                        seen_names.add(name)
                        filtered_links.append(link)
                    
                    # Add links for this component
                    for link in filtered_links:
                        response += f"* <a href='{link['url']}' target='_blank'>{link['name']}</a>\n"
                    
                    response += "\n"
                
                # Display any ungrouped links
                if 'General' in component_groups or None in component_groups:
                    response += "**General Service Information**\n"
                    
                    # Get all general links
                    general_links = component_groups.get('General', []) + component_groups.get(None, [])
                    
                    # Deduplicate general links
                    seen_general_names = set()
                    filtered_general_links = []
                    
                    for link in general_links:
                        name = link.get('name', '')
                        # Skip duplicates by name
                        if name in seen_general_names:
                            continue
                        seen_general_names.add(name)
                        filtered_general_links.append(link)
                    
                    # Add unique general links
                    for link in filtered_general_links:
                        response += f"* <a href='{link['url']}' target='_blank'>{link['name']}</a>\n"
                    
                    response += "\n"
            else:
                print(f"DEBUG: No specific service links found for {year} {make} {model}")
                
                # Add manufacturer-specific information based on the ACTUAL vehicle make
                response += "### Manufacturer Service Portals\n\n"
                make_lower = make.lower() if make else ""
                
                if make_lower in ['nissan', 'infiniti', 'datsun']:
                    response += "* <a href='https://www.nissan-techinfo.com/' target='_blank'>Nissan/Infiniti Technical Information Portal</a>\n"
                    response += "* <a href='https://www.nissan-techinfo.com/nissan/controller.aspx?type=com.nissan.sbs.ui.rich.staticContent.StaticContentAction&id=start&region=nissan&mkt=NANADS' target='_blank'>Nissan/Infiniti ADAS Calibration Information</a>\n"
                
                elif make_lower in ['toyota', 'lexus', 'scion']:
                    response += "* <a href='https://techinfo.toyota.com/' target='_blank'>Toyota/Lexus Technical Information</a>\n"
                    response += "* <a href='https://techinfo.toyota.com/techInfoPortal/appmanager/t3/ti' target='_blank'>Toyota/Lexus Repair Procedures</a>\n"
                
                elif make_lower in ['honda', 'acura']:
                    response += "* <a href='https://techinfo.honda.com/' target='_blank'>Honda/Acura Service Information</a>\n"
                    response += "* <a href='https://techinfo.honda.com/rjanisis/logon.aspx' target='_blank'>Honda/Acura ADAS Specifications</a>\n"
                
                elif make_lower in ['ford', 'lincoln', 'mercury']:
                    response += "* <a href='https://www.motorcraftservice.com/' target='_blank'>Ford/Lincoln/Mercury Service Information</a>\n"
                    response += "* <a href='https://www.fordtechservice.dealerconnection.com/' target='_blank'>Ford Professional Technician Society</a>\n"
                
                elif make_lower in ['chevrolet', 'gmc', 'buick', 'cadillac', 'gm']:
                    response += "* <a href='https://www.acdelcotechconnect.com/' target='_blank'>GM Service Information</a>\n"
                    response += "* <a href='https://www.acdelcotds.com/' target='_blank'>GM Technical Delivery System</a>\n"
                
                else:
                    # For any other make, provide general resources
                    response += "* <a href='https://www.alldata.com/' target='_blank'>ALLDATA Repair Information</a>\n"
                    response += "* <a href='https://www.mitchellsupport.com/' target='_blank'>Mitchell Repair Information</a>\n"
            
            # Always add general ADAS resources
            response += "\n## General ADAS Calibration Resources\n\n"
            response += "* <a href='https://www.i-car.com/s/repairability-technical-support' target='_blank'>I-CAR Repairability Technical Support Portal</a>\n"
            response += "* <a href='https://www.hunter.com/adas' target='_blank'>Hunter Engineering ADAS Resources</a>\n"
            response += "* <a href='https://www.autel.com/adas/' target='_blank'>Autel ADAS Calibration Information</a>\n"
            
            # Add a note about ADAS calibration procedures if the user specifically asked about them
            if any(term.lower() in user_message.lower() for term in ['calibration', 'procedures', 'how to', 'steps']):
                response += "\n## ADAS Calibration Notes\n\n"
                response += "For specific calibration procedures, you'll need to access the service information portal for your vehicle. "
                response += "Most manufacturers require a subscription to access detailed calibration procedures. "
                response += "The links above will take you to the official service information where you can find these procedures.\n"
            
            send_response(response)
            return
        
        # Check if user is asking about ADAS systems for a specific vehicle
        adas_request = any(phrase in user_message.lower() for phrase in [
            'adas systems', 'what systems', 'what adas', 'what features',
            'safety systems', 'driver assistance', 'what does it have',
            'all systems', 'show me the systems', 'does it have',
            'calibration', 'need for', 'requirements'
        ])
        
        if adas_request and (has_vehicle_in_message or last_vehicle_info[session_id]):
            # Similar logic to use current or stored vehicle context
            vehicle_info_to_use = current_vehicle_info
            
            if not has_vehicle_in_message and last_vehicle_info[session_id]:
                print(f"DEBUG: Using stored vehicle context for ADAS info: {last_vehicle_info[session_id]}")
                vehicle_info_to_use = last_vehicle_info[session_id]
            
            make = vehicle_info_to_use.get('make', '')
            model = vehicle_info_to_use.get('model', '')
            year = vehicle_info_to_use.get('year', '')
            
            if make or model:
                # Try database lookup
                result = query_vehicle_database(make, model, year)
                
                if result["found"]:
                    # Format response with calibration info
                    # Get all_systems from vehicle_info_to_use if available
                    all_systems = vehicle_info_to_use.get('all_systems', [])
                    response = format_calibration_info(result["data"], vehicle_info_to_use.get('component'), collision_area, all_systems=all_systems, requested_year=year)
                    send_response(response, is_markdown=False)  # Send as HTML for better formatting
                    return
                else:
                    # Try a more flexible search without year constraint
                    if year:
                        print(f"DEBUG: Trying ADAS request again without year constraint for {make} {model}")
                        result = query_vehicle_database(make, model, None)
                        if result["found"]:
                            note = f"Note: I couldn't find specific information for a {year} {make} {model}, so I'm showing you information for a similar year."
                            result_with_note = {"data": result["data"], "found": True, "note": note}
                            # Get all_systems from vehicle_info_to_use if available
                            all_systems = vehicle_info_to_use.get('all_systems', [])
                            response = format_calibration_info(result_with_note, vehicle_info_to_use.get('component'), collision_area, all_systems=all_systems, requested_year=year)
                            send_response(response, is_markdown=False)
                            return
                    
                    # Use fallback with generic vehicle info
                    response = provide_vehicle_info(make, model, year, "general", True)
                    send_response(response)
                    return
        
        # Check if asking about the last vehicle mentioned
        if any(phrase in user_message.lower() for phrase in [
            'last vehicle', 'previous vehicle', 'what was the last', 
            'what vehicle did i', 'which vehicle', 'that vehicle'
        ]):
            if last_vehicle_info[session_id]:
                vehicle_data = last_vehicle_info[session_id]
                year_str = vehicle_data.get('year', '')
                make_str = vehicle_data.get('make', '')
                model_str = vehicle_data.get('model', '')
                
                vehicle_parts = []
                if year_str:
                    vehicle_parts.append(year_str)
                if make_str:
                    vehicle_parts.append(make_str)
                if model_str:
                    vehicle_parts.append(model_str)
                
                vehicle_str = " ".join(vehicle_parts)
                
                response = f"The last vehicle you asked about was the {vehicle_str}. What would you like to know about it?"
                send_response(response)
                return
            else:
                response = "You haven't asked about any specific vehicles in this session yet. How can I help you today?"
                send_response(response)
                return
        
        # Check for introduction greeting
        greetings = ['hello', 'hi', 'hey', 'greetings', 'start', 'help']
        if any(greeting in user_message.lower() for greeting in greetings) and len(user_message.split()) < 5:
            intro_message = """Hello! I'm Nicc AI, your ADAS calibration assistant. I can help with:

- Calibration requirements for specific vehicles
- ADAS system configurations
- Calibration procedures
- Service documentation
- General vehicle information

How can I assist you today?"""
            
            send_response(intro_message)
            return
        
        # For generic questions, use Gemini API if available, even if we have vehicle context
        # New approach: For non-vehicle questions, don't try to force the vehicle context
        
        # Use Gemini for general response
        if HAS_GEMINI_ACCESS and 'model' in globals() and globals()['model'] is not None:
            gemini_model = globals()['model']
            try:
                # Include vehicle context only if this appears to be a vehicle-related question
                vehicle_context_str = ""
                if is_vehicle_question and last_vehicle_info[session_id]:
                    v_info = last_vehicle_info[session_id]
                    v_parts = []
                    if v_info.get('year'):
                        v_parts.append(v_info.get('year'))
                    if v_info.get('make'):
                        v_parts.append(v_info.get('make'))
                    if v_info.get('model'):
                        v_parts.append(v_info.get('model'))
                    
                    if v_parts:
                        vehicle_context_str = f"The user previously mentioned a {' '.join(v_parts)}. If this is relevant, consider it in your response."
                
                prompt = f"""
                You are Nicc AI, a helpful assistant primarily focused on automotive ADAS systems,
                but you can also answer general knowledge questions.
                
                Previous conversation:
                {context_text}
                
                {vehicle_context_str}
                
                User Question: "{user_message}"
                
                Provide a helpful response to this question.
                """
                
                response = generate_content_with_retry(gemini_model, [prompt])
                return send_response(response.text)
            except Exception as e:
                print(f"Error with general Gemini response: {str(e)}")
                # Don't return here - fall through to fallback response
        
        # Fallback response if all else fails
        fallback = """I'm here to help with automotive ADAS systems and calibration. Please provide specific vehicle details (year, make, model) for the most accurate information. For general questions, I'll do my best to assist with any topic."""
        send_response(fallback)
    except Exception as e:
        print(f"Error in handle_message: {str(e)}")
        traceback.print_exc()  # Print the full error traceback for debugging
        try:
            # Attempt to send an error response to the client
            socketio.emit('error', {'message': 'An error occurred processing your message'}, room=session_id)
            
            # Also try to send a friendly response message
            fallback_msg = "I'm sorry, I encountered an error processing your request. Please try again or ask a different question."
            socketio.emit('response', {
                'message': fallback_msg,
                'isMarkdown': True,
                'isHTML': False
            }, room=session_id)
            
            # Try to save the error response in history
            if 'conversation_history' in locals() and session_id in conversation_history:
                conversation_history[session_id].append({
                    'role': 'assistant',
                    'message': fallback_msg
                })
                
                # Save to database if we have a chat_id
                if 'chat_id' in locals() and chat_id:
                    save_message(chat_id, 'assistant', fallback_msg)
        except Exception as inner_e:
            print(f"Error sending error response: {str(inner_e)}")

@app.route('/api/chats', methods=['GET'])
def get_chats_api():
    """API endpoint to get all chats"""
    try:
        # Get the user ID from the session
        user_id = session.get('user_id', 'anonymous')
        print(f"DEBUG: get_chats_api using user_id from session: {user_id}")
        
        # Get chats using the helper
        raw_chats = db_helper.get_chats(user_id)
        
        # Manually create a validated list of chats to ensure proper formatting
        valid_chats = []
        for chat in raw_chats:
            try:
                valid_chat = {
                    'chat_id': chat.get('chat_id', ''),
                    'chat_name': chat.get('chat_name', 'Unnamed Chat'),
                    'created_at': chat.get('created_at', ''),
                    'updated_at': chat.get('updated_at', ''),
                    'is_pinned': chat.get('is_pinned', False)
                }
                valid_chats.append(valid_chat)
            except:
                # Skip invalid chat objects
                continue
        
        # Create a properly formatted response
        response = {
            'success': True, 
            'chats': valid_chats
        }
        
        # Return in the expected format for the frontend
        return jsonify(response)
    except Exception as e:
        print(f"Error getting chats: {str(e)}")
        return jsonify({
            'success': False, 
            'error': str(e), 
            'chats': []
        })

@app.route('/api/chats/new', methods=['POST'])
def create_chat_api():
    """API endpoint to create a new chat"""
    try:
        # Get the user ID from the session
        user_id = session.get('user_id', 'anonymous')
        
        # Create a new chat
        chat_id = create_new_chat(user_id)
        
        return jsonify({'success': True, 'chat_id': chat_id})
    except Exception as e:
        print(f"Error creating chat: {str(e)}")
        return jsonify({'success': False, 'error': str(e)})

@app.route('/api/chats/create', methods=['POST'])
def create_chat_api_alt():
    """Alternative API endpoint to create a new chat (for compatibility)"""
    return create_chat_api()

@app.route('/api/chats/<chat_id>', methods=['GET'])
def get_chat_api(chat_id):
    """API endpoint to get a specific chat and its messages"""
    try:
        # Get chat messages
        messages = get_chat_messages(chat_id)
        
        # Log for debugging purposes
        print(f"DEBUG: Retrieved {len(messages)} messages for chat {chat_id}")
        
        return jsonify({'success': True, 'messages': messages})
    except Exception as e:
        print(f"Error getting chat: {str(e)}")
        return jsonify({'success': False, 'error': str(e), 'messages': []})

@app.route('/api/chats/<chat_id>/rename', methods=['POST'])
def rename_chat_api(chat_id):
    """API endpoint to rename a chat"""
    try:
        # Get the new name from the request
        data = request.json
        new_name = data.get('name')
        
        if not new_name:
            return jsonify({'success': False, 'error': 'No name provided'})
        
        # Update the chat name
        success = update_chat_name(chat_id, new_name)
        
        return jsonify({'success': success})
    except Exception as e:
        print(f"Error renaming chat: {str(e)}")
        return jsonify({'success': False, 'error': str(e)})

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

def create_new_chat(user_id="anonymous"):
    """Create a new chat and return its ID"""
    return db_helper.create_new_chat(user_id)

def get_chat_messages(chat_id):
    """Get all messages for a specific chat"""
    return db_helper.get_chat_messages(chat_id)

def save_message(chat_id, role, content):
    """Save a message to the database"""
    return db_helper.save_message(chat_id, role, content)

def update_chat_name(chat_id, new_name):
    """Update a chat's name"""
    return db_helper.update_chat_name(chat_id, new_name)

def get_vehicle_service_links(make, model, year=None):
    """Get actual service links directly from the database for a specific vehicle"""
    if not make or not model:
        return None
        
    try:
        # Connect to the database
        conn = sqlite3.connect('NiccDB.db')
        conn.row_factory = sqlite3.Row
        cursor = conn.cursor()
        
        # Make queries
        make_upper = make.upper() if make else None
        model_upper = model.upper() if model else None
        
        print(f"DEBUG: Searching for service links for {year} {make} {model}")
        
        # Try direct query on the make-specific table first
        service_links = []
        all_rows = []
        found_vehicles = False
        
        # Try the make-specific table if available
        cursor.execute("SELECT name FROM sqlite_master WHERE type='table' AND name=?", (make.lower(),))
        make_table = cursor.fetchone()
        
        print(f"DEBUG: Make table exists: {make_table is not None}")
        
        if make_table:
            # Get column information for this table
            cursor.execute(f"PRAGMA table_info({make.lower()})")
            columns = [row[1] for row in cursor.fetchall()]
            print(f"DEBUG: Columns in {make.lower()} table: {columns}")
            
            # Check if the table has any service links or hyperlink columns
            hyperlink_cols = [col for col in columns if any(term in col.lower() for term in ['url', 'link', 'hyperlink', 'service'])]
            print(f"DEBUG: Potential hyperlink columns: {hyperlink_cols}")
            
            query = f"SELECT * FROM {make.lower()} WHERE model LIKE ?"
            params = [f"%{model_upper}%"]
            if year:
                query += " AND year = ?"
                params.append(str(year))
                
            print(f"DEBUG: Executing query on {make.lower()} table: {query} with params {params}")
            cursor.execute(query, params)
            rows = cursor.fetchall()
            
            if rows:
                found_vehicles = True
                all_rows.extend([dict(row) for row in rows])
                print(f"DEBUG: Found {len(rows)} matching vehicles in {make.lower()} table")
                
                # Debug: Sample a row to see what data we have
                sample_row = dict(rows[0])
                print(f"DEBUG: Sample row fields from {make.lower()} table:")
                for col in hyperlink_cols:
                    if col in sample_row:
                        print(f"DEBUG: {col} = {sample_row[col]}")
        
        # Also try master_vehicles table
        # First, check if master_vehicles has hyperlink columns
        cursor.execute("PRAGMA table_info(master_vehicles)")
        master_columns = [row[1] for row in cursor.fetchall()]
        master_hyperlink_cols = [col for col in master_columns if any(term in col.lower() for term in ['url', 'link', 'hyperlink', 'service'])]
        print(f"DEBUG: Potential hyperlink columns in master_vehicles: {master_hyperlink_cols}")
        
        query = f"SELECT * FROM master_vehicles WHERE make LIKE ? AND model LIKE ?"
        params = [f"%{make_upper}%", f"%{model_upper}%"]
        if year:
            query += " AND year = ?"
            params.append(str(year))
            
        print(f"DEBUG: Executing query on master_vehicles: {query} with params {params}")
        cursor.execute(query, params)
        rows = cursor.fetchall()
        
        if rows:
            found_vehicles = True
            all_rows.extend([dict(row) for row in rows])
            print(f"DEBUG: Found {len(rows)} matching vehicles in master_vehicles table")
            
            # Debug: Sample a row to see what data we have
            if master_hyperlink_cols and rows:
                sample_row = dict(rows[0])
                print(f"DEBUG: Sample row fields from master_vehicles table:")
                for col in master_hyperlink_cols:
                    if col in sample_row:
                        print(f"DEBUG: {col} = {sample_row[col]}")
        
        # If we have results, look for service links in any of the fields
        if found_vehicles:
            print(f"DEBUG: Processing {len(all_rows)} rows for service links")
            
            # Debug: print a sample row to see what data we have
            if all_rows:
                # Print list of all column names in first row
                print(f"DEBUG: Available columns in first row: {list(all_rows[0].keys())}")
                
                # Print important columns if they exist
                important_cols = ['parent_component', 'component', 'protech_generic_system_name', 'system', 'hardware_name', 'service_information_hyperlink', 'oe_glass_service_info_hyperlink']
                for col in important_cols:
                    for row in all_rows:
                        if col in row and row[col] is not None and str(row[col]).strip():
                            print(f"DEBUG: Sample {col}: {row[col]}")
                            break
            
            # ADDITIONAL DEBUG: Print any field that looks like it could be a URL
            for row in all_rows:
                for field_name, field_value in row.items():
                    # Check if this value looks like a URL
                    if field_value and isinstance(field_value, str) and any(field_value.lower().startswith(prefix) for prefix in ['http:', 'https:', 'www.']):
                        print(f"DEBUG: Found potential URL in field {field_name}: {field_value}")
                
            # Check each row and extract any fields with URLs
            for row in all_rows:
                # First identify the component/system information for this row
                component_info = None
                
                # Try to extract component/system info from various possible columns
                if 'parent_component' in row and row['parent_component'] and str(row['parent_component']).strip() not in ['nan', 'none', 'null', 'na', '']:
                    component_info = row['parent_component']
                elif 'hardware_name' in row and row['hardware_name'] and str(row['hardware_name']).strip() not in ['nan', 'none', 'null', 'na', '']:
                    component_info = row['hardware_name']
                elif 'protech_generic_system_name' in row and row['protech_generic_system_name'] and str(row['protech_generic_system_name']).strip() not in ['nan', 'none', 'null', 'na', '']:
                    component_info = row['protech_generic_system_name']
                elif 'component' in row and row['component'] and str(row['component']).strip() not in ['nan', 'none', 'null', 'na', '']:
                    component_info = row['component']
                elif 'system' in row and row['system'] and str(row['system']).strip() not in ['nan', 'none', 'null', 'na', '']:
                    component_info = row['system']
                    
                # Print component info for debugging
                if component_info:
                    print(f"DEBUG: Found component info: {component_info}")
                    
                # Now look for URLs in this row
                for field_name, field_value in row.items():
                    # Skip null values and non-string values
                    if field_value is None or not isinstance(field_value, str):
                        continue
                        
                    # Skip empty strings and common null values
                    if not field_value.strip() or field_value.lower() in ['nan', 'none', 'null', 'na']:
                        continue
                    
                    # Look for actual URLs in any field
                    if field_value.startswith(('http://', 'https://', 'www.')):
                        print(f"DEBUG: Found actual URL in field {field_name}: {field_value}")
                        
                        # Create a name for this link
                        base_name = ""
                        
                        # Try to create a meaningful name from the field name
                        field_display = field_name.replace('_', ' ').replace('hyperlink', '').replace('url', '').strip()
                        
                        # If we have component info, use it to enhance the link title
                        if component_info:
                            if field_display:
                                base_name = f"{component_info} {field_display}"
                            else:
                                base_name = f"{component_info} Service Information"
                        else:
                            # No component info, use field name only or a default
                            if field_display:
                                base_name = field_display.title()
                            else:
                                base_name = f"{make} {model} Service Information"
                        
                        # Add to our list if not already there and if URL seems valid
                        if base_name and field_value.startswith(('http://', 'https://')):
                            link_entry = {
                                'name': base_name,
                                'url': field_value,
                                'component': component_info
                            }
                            # Check if we already have this URL
                            if not any(link['url'] == field_value for link in service_links):
                                service_links.append(link_entry)
            
            # If we still didn't find any links, let's create some based on the components we found
            if not service_links and make.lower() == 'nissan':
                print("DEBUG: No URLs found, creating Nissan-specific links based on components")
                
                # Get any components we identified
                components = set()
                for row in all_rows:
                    if 'parent_component' in row and row['parent_component'] and str(row['parent_component']).strip() not in ['nan', 'none', 'null', 'na', '']:
                        components.add(row['parent_component'])
                
                # Create links for each component
                for component in components:
                    if component:
                        # Create Nissan-specific component link
                        link_entry = {
                            'name': f"{component} Service Information",
                            'url': f"https://www.nissan-techinfo.com/nissan/controller.aspx?component={component}",
                            'component': component
                        }
                        service_links.append(link_entry)
                        print(f"DEBUG: Created component-specific link for {component}")

        conn.close()
        
        # Debug - print what we found
        print(f"DEBUG: Found {len(service_links)} service links")
        for link in service_links:
            print(f"DEBUG: Link: {link['name']} - {link['url']}")
        return service_links
    except Exception as e:
        print(f"ERROR in get_vehicle_service_links: {str(e)}")
        traceback.print_exc()
        return None

def extract_key_topics(message):
    """Extract key topics from the user's message."""
    # Patterns for common ADAS and calibration questions
    radar_pattern = re.compile(r'(front|rear|side)?\s*(radar|sensing|detection)', re.IGNORECASE)
    camera_pattern = re.compile(r'(front|rear|side|backup)?\s*(camera|vision|sensing|detection)', re.IGNORECASE)
    sensor_pattern = re.compile(r'(parking|proximity|distance|ultrasonic)?\s*(sensor|sensing|detection)', re.IGNORECASE)
    lidar_pattern = re.compile(r'(lidar|laser|scanning)', re.IGNORECASE)
    adas_pattern = re.compile(r'(ADAS|advanced driver assistance|driver assist|assistance system)', re.IGNORECASE)
    calibration_pattern = re.compile(r'(calibration|calibrate|align|adjustment|reset)', re.IGNORECASE)
    collision_pattern = re.compile(r'(collision|accident|crash|impact|hit|damage)', re.IGNORECASE)
    repair_pattern = re.compile(r'(repair|fix|restore|replace)', re.IGNORECASE)
    
    # Patterns for specific repair scenarios
    bumper_pattern = re.compile(r'(bumper|fascia)\s*(remov|replac|repair|install|off|disconnect)', re.IGNORECASE)
    windshield_pattern = re.compile(r'(windshield|glass|window|windscreen)\s*(remov|replac|repair|install|crack|broken)', re.IGNORECASE)
    parts_pattern = re.compile(r'(remov|replac|repair|install|disconnect|take off)\s*(\w+)', re.IGNORECASE)
    
    topics = []
    
    # Check for matches
    if radar_pattern.search(message):
        match = radar_pattern.search(message)
        location = match.group(1) if match.group(1) else ""
        topics.append(f"{location} radar".strip())
    
    if camera_pattern.search(message):
        match = camera_pattern.search(message)
        location = match.group(1) if match.group(1) else ""
        topics.append(f"{location} camera".strip())
    
    if sensor_pattern.search(message):
        match = sensor_pattern.search(message)
        sensor_type = match.group(1) if match.group(1) else ""
        topics.append(f"{sensor_type} sensor".strip())
    
    if lidar_pattern.search(message):
        topics.append("lidar")
    
    if adas_pattern.search(message):
        topics.append("ADAS systems")
    
    if calibration_pattern.search(message):
        topics.append("calibration requirements")
    
    if collision_pattern.search(message):
        topics.append("collision repair")
    
    if repair_pattern.search(message):
        topics.append("repair procedures")
        
    # Check for specific repair scenarios
    if bumper_pattern.search(message):
        match = bumper_pattern.search(message)
        action = match.group(2) if match.group(2) else "removal"
        topics.append(f"bumper {action}")
        
    if windshield_pattern.search(message):
        match = windshield_pattern.search(message)
        action = match.group(2) if match.group(2) else "replacement"
        topics.append(f"windshield {action}")
    
    # Check for other part replacements/removals
    if parts_pattern.search(message):
        match = parts_pattern.search(message)
        action = match.group(1)
        part = match.group(2)
        # Only add if the part is not already covered and is not a common word
        common_words = ['a', 'the', 'if', 'when', 'do', 'i', 'need', 'should', 'it', 'is', 'to', 'will']
        if part.lower() not in common_words and not any(part.lower() in topic.lower() for topic in topics):
            topics.append(f"{part} {action}")
    
    # If no specific topics found, use a default or try to extract nouns
    if not topics:
        if HAS_SPACY and nlp:
            # Use spaCy to extract nouns as potential topics
            doc = nlp(message)
            nouns = [token.text for token in doc if token.pos_ == "NOUN"]
            
            if nouns:
                topics = nouns[:3]  # Take up to 3 nouns
            else:
                topics = ["ADAS systems", "calibration requirements"]
        else:
            # Simple fallback when spaCy is not available
            # Use regex to find common automotive nouns
            auto_nouns = re.findall(r'\b(radar|camera|sensor|system|vehicle|car|calibration|repair|bumper|windshield|front|rear|side)\b', 
                                  message.lower())
            if auto_nouns:
                topics = list(set(auto_nouns))[:3]  # Take up to 3 unique nouns
            else:
                topics = ["ADAS systems", "calibration requirements"]
    
    # Format topics for prompt
    if len(topics) == 1:
        return topics[0]
    elif len(topics) == 2:
        return f"{topics[0]} and {topics[1]}"
    else:
        return f"{', '.join(topics[:-1])}, and {topics[-1]}"

def get_web_information(prompt):
    """Use Gemini to get web-based information."""
    try:
        print(f"DEBUG: Fetching web information with prompt: {prompt}")
        
        # Check if we have access to Gemini and the model is initialized
        if not HAS_GEMINI_ACCESS or not 'model' in globals() or globals()['model'] is None:
            print("DEBUG: Gemini API not available, using fallback response")
            return "I'm sorry, I couldn't retrieve detailed information at this time. Please provide more specific vehicle details for a better response."
        
        # Create a more focused prompt that emphasizes direct answers to the specific question
        focused_prompt = f"""You are NICC, a specialized assistant for automotive collision centers.

Answer the following specific question DIRECTLY and CONCISELY:

"{prompt}"

Your response should:
1. Start with a clear yes/no answer if applicable
2. Only include information directly relevant to the specific question
3. Be brief and to the point (3-5 sentences maximum for the core answer)
4. Mention specific calibration requirements ONLY if directly related to the scenario described
5. Avoid general information about ADAS systems unless specifically requested

If the question is about a specific scenario (like bumper removal, windshield replacement, etc.), focus ONLY on that specific scenario.
"""
        
        # Use the initialized Gemini model to generate content
        try:
            # Try with the global model first (preferred method)
            gemini_model = globals()['model']
            response = generate_content_with_retry(gemini_model, [focused_prompt])
            
            # Clean up and format the response
            web_info = response.text
            
            # Ensure the response is clean and well-formatted
            web_info = re.sub(r'\n{3,}', '\n\n', web_info)  # Remove excessive newlines
            
            return web_info
            
        except Exception as model_error:
            print(f"DEBUG: Error with global model: {str(model_error)}")
            
            # Fallback to direct API call if the global model fails
            try:
                # Create a new model instance directly
                direct_model = genai.GenerativeModel('gemini-1.5-pro')
                response = direct_model.generate_content([focused_prompt])
                
                # Clean up and format the response
                web_info = response.text
                
                # Ensure the response is clean and well-formatted
                web_info = re.sub(r'\n{3,}', '\n\n', web_info)  # Remove excessive newlines
                
                return web_info
            except Exception as direct_error:
                print(f"DEBUG: Error with direct model: {str(direct_error)}")
                return "I'm sorry, I couldn't retrieve the information you requested. Please try again with more specific details about your vehicle."
    
    except Exception as e:
        print(f"ERROR in get_web_information: {str(e)}")
        return "I'm sorry, I couldn't retrieve the information you requested. Please try again with more specific details about your vehicle."

def provide_vehicle_info(make=None, model=None, year=None, query_type="general", wants_table=False, table_format=None, missing_info=None, assumed_info=None, user_message=None):
    """Provide vehicle information, checking for missing fields and using Gemini for web information when needed."""
    if not missing_info:
        missing_info = []
    
    if not assumed_info:
        assumed_info = []
    
    # Determine what information is available and what's missing
    has_make = make is not None and make != ""
    has_model = model is not None and model != ""
    has_year = year is not None and year != ""
    
    # Variable to track if we should fetch information from the web
    fetch_from_web = False
    web_prompt = ""
    
    response_parts = []
    
    # Extract the actual question from the user's message to focus the response
    actual_question = user_message if user_message else ""
    
    # Special case for production years query when make and model are known
    if query_type == "years" and has_make and has_model:
        fetch_from_web = True
        web_prompt = f"What are the production years for {make} {model}? Provide a concise answer with the range of years this vehicle was manufactured."
    
    # Check for missing information
    elif "_assumed_info" in missing_info or not (has_make and has_model and has_year):
        # Only add missing information notice if there's no specific question to answer
        if not any(term in actual_question.lower() for term in ['calibrate', 'calibration', 'remove', 'bumper', 'windshield', 'replace']):
            response_parts.append("I notice some vehicle information is missing. ")
            
            if not has_make and "make" in missing_info:
                response_parts.append("Please select the vehicle make. ")
            
            if not has_model and "model" in missing_info:
                response_parts.append("Please select the vehicle model. ")
                
            if not has_year and "year" in missing_info:
                response_parts.append("Please select the vehicle year. ")
        
        # Add note about assumed information - only if relevant to the answer
        if assumed_info and "_assumed_info" in missing_info:
            response_parts.append(f"\n\nNote: I'm using the {', '.join(assumed_info)} from your previous query, as you didn't specify this in your current question. ")
        
        # Decide whether to fetch web information based on what we have
        if has_make and user_message:
            # We have at least the make, try to get specific information for the question
            fetch_from_web = True
            
            # Extract key topics from the user's question
            topics = extract_key_topics(user_message)
            
            if has_model:
                web_prompt = f"{actual_question} (For {make} {model})"
            else:
                web_prompt = f"{actual_question} (For {make} vehicles)"
    
    # Fetch information from the web if needed
    if fetch_from_web:
        if not response_parts:
            # If we haven't added any context yet, create a direct response
            web_info = get_web_information(web_prompt)
            response_parts.append(web_info)
        else:
            # If we've already added context, provide additional information
            response_parts.append("\n\nHere's what I can tell you: ")
            web_info = get_web_information(web_prompt)
            response_parts.append(web_info)
        
        # Only add the information source note if we provided general information
        if "production year" in web_prompt.lower() or not (has_make and has_model and has_year):
            response_parts.append("\n\nFor the most accurate information specific to your exact vehicle configuration, please provide complete vehicle details or consult the manufacturer's documentation.")
    
    # Default response if we don't have enough info to fetch from web
    if not fetch_from_web and not response_parts:
        response_parts.append("I need more information about your vehicle to assist you properly. Please select the make, model, and year using the dropdown menus above.")
    
    return "".join(response_parts)

@app.route('/api/vehicle-data', methods=['GET'])
def get_vehicle_data_api():
    """API endpoint to get unique years, makes, models, and systems for dropdown menus"""
    try:
        # Connect to the database
        conn = sqlite3.connect('NiccDB.db')
        conn.row_factory = sqlite3.Row
        cursor = conn.cursor()
        
        # Initialize dictionaries
        result = {
            'years': [],
            'makes': [],
            'models': [],
            'systems': []
        }
        
        # Get list of tables
        cursor.execute("SELECT name FROM sqlite_master WHERE type='table'")
        tables = [row[0] for row in cursor.fetchall()]
        
        # Get unique years - normalize to remove decimal points
        if 'master_vehicles' in tables:
            cursor.execute("SELECT DISTINCT year FROM master_vehicles WHERE year IS NOT NULL ORDER BY year DESC")
            years_set = set()
            for row in cursor.fetchall():
                if row[0]:
                    try:
                        # Convert to float first to handle both string and numeric formats
                        # Then convert to int to remove decimal part
                        year_value = str(int(float(row[0])))
                        years_set.add(year_value)
                    except (ValueError, TypeError):
                        # Skip any invalid year values
                        continue
            
            # Convert set back to sorted list (descending)
            result['years'] = sorted(list(years_set), reverse=True)
        
        # Get unique makes
        if 'master_vehicles' in tables:
            cursor.execute("SELECT DISTINCT make FROM master_vehicles ORDER BY make")
            result['makes'] = [row[0] for row in cursor.fetchall() if row[0]]
        
        # Get models based on make if specified in query parameter
        make_param = request.args.get('make')
        if make_param and 'master_vehicles' in tables:
            cursor.execute("SELECT DISTINCT model FROM master_vehicles WHERE make = ? ORDER BY model", (make_param,))
            result['models'] = [row[0] for row in cursor.fetchall() if row[0]]
        elif 'master_vehicles' in tables:
            # Get all models if no make specified
            cursor.execute("SELECT DISTINCT model FROM master_vehicles ORDER BY model")
            result['models'] = [row[0] for row in cursor.fetchall() if row[0]]
        
        # Get unique systems/components
        if 'master_vehicles' in tables:
            # Try to get parent_component field which contains system info
            cursor.execute("PRAGMA table_info(master_vehicles)")
            columns = [row[1] for row in cursor.fetchall()]
            
            if 'parent_component' in columns:
                cursor.execute("SELECT DISTINCT parent_component FROM master_vehicles WHERE parent_component IS NOT NULL ORDER BY parent_component")
                result['systems'] = [row[0] for row in cursor.fetchall() if row[0]]
        
        return jsonify(result)
    except Exception as e:
        print(f"Error getting vehicle data: {str(e)}")
        return jsonify({'error': str(e)}), 500
    finally:
        if 'conn' in locals():
            conn.close()

@app.route('/api/models', methods=['GET'])
def get_models_api():
    """API endpoint to get models for a specific make and optional year"""
    try:
        make = request.args.get('make')
        year = request.args.get('year')
        
        # Format year to remove decimal if present
        if year:
            try:
                if isinstance(year, str) and '.' in year:
                    year = year.split('.')[0]
                elif isinstance(year, (int, float)):
                    year = str(int(year))
            except (ValueError, TypeError):
                pass  # Keep original if conversion fails
        
        if not make:
            return jsonify({'error': 'Make parameter is required'}), 400
        
        # Connect to the database
        conn = sqlite3.connect('NiccDB.db')
        conn.row_factory = sqlite3.Row
        cursor = conn.cursor()
        
        # Base query
        if year:
            # Handle year with or without decimal
            try:
                # Normalize the year to integer (remove decimal)
                year_int = int(float(year))
                # Query for both forms (with or without decimal)
                query = "SELECT DISTINCT model FROM master_vehicles WHERE make = ? AND (CAST(year AS INTEGER) = ? OR year = ? OR year = ?) ORDER BY model"
                params = [make, year_int, year, f"{year_int}.0"]
            except (ValueError, TypeError):
                # If year conversion fails, use the original value
                query = "SELECT DISTINCT model FROM master_vehicles WHERE make = ? AND year = ? ORDER BY model"
                params = [make, year]
        else:
            # No year filter
            query = "SELECT DISTINCT model FROM master_vehicles WHERE make = ? ORDER BY model"
            params = [make]
        
        # Get models for the specified make and year if provided
        cursor.execute(query, params)
        models = [row[0] for row in cursor.fetchall() if row[0]]
        
        return jsonify({'models': models})
    except Exception as e:
        print(f"Error getting models: {str(e)}")
        return jsonify({'error': str(e)}), 500
    finally:
        if 'conn' in locals():
            conn.close()

@app.route('/api/systems', methods=['GET'])
def get_systems_api():
    """API endpoint to get available systems requiring calibration for a specific make, model, and optional year"""
    try:
        make = request.args.get('make')
        model = request.args.get('model')
        year = request.args.get('year')
        
        # Format year to remove decimal if present
        if year:
            try:
                if isinstance(year, str) and '.' in year:
                    year = year.split('.')[0]
                elif isinstance(year, (int, float)):
                    year = str(int(year))
            except (ValueError, TypeError):
                pass  # Keep original if conversion fails
        
        if not make or not model:
            return jsonify({'error': 'Both make and model parameters are required'}), 400
        
        # Connect to the database
        conn = sqlite3.connect('NiccDB.db')
        conn.row_factory = sqlite3.Row
        cursor = conn.cursor()
        
        # First, check if a make-specific table exists (e.g., 'honda', 'toyota', etc.)
        make_table = make.lower().replace(' ', '_')
        
        # Check if the table exists
        cursor.execute("SELECT name FROM sqlite_master WHERE type='table' AND name=?", (make_table,))
        table_exists = cursor.fetchone() is not None
        
        systems = []
        
        # Function to check if a column exists in a table
        def column_exists(table_name, column_name):
            cursor.execute(f"PRAGMA table_info({table_name})")
            columns = [row[1].lower() for row in cursor.fetchall()]
            return column_name.lower() in columns
        
        if table_exists:
            # Check if calibration_type column exists in this table
            has_cal_type = column_exists(make_table, 'calibration_type')
            
            if has_cal_type:
                # Query the make-specific table, filtering for systems that require calibration
                base_query = f"""
                    SELECT DISTINCT parent_component 
                    FROM {make_table} 
                    WHERE make = ? 
                    AND model = ? 
                    AND parent_component IS NOT NULL 
                    AND parent_component != '' 
                    AND parent_component != 'nan' 
                    AND parent_component != 'None'
                    AND calibration_type IS NOT NULL 
                    AND calibration_type != '' 
                    AND calibration_type != 'nan' 
                    AND calibration_type != 'None'
                """
                params = [make, model]
                
                # Add year filter if provided
                if year:
                    try:
                        # Normalize the year to integer (remove decimal)
                        year_int = int(float(year))
                        # Query for both formats of year
                        base_query += " AND (CAST(year AS INTEGER) = ? OR year = ? OR year = ?)"
                        params.extend([year_int, str(year), f"{year_int}.0"])
                    except (ValueError, TypeError):
                        # If conversion fails, use the original value
                        base_query += " AND year = ?"
                        params.append(year)
                    
                # Execute the query
                cursor.execute(base_query, params)
                for row in cursor.fetchall():
                    if row[0] and str(row[0]).lower() not in ['nan', 'none', 'null', '']:
                        systems.append(row[0])
        
        # If no systems found in make-specific table or table doesn't exist, try master_vehicles
        if not systems:
            # Check if calibration_type exists in master_vehicles
            has_cal_type = column_exists('master_vehicles', 'calibration_type')
            
            if has_cal_type:
                query = """
                    SELECT DISTINCT parent_component 
                    FROM master_vehicles 
                    WHERE make = ? 
                    AND model = ? 
                    AND parent_component IS NOT NULL 
                    AND parent_component != '' 
                    AND parent_component != 'nan' 
                    AND parent_component != 'None'
                    AND calibration_type IS NOT NULL 
                    AND calibration_type != '' 
                    AND calibration_type != 'nan' 
                    AND calibration_type != 'None'
                """
                params = [make, model]
                
                # Add year filter if provided
                if year:
                    try:
                        # Normalize the year to integer (remove decimal)
                        year_int = int(float(year))
                        # Query for both forms (with or without decimal)
                        query += " AND (CAST(year AS INTEGER) = ? OR year = ? OR year = ?)"
                        params.extend([year_int, str(year), f"{year_int}.0"])
                    except (ValueError, TypeError):
                        # If year conversion fails, use the original value
                        query += " AND year = ?"
                        params.append(year)
                
                query += " ORDER BY parent_component"
                
                # Execute the query
                cursor.execute(query, params)
                for row in cursor.fetchall():
                    if row[0] and str(row[0]).lower() not in ['nan', 'none', 'null', '']:
                        systems.append(row[0])
        
        # Only include ADAS-related systems
        adas_systems = []
        for system in systems:
            system_lower = str(system).lower()
            # Check if it's an ADAS system
            if any(term in system_lower for term in ['camera', 'radar', 'sensor', 'lidar', 'adas', 'lane', 'collision', 'blind spot', 'cruise']):
                adas_systems.append(system)
        
        # Return unique systems, sorted alphabetically
        unique_systems = sorted(list(set(adas_systems)))
        
        return jsonify({'systems': unique_systems})
    except Exception as e:
        print(f"Error getting systems: {str(e)}")
        return jsonify({'error': str(e)}), 500
    finally:
        if 'conn' in locals():
            conn.close()

@app.route('/api/vin-decode', methods=['POST'])
def decode_vin_api():
    """API endpoint to decode a VIN and return vehicle information"""
    try:
        # Get the VIN from the request
        data = request.json
        vin = data.get('vin')
        
        if not vin or len(vin) != 17:
            return jsonify({
                'success': False,
                'error': 'Invalid VIN. Please provide a 17-character VIN.'
            }), 400
        
        # Basic VIN validation - check length and characters
        if not re.match(r'^[A-HJ-NPR-Z0-9]{17}$', vin):
            return jsonify({
                'success': False,
                'error': 'Invalid VIN format. VINs contain 17 alphanumeric characters (excluding I, O, Q).'
            }), 400
        
        # First, try an API call to NHTSA for VIN decoding
        # If that fails, we'll fall back to extracting info from the VIN manually
        try:
            # NHTSA API call
            nhtsa_url = f"https://vpic.nhtsa.dot.gov/api/vehicles/DecodeVinValues/{vin}?format=json"
            response = requests.get(nhtsa_url)
            nhtsa_data = response.json()
            
            if response.status_code == 200 and nhtsa_data.get('Results'):
                result = nhtsa_data['Results'][0]
                
                # Extract relevant information
                year = result.get('ModelYear')
                make = result.get('Make')
                model = result.get('Model')
                
                # Validate the data is useful
                if year and make and model and year != "null" and make != "null" and model != "null":
                    return jsonify({
                        'success': True,
                        'year': year,
                        'make': make,
                        'model': model
                    })
        except Exception as api_error:
            print(f"NHTSA API error: {str(api_error)}")
            # Continue to fallback method
        
        # Fallback: Basic VIN parsing
        # Extract year based on the 10th character of VIN
        year_char = vin[9].upper()
        current_year = datetime.datetime.now().year
        
        # Year coding logic (simplified)
        year_codes = {
            'A': 2010, 'B': 2011, 'C': 2012, 'D': 2013, 'E': 2014,
            'F': 2015, 'G': 2016, 'H': 2017, 'J': 2018, 'K': 2019,
            'L': 2020, 'M': 2021, 'N': 2022, 'P': 2023, 'R': 2024
        }
        
        # Numbers 1-9 typically represent 2001-2009
        if year_char.isdigit() and year_char != '0':
            year = 2000 + int(year_char)
        elif year_char in year_codes:
            year = year_codes[year_char]
        else:
            # If we can't determine the year, just use current year as fallback
            year = current_year
        
        # Extract World Manufacturer Identifier (WMI) from first 3 characters
        wmi = vin[:3].upper()
        
        # Common WMI to manufacturer mapping (simplified)
        wmi_to_make = {
            # Japanese manufacturers
            'JN': 'Nissan', 'JF': 'Subaru', 'JT': 'Toyota',
            'JH': 'Honda', 'JM': 'Mazda', 'JA': 'Isuzu',
            'JS': 'Suzuki', 'JK': 'Kawasaki', 'JY': 'Yamaha',
            # American manufacturers
            '1G': 'General Motors', '1C': 'Chrysler', '1F': 'Ford',
            '1B': 'Dodge', '1D': 'Chevrolet', '1H': 'Honda',
            '1J': 'Jeep', '1L': 'Lincoln', '1ME': 'Mercury',
            '1N': 'Nissan', '1G1': 'Chevrolet', '1HD': 'Harley-Davidson',
            # European manufacturers
            'WA': 'Audi', 'WB': 'BMW', 'WP': 'Porsche',
            'WV': 'Volkswagen', 'WF': 'Ferrari', 'WD': 'Mercedes-Benz',
            'VF': 'Peugeot/Citroën', 'VR': 'Renault',
            # Korean manufacturers
            'KN': 'Kia', 'KM': 'Hyundai'
        }
        
        # Try to determine make from WMI
        make = None
        for prefix, manufacturer in wmi_to_make.items():
            if vin.upper().startswith(prefix):
                make = manufacturer
                break
        
        # If we couldn't determine the make, use a fallback
        if not make:
            make = "Unknown"
        
        # We can't reliably determine model from VIN without a database
        # So we'll just return what we know
        return jsonify({
            'success': True,
            'year': str(year),
            'make': make,
            'model': 'Unknown',  # We can't reliably determine model with just VIN parsing
            'note': 'Limited information available from VIN pattern analysis'
        })
        
    except Exception as e:
        print(f"Error in VIN decoding: {str(e)}")
        return jsonify({
            'success': False,
            'error': str(e)
        }), 500

@app.route('/api/poi', methods=['GET'])
def get_poi_api():
    """Get all POI (Points of Impact) data."""
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        
        # Create the POI table if it doesn't exist
        cursor.execute('''
        CREATE TABLE IF NOT EXISTS poi (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            position_number INTEGER NOT NULL,
            position_name TEXT NOT NULL,
            location_description TEXT,
            system_type TEXT
        )
        ''')
        
        # Insert default POI data if the table is empty
        cursor.execute("SELECT COUNT(*) FROM poi")
        count = cursor.fetchone()[0]
        
        if count == 0:
            # Insert default POI data
            cursor.executemany('''
            INSERT INTO poi (position_number, position_name, location_description, system_type)
            VALUES (?, ?, ?, ?)
            ''', [
                (1, 'Front Center', 'Front center of vehicle', 'Front Camera,FCW,AEB'),
                (2, 'Front Left', 'Front left corner', 'Front Camera,FCW,Side Camera'),
                (3, 'Front Right', 'Front right corner', 'Front Camera,FCW,Side Camera'),
                (4, 'Driver Side', 'Middle of driver side', 'Side Camera,BSM,LDW'),
                (5, 'Passenger Side', 'Middle of passenger side', 'Side Camera,BSM,LDW'),
                (6, 'Rear Center', 'Center of rear', 'Rear Camera,Backup Sensors'),
                (7, 'Rear Left', 'Rear left corner', 'Rear Camera,Side Camera'),
                (8, 'Rear Right', 'Rear right corner', 'Rear Camera,Side Camera'),
                (9, 'Roof', 'Vehicle roof', 'Sensors,GPS'),
                (10, 'Driver Door', 'Driver side door', 'Side Camera,BSM'),
                (11, 'Passenger Door', 'Passenger side door', 'Side Camera,BSM'),
                (12, 'Driver Rear Quarter', 'Rear quarter on driver side', 'Side Camera,BSM,RCTA'),
                (13, 'Passenger Rear Quarter', 'Rear quarter on passenger side', 'Side Camera,BSM,RCTA')
            ])
            conn.commit()
        
        # Query all POI data
        cursor.execute("SELECT id, position_number, position_name, location_description, system_type FROM poi ORDER BY position_number")
        poi_data = cursor.fetchall()
        
        # Convert to list of dictionaries
        poi_list = []
        for row in poi_data:
            poi_list.append({
                'id': row[0],
                'position_number': row[1],
                'position_name': row[2],
                'location_description': row[3],
                'system_type': row[4]
            })
        
        conn.close()
        
        return jsonify({
            'success': True,
            'poi': poi_list
        })
    
    except Exception as e:
        print(f"Error in get_poi_api: {e}")
        return jsonify({
            'success': False,
            'error': str(e)
        })

@app.route('/api/chats/<chat_id>/toggle-pin', methods=['POST'])
def toggle_pin_chat_api(chat_id):
    """Toggle the pinned status of a chat."""
    try:
        # Get the current user ID
        user_id = session['user_id'] if 'user_id' in session else 'public'
        
        # Log the request
        app.logger.info(f"Toggle pin request for chat {chat_id} by user {user_id}")
        
        # Call the database function to toggle pin status
        result = db_helper.toggle_pin_chat(chat_id, user_id)
        
        if not result['success']:
            app.logger.error(f"Failed to toggle pin status: {result.get('error', 'Unknown error')}")
            return jsonify({"success": False, "error": result.get('error', 'Failed to toggle pin status')}), 500
        
        # Return the updated pin status
        return jsonify({
            "success": True,
            "chat_id": chat_id,
            "is_pinned": result['is_pinned']
        })
    
    except Exception as e:
        app.logger.error(f"Error toggling pin status: {str(e)}")
        return jsonify({"success": False, "error": str(e)}), 500

def get_vehicle_context_str(vehicle_context):
    """
    Format vehicle context information into a string for the prompt.
    """
    if not vehicle_context:
        return ""
    
    context_parts = []
    
    # Add basic vehicle information
    if vehicle_context.get('year') and vehicle_context.get('make') and vehicle_context.get('model'):
        context_parts.append(f"Vehicle: {vehicle_context.get('year')} {vehicle_context.get('make')} {vehicle_context.get('model')}")
    
    # Handle multiple systems
    if vehicle_context.get('systems') and len(vehicle_context.get('systems')) > 0:
        if 'All Systems' in vehicle_context.get('systems'):
            context_parts.append(f"Systems: All ADAS Systems")
        else:
            systems_str = ', '.join(vehicle_context.get('systems'))
            context_parts.append(f"Systems: {systems_str}")
    
    # Add POI information if available
    if vehicle_context.get('poi_areas') and len(vehicle_context.get('poi_areas')) > 0:
        poi_area_strs = []
        for area in vehicle_context.get('poi_areas'):
            if area in vehicle_context.get('poi_by_area'):
                poi_names = vehicle_context.get('poi_by_area')[area]
                poi_area_strs.append(f"{area}: {', '.join(poi_names)}")
        
        if poi_area_strs:
            context_parts.append(f"Points of Impact: {' | '.join(poi_area_strs)}")
    
    return "\n".join(context_parts)

@app.route('/api/nhtsa-adas', methods=['POST'])
def get_nhtsa_adas_api():
    """API endpoint to get NHTSA ADAS compliance data for a VIN"""
    try:
        # Get the VIN from the request
        data = request.json
        vin = data.get('vin')
        year = data.get('year', '')  # Optional year parameter
        
        if not vin or len(vin) != 17:
            return jsonify({
                'success': False,
                'error': 'Invalid VIN. Please provide a 17-character VIN.'
            }), 400
        
        # Basic VIN validation
        if not re.match(r'^[A-HJ-NPR-Z0-9]{17}$', vin):
            return jsonify({
                'success': False,
                'error': 'Invalid VIN format. VINs contain 17 alphanumeric characters (excluding I, O, Q).'
            }), 400
        
        # NHTSA API call for extended VIN data
        try:
            base_url = "https://vpic.nhtsa.dot.gov/api/vehicles/DecodeVinValuesExtended"
            
            if year:
                url = f"{base_url}/{vin}?format=json&modelyear={year}"
            else:
                url = f"{base_url}/{vin}?format=json"
            
            response = requests.get(url, timeout=30)
            response.raise_for_status()
            
            nhtsa_data = response.json()
            
            if response.status_code == 200 and nhtsa_data.get('Results'):
                result = nhtsa_data['Results'][0]
                
                # Check for errors in the response
                error_code = result.get('ErrorCode', '')
                if error_code and error_code != '0':
                    error_text = result.get('ErrorText', 'Unknown error occurred')
                    return jsonify({
                        'success': False,
                        'error': f"NHTSA API Error: {error_text}"
                    }), 400
                
                # Extract ADAS features
                adas_features = []
                
                # ADAS feature fields mapping
                adas_field_mapping = [
                    ('Adaptive Cruise Control (ACC)', 'AdaptiveCruiseControl'),
                    ('Anti-lock Braking System (ABS)', 'ABS'),
                    ('Crash Imminent Braking (CIB)', 'CrashImminentBrakingCIB'),
                    ('Blind Spot Warning (BSW)', 'BlindSpotMon'),
                    ('Electronic Stability Control (ESC)', 'ESC'),
                    ('Traction Control', 'TractionControl'),
                    ('Forward Collision Warning (FCW)', 'ForwardCollisionWarning'),
                    ('Lane Departure Warning (LDW)', 'LaneDepartureWarning'),
                    ('Lane Keeping Assistance (LKA)', 'LaneKeepSystem'),
                    ('Backup Camera (BUC)', 'BackupCamera'),
                    ('Parking Assist (APA)', 'ParkingAssist'),
                    ('Dynamic Brake Support (DBS)', 'DynamicBrakeSupport'),
                    ('Pedestrian Automatic Emergency Braking (PAEB)', 'PedestrianAutomaticEmergencyBraking'),
                    ('Blind Spot Intervention (BSI)', 'BlindSpotInterventionBSI'),
                    ('Lane Centering Assistance', 'LaneCenteringAssistance'),
                    ('Rear Cross Traffic Alert', 'RearCrossTrafficAlert'),
                    ('Rear Automatic Emergency Braking (AEB)', 'RearAutomaticEmergencyBraking'),
                    ('Automatic Emergency Braking (AEB)', 'AutomaticEmergencyBraking'),
                    ('Night Vision (NV)', 'NightVision'),
                    ('Adaptive Headlights (AHL)', 'AdaptiveHeadlights'),
                    ('Semi-automatic Headlamp Beam Switching', 'SemiautomaticHeadlampBeamSwitching'),
                    ('Surround View Camera (SVC)', 'SurroundViewCamera'),
                    ('Lane Watch (Honda)', 'LaneWatch'),
                    ('Auto Park Assist', 'AutoParkAssist'),
                    ('Collision Avoidance', 'CollisionAvoidance'),
                    ('Driver Attention Monitor', 'DriverAttentionMonitor'),
                    ('Traffic Sign Recognition', 'TrafficSignRecognition')
                ]
                
                for display_name, field_name in adas_field_mapping:
                    value = result.get(field_name, '')
                    if value and value.lower() not in ['not available', '', 'no', 'not applicable', 'n/a']:
                        adas_features.append({
                            'name': display_name,
                            'value': value,
                            'field': field_name
                        })
                
                # Extract passive safety features
                passive_features = []
                passive_field_mapping = [
                    ('Front Air Bag Locations', 'AirBagLocFront'),
                    ('Side Air Bag Locations', 'AirBagLocSide'),
                    ('Curtain Air Bag Locations', 'AirBagLocCurtain'),
                    ('Knee Air Bag Locations', 'AirBagLocKnee'),
                    ('Seat Cushion Air Bag Locations', 'SeatCushionAirBagLocations'),
                    ('Seat Belt Type', 'SeatBeltsAll'),
                    ('Pretensioner', 'Pretensioner')
                ]
                
                for display_name, field_name in passive_field_mapping:
                    value = result.get(field_name, '')
                    if value and value.lower() not in ['not available', '', 'no', 'not applicable', 'n/a']:
                        passive_features.append({
                            'name': display_name,
                            'value': value,
                            'field': field_name
                        })
                
                # Extract other safety features
                other_features = []
                other_field_mapping = [
                    ('Tire Pressure Monitoring System (TPMS)', 'TirePressureMonitoringSystemTPMSType'),
                    ('Daytime Running Light (DRL)', 'DaytimeRunningLightDRL'),
                    ('Headlamp Light Source', 'HeadlampLightSource'),
                    ('Adaptive Driving Beam (ADB)', 'AdaptiveDrivingBeamADB'),
                    ('Auto-Reverse System for Windows', 'AutoReverseSystemforWindowsandSunroofs'),
                    ('Keyless Ignition', 'KeylessIgnition'),
                    ('Event Data Recorder (EDR)', 'EventDataRecorderEDR'),
                    ('SAE Automation Level From', 'SAEAutomationLevelFrom'),
                    ('SAE Automation Level To', 'SAEAutomationLevelTo')
                ]
                
                for display_name, field_name in other_field_mapping:
                    value = result.get(field_name, '')
                    if value and value.lower() not in ['not available', '', 'no', 'not applicable', 'n/a']:
                        other_features.append({
                            'name': display_name,
                            'value': value,
                            'field': field_name
                        })
                
                # Get basic vehicle info for context
                vehicle_info = {
                    'make': result.get('Make', ''),
                    'model': result.get('Model', ''),
                    'year': result.get('ModelYear', ''),
                    'trim': result.get('Trim', ''),
                    'body_class': result.get('BodyClass', '')
                }
                
                return jsonify({
                    'success': True,
                    'vehicle_info': vehicle_info,
                    'adas_features': adas_features,
                    'passive_features': passive_features,
                    'other_features': other_features,
                    'total_features': len(adas_features) + len(passive_features) + len(other_features),
                    'data_source': 'NHTSA vPIC API'
                })
            else:
                return jsonify({
                    'success': False,
                    'error': 'No data found for this VIN in NHTSA database'
                }), 404
                
        except requests.exceptions.RequestException as e:
            return jsonify({
                'success': False,
                'error': f"Network error accessing NHTSA API: {str(e)}"
            }), 500
        except Exception as e:
            return jsonify({
                'success': False,
                'error': f"Error processing NHTSA data: {str(e)}"
            }), 500
            
    except Exception as e:
        print(f"Error in NHTSA ADAS API: {str(e)}")
        return jsonify({
            'success': False,
            'error': str(e)
        }), 500

# Add this at the end of the file to run the application
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
