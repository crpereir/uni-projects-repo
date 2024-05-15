/*
 *   ISEL-DEETC-SisInf
 *   MP 2024
 *
 *   Didactic material to support the course
 *   Information Systems
 *   
  */


/* Question 2: Using indexes
 * 
 * In this question you will learn the conditions under which indexes may or not may 
 * not be used by the query optimizer
 * */

-- 1. Create an index on the column start_station_name on the table trip. Provide the 
-- SQL command you use.
create index idx_start_station_name on trip(start_station_name);

-- 2. For each of those queries, answer (yes) if the index you created on 
-- trip.start_station_name was used or (not) if it wasn't:
--- a) 
select * 
from trip 
where start_station_name like 'Gamma';

explain select * from trip where start_station_name like 'Gamma';
-- yes 


--- b) 
select * 
from trip 
where start_station_name like '%Gamma';

explain select * from trip where start_station_name like '%Gamma';
-- no


--- c) 
select * 
from trip 
where start_station_name != 'Station 4 Omega';

explain select * from trip where start_station_name != 'Station 4 Omega';
-- no


--- d) 
select * 
from trip 
where start_station_name > 'Gamma';

explain select * from trip where start_station_name > 'Gamma';
-- no


--- e) 
select * 
from trip 
where start_station_name between 'Station 4' and 'Station 44' and end_station_name > 'Delta';

explain select * from trip where start_station_name between 'Station 4' and 'Station 44' and end_station_name > 'Delta';
-- yes


--- f) 
select * 
from trip 
where start_station_name between 'Station 4' and 'Station 44' or end_station_name > 'Delta';

explain select * from trip where start_station_name between 'Station 4' and 'Station 44' or end_station_name > 'Delta';
-- no


-- 3. Make sure you still have an index on the column trip.bike_id. For 
-- each of those queries, answer (1) if only the index on start_station_name
-- was used, (2) if only the index on bike_id was used, (3) if both were
-- used, or (4) if neither one of the indexes were used:

--- a)
explain select * 
from trip t 
where start_station_name between 'Station 4' and 'Station 44' and bike_id < 10;
--- (3)

--- b)
explain select * 
from trip t 
where start_station_name between 'Station 4' and 'Station 44' and bike_id < 500;
--- (1) 

--- c)
explain select * 
from trip t 
where start_station_name between 'Station 4' and 'Station 44' and bike_id between 500 and 520;
--- (3)

--- d)
explain select * 
from trip t 
where start_station_name > 'Station 4' and bike_id < 500;
--- (2)

-- 4. For the query
explain select * 
from trip t 
where bike_id between 10 and 20;
-- answer the following questions?
--- a) Was the index on bike_id used? yes
--- b) What percentage of the total records in the table trip was returned? 
--- Provide the percent and retain two significant figures.
select (count(*) * 100.0 / (select count(*) from trip))::numeric(5,2) as percentage from trip t where bike_id between 10 and 20;


-- 5. For the query
explain select * 
from trip t 
where bike_id > 10;
-- answer the following questions?
--- a) Was the index on bike_id used? yes
--- b) What percentage of the total records in the table trip was returned? 
--- Provide the percent and retain two significant figures.
select (count(*) * 100.0 / (select count(*) from trip))::numeric(5,2) as percentage from trip t where bike_id > 10;

-- 6. For the query
explain select *
from trip t 
where bike_id > 10 order by start_time ;
-- answer the following questions?
--- a) Which method was used for sorting? sort
--- b) Where did the sorting happen - memory or disk? disk
--- c) How much space was used for sorting? 0
--- d) What was the total runtime? (in ms) 0

-- 7. Increase PostgreSQL working memory with the command SET work_mem = '128MB';. 
set work_mem = '128MB';
explain analyze select * from trip t where bike_id > 10 order by start_time;

-- For the same query as 6., answer the following questions:
--- a) Which method was used for sorting? quicksort
--- b) Where did the sorting happen - memory or disk? memory
--- c) How much space was used for sorting? 92451kB
--- d) What was the total runtime? (in ms) 603.379ms

-- 8. Execute the command RESET work_mem; to get Postgres working memory back to the
-- default value (or your answers for the next questions will turn out wrong).
reset work_mem;