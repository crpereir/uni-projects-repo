/*
 *   ISEL-DEETC-SisInf
 *   MP 2024
 *
 *   Didactic material to support the course
 *   Information Systems
 *   
  */


/* Question 1: EXPLAIN and ANALYZE

This question will guide you through the utilization of EXPLAIN and ANALYZE to grasp 
the influence of indexes on basic queries.

Answer the questions 1. - 5. based on the query below:
**/

select * from trip where bike_id = 10;

-- 1. Provide the execution plan of the query and the SQL statement you use to generate 
-- the result
explain analyze select * from trip where bike_id = 10;
/**
Gather  (cost=1000.00..13708.23 rows=694 width=64) (actual time=0.215..36.205 rows=665 loops=1)
  Workers Planned: 2
  Workers Launched: 2
  ->  Parallel Seq Scan on trip  (cost=0.00..12638.83 rows=289 width=64) (actual time=0.105..30.322 rows=222 loops=3)
        Filter: (bike_id = 10)
        Rows Removed by Filter: 233112
Planning Time: 0.056 ms
Execution Time: 36.259 ms
**/

-- 2. Based on the execution plan:
--- a) What was the estimated cost of the query? (in arbitrary units)
--- The estimated cost  of the query was 1000.00 to 13708.23
--- This is the cost for the entire operation, from start to finish

--- b) What was the total runtime? (in ms)
--- The total runtime was 36.259 ms
--- This is the actual time it took to execute the query

-- 3. Create an index on the attribute bike_id on the table trip. Provide the SQL statement
create index idx_bike_id on trip(bike_id);

-- 4. Provide the new execution plan of the query, with the index in place.
explain analyze select * from trip where bike_id = 10;

/**
Bitmap Heap Scan on trip  (cost=9.80..2147.07 rows=694 width=64) (actual time=0.334..0.974 rows=665 loops=1)
  Recheck Cond: (bike_id = 10)
  Heap Blocks: exact=640
  ->  Bitmap Index Scan on idx_bike_id  (cost=0.00..9.63 rows=694 width=0) (actual time=0.150..0.151 rows=665 loops=1)
        Index Cond: (bike_id = 10)
Planning Time: 0.204 ms
Execution Time: 10.674 ms
**/

-- 5. Based on new execution plan:
--- a) What was the estimated cost of the query? (in arbitrary units)
--- The estimated cost of the query was 9.80 to 2147.07

--- b) What was the total runtime? (in ms)
--- The total runtime was 10.674 ms

--- c) What was the estimated number of tuples to be output?
--- The estimated number of tuples to be output was 694

--- d) What was the actual number of tuples to be output?
--- The actual number of tuples to be output was 665


-- 6. Use the table pg_class to answer the following questions about table trip:
--- a) How many pages are used to store the index you created? Provide the answer and
--- the query you use to generate the answer.
select relpages from pg_class where relname = 'idx_bike_id';
--- The result is 614

--- b) How many tuples are in the index you created on column bike_id?
--- Provide the answer and the query you use to generate the answer.
select reltuples from pg_class where relname = 'idx_bike_id';
--- The result is 700,000



