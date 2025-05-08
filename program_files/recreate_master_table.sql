-- Drop existing master_vehicles table if it exists
DROP TABLE IF EXISTS master_vehicles;

-- Create new master_vehicles table with all columns
CREATE TABLE master_vehicles (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    year TEXT,
    make TEXT,
    model TEXT,
    parent_component TEXT,
    protech_generic_system_name TEXT,
    parts_code_table_value TEXT,
    glass_only_pct_value TEXT,
    protech_generic_system_name1 TEXT,
    calibration_type TEXT,
    calibration_prerequisites TEXT,
    calibration_prerequisites_short_hand TEXT,
    service_information_hyperlink TEXT,
    autel_target__part_number TEXT,
    protech_target_part_number TEXT,
    alignment_statement TEXT,
    oe_glass_statement TEXT,
    oe_glass_service_info_hyperlink TEXT,
    additional_recommended_calibrations TEXT,
    protech_svc_user_guide TEXT,
    point_of_impact_ TEXT,
    og_protech_generic_system_name TEXT,
    oem_adas_system_name TEXT,
    chassis_code TEXT,
    unnamed_22 TEXT,
    source_file TEXT
);

-- Insert data from each make table into master_vehicles
INSERT INTO master_vehicles (
    year, make, model, parent_component, protech_generic_system_name,
    parts_code_table_value, glass_only_pct_value, protech_generic_system_name1,
    calibration_type, calibration_prerequisites, calibration_prerequisites_short_hand,
    service_information_hyperlink, autel_target__part_number, protech_target_part_number,
    alignment_statement, oe_glass_statement, oe_glass_service_info_hyperlink,
    additional_recommended_calibrations, protech_svc_user_guide, point_of_impact_,
    og_protech_generic_system_name, oem_adas_system_name, chassis_code, unnamed_22
)
SELECT 
    year, make, model, parent_component, protech_generic_system_name,
    parts_code_table_value, glass_only_pct_value, protech_generic_system_name1,
    calibration_type, calibration_prerequisites, calibration_prerequisites_short_hand,
    service_information_hyperlink, autel_target__part_number, protech_target_part_number,
    alignment_statement, oe_glass_statement, oe_glass_service_info_hyperlink,
    additional_recommended_calibrations, protech_svc_user_guide, point_of_impact_,
    og_protech_generic_system_name, oem_adas_system_name, chassis_code, unnamed_22
FROM acura
UNION ALL
SELECT * FROM alfa_romeo
UNION ALL
SELECT * FROM audi
UNION ALL
SELECT * FROM bmw
UNION ALL
SELECT * FROM brightdrop
UNION ALL
SELECT * FROM buick
UNION ALL
SELECT * FROM cadillac
UNION ALL
SELECT * FROM chevrolet
UNION ALL
SELECT * FROM chrysler
UNION ALL
SELECT * FROM dodge
UNION ALL
SELECT * FROM fiat
UNION ALL
SELECT * FROM ford
UNION ALL
SELECT * FROM genesis
UNION ALL
SELECT * FROM gmc
UNION ALL
SELECT * FROM honda
UNION ALL
SELECT * FROM hyundai
UNION ALL
SELECT * FROM infiniti
UNION ALL
SELECT * FROM jaguar
UNION ALL
SELECT * FROM jeep
UNION ALL
SELECT * FROM kia
UNION ALL
SELECT * FROM land_rover
UNION ALL
SELECT * FROM lexus
UNION ALL
SELECT * FROM lincoln
UNION ALL
SELECT * FROM mazda
UNION ALL
SELECT * FROM mercedes
UNION ALL
SELECT * FROM mini
UNION ALL
SELECT * FROM mitsubishi
UNION ALL
SELECT * FROM nissan
UNION ALL
SELECT * FROM porsche
UNION ALL
SELECT * FROM ram
UNION ALL
SELECT * FROM rolls_royce
UNION ALL
SELECT * FROM subaru
UNION ALL
SELECT * FROM toyota
UNION ALL
SELECT * FROM volvo;

-- Create indexes for better performance
CREATE INDEX idx_master_make ON master_vehicles(make);
CREATE INDEX idx_master_model ON master_vehicles(model);
CREATE INDEX idx_master_year ON master_vehicles(year); 