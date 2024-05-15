drop trigger if exists fill_station_name_trigger on trip;
drop function if exists fill_station_names;

CREATE OR REPLACE FUNCTION fill_station_names()
RETURNS TRIGGER AS $$
begin
    -- Look up the start station name
    SELECT station_name INTO NEW.start_station_name FROM station WHERE station_id = NEW.start_station_id;
    
    -- Look up the end station name
    SELECT station_name INTO NEW.end_station_name FROM station WHERE station_id = NEW.end_station_id;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER fill_station_name_trigger
BEFORE INSERT ON trip
FOR EACH ROW
EXECUTE FUNCTION fill_station_names();


INSERT INTO station (station_id, station_name, lat, long, dock_count, city, installation_date, zip_code)
SELECT
    s.i,
    'Station ' || s.i || ' ' || names_array[(s.i - 1) % array_length(names_array, 1) + 1], -- Cycle through names
    (random() * (39.553444 - 39.399872) + 39.399872)::real, -- Random latitude between 39.399872 and 39.553444
    (random() * (-7.839319 - -8.224454) + -8.224454)::real, -- Random longitude between -8.224454 and -7.839319
    floor(random() * 10)::smallint, -- Random dock count between 0 and 9
    'City ' || (s.i - 1) % array_length(names_array, 1) + 1,
    (current_date - floor(random() * 1000)::integer)::date, -- Random installation date within the last 1000 days
    '1000' || s.i -- Random zip code starting with 1000
FROM generate_series(1, 100) s(i)
CROSS JOIN LATERAL (SELECT ARRAY_AGG(names) AS names_array 
FROM unnest(ARRAY['Alpha', 'Beta', 'Gamma', 'Delta', 'Epsilon']) AS t(names)) AS a;


INSERT INTO trip (id, duration, start_time, start_station_id, 
    end_time, end_station_id, bike_id)
SELECT
    s.i,
    CASE
        WHEN random() < 0.45 THEN (floor(random() * 100)::integer) -- Random duration between 0 and 100 minutes
        ELSE NULL
    END,
    (current_timestamp - floor(random() * 10000)::integer * interval '1 minute')::timestamp, -- Random start time within the last 10000 minutes (approximately 7 days)
    floor(random() * 100 +1)::smallint, -- Random start station ID
    (current_timestamp - floor(random() * 10000)::integer * interval '1 minute' + floor(random() * 100)::integer * interval '1 minute'), -- Random end time within 100 minutes after start time
    floor(random() * 100 +1)::smallint, -- Random end station ID
    floor(random() * 1000)::smallint -- Random bike ID
FROM generate_series(1, 700000) s(i); 