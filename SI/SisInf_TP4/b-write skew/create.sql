/*
 *   ISEL-DEETC-SisInf
 *   ND 2022-2024
 *
 *   Didactic material to support the course
 *   Information Systems
 *   
 */
-- Begin S0
drop table if exists t;
create table T	
(
	tid serial primary key,
	val int not null
);

insert into T(val) values(0),(1);
select * from T;
-- End S0