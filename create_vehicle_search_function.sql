-- SQL function to search for vehicles by make, model and year
-- This will be executed on the Supabase database

-- Function to search within a specific make table
CREATE OR REPLACE FUNCTION get_vehicles_by_make(
    make_table_name text,
    model_filter text,
    year_filter text
) RETURNS JSONB AS $$
DECLARE
    query_text text;
    result JSONB;
BEGIN
    -- Build dynamic SQL safely
    query_text := 'SELECT * FROM ' || quote_ident(make_table_name);
    
    -- Add filters
    query_text := query_text || ' WHERE 1=1';
    
    -- Model filter (uppercase for case-insensitive search)
    IF model_filter IS NOT NULL AND model_filter != '' THEN
        query_text := query_text || ' AND UPPER(model) LIKE ''%' || UPPER(model_filter) || '%''';
    END IF;
    
    -- Year filter (exact match or with decimal)
    IF year_filter IS NOT NULL AND year_filter != '' THEN
        query_text := query_text || ' AND (year::text = ''' || year_filter || ''' OR year::text LIKE ''' || year_filter || '.%'')';
    END IF;
    
    -- Limit results
    query_text := query_text || ' LIMIT 50';
    
    -- Execute the query
    EXECUTE 'SELECT jsonb_agg(t) FROM (' || query_text || ') t' INTO result;
    
    -- Return empty array if no results
    IF result IS NULL THEN
        result := '[]'::jsonb;
    END IF;
    
    RETURN result;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Function to search across all vehicle tables
CREATE OR REPLACE FUNCTION search_all_vehicles(
    make_filter text,
    model_filter text,
    year_filter text
) RETURNS JSONB AS $$
DECLARE
    result JSONB;
    make_table_name text;
BEGIN
    -- First try the specific make table if provided
    IF make_filter IS NOT NULL AND make_filter != '' THEN
        make_table_name := LOWER(make_filter);
        
        -- Check if the make table exists
        PERFORM 1 FROM information_schema.tables 
        WHERE table_schema = 'public' AND table_name = make_table_name;
        
        IF FOUND THEN
            -- Search in the make-specific table
            result := get_vehicles_by_make(make_table_name, model_filter, year_filter);
            
            -- If we found results, return them
            IF jsonb_array_length(result) > 0 THEN
                RETURN result;
            END IF;
        END IF;
    END IF;
    
    -- If no results in make table or make table doesn't exist, try master_vehicles
    EXECUTE 'SELECT jsonb_agg(t) FROM (
        SELECT * FROM master_vehicles WHERE 1=1
        ' || CASE WHEN make_filter IS NOT NULL AND make_filter != '' 
              THEN ' AND UPPER(make) LIKE ''%' || UPPER(make_filter) || '%''' 
              ELSE '' END || '
        ' || CASE WHEN model_filter IS NOT NULL AND model_filter != '' 
              THEN ' AND UPPER(model) LIKE ''%' || UPPER(model_filter) || '%''' 
              ELSE '' END || '
        ' || CASE WHEN year_filter IS NOT NULL AND year_filter != '' 
              THEN ' AND (year::text = ''' || year_filter || ''' OR year::text LIKE ''' || year_filter || '.%'')' 
              ELSE '' END || '
        LIMIT 50
    ) t' INTO result;
    
    -- Return empty array if no results
    IF result IS NULL THEN
        result := '[]'::jsonb;
    END IF;
    
    RETURN result;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER; 