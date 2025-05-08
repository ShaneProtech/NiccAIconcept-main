-- Data migration for table chats from chats.db
-- Generated on 2025-05-02 18:04:06.088946
-- Contains 2 records

BEGIN;
INSERT INTO "chats" ("id", "user_id", "chat_id", "chat_name", "created_at", "updated_at") VALUES (83, 'anonymous', 'chat_1746130578_1404', '2021 Nissan altima Collision', '2025-05-01 15:16:18', '2025-05-01 15:25:25');
INSERT INTO "chats" ("id", "user_id", "chat_id", "chat_name", "created_at", "updated_at") VALUES (145, 'anonymous', 'chat_1746157992_5135', 'New Chat', '2025-05-01 22:53:12', '2025-05-02 00:31:13');
COMMIT;
