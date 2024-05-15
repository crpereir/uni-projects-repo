/*
 *   ISEL-DEETC-SisInf
 *   ND 2024
 *
 *   Didactic material to support the course
 *   Information Systems
 *   
 */
-- Common Tables Expressions (CTE). See https://www.postgresql.org/docs/16/queries-with.html
-- Question
-- a) create a CTE that produces the set of managers. 
-- Create a Query that uses that CTE and returns the number of persons that are not managers.


--Resolution:

with managers as (
    select manager from store
)

select count(*) from person
where id not in (select * from managers);