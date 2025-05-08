-- Data import for systems_hardware table
-- Generated on 2025-05-02 18:23:17.622464
-- Contains 8 records

-- Batch 1 of 1
BEGIN;
INSERT INTO "systems_hardware" ("id", "system_type", "hardware_name", "hardware_description", "manufacturer", "part_number", "notes") VALUES
(1, 'Forward Camera', 'Windshield Camera', 'Front-facing camera for ADAS systems', 'Various', 'Multiple', 'Usually mounted behind rearview mirror'),
(2, 'Radar/Camera', 'Corner Radar', 'Short/mid-range radar for cross traffic and blind spot', 'Various', 'Multiple', 'Mounted in bumper corners'),
(3, 'Side Sensor', 'Side Radar', 'Side-mounted sensors for blind spot detection', 'Various', 'Multiple', 'Mounted in side panels'),
(4, 'Parking Sensor', 'Ultrasonic Sensor', 'Short-range parking aid sensor', 'Various', 'Multiple', 'Mounted in bumpers'),
(5, 'Forward Sensing', 'Front Radar', 'Long-range forward radar for ACC/FCW', 'Various', 'Multiple', 'Mounted in front grille/bumper'),
(6, 'Backup Sensor', 'Rear Ultrasonic', 'Rear parking aid sensor', 'Various', 'Multiple', 'Mounted in rear bumper'),
(7, 'Backup Camera', 'Rear Camera', 'Rear view camera for parking', 'Various', 'Multiple', 'Mounted near license plate or handle'),
(8, 'Control Module', 'ADAS Control Unit', 'Central processing unit for ADAS systems', 'Various', 'Multiple', 'Usually under dash or center console');
COMMIT;

