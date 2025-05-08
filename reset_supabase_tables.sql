-- SQL to reset all data in Supabase tables
-- Generated on 2025-05-03 18:47:47
-- WARNING: This will delete ALL data from these tables!

BEGIN;

-- First delete from tables with foreign key dependencies
DELETE FROM "messages";

-- Then delete from parent tables
DELETE FROM "chats";
DELETE FROM "master_vehicles";
DELETE FROM "volkswagen";
DELETE FROM "acura";
DELETE FROM "alfa_romeo";
DELETE FROM "audi";
DELETE FROM "bmw";
DELETE FROM "brightdrop";
DELETE FROM "buick";
DELETE FROM "cadillac";
DELETE FROM "chevrolet";
DELETE FROM "chrysler";
DELETE FROM "dodge";
DELETE FROM "fiat";
DELETE FROM "ford";
DELETE FROM "genesis";
DELETE FROM "gmc";
DELETE FROM "honda";
DELETE FROM "hyundai";
DELETE FROM "infiniti";
DELETE FROM "jaguar";
DELETE FROM "jeep";
DELETE FROM "kia";
DELETE FROM "land_rover";
DELETE FROM "lexus";
DELETE FROM "lincoln";
DELETE FROM "mazda";
DELETE FROM "mercedes";
DELETE FROM "mini";
DELETE FROM "mitsubishi";
DELETE FROM "nissan";
DELETE FROM "porsche";
DELETE FROM "ram";
DELETE FROM "rolls_royce";
DELETE FROM "subaru";
DELETE FROM "toyota";
DELETE FROM "volvo";
DELETE FROM "poi";
DELETE FROM "systems_hardware";

COMMIT;