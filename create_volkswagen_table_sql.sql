-- Create Volkswagen table in Supabase
CREATE TABLE IF NOT EXISTS "volkswagen" (
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

-- Create indexes for better query performance
CREATE INDEX IF NOT EXISTS idx_volkswagen_make_model ON "volkswagen" ("make", "model");
CREATE INDEX IF NOT EXISTS idx_volkswagen_year ON "volkswagen" ("year"); 