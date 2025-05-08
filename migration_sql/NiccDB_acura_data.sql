-- Data import for acura table
-- Generated on 2025-05-02 18:23:17.034795
-- Contains 682 records

-- Batch 1 of 1
BEGIN;
INSERT INTO "acura" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES
('2012', 'Acura', 'MDX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]
', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EaZwnPFWKJhFkBanxe_G-ysBKJbR5h2bu_M0qseJwEvHhg?e=jN9MbM', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '1,11,12', 'ACC (1)', 'Adaptive Cruise Control (ACC)'),
('2012', 'Acura', 'MDX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ESDEzx_wrvpLnOv6ERXftr0BRiYFVtCZ39u9BN-X6c14Dw?e=Jjf9gu', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '1,11,12', 'AEB (1)', ' Collision Mitigation Braking System (CMBS)'),
('2012', 'Acura', 'MDX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2012', 'Acura', 'MDX', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA', 'nan'),
('2012', 'Acura', 'MDX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]
Rear Bumper R&I: Please be aware that the rear bumper will require removal and installation for calibration.', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EQPoYkCqSQdHoaJmY-U07e4B2Mr-SZ0V67R-Wp9pEvds6A?e=4sC5tx', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2012', 'Acura', 'MDX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EQXJL7JdiadKmh7TrshWlBUBrgWRVnvcBqYWk3VIkGmcLQ?e=QNZr5C', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2012', 'Acura', 'MDX', 'Windshield Camera', 'LKA %', 'No Calibration Required', 'No Calibration Required', 'LKA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'LKA', 'nan'),
('2012', 'Acura', 'MDX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2012', 'Acura', 'MDX', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2012', 'Acura', 'RDX', 'Front Radar', 'ACC %', 'No Calibration Required', 'nan', 'ACC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC (%)', 'nan'),
('2012', 'Acura', 'RDX', 'Front Radar', 'AEB %', 'No Calibration Required', 'nan', 'AEB', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB', 'nan'),
('2012', 'Acura', 'RDX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2012', 'Acura', 'RDX', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA', 'nan'),
('2012', 'Acura', 'RDX', 'Rear Radar', 'BSW %', 'No Calibration Required', 'nan', 'BSW', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW/RCTW', 'nan'),
('2012', 'Acura', 'RDX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ER8Z5vswYodCp3QLsZfLBBcBtXqjx7Ar2fRmGrvTnP1GBw?e=8gfida', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2012', 'Acura', 'RDX', 'Windshield Camera', 'LKA %', 'No Calibration Required', 'No Calibration Required', 'LKA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'LKA', 'nan'),
('2012', 'Acura', 'RDX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2012', 'Acura', 'RDX', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2012', 'Acura', 'RL', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EchLylzx4OZFkcLQ7s3cENgBfCl2NQq9os50K795wdqf2A?e=ahDkBa', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '1,11,12', 'ACC (1)', 'Adaptive Cruise Control (ACC)'),
('2012', 'Acura', 'RL', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EWUqHCdd5b1Hs2Kh6HNlpKcB2M6JdPT3jKfHVjYQbwHncA?e=takWep', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '1,11,12', 'AEB (1)', ' Collision Mitigation Braking System (CMBS)'),
('2012', 'Acura', 'RL', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2012', 'Acura', 'RL', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA (%)', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EeuhqebeK85LiMuod58KZjUB33VftIOeWf8bOisqaf6eYg?e=2UsmmY', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA', 'Parking and Back-Up Sensor'),
('2012', 'Acura', 'RL', 'Rear Radar', 'BSW %', 'No Calibration Required', 'nan', 'BSW', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW/RCTW', 'nan'),
('2012', 'Acura', 'RL', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EWPrEE4tXf5Ks4n7nW3gP0kB8Rppk9ZJMqgJ-UDmjeeQZw?e=HJnA0E', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2012', 'Acura', 'RL', 'Windshield Camera', 'LKA %', 'No Calibration Required', 'No Calibration Required', 'LKA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'LKA', 'nan'),
('2012', 'Acura', 'RL', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2012', 'Acura', 'RL', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2012', 'Acura', 'TL', 'Front Radar', 'ACC %', 'No Calibration Required', 'nan', 'ACC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC (%)', 'nan'),
('2012', 'Acura', 'TL', 'Front Radar', 'AEB %', 'No Calibration Required', 'nan', 'AEB', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB', 'nan'),
('2012', 'Acura', 'TL', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2012', 'Acura', 'TL', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA', 'nan'),
('2012', 'Acura', 'TL', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]
Rear Bumper R&I: Please be aware that the rear bumper will require removal and installation for calibration.', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EUqmVkTYM9VDjwy8v9EcZwkB3Lg_wQHogUK0QPRP2JK6kg?e=VFybcP', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2012', 'Acura', 'TL', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ES5K9E2yNWBDn_G9tZC-VNkBBijEod1TSMtp3CuNqCamag?e=WdD79D', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2012', 'Acura', 'TL', 'Windshield Camera', 'LKA %', 'No Calibration Required', 'No Calibration Required', 'LKA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'LKA', 'nan'),
('2012', 'Acura', 'TL', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2012', 'Acura', 'TL', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2012', 'Acura', 'TSX', 'Front Radar', 'ACC %', 'No Calibration Required', 'nan', 'ACC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC (%)', 'nan'),
('2012', 'Acura', 'TSX', 'Front Radar', 'AEB %', 'No Calibration Required', 'nan', 'AEB', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB', 'nan'),
('2012', 'Acura', 'TSX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2012', 'Acura', 'TSX', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA', 'nan'),
('2012', 'Acura', 'TSX', 'Rear Radar', 'BSW %', 'No Calibration Required', 'nan', 'BSW', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW/RCTW', 'nan'),
('2012', 'Acura', 'TSX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EWuGJIpondpIjQiSY5eqwYgBwm3jK0d-Peg-tB6fLBwKjg?e=Yrsahz', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2012', 'Acura', 'TSX', 'Windshield Camera', 'LKA %', 'No Calibration Required', 'No Calibration Required', 'LKA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'LKA', 'nan'),
('2012', 'Acura', 'TSX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2012', 'Acura', 'TSX', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2012', 'Acura', 'ZDX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EYVOKkTVustFnXHA4zPmrjcBwdN9RFgx4r9RGTj2UpLbwA?e=bW1qNg', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '1,11,12', 'ACC (1)', 'Adaptive Cruise Control (ACC)'),
('2012', 'Acura', 'ZDX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EUJhtvd_ClNMsOgF8KM5lxABJSq_nrC0Vc6uXV2sbJxknA?e=BpnkfR', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '1,11,12', 'AEB (1)', ' Collision Mitigation Braking System (CMBS)'),
('2012', 'Acura', 'ZDX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'Full Fuel Tank: Please ensure the Fuel tank is full.  ', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2012', 'Acura', 'ZDX', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA', 'nan', 'Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA', 'nan'),
('2012', 'Acura', 'ZDX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]
Rear Bumper R&I: Please be aware that the rear bumper will require removal and installation for calibration.', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EeL3Ov-FMZNAvXO0x_e4CZ4BOhpDoIRLcQCrvHaDn1U9sA?e=7fvsGP', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2012', 'Acura', 'ZDX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ETOo7GGAZ8NLu94p9hKod7EBN5OvFQha5ZFIfg8lyMb7fg?e=jyyBxb', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2012', 'Acura', 'ZDX', 'Windshield Camera', 'LKA %', 'No Calibration Required', 'No Calibration Required', 'LKA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'LKA', 'nan'),
('2012', 'Acura', 'ZDX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2012', 'Acura', 'ZDX', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2013', 'Acura', 'ILX', 'Front Radar', 'ACC %', 'No Calibration Required', 'nan', 'ACC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC (%)', 'nan'),
('2013', 'Acura', 'ILX', 'Front Radar', 'AEB %', 'No Calibration Required', 'nan', 'AEB', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB', 'nan'),
('2013', 'Acura', 'ILX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2013', 'Acura', 'ILX', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA', 'nan'),
('2013', 'Acura', 'ILX', 'Rear Radar', 'BSW %', 'No Calibration Required', 'nan', 'BSW', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW/RCTW', 'nan'),
('2013', 'Acura', 'ILX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EYK9WCpBbkJBu0NIi714kYAB4S3ckQtF35OL8ZlZhtmX2g?e=2a2a1J', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2013', 'Acura', 'ILX', 'Windshield Camera', 'LKA %', 'No Calibration Required', 'No Calibration Required', 'LKA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'LKA', 'nan'),
('2013', 'Acura', 'ILX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2013', 'Acura', 'ILX', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2013', 'Acura', 'MDX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EdUl8fpeYONBm8puMf5-i-cBUD7osxp5mzpkcwt1X9O0UQ?e=UTcSgY', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '1,11,12', 'ACC (1)', 'Adaptive Cruise Control (ACC)'),
('2013', 'Acura', 'MDX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EYu604IHsr1AujvzkO43c7YB6q-4abIp7hVgu3QHWXpxEQ?e=F8GWFl', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '1,11,12', 'AEB (1)', ' Collision Mitigation Braking System (CMBS)'),
('2013', 'Acura', 'MDX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2013', 'Acura', 'MDX', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA', 'nan'),
('2013', 'Acura', 'MDX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]
Rear Bumper R&I: Please be aware that the rear bumper will require removal and installation for calibration.', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EQDkjWCFXQZBgPC0kSmQbKcBs2GAIM69kiTp6AwrpueY0w?e=tpmKO1', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2013', 'Acura', 'MDX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EXgarimcvRNMuu-lWmNsJQgBelexWvqk0uGjnQxjc3WSgA?e=Qwujwn', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2013', 'Acura', 'MDX', 'Windshield Camera', 'LKA %', 'No Calibration Required', 'No Calibration Required', 'LKA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'LKA', 'nan'),
('2013', 'Acura', 'MDX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2013', 'Acura', 'MDX', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2013', 'Acura', 'RDX', 'Front Radar', 'ACC %', 'No Calibration Required', 'nan', 'ACC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC (%)', 'nan'),
('2013', 'Acura', 'RDX', 'Front Radar', 'AEB %', 'No Calibration Required', 'nan', 'AEB', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB', 'nan'),
('2013', 'Acura', 'RDX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2013', 'Acura', 'RDX', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA', 'nan'),
('2013', 'Acura', 'RDX', 'Rear Radar', 'BSW %', 'No Calibration Required', 'nan', 'BSW', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW/RCTW', 'nan'),
('2013', 'Acura', 'RDX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Eeelh0w0CMlPpQdaZRNvxnUBFXu8yyp4873sHNxUdZ7HNQ?e=I2bbfc', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2013', 'Acura', 'RDX', 'Windshield Camera', 'LKA %', 'No Calibration Required', 'No Calibration Required', 'LKA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'LKA', 'nan'),
('2013', 'Acura', 'RDX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2013', 'Acura', 'RDX', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2013', 'Acura', 'TL', 'Front Radar', 'ACC %', 'No Calibration Required', 'nan', 'ACC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC (%)', 'nan'),
('2013', 'Acura', 'TL', 'Front Radar', 'AEB %', 'No Calibration Required', 'nan', 'AEB', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB', 'nan'),
('2013', 'Acura', 'TL', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2013', 'Acura', 'TL', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA', 'nan'),
('2013', 'Acura', 'TL', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]
Rear Bumper R&I: Please be aware that the rear bumper will require removal and installation for calibration.', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EXuGxsX7e3VMim5MrWBXPSEBQ9SHbwLmqzXV55iPhYQM5w?e=hW8v6t', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2013', 'Acura', 'TL', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EXuS6orF0_pFvawqfcfn2FIBj00LH6GiH3JSJ8M5m-RFfA?e=Bv2zl8', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2013', 'Acura', 'TL', 'Windshield Camera', 'LKA %', 'No Calibration Required', 'No Calibration Required', 'LKA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'LKA', 'nan'),
('2013', 'Acura', 'TL', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2013', 'Acura', 'TL', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2013', 'Acura', 'TSX', 'Front Radar', 'ACC %', 'No Calibration Required', 'nan', 'ACC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC (%)', 'nan'),
('2013', 'Acura', 'TSX', 'Front Radar', 'AEB %', 'No Calibration Required', 'nan', 'AEB', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB', 'nan'),
('2013', 'Acura', 'TSX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2013', 'Acura', 'TSX', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA', 'nan'),
('2013', 'Acura', 'TSX', 'Rear Radar', 'BSW %', 'No Calibration Required', 'nan', 'BSW', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW/RCTW', 'nan'),
('2013', 'Acura', 'TSX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EaQn4BkXE19EoYwFyycFp5AB3-MrUX8dt0ZQXlGkkqgYJQ?e=KkiiGO', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2013', 'Acura', 'TSX', 'Windshield Camera', 'LKA %', 'No Calibration Required', 'No Calibration Required', 'LKA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'LKA', 'nan'),
('2013', 'Acura', 'TSX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2013', 'Acura', 'TSX', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2013', 'Acura', 'ZDX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EduTN7MXnf5LqLt7xRJ7YvABuIxM2WW3cPi5H3Use1TkPQ?e=TajY1b', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12', 'ACC (1)', 'Adaptive Cruise Control (ACC)'),
('2013', 'Acura', 'ZDX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EekGELNu15FDrazUcVEiNZIBGhIeCHWf4tM2Po5F6N2RoQ?e=wT9tJh', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12', 'AEB (1)', ' Collision Mitigation Braking System (CMBS)'),
('2013', 'Acura', 'ZDX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2013', 'Acura', 'ZDX', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA', 'nan'),
('2013', 'Acura', 'ZDX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]
Rear Bumper R&I: Please be aware that the rear bumper will require removal and installation for calibration.', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Ef_9oYhz65VNuKtzZ2IJL30BfDx0Yw4VylUPNNdd0sS-Tg?e=If0D0b', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2013', 'Acura', 'ZDX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EcHBzQQWdF1Pn-cgV6aU8DUB8GgiMVqT-q-edceOJt9vxg?e=4ndA78', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2013', 'Acura', 'ZDX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Dynamic Calibration – Lane Keep Assist', 'LKA (1)', 'Dynamic', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ETEWxLVyXYlGou5bEXkcFlMBbr3hTWnYAhvg8VvH6Y057Q?e=5uqUDX', 'nan', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Forward Collision Warning/Lane Departure Warning (FCW/LDW)'),
('2013', 'Acura', 'ZDX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Dynamic Calibration – Lane Keep Assist', 'LKA (1)', 'Dynamic', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EUwTL-hAtrJEvPMjgEe9BjUBYT2rIeXOL41OnxoipQFUUg?e=eAGO55', 'nan', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Forward Collision Warning/Lane Departure Warning (FCW/LDW)'),
('2013', 'Acura', 'ZDX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2013', 'Acura', 'ZDX', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2014', 'Acura', 'ILX', 'Front Radar', 'ACC %', 'No Calibration Required', 'nan', 'ACC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC (%)', 'nan'),
('2014', 'Acura', 'ILX', 'Front Radar', 'AEB %', 'No Calibration Required', 'nan', 'AEB', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB', 'nan'),
('2014', 'Acura', 'ILX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2014', 'Acura', 'ILX', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA', 'nan'),
('2014', 'Acura', 'ILX', 'Rear Radar', 'BSW %', 'No Calibration Required', 'nan', 'BSW', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW/RCTW', 'nan'),
('2014', 'Acura', 'ILX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EQFe5z6YRWJGpypFhQywpE0BBfdTmWPf2H2oibUUt0mJww?e=A35Ar3', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2014', 'Acura', 'ILX', 'Windshield Camera', 'LKA %', 'No Calibration Required', 'No Calibration Required', 'LKA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'LKA', 'nan'),
('2014', 'Acura', 'ILX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2014', 'Acura', 'ILX', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2014', 'Acura', 'MDX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EU1-CzqpUHRAgN8-eMo8hNIBFB7yW8Udz6ijVUzPAFgy9w?e=x9j6m6', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '1,11,12', 'ACC (1)', 'Adaptive Cruise Control (ACC)'),
('2014', 'Acura', 'MDX', 'Windshield Camera', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (3)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EehYwhpQ-H1Poj2r7-lEAwgB25WfOdt_mmKfteFcd2Hrjw?e=V2870B', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'AEB (3)', ' Collision Mitigation Braking System (CMBS)'),
('2014', 'Acura', 'MDX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2014', 'Acura', 'MDX', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (%)', 'PMI', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EdBgb0VMRZtHqcfrRJ3MJbEB8Y-1Jfkw1QGBUwz2DNZcyg?e=Ax9GVN', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA', 'Parking and Back-Up Sensor'),
('2014', 'Acura', 'MDX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]
Rear Bumper R&I: Please be aware that the rear bumper will require removal and installation for calibration.', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EVzvyxeEoTBDuy-bLrDxH14BEH_ebeiWBbel_SOAzuoqxA?e=KqhSEi', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2014', 'Acura', 'MDX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EXh--iv6zaJCgTYWcCkZ1D8BZDcb0axlkK1OU-lg3tyDEg?e=jjCQ4R', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2014', 'Acura', 'MDX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EdWeaLYIbq5Fo7R-40TnpWkBSCEZmdkbrYPCcmyXFGmD1A?e=PqwotK', 'HONDA/ACURA LDWI
CSC0601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2014', 'Acura', 'MDX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EWjU-_TpQElFmtv91a4ZVewB2OPk9jqAv-qtUEUdpVsgDQ?e=QrQaML', 'HONDA/ACURA LDWI
CSC0601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Forward Collision Warning/Lane Departure Warning (FCW/LDW)'),
('2014', 'Acura', 'MDX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2014', 'Acura', 'MDX', 'Surround View Cameras', 'SVC %', 'Static Calibration - Surround View', 'nan', 'SVC (%)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EVYMo07mMXFLtS_geshsZ9EBOB0PXTIcOUoTmTcpm0AA2Q?e=gZ4jkF', 'HONDA AVM
CSC1004/03', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '3,6,9,12', 'SVC', 'Multi View Camera System (MVCS)'),
('2014', 'Acura', 'RDX', 'Front Radar', 'ACC %', 'No Calibration Required', 'nan', 'ACC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC (%)', 'nan'),
('2014', 'Acura', 'RDX', 'Front Radar', 'AEB %', 'No Calibration Required', 'nan', 'AEB', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB', 'nan'),
('2014', 'Acura', 'RDX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2014', 'Acura', 'RDX', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA', 'nan'),
('2014', 'Acura', 'RDX', 'Rear Radar', 'BSW %', 'No Calibration Required', 'nan', 'BSW', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW/RCTW', 'nan'),
('2014', 'Acura', 'RDX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EbbyIP1tS7ZAgCQZffBnmNsBNArvVcp6tOWRz6-QuqMyJA?e=Q2XZMN', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2014', 'Acura', 'RDX', 'Windshield Camera', 'LKA %', 'No Calibration Required', 'No Calibration Required', 'LKA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'LKA', 'nan'),
('2014', 'Acura', 'RDX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2014', 'Acura', 'RDX', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2014', 'Acura', 'RLX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ERSRv5lPE-dKvEjFovKK7h0Bp0c5l6w4hWKruxvrNS1AkQ?e=hhfHtV', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12', 'ACC (1)', 'Adaptive Cruise Control (ACC)'),
('2014', 'Acura', 'RLX', 'Windshield Camera', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (3)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EXzAOpipWZBFhiiGLZBE4CIBVY0dEOOkc-a2cndq1xL3og?e=vZneGj', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'AEB (3)', ' Collision Mitigation Braking System (CMBS)'),
('2014', 'Acura', 'RLX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2014', 'Acura', 'RLX', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA (%)', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ETF52d-pM4VNn9A6s__BjkwBwMYkQnLC_maPur2xad2mew?e=Gb0GBy', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA', 'Parking and Back-Up Sensor'),
('2014', 'Acura', 'RLX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]
Rear Bumper R&I: Please be aware that the rear bumper will require removal and installation for calibration.', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EcVbEizuEcpHhOqgIFOFKwcB3T4C1NFKCZnxjYrt7ofQRQ?e=ddT3rZ', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2014', 'Acura', 'RLX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EfHGeaqJX7hHtEYrTZ6KxeIBfKdsh_CIBYikWUQPLzeeTA?e=GX6y0H', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2014', 'Acura', 'RLX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EYnyO8EhCcJEoIsZA9B0O1kBns63OCnq6m4MZsLwVixPQQ?e=0cyz81', 'HONDA/ACURA LDWI
CSC0601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)
Forward Collision Warning/Lane Departure Warning (FCW/LDW)'),
('2014', 'Acura', 'RLX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EUIG41Wn9I9MpaYkcEBQeS4BAWPt0yQmFy4Jn9C6Pfd-cQ?e=bdNDVq', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2014', 'Acura', 'RLX', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2014', 'Acura', 'TL', 'Front Radar', 'ACC %', 'No Calibration Required', 'nan', 'ACC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC (%)', 'nan'),
('2014', 'Acura', 'TL', 'Front Radar', 'AEB %', 'No Calibration Required', 'nan', 'AEB', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB', 'nan'),
('2014', 'Acura', 'TL', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2014', 'Acura', 'TL', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA', 'nan'),
('2014', 'Acura', 'TL', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]
Rear Bumper R&I: Please be aware that the rear bumper will require removal and installation for calibration.', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EXdryO9BDuZDrL_nVRwlhcMBe9f9xm5_zLr-U6DSVph9Gw?e=uE9fX9', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2014', 'Acura', 'TL', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EadeAHpFBo9LqPyzgxBd8q0BDEy0n_hwYIBc3_85m0AKYA?e=UdJhgg', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2014', 'Acura', 'TL', 'Windshield Camera', 'LKA %', 'No Calibration Required', 'No Calibration Required', 'LKA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'LKA', 'nan'),
('2014', 'Acura', 'TL', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2014', 'Acura', 'TL', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2014', 'Acura', 'TSX', 'Front Radar', 'ACC %', 'No Calibration Required', 'nan', 'ACC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC (%)', 'nan'),
('2014', 'Acura', 'TSX', 'Front Radar', 'AEB %', 'No Calibration Required', 'nan', 'AEB', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB', 'nan'),
('2014', 'Acura', 'TSX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2014', 'Acura', 'TSX', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA', 'nan'),
('2014', 'Acura', 'TSX', 'Rear Radar', 'BSW %', 'No Calibration Required', 'nan', 'BSW', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW/RCTW', 'nan'),
('2014', 'Acura', 'TSX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EUo7laW22OBEgEV7oyH3BwQBkLCbAmXFOt61_1u1Ws6TCw?e=44sREL', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2014', 'Acura', 'TSX', 'Windshield Camera', 'LKA %', 'No Calibration Required', 'No Calibration Required', 'LKA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'LKA', 'nan'),
('2014', 'Acura', 'TSX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2014', 'Acura', 'TSX', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2015', 'Acura', 'ILX', 'Front Radar', 'ACC %', 'No Calibration Required', 'nan', 'ACC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC (%)', 'nan'),
('2015', 'Acura', 'ILX', 'Front Radar', 'AEB %', 'No Calibration Required', 'nan', 'AEB', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB', 'nan'),
('2015', 'Acura', 'ILX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2015', 'Acura', 'ILX', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA', 'nan'),
('2015', 'Acura', 'ILX', 'Rear Radar', 'BSW %', 'No Calibration Required', 'nan', 'BSW', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW/RCTW', 'nan'),
('2015', 'Acura', 'ILX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ETTIqalv9xpDlhpZ8NvDnn4BwA53-ia5ePPlK_YaD2o25Q?e=lgFEsl', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2015', 'Acura', 'ILX', 'Windshield Camera', 'LKA %', 'No Calibration Required', 'No Calibration Required', 'LKA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'LKA', 'nan'),
('2015', 'Acura', 'ILX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2015', 'Acura', 'ILX', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2015', 'Acura', 'MDX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EY3YM7SM1r9Dn7rf_YaXtcgBJ8LCXAxznKQk9M-T9KBdkg?e=AQOTfW', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12', 'ACC (1)', 'Adaptive Cruise Control (ACC)'),
('2015', 'Acura', 'MDX', 'Windshield Camera', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (3)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Efp7eldDkHVJhfoFPTDarQIBhN85pybC-DRZIfi4FNGQxQ?e=gYmJ86', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'AEB (3)', ' Collision Mitigation Braking System (CMBS)'),
('2015', 'Acura', 'MDX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2015', 'Acura', 'MDX', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (%)', 'PMI', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EfRcoMrM57ZJptcSF5ZmVL4BoUkn_zzC3xd2I4bwG-cpSQ?e=kd4gUD', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA', 'Parking and Back-Up Sensor'),
('2015', 'Acura', 'MDX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]
Rear Bumper R&I: Please be aware that the rear bumper will require removal and installation for calibration.', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EVUiBQbGs85Ims6VQbG6-HEB7Hc5Z1nvWdLTTwevrYMmZw?e=nTVXdf', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2015', 'Acura', 'MDX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EfHItPrG3Z5Nu2ehtNU27tkBDpToSOAiZY24zka2A74Y8Q?e=pA3FYe', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2015', 'Acura', 'MDX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ESakQxYINM9Fsiuk554A4LsByU0MAH5-nnYEqWXG32vk4Q?e=tvmk4d', 'HONDA/ACURA LDWI
CSC0601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2015', 'Acura', 'MDX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EdRRHcQr3oVOj0rbZJem2RIBfu_Uy4fKwkqQm6JMpB3axg?e=ZbkOad', 'HONDA/ACURA LDWI
CSC0601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Forward Collision Warning/Lane Departure Warning (FCW/LDW)'),
('2015', 'Acura', 'MDX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2015', 'Acura', 'MDX', 'Surround View Cameras', 'SVC %', 'Static Calibration - Surround View', 'nan', 'SVC (%)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ERYz4DZ6ZQBOuBnGuMG0vu8BAVORN4Nk8-iRp398-oJkzA?e=YHaXbx', 'HONDA AVM
CSC1004/03', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '3,6,9,12', 'SVC', 'Multi View Camera System (MVCS)'),
('2015', 'Acura', 'RDX', 'Front Radar', 'ACC %', 'No Calibration Required', 'nan', 'ACC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC (%)', 'nan'),
('2015', 'Acura', 'RDX', 'Front Radar', 'AEB %', 'No Calibration Required', 'nan', 'AEB', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB', 'nan'),
('2015', 'Acura', 'RDX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2015', 'Acura', 'RDX', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA', 'nan'),
('2015', 'Acura', 'RDX', 'Rear Radar', 'BSW %', 'No Calibration Required', 'nan', 'BSW', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW/RCTW', 'nan'),
('2015', 'Acura', 'RDX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EUzhIgjeNIhJofyPNWRA-0wBEzJPSDXjLvXI2BLijo69lg?e=ZtsURf', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2015', 'Acura', 'RDX', 'Windshield Camera', 'LKA %', 'No Calibration Required', 'No Calibration Required', 'LKA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'LKA', 'nan'),
('2015', 'Acura', 'RDX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2015', 'Acura', 'RDX', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2015', 'Acura', 'RLX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EZFIqK0sZ35FmRJF591ODX4BPXjB5vaOokFlYG5ib0CWkQ?e=sbmMf3', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12', 'ACC (1)', 'Adaptive Cruise Control (ACC)'),
('2015', 'Acura', 'RLX', 'Windshield Camera', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (3)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EWPhwN93BeVEuqOm8drz0QsBUaIMwAstDT-XeCtTx0k7ag?e=Va3eog', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'AEB (3)', ' Collision Mitigation Braking System (CMBS)'),
('2015', 'Acura', 'RLX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2015', 'Acura', 'RLX', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA (%)', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ET7lP1-ovxpIqTFrxHgrZzgBxVPBDG3yllbcuvHe_S25yQ?e=9eDdcZ', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA', 'Parking and Back-Up Sensor'),
('2015', 'Acura', 'RLX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]
Rear Bumper R&I: Please be aware that the rear bumper will require removal and installation for calibration.', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EQYk4FgjeeFLl6q56RuF_pYBpVsUsi1Q3osHNTPztTqJNA?e=l7FncY', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2015', 'Acura', 'RLX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EUQKUlKDUGZJgFUY46cf_8YBGcKDMKFLuyY2rKMcIAUXSQ?e=NSILoy', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2015', 'Acura', 'RLX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EQFrdDCxmShOqytbHnbLO6MBowedpeaUmzswYuKMv1FJow?e=AJHSRw', 'HONDA/ACURA LDWI
CSC0601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2015', 'Acura', 'RLX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/Eb8je4cryXZNr5LM9Sa4Un8BKEB6YG9d3q9oTgbqdlYtyQ?e=0GPrsd', 'HONDA/ACURA LDWI
CSC0601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Forward Collision Warning/Lane Departure Warning (FCW/LDW)'),
('2015', 'Acura', 'RLX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2015', 'Acura', 'RLX', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2015', 'Acura', 'TLX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EWcRcJvDdtpLi49IPwhX-5wBzQ4ARAldxZ2tVl40FoOX6Q?e=VYxkZm', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'ACC (2)', 'Adaptive Cruise Control (ACC)'),
('2015', 'Acura', 'TLX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EY1_IzTz71NNpaBufFk9UcgB2cQv5BrUKVhLxjpkoD33VA?e=udsxlL', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR
HONDA/ACURA LDWI
CSC601/05', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'AEB (2)', ' Collision Mitigation Braking System (CMBS)'),
('2015', 'Acura', 'TLX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2015', 'Acura', 'TLX', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (%)', 'PMI', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EaZCgIO3VLRLohiDx8VHqucB8qA6fN50pANtfYNyq_tqXg?e=1vVzQa', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA', 'Parking and Back-Up Sensor'),
('2015', 'Acura', 'TLX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]
Rear Bumper R&I: Please be aware that the rear bumper will require removal and installation for calibration.', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Ed_rVpLjAiZPgg_XSzsHAz4BD6FuoZb_FOMI6CaSOqcECA?e=UgTnJF', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2015', 'Acura', 'TLX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EV8GbNgyld1LgTj37kPesisBGTeV7Mgz2PcrdGvO5eYq6Q?e=xB9zyf', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2015', 'Acura', 'TLX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Ef_hAX3LFDtAh-3KIX7n4X4BBUEJIpFT6UBpiEU-nN1SJQ?e=Sk87yE', 'HONDA/ACURA LDWI
CSC0601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2015', 'Acura', 'TLX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2015', 'Acura', 'TLX', 'Surround View Cameras', 'SVC %', 'Static Calibration - Surround View', 'nan', 'SVC (%)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EdaB0XmNzC1NhlSqKN8K8BYB8RCvGRXfslnz1_P2VCbZEw?e=cbixfa', 'HONDA AVM
CSC1004/03', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '3,6,9,12', 'SVC', 'Multi View Camera System (MVCS)'),
('2016', 'Acura', 'ILX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Eb7hcI4SModDhbO_BByk2HIB5NnGel8WWR4H0-Jyr8_K3w?e=582N1I', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'ACC (2)', 'Adaptive Cruise Control (ACC)'),
('2016', 'Acura', 'ILX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Ed-3_0QZtx1HgMd4WIC-fJ4BMdCrQ7KKpyw4t2f0mMEk8Q?e=A8Y9Im', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'AEB (2)', ' Collision Mitigation Braking System (CMBS)'),
('2016', 'Acura', 'ILX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2016', 'Acura', 'ILX', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA', 'nan'),
('2016', 'Acura', 'ILX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]
Rear Bumper R&I: Please be aware that the rear bumper will require removal and installation for calibration.', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EQFdYkLGopBOuglN9mgZ5SMBQ7SqDlcnNp2nCFl9MJ4XGA?e=vekjAo', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2016', 'Acura', 'ILX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EeSgVQJUDVlInlFFxLBD53kBnPoADKM9avg8-6lE8oDuqg?e=JKnrve', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2016', 'Acura', 'ILX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EQFZ3DzLl6BOptIQFd2iVFkB9fyKDHzucs3zQfF8H13m3A?e=9nJNQT', 'HONDA/ACURA LDWI
CSC0601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2016', 'Acura', 'ILX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2016', 'Acura', 'ILX', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2016', 'Acura', 'MDX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Ef5oJ5ECs7dCov-mtQ_nSM4BeqodNmjOt1-1ZOy5b4yJWw?e=MCiRdq', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'ACC (2)', 'Adaptive Cruise Control (ACC)'),
('2016', 'Acura', 'MDX', 'Windshield Camera', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (3)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EX4MGYSvrL1Pr2i84bacFC8Bm-7zI44urBaTbm5NOtJ9YA?e=zuE7h3', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'AEB (3)', ' Collision Mitigation Braking System (CMBS)'),
('2016', 'Acura', 'MDX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2016', 'Acura', 'MDX', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (%)', 'PMI', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EatA-3L78O9DrE_EFuIvR9YBsZyDKNIbDSwIu-CDxDj-lw?e=2xh6aL', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA', 'Parking and Back-Up Sensor'),
('2016', 'Acura', 'MDX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]
Rear Bumper R&I: Please be aware that the rear bumper will require removal and installation for calibration.', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EfkJttDO1gtNpDwGaV9Z8RIBPEmI_HbtoEcfxr-ilKUT5w?e=SkNgc9', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2016', 'Acura', 'MDX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EZ_vW02qOZZOiXCRX_PTB_0BcKgImuMfYy7jOVCh_TBUkA?e=lKwPAw', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2016', 'Acura', 'MDX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EfsMhJ9QkzlPozf-moElb0YBLvEn8Rj6pwYD3kDT1rjdVg?e=9Ao8eP', 'HONDA/ACURA LDWI
CSC0601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2016', 'Acura', 'MDX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/ESj7ux4UHQlIqHR8bcpOhdoBjWVagH_CrqEv5EtzRVdYdg?e=QWLSmL', 'HONDA/ACURA LDWI
CSC0601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'forward Collision Warning/Lane Departure Warning (FCW/LDW)'),
('2016', 'Acura', 'MDX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/ERWTUfzqBS5Kvkw8zmXNofEBjwOW2G1tvLBRCrgV4V4A8A?e=WKp59M', 'HONDA/ACURA LDWI
CSC0601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Multipurpose Camera'),
('2016', 'Acura', 'MDX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2016', 'Acura', 'MDX', 'Surround View Cameras', 'SVC %', 'Static Calibration - Surround View', 'nan', 'SVC (%)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ETl-93S7X6ZJqesa469F3ecBr6Ue2FfQ_MLKYOfCg-9Nqg?e=gUePSd', 'HONDA AVM
CSC1004/03', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '3,6,9,12', 'SVC', 'Multi View Camera System (MVCS)'),
('2016', 'Acura', 'RDX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EbUUTnx5hCFElvID8pEJU4YBj-fRSzKt-DM0cJn9qbukFw?e=3R6Bvo', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'ACC (2)', 'Adaptive Cruise Control (ACC)'),
('2016', 'Acura', 'RDX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ETtGXClpFGtKjTQp0hTsjJcBKn6KjuhN1KhSiuJTDcL-GA?e=jdxTSX', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR
HONDA/ACURA LDWI
CSC601/05', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'AEB (2)', ' Collision Mitigation Braking System (CMBS)'),
('2016', 'Acura', 'RDX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2016', 'Acura', 'RDX', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (%)', 'PMI', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EVhMOCRw_B5CjROEpmgWD7QBAoTK3EA8A0gvg31GPPWrDg?e=2xg5rA', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA', 'Parking and Back-Up Sensor'),
('2016', 'Acura', 'RDX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]
Rear Bumper R&I: Please be aware that the rear bumper will require removal and installation for calibration.', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Een4SxCyBoZDhyzQ0adXaj4BdmHOM8OfyfL17Z_Ul18OWA?e=LCwjAb', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2016', 'Acura', 'RDX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EbOtO5881NNMhb906A1yiK0BkY93gDFLrUPknzx1rCSy6g?e=pAJMZE', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2016', 'Acura', 'RDX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Eer9xcgedktIrHMTJ3w11x0Bes6I8OUb8F2S7I3wsPzIFw?e=5eBzPp', 'HONDA/ACURA LDWI
CSC0601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2016', 'Acura', 'RDX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2016', 'Acura', 'RDX', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2016', 'Acura', 'RLX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EWeuaWLsc89Bi6o4Wz_B6ewBwbq8BJ60WKZqp94FtZqhaw?e=0LJHE9', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'ACC (2)', 'Adaptive Cruise Control (ACC)'),
('2016', 'Acura', 'RLX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ES0Fjbjc1TZNm7Z8mKOXpXkByU1wzeWu_ak6YS5o8GQqQg?e=Mn6zaO', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR
HONDA/ACURA LDWI
CSC601/05', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'AEB (2)', ' Collision Mitigation Braking System (CMBS)'),
('2016', 'Acura', 'RLX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2016', 'Acura', 'RLX', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA (%)', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ETqlGPrEWshJmfRknzQ_1PIBcVHQocTSRCVX97uAArTEgA?e=fLq41Z', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA', 'Parking and Back-Up Sensor'),
('2016', 'Acura', 'RLX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]
Rear Bumper R&I: Please be aware that the rear bumper will require removal and installation for calibration.', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EdDOn3Y3Q5VMg4KmTk7bIc8BTLdxxXE1R8WYIh7iJ3kwfg?e=TOYfKa', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2016', 'Acura', 'RLX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EZ38UcIx26RAhzdj1vDNvvoBxn3VYmKwSp3Z9-IujestzA?e=44zFaQ', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2016', 'Acura', 'RLX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EVDvOJrfRclCrSfMB3u_ltYBYDb0SvEuWzcI34vZciTVhg?e=eyzXGB', 'HONDA/ACURA LDWI
CSC0601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'forward Collision Warning/Lane Departure Warning (FCW/LDW)'),
('2016', 'Acura', 'RLX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EWgq_DEOSXBAsXxpgMs13yMBaKXDnWjdtEiksc1f-Pljow?e=362Z2p', 'HONDA/ACURA LDWI
CSC0601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Multipurpose Camera'),
('2016', 'Acura', 'RLX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EWgq_DEOSXBAsXxpgMs13yMBaKXDnWjdtEiksc1f-Pljow?e=8ONY6X', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2016', 'Acura', 'RLX', 'Surround View Cameras', 'SVC %', 'Static Calibration - Surround View', 'nan', 'SVC (%)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ESgPdvxPPfNImCA-i9NAeUgBWjPlyXbXRIKp_oDLA_UH-A?e=Gzhgvw', 'HONDA AVM
CSC1004/03', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '3,6,9,12', 'SVC', 'Multi View Camera System (MVCS)'),
('2016', 'Acura', 'TLX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ETXs1OZ8XLtIuyhUfCYYCuoBWxhGiTSjakKNs_pwq9-NmQ?e=7GlciQ', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'ACC (2)', 'Adaptive Cruise Control (ACC)'),
('2016', 'Acura', 'TLX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EdwOzKZMJRNPghM9D-t_3KEBHJtw1KOdou4rLDhBsxPx0g?e=LdREH1', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR
HONDA/ACURA LDWI
CSC601/05', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'AEB (2)', ' Collision Mitigation Braking System (CMBS)'),
('2016', 'Acura', 'TLX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2016', 'Acura', 'TLX', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (%)', 'PMI', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ESw9pWUHkZ1KuyNKkA1eYv0B1IuhLt61Z0fgG_ysxu1Lzw?e=6zQYfv', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA', 'Parking and Back-Up Sensor'),
('2016', 'Acura', 'TLX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]
Rear Bumper R&I: Please be aware that the rear bumper will require removal and installation for calibration.', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EXy-lRfW_ndIktr_Z_dNEOUBw-CZDX4TnjVjTN6dckIBQA?e=pgdukL', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2016', 'Acura', 'TLX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EQ7DY8-HpiRPpcabywrBeW4Bek7EpoM483qaX0B_h4HCWA?e=Qx1OUE', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2016', 'Acura', 'TLX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ERbwEWdN2aNIuNZOYGzjqWoBp-8wVg1awviaV2sZXV10vA?e=fFOxde', 'HONDA/ACURA LDWI
CSC0601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2016', 'Acura', 'TLX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2016', 'Acura', 'TLX', 'Surround View Cameras', 'SVC %', 'Static Calibration - Surround View', 'nan', 'SVC (%)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Ee9bC8P1sQFAkhBkMQXsqwYBzD5JTPfQ_2PrBDqD1udbSQ?e=mNdGY2', 'HONDA AVM
CSC1004/03', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '3,6,9,12', 'SVC', 'Multi View Camera System (MVCS)'),
('2017', 'Acura', 'ILX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EY_UShBScTlFszSoH0xssJAB0TLKWlAyqKQ3Wh_td9OITQ?e=WwFmpx', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'ACC (2)', 'Adaptive Cruise Control (ACC)'),
('2017', 'Acura', 'ILX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EeZef0PJfsdPoV4oe8_7doUBog9T5XiL3AsG15C3r0gDAA?e=PS85uw', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'AEB (2)', ' Collision Mitigation Braking System (CMBS)'),
('2017', 'Acura', 'ILX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2017', 'Acura', 'ILX', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA', 'nan'),
('2017', 'Acura', 'ILX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EXnXXv_gwARHjMG5_-8U2TABv5ZjBWuCWr1HHzZFzTqulw?e=zkRueC', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2017', 'Acura', 'ILX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EWl4m7whdXFNqHG0nVhv3PoBzHY-IwI4r68T7z2z5ChG_A?e=JqHavw', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2017', 'Acura', 'ILX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EdggBwLcX7VPgASprGxrxUoBBLW8RifxQ0xViBvEo8SmOg?e=7JDaGZ', 'HONDA/ACURA LDWI
CSC0601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2017', 'Acura', 'ILX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2017', 'Acura', 'ILX', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2017', 'Acura', 'MDX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ER1B7YwbQDpMvyfcjs4Bc1MBoBEFBVhmBPFyZWSrZLWJVA?e=BmQIL3', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'ACC (2)', 'Adaptive Cruise Control (ACC)'),
('2017', 'Acura', 'MDX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EVLkUaumeL1LgxZjf8kIfjoByxodf6l27v8Vi0yqqp8E1Q?e=vpkj4M', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR
HONDA/ACURA LDWI
CSC601/05', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'AEB (2)', ' Collision Mitigation Braking System (CMBS)'),
('2017', 'Acura', 'MDX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2017', 'Acura', 'MDX', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (1)', 'PMI', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EYyofvc08B1NphKIjs_9nhwBOrUcgw_rYNKL696SCGofsg?e=XePSeG', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA', 'Parking and Back-Up Sensor'),
('2017', 'Acura', 'MDX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EbY1_iC0mJpMg6CihOzN0eMBoX0jeyiru-vfiyxbNQ7OAQ?e=eEXsR5', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2017', 'Acura', 'MDX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EZ87Xz1NChNDtH4VhblHyxwB8sFeP5Il61AmyFj3rVE2jQ?e=Ezh4K3', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2017', 'Acura', 'MDX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EYiAuPdx0n5MrlmwV4ffMcYBaOqs1R6Wff_8xQuPEaueTw?e=uqtohc', 'HONDA/ACURA LDWI
CSC0601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2017', 'Acura', 'MDX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2017', 'Acura', 'MDX', 'Surround View Cameras', 'SVC %', 'Static Calibration - Surround View', 'nan', 'SVC (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EbhjT9Ht7YlBq34XDz9lI08B-sjxS8cZ4V0hGr_KTEwtTw?e=wKfSGh', 'HONDA AVM
CSC1004/03', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '3,6,9,12', 'SVC', 'Multi View Camera System (MVCS)'),
('2017', 'Acura', 'NSX', 'Front Radar', 'ACC %', 'No Calibration Required', 'nan', 'ACC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC (%)', 'nan'),
('2017', 'Acura', 'NSX', 'Front Radar', 'AEB %', 'No Calibration Required', 'nan', 'AEB', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB', 'nan'),
('2017', 'Acura', 'NSX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2017', 'Acura', 'NSX', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (1)', 'PMI', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EWREHgPGHoBPjLeuEV0ACFgBtJCzH780magO-XKilNnJRA?e=o6Nnel', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA', 'Parking and Back-Up Sensor'),
('2017', 'Acura', 'NSX', 'Rear Radar', 'BSW %', 'No Calibration Required', 'nan', 'BSW', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW/RCTW', 'nan'),
('2017', 'Acura', 'NSX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EQu1XtXHRaZJvFuAetbY03EBuR970ttOnVsTazDnILTbOg?e=1brr1R', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2017', 'Acura', 'NSX', 'Windshield Camera', 'LKA %', 'No Calibration Required', 'No Calibration Required', 'LKA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'LKA', 'nan'),
('2017', 'Acura', 'NSX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2017', 'Acura', 'NSX', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2017', 'Acura', 'RDX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Ec_cw2afwS1KsDLlSyJZFrIBNV4KhSTeLpjit7_jt7_7vg?e=zEnejb', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'ACC (2)', 'Adaptive Cruise Control (ACC)'),
('2017', 'Acura', 'RDX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EV4UAB-Fg2hDkag20fNGa_oB35iICZhGNLo_E-nZVnzPWw?e=e2keem', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'AEB (2)', ' Collision Mitigation Braking System (CMBS)'),
('2017', 'Acura', 'RDX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2017', 'Acura', 'RDX', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (1)', 'PMI', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EcG_ooWZWtVGswr6VXRiel8BPDLciNbETR_ge7olV6B4XQ?e=nqWnDw', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA', 'Parking and Back-Up Sensor'),
('2017', 'Acura', 'RDX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ET1uen_h9QZHrGDrAfStxwQBMyIBeHqqQSKiubtGPa23eg?e=5EIEXg', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2017', 'Acura', 'RDX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EfuGV9XoF5FIq21aCuippBYBqw663J1QGF0dRONhiJyFLA?e=homVzF', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2017', 'Acura', 'RDX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EY6_BYlJfn5KpRdc-W7CjVYBLmUT8ZT233mIOFFRvC6NrQ?e=kWBwJd', 'HONDA/ACURA LDWI
CSC0601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2017', 'Acura', 'RDX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2017', 'Acura', 'RDX', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2017', 'Acura', 'RLX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Ef6Wm2-AqlpLoop_OAu2yesBUQhqJ9ncM_Vkq_z7zmpLWQ?e=3RxNEf', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'ACC (2)', 'Adaptive Cruise Control (ACC)'),
('2017', 'Acura', 'RLX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Edl0d-DSw7VNiLgR-XIKERUBN64tYiqowtznLlQq9z3VYA?e=tCJxqV', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'AEB (2)', ' Collision Mitigation Braking System (CMBS)'),
('2017', 'Acura', 'RLX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2017', 'Acura', 'RLX', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA (1)', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ES6Nb7P-K3tJmc3lRiOVtjIBUWMyC9R2ew6Gr_MQMA8T7Q?e=vx4KTZ', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA', 'Parking and Back-Up Sensor'),
('2017', 'Acura', 'RLX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EZrsjCgf6MxHjhAhsoLyk-8B2kz-cIUE2fTv8453j1GGBA?e=wB1gcP', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2017', 'Acura', 'RLX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EUITYYCaathDgG4k6PBescMBlbOPpuYwABT7tUBTcGGoHw?e=bbqdKk', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2017', 'Acura', 'RLX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EYhxjEclEv1Coxsy4VZiH4MB9fndg9zjgnI3Xd7X03ybnw?e=nN2db3', 'HONDA/ACURA LDWI
CSC0601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2017', 'Acura', 'RLX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2017', 'Acura', 'RLX', 'Surround View Cameras', 'SVC %', 'Static Calibration - Surround View', 'nan', 'SVC (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ESvhPWe06bpOpCoQm3VHERcBrOxN8hkYpbt7eoZM8hn6Iw?e=yTUoQb', 'HONDA AVM
CSC1004/03', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '3,6,9,12', 'SVC', 'Multi View Camera System (MVCS)'),
('2017', 'Acura', 'TLX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EdqyXkMN3_VPmjaj8C9wV8EBOgwsDz-U8uIkma5leuH6xA?e=73tfS1', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'ACC (2)', 'Adaptive Cruise Control (ACC)'),
('2017', 'Acura', 'TLX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Ea8BVJeMLF9AjhwMyKyAICkB14pwO-33wtwpYCwnReoUwQ?e=y5Npfi', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR
HONDA/ACURA LDWI
CSC601/05', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'AEB (2)', ' Collision Mitigation Braking System (CMBS)'),
('2017', 'Acura', 'TLX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2017', 'Acura', 'TLX', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (1)', 'PMI', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EQ58wgQkfDhLklckxjxcSc8BIHtiOqHoparJjlMPl6uD2A?e=xDq3Ln', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA', 'Parking and Back-Up Sensor'),
('2017', 'Acura', 'TLX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EV1fp08r5zRApeL0-v6FkaYBRn2HSBZ-7zgpTG6pewvGcg?e=DvWqRW', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2017', 'Acura', 'TLX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EclVRQABgwRGpqbr0FCXMFABUlxfadhuXhDghlstMn8ZGQ?e=R6Lpy5', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2017', 'Acura', 'TLX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EYimlTyyN_VLiljsTzrOKLIBdMVKwadthXrWTPmAi_eXiA?e=6SDv9B', 'HONDA/ACURA LDWI
CSC0601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2017', 'Acura', 'TLX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2017', 'Acura', 'TLX', 'Surround View Cameras', 'SVC %', 'Static Calibration - Surround View', 'nan', 'SVC (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ESJswOoX4FFHowGZQPL5bYsBC97wyjpWtDYmRSKQFNpa3A?e=V1fcgZ', 'HONDA AVM
CSC1004/03', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '3,6,9,12', 'SVC', 'Multi View Camera System (MVCS)'),
('2018', 'Acura', 'ILX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Eax-rw4eEuFBgJOd0rD4F6gBCDh7SnsnvhjtXHQktm9Skg?e=vl82cS', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'ACC (2)', 'Adaptive Cruise Control (ACC)'),
('2018', 'Acura', 'ILX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EfLthJhKfBNKlWUYvbAPX3YB5FY7gBn7FjuTizYTg7HKGA?e=3q28Is', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'AEB (2)', ' Collision Mitigation Braking System (CMBS)'),
('2018', 'Acura', 'ILX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2018', 'Acura', 'ILX', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA', 'nan'),
('2018', 'Acura', 'ILX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EXLLiUTbF15FuStgOpL9PV0B7Hq8v4FN9VXHKWRO3v8X9g?e=8Ll9DD', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2018', 'Acura', 'ILX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EZoEIf0eYxFAihRR9_T6oCkBih0cR7-C8cPGNxnzLQsB4g?e=1eefgl', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2018', 'Acura', 'ILX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ET_MZYWAUUZMj56cMLHxuucB0ixkbCB3cBwLqreSdhYZhA?e=3hVix9', 'HONDA/ACURA LDWI
CSC0601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2018', 'Acura', 'ILX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2018', 'Acura', 'ILX', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2018', 'Acura', 'MDX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:f:/s/O365-Protech-InformationSolutions/Eq4RisSy7RxBlFFVmxrAnjQBlWvoQcgojJ6Xv6dJKeIA8A?e=FhKgwj', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'ACC (2)', 'Adaptive Cruise Control (ACC)'),
('2018', 'Acura', 'MDX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EeMlPTMNdadAmc4JBbrjWG8BgnIFaS6mUSjzKnyswAQRzQ?e=aeSvZa', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR
HONDA/ACURA LDWI
CSC601/05', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'AEB (2)', ' Collision Mitigation Braking System (CMBS)'),
('2018', 'Acura', 'MDX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2018', 'Acura', 'MDX', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (1)', 'PMI', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EUirEOiOCJZPpRXeciI1gaQBeL2tndSq_QkEUZD8NnfjMg?e=vLoDHB', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA (1)', 'Parking and Back-Up Sensor'),
('2018', 'Acura', 'MDX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Ef5od5eYlBlImyqvwc7NWzIBhbirT5H0sCuTUTHX4ZK-Tg?e=XNqGkp', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2018', 'Acura', 'MDX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EcSa8_C59CdNveWAU_KGZdUB9bgvdSDLEuL9qYmQpdap3A?e=4TsywE', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2018', 'Acura', 'MDX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EVZJ9LBQNfpNoi2qyi-09hkBJVxwrhH4KpI43sL6fWRAYw?e=FnWw4x', 'HONDA/ACURA LDWI
CSC601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2018', 'Acura', 'MDX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2018', 'Acura', 'MDX', 'Surround View Cameras', 'SVC %', 'Static Calibration - Surround View', 'nan', 'SVC (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EZl4sudOInxAvLJHfJNQZP0BXrzqXypYKU9qigPxMBtjDA?e=Xzy3e4', 'HONDA AVM
CSC1004/03', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '3,6,9,12', 'SVC', 'Multi View Camera System (MVCS)'),
('2018', 'Acura', 'NSX', 'Front Radar', 'ACC %', 'No Calibration Required', 'nan', 'ACC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC (%)', 'nan'),
('2018', 'Acura', 'NSX', 'Front Radar', 'AEB %', 'No Calibration Required', 'nan', 'AEB', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB', 'nan'),
('2018', 'Acura', 'NSX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2018', 'Acura', 'NSX', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (1)', 'PMI', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EQ_hBnvAyF9AiuVVlnaL16wBjF2hBGD2ujwk1kxq6QrKzw?e=TI9JkE', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA (1)', 'Parking and Back-Up Sensor'),
('2018', 'Acura', 'NSX', 'Rear Radar', 'BSW %', 'No Calibration Required', 'nan', 'BSW', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW/RCTW', 'nan'),
('2018', 'Acura', 'NSX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Ee1wPmTxAqNApyUecmyPOOUBhYOMsnepLwIAnsqlpwUUsQ?e=zgbsLq', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2018', 'Acura', 'NSX', 'Windshield Camera', 'LKA %', 'No Calibration Required', 'No Calibration Required', 'LKA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'LKA', 'nan'),
('2018', 'Acura', 'NSX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2018', 'Acura', 'NSX', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2018', 'Acura', 'RDX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:f:/s/O365-Protech-InformationSolutions/Evg99N7KiLRInIW5dHZ0UXIBQJVKm1-h1ACNRmHM4eP6dQ?e=7sAKFg', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'ACC (2)', 'Adaptive Cruise Control (ACC)'),
('2018', 'Acura', 'RDX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EX-npvKUoBBDl6YCyMWzjOUBgzvylWUxfcYrPayA0sup4g?e=66fYFS', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR
HONDA/ACURA LDWI
CSC601/05', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'AEB (2)', ' Collision Mitigation Braking System (CMBS)'),
('2018', 'Acura', 'RDX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2018', 'Acura', 'RDX', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (1)', 'PMI', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EQzCyhSQJXtAi_tkiTsJ3fUBONo_nuLNB_oxQn8LoMO6ww?e=hPIuNP', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA (1)', 'Parking and Back-Up Sensor'),
('2018', 'Acura', 'RDX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ESf_vrqsPVxPhqyOwlJs4xkBp1rYMYjXDgTg35WGkV4eEg?e=EGnDzT', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2018', 'Acura', 'RDX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EbSvdS4BkkpKg3-ihToKVvABFa7ZL7xg5IojQmdl_XOV-Q?e=Q4VuM9', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2018', 'Acura', 'RDX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EaSrnP4dRclMuu5WPQ62qBUBwZtvlIjCX3oY_bMil5StmQ?e=Ockc0Z', 'HONDA/ACURA LDWI
CSC0601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2018', 'Acura', 'RDX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2018', 'Acura', 'RDX', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2018', 'Acura', 'RLX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Ef8jhLqPl29LsYesg-NYBfEB-_WbRPgrCoCs6LjUp4g8Zg?e=CMyjZx', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'ACC (2)', 'Adaptive Cruise Control (ACC)'),
('2018', 'Acura', 'RLX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EV83bYC38v9Lv3AN4gH0eKkBZZTAu6AyJXGtB3sAV7xCHQ?e=Zi2lrL', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'AEB (2)', ' Collision Mitigation Braking System (CMBS)'),
('2018', 'Acura', 'RLX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2018', 'Acura', 'RLX', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA (1)', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EXm_PZYFp9hEgjDgiR5b43YBOqRWJbcEE67t6AAjTEUfBA?e=lr21fs', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA (1)', 'Parking and Back-Up Sensor'),
('2018', 'Acura', 'RLX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EUaHsZS5bTBDgzYbC10JvKYBky656N4yxORyQLNuCwG2cQ?e=ll8rG3', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2018', 'Acura', 'RLX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ES68-PnPw2tCukusK1krQLIBSO0hhYgY122zE1a6nR7vrw?e=HgKgE5', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2018', 'Acura', 'RLX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Efk2Qq-1tAREiPLo_O9pv-wBCw6l3VQzNQcBk42T4IQyCg?e=AeEofR', 'HONDA/ACURA LDWI
CSC0601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2018', 'Acura', 'RLX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2018', 'Acura', 'RLX', 'Surround View Cameras', 'SVC %', 'Static Calibration - Surround View', 'nan', 'SVC (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EcBTyxYa-D5GvIrsKvL1NagBJ4i0-IH8O15HFbyMPlIj-Q?e=4IbHAQ', 'HONDA AVM
CSC1004/03', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '3,6,9,12', 'SVC', 'Multi View Camera System (MVCS)'),
('2018', 'Acura', 'TLX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ESqe6PqfUw5AvY0JAdJBEAoB7mZ7fzhsDJrWaGnsFgBT1Q?e=UhcpVJ', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'ACC (2)', 'Adaptive Cruise Control (ACC)'),
('2018', 'Acura', 'TLX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EUvK1lB86hRHp0maYsGrHlcBtmHQwUSvuCI6foO48vHF2w?e=pIfFEc', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR
HONDA/ACURA LDWI
CSC601/05', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'AEB (2)', ' Collision Mitigation Braking System (CMBS)'),
('2018', 'Acura', 'TLX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2018', 'Acura', 'TLX', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (1)', 'PMI', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EY9DjJch4vRIkVPzqXsJgBIB6kz70gcourLsvMQh0IYJyA?e=NClCel', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA (1)', 'Parking and Back-Up Sensor'),
('2018', 'Acura', 'TLX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EZV_XawOhxBMmRFgoYUfDC4BeqK2eSr2Gx7AuwjzpRUshw?e=fWV8bq', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2018', 'Acura', 'TLX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Ef6LPV-1sm1DrZI7ZmYQbuQB4TT8rCeyWFixrrD-qfW6sQ?e=xWqhaY', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2018', 'Acura', 'TLX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EWXFyeX26aJFryz4GRX_sWgBa70DOln5idOWk_jDTET1Lw?e=mNFe7c', 'HONDA/ACURA LDWI
CSC0601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2018', 'Acura', 'TLX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2018', 'Acura', 'TLX', 'Surround View Cameras', 'SVC %', 'Static Calibration - Surround View', 'nan', 'SVC (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EV21i5XrN4ZCiTaij-ocNjoBFlUNbEklJRVOEtb283dmOw?e=rZHPcn', 'HONDA AVM
CSC1004/03', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '3,6,9,12', 'SVC', 'Multi View Camera System (MVCS)'),
('2019', 'Acura', 'ILX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EW_Cpe44lS5MsIFVcME29WMB2CM7_ksenoUbkNRwyXlFjQ?e=68XfL0', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'ACC (2)', 'Adaptive Cruise Control (ACC)'),
('2019', 'Acura', 'ILX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EUCxY_YiY8RFo2Anb1W1m5sBSP5Wu-c8_Z6uVJ3IUwgxaQ?e=47iARz', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'AEB (2)', ' Collision Mitigation Braking System (CMBS)'),
('2019', 'Acura', 'ILX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2019', 'Acura', 'ILX', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA', 'nan'),
('2019', 'Acura', 'ILX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EbsZGW0FC0dKrOlwn7-EfJEBrUBI_PHYJIk0nS_wtO4jBw?e=1J0udV', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2019', 'Acura', 'ILX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EVG_AavfndJEkrliFGSn3p8BP8tGHY7DzR13Gp6MI2ACZw?e=8KUWMw', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2019', 'Acura', 'ILX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EaW0h-Rya3pHtVo7kafiC0IB_xSN8X5oulnc1Tymx1Swig?e=9Sapj8', 'HONDA/ACURA LDWI
CSC0601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2019', 'Acura', 'ILX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2019', 'Acura', 'ILX', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2019', 'Acura', 'MDX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EV14XxIDcCdGgK3mtoMLRp8B7m_jOlqgGcgbSrnQ7JZDWQ?e=zV0L93', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'ACC (2)', 'Adaptive Cruise Control (ACC)'),
('2019', 'Acura', 'MDX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EeLqsnkzQIlCoaIaDxu2lVoBfP1eEKRzQwDTXlhRsr2fTw?e=IkjzyB', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR
HONDA/ACURA LDWI
CSC601/05', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'AEB (2)', ' Collision Mitigation Braking System (CMBS)'),
('2019', 'Acura', 'MDX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2019', 'Acura', 'MDX', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (1)', 'PMI', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ESyAmhrVMQ1DrTIXCJU636sBuIK0IsS1MpvbtX9y_FlXfA?e=t0bMdA', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA (1)', 'Parking and Back-Up Sensor'),
('2019', 'Acura', 'MDX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EfhIeOIkX_hJqzhdCtbzXdQBAlzSQexhpADDeGC6SF9DEw?e=Zal5k4', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2019', 'Acura', 'MDX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Efj_dt6f2NJLq9Hrzf82W8gBJmYOIM1rSScHz2aCk0CNsw?e=b1SL5e', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2019', 'Acura', 'MDX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EVXJZAYDYeNOu6qOWpElM1cBco3Rsi-GHswZ1AKzbLanZA?e=g5EJXN', 'HONDA/ACURA LDWI
CSC0601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2019', 'Acura', 'MDX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2019', 'Acura', 'MDX', 'Surround View Cameras', 'SVC %', 'Static Calibration - Surround View', 'nan', 'SVC (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ESV0jkWo6vBGqimQ1nLu9zwBy4iGasgfOadfiZ-xhMC_iw?e=Kxq2i7', 'HONDA AVM
CSC1004/03', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '3,6,9,12', 'SVC', 'Multi View Camera System (MVCS)'),
('2019', 'Acura', 'NSX', 'Front Radar', 'ACC %', 'No Calibration Required', 'nan', 'ACC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC (%)', 'nan'),
('2019', 'Acura', 'NSX', 'Front Radar', 'AEB %', 'No Calibration Required', 'nan', 'AEB', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB', 'nan'),
('2019', 'Acura', 'NSX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2019', 'Acura', 'NSX', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (1)', 'PMI', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EWob3SNCO3pNs4qoPJvxisoBmUee9Uj0nb1luoapuOsP9w?e=RPCwTP', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA (1)', 'Parking and Back-Up Sensor'),
('2019', 'Acura', 'NSX', 'Rear Radar', 'BSW %', 'No Calibration Required', 'nan', 'BSW', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW/RCTW', 'nan'),
('2019', 'Acura', 'NSX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EcFrrbxFG1tHlirrlQoMIfEB58-ewR_QwTfNZiRfo7DyJg?e=2t8685', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2019', 'Acura', 'NSX', 'Windshield Camera', 'LKA %', 'No Calibration Required', 'No Calibration Required', 'LKA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'LKA', 'nan'),
('2019', 'Acura', 'NSX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2019', 'Acura', 'NSX', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2019', 'Acura', 'RDX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EbzQs71eA_pPhKsW5qwazZQB8JoSndOnA6KKQtaNuzvNZw?e=6T4PV0', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'ACC (2)', 'Adaptive Cruise Control (ACC)'),
('2019', 'Acura', 'RDX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EcyEK1xm3O9Aiaoko71H8MgBoubdlAQ5Yc8BltcIxRI2Zw?e=dvR1xU', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR
HONDA/ACURA LDWII
CSC601/08-L
HONDA/ACURA LDWII
CSC601/08-R', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'AEB (2)', ' Collision Mitigation Braking System (CMBS)'),
('2019', 'Acura', 'RDX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2019', 'Acura', 'RDX', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (1)', 'PMI', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ETquX2DRjtJBq7lXcDZ3wO8BtAkjTJLfMJp-BxTk9oGSNA?e=yLLssE', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA (1)', 'Parking and Back-Up Sensor'),
('2019', 'Acura', 'RDX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EVrG3rlqUlxKqyXxgh5QaccBxHVQegqCHJGd5Vxr6T5RDg?e=Meyf3H', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2019', 'Acura', 'RDX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EYaNDCDTRSJDmdmWnqEOOvgBDGca5ggYESfgiNOSrOiQ2w?e=LATTbS', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2019', 'Acura', 'RDX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EQTdRSJvPXZCoL_RWYhGh9QBTgUbnojjhyVSE5gXzOQfVg?e=gi3of8', 'HONDA/ACURA LDWII
CSC601/08-L
HONDA/ACURA LDWII
CSC601/08-R', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2019', 'Acura', 'RDX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2019', 'Acura', 'RDX', 'Surround View Cameras', 'SVC %', 'Static Calibration - Surround View', 'nan', 'SVC (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EYq3IxvHJMVFjYfGm0dGUAABNkkvvLssEGmugsyge1iy4w?e=FPDaC3', 'HONDA AVM
CSC1004/03', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '3,6,9,12', 'SVC', 'Multi View Camera System (MVCS)'),
('2019', 'Acura', 'RLX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Ecm21D-FpE9GjAOtpCc3WbIBYDZIxH1zLRVvPZ4XJO1nIw?e=2GSEoi', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'ACC (2)', 'Adaptive Cruise Control (ACC)'),
('2019', 'Acura', 'RLX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EX7MS0TWBmBCqH1_oCka2rwBWn7ZZWwFmf_im7zX0mebrw?e=6XgiT1', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'AEB (2)', ' Collision Mitigation Braking System (CMBS)'),
('2019', 'Acura', 'RLX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2019', 'Acura', 'RLX', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA (1)', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ESk9HUPDwXhHlSS0dobw5iYB6pIlwPxF3SnWO7QwRv3bQg?e=PXnzA4', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA (1)', 'Parking and Back-Up Sensor'),
('2019', 'Acura', 'RLX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ETsCGKXKsg5AuExb1m-nJAEBu5tJItCYtj34i_g3piONbg?e=sZWhWA', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2019', 'Acura', 'RLX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EU41A_rv9GlEgE5VheS7OEYBc1CWpCUcBvln4ytIUrA87Q?e=8wlK85', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2019', 'Acura', 'RLX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EUbMrHOJJv1JpiIneZRnOpcBeqm_j-U5tct4E-JOoko95A?e=xrLKw9', 'HONDA/ACURA LDWI
CSC0601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2019', 'Acura', 'RLX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2019', 'Acura', 'RLX', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2019', 'Acura', 'TLX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EfsQ7tWuTIpFq0tQYRsauFMBbaIgiVN0WGq3p5zOCepOKA?e=rnlSSm', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'ACC (2)', 'Adaptive Cruise Control (ACC)'),
('2019', 'Acura', 'TLX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EY7fDxoZVW5KuMk-p5KNLLYBMXpeDn8ZyoshFl8TLhVHOA?e=Pribnx', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR
HONDA/ACURA LDWI
CSC601/05', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'AEB (2)', ' Collision Mitigation Braking System (CMBS)'),
('2019', 'Acura', 'TLX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2019', 'Acura', 'TLX', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (1)', 'PMI', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EYiCf1UGwSZHkYeaUn2BT4kBX7lbUDqTM49Db6-_DZcwIA?e=XaT8jX', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA (1)', 'Parking and Back-Up Sensor'),
('2019', 'Acura', 'TLX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Eaep0LwMbjNJpEqzdr6AclEBICo4VSUaOukOEZKI5M669A?e=0kGNA0', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2019', 'Acura', 'TLX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EdECaI53LTpNm5Ci6D-QgUMBtA9d2QKjCJNVdvHlQRPaEA?e=a9kagS', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2019', 'Acura', 'TLX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ER1bfA0U5JxNv_gDBU7EFGUBjH81UYniQ-_okyymZluC-A?e=PKtaSa', 'HONDA/ACURA LDWI
CSC0601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2019', 'Acura', 'TLX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2019', 'Acura', 'TLX', 'Surround View Cameras', 'SVC %', 'Static Calibration - Surround View', 'nan', 'SVC (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EcljCVvFj8dAtuXBtekFoxQBIU2ztdziEfH2BG3eIAAqfg?e=Py0h3W', 'HONDA AVM
CSC1004/03', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '3,6,9,12', 'SVC', 'Multi View Camera System (MVCS)'),
('2020', 'Acura', 'ILX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EdDGXO5FmbpEs5DYjntbEygBqYG9jOqqVvGABksmnuzLPg?e=ez7d8R', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'ACC (2)', 'Adaptive Cruise Control (ACC)'),
('2020', 'Acura', 'ILX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ERKDz_5N5FNMs3wusvogB-MBrwBWQsbb7PwlauFMHcW-rA?e=GKM65E', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'AEB (2)', ' Collision Mitigation Braking System (CMBS)'),
('2020', 'Acura', 'ILX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2020', 'Acura', 'ILX', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA', 'nan'),
('2020', 'Acura', 'ILX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EfCLSKSgP9dAlBaJwx29AQYBRgSXy9_medwBsIzjFX8xeA?e=wuBHpl', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2020', 'Acura', 'ILX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Ebegwkgn_UtLtyNncYZ9jIgBqL8FcqjB7AsPc59l-SbQ9w?e=TJC90O', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2020', 'Acura', 'ILX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EbuNU83EYIZLk7x17RRJymwB7zdmhGFQAB8YtneQcO86MQ?e=gDITPk', 'HONDA/ACURA LDWI
CSC0601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2020', 'Acura', 'ILX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2020', 'Acura', 'ILX', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2020', 'Acura', 'MDX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EZb5zeWgvm1ChzrQgSbtiEsBk-zRM440Ox9nEZMzzt01lg?e=OSg2s9', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'ACC (2)', 'Adaptive Cruise Control (ACC)'),
('2020', 'Acura', 'MDX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EfZz-jIxj6dBqCCHOuH6ZB8B9sUZafoeinV_i0CCfqLAlw?e=JevNpp', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR
HONDA/ACURA LDWI
CSC601/05', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'AEB (2)', ' Collision Mitigation Braking System (CMBS)'),
('2020', 'Acura', 'MDX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2020', 'Acura', 'MDX', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (1)', 'PMI', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EQPyxyWjFPtAq_yILtuSV7gB1jM3fGDBRalK-TeG2vjP0Q?e=DJvfq4', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA', 'Parking and Back-Up Sensor'),
('2020', 'Acura', 'MDX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EaIQPsmozslLtEezkL3m-hUB8KqtzOHC1RUKwVRWX-DRLw?e=E78a3g', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2020', 'Acura', 'MDX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EfQjcEYo_NVNuYf0yz3N9ucBuwnRoCuUaByi4Kw7_U7g0w?e=tXN8jL', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2020', 'Acura', 'MDX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EUDJ5O_p7QdPipp2pOcpoJIB54v2STtn57z9Bg8dEVLSCw?e=TYTQUy', 'HONDA/ACURA LDWI
CSC0601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2020', 'Acura', 'MDX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2020', 'Acura', 'MDX', 'Surround View Cameras', 'SVC %', 'Static Calibration - Surround View', 'nan', 'SVC (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EZrAOKek6Z5EvYACGKamER4BZzvB2N_uM06l_TcIrM5uAA?e=T53Z6N', 'HONDA AVM
CSC1004/03', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '3,6,9,12', 'SVC', 'Multi View Camera System (MVCS)'),
('2020', 'Acura', 'NSX', 'Front Radar', 'ACC %', 'No Calibration Required', 'nan', 'ACC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC (%)', 'nan'),
('2020', 'Acura', 'NSX', 'Front Radar', 'AEB %', 'No Calibration Required', 'nan', 'AEB', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB', 'nan'),
('2020', 'Acura', 'NSX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2020', 'Acura', 'NSX', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (1)', 'PMI', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EVEBYaaD2q5Kh5mqKL6Gue0BK2GMVybGn0p3HcoEbNkgHQ?e=9N0lHd', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA', 'Parking and Back-Up Sensor'),
('2020', 'Acura', 'NSX', 'Rear Radar', 'BSW %', 'No Calibration Required', 'nan', 'BSW', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW/RCTW', 'nan'),
('2020', 'Acura', 'NSX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EbRx05b3nPZGqlXzAolFuZoB5EVnR1wVtTMH8IdtIrndZg?e=VeM8y7', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2020', 'Acura', 'NSX', 'Windshield Camera', 'LKA %', 'No Calibration Required', 'No Calibration Required', 'LKA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'LKA', 'nan'),
('2020', 'Acura', 'NSX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2020', 'Acura', 'NSX', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2020', 'Acura', 'RDX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EfrWmSBTzrFIo7J3wOcO0l4BaVW5C_oO80_SweI9RiCtnQ?e=9O6hx3', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'ACC (2)', 'Adaptive Cruise Control (ACC)'),
('2020', 'Acura', 'RDX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EWNk2yqm56xCgAFXhTRJ8bUBY4rFad9VVyn_UcGm158ssQ?e=SlwNd3', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR
HONDA/ACURA LDWII
CSC601/08-L
HONDA/ACURA LDWII
CSC601/08-R', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'AEB (2)', ' Collision Mitigation Braking System (CMBS)'),
('2020', 'Acura', 'RDX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2020', 'Acura', 'RDX', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (1)', 'PMI', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EWZASNdyuh1JgGU0NctSwtYB_QwvRvbAibQxZsilLqQsYg?e=O7kXlj', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA', 'Parking and Back-Up Sensor'),
('2020', 'Acura', 'RDX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EVRWt4DUD8RDsQCzxeG7Xj4BBLAlRF-7Cd7ObSQ3bdBZWg?e=I0AzS5', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2020', 'Acura', 'RDX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EYRwTROsshtBl7uMHyho5IQBUa96dgwnVWSIOnQdtbdGaw?e=hobtW4', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2020', 'Acura', 'RDX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ERrGghhpAnlJgGKDyzbaQZ8ByGuHPBHvXv986vte-JLYRA?e=07xDZZ', 'HONDA/ACURA LDWII
CSC601/08-L
HONDA/ACURA LDWII
CSC601/08-R', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2020', 'Acura', 'RDX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2020', 'Acura', 'RDX', 'Surround View Cameras', 'SVC %', 'Static Calibration - Surround View', 'nan', 'SVC (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EUBjmuQHbqhKmyTBkhd2yE4B5FhxHCJaU_7n9syTWRYOiQ?e=m98Azs', 'HONDA AVM
CSC1004/03', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '3,6,9,12', 'SVC', 'Multi View Camera System (MVCS)'),
('2020', 'Acura', 'RLX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EXL1DAA97VNBlHuweWhfNNcBtcqfK5QB2kGeqbc5vLgB2A?e=1VmghR', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'ACC (2)', 'Adaptive Cruise Control (ACC)'),
('2020', 'Acura', 'RLX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Ef5X7X9Ww8xKveRdCaNcDjIB9OWtUOtTCLuqmqMq08pDSg?e=z0Q86R', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'AEB (2)', ' Collision Mitigation Braking System (CMBS)'),
('2020', 'Acura', 'RLX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2020', 'Acura', 'RLX', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA (1)', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EVcW4XN-vlZIqFFq5vN9JTQBdc9R9g9l7s8pGdlHv09P4Q?e=psdJOD', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA', 'Parking and Back-Up Sensor'),
('2020', 'Acura', 'RLX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Edw7bXPDTFRCnIb5W9hRYtgBXsa0nofGOac6qTeYVdGG3w?e=WDaQWI', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2020', 'Acura', 'RLX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EWwJzkOZD-VAhyuCvjjVcpMBfUeNZJXciEDw-nhVTbxMww?e=3KQ5iJ', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2020', 'Acura', 'RLX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Ec8uOuBMP1dHgaShmlt91e8B8yyv1YMQLAUI6H9eBWQLLg?e=4iJtC3', 'HONDA/ACURA LDWI
CSC0601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2020', 'Acura', 'RLX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2020', 'Acura', 'RLX', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC (1)', 'nan', 'No Information Found at this Time', 'No Info Found', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Ed39LcqZ_gJBmTvIwZ5411kBRP-WStblZstRzfInOwOTLQ?e=WPoZn5', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2020', 'Acura', 'TLX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EUyc-R80epZEvBA1FmOkgMgBh3RadN_HZ9jlLlxvGn7i9w?e=ZpoxxU', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'ACC (2)', 'Adaptive Cruise Control (ACC)'),
('2020', 'Acura', 'TLX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ETbSYihzKQFFjvzk3TqWv0QBdfkqvbJ7tmGsi9Ln61QQrg?e=ibe8eW', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR
HONDA/ACURA LDWI
CSC601/05', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'AEB (2)', ' Collision Mitigation Braking System (CMBS)'),
('2020', 'Acura', 'TLX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2020', 'Acura', 'TLX', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (1)', 'PMI', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EVYV9OH7ZXVBrHDQt4aR21QB20M4z6tDnJdFdjUtYAPfwA?e=jc3fUu', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA', 'Parking and Back-Up Sensor'),
('2020', 'Acura', 'TLX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EQWoFpw2P9FHhn6pu6-2yhsBRrA3giigCkBgHB_JQL5jjw?e=4jO5V7', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2020', 'Acura', 'TLX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EWiVC7x0KZNNivN73RzPJaMBQmC2Xh7a05wpkS5MMYpbdw?e=4P7XpI', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2020', 'Acura', 'TLX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EYqqL5nGSn9AoLFwD-HNWSgB4NdGC2GQyqSGF4ovTR1t3g?e=j8m0eM', 'HONDA/ACURA LDWI
CSC0601/24/01 or PTHON24', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2020', 'Acura', 'TLX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2020', 'Acura', 'TLX', 'Surround View Cameras', 'SVC %', 'Static Calibration - Surround View', 'nan', 'SVC (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:f:/s/O365-Protech-InformationSolutions/Ely_820EFudEkY27VgP7ZNABxmDrvbKOVjKeoRKDwBY4YQ?e=jdIipe', 'HONDA AVM
CSC1004/03', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '3,6,9,12', 'SVC', 'Multi View Camera System (MVCS)'),
('2021', 'Acura', 'ILX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EZjFEcnkMalDrIJLvjIjfsgB8iN_XHLhmlsT28XN9e2HSA?e=T8XUr5', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'ACC (2)', 'Adaptive Cruise Control (ACC)'),
('2021', 'Acura', 'ILX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EagoNiW2pHVPhnqfnmr82c8BWRGDlDT48Fe5zyAVqqJMxw?e=ORenkH', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'AEB (2)', ' Collision Mitigation Braking System (CMBS)'),
('2021', 'Acura', 'ILX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EdV6BzpNVcdKhTsbx_WzOB4B0Sm4mZoYwLRYw9vfYrZ3lw?e=ICvgvv', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2021', 'Acura', 'ILX', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA', 'nan'),
('2021', 'Acura', 'ILX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EXZ3ekWjFcpItwrXaGP6TLYBj3u5OSkY_X7qCImWa04w8w?e=znCdMl', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2021', 'Acura', 'ILX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EWHu9KzuAXFAq389i1M3zMoBw2Hoh5YsoEH0p_9v6P1FOw?e=91TzCT', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2021', 'Acura', 'ILX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EQf-QooRJB9Nprt0v6zEsREBTX_N-69cbbFRyxnrgZhavQ?e=PogLjx', 'HONDA/ACURA LDWI
CSC0601/24/01 or PTHON24', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2021', 'Acura', 'ILX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2021', 'Acura', 'ILX', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2021', 'Acura', 'RDX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EeKqpgkSfXRCgV9lv8BxXAEBrAgbe62y3j4iUpK753d2GQ?e=eJhjyg', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'ACC (2)', 'Adaptive Cruise Control (ACC)'),
('2021', 'Acura', 'RDX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EasUx3tHpkpOvGLSbWuZiGIB4HTPDB5o7JUPQFEJHkQXdA?e=kZNJSL', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR
HONDA/ACURA LDWII
CSC601/08-L
HONDA/ACURA LDWII
CSC601/08-R', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'AEB (2)', ' Collision Mitigation Braking System (CMBS)'),
('2021', 'Acura', 'RDX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EQovV1HLCUtOiX9O6Qp6INcBTpCoVtx5MSW3UNOfrzNpYg?e=AWeTFv', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2021', 'Acura', 'RDX', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (1)', 'PMI', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Ef0jki75P9pLgXgDaK9ggMEBhPKstwUdkj5uCJra2jEAbw?e=szOdWC', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA', 'Parking and Back-Up Sensor'),
('2021', 'Acura', 'RDX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EQnNKb-xF3JOn3ctQACxB6UBeNAf3oLeHg_-qXkKJ3MQkA?e=bVqgoj', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2021', 'Acura', 'RDX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EQvXylg3kEdMn8vOoWvHwvYBdBVvCI3sNIxKXeSDlug9UA?e=8PINW6', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2021', 'Acura', 'RDX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EWdlDJO4hOhPi9jVYij4O_ABG6vKEdYDA_QFcLtmaUbKoQ?e=1ZQ4rC', 'HONDA/ACURA LDWII
CSC601/08-L
HONDA/ACURA LDWII
CSC601/08-R', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2021', 'Acura', 'RDX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2021', 'Acura', 'RDX', 'Surround View Cameras', 'SVC %', 'Static Calibration - Surround View', 'nan', 'SVC (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EWO2bNoSWBVDiyh_D9klzKoB-7GVEQZHxCrxVx0c2aK-OA?e=yuIC0Z', 'HONDA AVM
CSC1004/03', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '3,6,9,12', 'SVC', 'Multi View Camera System (MVCS)'),
('2021', 'Acura', 'TLX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ESMT6xHFgb9Kn5LeAmxNVs0B5Hbdz9v0jLbPofdVzJn6gQ?e=PcR4z9', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'ACC (2)', 'Adaptive Cruise Control (ACC)'),
('2021', 'Acura', 'TLX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EZVMR9PiGrdFjUh44BsY3KcB05jp06KR1dSNSFZ2hCrA1A?e=2NsGbi', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR
HONDA/ACURA LDWII
CSC601/08-L
HONDA/ACURA LDWII
CSC601/08-R', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'AEB (2)', ' Collision Mitigation Braking System (CMBS)'),
('2021', 'Acura', 'TLX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2021', 'Acura', 'TLX', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (1)', 'PMI', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Eax0Q2tq8KZDsivcnXw7ly0BOb1Zdz4-3tINJik7oyB_PA?e=HGZ3pF', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA', 'Parking and Back-Up Sensor'),
('2021', 'Acura', 'TLX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EZRDTw4o-1hGq07lBvDzVMUBde-LYwP96iEMcTDw8c8lUw?e=9VIxBr', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2021', 'Acura', 'TLX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EfJm7ZQlPIpAkZh0GmmD_IQB-z_o5f1b4dxq_QDnfHZoJA?e=sZuafv', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2021', 'Acura', 'TLX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Ee1c_-qjbjpJsBG7L21Gm1IBjYB4c_8e9sH5S7jLppCTow?e=pkXuQl', 'HONDA/ACURA LDWII
CSC601/08-L
HONDA/ACURA LDWII
CSC601/08-R', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2021', 'Acura', 'TLX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2021', 'Acura', 'TLX', 'Surround View Cameras', 'SVC %', 'Static Calibration - Surround View', 'nan', 'SVC (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EV0_FOa9hVhAn6wedrG2kLoBbo-pB5bTghjiw--Gq_T2nA?e=4qaJe2', 'HONDA AVM
CSC1004/03', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '3,6,9,12', 'SVC', 'Multi View Camera System (MVCS)'),
('2022', 'Acura', 'ILX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EeSS8BXGt3tBjLglSh7U_LoBFSMWcVEpvRn41fS294asig?e=E02iSi', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR
HONDA/ACURA LDWII
CSC601/08-L
HONDA/ACURA LDWII
CSC601/08-R', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'ACC (2)', 'Adaptive Cruise Control (ACC)'),
('2022', 'Acura', 'ILX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:f:/s/O365-Protech-InformationSolutions/EhNcLd3S9axElXB81rL15gcBZQrkUuJYAuXkVCbslbGtXw?e=3KvsTS', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR
HONDA/ACURA LDWII
CSC601/08-L
HONDA/ACURA LDWII
CSC601/08-R', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'AEB (2)', ' Collision Mitigation Braking System (CMBS)'),
('2022', 'Acura', 'ILX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2022', 'Acura', 'ILX', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA', 'nan'),
('2022', 'Acura', 'ILX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ESv0NGnPMWtGuf_YLoJ_iyMBBhhGl1pEPC_eCcrbmgOx8Q?e=gWFmmA', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2022', 'Acura', 'ILX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EbwJDXzVmrVLqTJwAUSNi1QBy4pYitjv7J9zkd2oaSD2aA?e=uxblas', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2022', 'Acura', 'ILX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EfaUNUpYp_ZEv6Exf-7NJmQBUYRkICkWM-WNkI3h2DZ5bQ?e=INjBf8', 'HONDA/ACURA LDWI
CSC0601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2022', 'Acura', 'ILX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2022', 'Acura', 'ILX', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2022', 'Acura', 'MDX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EQmLP5Z2Mt9Ivx2J1gocFi0B1T1PLFQmC3tPjWg07ivb7w?e=xUtJIK', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR
HONDA/ACURA LDWI
CSC601/05', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'ACC (2)', 'Adaptive Cruise Control (ACC)'),
('2022', 'Acura', 'MDX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ESvAxuJBDgxJl3umU0XA5w8BGqZKL-RxnnnwqOUSyIdDHA?e=Ta91rz', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR
HONDA/ACURA LDWI
CSC601/05', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'AEB (2)', ' Collision Mitigation Braking System (CMBS)'),
('2022', 'Acura', 'MDX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2022', 'Acura', 'MDX', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA (1)', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EVcolvzzMFVFpiEn_K3K3FIBmBinIl9y__ytTsmHtQoUxw?e=aqcmbC', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA', 'Parking and Back-Up Sensor'),
('2022', 'Acura', 'MDX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EXMqfi7cJHtFngT8ZG1RZUkBencDVya8_dHoBYD3nag3VQ?e=3WoYHO', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2022', 'Acura', 'MDX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EeevpshpOrhAo1hiBhSlhWEBx0_uDEq1GTQFcA7JjRWJeA?e=xH6K3X', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2022', 'Acura', 'MDX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EYkVT46FwlFKriTcEIjnG9EBq8en6gZDl0x1-7qhJWwK8Q?e=v2dmcA', 'HONDA/ACURA LDWI
CSC0601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2022', 'Acura', 'MDX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2022', 'Acura', 'MDX', 'Surround View Cameras', 'SVC %', 'Static Calibration - Surround View', 'nan', 'SVC (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EdCnfX7g1plLnr0ytWEzc3oB3dL5t9xe7dTjcZ1vqX196Q?e=u89QXh', 'HONDA AVM
CSC1004/03', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '3,6,9,12', 'SVC', 'Multi View Camera System (MVCS)'),
('2022', 'Acura', 'NSX', 'Front Radar', 'ACC %', 'No Calibration Required', 'nan', 'ACC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC (%)', 'nan'),
('2022', 'Acura', 'NSX', 'Front Radar', 'AEB %', 'No Calibration Required', 'nan', 'AEB', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB', 'nan'),
('2022', 'Acura', 'NSX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2022', 'Acura', 'NSX', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (1)', 'PMI', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ETe3SJa6NPdFgE-rhHB4GrABT9wOVA59n58ej7aK7fZGgA?e=IqXHEz', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA', 'Parking and Back-Up Sensor'),
('2022', 'Acura', 'NSX', 'Rear Radar', 'BSW %', 'No Calibration Required', 'nan', 'BSW', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW/RCTW', 'nan'),
('2022', 'Acura', 'NSX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ESsTYRggTzdEpVlQRJwiriQBWgOXBbRq9WH80xhOSs5oDw?e=aLlIlO', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2022', 'Acura', 'NSX', 'Windshield Camera', 'LKA %', 'No Calibration Required', 'No Calibration Required', 'LKA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'LKA', 'nan'),
('2022', 'Acura', 'NSX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2022', 'Acura', 'NSX', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2022', 'Acura', 'RDX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Ed4G4Itx105GhSenw-Buzf0Bo4QtSGEEhecs5wJiMLi3yw?e=joEuuC', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR
HONDA/ACURA LDWII
CSC601/08-L
HONDA/ACURA LDWII
CSC601/08-R', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'ACC (2)', 'Adaptive Cruise Control (ACC)'),
('2022', 'Acura', 'RDX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:f:/s/O365-Protech-InformationSolutions/ErlRoBGB-EVEjsw8dSUabB4BSe7K9MOponlglobb1FC-zg?e=Scu1WL', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR
HONDA/ACURA LDWII
CSC601/08-L
HONDA/ACURA LDWII
CSC601/08-R', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'AEB (2)', ' Collision Mitigation Braking System (CMBS)'),
('2022', 'Acura', 'RDX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EZtPdcmpwO5KpAQyJ3daZj8By0cUUjK288ZJwqYEMs-AIA?e=JOOYcC', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2022', 'Acura', 'RDX', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (1)', 'PMI', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ES8aeIYddIJDmaTr7KpxJ90Bdz5LfN2KohOZH1yjEp0e4Q?e=hCR6a5', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA', 'Parking and Back-Up Sensor System'),
('2022', 'Acura', 'RDX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EYOKeY0R5AZDp-rlJfyZDFwBP3RGv--1Ca6J-SdQe1MacA?e=oPdZ3y', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2022', 'Acura', 'RDX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Eai_7yqUW8dOomXrmMwWOP0B0N9cg3KNCNLnGZaWSnypyQ?e=K5tRuI', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2022', 'Acura', 'RDX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EWV2JJ-zM_hIolneWM8nSpQBtqvuZl27rEU7wcQBEp-QuA?e=JlFn1V', 'HONDA/ACURA LDWII
CSC601/08-L
HONDA/ACURA LDWII
CSC601/08-R', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2022', 'Acura', 'RDX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2022', 'Acura', 'RDX', 'Surround View Cameras', 'SVC %', 'Static Calibration - Surround View', 'nan', 'SVC (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EZz0HZRi_gFAtQn89W6B9OwBEdqIS1WJ_T7bwQ2sPu96_Q?e=zcdiSz', 'HONDA AVM
CSC1004/03', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '3,6,9,12', 'SVC', 'Multi View Camera System (MVCS)'),
('2022', 'Acura', 'TLX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EeKE_TeMleJGmiZh0qKKINQBr6iZRjnw2hY8J7k339p5Gw?e=KMp679', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'ACC (2)', 'Adaptive Cruise Control (ACC)'),
('2022', 'Acura', 'TLX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ESdGX3YkOdpLi-WG-PFkGuEBjs_Pqpuaz4SCCYAhyqHa2A?e=1xWeUx', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR
HONDA/ACURA LDWI
CSC601/05', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'AEB (2)', ' Collision Mitigation Braking System (CMBS)'),
('2022', 'Acura', 'TLX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2022', 'Acura', 'TLX', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (1)', 'PMI', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ERuXQSbDYm5AmSOn2w_bzeABSb6m2vsGJPAANGRmMpa3Lg?e=m7J84a', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA', 'Parking and Back-Up Sensor'),
('2022', 'Acura', 'TLX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Ec6fF-lNxUhFgW02IbIZ7OkB9fk4VbIY6aTfY1D3rR1AWw?e=RWbNiy', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2022', 'Acura', 'TLX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EQJA9W0rJWJIkVcJJDm4FkIBcUz_LTj1NkiNZP4UbSJZfg?e=ynUJho', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2022', 'Acura', 'TLX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EYt_p8czWHNDlZUstmReEXoBzMo1haZzysa4OSsqbhBZIg?e=36F7bZ', 'HONDA/ACURA LDWI
CSC0601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2022', 'Acura', 'TLX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2022', 'Acura', 'TLX', 'Surround View Cameras', 'SVC %', 'Static Calibration - Surround View', 'nan', 'SVC (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ESx84_Sme81ElpIVcGqXSfUB_sQzjYgdsMqirltJIKNjRQ?e=I86ffU', 'HONDA AVM
CSC1004/03', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '3,6,9,12', 'SVC', 'Multi View Camera System (MVCS)'),
('2023', 'Acura', 'INTEGRA', 'Windshield Camera', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (3)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EVRqYmVJvWxFrb7PxZnz7PYBZjlO4N6Lp6_UfeqiUBDPdA?e=A36iXT', 'HONDA/ACURA LDWI
CSC601/05', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'ACC (3)', 'Adaptive Cruise Control (ACC)'),
('2023', 'Acura', 'INTEGRA', 'Windshield Camera', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (3)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EeI3BL-6T0VCr9TNKZ1RaWwBNvji34BahdF_BrUWckceZg?e=sJWEtR', 'HONDA/ACURA LDWI
CSC601/05', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'AEB (3)', ' Collision Mitigation Braking System (CMBS)'),
('2023', 'Acura', 'INTEGRA', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2023', 'Acura', 'INTEGRA', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (1)', 'PMI', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EfMKM57GwtxIoj9b4ZSao4kBpbihZzm1-2kAeKbHlcbCiA?e=m5C84L', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA', 'Parking and Back-Up Sensor'),
('2023', 'Acura', 'INTEGRA', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EfBa_bP9GXlGno2sJt9PyvkB_ukkkbgNn65Hr9qICff63A?e=FIeUMc', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2023', 'Acura', 'INTEGRA', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'Static', 'Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size].', 'Cargo & Passenger areas empty
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EUQE49UUsEhOvVwW1e-0eK0B3MuR176HjbTonnnvLphfrQ?e=SJEUiY', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2023', 'Acura', 'INTEGRA', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EUclqUn8qKxDv46entCrBpEBTzfQ-M9mTT9lxKF2QfLgUg?e=Hddc89', 'HONDA/ACURA LDWI
CSC0601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2023', 'Acura', 'INTEGRA', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2023', 'Acura', 'INTEGRA', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2023', 'Acura', 'MDX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EbHBLVEu53xDtxLR-XQtpG8BpjF72ps9kwTff-VtOwQVhw?e=ZiZPu0', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR
HONDA/ACURA LDWI
CSC601/05', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'ACC (2)', 'Adaptive Cruise Control (ACC)'),
('2023', 'Acura', 'MDX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EalZRYzKSBJOhN_r451dv2sBi2TFjAlSsfuHviCQYZVvXQ?e=V2K48e', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR
HONDA/ACURA LDWI
CSC601/05', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'AEB (2)', ' Collision Mitigation Braking System (CMBS)'),
('2023', 'Acura', 'MDX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2023', 'Acura', 'MDX', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (1)', 'PMI', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EWgYBqb1soJPvt3RuZreQ8ABMFT7KzOvSVWKWgqS9PNElw?e=r92ZTF', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA', 'Parking and Back-Up Sensor'),
('2023', 'Acura', 'MDX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EW5QndSHetlLvd81HbSNWtwBts_Rgu7GB8kyAdBn7LKcww?e=7lImoX', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2023', 'Acura', 'MDX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ESyWto2S-4xMmHp4vPjthtAB4oNA5DoiNyCA86aTH5dPsQ?e=ZP3X3a', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2023', 'Acura', 'MDX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EUO7-_aL5GZAndPJwC0DoHUB22WOCT21fABsZ-nvDMzN7w?e=59DjF4', 'HONDA/ACURA LDWI
CSC0601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2023', 'Acura', 'MDX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2023', 'Acura', 'MDX', 'Surround View Cameras', 'SVC %', 'Static Calibration - Surround View', 'nan', 'SVC (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Ee35ztVaik9OuJ6Jp2vGI7gBzJFAUD30hPYkgIEFZVngOA?e=3PybvL', 'HONDA AVM
CSC1004/03', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '3,6,9,12', 'SVC', 'Multi View Camera System (MVCS)'),
('2023', 'Acura', 'RDX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EfAd7u4og0NIlXcAWIZQNYoBv737cwjLIZx7PTuZLApRGA?e=XJY7WO', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR
HONDA/ACURA LDWII
CSC601/08-L
HONDA/ACURA LDWII
CSC601/08-R', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'ACC (2)', 'Adaptive Cruise Control (ACC)'),
('2023', 'Acura', 'RDX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Ef2SAbhR88xPid6sVll7V40BQPyEpL89nvAbx5ViF3LzQg?e=EQO0Mc', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR
HONDA/ACURA LDWII
CSC601/08-L
HONDA/ACURA LDWII
CSC601/08-R', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'AEB (2)', ' Collision Mitigation Braking System (CMBS)'),
('2023', 'Acura', 'RDX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2023', 'Acura', 'RDX', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (1)', 'PMI', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Eb-nqgH0W-hAsXXGubmcs1sBIeo5Pio1PoPnq-9NPQY1TA?e=KE6Zyx', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA', 'Parking and Back-Up Sensor'),
('2023', 'Acura', 'RDX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EQvoe2u_dwRHp_9PmDIafowBR2B4oKzEG4cePvefUxZ3oQ?e=7l6448', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2023', 'Acura', 'RDX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EVYFieQeN3dOiW1FJWvvJn0BoGUDK_ab-MPHxbQqIYJqLA?e=YRHPJj', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2023', 'Acura', 'RDX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EeIETv6QOzdNtKCqbcpl1KkBEp1blscZOsLv1foTx4oXyA?e=Qa1Xg5', 'HONDA/ACURA LDWII
CSC601/08-L
HONDA/ACURA LDWII
CSC601/08-R', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2023', 'Acura', 'RDX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2023', 'Acura', 'RDX', 'Surround View Cameras', 'SVC %', 'Static Calibration - Surround View', 'nan', 'SVC (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EQqMvlZpXN5JiePfvhiwjFcBYpUpRYAUDDruw6jBNeMw0Q?e=WEG7cC', 'HONDA AVM
CSC1004/03', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '3,6,9,12', 'SVC', 'Multi View Camera System (MVCS)'),
('2023', 'Acura', 'TLX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EWtXuR3DhuJDgkU9yeiuGkUBntN_iBj2DZ1_7vYn3adgug?e=066Nr9', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'ACC (2)', 'Adaptive Cruise Control (ACC)'),
('2023', 'Acura', 'TLX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EZ2NKkOCUgVHgSc-qeOz3DYB7_liNTDamba7azdiGVGmwA?e=bclxk7', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR
HONDA/ACURA LDWI
CSC601/05', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '1,11,12,13', 'AEB (2)', ' Collision Mitigation Braking System (CMBS)'),
('2023', 'Acura', 'TLX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2023', 'Acura', 'TLX', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (1)', 'PMI', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EZLTEhGEFtZNiwfxZczLVsMBgGpQyI-lXbYjgiN9HhpWRA?e=moCeeR', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA', 'Parking and Back-Up Sensor'),
('2023', 'Acura', 'TLX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EaE86tDHaeVIiWAKo0dArgcBaraqB4y1eDSv-7udN4zxxQ?e=30wNSN', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information'),
('2023', 'Acura', 'TLX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'P&P', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EcVsw7lilGtPg_BOLx_-CT0BgCPEZA7G8EdSKnjnEkmSww?e=yOsPHR', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '6', 'BUC', 'Rearview Camera '),
('2023', 'Acura', 'TLX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ESQnBYT1iGJMkG7aUhe7A3gBckysqdORcxSLR_3pVaUSuA?e=dZnOLP', 'HONDA/ACURA LDWI
CSC0601/24/01', 'PTHON24', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'The replacement windshield must be a Acura genuine replacement windshield. Installing an aftermarket windshield will cause the aiming to fail or abnormal operation of the driving support system.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQSqp9kVHeZAic171m-Yvt4BKoVILkMsTWgugqy63BpfEw?e=lB1fUF', 'nan', 'nan', '13', 'LKA (1)', 'Lane Keeping Assist System (LKAS)'),
('2023', 'Acura', 'TLX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2023', 'Acura', 'TLX', 'Surround View Cameras', 'SVC %', 'Static Calibration - Surround View', 'nan', 'SVC (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ETZK5OdphH5LmBw7NL77b9QBMo58bad4eNhz1zAbNmOC5Q?e=f3YUss', 'HONDA AVM
CSC1004/03', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '3,6,9,12', 'SVC', 'Multi View Camera System (MVCS)'),
('2024', 'Acura', 'INTEGRA', 'Windshield Camera', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (3)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure enough fuel for an extended drive cycle [The vehicle may need to be driven for up to an hour].
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size].', 'Alignment Check
Cargo & Passenger areas empty
Min 1/4 Fuel Tank
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EcJ2qn6OCmZLnXp5W2ZeWXkBFnGQ6qnVMae83eiHW3NH0Q?e=MtTigV', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC (3)', 'Adaptive Cruise Control (ACC)'),
('2024', 'Acura', 'INTEGRA', 'Windshield Camera', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (3)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure enough fuel for an extended drive cycle [The vehicle may need to be driven for up to an hour].
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size].', 'Alignment Check
Cargo & Passenger areas empty
Min 1/4 Fuel Tank
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EQ-ouhk8V29KpjpSpgqsBrEBcJXN_krMk6HCeVXKyAAyjw?e=h1Sz0R', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB (3)', 'Collision Mitigation Braking System (CMBS)'),
('2024', 'Acura', 'INTEGRA', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2024', 'Acura', 'INTEGRA', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (1)', 'PMI', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EYzuzmfv2IhLtAMyelvfbZgBrDdtRvRLQgKhNOI_VyB8AA?e=cetDTD', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA', 'Pending Further Research'),
('2024', 'Acura', 'INTEGRA', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ETOMWjVYNSpEk-a8Myap2WMBIpz03oHFU7ixaEn32XKVEA?e=X3L8dJ', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW/RCTW (1)', 'Blind Spot Information (BSI) System'),
('2024', 'Acura', 'INTEGRA', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'Static', 'Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size].', 'Cargo & Passenger areas empty
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ET0s6fZBUwpNvX8LkNTpqwEBqAQd3YLGGWs0uQgv1U__cQ?e=xque0G', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BUC', 'Pending Further Research'),
('2024', 'Acura', 'INTEGRA', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure enough fuel for an extended drive cycle [The vehicle may need to be driven for up to an hour].
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EULV97Wc2nZFupI94QGSxywBNM-ooEDSoCYWFBST51avsQ?e=vNuJUk', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'LKA (1)', 'Multipurpose Camera'),
('2024', 'Acura', 'INTEGRA', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2024', 'Acura', 'INTEGRA', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC', 'nan'),
('2024', 'Acura', 'MDX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EQ-Xx0gHOElJqUQtznz6PNABv7omw7tyg68wOsSPyTjZoQ?e=4oGvbu', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC (2)', 'Millimeter Wave Radar'),
('2024', 'Acura', 'MDX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Echn5p7BoShMtQ4bfccZ-9UBNJy4WkaGPgfhWzrGkBymJQ?e=PQQpon', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB (2)', 'Collision Mitigation Braking System (CMBS)'),
('2024', 'Acura', 'MDX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2024', 'Acura', 'MDX', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (1)', 'PMI', 'nan', 'nan', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Eby20gcp9PlBnOZtzTypi6oBSFtCupDfdG0xKZUvOSPjXA?e=LKTFZ7', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA (1)', 'Parking and Back-Up Sensor System'),
('2024', 'Acura', 'MDX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'nan', 'nan', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ESqtm9GbKiJIu7eDTkzOCMoBTWaRkDcfBSqSYehDRaqPVg?e=ye4K5g', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW/RCTW (1)', 'BSI Radar Unit Aiming'),
('2024', 'Acura', 'MDX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'nan', 'Pending Further Research', 'Pending Further Research', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EQ6fT750ZEtDh_Q1iBHs1XABbJu_S2SkxePaSXrf9ELiEg?e=xIwgR6', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BUC', 'Pending Further Research'),
('2024', 'Acura', 'MDX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Lane Keeping Assistance', 'LKA (1)', 'Static', 'nan', 'nan', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Ec7vc-ocyHNFheG6_2ka5DkBtiq0e23dk3doGVdHY20fjg?e=ezxU2o', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'LKA (1)', 'Multipurpose Camera'),
('2024', 'Acura', 'MDX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2024', 'Acura', 'MDX', 'Surround View Cameras', 'SVC %', 'Static Calibration - Surround View', 'nan', 'SVC ', 'Static', 'nan', 'nan', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EfzCmkx6qz9OvrdVMNF0mPwBT_3V1uyofS8Hb15ewcp7yQ?e=zQgmRt', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC (1)', 'Multi View Camera'),
('2024', 'Acura', 'RDX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Pending Further Research', 'Pending Further Research', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ETOrSZH3aN1Do2YAkSue1CoBCxlSsXIEfl1y-Y5VbYBdgQ?e=IEdUZx', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC (2)', 'Millimeter Wave Radar'),
('2024', 'Acura', 'RDX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'nan', 'nan', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EStPwtEaWQFIh5a9MXpCcmIBY6Tf8fE1rhWzKbdjLObZtw?e=plTRcv', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB (2)', 'Collision Mitigation Braking System (CMBS)'),
('2024', 'Acura', 'RDX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'nan', 'nan', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EaNW52aKOQJHoDcKhoh7RGgBzVuByWJfm7m_UUVUUqFybw?e=6Rdd8c', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'Adaptive Front Lighting System'),
('2024', 'Acura', 'RDX', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (1)', 'PMI', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ETA9UcdxbGdFgZGVEP17MRsBNUK3EwAvZ1jmhlEROlyHLg?e=hIYYur', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA (1)', 'Parking and Back-Up Sensor System'),
('2024', 'Acura', 'RDX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'nan', 'nan', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EXx94tvC-x1Ig_STgOyZmQEBX_mBKZcT5CKDuoRfjxLsDA?e=NflDWX', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW/RCTW (1)', 'BSI Radar Unit Aiming'),
('2024', 'Acura', 'RDX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'nan', 'Pending Further Research', 'Pending Further Research', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EeSwOSKShVlJmQWb3zs_wSYBg5IfsjDe64fYbLPwQETfSA?e=5R58fR', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BUC', 'Pending Further Research'),
('2024', 'Acura', 'RDX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Lane Keeping Assistance', 'LKA (1)', 'Static', 'nan', 'nan', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EeLTVTbA0VVHstWOe1_U4WYBbjjEUsGWcL9tHVmedkucrw?e=VrH08C', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'LKA (1)', 'Multipurpose Camera'),
('2024', 'Acura', 'RDX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2024', 'Acura', 'RDX', 'Surround View Cameras', 'SVC %', 'Static Calibration - Surround View', 'nan', 'SVC (1)', 'Static', 'nan', 'nan', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EftEBfIuZiVAp9a4NUN0jZgBAqOtDmJR_QSpDGs0_8PuPA?e=J4wj3N', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC (1)', 'Multi View Camera'),
('2024', 'Acura', 'TLX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Pending Further Research', 'Pending Further Research', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Ead_4H98c0xMlJXfqc6lMnEBFB4QgvPZjMxAARTYRwoE0g?e=3lWCiP', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC (2)', 'Millimeter Wave Radar'),
('2024', 'Acura', 'TLX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'nan', 'nan', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EeHK7hb5RWtMp3RGAV_hx2UBuF7qY686gWerJ4QUwUGxCA?e=Mm4dcE', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB (2)', 'Collision Mitigation Braking System (CMBS)'),
('2024', 'Acura', 'TLX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan'),
('2024', 'Acura', 'TLX', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (1)', 'PMI', 'nan', 'nan', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EfFP3a5LbQ9JsrqNSWg7M2cBGDC57_ZqaWhtCi4jVuDLDw?e=40ALOG', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA (1)', 'Parking and Back-Up Sensor System'),
('2024', 'Acura', 'TLX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'nan', 'nan', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EXGEYba4699IgBwK5R-GW2sBwvSgMUHcL8_34rCk5lWITw?e=hATdHU', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW/RCTW (1)', 'BSI Radar Unit Aiming'),
('2024', 'Acura', 'TLX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'nan', 'Pending Further Research', 'Pending Further Research', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EbY6DfxQVbpLvC9Vm3FqaTgBJ4hpvKOuF6cl-1q1Izq4Kw?e=VgVFLr', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BUC', 'Pending Further Research'),
('2024', 'Acura', 'TLX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Lane Keeping Assistance', 'LKA (1)', 'Static', 'nan', 'nan', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EW-sH6_TcrpKsrtz9VEe9WQB-HRVny6_Vu6bFqBKG0fC1g?e=K0Y5hK', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'LKA (1)', 'Multipurpose Camera'),
('2024', 'Acura', 'TLX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'nan'),
('2024', 'Acura', 'TLX', 'Surround View Cameras', 'SVC %', 'Static Calibration - Surround View', 'nan', 'SVC (1)', 'Static', 'nan', 'nan', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EeFsd3b1MvpEhc4ai7kXQLoBWZRbNTCZzkNck28rMeLPpA?e=N5Yggh', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC (1)', 'Multi View Camera'),
('2024', 'Acura', 'ZDX', 'Front Radar', 'ACC %', 'Dynamic Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Dynamic', 'Pending Further Research', 'Pending Further Research', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EWEByAeDqfVHiSI2cZPZcVYBbapDl8LxzY506JVdNTQPKw?e=nGaqxa', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC (%)', 'Pending Further Research'),
('2024', 'Acura', 'ZDX', 'Front Radar', 'AEB %', 'Dynamic Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Dynamic', 'Pending Further Research', 'Pending Further Research', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ESW0Rzy5f1BAtfJmh97n4-0B5hyProHiXItBkmrc3gI9qA?e=xUobqi', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB (2)', 'Pending Further Research'),
('2024', 'Acura', 'ZDX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'Pending Further Research', 'Pending Further Research', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'Pending Further Research'),
('2024', 'Acura', 'ZDX', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA', 'nan', 'Pending Further Research', 'Pending Further Research', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EUJV6kxH7GBClEfMaWIETtUBEdQRbNdDS6PW8fn5Fl8yHg?e=RFGkOe', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA (1)', 'Pending Further Research'),
('2024', 'Acura', 'ZDX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Pending Further Research', 'Pending Further Research', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EZFY6JQDLDhDvJ1vin6IaT0BrB4B8Mz22pkO_ElqjuFAvw?e=B2VQIc', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW/RCTW (1)', 'Pending Further Research'),
('2024', 'Acura', 'ZDX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'nan', 'Pending Further Research', 'Pending Further Research', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EU5FWjaift9Fm6dXqQ_n9IQB7qXWykV3f0FxQ0J2RSVb5A?e=wrvHcx', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BUC', 'Pending Further Research'),
('2024', 'Acura', 'ZDX', 'Windshield Camera', 'LKA %', 'Dynamic Calibration - Lane Keep Assist', 'Lane Keeping Assistance', 'LKA (1)', 'Dynamic', 'Pending Further Research', 'Pending Further Research', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EesnW6uvJ6xMhgUonmpE6OcBlXMy-ViZRud5nQ2rBD1maQ?e=Qgcyuw', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'LKA (1)', 'Pending Further Research'),
('2024', 'Acura', 'ZDX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'Pending Further Research', 'Pending Further Research', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'NV', 'Pending Further Research'),
('2024', 'Acura', 'ZDX', 'Surround View Cameras', 'SVC %', 'Dynamic Calibration - Surround View Camera', 'nan', 'SVC (1)', 'Dynamic', 'Pending Further Research', 'Pending Further Research', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EdQFNXAPmolAuopwtTeVGKQBJNPunWiL032EKCSWZcJsTw?e=mUZGd2', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'SVC (1)', 'Pending Further Research'),
('2025', 'Acura', 'Integra', 'Windshield Camera', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (3)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure enough fuel for an extended drive cycle [The vehicle may need to be driven for up to an hour].
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size].', 'Alignment Check
Cargo & Passenger areas empty
Min 1/4 Fuel Tank
Unmodified Ride Height', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'Integra', 'Windshield Camera', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (3)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure enough fuel for an extended drive cycle [The vehicle may need to be driven for up to an hour].
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size].', 'Alignment Check
Cargo & Passenger areas empty
Min 1/4 Fuel Tank
Unmodified Ride Height', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'Integra', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'nan', 'nan', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'Integra', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (1)', 'PMI', 'No Pre-Qualifications Required for this calibration Procedure', 'No Pre-Quals', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'Integra', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.  
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'Integra', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'Static', 'Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size].', 'Cargo & Passenger areas empty
Unmodified Ride Height', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'Integra', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Static Calibration – Lane Keep Assist', 'LKA (1)', 'Static', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure enough fuel for an extended drive cycle [The vehicle may need to be driven for up to an hour].
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'Integra', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'nan', 'nan', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'Integra', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'nan', 'nan', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'Integra Type S', 'Windshield Camera', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (3)', 'Static', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'Integra Type S', 'Windshield Camera', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (3)', 'Static', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'Integra Type S', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'Integra Type S', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (1)', 'PMI', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'Integra Type S', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'Integra Type S', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'nan', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'Integra Type S', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Lane Keeping Assistance', 'LKA (1)', 'Static', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'Integra Type S', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'Integra Type S', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC', 'nan', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'MDX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'MDX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'MDX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'MDX', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (1)', 'PMI', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'MDX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'MDX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'nan', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'MDX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Lane Keeping Assistance', 'LKA (1)', 'Static', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'MDX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'MDX', 'Surround View Cameras', 'SVC %', 'No Calibration Required', 'nan', 'SVC ', 'nan', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'RDX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'RDX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'RDX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'RDX', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (1)', 'PMI', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'RDX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'RDX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'nan', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'RDX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Lane Keeping Assistance', 'LKA (1)', 'Static', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'RDX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'RDX', 'Surround View Cameras', 'SVC %', 'Static Calibration - Surround View', 'nan', 'SVC (1)', 'Static', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'TLX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'TLX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'TLX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'TLX', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (1)', 'PMI', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'TLX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'TLX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'nan', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'TLX', 'Windshield Camera', 'LKA %', 'Static Calibration - Lane Keep Assist', 'Lane Keeping Assistance', 'LKA (1)', 'Static', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'TLX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'TLX', 'Surround View Cameras', 'SVC %', 'Static Calibration - Surround View', 'nan', 'SVC (1)', 'Static', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'ZDX', 'Front Radar', 'ACC %', 'Dynamic Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Dynamic', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'ZDX', 'Front Radar', 'AEB %', 'Dynamic Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Dynamic', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'ZDX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'ZDX', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA', 'nan', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'ZDX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'ZDX', 'Back Up Camera', 'BUC', 'No Calibration Required', 'nan', 'BUC', 'nan', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'ZDX', 'Windshield Camera', 'LKA %', 'Dynamic Calibration - Lane Keep Assist', 'Lane Keeping Assistance', 'LKA (1)', 'Dynamic', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'ZDX', 'Night Vision Camera', 'NV', 'No Calibration Required', 'nan', 'NV', 'nan', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research'),
('2025', 'Acura', 'ZDX', 'Surround View Cameras', 'SVC %', 'Dynamic Calibration - Surround View Camera', 'nan', 'SVC (1)', 'Dynamic', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'Pending Further Research', 'nan', 'Pending Further Research');
COMMIT;

