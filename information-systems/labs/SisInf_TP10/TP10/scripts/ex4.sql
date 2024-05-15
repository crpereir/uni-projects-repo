/*
 *   ISEL-DEETC-SisInf
 *   MP 2024
 *
 *   Didactic material to support the course
 *   Information Systems
 *   
*/
/* 
 * Question 4: More complicated join with order by
 */

-- Answer the following questions based on the query below:
explain analyze select t1.bike_id, end_time, 
	( 	select sum(duration) 
		from trip as t2 
		where t2.bike_id = t1.bike_id and t2.end_time < t1.end_time ) as sd
from trip as t1
where t1.bike_id < 20
order by bike_id asc, sd asc;


-- 1. Destroy any indexes created on the previous questions. Provide
-- the SQL statement.

-- 2. Provide the query plan for the query above, and answer the following 
-- questions:

--- a) What was the estimated cost the query? (in arbitrary units)
/* Solution: 30800308.60 */

--- b) What was the total runtime? (in ms)
/* Solution: 5792.554 ms */

--- c) What sorting algorithm was used for ordering by bike_id?
/* Solution: quicksort */

--- d) Where did the sort happen (disk or memory)?
/* Solution: memory (Average Memory: 28kB Peak Memory: 28kB)*/

-- 3. An index on end_time or bike_id, which do you think will be more
-- helpful? Create an index on the one you choose and provide the SQL
-- statement you use.
/* 
Solution: If bike_id is frequently used in the where clause and has high 
cardinality, an index on bike_id might be more beneficial. If end_time is 
frequently used in the where clause and has high cardinality, an index on 
end_time might be more beneficial 
*/

-- 4. Provide the new query plan, after the index is created.
drop index idx_bike_id;
create index idx_bike_id on trip(bike_id);

-- 5. According to the new query plan and the old query plan, did the index
-- help reduce the estimated cost? If no, why? If yes, which part (of the
-- plan) was improved mostly by the new index?
/* 
Solution: it appears that the index on bike_id did not significantly 
reduce the estimated cost. The total cost in the new plan is 30800308.60, 
which is very close to the total cost in the old plan (30800308.60). 
*/
