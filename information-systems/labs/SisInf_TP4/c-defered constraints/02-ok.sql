/*
 *   ISEL-DEETC-SisInf
 *   ND 2022-2024
 *
 *   Didactic material to support the course
 *   Information Systems
 *   
 */
start transaction;
set constraints c deferred;
insert into tr1 values(5,6);
insert into tr2 values(6,5);
commit;

 -- Questions:
-- b) When the restriction is verified?