-- Full migration for NiccDB.db vehicle tables
-- Generated on 2025-05-02 18:19:00.639284

-- Table creation statements
BEGIN;

-- Table: poi_backup
CREATE TABLE IF NOT EXISTS "poi_backup" (
  "id" bigint PRIMARY KEY,
  "vehicle_id" bigint,
  "poi_type" text,
  "poi_location" text,
  "poi_description" text,
  "calibration_required" text
);

CREATE INDEX IF NOT EXISTS idx_poi_backup_id ON "poi_backup" ("id");
-- Table: acura
CREATE TABLE IF NOT EXISTS "acura" (
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

CREATE INDEX IF NOT EXISTS idx_acura_make_model ON "acura" ("make", "model");
CREATE INDEX IF NOT EXISTS idx_acura_year ON "acura" ("year");
-- Table: alfa_romeo
CREATE TABLE IF NOT EXISTS "alfa_romeo" (
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

CREATE INDEX IF NOT EXISTS idx_alfa_romeo_make_model ON "alfa_romeo" ("make", "model");
CREATE INDEX IF NOT EXISTS idx_alfa_romeo_year ON "alfa_romeo" ("year");
-- Table: audi
CREATE TABLE IF NOT EXISTS "audi" (
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

CREATE INDEX IF NOT EXISTS idx_audi_make_model ON "audi" ("make", "model");
CREATE INDEX IF NOT EXISTS idx_audi_year ON "audi" ("year");
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
-- Table: brightdrop
CREATE TABLE IF NOT EXISTS "brightdrop" (
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

CREATE INDEX IF NOT EXISTS idx_brightdrop_make_model ON "brightdrop" ("make", "model");
CREATE INDEX IF NOT EXISTS idx_brightdrop_year ON "brightdrop" ("year");
-- Table: buick
CREATE TABLE IF NOT EXISTS "buick" (
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

CREATE INDEX IF NOT EXISTS idx_buick_make_model ON "buick" ("make", "model");
CREATE INDEX IF NOT EXISTS idx_buick_year ON "buick" ("year");
-- Table: cadillac
CREATE TABLE IF NOT EXISTS "cadillac" (
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

CREATE INDEX IF NOT EXISTS idx_cadillac_make_model ON "cadillac" ("make", "model");
CREATE INDEX IF NOT EXISTS idx_cadillac_year ON "cadillac" ("year");
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
-- Table: chrysler
CREATE TABLE IF NOT EXISTS "chrysler" (
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

CREATE INDEX IF NOT EXISTS idx_chrysler_make_model ON "chrysler" ("make", "model");
CREATE INDEX IF NOT EXISTS idx_chrysler_year ON "chrysler" ("year");
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
-- Table: fiat
CREATE TABLE IF NOT EXISTS "fiat" (
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

CREATE INDEX IF NOT EXISTS idx_fiat_make_model ON "fiat" ("make", "model");
CREATE INDEX IF NOT EXISTS idx_fiat_year ON "fiat" ("year");
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
-- Table: genesis
CREATE TABLE IF NOT EXISTS "genesis" (
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

CREATE INDEX IF NOT EXISTS idx_genesis_make_model ON "genesis" ("make", "model");
CREATE INDEX IF NOT EXISTS idx_genesis_year ON "genesis" ("year");
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
-- Table: hyundai
CREATE TABLE IF NOT EXISTS "hyundai" (
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

CREATE INDEX IF NOT EXISTS idx_hyundai_make_model ON "hyundai" ("make", "model");
CREATE INDEX IF NOT EXISTS idx_hyundai_year ON "hyundai" ("year");
-- Table: infiniti
CREATE TABLE IF NOT EXISTS "infiniti" (
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

CREATE INDEX IF NOT EXISTS idx_infiniti_make_model ON "infiniti" ("make", "model");
CREATE INDEX IF NOT EXISTS idx_infiniti_year ON "infiniti" ("year");
-- Table: jaguar
CREATE TABLE IF NOT EXISTS "jaguar" (
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
  "chassis_code" text,
  "og_protech_generic_system_name" text,
  "oem_adas_system_name" text
);

CREATE INDEX IF NOT EXISTS idx_jaguar_make_model ON "jaguar" ("make", "model");
CREATE INDEX IF NOT EXISTS idx_jaguar_year ON "jaguar" ("year");
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
-- Table: kia
CREATE TABLE IF NOT EXISTS "kia" (
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

CREATE INDEX IF NOT EXISTS idx_kia_make_model ON "kia" ("make", "model");
CREATE INDEX IF NOT EXISTS idx_kia_year ON "kia" ("year");
-- Table: land_rover
CREATE TABLE IF NOT EXISTS "land_rover" (
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
  "chassis_code" text,
  "og_protech_generic_system_name" text,
  "oem_adas_system_name" text
);

CREATE INDEX IF NOT EXISTS idx_land_rover_make_model ON "land_rover" ("make", "model");
CREATE INDEX IF NOT EXISTS idx_land_rover_year ON "land_rover" ("year");
-- Table: lexus
CREATE TABLE IF NOT EXISTS "lexus" (
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

CREATE INDEX IF NOT EXISTS idx_lexus_make_model ON "lexus" ("make", "model");
CREATE INDEX IF NOT EXISTS idx_lexus_year ON "lexus" ("year");
-- Table: lincoln
CREATE TABLE IF NOT EXISTS "lincoln" (
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

CREATE INDEX IF NOT EXISTS idx_lincoln_make_model ON "lincoln" ("make", "model");
CREATE INDEX IF NOT EXISTS idx_lincoln_year ON "lincoln" ("year");
-- Table: mazda
CREATE TABLE IF NOT EXISTS "mazda" (
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

CREATE INDEX IF NOT EXISTS idx_mazda_make_model ON "mazda" ("make", "model");
CREATE INDEX IF NOT EXISTS idx_mazda_year ON "mazda" ("year");
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
-- Table: mini
CREATE TABLE IF NOT EXISTS "mini" (
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

CREATE INDEX IF NOT EXISTS idx_mini_make_model ON "mini" ("make", "model");
CREATE INDEX IF NOT EXISTS idx_mini_year ON "mini" ("year");
-- Table: mitsubishi
CREATE TABLE IF NOT EXISTS "mitsubishi" (
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

CREATE INDEX IF NOT EXISTS idx_mitsubishi_make_model ON "mitsubishi" ("make", "model");
CREATE INDEX IF NOT EXISTS idx_mitsubishi_year ON "mitsubishi" ("year");
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
-- Table: porsche
CREATE TABLE IF NOT EXISTS "porsche" (
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

CREATE INDEX IF NOT EXISTS idx_porsche_make_model ON "porsche" ("make", "model");
CREATE INDEX IF NOT EXISTS idx_porsche_year ON "porsche" ("year");
-- Table: ram
CREATE TABLE IF NOT EXISTS "ram" (
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

CREATE INDEX IF NOT EXISTS idx_ram_make_model ON "ram" ("make", "model");
CREATE INDEX IF NOT EXISTS idx_ram_year ON "ram" ("year");
-- Table: rolls_royce
CREATE TABLE IF NOT EXISTS "rolls_royce" (
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

CREATE INDEX IF NOT EXISTS idx_rolls_royce_make_model ON "rolls_royce" ("make", "model");
CREATE INDEX IF NOT EXISTS idx_rolls_royce_year ON "rolls_royce" ("year");
-- Table: subaru
CREATE TABLE IF NOT EXISTS "subaru" (
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

CREATE INDEX IF NOT EXISTS idx_subaru_make_model ON "subaru" ("make", "model");
CREATE INDEX IF NOT EXISTS idx_subaru_year ON "subaru" ("year");
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
-- Table: volvo
CREATE TABLE IF NOT EXISTS "volvo" (
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

CREATE INDEX IF NOT EXISTS idx_volvo_make_model ON "volvo" ("make", "model");
CREATE INDEX IF NOT EXISTS idx_volvo_year ON "volvo" ("year");
-- Table: poi
CREATE TABLE IF NOT EXISTS "poi" (
  "id" bigint PRIMARY KEY,
  "position_number" bigint NOT NULL,
  "position_name" text NOT NULL,
  "location_description" text NOT NULL,
  "system_type" text NOT NULL,
  "notes" text
);

CREATE INDEX IF NOT EXISTS idx_poi_id ON "poi" ("id");
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

CREATE INDEX IF NOT EXISTS idx_systems_hardware_id ON "systems_hardware" ("id");
COMMIT;

-- Sample data insertion statements
-- Note: These are only sample records. For full data import, use the individual SQL files.
BEGIN;

-- Sample data for table: acura
INSERT INTO "acura" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Acura', 'MDX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]
', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EaZwnPFWKJhFkBanxe_G-ysBKJbR5h2bu_M0qseJwEvHhg?e=jN9MbM', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '1,11,12', 'ACC (1)', 'Adaptive Cruise Control (ACC)');
INSERT INTO "acura" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Acura', 'MDX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ESDEzx_wrvpLnOv6ERXftr0BRiYFVtCZ39u9BN-X6c14Dw?e=Jjf9gu', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '1,11,12', 'AEB (1)', ' Collision Mitigation Braking System (CMBS)');
INSERT INTO "acura" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Acura', 'MDX', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan');
INSERT INTO "acura" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Acura', 'MDX', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA', 'nan');
INSERT INTO "acura" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Acura', 'MDX', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'Alignment: Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed. 
Cargo Area: Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Full Fuel Tank: Please ensure the Fuel tank is full.  
Ride Height: Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]
Rear Bumper R&I: Please be aware that the rear bumper will require removal and installation for calibration.', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EQPoYkCqSQdHoaJmY-U07e4B2Mr-SZ0V67R-Wp9pEvds6A?e=4sC5tx', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'Any vehicle that was involved in a collision must have a wheel alignment completed before aiming.', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Blind Spot Information');

-- Sample data for table: alfa_romeo
INSERT INTO "alfa_romeo" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2015', 'Alfa Romeo', '4C COUPE', 'Front Radar', 'ACC %', 'No Calibration Required', 'nan', 'ACC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC', 'nan');
INSERT INTO "alfa_romeo" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2015', 'Alfa Romeo', '4C COUPE', 'Front Radar', 'AEB %', 'No Calibration Required', 'nan', 'AEB', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB', 'nan');
INSERT INTO "alfa_romeo" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2015', 'Alfa Romeo', '4C COUPE', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan');
INSERT INTO "alfa_romeo" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2015', 'Alfa Romeo', '4C COUPE', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (2)', 'P&P ', 'No Pre-Qualifications Required for this Calibration Procedure.', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EYseqNYppk1BuwBicvqG_mgB9nJULQyYLyYeQcjSAAaS3g?e=UKEeSE', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA', 'Park Assist');
INSERT INTO "alfa_romeo" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2015', 'Alfa Romeo', '4C COUPE', 'Rear Radar', 'BSW %', 'No Calibration Required', 'nan', 'BSW', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW/RCTW', 'nan');

-- Sample data for table: audi
INSERT INTO "audi" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Audi', 'A3', 'Front Radar', 'ACC %', 'No Calibration Required ', 'nan', 'ACC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC', 'nan');
INSERT INTO "audi" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Audi', 'A3', 'Front Radar', 'AEB %', 'No Calibration Required ', 'nan', 'AEB', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB', 'nan');
INSERT INTO "audi" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Audi', 'A3', 'Adaptive Headlamps', 'AHL', 'No Calibration Required ', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan');
INSERT INTO "audi" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Audi', 'A3', 'Parking Aid Sonar', 'APA %', 'No Calibration Required ', 'nan', 'APA (1)', 'P&P', 'No Pre-Qualifications Required for this Calibration Procedure.', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EZFRLxjPSZBMkR3kG-zLd1cB-kNnaVngdmViT1w_jYSBpw?e=5wUIvI', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA', 'Parking Aid');
INSERT INTO "audi" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Audi', 'A3', 'Rear Bumper Radar', 'BSW %', 'No Calibration Required ', 'nan', 'BSW', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW/RCTW', 'nan');

-- Sample data for table: bmw
INSERT INTO "bmw" ("year", "make", "model", "oem_adas_system_name", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_") VALUES ('2012', 'BMW', '1 SERIES', 'Active Cruise Control', 'ACC %', 'Dynamic  Calibration – Adaptive Cruise Control', 'nan', 'ACC (2)', 'Dynamic', 'Ensure that the vehicle is evenly loaded.', 'nan', 'nan', 'nan', 'nan', 'Not Requried', 'Not Requried', 'nan', 'nan', 'nan', '1,11,12');
INSERT INTO "bmw" ("year", "make", "model", "oem_adas_system_name", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_") VALUES ('2012', 'BMW', '1 SERIES', 'Frontal Collision Warning', 'AEB %', 'Dynamic Calibration – Automatic Emergency Braking', 'nan', 'AEB (2)', 'Dynamic', 'Ensure that the vehicle is evenly loaded.', 'nan', 'nan', 'nan', 'nan', 'Not Requried', 'Not Requried', 'nan', 'nan', 'nan', '1,11,12');
INSERT INTO "bmw" ("year", "make", "model", "oem_adas_system_name", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_") VALUES ('2012', 'BMW', '1 SERIES', 'Adaptive Healights', 'AHL', 'No Calibration Required ', 'nan', 'AHL', 'PMI', 'No Pre-Qualifications Required for this Calibration Procedure.', 'nan', 'nan', 'nan', 'nan', 'Not Requried', 'Not Requried', 'nan', 'nan', 'nan', '1,11,12');
INSERT INTO "bmw" ("year", "make", "model", "oem_adas_system_name", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_") VALUES ('2012', 'BMW', '1 SERIES', 'Parking Manoeuvring Assistant', 'APA', 'No Calibration Required ', 'nan', 'APA', 'PMI', 'No Pre-Qualifications Required for this Calibration Procedure.', 'nan', 'nan', 'nan', 'nan', 'Not Requried', 'Not Requried', 'nan', 'nan', 'nan', '1,5,6,7,11,12');
INSERT INTO "bmw" ("year", "make", "model", "oem_adas_system_name", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_") VALUES ('2012', 'BMW', '1 SERIES', 'Rear Crossing Traffic Warning', 'BSW %', 'Dynamic Calibration – Blind Spot Warning', 'nan', 'BSW (1)', 'Dynamic', 'No Pre-Qualifications Required for this Calibration Procedure.', 'nan', 'nan', 'nan', 'nan', 'Not Requried', 'Not Requried', 'nan', 'nan', 'nan', '5,6,7');

-- Sample data for table: brightdrop
INSERT INTO "brightdrop" ("year", "make", "model", "oem_adas_system_name", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_") VALUES ('2022.0', 'Brightdrop', 'EV600', 'Adaptive Cruise Control', 'ACC %', 'On Board Calibration - Adaptive Cruise Control', 'nan', 'ACC (1)', 'PMI', 'No pre-qualifications required.', 'No pre-quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EQRlQOj5OUtDnysNkXkgyVwBrBmL_wy69SKqloDZ0cvlHQ?e=o8EvZe', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1, 11, 12');
INSERT INTO "brightdrop" ("year", "make", "model", "oem_adas_system_name", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_") VALUES ('2022.0', 'Brightdrop', 'EV600', 'Forward Collision Alert', 'AEB %', 'Dynamic Calibration - Automatic Emergency Braking', 'Dynamic Calibration - Automatic Emergency Braking', 'AEB (3)', 'Dynamic', 'No pre-qualifications required.', 'No pre-quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ERR4r7l-Yq9Ekzq7DUva1j8BKVNVFhzrVBRO9g9D86fAUw?e=4DfAPu', 'nan', 'nan', 'nan', 'The use of Aftermarket or non-Genuine parts and accessories in ADAS sensor areas including but not limited to the front bumper, front grill, below the front grill, license plate covers, headlamps, windshield, front and rear side panels, mirrors, rear camera lens, and rear bumper area is not recommended due to the potential for degradation of ADAS feature functionality.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EcITra8_imxCk2kqUV2GE8oBsf1BIuNDeVeyg44gMhlVPQ?e=nbWrJJ', 'nan', 'nan', '13');
INSERT INTO "brightdrop" ("year", "make", "model", "oem_adas_system_name", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_") VALUES ('2022.0', 'Brightdrop', 'EV600', 'nan', 'AHL', 'Pending', 'nan', 'AHL', 'nan', 'No pre-qualifications required.', 'No pre-quals', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan');
INSERT INTO "brightdrop" ("year", "make", "model", "oem_adas_system_name", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_") VALUES ('2022.0', 'Brightdrop', 'EV600', 'Parking Assist', 'APA', 'No Calibration Required', 'nan', 'APA', 'P&P', 'No pre-qualifications required.', 'No pre-quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EVIe9vkSBQFCsgJz41H9O-IBiZP7QTb0Thg6KptxX4baFg?e=jWuZaX', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1, 5, 6, 7, 11, 12');
INSERT INTO "brightdrop" ("year", "make", "model", "oem_adas_system_name", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_") VALUES ('2022.0', 'Brightdrop', 'EV600', 'Side Obstacle Detection', 'BSW %', 'On Board Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'PMI', 'No pre-qualifications required.', 'No pre-quals', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '5, 6, 7');

-- Sample data for table: buick
INSERT INTO "buick" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Buick', 'ENCLAVE', 'Front Radar', 'ACC %', 'No Calibration Required', 'nan', 'ACC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC', 'nan');
INSERT INTO "buick" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Buick', 'ENCLAVE', 'Front Radar', 'AEB %', 'No Calibration Required', 'nan', 'AEB', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB', 'nan');
INSERT INTO "buick" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Buick', 'ENCLAVE', 'Adaptive Headlamps', 'AHL', 'Static Calibration - Intelligent Headlamps', 'nan', 'AHL', 'Static', 'The vehicle should be normally loaded with a full tank of fuel.', 'Fuel Tank Full.', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ETfrygAk6CFHg5pZnn3D0FsB1LE7IVz24qCZ92_gQujetQ?e=68iIKf', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1, 11, 12', 'AHL', 'Adaptive Forward Lighting');
INSERT INTO "buick" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Buick', 'ENCLAVE', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA (%)', 'P&P', 'No Pre-Qualifications Required for this Calibration Procedure.', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ESgvrVa7trVBmoB2fbV14GcBWSOkDygrbmDnPFjYaSLEPA?e=1DE9vu', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1, 5, 6, 7, 11, 12', 'APA', 'Parking Assist');
INSERT INTO "buick" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Buick', 'ENCLAVE', 'Rear Bumper Radar', 'BSW %', 'No Calibration Required', 'nan', 'BSW', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW', 'nan');

-- Sample data for table: cadillac
INSERT INTO "cadillac" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Cadillac', 'CTS', 'Front Radar', 'ACC %', 'No Calibration Required', 'nan', 'ACC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC', 'nan');
INSERT INTO "cadillac" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Cadillac', 'CTS', 'Front Radar', 'AEB %', 'No Calibration Required', 'nan', 'AEB', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB', 'nan');
INSERT INTO "cadillac" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Cadillac', 'CTS', 'Adaptive Headlamps', 'AHL', 'Static Calibration - Intelligent Headlamps', 'nan', 'AHL', 'Static', 'The vehicle must have a full tank of gas. Do not load any cargo in the vehicle.', 'Full fuel tank. Cargo area empty.', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EcGhj3xnEMVMrlAV-a4yThkBHpm0OjF1StHxNlyEwFWaXA?e=lw40mr', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'Adaptive Forward Lighting');
INSERT INTO "cadillac" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Cadillac', 'CTS', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA (%)', 'P&P', 'No Pre-Qualifications Required for this Calibration Procedure.', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EYpGPviDuDRHl-qtxfe5vzgB1v00KSHL8B92K2eF5b0zLQ?e=npaM0k', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1, 5, 6, 7, 11, 12', 'APA', 'Parking Assist');
INSERT INTO "cadillac" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Cadillac', 'CTS', 'Rear Bumper Radar', 'BSW %', 'On-Board Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'PMI', 'Please ensure enough fuel for an extended drive cycle [The vehicle may need to be driven for up to an hour].', 'Min 1/4 Fuel Tank ', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EVZ5SMIiRPBJteUggbSWFJsBJiIkvUqQsBLvmwC72PGoog?e=jpQm9c', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '5, 6, 7', 'BSW/RCTW (1)', 'Side Blind Zone Alert');

-- Sample data for table: chevrolet
INSERT INTO "chevrolet" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name", "active_safety_control", "active_safety_control_systems", "unnamed_24") VALUES ('2012', 'Chevrolet', 'AVALANCHE', 'Front Radar', 'ACC %', 'No Calibration Required', 'nan', 'ACC', 'nan', 'No Pre-Qualifications Required for this Calibration Procedure.', 'No Pre-Quals', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC', 'nan', 'nan', 'nan', 'nan');
INSERT INTO "chevrolet" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name", "active_safety_control", "active_safety_control_systems", "unnamed_24") VALUES ('2012', 'Chevrolet', 'AVALANCHE', 'Front Radar', 'AEB %', 'No Calibration Required', 'nan', 'AEB', 'nan', 'No Pre-Qualifications Required for this Calibration Procedure.', 'No Pre-Quals', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB', 'nan', 'nan', 'nan', 'nan');
INSERT INTO "chevrolet" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name", "active_safety_control", "active_safety_control_systems", "unnamed_24") VALUES ('2012', 'Chevrolet', 'AVALANCHE', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Pre-Qualifications Required for this Calibration Procedure.', 'No Pre-Quals', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan', 'nan', 'nan', 'nan');
INSERT INTO "chevrolet" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name", "active_safety_control", "active_safety_control_systems", "unnamed_24") VALUES ('2012', 'Chevrolet', 'AVALANCHE', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA (2)', 'P&P', 'No Pre-Qualifications Required for this Calibration Procedure.', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EfbQWaSbGpNCm5vxJRk-AX8B3-hVFwWAv6d51tT4xsSqXQ?e=DqKgWb', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA', 'Parking Assist', 'nan', 'nan', 'nan');
INSERT INTO "chevrolet" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name", "active_safety_control", "active_safety_control_systems", "unnamed_24") VALUES ('2012', 'Chevrolet', 'AVALANCHE', 'Rear Bumper Radar', 'BSW %', 'No Calibration Required', 'nan', 'BSW (1)', 'P&P', 'No Pre-Qualifications Required for this Calibration Procedure.', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ET93HwV5N41DqOfiO_5RAt8B5UoagwpTz0mRyEBTFF7T7Q?e=335lrl', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '5,6,7', 'BSW/RCTW (1)', 'Side Blind Zone Alert', 'nan', 'nan', 'nan');

-- Sample data for table: chrysler
INSERT INTO "chrysler" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Chrysler', '200', 'Front Radar', 'ACC %', 'No Calibration Required', 'nan', 'ACC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC', 'nan');
INSERT INTO "chrysler" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Chrysler', '200', 'Front Radar', 'AEB %', 'No Calibration Required', 'nan', 'AEB', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB', 'nan');
INSERT INTO "chrysler" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Chrysler', '200', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan');
INSERT INTO "chrysler" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Chrysler', '200', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA', 'nan');
INSERT INTO "chrysler" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Chrysler', '200', 'Rear Bumper Radar', 'BSW %', 'No Calibration Required', 'nan', 'BSW', 'nan', 'No Information Found at this Time', 'No Info Found', '../../../../../../:b:/g/enterpriseprojects/VehicleServiceInformation/EUxAFnu9DedAq6OXH4rPW64B1kvOG6ADBq0SK3pfUUn-mg?e=wOqUEt', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW/RCTW', 'nan');

-- Sample data for table: dodge
INSERT INTO "dodge" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name", "unnamed_22") VALUES ('2012.0', 'Dodge', 'AVENGER', 'Front Radar', 'ACC %', 'No Calibration Required', 'nan', 'ACC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC', 'nan', 'nan');
INSERT INTO "dodge" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name", "unnamed_22") VALUES ('2012.0', 'Dodge', 'AVENGER', 'Front Radar', 'AEB %', 'No Calibration Required', 'nan', 'AEB', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB', 'nan', 'nan');
INSERT INTO "dodge" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name", "unnamed_22") VALUES ('2012.0', 'Dodge', 'AVENGER', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan', 'nan');
INSERT INTO "dodge" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name", "unnamed_22") VALUES ('2012.0', 'Dodge', 'AVENGER', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA', 'nan', 'nan');
INSERT INTO "dodge" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name", "unnamed_22") VALUES ('2012.0', 'Dodge', 'AVENGER', 'Rear Bumper Radar', 'BSW %', 'No Calibration Required', 'nan', 'BSW', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW/RCTW', 'nan', 'nan');

-- Sample data for table: fiat
INSERT INTO "fiat" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012.0', 'Fiat', '500', 'Front Radar', 'ACC %', 'No Calibration Required', 'nan', 'ACC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC', 'nan');
INSERT INTO "fiat" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012.0', 'Fiat', '500', 'Front Radar', 'AEB %', 'No Calibration Required', 'nan', 'AEB', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB', 'nan');
INSERT INTO "fiat" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012.0', 'Fiat', '500', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan');
INSERT INTO "fiat" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012.0', 'Fiat', '500', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA (2)', 'P&P ', 'No Pre-Qualifications Required for this Calibration Procedure.', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EfDicmV1hHNGg3gIy_rHNzMBkqH9NfFLo7nCPBvnKcEDuA?e=hUl0eH', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA', 'Park Assist');
INSERT INTO "fiat" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012.0', 'Fiat', '500', 'Rear Bumper Radar', 'BSW %', 'No Calibration Required', 'nan', 'BSW', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW/RCTW', 'nan');

-- Sample data for table: ford
INSERT INTO "ford" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012.0', 'Ford', 'E-150', 'Front Radar', 'ACC %', 'No Calibration Required', 'nan', 'ACC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC', 'nan');
INSERT INTO "ford" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012.0', 'Ford', 'E-150', 'Front Radar', 'AEB %', 'No Calibration Required', 'nan', 'AEB', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB', 'nan');
INSERT INTO "ford" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012.0', 'Ford', 'E-150', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan');
INSERT INTO "ford" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012.0', 'Ford', 'E-150', 'Parking Aid Sonar', 'APA %', 'Static Calibration - Active Parking Assist', 'nan', 'APA (%)', 'Static', 'No Pre-Qualifications Required for this Calibration Procedure.', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EbqdwwIJW6NKiS7uWrvuY2EBgkBGRxs0Hudl170UYXkqGQ?e=MxOGva', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA', 'Parking Aid');
INSERT INTO "ford" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012.0', 'Ford', 'E-150', 'Rear Bumper Radar', 'BSW %', 'No Calibration Required', 'nan', 'BSW', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW', 'nan');

-- Sample data for table: genesis
INSERT INTO "genesis" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2017', 'Genesis', 'G80', 'Front Radar', 'ACC %', 'Dynamic Calibration - Adaptive Cruise Control', 'nan', 'ACC (1)', 'Dynamic', 'Please ensure enough fuel for an extended drive cycle [The vehicle may need to be driven for up to an hour]. Please ensure that the vehicle is accurately aligned. If the vehicle is out of alignment, suspected of being out of alignment, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed.
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.', 'Min 1/4 Fuel Tank. Alignment Check. Empty Cargo Area.
Cargo & Passenger areas empty', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EUsxFXqE_nxDuBiqo0UQdjcBwwk-pRWGw7TNwEqrwV9glw?e=bJB60Z', 'nan', 'nan', 'Check the vehicle alignment and tire pressure levels to ensure calibration of the camera.', 'nan', 'nan', 'nan', 'nan', '1, 11, 12, 13', 'ACC (1)', 'Smart Cruise Control');
INSERT INTO "genesis" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2017', 'Genesis', 'G80', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static & Dynamic', 'Please ensure enough fuel for an extended drive cycle [The vehicle may need to be driven for up to an hour]. Please ensure that the vehicle is accurately aligned. If the vehicle is out of alignment, suspected of being out of alignment, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed.
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.', 'Min 1/4 Fuel Tank. Alignment Check. Empty Cargo Area.
Cargo & Passenger areas empty', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EXKpsPS733JBpvJJGLpyxFcBVn3IS30HFI95sR4kdPsoWA?e=wV4S2o', 'nan', 'nan', 'Check the vehicle alignment and tire pressure levels to ensure calibration of the camera.', 'nan', 'nan', 'nan', 'nan', '1, 11, 12, 13', 'AEB (2)', 'Forward Collision Avoidance');
INSERT INTO "genesis" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2017', 'Genesis', 'G80', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan');
INSERT INTO "genesis" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2017', 'Genesis', 'G80', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA (1)', 'P&P', 'No Pre-Qualifications Required for this Calibration Procedure.', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EWjZ0ygfaa9KpZfhvsh9hWwBrVJPR1J-qdlVA5u51k2mRA?e=6AXP44', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1, 5, 6, 7, 11, 12', 'APA', 'Parking Assist System');
INSERT INTO "genesis" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2017', 'Genesis', 'G80', 'Rear Bumper Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'Static', 'No Pre-Qualifications Required for this Calibration Procedure.', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EevgzEF8NXpEn_IpsEG7LHgBMrcjzFIax29zLyMBqeY7ew?e=4Ghg9b', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '5, 6, 7', 'BSW (1)', 'Blind Spot Detection');

-- Sample data for table: gmc
INSERT INTO "gmc" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'GMC', 'ACADIA', 'Front Radar', 'ACC %', 'No Calibration Required', 'nan', 'ACC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC', 'nan');
INSERT INTO "gmc" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'GMC', 'ACADIA', 'Front Radar', 'AEB %', 'No Calibration Required', 'nan', 'AEB', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB', 'nan');
INSERT INTO "gmc" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'GMC', 'ACADIA', 'Adaptive Headlamps', 'AHL', 'Static Calibration - Intelligent Headlamps', 'nan', 'AHL', 'Static', 'Vehicle must be normally loaded with a full fuel tank.', 'Full Fuel Tank. No Cargo.', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Ee6iipi-DlhPtZtMGUW-njMBpYnaMoc680k_PVrcycqpmQ?e=62nAON', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'Adaptive Forward Lighting');
INSERT INTO "gmc" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'GMC', 'ACADIA', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA (%)', 'P&P', 'No Pre-Qualifications Required for this Calibration Procedure.', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Eeq2pFG5xI1Fh3HWC7dysdIBHHRo9I5nmNlqN8fhBeuhoA?e=eP9qq6', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1, 5, 6, 7, 11, 12', 'APA', 'Parking Assist');
INSERT INTO "gmc" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'GMC', 'ACADIA', 'Rear Bumper Radar', 'BSW %', 'No Calibration Required', 'nan', 'BSW', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW', 'nan');

-- Sample data for table: honda
INSERT INTO "honda" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Honda', 'ACCORD', 'Front Radar', 'ACC %', 'No Calibration Required', 'nan', 'ACC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC', 'nan');
INSERT INTO "honda" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Honda', 'ACCORD', 'Front Radar', 'AEB %', 'No Calibration Required', 'nan', 'AEB', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB', 'nan');
INSERT INTO "honda" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Honda', 'ACCORD', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan');
INSERT INTO "honda" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Honda', 'ACCORD', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA', 'nan');
INSERT INTO "honda" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Honda', 'ACCORD', 'Rear Bumper Radar', 'BSW %', 'No Calibration Required', 'nan', 'BSW', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW', 'nan');

-- Sample data for table: hyundai
INSERT INTO "hyundai" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Hyundai', 'ACCENT', 'Front Radar', 'ACC %', 'No Calibration Required', 'nan', 'ACC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC', 'nan');
INSERT INTO "hyundai" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Hyundai', 'ACCENT', 'Front Radar', 'AEB %', 'No Calibration Required', 'nan', 'AEB', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB', 'nan');
INSERT INTO "hyundai" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Hyundai', 'ACCENT', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan');
INSERT INTO "hyundai" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Hyundai', 'ACCENT', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA', 'nan');
INSERT INTO "hyundai" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Hyundai', 'ACCENT', 'Rear Bumper Radar', 'BSW %', 'No Calibration Required', 'nan', 'BSW', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW', 'nan');

-- Sample data for table: infiniti
INSERT INTO "infiniti" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012.0', 'Infiniti', 'EX', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'Static', 'Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]
Please ensure the Motor Oil and Coolant Reserves are full.
Please be aware that the front bumper will require removal and installation for calibration.', 'Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Oil & Coolant Full
Front Bumper R&I', 'https://calibercollision.sharepoint.com/:f:/s/O365-Protech-InformationSolutions/Eqs6K2yyVeZJo-DHRysyZjsB8s5RWv9JCbRpbjoY7Wf84w?e=TWn5jG', 'CSC0602-01 / CSC0602-02', 'nan', 'nan', 'When collision repairs are necessary, INFINITI strongly recommends that any repairs be
performed by an experienced professional using the INFINITI body repair manual and genuine
OEM replacement parts designated for use on the specific INFINITI vehicle being repaired. This
includes: mechanical, electrical, body panels, safety, and structural components. Genuine OEM
replacement parts are developed to deliver the same fit, function, safety, and structural integrity
as when the vehicle was originally built. Parts of the vehicle are designed to work together as a
system, and we do not know whether or how integrating aftermarket parts into these systems
will impact crash performance. The safety of our customers continues to be our number one
priority.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EYeqFVDaxI9Jjsli2M0TZisB1c8-kQimLLjkP4IMQ_IUhQ?e=ZJQDqW', 'nan', 'nan', '1, 11, 12, 13', 'ACC (2)', 'Intelligent Cruise Control');
INSERT INTO "infiniti" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012.0', 'Infiniti', 'EX', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'Static', 'Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]
Please ensure the Motor Oil and Coolant Reserves are full.', 'Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Oil & Coolant Full', 'https://calibercollision.sharepoint.com/:f:/s/O365-Protech-InformationSolutions/EpJUASmoRRNBuJgUlEdYrQ8BfD4tmKBio8_6oPpRRU_MtQ?e=HHBgIO', 'CSC0602-01 / CSC0602-02', 'nan', 'nan', 'When collision repairs are necessary, INFINITI strongly recommends that any repairs be
performed by an experienced professional using the INFINITI body repair manual and genuine
OEM replacement parts designated for use on the specific INFINITI vehicle being repaired. This
includes: mechanical, electrical, body panels, safety, and structural components. Genuine OEM
replacement parts are developed to deliver the same fit, function, safety, and structural integrity
as when the vehicle was originally built. Parts of the vehicle are designed to work together as a
system, and we do not know whether or how integrating aftermarket parts into these systems
will impact crash performance. The safety of our customers continues to be our number one
priority.', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EYeqFVDaxI9Jjsli2M0TZisB1c8-kQimLLjkP4IMQ_IUhQ?e=ZJQDqW', 'nan', 'nan', '1, 11, 12, 13', 'AEB (2)', 'Forward Collision Warning ');
INSERT INTO "infiniti" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012.0', 'Infiniti', 'EX', 'Adaptive Headlamps', 'AHL', 'On-Board Calibration - Adaptive Headlamps', 'nan', 'AHL', 'P&I', 'No Pre-Qualifications Required for this Calibration Procedure.', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EUfX-jWeK-FGouponHHBtr0BOhk4bEE3oZZ-o7xW95MFPw?e=zod3a8', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,11,12', 'AHL', 'Adaptive Front Lighting System');
INSERT INTO "infiniti" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012.0', 'Infiniti', 'EX', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA (1)', 'P&P', 'No Pre-Qualifications Required for this Calibration Procedure.', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EST7wWKZALxOnJIachn3xZQBbILjwq3Lkqil9wh6HogXbw?e=9jszSM', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1, 5, 6, 7, 11, 12', 'APA', '  Parking Assist ');
INSERT INTO "infiniti" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012.0', 'Infiniti', 'EX', 'Rear Bumper Radar', 'BSW %', 'On-Board Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'P&I', 'Please ensure enough fuel for an extended drive cycle [The vehicle may need to be driven for up to an hour].', 'Min 1/4 Fuel Tank', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EeErjO0RtPFDpJlV_RHXIskBaKoRgSWhs-yuuBfAUz85Dw?e=f4Gbx3', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '5, 6, 7', 'BSW (1)', 'Blind Spot Warning');

-- Sample data for table: jaguar
INSERT INTO "jaguar" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "chassis_code", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Jaguar', 'XF', 'Front Radar', 'ACC %', 'Dynamic Calibration - Adaptive Cruise Control', 'nan', 'ACC (1)', 'Dynamic', 'Please ensure enough fuel for an extended drive cycle [The vehicle may need to be driven for up to an hour].', 'Min 1/4 Fuel Tank', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EW2bP8VVh1dHuiyugnP_5lkBX-77xDHBkSIhshplrDDdZQ?e=bghqIh', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,11,12', '(X250)', 'ACC (1)', 'Adaptive cruise control');
INSERT INTO "jaguar" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "chassis_code", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Jaguar', 'XF', 'Front Radar', 'AEB %', 'Dynamic Calibration - Automatic Emergency Braking', 'nan', 'AEB (1)', 'Dynamic', 'Please ensure enough fuel for an extended drive cycle [The vehicle may need to be driven for up to an hour].', 'Min 1/4 Fuel Tank', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EXYUT3Wj5jBFvjSogEQ07ooB7QSccu9YC929os91jQHwjQ?e=DBFVTl', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,11,12', '(X250)', 'AEB (1)', 'Forward Alert ');
INSERT INTO "jaguar" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "chassis_code", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Jaguar', 'XF', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '(X250)', 'AHL', 'nan');
INSERT INTO "jaguar" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "chassis_code", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Jaguar', 'XF', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA (1)', 'P&P', 'No Pre-Qualifications Required for this Calibration Procedure.', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EbNKhzn5PEBAu6v10mKcFZYBuHp1v3vvNhyQEl_oSbYqhA?e=iXzKpQ', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', '(X250)', 'APA', 'Parking Assist');
INSERT INTO "jaguar" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "chassis_code", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Jaguar', 'XF', 'Rear Bumper Radar', 'BSW %', 'No Calibration Required', 'nan', 'BSW', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '(X250)', 'BSW', 'nan');

-- Sample data for table: jeep
INSERT INTO "jeep" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Jeep', 'CHEROKEE', 'Front Radar', 'ACC %', 'No Calibration Required', 'nan', 'ACC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC', 'nan');
INSERT INTO "jeep" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Jeep', 'CHEROKEE', 'Front Radar', 'AEB %', 'No Calibration Required', 'nan', 'AEB', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB', 'nan');
INSERT INTO "jeep" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Jeep', 'CHEROKEE', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan');
INSERT INTO "jeep" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Jeep', 'CHEROKEE', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA', 'nan');
INSERT INTO "jeep" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Jeep', 'CHEROKEE', 'Rear Bumper Radar', 'BSW %', 'No Calibration Required', 'nan', 'BSW', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW', 'nan');

-- Sample data for table: kia
INSERT INTO "kia" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Kia', 'FORTE', 'Front Radar', 'ACC %', 'No Calibration Required', 'nan', 'ACC', 'nan', 'No Informaiton Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC', 'nan');
INSERT INTO "kia" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Kia', 'FORTE', 'Front Radar', 'AEB %', 'No Calibration Required', 'nan', 'AEB', 'nan', 'No Informaiton Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB', 'nan');
INSERT INTO "kia" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Kia', 'FORTE', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Informaiton Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan');
INSERT INTO "kia" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Kia', 'FORTE', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA', 'nan', 'No Informaiton Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA', 'nan');
INSERT INTO "kia" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Kia', 'FORTE', 'Rear Bumper Radar', 'BSW %', 'No Calibration Required', 'nan', 'BSW', 'nan', 'No Informaiton Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW', 'nan');

-- Sample data for table: land_rover
INSERT INTO "land_rover" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "chassis_code", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Land Rover', 'DEFENDER', 'Front Radar', 'ACC %', 'No Calibration Required', 'nan', 'ACC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'L316', 'ACC', 'nan');
INSERT INTO "land_rover" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "chassis_code", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Land Rover', 'DEFENDER', 'Front Radar', 'AEB %', 'No Calibration Required', 'nan', 'AEB', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'L316', 'AEB', 'nan');
INSERT INTO "land_rover" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "chassis_code", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Land Rover', 'DEFENDER', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'L316', 'AHL', 'nan');
INSERT INTO "land_rover" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "chassis_code", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Land Rover', 'DEFENDER', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'L316', 'APA', 'nan');
INSERT INTO "land_rover" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "chassis_code", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Land Rover', 'DEFENDER', 'Rear Bumper Radar', 'BSW %', 'No Calibration Required', 'nan', 'BSW', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'L316', 'BSW', 'nan');

-- Sample data for table: lexus
INSERT INTO "lexus" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Lexus', 'CT200h', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (1)', 'Static', 'No Pre-Qualifications Required for this Calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EefvmilWw1RArdb4wGVeK_UB7swR3fxZljd_gA8f28tFcA?e=Y9L3yG', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1, 11, 12', 'ACC (1)', 'Millimeter wave radar');
INSERT INTO "lexus" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Lexus', 'CT200h', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (1)', 'Static', 'No Pre-Qualifications Required for this Calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/Ee3nJVMwkZ5NpFWRQAZ_O7IBt0MKcx38_TD5mDIH34z5_Q?e=6KkXrk', 'CSC800 - CORNER REFLECTOR STAND
CSC802/01 - CORNER REFLECTOR', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1, 11, 12', 'AEB (1)', 'Pre Collision System ');
INSERT INTO "lexus" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Lexus', 'CT200h', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan');
INSERT INTO "lexus" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Lexus', 'CT200h', 'Parking Aid Sonar', 'APA %', 'On-Board Calibration - Advance Park Assist', 'nan', 'APA (1)', 'P&I', 'No Pre-Qualifications Required for this Calibration Procedure', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ESOL4TAAHp5Ojr26ozTWfM0BGsX-Lzf55GoX6dUYk9rQHQ?e=eCnHkR', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1, 5, 6, 7, 11, 12', 'APA', 'Intuitive Park Assist');
INSERT INTO "lexus" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Lexus', 'CT200h', 'Rear Radar', 'BSW %', 'No Calibration Required', 'nan', 'BSW', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW', 'nan');

-- Sample data for table: lincoln
INSERT INTO "lincoln" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012.0', 'Lincoln', 'MKS', 'Front Radar', 'ACC %', 'Dynamic Calibration - Adaptive Cruise Control', 'nan', 'ACC (1)', 'Dynamic', 'Please ensure enough fuel for an extended drive cycle [The vehicle may need to be driven for up to an hour].', 'Min 1/4 Fuel Tank', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EURY80O1CWtDgqPcaPSA5oABJ6qKrewtbxLHtoiQn7rpug?e=zZsAcL', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1, 11, 12', 'ACC (1)', 'Cruise Control Module');
INSERT INTO "lincoln" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012.0', 'Lincoln', 'MKS', 'Front Radar', 'AEB %', 'Dynamic Calibration - Automatic Emergency Braking', 'nan', 'AEB (1)', 'Dynamic', 'Please ensure enough fuel for an extended drive cycle [The vehicle may need to be driven for up to an hour].', 'Min 1/4 Fuel Tank', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EXWrrrrOeH5PgrddMELIhMIBqFyehRdwu-9LrccVrAE7EA?e=t5vUl4', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1, 11, 12', 'AEB (1)', 'Collision Warning and Collision Avoidance System');
INSERT INTO "lincoln" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012.0', 'Lincoln', 'MKS', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan');
INSERT INTO "lincoln" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012.0', 'Lincoln', 'MKS', 'Parking Aid Sonar', 'APA %', 'Static Calibration - Advance Park Assist', 'nan', 'APA (%)', 'Static', 'No Pre-Qualifications Required for this Calibration Procedure.', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EXSi63f_sDhFuKURafPhD60Bk6k0PnUpDyd0FfhT40vDJw?e=UcguOe', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1, 5, 6, 7, 11, 12', 'APA', 'Parking Aid');
INSERT INTO "lincoln" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012.0', 'Lincoln', 'MKS', 'Rear Bumper Radar', 'BSW %', 'On-Board Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'P&I', 'Please ensure enough fuel for an extended drive cycle [The vehicle may need to be driven for up to an hour]. Please be aware that the rear bumper will require removal and installation for calibration.', 'Min 1/4 Fuel Tank
Rear Bumper R&I', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EeyhEHiNRtFBidHeqQ745D4BlvD0uR6ow_BafLrbTZVhLg?e=F7EL5W', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '5, 6, 7', 'BSW (1)', 'Side Obstacle Detection');

-- Sample data for table: mazda
INSERT INTO "mazda" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Mazda', '2', 'Front Radar', 'ACC %', 'No Calibration Required', 'nan', 'ACC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC', 'nan');
INSERT INTO "mazda" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Mazda', '2', 'Front Radar', 'AEB %', 'No Calibration Required', 'nan', 'AEB', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB', 'nan');
INSERT INTO "mazda" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Mazda', '2', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan');
INSERT INTO "mazda" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Mazda', '2', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA', 'nan');
INSERT INTO "mazda" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Mazda', '2', 'Rear Bumper Radar', 'BSW %', 'No Calibration Required', 'nan', 'BSW', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW', 'nan');

-- Sample data for table: mercedes
INSERT INTO "mercedes" ("year", "make", "model", "oem_adas_system_name", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_") VALUES ('2012.0', 'Mercedes Benz', 'W246 B-Class', 'OEM Scan Tool Required For Information', 'ACC', 'Pending', 'OEM Scan Tool Required For Information', 'OEM Scan Tool Required For Information', 'OEM Scan Tool Required For Information', 'OEM Scan Tool Required For Information', 'nan', 'https://forms.office.com/r/RxPjNHLJaK', 'OEM Scan Tool Required For Information', 'nan', 'nan', 'OEM Scan Tool Required For Information', 'nan', '1,11,12', 'nan', 'nan');
INSERT INTO "mercedes" ("year", "make", "model", "oem_adas_system_name", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_") VALUES ('2012.0', 'Mercedes Benz', 'W246 B-Class', 'OEM Scan Tool Required For Information', 'AEB', 'Pending', 'OEM Scan Tool Required For Information', 'OEM Scan Tool Required For Information', 'OEM Scan Tool Required For Information', 'OEM Scan Tool Required For Information', 'nan', 'https://forms.office.com/r/RxPjNHLJaK', 'OEM Scan Tool Required For Information', 'nan', 'nan', 'OEM Scan Tool Required For Information', 'nan', '1,11,12', 'nan', 'nan');
INSERT INTO "mercedes" ("year", "make", "model", "oem_adas_system_name", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_") VALUES ('2012.0', 'Mercedes Benz', 'W246 B-Class', 'OEM Scan Tool Required For Information', 'AHL', 'Pending', 'OEM Scan Tool Required For Information', 'OEM Scan Tool Required For Information', 'OEM Scan Tool Required For Information', 'OEM Scan Tool Required For Information', 'nan', 'https://forms.office.com/r/RxPjNHLJaK', 'OEM Scan Tool Required For Information', 'nan', 'nan', 'OEM Scan Tool Required For Information', 'nan', '1,11,12', 'nan', 'nan');
INSERT INTO "mercedes" ("year", "make", "model", "oem_adas_system_name", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_") VALUES ('2012.0', 'Mercedes Benz', 'W246 B-Class', 'OEM Scan Tool Required For Information', 'APA', 'Pending', 'OEM Scan Tool Required For Information', 'OEM Scan Tool Required For Information', 'OEM Scan Tool Required For Information', 'OEM Scan Tool Required For Information', 'nan', 'https://forms.office.com/r/RxPjNHLJaK', 'OEM Scan Tool Required For Information', 'nan', 'nan', 'OEM Scan Tool Required For Information', 'nan', '1,5,6,7,11,12', 'nan', 'nan');
INSERT INTO "mercedes" ("year", "make", "model", "oem_adas_system_name", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_") VALUES ('2012.0', 'Mercedes Benz', 'W246 B-Class', 'OEM Scan Tool Required For Information', 'BSW/RCTW', 'Pending', 'OEM Scan Tool Required For Information', 'OEM Scan Tool Required For Information', 'OEM Scan Tool Required For Information', 'OEM Scan Tool Required For Information', 'nan', 'https://forms.office.com/r/RxPjNHLJaK', 'OEM Scan Tool Required For Information', 'nan', 'nan', 'OEM Scan Tool Required For Information', 'nan', '5,6,7', 'nan', 'nan');

-- Sample data for table: mini
INSERT INTO "mini" ("year", "make", "model", "oem_adas_system_name", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_") VALUES ('2012', 'MINI', 'CLUBMAN', 'nan', 'ACC', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan');
INSERT INTO "mini" ("year", "make", "model", "oem_adas_system_name", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_") VALUES ('2012', 'MINI', 'CLUBMAN', 'nan', 'AEB', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan');
INSERT INTO "mini" ("year", "make", "model", "oem_adas_system_name", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_") VALUES ('2012', 'MINI', 'CLUBMAN', 'nan', 'AHL', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan');
INSERT INTO "mini" ("year", "make", "model", "oem_adas_system_name", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_") VALUES ('2012', 'MINI', 'CLUBMAN', 'nan', 'APA', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan');
INSERT INTO "mini" ("year", "make", "model", "oem_adas_system_name", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_") VALUES ('2012', 'MINI', 'CLUBMAN', 'nan', 'BSW/RCTW', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan');

-- Sample data for table: mitsubishi
INSERT INTO "mitsubishi" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Mitsubishi', 'ECLIPSE', 'Front Radar', 'ACC %', 'No Calibration Required', 'nan', 'ACC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC', 'nan');
INSERT INTO "mitsubishi" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Mitsubishi', 'ECLIPSE', 'Front Radar', 'AEB %', 'No Calibration Required', 'nan', 'AEB', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB', 'nan');
INSERT INTO "mitsubishi" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Mitsubishi', 'ECLIPSE', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan');
INSERT INTO "mitsubishi" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Mitsubishi', 'ECLIPSE', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA', 'nan');
INSERT INTO "mitsubishi" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Mitsubishi', 'ECLIPSE', 'Rear Radar', 'BSW %', 'No Calibration Required', 'nan', 'BSW', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW', 'nan');

-- Sample data for table: nissan
INSERT INTO "nissan" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012.0', 'Nissan', '370Z', 'Front Radar', 'ACC %', 'No Calibration Required', 'nan', 'ACC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC', 'nan');
INSERT INTO "nissan" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012.0', 'Nissan', '370Z', 'Front Radar', 'AEB %', 'No Calibration Required', 'nan', 'AEB', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB', 'nan');
INSERT INTO "nissan" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012.0', 'Nissan', '370Z', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan');
INSERT INTO "nissan" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012.0', 'Nissan', '370Z', 'Parking Aid Sonar', 'APA % ', 'No Calibration Required', 'nan', 'APA', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA', 'nan');
INSERT INTO "nissan" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012.0', 'Nissan', '370Z', 'Rear Bumper Radar', 'BSW %', 'No Calibration Required', 'nan', 'BSW', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW', 'nan');

-- Sample data for table: porsche
INSERT INTO "porsche" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name", "unnamed_22") VALUES ('2012', 'Porsche', 'CAYENNE', 'Front Radar', 'ACC %', 'Static Calibration - Adaptive Cruise Control', 'nan', 'ACC (2)', 'STATIC', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed.
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]
Please Ensure the Washer Fluid Reservoir is Full.', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Washer Fluid Full', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EVjbAE-tiUFHvgInCh_4-rMBx3eWTxjqHk85iJhD65yXNA?e=letPfu', 'nan', 'nan', 'Vehicle Aligned correctly, having been bounced and allowed to settle multiple times', 'Use of only Genuine Porsche parts/fasteners/materials', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EdqirpotTaBBtPJBGj452qkB2C0r-u8Skj6XvmsryQIwIQ?e=rGy7Xa', 'nan', 'nan', '1, 11, 12, 13', 'ACC (2)', 'Distance Measuring Sensor', 'nan');
INSERT INTO "porsche" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name", "unnamed_22") VALUES ('2012', 'Porsche', 'CAYENNE', 'Front Radar', 'AEB %', 'Static Calibration - Automatic Emergency Braking', 'nan', 'AEB (2)', 'STATIC', 'Please ensure that the vehicle is accurately aligned, if the vehicle is out of alignment, suspected of being out of alignment, or was involved in a collision, please ensure a 4-Wheel Alignment is performed prior to the ADAS appointment and after your repairs are completed.
Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Fuel tank is full.
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]
Please Ensure the Washer Fluid Reservoir is Full.', 'Alignment Check
Cargo & Passenger areas empty
Full Fuel
Unmodified Ride Height
Washer Fluid Full', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ERtUwrAG_7BEqU1g-Z86K3IBnKF0y_yImPM4UfvcOCCmww?e=Fyjqvh', 'nan', 'nan', 'Vehicle Aligned correctly, having been bounced and allowed to settle multiple times', 'Use of only Genuine Porsche parts/fasteners/materials', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EdqirpotTaBBtPJBGj452qkB2C0r-u8Skj6XvmsryQIwIQ?e=rGy7Xa', 'nan', 'nan', '1, 11, 12, 13', 'AEB (2)', 'Distance Measuring Sensor', 'nan');
INSERT INTO "porsche" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name", "unnamed_22") VALUES ('2012', 'Porsche', 'CAYENNE', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan', 'nan');
INSERT INTO "porsche" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name", "unnamed_22") VALUES ('2012', 'Porsche', 'CAYENNE', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA (%)', 'P&P', 'No Pre-Qualifications Required for this Calibration Procedure.', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ESCc-PicNCNMnkkYqQ45aJQBaYL5Hxea4FTc4GYO60Klwg?e=mH0sed', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1, 5, 6, 7, 11, 12', 'APA', 'ParkAssist', 'nan');
INSERT INTO "porsche" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name", "unnamed_22") VALUES ('2012', 'Porsche', 'CAYENNE', 'Rear Radar', 'BSW %', 'Static Calibration - Blind Spot Warning', 'nan', 'BSW (1)', 'STATIC', 'Please ensure the Cargo and Passenger areas are unloaded of all non-factory weight.
Please ensure the Vehicle Ride Height is at OEM specification [unmodified suspension, wheel size, & tire size]', 'Alignment Check
Cargo & Passenger areas empty', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EaKoXTmsW95Prcx6aSoi_egBnK-ltL6anrQhmZ51Fk-4wQ?e=ScMNBq', 'nan', 'nan', 'Wheels must be positioned straight ahead.', 'nan', 'nan', 'nan', 'nan', '5, 6, 7', 'BSW (1)', 'Lane Change Assist', 'nan');

-- Sample data for table: ram
INSERT INTO "ram" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Ram', '1500', 'Front Radar', 'ACC %', 'No Calibration Required', 'nan', 'ACC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC', 'nan');
INSERT INTO "ram" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Ram', '1500', 'Front Radar', 'AEB %', 'No Calibration Required', 'nan', 'AEB', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB', 'nan');
INSERT INTO "ram" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Ram', '1500', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan');
INSERT INTO "ram" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Ram', '1500', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA (2)', 'P&P ', 'No Pre-Qualifications Required for this Calibration Procedure.', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/EUfjPdch1JFNkuZsmSgPDrwBeeGr-Hilgoz_ufxs0gI0nw?e=hjYYEe', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1, 5, 6, 7, 11, 12', 'APA', 'Park Assist');
INSERT INTO "ram" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Ram', '1500', 'Rear Radar', 'BSW %', 'No Calibration Required', 'nan', 'BSW', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW', 'nan');

-- Sample data for table: rolls_royce
INSERT INTO "rolls_royce" ("year", "make", "model", "oem_adas_system_name", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_") VALUES ('2012', 'Rolls Royce', 'PHANTOM', 'Active Cruise Control', 'SCC (1)', 'Dynamic Calibration – Adaptive Cruise Control', 'nan', 'nan', 'Dynamic', 'Ensure the the vehicle is evenly loaded.', 'nan', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EXZ4NsbELJxBhNnttguJqR8B0l03XbptrImmimRMMUIeAQ?e=25g66m', 'nan', 'nan', 'Not Required', 'Not Required', 'nan', 'nan', 'nan', '1,11,12');
INSERT INTO "rolls_royce" ("year", "make", "model", "oem_adas_system_name", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_") VALUES ('2012', 'Rolls Royce', 'PHANTOM', 'Frontal Collision Warning', 'AEB (2)', 'Dynamic Calibration – Automatic Emergency Braking', 'nan', 'nan', 'Dynamic', 'Ensure the the vehicle is evenly loaded.', 'nan', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EfM3vJrEfpFOk8U9F5KNvVEB3xw793yhJWCxVGOSt9jeZg?e=p0MTAo', 'nan', 'nan', 'Not Required', 'Not Required', 'nan', 'nan', 'nan', '1,11,12');
INSERT INTO "rolls_royce" ("year", "make", "model", "oem_adas_system_name", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_") VALUES ('2012', 'Rolls Royce', 'PHANTOM', 'Adaptive Headlight', 'AHL', 'No Calibration Required ', 'nan', 'nan', 'PMI', 'No Pre-Qualifications Required for this Calibration Procedure', 'nan', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EbjdPdzDqJ9AkgWllmTsZFoBdk9t9J9Bok6aHGptSYWP-Q?e=T5dZdA', 'nan', 'nan', 'Not Required', 'Not Required', 'nan', 'nan', 'nan', '1,11,12');
INSERT INTO "rolls_royce" ("year", "make", "model", "oem_adas_system_name", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_") VALUES ('2012', 'Rolls Royce', 'PHANTOM', 'Parking Manoeuvring Assistant', 'APA', 'No Calibration Required ', 'nan', 'nan', 'PMI', 'No Pre-Qualifications Required for this Calibration Procedure', 'nan', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EQPwLH1bTjFFppSsmDX2Ye4Bij7FH-1keW9RrP_LoRk4dw?e=LOu8Qf', 'nan', 'nan', 'Not Required', 'Not Required', 'nan', 'nan', 'nan', '1,5,6,7,11,12');
INSERT INTO "rolls_royce" ("year", "make", "model", "oem_adas_system_name", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_") VALUES ('2012', 'Rolls Royce', 'PHANTOM', 'Rear Crossing Traffic Warning ', 'BSW/RCTW (1)', 'Dynamic Calibration – Blind Spot Warning', 'nan', 'nan', 'Dynamic', 'No Pre-Qualifications Required for this Calibration Procedure', 'nan', 'https://calibercollision.sharepoint.com/:b:/g/enterpriseprojects/VehicleServiceInformation/EY97ufPpcAZMsb7xaKTWqEoBfPlFKcqbQn2BDg5mletMwQ?e=PFdTdE', 'nan', 'nan', 'Not Required', 'Not Required', 'nan', 'nan', 'nan', '5,6,7');

-- Sample data for table: subaru
INSERT INTO "subaru" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Subaru', 'FORESTER', 'Windshield Camera', 'ACC %', 'No Calibration Required', 'nan', 'ACC', 'nan', 'No Information Found at this Tme', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC', 'nan');
INSERT INTO "subaru" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Subaru', 'FORESTER', 'Windshield Camera', 'AEB %', 'No Calibration Required', 'nan', 'AEB', 'nan', 'No Information Found at this Tme', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB', 'nan');
INSERT INTO "subaru" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Subaru', 'FORESTER', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Tme', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan');
INSERT INTO "subaru" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Subaru', 'FORESTER', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA', 'nan', 'No Information Found at this Tme', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'APA', 'nan');
INSERT INTO "subaru" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name") VALUES ('2012', 'Subaru', 'FORESTER', 'Rear Radar', 'BSW %', 'No Calibration Required', 'nan', 'BSW', 'nan', 'No Information Found at this Tme', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW', 'nan');

-- Sample data for table: toyota
INSERT INTO "toyota" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name", "unnamed_22") VALUES ('2012.0', 'Toyota', '4RUNNER', 'Front Radar', 'ACC %', 'No Calibration Required', 'nan', 'ACC', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'ACC', 'nan', 'FR ');
INSERT INTO "toyota" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name", "unnamed_22") VALUES ('2012.0', 'Toyota', '4RUNNER', 'Front Radar', 'AEB %', 'No Calibration Required', 'nan', 'AEB', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AEB', 'nan', 'FR ');
INSERT INTO "toyota" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name", "unnamed_22") VALUES ('2012.0', 'Toyota', '4RUNNER', 'Adaptive Headlamps', 'AHL', 'No Calibration Required', 'nan', 'AHL', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'AHL', 'nan', 'AHL');
INSERT INTO "toyota" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name", "unnamed_22") VALUES ('2012.0', 'Toyota', '4RUNNER', 'Parking Aid Sonar', 'APA %', 'No Calibration Required', 'nan', 'APA ', 'P&P', 'No Pre-Qualifications Required for this Calibration Procedure.', 'No Pre-Quals', 'https://calibercollision.sharepoint.com/:b:/s/O365-Protech-InformationSolutions/ET-loA9EOMBBteNJ-V1QIT0BTZMprzSMmzi329Tevc3uMw?e=D9cAtr', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', '1,5,6,7,11,12', 'APA', 'INTUITIVE PARK ASSIST ', 'APA');
INSERT INTO "toyota" ("year", "make", "model", "parent_component", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_", "og_protech_generic_system_name", "oem_adas_system_name", "unnamed_22") VALUES ('2012.0', 'Toyota', '4RUNNER', 'Rear Radar', 'BSW %', 'No Calibration Required', 'nan', 'BSW', 'nan', 'No Information Found at this Time', 'No Info Found', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'nan', 'BSW', 'nan', 'RR');

-- Sample data for table: volvo
INSERT INTO "volvo" ("year", "make", "model", "oem_adas_system_name", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_") VALUES ('2012.0', 'Volvo', 'C30', 'OEM Scan Tool Required For Information', 'ACC', 'Pending', 'OEM Scan Tool Required For Information', 'OEM Scan Tool Required For Information', 'OEM Scan Tool Required For Information', 'OEM Scan Tool Required For Information', 'OEM Scan Tool Required For Information', 'https://forms.office.com/r/RxPjNHLJaK', 'OEM Scan Tool Required For Information', 'nan', 'nan', 'OEM Scan Tool Required For Information', 'nan', '1,11,12', 'nan', 'nan');
INSERT INTO "volvo" ("year", "make", "model", "oem_adas_system_name", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_") VALUES ('2012.0', 'Volvo', 'C30', 'OEM Scan Tool Required For Information', 'AEB', 'Pending', 'OEM Scan Tool Required For Information', 'OEM Scan Tool Required For Information', 'OEM Scan Tool Required For Information', 'OEM Scan Tool Required For Information', 'OEM Scan Tool Required For Information', 'https://forms.office.com/r/RxPjNHLJaK', 'OEM Scan Tool Required For Information', 'nan', 'nan', 'OEM Scan Tool Required For Information', 'nan', '1,11,12', 'nan', 'nan');
INSERT INTO "volvo" ("year", "make", "model", "oem_adas_system_name", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_") VALUES ('2012.0', 'Volvo', 'C30', 'OEM Scan Tool Required For Information', 'AHL', 'Pending', 'OEM Scan Tool Required For Information', 'OEM Scan Tool Required For Information', 'OEM Scan Tool Required For Information', 'OEM Scan Tool Required For Information', 'OEM Scan Tool Required For Information', 'https://forms.office.com/r/RxPjNHLJaK', 'OEM Scan Tool Required For Information', 'nan', 'nan', 'OEM Scan Tool Required For Information', 'nan', '1,11,12', 'nan', 'nan');
INSERT INTO "volvo" ("year", "make", "model", "oem_adas_system_name", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_") VALUES ('2012.0', 'Volvo', 'C30', 'OEM Scan Tool Required For Information', 'APA', 'Pending', 'OEM Scan Tool Required For Information', 'OEM Scan Tool Required For Information', 'OEM Scan Tool Required For Information', 'OEM Scan Tool Required For Information', 'OEM Scan Tool Required For Information', 'https://forms.office.com/r/RxPjNHLJaK', 'OEM Scan Tool Required For Information', 'nan', 'nan', 'OEM Scan Tool Required For Information', 'nan', '1,5,6,7,11,12', 'nan', 'nan');
INSERT INTO "volvo" ("year", "make", "model", "oem_adas_system_name", "protech_generic_system_name", "parts_code_table_value", "glass_only_pct_value", "protech_generic_system_name1", "calibration_type", "calibration_prerequisites", "calibration_prerequisites_short_hand", "service_information_hyperlink", "autel_target__part_number", "protech_target_part_number", "alignment_statement", "oe_glass_statement", "oe_glass_service_info_hyperlink", "additional_recommended_calibrations", "protech_svc_user_guide", "point_of_impact_") VALUES ('2012.0', 'Volvo', 'C30', 'OEM Scan Tool Required For Information', 'BSW/RCTW', 'Pending', 'OEM Scan Tool Required For Information', 'OEM Scan Tool Required For Information', 'OEM Scan Tool Required For Information', 'OEM Scan Tool Required For Information', 'OEM Scan Tool Required For Information', 'https://forms.office.com/r/RxPjNHLJaK', 'OEM Scan Tool Required For Information', 'nan', 'nan', 'OEM Scan Tool Required For Information', 'nan', '5,6,7', 'nan', 'nan');

-- Sample data for table: poi
INSERT INTO "poi" ("id", "position_number", "position_name", "location_description", "system_type", "notes") VALUES (1, 1, 'Front Left Corner', 'Located at front left corner of vehicle', 'Radar/Camera', NULL);
INSERT INTO "poi" ("id", "position_number", "position_name", "location_description", "system_type", "notes") VALUES (2, 2, 'Front Left Side', 'Located on left front door/fender area', 'Side Sensor', NULL);
INSERT INTO "poi" ("id", "position_number", "position_name", "location_description", "system_type", "notes") VALUES (3, 3, 'Rear Left Side', 'Located on left rear door/quarter panel', 'Side Sensor', NULL);
INSERT INTO "poi" ("id", "position_number", "position_name", "location_description", "system_type", "notes") VALUES (4, 4, 'Rear Left Corner', 'Located at rear left corner', 'Parking Sensor', NULL);
INSERT INTO "poi" ("id", "position_number", "position_name", "location_description", "system_type", "notes") VALUES (5, 5, 'Front Center', 'Located in front grille/bumper center', 'Forward Sensing', NULL);

-- Sample data for table: systems_hardware
INSERT INTO "systems_hardware" ("id", "system_type", "hardware_name", "hardware_description", "manufacturer", "part_number", "notes") VALUES (1, 'Forward Camera', 'Windshield Camera', 'Front-facing camera for ADAS systems', 'Various', 'Multiple', 'Usually mounted behind rearview mirror');
INSERT INTO "systems_hardware" ("id", "system_type", "hardware_name", "hardware_description", "manufacturer", "part_number", "notes") VALUES (2, 'Radar/Camera', 'Corner Radar', 'Short/mid-range radar for cross traffic and blind spot', 'Various', 'Multiple', 'Mounted in bumper corners');
INSERT INTO "systems_hardware" ("id", "system_type", "hardware_name", "hardware_description", "manufacturer", "part_number", "notes") VALUES (3, 'Side Sensor', 'Side Radar', 'Side-mounted sensors for blind spot detection', 'Various', 'Multiple', 'Mounted in side panels');
INSERT INTO "systems_hardware" ("id", "system_type", "hardware_name", "hardware_description", "manufacturer", "part_number", "notes") VALUES (4, 'Parking Sensor', 'Ultrasonic Sensor', 'Short-range parking aid sensor', 'Various', 'Multiple', 'Mounted in bumpers');
INSERT INTO "systems_hardware" ("id", "system_type", "hardware_name", "hardware_description", "manufacturer", "part_number", "notes") VALUES (5, 'Forward Sensing', 'Front Radar', 'Long-range forward radar for ACC/FCW', 'Various', 'Multiple', 'Mounted in front grille/bumper');

COMMIT;

-- INSTRUCTIONS FOR FULL DATA IMPORT
-- To import all data for a specific table, use the corresponding data SQL file.
-- For example, to import all honda data:
-- Run the SQL commands in the file: 'migration_sql/NiccDB_honda_data.sql'

-- NOTE: For large tables, you may need to split the data import into batches
-- to avoid timeouts or memory issues in the SQL Editor.
