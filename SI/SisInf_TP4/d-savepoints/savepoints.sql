/*
 *   ISEL-DEETC-SisInf
 *   ND 2022-2024
 *
 *   Didactic material to support the course
 *   Information Systems
 *   
 */
start transaction;
drop table if exists tlog;
create table tlog
(
	tid serial primary key,
	dt timestamp not null default CURRENT_TIMESTAMP,
	msg varchar(256) not null 
);

drop table if exists t;
create table T	
(
	tid serial primary key,
	val int not null
);
commit;

start transaction;
	insert into t(val) values (1);
	savepoint svp;
	insert into t(val) values (2);
	savepoint svp; -- P1
	insert into t(val) values (3);
	--simulate error
	rollback to savepoint svp;
	-- rollback to savepoint svp;-- P2
	insert into tLog(msg) VALUES('Failed');
	release savepoint svp; 
	rollback to savepoint svp;-- P3;
commit;

  -- Questions:
-- a) Explain the behaviour in P1.
-- b) Make two executions, one with P2 commented and other wih P2 uncommented. Explain the results.
-- c) Explain the behaviour in P3.
