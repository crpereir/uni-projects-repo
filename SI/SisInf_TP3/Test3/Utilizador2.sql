/*
 *   ISEL-DEETC-SisInf
 *   ND 2022-2024
 *
 *   Didactic material to support the course
 *   Information Systems
 *   
 *   Based on examples from Prof. Walter Vieira
 */
 
-- ************* Teste 3 ************
-- S2:
begin transaction;
set transaction isolation level read committed; 
-- goto Utilizador1

-- S4
update conta set saldo = saldo+100 where id = 2222;
-- goto Utilizador1

-- S6
update conta set saldo = saldo+100 where id = 1111;
-- goto Utilizador1

--S8
commit;
