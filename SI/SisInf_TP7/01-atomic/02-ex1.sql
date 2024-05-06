/*
 *   ISEL-DEETC-SisInf
 *   ND 2022-2024
 *
 *   Didactic material to support the course
 *   Information Systems
 *   
 *   Based on examples from Prof. Walter Vieira
 */

-- S1
CREATE OR REPLACE PROCEDURE insert_data(a integer, b integer) LANGUAGE SQL
AS $$
START TRANSACTION;
INSERT INTO t(val) VALUES (a);
INSERT INTO t(val) VALUES (b); 
commit;
$$;
-- S2
call insert_data(1,2);
select * from t;

-- S3
call insert_data(3,2);
select * from t;

 -- Questions:
-- a) Correct any error that appear during the exuction of the code in moments S1, S2 and S3;
-- b) Explain the differences between the execution in moments S2 and S3
