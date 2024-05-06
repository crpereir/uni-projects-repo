/*
 *   ISEL-DEETC-SisInf
 *   ND 2022-2024
 *
 *   Didactic material to support the course
 *   Information Systems
 *   
 */
start transaction;
create table tr1 (i int primary key, j int);
create table tr2 (i int primary key, j int constraint c1 references tr1(i)); 

-- consider the foreign keys
alter table tr1 add constraint c foreign key(j) references tr2(i) deferrable initially immediate;

commit;

 -- Questions:
-- a) Explain what deferrable initially immediate means