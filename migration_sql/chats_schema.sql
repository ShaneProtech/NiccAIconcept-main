-- Schema migration for chats.db
-- Generated on 2025-05-02 18:04:06.085946

-- Table: chats
CREATE TABLE IF NOT EXISTS "chats" (
  "id" bigint PRIMARY KEY,
  "user_id" text,
  "chat_id" text,
  "chat_name" text,
  "created_at" text DEFAULT CURRENT_TIMESTAMP,
  "updated_at" text DEFAULT CURRENT_TIMESTAMP
);

-- Table: messages
CREATE TABLE IF NOT EXISTS "messages" (
  "id" bigint PRIMARY KEY,
  "chat_id" text,
  "role" text,
  "content" text,
  "timestamp" text DEFAULT CURRENT_TIMESTAMP
);

