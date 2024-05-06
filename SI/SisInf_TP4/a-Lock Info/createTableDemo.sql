/*
 *   ISEL-DEETC-SisInf
 *   ND 2022-2024
 *
 *   Didactic material to support the course
 *   Information Systems
 *   
 */

drop table if exists X;

create table X(i int primary key, z varchar(10));

insert into X(i, z) values
	(1, 'a'),
	(2, 'b'),
	(3, 'c'),
	(4, 'd'),
	(5, 'e'),
	(6, 'f');