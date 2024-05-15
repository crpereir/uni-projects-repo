/*
 *   ISEL-DEETC-SisInf
 *   ND 2022-2024
 *
 *   Didactic material to support the course
 *   Information Systems
 *   
 *   Based on examples from Prof. Walter Vieira
 */
 
-- ********** Teste 2 **********

-- S2
begin transaction;

-- S3
update conta set saldo = saldo-500 where id = 2222;
-- goto Utilizador1

-- S6
rollback;
-- goto Utilizador1
