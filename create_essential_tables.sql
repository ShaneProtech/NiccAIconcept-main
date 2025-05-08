-- Essential tables for NICC AI with Supabase
-- This script creates only the most essential tables needed for the application to function

-- Create chats table
CREATE TABLE IF NOT EXISTS "chats" (
  "id" SERIAL PRIMARY KEY,
  "chat_id" TEXT NOT NULL UNIQUE,
  "user_id" TEXT NOT NULL,
  "chat_name" TEXT,
  "created_at" TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  "updated_at" TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  "is_pinned" BOOLEAN DEFAULT FALSE
);

-- Create index on user_id for faster queries
CREATE INDEX IF NOT EXISTS idx_chats_user_id ON "chats" ("user_id");

-- Create messages table
CREATE TABLE IF NOT EXISTS "messages" (
  "id" SERIAL PRIMARY KEY,
  "chat_id" TEXT NOT NULL,
  "role" TEXT NOT NULL,
  "content" TEXT NOT NULL,
  "timestamp" TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  CONSTRAINT fk_chat_id FOREIGN KEY ("chat_id") REFERENCES "chats" ("chat_id") ON DELETE CASCADE
);

-- Create index on chat_id for faster message retrieval
CREATE INDEX IF NOT EXISTS idx_messages_chat_id ON "messages" ("chat_id");

-- Create master_vehicles table (simplified version just for storing make/model)
CREATE TABLE IF NOT EXISTS "master_vehicles" (
  "id" SERIAL PRIMARY KEY,
  "make" TEXT,
  "model" TEXT
);

-- Create index on make/model combination
CREATE INDEX IF NOT EXISTS idx_master_vehicles_make_model ON "master_vehicles" ("make", "model");

-- Create a simple test entry
INSERT INTO "chats" ("chat_id", "user_id", "chat_name", "created_at", "updated_at")
VALUES ('test-chat-1', 'anonymous', 'Test Chat', NOW(), NOW());

INSERT INTO "messages" ("chat_id", "role", "content", "timestamp")
VALUES ('test-chat-1', 'user', 'This is a test message', NOW());

INSERT INTO "messages" ("chat_id", "role", "content", "timestamp")
VALUES ('test-chat-1', 'assistant', 'This is a response from the assistant', NOW());

-- Enable Row Level Security
ALTER TABLE "chats" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "messages" ENABLE ROW LEVEL SECURITY;

-- Create policies for authenticated and anonymous users
CREATE POLICY "Allow anonymous chat access" ON "chats"
  FOR ALL USING (user_id = 'anonymous');

CREATE POLICY "Allow anonymous message access" ON "messages"
  FOR ALL USING (chat_id IN (SELECT chat_id FROM chats WHERE user_id = 'anonymous'));

-- Optional: Add some test vehicle makes and models
INSERT INTO "master_vehicles" ("make", "model")
VALUES 
  ('Honda', 'ACCORD'),
  ('Honda', 'CIVIC'),
  ('Honda', 'CR-V'),
  ('Toyota', 'CAMRY'),
  ('Toyota', 'COROLLA'),
  ('Toyota', 'RAV4'),
  ('Nissan', 'ALTIMA'),
  ('Nissan', 'MAXIMA'),
  ('Nissan', 'ROGUE'); 