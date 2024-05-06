/*
 *   ISEL-DEETC-SisInf
 *   ND 2022-2024
 *
 *   Didactic material to support the course
 *   Information Systems
 *   
 *   Based on examples from Prof. Walter Vieira
 */

--S0 -> Step 0

--BEGIN S0  Run BEFORE EVERY EXERCISE
drop table if exists conta;

create table conta(
   id integer primary key,
   saldo real
);

start transaction;
  insert into conta values(1111,1000);
  insert into conta values(2222,2000);
commit;
select * from conta;
-- END S0