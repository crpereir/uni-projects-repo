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

--S1
set transaction isolation level read committed;
begin transaction;
-- goto Utilizador2

--S4
select saldo from conta where id = 1111 for share;

--S5
select saldo from conta where id = 2222 for share;
-- goto Utilizador2

--S7
rollback;
select saldo from conta;

-- Questions:
-- a) Why didn't the transaction get stuck in step t4 and instead get on hold in t5?
-- b) Explain the values of the balances obtained by the various select instructions.

