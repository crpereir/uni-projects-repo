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
insert into tr1 values(1,2); 
insert into tr2 values(2,1); 
set constraints c immediate; 
insert into tr1 values(3,2); 
commit;

 -- Questions:
-- c) When the restriction is verified?