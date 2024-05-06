/*
 *   ISEL-DEETC-SisInf
 *   ND 2022-2024
 *
 *   Didactic material to support the course
 *   Information Systems
 *   
 *   Based on examples from Prof. Walter Vieira
 */
 
-- ********** Teste 3 **********

-- S1:
begin transaction;
set transaction isolation level read committed;
-- goto Utilizador2

-- S3:
update conta set saldo = saldo+100 where id = 1111;
-- goto Utilizador2

-- S5:
update conta set saldo = saldo+100 where id = 2222;
-- goto Utilizador2

-- S7:
commit;

-- Questions:
-- a) Explain the observed behaviour.
-- b) Is there any way to prevent this behaviour by maintaining the order of the instructions in both transactions?

