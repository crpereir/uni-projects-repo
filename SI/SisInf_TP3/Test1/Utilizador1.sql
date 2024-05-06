/*
 *   ISEL-DEETC-SisInf
 *   ND 2022-2024
 *
 *   Didactic material to support the course
 *   Information Systems
 *   
 *   Based on examples from Prof. Walter Vieira
 */

-- ********** Test 1 **********

-- S1
start transaction;
set transaction isolation level read uncommitted;
-- goto Utilizador2

--S4
select saldo from conta where id = 1111;
-- anotar valor

--S5
select saldo from conta where id = 2222
-- anotar valor
-- goto Utilizador2

-- S7
commit;
select saldo from conta;

-- Questions:
-- a) Explain the behaviour observed, taking into account what would normally happen with the 2PL protocol.
