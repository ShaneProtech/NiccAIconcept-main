#!/usr/bin/env python3
"""
NICC Embed - Lightweight embeddable version of NICC for external websites
"""

from flask import Flask, render_template, request, jsonify
from flask_cors import CORS
import sqlite3
import os
import re
import requests
import json
import sys
from datetime import datetime
from dotenv import load_dotenv

# Import local database modules
from db_supabase import SupabaseHelper

# Load environment variables
load_dotenv()

app = Flask(__name__)
CORS(app)  # Enable CORS for embedding on external sites

# Initialize Supabase helper
db_helper = SupabaseHelper()

# Database path - use parent directory's database (fallback)
DB_PATH = os.path.join('..', 'NiccDB.db')

def get_db_connection():
    """Get database connection"""
    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row
    return conn

@app.route('/')
def index():
    """Main widget page"""
    return render_template('widget.html')

@app.route('/embed.js')
def embed_script():
    """Serve the embed script"""
    return render_template('embed.js'), 200, {'Content-Type': 'application/javascript'}

@app.route('/api/chat', methods=['POST'])
def chat():
    """Handle chat messages and provide NICC responses"""
    try:
        data = request.json
        message = data.get('message', '').strip()
        
        if not message:
            return jsonify({'success': False, 'error': 'Message is required'})
        
        # For now, provide basic ADAS-related responses
        # In a full implementation, this would integrate with the main NICC AI
        response = generate_nicc_response(message)
        
        return jsonify({
            'success': True,
            'response': response
        })
        
    except Exception as e:
        print(f"Chat error: {e}")
        return jsonify({'success': False, 'error': 'Internal server error'})

def generate_nicc_response(message):
    """Generate contextual responses for ADAS-related questions"""
    message_lower = message.lower()
    
    # Extract year from message
    year_match = re.search(r'\b(19|20)\d{2}\b', message)
    year = year_match.group() if year_match else None
    
    # Check for Honda/Acura specific questions first
    if any(brand in message_lower for brand in ['honda', 'acura']):
        if any(word in message_lower for word in ['radar', 'front radar', 'prequalification', 'prequalify', 'prereq', 'requirement']):
            # Extract model from message if possible
            model = None
            if 'accord' in message_lower:
                model = 'ACCORD'
            elif 'civic' in message_lower:
                model = 'CIVIC'
            elif 'cr-v' in message_lower or 'crv' in message_lower:
                model = 'CR-V'
            elif 'pilot' in message_lower:
                model = 'PILOT'
            
            # Query database for Honda vehicle data
            vehicle_data = None
            if model and year:
                vehicle_data = db_helper.query_vehicle_database('Honda', model, year)
            elif model:
                vehicle_data = db_helper.query_vehicle_database('Honda', model)
            
            # Build response with database info if available
            base_response = f"""🔧 **Honda {year + ' ' if year else ''}{model if model else 'Vehicle'} Front Radar Calibration Requirements:**

**Pre-Calibration Requirements:**
• **Clear all DTCs** using Honda HDS scan tool
• **Wheel Alignment Check** - Must be within specifications (critical for radar accuracy)
• **Clean Radar Sensor** - Remove dirt/debris from sensor behind front grille/emblem
• **Battery Voltage** - Maintain 12V+ throughout calibration process
• **Proper Environment** - Level surface, controlled lighting, no metal objects nearby

**Required Tools & Equipment:**
• Honda HDS with latest ADAS calibration software
• Honda-specific ADAS calibration targets
• Measuring tape for target positioning
• Level surface (minimum 20ft clear space in front)

**Honda SENSING Radar Systems:**
• **CMBS** (Collision Mitigation Braking System)
• **ACC** (Adaptive Cruise Control)
• **LKAS** (Lane Keeping Assist System)"""

            # Add specific vehicle info if found in database
            if vehicle_data and vehicle_data.get('found'):
                systems_info = ""
                if vehicle_data.get('results'):
                    for result in vehicle_data['results'][:3]:  # Show first 3 results
                        if result.get('protech_generic_system_name'):
                            systems_info += f"\n• **{result['protech_generic_system_name']}**"
                            if result.get('parent_component'):
                                systems_info += f" ({result['parent_component']})"
                
                if systems_info:
                    base_response += f"\n\n**Vehicle-Specific ADAS Systems:**{systems_info}"
                
                if vehicle_data.get('year_used'):
                    base_response += f"\n\n*Note: Using {vehicle_data['year_used']} model year data for reference.*"
            
            base_response += f"""

**Important Notes:**
• Front radar calibration is required after windshield replacement, front-end collision repair, or sensor replacement
• Both static and dynamic calibration may be required
• Road test required to verify proper operation

**Next Steps:**
1. Ensure all requirements are met
2. Connect HDS and navigate to ADAS calibration menu
3. Select "Front Radar" or "Millimeter Wave Radar" calibration
4. Follow HDS step-by-step instructions

Need help with the actual calibration procedure?"""
            
            return base_response
        
        elif any(word in message_lower for word in ['calibration', 'calibrate', 'procedure']):
            # Extract model from message if possible
            model = None
            if 'accord' in message_lower:
                model = 'ACCORD'
            elif 'civic' in message_lower:
                model = 'CIVIC'
            elif 'cr-v' in message_lower or 'crv' in message_lower:
                model = 'CR-V'
            elif 'pilot' in message_lower:
                model = 'PILOT'
            elif 'odyssey' in message_lower:
                model = 'ODYSSEY'
            elif 'ridgeline' in message_lower:
                model = 'RIDGELINE'
            
            # Query database for Honda vehicle data
            vehicle_data = None
            if model and year:
                vehicle_data = db_helper.query_vehicle_database('Honda', model, year)
            elif model:
                vehicle_data = db_helper.query_vehicle_database('Honda', model)
            
            base_response = f"""🔧 **Honda/Acura {year + ' ' if year else ''}{model if model else 'Vehicle'} ADAS Calibration:**

**Required Tools:**
• Honda HDS or compatible scan tool
• ADAS calibration targets
• Level surface and proper lighting

**Common Honda SENSING Systems:**
• Collision Mitigation Braking System (CMBS)
• Lane Keeping Assist System (LKAS)
• Adaptive Cruise Control (ACC)"""

            # Add specific vehicle systems if found in database
            if vehicle_data and vehicle_data.get('found'):
                systems_info = ""
                unique_systems = set()
                if vehicle_data.get('results'):
                    for result in vehicle_data['results'][:5]:  # Show first 5 results
                        if result.get('protech_generic_system_name'):
                            system_name = result['protech_generic_system_name']
                            if system_name not in unique_systems:
                                unique_systems.add(system_name)
                                systems_info += f"\n• **{system_name}**"
                
                if systems_info:
                    base_response += f"\n\n**Vehicle-Specific ADAS Systems Found:**{systems_info}"
                
                if vehicle_data.get('year_used'):
                    base_response += f"\n\n*Data from {vehicle_data['year_used']} model year.*"
            
            base_response += f"""

**Key Calibration Points:**
• Always perform static calibration first
• Road test required for dynamic calibration
• Ensure all DTCs are cleared before starting
• Use Honda-specific calibration targets
• Follow exact positioning requirements

Would you like specific procedures for a particular Honda system?"""
            
            return base_response
        
        else:
            # Check for vehicle model in message for more specific info
            model = None
            if 'mdx' in message_lower:
                model = 'MDX'
                vehicle_data = db_helper.query_vehicle_database('Acura', 'MDX', year)
            elif 'accord' in message_lower:
                model = 'ACCORD'
                vehicle_data = db_helper.query_vehicle_database('Honda', 'ACCORD', year)
            elif 'civic' in message_lower:
                model = 'CIVIC'
                vehicle_data = db_helper.query_vehicle_database('Honda', 'CIVIC', year)
            elif 'cr-v' in message_lower or 'crv' in message_lower:
                model = 'CR-V'
                vehicle_data = db_helper.query_vehicle_database('Honda', 'CR-V', year)
            
            base_response = f"""🔧 **{'Acura' if 'acura' in message_lower or 'mdx' in message_lower else 'Honda'} {year + ' ' if year else ''}{model if model else 'Vehicle'} ADAS Information:**

**Available Honda SENSING Systems:**"""

            # Add specific vehicle systems if found in database
            if model and vehicle_data and vehicle_data.get('found'):
                systems_info = ""
                unique_systems = set()
                if vehicle_data.get('results'):
                    for result in vehicle_data['results'][:8]:  # Show up to 8 results
                        if result.get('protech_generic_system_name'):
                            system_name = result['protech_generic_system_name']
                            if system_name not in unique_systems:
                                unique_systems.add(system_name)
                                systems_info += f"\n• **{system_name}**"
                
                if systems_info:
                    base_response += systems_info
                    
                    if vehicle_data.get('year_used'):
                        base_response += f"\n\n*Data from {vehicle_data['year_used']} model year.*"
                else:
                    base_response += """
• **Front Radar Calibration** (CMBS/ACC)
• **Camera Calibration** (LKAS/RDM)
• **Honda SENSING** complete system calibration"""
            else:
                base_response += """
• **Front Radar Calibration** requirements and procedures
• **Camera Calibration** for LKAS/RDM systems
• **Honda SENSING** complete system calibration
• **Scan tool requirements** (Honda HDS specifics)
• **Pre-calibration requirements** and setup"""

            base_response += f"""

**For rear collision repair, check these systems:**
• **Blind Spot Information** (rear bumper sensors)
• **Rear Cross Traffic Monitor** (if equipped)
• **Parking sensors** (rear bumper)

**Required Tools:**
• **Honda HDS** scan tool
• **ADAS calibration targets** (Honda-specific)
• **Level surface** and controlled environment

What specific system needs calibration after the rear collision?"""
            
            return base_response
    
    # Vehicle calibration questions (general)
    elif any(word in message_lower for word in ['calibration', 'calibrate', 'procedure']):
        if any(brand in message_lower for brand in ['toyota', 'lexus']):
            return """🔧 **Toyota/Lexus ADAS Calibration:**

**Required Tools:**
• Toyota Techstream or equivalent
• ADAS calibration targets (varies by system)
• Proper alignment equipment

**Common Systems:**
• Toyota Safety Sense 2.0 (TSS 2.0)
• Pre-Collision System (PCS)
• Lane Departure Alert (LDA)
• Dynamic Radar Cruise Control (DRCC)

**Key Points:**
• Camera height and angle are critical
• Some systems require both static and dynamic calibration
• Follow specific target placement guidelines

Need details for a specific Toyota model?"""
        
        else:
            return """🔧 **General ADAS Calibration Information:**

**Common ADAS Systems Requiring Calibration:**
• Forward Collision Warning (FCW)
• Automatic Emergency Braking (AEB)
• Lane Departure Warning (LDW)
• Adaptive Cruise Control (ACC)
• Blind Spot Monitoring (BSM)

**General Requirements:**
• OEM scan tool or equivalent
• Proper calibration targets
• Level surface and controlled lighting
• Clear all DTCs before calibration

**Process:**
1. Pre-scan for DTCs
2. Static calibration (if required)
3. Dynamic calibration (road test)
4. Post-scan verification

What specific vehicle or system would you like help with?"""
    
    # Scan tool questions
    elif any(word in message_lower for word in ['scan tool', 'scanner', 'diagnostic']):
        return """🛠️ **ADAS Scan Tool Requirements:**

**OEM Tools:**
• Honda HDS
• Toyota Techstream
• GM GDS2/MDI
• Ford IDS/FDRS
• Mercedes XENTRY/DAS
• BMW ISTA

**Aftermarket Options:**
• Autel MaxiSys Elite/Ultra
• Launch X431 series
• Bosch ADS 625/665
• Snap-on ZEUS/Apollo

**Key Features Needed:**
• ADAS calibration capability
• Bi-directional controls
• Latest software updates
• Vehicle-specific coverage

**Pro Tip:** Always verify tool compatibility with specific vehicle year/model before purchasing.

What vehicle brand are you working with?"""
    
    # Error code questions
    elif any(word in message_lower for word in ['error', 'code', 'dtc', 'fault']):
        return """🚨 **ADAS Error Codes:**

**Common ADAS DTCs:**
• Camera-related codes (dirty lens, misalignment)
• Radar sensor codes (blockage, malfunction)
• Communication network codes
• Calibration required codes

**Troubleshooting Steps:**
1. Clear all codes and road test
2. Check for obvious obstructions
3. Verify proper mounting/alignment
4. Perform calibration if required
5. Re-scan for persistent codes

**Important:** Some ADAS codes require specific diagnostic procedures beyond basic code clearing.

Do you have a specific error code you need help with?"""
    
    # Specific ADAS System Questions
    elif any(word in message_lower for word in ['blind spot', 'bsm', 'blind-spot', 'side mirror']):
        # Check if vehicle info is also mentioned
        vehicle_make = None
        vehicle_model = None
        vehicle_year = year
        
        # Detect make
        if any(brand in message_lower for brand in ['honda', 'acura']):
            vehicle_make = 'Honda' if 'honda' in message_lower else 'Acura'
        elif any(brand in message_lower for brand in ['toyota', 'lexus']):
            vehicle_make = 'Toyota' if 'toyota' in message_lower else 'Lexus'
        elif 'ford' in message_lower:
            vehicle_make = 'Ford'
        elif any(brand in message_lower for brand in ['gm', 'chevrolet', 'chevy']):
            vehicle_make = 'Chevrolet'
        
        # Detect model
        if 'mdx' in message_lower:
            vehicle_model = 'MDX'
        elif 'accord' in message_lower:
            vehicle_model = 'ACCORD'
        elif 'civic' in message_lower:
            vehicle_model = 'CIVIC'
        elif 'camry' in message_lower:
            vehicle_model = 'CAMRY'
        elif 'cr-v' in message_lower or 'crv' in message_lower:
            vehicle_model = 'CR-V'
        
        # Query database if we have vehicle info
        vehicle_data = None
        if vehicle_make and vehicle_model:
            vehicle_data = db_helper.query_vehicle_database(vehicle_make, vehicle_model, vehicle_year)
        
        # Build response
        vehicle_str = f"{vehicle_year + ' ' if vehicle_year else ''}{vehicle_make + ' ' if vehicle_make else ''}{vehicle_model if vehicle_model else 'Vehicle'}"
        
        base_response = f"""👁️ **{vehicle_str} Blind Spot Monitoring (BSM) Calibration:**

**{vehicle_make if vehicle_make else 'Common'} BSM Systems:**"""

        if vehicle_make == 'Honda' or vehicle_make == 'Acura':
            base_response += """
• Honda SENSING Blind Spot Information System
• Blind Spot Information (BSI)"""
        elif vehicle_make == 'Toyota':
            base_response += """
• Blind Spot Monitor (BSM)
• Rear Cross-Traffic Alert (RCTA)"""
        else:
            base_response += """
• Honda SENSING Blind Spot Information System
• Toyota Blind Spot Monitor 
• Ford BLIS (Blind Spot Information System)
• GM Side Blind Zone Alert"""

        # Add vehicle-specific database info if found
        if vehicle_data and vehicle_data.get('found'):
            bsm_systems = []
            if vehicle_data.get('results'):
                for result in vehicle_data['results']:
                    system_name = result.get('protech_generic_system_name', '')
                    if any(keyword in system_name.lower() for keyword in ['blind', 'bsm', 'side', 'mirror', 'blind spot']):
                        bsm_systems.append(system_name)
                
                if bsm_systems:
                    base_response += f"\n\n**Vehicle-Specific BSM Systems Found:**"
                    for system in bsm_systems[:3]:  # Show up to 3 systems
                        base_response += f"\n• **{system}**"

        base_response += f"""

**BSM Sensor Locations:**
• **Rear bumper corners** (radar sensors)
• **Side mirror housings** (some systems)  
• **Rear quarter panels** (behind bumper cover)

**Calibration Requirements:**
• **{vehicle_make + ' HDS' if vehicle_make in ['Honda', 'Acura'] else 'OEM scan tool'}** for calibration
• **Clear all DTCs** before starting
• **Vehicle on level surface**
• **Check sensor alignment** and mounting
• **Clean sensor faces** (remove dirt/snow/ice)

**When BSM Calibration is Required:**
• **After rear collision repair** ⭐ (Your situation)
• Rear bumper replacement/removal
• Side mirror replacement (if applicable)
• BSM sensor replacement
• Rear body panel repair

**{vehicle_make if vehicle_make else 'Typical'} BSM Calibration Process:**
1. Connect {vehicle_make + ' HDS' if vehicle_make in ['Honda', 'Acura'] else 'scan tool'} and clear DTCs
2. Navigate to BSM/Blind Spot calibration menu
3. Follow guided calibration procedure
4. Drive test at specified speeds (usually 15+ mph)
5. Verify BSM warning lights and operation

**For rear collision repair:** Check rear quarter panel alignment and sensor mounting before calibration."""

        if vehicle_data and vehicle_data.get('year_used'):
            base_response += f"\n\n*Using {vehicle_data['year_used']} model year data for reference.*"

        return base_response

    elif any(word in message_lower for word in ['front', 'forward', 'fcw', 'aeb', 'front radar', 'collision']):
        return """🚗 **Forward Collision Warning (FCW) / AEB Calibration:**

**Common Front Radar Systems:**
• Honda SENSING CMBS (Collision Mitigation Braking)
• Toyota Pre-Collision System (PCS)
• Ford Pre-Collision Assist
• GM Front Automatic Braking

**Front Radar Sensor Location:**
• **Behind front grille/emblem** (most common)
• **Behind front bumper cover**
• **Integrated with front camera** (some systems)

**Calibration Requirements:**
• **OEM scan tool** with ADAS capability
• **Specific calibration targets** (varies by manufacturer)
• **Level surface** with clear space (20+ feet)
• **Controlled lighting** environment
• **Clean radar sensor** surface

**When Front Radar Calibration is Required:**
• After windshield replacement
• Front-end collision repair
• Wheel alignment changes
• Radar sensor replacement
• Front bumper removal/replacement

**Key Calibration Steps:**
1. Pre-scan for DTCs and clear all codes
2. Check wheel alignment specifications
3. Position vehicle and calibration targets precisely
4. Perform static calibration via scan tool
5. Road test for dynamic calibration verification

Which vehicle make/model are you working with?"""

    elif any(word in message_lower for word in ['rear', 'backup', 'reverse', 'parking', 'rear radar']):
        return """🔄 **Rear Parking Assist / Backup Radar Calibration:**

**Common Rear Assist Systems:**
• Honda SENSING Rear Cross Traffic Monitor
• Toyota Rear Cross-Traffic Alert (RCTA)
• Ford Rear Parking Sensors
• GM Rear Park Assist

**Rear Sensor Locations:**
• **Rear bumper** (ultrasonic sensors)
• **Rear bumper corners** (radar sensors for cross-traffic)
• **License plate area** (some systems)

**Calibration Requirements:**
• **OEM scan tool** capability
• **Clear area behind vehicle** (10+ feet)
• **Level parking surface**
• **All sensors clean** and unobstructed

**When Rear System Calibration is Required:**
• After rear collision repair
• Rear bumper replacement
• Sensor replacement
• Trailer hitch installation
• License plate bracket changes

**Typical Calibration Process:**
1. Clear all parking assist DTCs
2. Verify sensor mounting and alignment
3. Perform scan tool calibration procedure
4. Test system operation in reverse
5. Verify detection ranges and warning zones

What specific rear system issue are you troubleshooting?"""

    elif any(word in message_lower for word in ['lane', 'lka', 'lkas', 'ldw', 'lane departure', 'lane keeping']):
        return """🛣️ **Lane Keeping Assist (LKA) / Lane Departure Warning:**

**Common Lane Systems:**
• Honda SENSING LKAS (Lane Keeping Assist)
• Toyota Lane Departure Alert (LDA)
• Ford Lane Keeping System
• GM Lane Keep Assist

**Camera Location:**
• **Behind rearview mirror** (windshield-mounted)
• **Top center of windshield**
• **Integrated with other ADAS cameras**

**Calibration Requirements:**
• **Camera calibration targets** (specific patterns)
• **Precise positioning** (distance and height critical)
• **Controlled lighting** environment
• **Clean windshield** and camera lens

**When Lane System Calibration is Required:**
• **Windshield replacement** (most common)
• Camera replacement or adjustment
• After front-end collision
• Wheel alignment changes

**Calibration Steps:**
1. Position calibration target at exact distance
2. Ensure vehicle and target are level and aligned
3. Use scan tool to initiate camera calibration
4. Verify lane detection functionality
5. Road test on marked roadway

Need specific target positioning for your vehicle?"""

    # General questions  
    elif any(word in message_lower for word in ['help', 'what', 'how', 'when']):
        return """🤖 **I'm NICC, your ADAS calibration assistant!**

I can help you with:

🔧 **Calibration Procedures**
• Step-by-step guides for specific vehicles
• Tool requirements and setup
• Static vs dynamic calibration

🛠️ **Scan Tools & Equipment**
• OEM vs aftermarket options
• Feature comparisons
• Compatibility information

📋 **Troubleshooting**
• Error code interpretation
• Common issues and solutions
• Best practices

🚗 **Vehicle-Specific Info**
• Make/model requirements
• System variations
• Special procedures

Just ask me about any ADAS topic or enter a VIN for vehicle-specific information!"""
    
    else:
        # Default response for unclear questions
        return f"""I understand you're asking about: "{message}"

I specialize in ADAS calibration and can help with:

• **Calibration procedures** for specific vehicles
• **Scan tool recommendations** and requirements  
• **Troubleshooting** ADAS systems and error codes
• **Vehicle-specific information** (try entering a VIN above)

Could you be more specific about what you need help with? For example:
• "What calibrations are needed for a 2023 Honda Accord?"
• "What scan tool do I need for Toyota ADAS?"
• "How do I calibrate Honda LKAS?"

I'm here to help! 🚗⚡"""
    
    return response

@app.route('/api/vin-decode', methods=['POST'])
def vin_decode():
    """Decode VIN using NHTSA API"""
    try:
        data = request.json
        vin = data.get('vin', '').strip().upper()
        
        if not vin or len(vin) != 17:
            return jsonify({'success': False, 'error': 'Invalid VIN format'})
        
        # NHTSA API call
        nhtsa_url = f"https://vpic.nhtsa.dot.gov/api/vehicles/DecodeVinValues/{vin}?format=json"
        response = requests.get(nhtsa_url, timeout=10)
        
        if response.status_code == 200:
            nhtsa_data = response.json()
            if nhtsa_data.get('Results'):
                result = nhtsa_data['Results'][0]
                return jsonify({
                    'success': True,
                    'year': result.get('ModelYear', ''),
                    'make': result.get('Make', ''),
                    'model': result.get('Model', ''),
                    'body_class': result.get('BodyClass', '')
                })
        
        return jsonify({'success': False, 'error': 'VIN not found'})
        
    except Exception as e:
        return jsonify({'success': False, 'error': str(e)})

@app.route('/api/vehicle-search', methods=['POST'])
def vehicle_search():
    """Search for vehicle calibration information"""
    try:
        data = request.json
        year = data.get('year', '')
        make = data.get('make', '')
        model = data.get('model', '')
        
        if not make or not model:
            return jsonify({'success': False, 'error': 'Make and model are required'})
        
        # Search database for calibration info
        conn = get_db_connection()
        cursor = conn.cursor()
        
        # Search for vehicle in database
        query = """
        SELECT DISTINCT 
            year, make, model, system_name, calibration_type, 
            scan_tool, special_tools, time_estimate, notes
        FROM vehicle_adas_data 
        WHERE LOWER(make) LIKE LOWER(?) 
        AND LOWER(model) LIKE LOWER(?)
        """
        
        params = [f'%{make}%', f'%{model}%']
        
        if year:
            query += " AND year = ?"
            params.append(year)
        
        query += " ORDER BY year DESC, system_name"
        
        cursor.execute(query, params)
        results = cursor.fetchall()
        conn.close()
        
        if results:
            # Format results
            vehicle_info = {
                'year': results[0]['year'],
                'make': results[0]['make'],
                'model': results[0]['model']
            }
            
            systems = []
            for row in results:
                systems.append({
                    'system': row['system_name'],
                    'calibration_type': row['calibration_type'],
                    'scan_tool': row['scan_tool'],
                    'special_tools': row['special_tools'],
                    'time_estimate': row['time_estimate'],
                    'notes': row['notes']
                })
            
            return jsonify({
                'success': True,
                'vehicle': vehicle_info,
                'systems': systems,
                'total_systems': len(systems)
            })
        else:
            return jsonify({
                'success': False,
                'error': 'No calibration data found for this vehicle'
            })
            
    except Exception as e:
        return jsonify({'success': False, 'error': str(e)})

@app.route('/api/makes', methods=['GET'])
def get_makes():
    """Get all available makes"""
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT DISTINCT make FROM vehicle_adas_data ORDER BY make")
        makes = [row[0] for row in cursor.fetchall()]
        conn.close()
        return jsonify({'makes': makes})
    except Exception as e:
        return jsonify({'error': str(e)})

@app.route('/api/models', methods=['GET'])
def get_models():
    """Get models for a specific make"""
    try:
        make = request.args.get('make', '')
        if not make:
            return jsonify({'models': []})
        
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute(
            "SELECT DISTINCT model FROM vehicle_adas_data WHERE LOWER(make) = LOWER(?) ORDER BY model",
            (make,)
        )
        models = [row[0] for row in cursor.fetchall()]
        conn.close()
        return jsonify({'models': models})
    except Exception as e:
        return jsonify({'error': str(e)})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001, debug=True) 