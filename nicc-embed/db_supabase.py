from db_config import get_supabase_client, is_supabase_configured
import sqlite3
import os
import datetime
import time
import uuid
from dotenv import load_dotenv
import random
from supabase import create_client
import traceback

class SupabaseHelper:
    """Helper class for Supabase database operations
    
    This class provides methods to interact with Supabase tables,
    with a fallback to SQLite if Supabase is not configured.
    """
    
    use_supabase = True  # Set default to True to prioritize Supabase
    
    def __init__(self, use_supabase=True):  # Default to True to always try Supabase first
        """Initialize the helper with Supabase connection"""
        self.use_supabase = use_supabase
        
        # Always try to use Supabase credentials from env
        self.supabase_url = os.environ.get('SUPABASE_URL')
        self.supabase_key = os.environ.get('SUPABASE_KEY')
        
        # Require Supabase URL and key
        if not self.supabase_url or not self.supabase_key:
            print("ERROR: Supabase URL and API Key must be set in environment variables")
            print("Please add SUPABASE_URL and SUPABASE_KEY to your .env file")
            print("Attempting to use SQLite as fallback")
            self.use_supabase = False
        else:
            print(f"DEBUG: Supabase configuration detected: {self.use_supabase}")
            
        if self.use_supabase:
            try:
                # Initialize Supabase client
                self.supabase = create_client(
                    self.supabase_url,
                    self.supabase_key
                )
                
                # Test connection
                response = self.supabase.table('chats').select('count', count='exact').limit(1).execute()
                print("Connected to Supabase successfully")
                print("DEBUG: Supabase test query successful")
                
                # Verify vehicle data tables
                self.verify_vehicle_data()
                
            except Exception as e:
                print(f"ERROR: Could not connect to Supabase: {str(e)}")
                print("Falling back to SQLite, but this is not recommended")
                self.use_supabase = False
        else:
            print("WARNING: Using SQLite for data storage (not recommended)")
            self.supabase = None
    
    def verify_vehicle_data(self):
        """Verify that vehicle data tables exist and have data"""
        try:
            if not self.use_supabase:
                return False
                
            # Check master_vehicles table
            response = self.supabase.table('master_vehicles').select('count', count='exact').limit(1).execute()
            master_count = response.count if hasattr(response, 'count') else 0
            
            # Check a few specific make tables
            make_tables = ['hyundai', 'toyota', 'honda', 'ford', 'chevrolet']
            table_counts = {}
            
            for make in make_tables:
                try:
                    response = self.supabase.table(make).select('count', count='exact').limit(1).execute()
                    table_counts[make] = response.count if hasattr(response, 'count') else 0
                except Exception as e:
                    table_counts[make] = f"Error: {str(e)}"
            
            # Log the results
            print(f"Vehicle data verification in Supabase:")
            print(f"- master_vehicles table: {master_count} records")
            for make, count in table_counts.items():
                print(f"- {make} table: {count} records")
                
            # Return success even if some tables don't have data
            # We'll attempt to use whatever is available
            return True
            
        except Exception as e:
            print(f"Error verifying vehicle data: {str(e)}")
            return False
    
    def get_sqlite_connection(self, db_name):
        """Get a connection to a SQLite database"""
        conn = sqlite3.connect(db_name)
        conn.row_factory = sqlite3.Row
        return conn
    
    # Vehicle data operations
    def query_vehicle_database(self, make, model, year=None):
        """Query the database for vehicle information.
        
        This method will search for vehicle data in various tables,
        including make-specific tables and the master_vehicles table.
        
        Args:
            make: The vehicle make (e.g., 'Toyota')
            model: The vehicle model (e.g., 'Camry')
            year: Optional year of the vehicle (e.g., '2020')
            
        Returns:
            A dictionary with the query results.
        """
        print(f"DEBUG: query_vehicle_database called with make='{make}', model='{model}', year='{year}'")
        print(f"DEBUG: Year parameter type: {type(year)}, value: {year}")
        
        if not make or not model:
            return {"found": False, "error": "Make and model are required"}

        # Process input parameters
        # Clean and prepare the search values
        make_clean = make.upper() if make else None
        model_clean = model.upper() if model else None
        
        # Clean year parameter
        year_clean = None
        original_year = year  # Save the original year for comparison
        if year:
            try:
                # Remove decimal part if present
                if isinstance(year, str) and '.' in year:
                    year_clean = year.split('.')[0]
                elif isinstance(year, (int, float)):
                    year_clean = str(int(year))
                else:
                    year_clean = str(year)
                print(f"DEBUG: Cleaned year from '{original_year}' to '{year_clean}'")
            except (ValueError, TypeError):
                # Keep original if conversion fails
                year_clean = str(year)
                print(f"DEBUG: Failed to clean year, using original: '{year_clean}'")
        else:
            print(f"DEBUG: No year provided in search parameters")
        
        print(f"DEBUG: After cleaning: make='{make_clean}', model='{model_clean}', year='{year_clean}'")
        
        print(f"DEBUG: Querying vehicle database for make='{make_clean}', model='{model_clean}', year='{year_clean}'")
        
        # Variables to track our search results
        exact_year_results = []
        closest_year_results = []
        requested_year = year_clean

        # Important: Save the originally requested year to include in the response
        originally_requested_year = year_clean
        
        # If Supabase is configured, use it
        if self.use_supabase and self.supabase:
            print("DEBUG: Using Supabase for vehicle query")
            
            # First try the make-specific table directly without checking available tables
            make_table = make.lower().replace(" ", "_") if make else None
            
            if make_table:
                print(f"DEBUG: Trying make-specific table: {make_table}")
                
                try:
                    # NEW APPROACH: First query for the model without year filter to get all available years
                    model_query = self.supabase.table(make_table).select("*").like("model", f"%{model_clean}%")
                    print(f"DEBUG: Getting all model years - {make_table} table model LIKE %{model_clean}%")
                    model_response = model_query.execute()
                    
                    if model_response.data and len(model_response.data) > 0:
                        print(f"DEBUG: Found {len(model_response.data)} results for model {model_clean}")
                        
                        # If year was provided, find exact match or closest year
                        if year_clean:
                            # Extract all years for this model and sort them
                            available_years = []
                            for row in model_response.data:
                                if row.get('year'):
                                    # Normalize the year format
                                    try:
                                        if isinstance(row['year'], str) and '.' in row['year']:
                                            row_year = row['year'].split('.')[0]
                                        else:
                                            row_year = str(int(float(row['year'])))
                                        available_years.append(row_year)
                                    except (ValueError, TypeError):
                                        available_years.append(str(row['year']))
                            
                            # Remove duplicates and sort
                            available_years = sorted(set(available_years), key=int)
                            print(f"DEBUG: Available years for {make_clean} {model_clean}: {available_years}")
                            
                            # Check if requested year exists
                            if year_clean in available_years:
                                print(f"DEBUG: Exact year match found: {year_clean}")
                                # Filter results to exact year match
                                exact_matches = []
                                for row in model_response.data:
                                    row_year = str(row.get('year', '')).split('.')[0] if isinstance(row.get('year', ''), str) else str(row.get('year', ''))
                                    if row_year == year_clean:
                                        exact_matches.append(row)
                                
                                print(f"DEBUG: Found {len(exact_matches)} exact year matches")
                                return {
                                    "found": True,
                                    "data": exact_matches,
                                    "is_multiple": len(exact_matches) > 1
                                }
                            else:
                                print(f"DEBUG: No exact year match for {year_clean}, finding closest year")
                                
                                # Find closest available year
                                if available_years:
                                    # Convert requested year to integer for comparison
                                    requested_year_int = int(year_clean)
                                    closest_year = None
                                    min_diff = float('inf')
                                    
                                    for yr in available_years:
                                        yr_int = int(yr)
                                        diff = abs(yr_int - requested_year_int)
                                        if diff < min_diff:
                                            min_diff = diff
                                            closest_year = yr
                                    
                                    print(f"DEBUG: Closest available year: {closest_year} (diff: {min_diff} years)")
                                    
                                    # Filter results to closest year
                                    closest_matches = []
                                    for row in model_response.data:
                                        row_year = str(row.get('year', '')).split('.')[0] if isinstance(row.get('year', ''), str) else str(row.get('year', ''))
                                        if row_year == closest_year:
                                            closest_matches.append(row)
                                    
                                    print(f"DEBUG: Found {len(closest_matches)} matches for closest year {closest_year}")
                                    return {
                                        "found": True,
                                        "data": closest_matches,
                                        "is_multiple": len(closest_matches) > 1,
                                        "note": f"Note: Showing data for {closest_year} {make} {model} as the closest match for your {originally_requested_year} {make} {model} query."
                                    }
                                else:
                                    print(f"DEBUG: No years available for {make_clean} {model_clean}")
                        
                        # If no year filter or no closest year found, return all model matches
                        print(f"DEBUG: Returning all {len(model_response.data)} model matches")
                        return {
                            "found": True,
                            "data": model_response.data,
                            "is_multiple": len(model_response.data) > 1
                        }
                except Exception as e:
                    print(f"DEBUG: Error querying {make_table} table: {str(e)}")
                    print(f"DEBUG: Will try alternate tables")
            
            # Try known tables directly - don't rely on pg_catalog query
            alternate_tables = ['hyundai', 'toyota', 'honda', 'ford', 'chevrolet', 'nissan', 
                               'mazda', 'kia', 'lexus', 'volkswagen', 'bmw', 'acura', 'audi', 
                               'subaru', 'mercedes', 'ram', 'cadillac', 'volvo', 'porsche', 'mini']
            
            # Skip the table we already tried
            if make_table in alternate_tables:
                alternate_tables.remove(make_table)
                
            # Try each alternate table
            for table in alternate_tables:
                try:
                    print(f"DEBUG: Trying alternative table: {table}")
                    
                    # If year is provided, try to filter by year directly in the query
                    if year_clean:
                        # Try with exact year first
                        year_query = self.supabase.table(table).select("*").eq("year", year_clean)
                        year_response = year_query.execute()
                        
                        # If no results, try with decimal format
                        if not year_response.data or len(year_response.data) == 0:
                            year_query = self.supabase.table(table).select("*").eq("year", f"{year_clean}.0")
                            year_response = year_query.execute()
                        
                        # If we found results with year filtering
                        if year_response.data and len(year_response.data) > 0:
                            response = year_response
                        else:
                            # If no results with year filtering, get all records and filter manually
                            query = self.supabase.table(table).select("*").limit(500)  # Increased limit
                            response = query.execute()
                    else:
                        # No year provided, get all records
                        query = self.supabase.table(table).select("*").limit(500)  # Increased limit
                        response = query.execute()
                    
                    if response.data:
                        # Filter results manually for both make and model
                        exact_year_matches = []
                        model_matches = []
                        
                        for item in response.data:
                            # Check if make and model match (case-insensitive)
                            item_make = str(item.get('make', '')).upper()
                            item_model = str(item.get('model', '')).upper()
                            
                            make_match = make_clean in item_make or item_make in make_clean
                            model_match = model_clean in item_model or item_model in model_clean
                            
                            if make_match and model_match:
                                # If year is specified, check if it matches
                                if year_clean:
                                    item_year = str(item.get('year', ''))
                                    # Remove decimal part if present
                                    if '.' in item_year:
                                        item_year = item_year.split('.')[0]
                                        
                                    # Sort into appropriate result list
                                    if year_clean == item_year:
                                        exact_year_matches.append(item)
                                    else:
                                        model_matches.append(item)
                                else:
                                    # No year specified, add all model matches
                                    model_matches.append(item)
                        
                        # First check if we have exact year matches
                        if year_clean and len(exact_year_matches) > 0:
                            print(f"DEBUG: Found {len(exact_year_matches)} exact year matches in {table} table")
                            return {"found": True, "data": exact_year_matches, "is_multiple": len(exact_year_matches) > 1}
                        
                        # Fall back to model matches if necessary
                        elif len(model_matches) > 0:
                            print(f"DEBUG: Found {len(model_matches)} model matches in {table} table, but no exact year matches")
                            
                            # Only return non-year-specific matches if no year was requested
                            if not year_clean:
                                return {"found": True, "data": model_matches, "is_multiple": len(model_matches) > 1}
                            else:
                                # Find closest year match
                                closest_year = None
                                closest_diff = float('inf')
                                closest_year_items = []
                                
                                try:
                                    requested_year_int = int(year_clean)
                                    
                                    # Group model matches by year
                                    years_dict = {}
                                    for item in model_matches:
                                        item_year = str(item.get('year', ''))
                                        # Remove decimal part if present
                                        if '.' in item_year:
                                            item_year = item_year.split('.')[0]
                                            
                                        if item_year:
                                            if item_year not in years_dict:
                                                years_dict[item_year] = []
                                            years_dict[item_year].append(item)
                                    
                                    # Find closest year
                                    for available_year in years_dict:
                                        try:
                                            available_year_int = int(available_year)
                                            year_diff = abs(requested_year_int - available_year_int)
                                            
                                            if year_diff < closest_diff:
                                                closest_diff = year_diff
                                                closest_year = available_year
                                                closest_year_items = years_dict[available_year]
                                        except ValueError:
                                            continue
                                    
                                    if closest_year:
                                        print(f"DEBUG: Closest available year is {closest_year} (requested: {year_clean})")
                                        note = f"No exact match for {year_clean} {make} {model}, showing data for {closest_year} {make} {model}"
                                        return {
                                            "found": True, 
                                            "data": closest_year_items, 
                                            "is_multiple": len(closest_year_items) > 1,
                                            "note": note
                                        }
                                        
                                except ValueError:
                                    # If we can't parse years as integers, just return all model matches
                                    pass
                                
                                # Mark as approximate match
                                return {
                                    "found": True, 
                                    "data": model_matches, 
                                    "is_multiple": len(model_matches) > 1,
                                    "note": f"No exact match for {year_clean} {make} {model}, showing available data"
                                }
                except Exception as e:
                    print(f"DEBUG: Error querying {table} table: {str(e)}")
                    continue  # Try next table
            
            # If we reach here, we've tried all tables but found nothing
            print("DEBUG: No matching vehicle found in any Supabase table")
            
            # Only fall back to SQLite if configured to do so
            if not self.use_supabase:
                print("DEBUG: Falling back to SQLite database")
            else:
                return {"found": False, "error": f"No matching vehicle found in Supabase for {year_clean} {make} {model}"}
        
        # Fallback to SQLite
        conn = self.get_sqlite_connection('NiccDB.db')
        cursor = conn.cursor()
        
        # Convert model and make for consistent search
        model_upper = model.upper() if model else None
        make_upper = make.upper() if make else None
        
        # Collect all results in this list
        results = []
        exact_year_results = []
        
        # First try make-specific table if it exists
        make_table = make.lower() if make else None
        if make_table:
            # Check if the table exists
            cursor.execute("SELECT name FROM sqlite_master WHERE type='table' AND name=?", 
                          (make_table,))
            table_exists = cursor.fetchone() is not None
            
            if table_exists:
                # Make table exists, query it directly
                query = f"SELECT * FROM {make_table} WHERE 1=1"
                params = []
                
                if model:
                    query += " AND UPPER(model) LIKE ?"
                    params.append(f"%{model_upper}%")
                    
                if year_clean:
                    # Handle both exact year and year.0 format
                    query += " AND (year = ? OR year LIKE ?)"
                    params.append(year_clean)
                    params.append(f"{year_clean}.%")
                    
                cursor.execute(query, params)
                rows = cursor.fetchall()
                
                if rows:
                    # Convert rows to dictionaries for easier handling
                    for row in rows:
                        row_dict = dict(row)
                        # If there's a year, check if it's an exact match
                        if year_clean and 'year' in row_dict:
                            row_year = str(row_dict['year'])
                            if '.' in row_year:
                                row_year = row_year.split('.')[0]
                            
                            if row_year == year_clean:
                                exact_year_results.append(row_dict)
                            else:
                                results.append(row_dict)
                        else:
                            results.append(row_dict)
        
        # Try master_vehicles with exact match if it exists
        if not exact_year_results and not results:  # Only if no results found yet
            query = "SELECT * FROM master_vehicles WHERE 1=1"
            params = []
            
            if make:
                query += " AND UPPER(make) LIKE ?"
                params.append(f"%{make_upper}%")
                
            if model:
                query += " AND UPPER(model) LIKE ?"
                params.append(f"%{model_upper}%")
                
            if year_clean:
                # Handle both exact year and year.0 format
                query += " AND (year = ? OR year LIKE ? OR year LIKE ?)"
                params.append(year_clean)
                params.append(f"{year_clean}.%")
                params.append(f"%{year_clean}")  # Also try if year is at the end of string
                
            cursor.execute(query, params)
            rows = cursor.fetchall()
            
            if rows:
                # Convert rows to dictionaries
                for row in rows:
                    row_dict = dict(row)
                    # Check for exact year match
                    if year_clean and 'year' in row_dict:
                        row_year = str(row_dict['year'])
                        if '.' in row_year:
                            row_year = row_year.split('.')[0]
                        
                        if row_year == year_clean:
                            exact_year_results.append(row_dict)
                        else:
                            results.append(row_dict)
                    else:
                        results.append(row_dict)
        
        conn.close()
        
        # Return results if any found, prioritizing exact year matches
        if exact_year_results:
            return {"found": True, "data": exact_year_results, "is_multiple": len(exact_year_results) > 1}
        elif results:
            return {"found": True, "data": results, "is_multiple": len(results) > 1, 
                    "note": f"No exact match for {year_clean} {make} {model}, showing closest available data"}
        
        return {"found": False, "error": "Vehicle not found in database"}
    
    # Chat operations
    def create_new_chat(self, user_id="anonymous"):
        """Create a new chat and return the chat_id"""
        try:
            # Generate a new chat ID with a timestamp prefix for ordering
            timestamp = int(time.time())
            random_suffix = ''.join(random.choices('0123456789abcdef', k=8))
            chat_id = f"chat_{timestamp}_{random_suffix}"
            
            # Set timestamps
            created_at = datetime.datetime.now().isoformat()
            updated_at = created_at
            
            # Default chat name
            chat_name = "New Chat"
            
            print(f"DEBUG: Creating new chat with ID: {chat_id} for user: {user_id}")
            
            supabase_success = False
            sqlite_success = False
            
            # Save to Supabase if available
            if self.use_supabase:
                try:
                    print(f"DEBUG: Saving chat to Supabase")
                    response = self.supabase.table('chats').insert({
                        'chat_id': chat_id,
                        'user_id': user_id,
                        'chat_name': chat_name,
                        'created_at': created_at,
                        'updated_at': updated_at,
                        'is_pinned': False
                    }).execute()
                    
                    if response.data:
                        print(f"DEBUG: Successfully saved chat to Supabase: {response.data}")
                        supabase_success = True
                    else:
                        print(f"DEBUG: No data returned from Supabase insert")
                except Exception as e:
                    print(f"DEBUG: Error saving to Supabase: {str(e)}")
            
            # Always save to SQLite as fallback
            try:
                print(f"DEBUG: Saving chat to SQLite")
                conn = self.get_sqlite_connection('chats.db')
                cursor = conn.cursor()
                
                # Check if chats table exists
                cursor.execute("SELECT name FROM sqlite_master WHERE type='table' AND name='chats'")
                if not cursor.fetchone():
                    print(f"DEBUG: Creating chats table in SQLite")
                    cursor.execute('''
                    CREATE TABLE chats (
                        id INTEGER PRIMARY KEY AUTOINCREMENT,
                        chat_id TEXT UNIQUE,
                        user_id TEXT,
                        chat_name TEXT,
                        created_at TEXT,
                        updated_at TEXT,
                        is_pinned INTEGER DEFAULT 0
                    )
                    ''')
                
                # Insert the new chat
                cursor.execute('''
                INSERT INTO chats (chat_id, user_id, chat_name, created_at, updated_at, is_pinned)
                VALUES (?, ?, ?, ?, ?, ?)
                ''', (chat_id, user_id, chat_name, created_at, updated_at, 0))
                
                conn.commit()
                conn.close()
                
                print(f"DEBUG: Successfully saved chat to SQLite")
                sqlite_success = True
            except Exception as e:
                print(f"DEBUG: Error saving to SQLite: {str(e)}")
            
            if supabase_success or sqlite_success:
                return chat_id
            else:
                raise Exception("Failed to create chat in both Supabase and SQLite")
        except Exception as e:
            print(f"Error creating new chat: {str(e)}")
            return None
    
    def get_chat_messages(self, chat_id):
        """Get all messages for a specific chat"""
        try:
            if self.use_supabase:
                try:
                    # Get messages from Supabase
                    print(f"DEBUG: Getting messages for chat_id {chat_id} from Supabase")
                    response = self.supabase.table('messages') \
                        .select('id', 'role', 'content', 'timestamp') \
                        .eq('chat_id', chat_id) \
                        .order('timestamp', desc=False) \
                        .execute()
                    
                    print(f"DEBUG: Supabase found {len(response.data)} messages")
                    
                    if response.data:
                        # Format messages for the frontend
                        messages = []
                        for message in response.data:
                            # Ensure content is a string
                            content = message.get('content', '')
                            if content is None:
                                content = ''
                                
                            formatted_message = {
                                'id': message.get('id'),
                                'role': message.get('role', 'assistant'),
                                'content': content,
                                'timestamp': message.get('timestamp')
                            }
                            messages.append(formatted_message)
                        
                        print(f"DEBUG: Formatted {len(messages)} messages for frontend")
                        return messages
                    
                    # If no messages found, fall back to SQLite
                    print("DEBUG: No messages found in Supabase, falling back to SQLite")
                except Exception as e:
                    print(f"Error getting chat messages from Supabase: {str(e)}")
                    traceback.print_exc()  # Print full stack trace for debugging
                    print("DEBUG: Falling back to SQLite for this operation")
            
            # Fallback to SQLite
            conn = self.get_sqlite_connection('chats.db')
            cursor = conn.cursor()
            cursor.execute('''
                SELECT id, role, content, timestamp 
                FROM messages 
                WHERE chat_id = ? 
                ORDER BY timestamp ASC
            ''', (chat_id,))
            
            messages = []
            for row in cursor.fetchall():
                # Ensure content is a string
                content = row[2]
                if content is None:
                    content = ''
                
                messages.append({
                    'id': row[0],
                    'role': row[1],
                    'content': content,
                    'timestamp': row[3]
                })
            conn.close()
            
            print(f"DEBUG: SQLite found {len(messages)} messages")
            return messages
        except Exception as e:
            print(f"Error getting chat messages: {str(e)}")
            traceback.print_exc()  # Print full stack trace for debugging
            return []
    
    def save_message(self, chat_id, role, content):
        """Save a message to the database"""
        try:
            # Get current timestamp
            timestamp = datetime.datetime.now().isoformat()
            
            if self.use_supabase:
                # Update the chat's updated_at timestamp
                chat_update = {
                    'updated_at': timestamp
                }
                self.supabase.table('chats') \
                    .update(chat_update) \
                    .eq('chat_id', chat_id) \
                    .execute()
                
                # Save the message
                message_data = {
                    'chat_id': chat_id,
                    'role': role,
                    'content': content,
                    'timestamp': timestamp
                }
                self.supabase.table('messages').insert(message_data).execute()
            else:
                # Fallback to SQLite
                conn = self.get_sqlite_connection('chats.db')
                cursor = conn.cursor()
                cursor.execute(
                    "UPDATE chats SET updated_at = ? WHERE chat_id = ?",
                    (timestamp, chat_id)
                )
                
                # Save the message
                cursor.execute(
                    "INSERT INTO messages (chat_id, role, content, timestamp) VALUES (?, ?, ?, ?)",
                    (chat_id, role, content, timestamp)
                )
                conn.commit()
                conn.close()
            
            return True
        except Exception as e:
            print(f"Error saving message: {str(e)}")
            return False
    
    def update_chat_name(self, chat_id, new_name):
        """Update a chat's name"""
        try:
            # Get current timestamp
            timestamp = datetime.datetime.now().isoformat()
            
            if self.use_supabase:
                # Update the chat's name and updated_at timestamp in Supabase
                chat_update = {
                    'chat_name': new_name,
                    'updated_at': timestamp
                }
                self.supabase.table('chats') \
                    .update(chat_update) \
                    .eq('chat_id', chat_id) \
                    .execute()
            else:
                # Fallback to SQLite
                conn = self.get_sqlite_connection('chats.db')
                cursor = conn.cursor()
                cursor.execute(
                    "UPDATE chats SET chat_name = ?, updated_at = ? WHERE chat_id = ?",
                    (new_name, timestamp, chat_id)
                )
                conn.commit()
                conn.close()
            
            print(f"Updated chat {chat_id} name to: {new_name}")
            return True
        except Exception as e:
            print(f"Error updating chat name: {str(e)}")
            return False
    
    def get_chats(self, user_id="anonymous"):
        """Get all chats for a user"""
        try:
            print(f"DEBUG: Getting chats for user_id: {user_id}")
            print(f"DEBUG: Using Supabase: {self.use_supabase}")
            
            if self.use_supabase:
                try:
                    # Query chats from Supabase
                    response = self.supabase.table('chats') \
                        .select('chat_id', 'chat_name', 'created_at', 'updated_at', 'is_pinned') \
                        .eq('user_id', user_id) \
                        .order('updated_at', desc=True) \
                        .execute()
                    
                    print(f"DEBUG: Supabase query returned {len(response.data)} chats")
                    
                    if response.data:
                        return response.data
                    
                    # If no data found in Supabase, try SQLite as fallback
                    print("DEBUG: No chats found in Supabase, trying SQLite fallback")
                except Exception as e:
                    print(f"DEBUG: Error querying Supabase: {str(e)}")
                    print("DEBUG: Falling back to SQLite for this operation")
            
            # SQLite fallback (runs if Supabase is disabled or if Supabase query fails)
            conn = self.get_sqlite_connection('chats.db')
            cursor = conn.cursor()
            
            # First check if is_pinned column exists
            cursor.execute("PRAGMA table_info(chats)")
            columns = [column[1] for column in cursor.fetchall()]
            
            query = "SELECT chat_id, chat_name, created_at, updated_at"
            if 'is_pinned' in columns:
                query += ", is_pinned"
            else:
                # Add the column if it doesn't exist
                try:
                    cursor.execute("ALTER TABLE chats ADD COLUMN is_pinned INTEGER DEFAULT 0")
                    conn.commit()
                    print("DEBUG: Added is_pinned column to chats table")
                    query += ", is_pinned"
                except Exception as e:
                    print(f"DEBUG: Error adding is_pinned column: {str(e)}")
                    query += ", 0 as is_pinned"
                    
            query += " FROM chats WHERE user_id = ? ORDER BY updated_at DESC"
            
            cursor.execute(query, (user_id,))
            
            # Prepare chat data
            chats = []
            for row in cursor.fetchall():
                chat_data = {
                    'chat_id': row[0], 
                    'chat_name': row[1], 
                    'created_at': row[2], 
                    'updated_at': row[3]
                }
                
                # Add is_pinned if it's in the result
                if len(row) > 4:
                    # Convert to boolean
                    chat_data['is_pinned'] = bool(row[4])
                else:
                    chat_data['is_pinned'] = False
                    
                chats.append(chat_data)
                
            conn.close()
            
            print(f"DEBUG: SQLite returned {len(chats)} chats")
            return chats
        except Exception as e:
            print(f"Error getting chats: {str(e)}")
            return []
    
    def delete_chat(self, chat_id):
        """Delete a chat and its messages"""
        print(f"DEBUG: Deleting chat {chat_id}")
        try:
            deleted_from_supabase = False
            deleted_from_sqlite = False
            
            if self.use_supabase:
                try:
                    # Delete messages first
                    self.supabase.table('messages') \
                        .delete() \
                        .eq('chat_id', chat_id) \
                        .execute()
                    
                    # Then delete the chat
                    self.supabase.table('chats') \
                        .delete() \
                        .eq('chat_id', chat_id) \
                        .execute()
                    
                    deleted_from_supabase = True
                    print(f"DEBUG: Successfully deleted chat {chat_id} from Supabase")
                except Exception as e:
                    print(f"DEBUG: Error deleting chat from Supabase: {str(e)}")
            
            # Always delete from SQLite as fallback
            try:
                # Fallback to SQLite
                conn = self.get_sqlite_connection('chats.db')
                cursor = conn.cursor()
                
                # First delete all messages
                cursor.execute("DELETE FROM messages WHERE chat_id = ?", (chat_id,))
                messages_deleted = cursor.rowcount
                
                # Then delete the chat
                cursor.execute("DELETE FROM chats WHERE chat_id = ?", (chat_id,))
                chats_deleted = cursor.rowcount
                
                conn.commit()
                conn.close()
                
                deleted_from_sqlite = True
                print(f"DEBUG: Successfully deleted chat {chat_id} from SQLite ({messages_deleted} messages, {chats_deleted} chat records)")
            except Exception as e:
                print(f"DEBUG: Error deleting chat from SQLite: {str(e)}")
            
            # Return success if deleted from either database
            return deleted_from_supabase or deleted_from_sqlite
        except Exception as e:
            print(f"Error deleting chat: {str(e)}")
            return False
    
    def cleanup_chats(self, user_id="anonymous", keep_recent=5):
        """Clean up old chats, keeping only the most recent ones and all pinned chats"""
        try:
            if self.use_supabase:
                # First, get all pinned chats for this user (these will be preserved)
                pinned_response = self.supabase.table('chats') \
                    .select('chat_id', 'chat_name', 'updated_at') \
                    .eq('user_id', user_id) \
                    .eq('is_pinned', True) \
                    .execute()
                
                pinned_chats = pinned_response.data if pinned_response.data else []
                pinned_chat_ids = [chat['chat_id'] for chat in pinned_chats]
                
                # Get all unpinned chats for this user, ordered by updated_at
                response = self.supabase.table('chats') \
                    .select('chat_id', 'chat_name', 'updated_at') \
                    .eq('user_id', user_id) \
                    .eq('is_pinned', False) \
                    .order('updated_at', desc=True) \
                    .execute()
                
                unpinned_chats = response.data if response.data else []
                
                # Keep the most recent unpinned chats, delete the rest
                chats_to_keep = unpinned_chats[:keep_recent]
                chats_to_delete = unpinned_chats[keep_recent:]
                
                deleted_chats = []
                for chat in chats_to_delete:
                    # Delete the chat
                    self.delete_chat(chat['chat_id'])
                    deleted_chats.append({"chat_id": chat['chat_id'], "chat_name": chat['chat_name']})
                    
                return {
                    'success': True, 
                    'deleted_count': len(deleted_chats), 
                    'kept_count': len(chats_to_keep) + len(pinned_chats),
                    'pinned_count': len(pinned_chats),
                    'deleted_chats': deleted_chats
                }
            
            # SQLite fallback
            try:
                conn = self.get_sqlite_connection('chats.db')
                cursor = conn.cursor()
                
                # First, get all pinned chats (these will be preserved)
                try:
                    # Check if is_pinned column exists
                    cursor.execute("PRAGMA table_info(chats)")
                    columns = [col[1] for col in cursor.fetchall()]
                    
                    pinned_chat_ids = []
                    if 'is_pinned' in columns:
                        cursor.execute(
                            "SELECT chat_id FROM chats WHERE user_id = ? AND is_pinned = 1",
                            (user_id,)
                        )
                        pinned_chat_ids = [row[0] for row in cursor.fetchall()]
                    
                except Exception as e:
                    print(f"Error getting pinned chats: {str(e)}")
                    pinned_chat_ids = []
                
                # Get all unpinned chats for this user, ordered by updated_at
                if 'is_pinned' in columns:
                    query = """
                        SELECT chat_id, chat_name, updated_at 
                        FROM chats 
                        WHERE user_id = ? AND (is_pinned = 0 OR is_pinned IS NULL)
                        ORDER BY updated_at DESC
                    """
                else:
                    # If is_pinned column doesn't exist, get all chats except pinned ones
                    pinned_placeholders = ','.join(['?'] * len(pinned_chat_ids)) if pinned_chat_ids else "''"
                    query = f"""
                        SELECT chat_id, chat_name, updated_at 
                        FROM chats 
                        WHERE user_id = ? AND chat_id NOT IN ({pinned_placeholders})
                        ORDER BY updated_at DESC
                    """
                
                params = [user_id]
                if pinned_chat_ids and 'is_pinned' not in columns:
                    params.extend(pinned_chat_ids)
                
                cursor.execute(query, params)
                unpinned_chats = cursor.fetchall()
                
                # Keep the most recent chats, delete the rest
                chats_to_keep = unpinned_chats[:keep_recent]
                chats_to_delete = unpinned_chats[keep_recent:]
                
                deleted_chats = []
                for chat_id, chat_name, updated_at in chats_to_delete:
                    # Delete messages for this chat
                    cursor.execute("DELETE FROM messages WHERE chat_id = ?", (chat_id,))
                    # Delete the chat
                    cursor.execute("DELETE FROM chats WHERE chat_id = ?", (chat_id,))
                    deleted_chats.append({"chat_id": chat_id, "chat_name": chat_name})
                
                conn.commit()
                conn.close()
                
                return {
                    'success': True, 
                    'deleted_count': len(deleted_chats), 
                    'kept_count': len(chats_to_keep) + len(pinned_chat_ids),
                    'pinned_count': len(pinned_chat_ids),
                    'deleted_chats': deleted_chats
                }
                
            except Exception as e:
                print(f"SQLite error in cleanup_chats: {str(e)}")
                raise e
                
        except Exception as e:
            print(f"Error in cleanup_chats: {str(e)}")
            return {
                'success': False, 
                'error': str(e),
                'deleted_count': 0, 
                'kept_count': 0
            }
    
    def toggle_pin_chat(self, chat_id, user_id=None):
        """Toggle or set the pinned status of a chat"""
        try:
            # Get current status first
            if self.use_supabase:
                # Verify user has access to this chat
                response = self.supabase.table("chats").select("is_pinned").eq("chat_id", chat_id)
                
                # Add user filter if provided
                if user_id:
                    response = response.eq("user_id", user_id)
                
                # Execute the query
                result = response.execute()
                
                if not result.data or len(result.data) == 0:
                    return {
                        "success": False, 
                        "error": "Chat not found or access denied"
                    }
                
                # Get current pin status
                current_status = result.data[0].get("is_pinned", False)
                new_status = not current_status
                
                # Update pinned status
                self.supabase.table("chats").update({"is_pinned": new_status}).eq("chat_id", chat_id).execute()
                
                return {
                    "success": True,
                    "chat_id": chat_id,
                    "is_pinned": new_status
                }
            
            else:  # SQLite fallback
                conn = self.get_sqlite_connection('chats.db')
                cursor = conn.cursor()
                
                # Check if is_pinned column exists
                cursor.execute("PRAGMA table_info(chats)")
                columns = [col[1] for col in cursor.fetchall()]
                
                if 'is_pinned' not in columns:
                    # Add is_pinned column if it doesn't exist
                    cursor.execute("ALTER TABLE chats ADD COLUMN is_pinned INTEGER DEFAULT 0")
                
                # Build the query with user check if needed
                query = "SELECT is_pinned FROM chats WHERE chat_id = ?"
                params = [chat_id]
                
                if user_id:
                    query += " AND user_id = ?"
                    params.append(user_id)
                
                # Get current status
                cursor.execute(query, params)
                row = cursor.fetchone()
                
                if not row:
                    conn.close()
                    return {
                        "success": False, 
                        "error": "Chat not found or access denied"
                    }
                
                # Convert to boolean and toggle
                current_status = bool(row[0]) if row[0] is not None else False
                new_status = not current_status
                
                # Update pinned status (store as 0/1 in SQLite)
                cursor.execute(
                    "UPDATE chats SET is_pinned = ? WHERE chat_id = ?", 
                    (1 if new_status else 0, chat_id)
                )
                
                conn.commit()
                conn.close()
                
                return {
                    "success": True,
                    "chat_id": chat_id,
                    "is_pinned": new_status
                }
                
        except Exception as e:
            print(f"Error toggling pin status: {str(e)}")
            return {
                "success": False,
                "error": str(e)
            } 