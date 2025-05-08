# NICC AI Supabase Integration

This document provides instructions for setting up and using Supabase as the database backend for NICC AI.

## What is Supabase?

Supabase is an open-source Firebase alternative providing a PostgreSQL database with a RESTful API, authentication, and real-time subscriptions. This allows NICC AI to use a cloud-based database instead of local SQLite files.

## Prerequisites

1. A Supabase account (sign up at [https://supabase.io](https://supabase.io))
2. Python 3.6+ with pip
3. Required Python packages:
   - supabase
   - psycopg2-binary
   - dotenv

## Installation

1. Install the required Python dependencies:

```bash
pip install supabase psycopg2-binary python-dotenv
```

2. Create a new project in Supabase from the dashboard.

3. Get your Supabase credentials:
   - Supabase URL: Found in Project Settings > API > Project URL
   - Supabase API Key: Found in Project Settings > API > Project API Keys (use the "anon" key)

4. Create a `.env` file in your project root directory with the following variables:

```
GOOGLE_API_KEY=your_google_api_key_here
SUPABASE_URL=https://your-project-id.supabase.co
SUPABASE_KEY=your_supabase_api_key_here
```

## Database Migration

To migrate your existing data from SQLite to Supabase:

1. Ensure your Supabase credentials are set in your `.env` file.

2. Run the migration script:

```bash
python db_migration.py
```

This script will:
- Connect to your local SQLite databases
- Extract the schema and data
- Create corresponding tables in Supabase
- Migrate all data to Supabase

## Table Schema

The migration will create the following tables in Supabase:

### Vehicle Data Tables

- `master_vehicles`: Main table containing vehicle information
- Make-specific tables (e.g., `honda`, `toyota`, etc.)

### Chat Tables

- `chats`: Information about chat sessions
  - `id`: Auto-incrementing primary key
  - `user_id`: User identifier
  - `chat_id`: Unique chat identifier
  - `chat_name`: Name of the chat
  - `created_at`: Timestamp when chat was created
  - `updated_at`: Timestamp when chat was last updated

- `messages`: Chat messages
  - `id`: Auto-incrementing primary key
  - `chat_id`: Foreign key linking to chats table
  - `role`: Message role (user/assistant)
  - `content`: Message content
  - `timestamp`: Message timestamp

## How It Works

The application uses a hybrid approach:
1. If Supabase credentials are properly configured, it will use Supabase for all database operations.
2. If Supabase is not configured or there's an error connecting, it automatically falls back to the local SQLite databases.

This ensures your application continues to work even if there are issues with the Supabase connection.

## Troubleshooting

1. **Connection Issues**:
   - Make sure your Supabase URL and API key are correct
   - Check your network connection
   - Verify that your Supabase project is active

2. **Migration Errors**:
   - Check the error messages for specific details
   - Verify that your SQLite databases exist and are not corrupted
   - Make sure your Supabase account has sufficient permissions

3. **Table Creation Issues**:
   - If tables are not being created automatically, use the SQL statements printed by the migration script to manually create them in the Supabase SQL editor.

## Advanced Configuration

### SQL Editor

You can use the Supabase SQL Editor to directly query and modify your database:
1. Go to your Supabase project dashboard
2. Click on "SQL Editor" in the sidebar
3. Create a new query and write your SQL commands

### RLS Policies

Supabase uses Row Level Security (RLS) policies to control access to your data:
1. By default, tables are restricted to authenticated users
2. Enable RLS for each table and create appropriate policies if you implement authentication
3. For public access tables, create an RLS policy that allows anonymous access

### PostgreSQL Extensions

Supabase provides several PostgreSQL extensions that can enhance your application:
- `pg_trgm`: For similarity searches (useful for fuzzy matching vehicle data)
- `pg_vector`: For vector embeddings (useful for AI features)
- `pgjwt`: For token validation 