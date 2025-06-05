#!/usr/bin/env python3
"""
NHTSA VIN Decoder with GUI
A comprehensive tool to decode Vehicle Identification Numbers using NHTSA's vPIC API
and display vehicle information including ADAS features.
"""

import tkinter as tk
from tkinter import ttk, messagebox, scrolledtext
import requests
import json
import threading
from datetime import datetime
import webbrowser

class NHTSAVINDecoder:
    def __init__(self, root):
        self.root = root
        self.root.title("NHTSA VIN Decoder - Vehicle Information & ADAS Features")
        self.root.geometry("1200x800")
        self.root.configure(bg='#f0f0f0')
        
        # Configure style
        self.setup_styles()
        
        # Create main interface
        self.create_widgets()
        
        # ADAS feature mapping for better display
        self.adas_features = {
            'Adaptive Cruise Control (ACC)': 'ACC automatically adjusts vehicle speed to maintain safe distance',
            'Anti-lock Braking System (ABS)': 'Prevents wheel lockup during braking',
            'Crash Imminent Braking (CIB)': 'Automatic emergency braking to prevent collisions',
            'Blind Spot Warning (BSW)': 'Alerts driver of vehicles in blind spots',
            'Electronic Stability Control (ESC)': 'Helps maintain vehicle stability',
            'Traction Control': 'Prevents wheel spin during acceleration',
            'Forward Collision Warning (FCW)': 'Warns of potential front collisions',
            'Lane Departure Warning (LDW)': 'Alerts when vehicle drifts from lane',
            'Lane Keeping Assistance (LKA)': 'Helps keep vehicle in lane',
            'Backup Camera (BUC)': 'Provides rear view when reversing',
            'Parking Assist (APA)': 'Assists with parking maneuvers',
            'Dynamic Brake Support (DBS)': 'Supplements driver braking in emergencies',
            'Pedestrian Automatic Emergency Braking (PAEB)': 'Automatic braking for pedestrian safety',
            'Blind Spot Intervention (BSI)': 'Prevents lane changes into occupied blind spots',
            'Lane Centering Assistance': 'Keeps vehicle centered in lane',
            'Rear Cross Traffic Alert': 'Warns of cross traffic when reversing',
            'Rear Automatic Emergency Braking (AEB)': 'Automatic braking when reversing',
            'Automatic Emergency Braking (AEB)': 'Automatic braking to prevent or mitigate collisions',
            'Night Vision (NV)': 'Enhanced visibility in low-light conditions',
            'Adaptive Headlights (AHL)': 'Headlights that adjust beam pattern and direction',
            'Semi-automatic Headlamp Beam Switching': 'Automatic high/low beam switching',
            'Surround View Camera (SVC)': '360-degree camera view around vehicle',
            'Lane Watch (Honda)': 'Honda\'s blind spot camera system',
            'Auto Park Assist': 'Automated parking assistance',
            'Collision Avoidance': 'Systems to help avoid collisions',
            'Driver Attention Monitor': 'Monitors driver alertness and attention',
            'Traffic Sign Recognition': 'Recognizes and displays traffic signs',
            'Tire Pressure Monitoring System (TPMS) Type': 'Monitors tire pressure',
            'Daytime Running Light (DRL)': 'Automatic daytime lighting for visibility',
            'Adaptive Driving Beam (ADB)': 'Intelligent headlight beam control'
        }
        
    def setup_styles(self):
        """Configure ttk styles for modern appearance"""
        style = ttk.Style()
        style.theme_use('clam')
        
        # Configure custom styles
        style.configure('Title.TLabel', font=('Arial', 16, 'bold'), background='#f0f0f0')
        style.configure('Heading.TLabel', font=('Arial', 12, 'bold'), background='#f0f0f0')
        style.configure('Info.TLabel', font=('Arial', 10), background='#f0f0f0')
        style.configure('Success.TLabel', font=('Arial', 10), foreground='#2e7d32', background='#f0f0f0')
        style.configure('Error.TLabel', font=('Arial', 10), foreground='#d32f2f', background='#f0f0f0')
        
    def create_widgets(self):
        """Create and arrange all GUI widgets"""
        # Main container
        main_frame = ttk.Frame(self.root, padding="20")
        main_frame.grid(row=0, column=0, sticky=(tk.W, tk.E, tk.N, tk.S))
        
        # Configure grid weights
        self.root.columnconfigure(0, weight=1)
        self.root.rowconfigure(0, weight=1)
        main_frame.columnconfigure(1, weight=1)
        main_frame.rowconfigure(3, weight=1)
        
        # Title
        title_label = ttk.Label(main_frame, text="NHTSA VIN Decoder", style='Title.TLabel')
        title_label.grid(row=0, column=0, columnspan=3, pady=(0, 20))
        
        # VIN Input Section
        input_frame = ttk.LabelFrame(main_frame, text="Vehicle Identification Number", padding="10")
        input_frame.grid(row=1, column=0, columnspan=3, sticky=(tk.W, tk.E), pady=(0, 10))
        input_frame.columnconfigure(1, weight=1)
        
        ttk.Label(input_frame, text="VIN:", style='Heading.TLabel').grid(row=0, column=0, sticky=tk.W, padx=(0, 10))
        
        self.vin_var = tk.StringVar()
        self.vin_entry = ttk.Entry(input_frame, textvariable=self.vin_var, font=('Arial', 12), width=20)
        self.vin_entry.grid(row=0, column=1, sticky=(tk.W, tk.E), padx=(0, 10))
        self.vin_entry.bind('<Return>', lambda e: self.decode_vin())
        
        self.decode_button = ttk.Button(input_frame, text="Decode VIN", command=self.decode_vin)
        self.decode_button.grid(row=0, column=2, padx=(0, 10))
        
        self.clear_button = ttk.Button(input_frame, text="Clear", command=self.clear_results)
        self.clear_button.grid(row=0, column=3)
        
        # Model Year (optional)
        ttk.Label(input_frame, text="Model Year (optional):", style='Info.TLabel').grid(row=1, column=0, sticky=tk.W, padx=(0, 10), pady=(10, 0))
        
        self.year_var = tk.StringVar()
        self.year_entry = ttk.Entry(input_frame, textvariable=self.year_var, font=('Arial', 10), width=10)
        self.year_entry.grid(row=1, column=1, sticky=tk.W, pady=(10, 0))
        
        # Status Label
        self.status_var = tk.StringVar()
        self.status_label = ttk.Label(main_frame, textvariable=self.status_var, style='Info.TLabel')
        self.status_label.grid(row=2, column=0, columnspan=3, pady=(10, 0))
        
        # Results Section
        results_frame = ttk.Frame(main_frame)
        results_frame.grid(row=3, column=0, columnspan=3, sticky=(tk.W, tk.E, tk.N, tk.S), pady=(10, 0))
        results_frame.columnconfigure(0, weight=1)
        results_frame.columnconfigure(1, weight=1)
        results_frame.rowconfigure(0, weight=1)
        
        # Vehicle Information Panel
        vehicle_frame = ttk.LabelFrame(results_frame, text="Vehicle Information", padding="10")
        vehicle_frame.grid(row=0, column=0, sticky=(tk.W, tk.E, tk.N, tk.S), padx=(0, 5))
        vehicle_frame.columnconfigure(0, weight=1)
        vehicle_frame.rowconfigure(0, weight=1)
        
        self.vehicle_text = scrolledtext.ScrolledText(vehicle_frame, wrap=tk.WORD, height=20, font=('Arial', 10))
        self.vehicle_text.grid(row=0, column=0, sticky=(tk.W, tk.E, tk.N, tk.S))
        
        # ADAS Features Panel
        adas_frame = ttk.LabelFrame(results_frame, text="ADAS & Safety Features", padding="10")
        adas_frame.grid(row=0, column=1, sticky=(tk.W, tk.E, tk.N, tk.S), padx=(5, 0))
        adas_frame.columnconfigure(0, weight=1)
        adas_frame.rowconfigure(0, weight=1)
        
        self.adas_text = scrolledtext.ScrolledText(adas_frame, wrap=tk.WORD, height=20, font=('Arial', 10))
        self.adas_text.grid(row=0, column=0, sticky=(tk.W, tk.E, tk.N, tk.S))
        
        # Footer
        footer_frame = ttk.Frame(main_frame)
        footer_frame.grid(row=4, column=0, columnspan=3, pady=(10, 0))
        
        ttk.Label(footer_frame, text="Data provided by NHTSA vPIC API", style='Info.TLabel').grid(row=0, column=0)
        
        api_link = ttk.Label(footer_frame, text="API Documentation", style='Info.TLabel', foreground='blue', cursor='hand2')
        api_link.grid(row=0, column=1, padx=(20, 0))
        api_link.bind('<Button-1>', lambda e: webbrowser.open('https://vpic.nhtsa.dot.gov/api/'))
        
    def decode_vin(self):
        """Decode the VIN using NHTSA API"""
        vin = self.vin_var.get().strip().upper()
        
        if not vin:
            messagebox.showerror("Error", "Please enter a VIN number")
            return
            
        if len(vin) < 11:
            messagebox.showerror("Error", "VIN must be at least 11 characters long")
            return
            
        # Disable button and show loading status
        self.decode_button.config(state='disabled')
        self.status_var.set("Decoding VIN... Please wait...")
        self.root.update()
        
        # Run API call in separate thread to prevent GUI freezing
        thread = threading.Thread(target=self._decode_vin_thread, args=(vin,))
        thread.daemon = True
        thread.start()
        
    def _decode_vin_thread(self, vin):
        """Thread function to decode VIN"""
        try:
            # Prepare API URL
            base_url = "https://vpic.nhtsa.dot.gov/api/vehicles/DecodeVinValuesExtended"
            year = self.year_var.get().strip()
            
            if year:
                url = f"{base_url}/{vin}?format=json&modelyear={year}"
            else:
                url = f"{base_url}/{vin}?format=json"
            
            # Make API request
            response = requests.get(url, timeout=30)
            response.raise_for_status()
            
            data = response.json()
            
            # Schedule GUI update in main thread
            self.root.after(0, self._update_results, data)
            
        except requests.exceptions.RequestException as e:
            error_msg = f"Network error: {str(e)}"
            self.root.after(0, self._show_error, error_msg)
        except json.JSONDecodeError:
            error_msg = "Invalid response from NHTSA API"
            self.root.after(0, self._show_error, error_msg)
        except Exception as e:
            error_msg = f"Unexpected error: {str(e)}"
            self.root.after(0, self._show_error, error_msg)
            
    def _update_results(self, data):
        """Update GUI with decoded VIN results"""
        try:
            if not data.get('Results') or len(data['Results']) == 0:
                self._show_error("No data found for this VIN")
                return
                
            result = data['Results'][0]
            
            # Check for errors in the response
            error_code = result.get('ErrorCode', '')
            if error_code and error_code != '0':
                error_text = result.get('ErrorText', 'Unknown error occurred')
                self._show_error(f"VIN Decode Error: {error_text}")
                return
            
            # Clear previous results
            self.vehicle_text.delete(1.0, tk.END)
            self.adas_text.delete(1.0, tk.END)
            
            # Display basic vehicle information
            self._display_vehicle_info(result)
            
            # Display ADAS and safety features
            self._display_adas_features(result)
            
            self.status_var.set(f"VIN decoded successfully at {datetime.now().strftime('%H:%M:%S')}")
            
        except Exception as e:
            self._show_error(f"Error processing results: {str(e)}")
        finally:
            self.decode_button.config(state='normal')
            
    def _display_vehicle_info(self, result):
        """Display basic vehicle information"""
        self.vehicle_text.insert(tk.END, "=== BASIC VEHICLE INFORMATION ===\n\n", 'header')
        
        # Key vehicle information fields
        key_fields = [
            ('Make', 'Make'),
            ('Model', 'Model'),
            ('Model Year', 'ModelYear'),
            ('Trim', 'Trim'),
            ('Series', 'Series'),
            ('Body Class', 'BodyClass'),
            ('Vehicle Type', 'VehicleType'),
            ('Manufacturer Name', 'ManufacturerName'),
            ('Plant City', 'PlantCity'),
            ('Plant State', 'PlantState'),
            ('Plant Country', 'PlantCountry')
        ]
        
        for display_name, field_name in key_fields:
            value = result.get(field_name, 'Not Available')
            if value and value != 'Not Available':
                self.vehicle_text.insert(tk.END, f"{display_name}: {value}\n")
        
        self.vehicle_text.insert(tk.END, "\n=== ENGINE & DRIVETRAIN ===\n\n")
        
        # Engine and drivetrain information
        engine_fields = [
            ('Engine Configuration', 'EngineConfiguration'),
            ('Engine Model', 'EngineModel'),
            ('Engine Cylinders', 'EngineNumberofCylinders'),
            ('Displacement (L)', 'DisplacementL'),
            ('Displacement (CC)', 'DisplacementCC'),
            ('Engine Power (kW)', 'EnginePowerkW'),
            ('Fuel Type - Primary', 'FuelTypePrimary'),
            ('Fuel Type - Secondary', 'FuelTypeSecondary'),
            ('Drive Type', 'DriveType'),
            ('Transmission Style', 'TransmissionStyle'),
            ('Transmission Speeds', 'TransmissionSpeeds'),
            ('Electrification Level', 'ElectrificationLevel')
        ]
        
        for display_name, field_name in engine_fields:
            value = result.get(field_name, 'Not Available')
            if value and value != 'Not Available':
                self.vehicle_text.insert(tk.END, f"{display_name}: {value}\n")
        
        self.vehicle_text.insert(tk.END, "\n=== DIMENSIONS & SPECIFICATIONS ===\n\n")
        
        # Dimensions and specifications
        spec_fields = [
            ('Doors', 'Doors'),
            ('Windows', 'Windows'),
            ('Number of Seats', 'NumberofSeats'),
            ('Number of Seat Rows', 'NumberofSeatRows'),
            ('Curb Weight (lbs)', 'CurbWeightpounds'),
            ('GVWR From', 'GrossVehicleWeightRatingFrom'),
            ('GVWR To', 'GrossVehicleWeightRatingTo'),
            ('Wheelbase (inches)', 'WheelBaseinchesfrom'),
            ('Bed Length (inches)', 'BedLengthinches'),
            ('Cab Type', 'CabType'),
            ('Bed Type', 'BedType')
        ]
        
        for display_name, field_name in spec_fields:
            value = result.get(field_name, 'Not Available')
            if value and value != 'Not Available':
                self.vehicle_text.insert(tk.END, f"{display_name}: {value}\n")
                
    def _display_adas_features(self, result):
        """Display ADAS and safety features"""
        self.adas_text.insert(tk.END, "=== ACTIVE SAFETY SYSTEMS (ADAS) ===\n\n", 'header')
        
        # ADAS feature fields from NHTSA API - using correct field names from debug output
        adas_fields = [
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
        
        found_features = []
        
        for display_name, field_name in adas_fields:
            value = result.get(field_name, '')
            if value and value.lower() not in ['not available', '', 'no', 'not applicable', 'n/a']:
                found_features.append((display_name, value))
                description = self.adas_features.get(display_name, '')
                self.adas_text.insert(tk.END, f"✓ {display_name}: {value}\n")
                if description:
                    self.adas_text.insert(tk.END, f"   {description}\n\n")
                else:
                    self.adas_text.insert(tk.END, "\n")
        
        if not found_features:
            self.adas_text.insert(tk.END, "No ADAS features reported for this vehicle.\n\n")
        
        self.adas_text.insert(tk.END, "=== PASSIVE SAFETY SYSTEMS ===\n\n")
        
        # Passive safety features - using correct field names
        passive_fields = [
            ('Front Air Bag Locations', 'AirBagLocFront'),
            ('Side Air Bag Locations', 'AirBagLocSide'),
            ('Curtain Air Bag Locations', 'AirBagLocCurtain'),
            ('Knee Air Bag Locations', 'AirBagLocKnee'),
            ('Seat Cushion Air Bag Locations', 'SeatCushionAirBagLocations'),
            ('Seat Belt Type', 'SeatBeltsAll'),
            ('Pretensioner', 'Pretensioner')
        ]
        
        passive_found = False
        for display_name, field_name in passive_fields:
            value = result.get(field_name, '')
            if value and value.lower() not in ['not available', '', 'no', 'not applicable', 'n/a']:
                passive_found = True
                self.adas_text.insert(tk.END, f"• {display_name}: {value}\n")
        
        if not passive_found:
            self.adas_text.insert(tk.END, "No passive safety features reported.\n\n")
        else:
            self.adas_text.insert(tk.END, "\n")
        
        self.adas_text.insert(tk.END, "=== OTHER SAFETY FEATURES ===\n\n")
        
        # Other safety features
        other_fields = [
            ('Tire Pressure Monitoring System (TPMS)', 'TirePressureMonitoringSystemTPMSType'),
            ('Daytime Running Light (DRL)', 'DaytimeRunningLightDRL'),
            ('Headlamp Light Source', 'HeadlampLightSource'),
            ('Adaptive Driving Beam (ADB)', 'AdaptiveDrivingBeamADB'),
            ('Auto-Reverse System for Windows', 'AutoReverseSystemforWindowsandSunroofs'),
            ('Keyless Ignition', 'KeylessIgnition'),
            ('Event Data Recorder (EDR)', 'EventDataRecorderEDR'),
            ('SAE Automation Level From', 'SAEAutomationLevelFrom'),
            ('SAE Automation Level To', 'SAEAutomationLevelTo'),
            ('Vehicle Descriptor', 'VehicleDescriptor')
        ]
        
        other_found = False
        for display_name, field_name in other_fields:
            value = result.get(field_name, '')
            if value and value.lower() not in ['not available', '', 'no', 'not applicable', 'n/a']:
                other_found = True
                self.adas_text.insert(tk.END, f"• {display_name}: {value}\n")
        
        if not other_found:
            self.adas_text.insert(tk.END, "No additional safety features reported.\n")
            
        # Add note about data source
        self.adas_text.insert(tk.END, "\n" + "="*50 + "\n")
        self.adas_text.insert(tk.END, "NOTE: Safety feature data is reported by manufacturers\n")
        self.adas_text.insert(tk.END, "to NHTSA. 'Standard' indicates the feature comes\n")
        self.adas_text.insert(tk.END, "standard with the vehicle. Some features may be\n")
        self.adas_text.insert(tk.END, "optional or part of specific trim packages.\n")
        
    def _show_error(self, error_msg):
        """Show error message and reset UI"""
        self.status_var.set(f"Error: {error_msg}")
        self.decode_button.config(state='normal')
        messagebox.showerror("Error", error_msg)
        
    def clear_results(self):
        """Clear all results and reset the form"""
        self.vin_var.set("")
        self.year_var.set("")
        self.vehicle_text.delete(1.0, tk.END)
        self.adas_text.delete(1.0, tk.END)
        self.status_var.set("Ready to decode VIN")
        self.vin_entry.focus()

def main():
    """Main function to run the application"""
    root = tk.Tk()
    app = NHTSAVINDecoder(root)
    
    # Center the window on screen
    root.update_idletasks()
    x = (root.winfo_screenwidth() // 2) - (root.winfo_width() // 2)
    y = (root.winfo_screenheight() // 2) - (root.winfo_height() // 2)
    root.geometry(f"+{x}+{y}")
    
    # Set minimum window size
    root.minsize(1000, 600)
    
    root.mainloop()

if __name__ == "__main__":
    main()