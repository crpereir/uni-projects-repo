/*
 *   ISEL-DEETC-SisInf
 *   ND 2022-2024
 *
 *   Didactic material to support the course
 *   Information Systems
 *   
 *   Based on examples from Prof. Walter Vieira
 */
 
--*********** Teste 5 ***********

-- S1:
begin transaction;
set transaction isolation level repeatable read;
-- goto Utilizador2

--S3:
select * from conta where Id = 1111;
-- Take note of the value.
-- goto Utilizador2

-- S5
select * from conta where id = 2222;
commit;
select * from conta;

-- Questions:
-- Explain the reason for the values observed in the select instructions
