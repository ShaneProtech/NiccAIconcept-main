-- Schema migration for NiccDB.db
-- Generated on 2025-05-02 18:04:05.656473

-- Table: master_vehicles
CREATE TABLE IF NOT EXISTS "master_vehicles" (
  "id" bigint PRIMARY KEY,
  "active_safety_control" text,
  "active_safety_control_systems" text,
  "additional_recommended_calibrations" text,
  "alignment_statement" text,
  "autel_target__part_number" text,
  "calibration_prerequisites" text,
  "calibration_prerequisites_short_hand" text,
  "calibration_type" text,
  "chassis_code" text,
  "glass_only_pct_value" text,
  "make" text,
  "model" text,
  "oe_glass_service_info_hyperlink" text,
  "oe_glass_statement" text,
  "oem_adas_system_name" text,
  "og_protech_generic_system_name" text,
  "parent_component" text,
  "parts_code_table_value" text,
  "point_of_impact_" text,
  "protech_generic_system_name" text,
  "protech_generic_system_name1" text,
  "protech_svc_user_guide" text,
  "protech_target_part_number" text,
  "service_information_hyperlink" text,
  "unnamed_22" text,
  "unnamed_24" text,
  "year" text,
  "source_file" text
);

-- Table: honda
CREATE TABLE IF NOT EXISTS "honda" (
  "year" text,
  "make" text,
  "model" text,
  "parent_component" text,
  "protech_generic_system_name" text,
  "parts_code_table_value" text,
  "glass_only_pct_value" text,
  "protech_generic_system_name1" text,
  "calibration_type" text,
  "calibration_prerequisites" text,
  "calibration_prerequisites_short_hand" text,
  "service_information_hyperlink" text,
  "autel_target__part_number" text,
  "protech_target_part_number" text,
  "alignment_statement" text,
  "oe_glass_statement" text,
  "oe_glass_service_info_hyperlink" text,
  "additional_recommended_calibrations" text,
  "protech_svc_user_guide" text,
  "point_of_impact_" text,
  "og_protech_generic_system_name" text,
  "oem_adas_system_name" text
);

-- Table: nissan
CREATE TABLE IF NOT EXISTS "nissan" (
  "year" text,
  "make" text,
  "model" text,
  "parent_component" text,
  "protech_generic_system_name" text,
  "parts_code_table_value" text,
  "glass_only_pct_value" text,
  "protech_generic_system_name1" text,
  "calibration_type" text,
  "calibration_prerequisites" text,
  "calibration_prerequisites_short_hand" text,
  "service_information_hyperlink" text,
  "autel_target__part_number" text,
  "protech_target_part_number" text,
  "alignment_statement" text,
  "oe_glass_statement" text,
  "oe_glass_service_info_hyperlink" text,
  "additional_recommended_calibrations" text,
  "protech_svc_user_guide" text,
  "point_of_impact_" text,
  "og_protech_generic_system_name" text,
  "oem_adas_system_name" text
);

-- Table: toyota
CREATE TABLE IF NOT EXISTS "toyota" (
  "year" text,
  "make" text,
  "model" text,
  "parent_component" text,
  "protech_generic_system_name" text,
  "parts_code_table_value" text,
  "glass_only_pct_value" text,
  "protech_generic_system_name1" text,
  "calibration_type" text,
  "calibration_prerequisites" text,
  "calibration_prerequisites_short_hand" text,
  "service_information_hyperlink" text,
  "autel_target__part_number" text,
  "protech_target_part_number" text,
  "alignment_statement" text,
  "oe_glass_statement" text,
  "oe_glass_service_info_hyperlink" text,
  "additional_recommended_calibrations" text,
  "protech_svc_user_guide" text,
  "point_of_impact_" text,
  "og_protech_generic_system_name" text,
  "oem_adas_system_name" text,
  "unnamed_22" text
);

-- Table: poi
CREATE TABLE IF NOT EXISTS "poi" (
  "id" bigint PRIMARY KEY,
  "position_number" bigint NOT NULL,
  "position_name" text NOT NULL,
  "location_description" text NOT NULL,
  "system_type" text NOT NULL,
  "notes" text
);

-- Table: systems_hardware
CREATE TABLE IF NOT EXISTS "systems_hardware" (
  "id" bigint PRIMARY KEY,
  "system_type" text NOT NULL,
  "hardware_name" text NOT NULL,
  "hardware_description" text,
  "manufacturer" text,
  "part_number" text,
  "notes" text
);

