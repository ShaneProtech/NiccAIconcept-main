-- Data import for poi table
-- Generated on 2025-05-02 18:23:17.620464
-- Contains 13 records

-- Batch 1 of 1
BEGIN;
INSERT INTO "poi" ("id", "position_number", "position_name", "location_description", "system_type", "notes") VALUES
(1, 1, 'Front Left Corner', 'Located at front left corner of vehicle', 'Radar/Camera', NULL),
(2, 2, 'Front Left Side', 'Located on left front door/fender area', 'Side Sensor', NULL),
(3, 3, 'Rear Left Side', 'Located on left rear door/quarter panel', 'Side Sensor', NULL),
(4, 4, 'Rear Left Corner', 'Located at rear left corner', 'Parking Sensor', NULL),
(5, 5, 'Front Center', 'Located in front grille/bumper center', 'Forward Sensing', NULL),
(6, 6, 'Front Right Corner', 'Located at front right corner', 'Radar/Camera', NULL),
(7, 7, 'Front Right Side', 'Located on right front door/fender area', 'Side Sensor', NULL),
(8, 8, 'Rear Right Side', 'Located on right rear door/quarter panel', 'Side Sensor', NULL),
(9, 9, 'Rear Right Corner', 'Located at rear right corner', 'Parking Sensor', NULL),
(10, 10, 'Windshield', 'Located on windshield, typically behind rearview mirror', 'Forward Camera', NULL),
(11, 11, 'Rear Center', 'Located in rear bumper center', 'Backup Sensor', NULL),
(12, 12, 'Trunk/Liftgate', 'Located on trunk or liftgate', 'Backup Camera', NULL),
(13, 13, 'Center Console', 'Located in vehicle interior center console', 'Control Module', NULL);
COMMIT;

