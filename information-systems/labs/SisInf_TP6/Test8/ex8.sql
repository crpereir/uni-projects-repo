/*
 *   ISEL-DEETC-SisInf
 *   ND 2022-2024
 *
 *   Didactic material to support the course
 *   Information Systems
 *   
  */

--S0
drop table if exists "Class";
drop table if exists TimeTable;
create table TimeTable
(
	id serial primary key not null,
	"hour" int not null,
	"minute" int not null,
	"description" char(5), -- later we will see a way to produce something like default "hour"||":"||"minute",
	unique("hour","minute")
);

create table  "Class"
(
	id serial primary key not null,
	"name" varchar(10),
	weekday int check (weekday between 1 and 7),
	"start" int not null references TimeTable
);
-- Populate timeTable
do
$$
declare x int;
declare y int;
begin
   FOR x IN  8..19 BY 1 LOOP 
	    FOR y IN  0..59 BY 30 LOOP
	   		insert into TimeTable("hour","minute","description") values(x,y, to_char(x,'FM00')||':'||to_char(y,'FM00'));
   		END LOOP;
	   
   END LOOP;
end $$ language plpgsql;
--populate Class
do
$$
declare x int;
declare y int;
declare z int;
begin
   FOR x IN  1..6 BY 1 LOOP 
	   y := floor(random() * (select count(*) from TimeTable) + 1)::int; 
	   FOR z IN  1..y BY 1 LOOP
	   	insert into "Class"("name",weekday,"start") values(concat('class-',z::varchar),x,z);
	   END LOOP;
   END LOOP;
end $$ language plpgsql;

-- Questions:
-- a) Create a function that given a day passed as parameter (integer) returna a table with the available timetables. 
-- Assum the classes all have the same duration 30m.

create or replace function  get_available_timetables(day_num int)
returns table ("hour" INT, "minute" INT, "description" CHAR(5)) as $$
begin
    return QUERY 
    select "hour", "minute", "description"
    from TimeTable
    where "hour" || "minute" not in (
        select distinct "hour" || "minute"
        from "Class"
        where weekday = day_num
    );
end;
$$ language plpgsql;

-- b) Generate an exception when the parameter is out of bounds
create or replace function validate_day_num(day_num int)
returns void as $$
begin
    if day_num < 1 or day_num > 7 then
        raise exception 'Day number out of bounds';
    end if;
end;
$$ language plpgsql;


-- To use the functions:
-- Call validate_day_num function before get_available_timetables to ensure the day_num is within bounds
-- Then call get_available_timetables function to get the available timetables for the specified day


-- Example usage:
DO $$
DECLARE
    day_number INT := 3; -- Assuming it's Wednesday (valid day number)
    available_time RECORD;
BEGIN
    -- Validate the day number
    PERFORM validate_day_num(day_number);

    -- If the day number is valid, get the available timetables
    FOR available_time IN 
        SELECT * FROM get_available_timetables(day_number)
    LOOP
        -- Do something with the available time (e.g., print)
        RAISE NOTICE 'Available time: %:%', available_time."hour", available_time."minute";
    END LOOP;
END;
$$;










