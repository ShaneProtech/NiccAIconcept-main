-- Simplified migration for most common vehicle makes
-- Generated on 2025-05-02 18:19:00.658484

-- Table creation statements
BEGIN;

-- Table: bmw
CREATE TABLE IF NOT EXISTS "bmw" (
  "year" text,
  "make" text,
  "model" text,
  "oem_adas_system_name" text,
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
  "point_of_impact_" text
);

CREATE INDEX IF NOT EXISTS idx_bmw_make_model ON "bmw" ("make", "model");
CREATE INDEX IF NOT EXISTS idx_bmw_year ON "bmw" ("year");
-- Table: chevrolet
CREATE TABLE IF NOT EXISTS "chevrolet" (
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
  "active_safety_control" text,
  "active_safety_control_systems" text,
  "unnamed_24" text
);

CREATE INDEX IF NOT EXISTS idx_chevrolet_make_model ON "chevrolet" ("make", "model");
CREATE INDEX IF NOT EXISTS idx_chevrolet_year ON "chevrolet" ("year");
-- Table: dodge
CREATE TABLE IF NOT EXISTS "dodge" (
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

CREATE INDEX IF NOT EXISTS idx_dodge_make_model ON "dodge" ("make", "model");
CREATE INDEX IF NOT EXISTS idx_dodge_year ON "dodge" ("year");
-- Table: ford
CREATE TABLE IF NOT EXISTS "ford" (
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

CREATE INDEX IF NOT EXISTS idx_ford_make_model ON "ford" ("make", "model");
CREATE INDEX IF NOT EXISTS idx_ford_year ON "ford" ("year");
-- Table: gmc
CREATE TABLE IF NOT EXISTS "gmc" (
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

CREATE INDEX IF NOT EXISTS idx_gmc_make_model ON "gmc" ("make", "model");
CREATE INDEX IF NOT EXISTS idx_gmc_year ON "gmc" ("year");
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

CREATE INDEX IF NOT EXISTS idx_honda_make_model ON "honda" ("make", "model");
CREATE INDEX IF NOT EXISTS idx_honda_year ON "honda" ("year");
-- Table: jeep
CREATE TABLE IF NOT EXISTS "jeep" (
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

CREATE INDEX IF NOT EXISTS idx_jeep_make_model ON "jeep" ("make", "model");
CREATE INDEX IF NOT EXISTS idx_jeep_year ON "jeep" ("year");
-- Table: mercedes
CREATE TABLE IF NOT EXISTS "mercedes" (
  "year" text,
  "make" text,
  "model" text,
  "oem_adas_system_name" text,
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
  "point_of_impact_" text
);

CREATE INDEX IF NOT EXISTS idx_mercedes_make_model ON "mercedes" ("make", "model");
CREATE INDEX IF NOT EXISTS idx_mercedes_year ON "mercedes" ("year");
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

CREATE INDEX IF NOT EXISTS idx_nissan_make_model ON "nissan" ("make", "model");
CREATE INDEX IF NOT EXISTS idx_nissan_year ON "nissan" ("year");
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

CREATE INDEX IF NOT EXISTS idx_toyota_make_model ON "toyota" ("make", "model");
CREATE INDEX IF NOT EXISTS idx_toyota_year ON "toyota" ("year");
COMMIT;

-- INSTRUCTIONS FOR DATA IMPORT
-- To import data for these tables, use the corresponding data SQL files.
-- For example, to import all honda data:
-- Run the SQL commands in the file: 'migration_sql/NiccDB_honda_data.sql'
