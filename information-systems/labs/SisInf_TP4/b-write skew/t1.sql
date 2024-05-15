/*
 *   ISEL-DEETC-SisInf
 *   ND 2022-2024
 *
 *   Didactic material to support the course
 *   Information Systems
 *   
 */
--Begin S1
start transaction; 
--set transaction isolation level repeatable read;
--set transaction isolation level serializable;
insert into t(val)
select 2 where exists (select * from (select count(*) cnt from t) as i 
where i.cnt< 3);
-- End S1

-- goto t2

--Begin S3
commit;
select * from t;
--End S3

 -- Questions:
-- a) Explain the behaviour observed. Make several test, using different combinations of isolations levels.
