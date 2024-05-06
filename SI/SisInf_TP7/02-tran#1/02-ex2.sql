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
call insert_data(1,2);
select * from t;

--S2
call insert_data(4,4);
select * from t;

-- S3
start transaction;
call insert_data(4,5);
rollback;
select * from t;

-- S4
start transaction; 
call teste_tr(7,7); 
commit;
select * from t;

 -- Questions:
-- a) Explain the differences between the execution in moments S1, S2, S3 and S4
