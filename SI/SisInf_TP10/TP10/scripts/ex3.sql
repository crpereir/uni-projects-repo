/*
 *   ISEL-DEETC-SisInf
 *   MP 2024
 *
 *   Didactic material to support the course
 *   Information Systems
 *   
*/

/* Question 3: Joins
 * 
 * In this question you will learn more about the different methods used by Postgres
 * for executing joins.
 * Make sure you reset work_mem to its default value, as per ex2-8.
 * */

-- Answer the following questions according to the query above:
explain select t.*, s.city 
from trip t, station s 
where t.start_station_id = s.station_id and bike_id < 200; 

-- 1. Answer the following questions according to the query above:
--- a) Provide the query plan for the query above. 
--- a) Which join method was used - nested loop, merge or hash? hash
--- b) What was the estimated cost the query? (in arbitrary units) 1569.17..12678.51
--- c) What was the total runtime? (in ms) nao inclui

-- 2. Execute the command SET enable_hashjoin = false; to disable hash
-- joins. Provide the new query plan, and answer the following questions:
--- a) Which join method was used - nested loop, merge or hash? nested loop
--- b) What was the estimated cost the query? (in arbitrary units) 1565.07..15762.47
--- c) What was the total runtime? (in ms) nao inclui
set enable_hashjoin = false

-- 3. Execute the command SET enable_mergejoin = false; to disable merge
-- joins. Provide the new query plan, and answer the following questions:
--- a) Which join method was used - nested loop, merge or hash? nested loop
--- b) What was the estimated cost the query? (in arbitrary units) 1565.07..15762.47
--- c) What was the total runtime? (in ms) nao inclui
set enable_mergejoin = false


-- 4. Execute the command SET enable_indexscan = false; 
-- SET enable_bitmapscan = false; to disable index scans. Provide the 
-- new query plan, and answer the following questions:
--- a) Which join method was used - nested loop, merge or hash? nested loop
--- b) What was the total runtime? (in ms) 1565.08..16162.82
set enable_indexscan = false

-- 10. Execute these commands to re-enable the different joins (or your
-- answers for the next questions will turn out wrong):
reset enable_mergejoin;
reset enable_hashjoin;
reset enable_indexscan;
reset enable_bitmapscan;