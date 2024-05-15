/*
 *   ISEL-DEETC-SisInf
 *   ND 2022-2024
 *
 *   Didactic material to support the course
 *   Information Systems
 *   
 */
start transaction;

select current_database () as "database",
    pg_backend_pid () as pid;

select * from X for share;
--See the tx id. Explain the result
select pg_current_xact_id_if_assigned() as tx_id;
select relation::regclass,
    locktype,
    database,
    relation,
    page,
    tuple,
    transactionid,
    mode,
    granted,
    waitstart
from pg_locks where 'x'::regclass::oid =relation;

update X
set z = 'z'
where i % 2 = 0;
--See again the tx id. Explain the result
select pg_current_xact_id_if_assigned() as tx_id;
select relation::regclass,
    locktype,
    database,
    relation,
    page,
    tuple,
    transactionid,
    mode,
    granted,
    waitstart
from pg_locks  where 'x'::regclass::oid =relation;

rollback;

select pg_current_xact_id_if_assigned() as tx_id;


-- Questions:
-- a) Experiment the previous with each of the following isolation levels
--      set transaction isolation level serializable;
--      set transaction isolation level repeatable read;
--  Explain the results.

-- b) From TP3 rerun Test1, use the pg_locks to see the lock in each step, and explain the results

-- c) From TP3 rerun Test2, use the pg_locks to see the lock in each step, and explain the results

-- d) From TP3 rerun Test3, use the pg_locks to see the lock in each step, and explain the results
