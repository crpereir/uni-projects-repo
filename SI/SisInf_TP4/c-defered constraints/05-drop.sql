/*
 *   ISEL-DEETC-SisInf
 *   ND 2022-2024
 *
 *   Didactic material to support the course
 *   Information Systems
 *   
 */
start transaction;
alter table tr1 drop constraint c;
drop table tr2;
drop table tr1;
commit;

  -- Questions:
-- e) Explain the behaviour.