/*
 *   ISEL-DEETC-SisInf
 *   ND 2022-2024
 *
 *   Didactic material to support the course
 *   Information Systems
 *   
 *   Based on examples from Prof. Walter Vieira
 */
 
-- ********** Teste 4 **********
-- S1:
begin transaction;
--set transaction isolation level read committed;
set transaction isolation level repeatable read;
-- goto Utilizador2

-- S3:
select  avg(saldo) from conta where saldo > 500;
-- take note of the value
-- goto Utilizador2

-- S5
select avg(saldo) from conta where saldo > 500;
-- take note of the value
commit;

-- Questions:
-- Have you observed any of the anomalies studied? Why was it observed and how would you eliminate it?

