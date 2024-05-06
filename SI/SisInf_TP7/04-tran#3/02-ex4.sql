/*
 *   ISEL-DEETC-SisInf
 *   ND 2022-2024
 *
 *   Didactic material to support the course
 *   Information Systems
 *   
 *   Based on examples from Prof. Walter Vieira
 */

-- S1
create or replace procedure proc_logica(p1 int, p2 int) language plpgsql
as
$$
begin
insert into t(val) values(p1); 
if p1 = p2 then
    RAISE EXCEPTION 'Chave duplicada %',p1 using errcode=45000;
end if;
insert into t(val) values(p2); 
end;
$$;

create or replace procedure proc_control(p1 int, p2 int) language plpgsql 
as
$$
begin
call proc_logica(p1,p2);
commit;
exception
when sqlstate '45000' then
    RAISE Notice 'Error code %',sqlstate;
    rollback;
when others then
    RAISE Notice 'Error';
    rollback;
end;
$$;

--S2
call proc_control(1,1);

--S3
call proc_control(1,2);

 -- Questions:
-- a) Explain what happen in moments S2 and S3
-- b) change proc_control to show the message detail on error
-- c) Solve any problem that you encounter explain the cause and the solution
