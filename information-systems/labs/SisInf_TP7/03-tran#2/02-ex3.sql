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
create procedure t(p1 int, p2 int, toCommitInside boolean) LANGUAGE plpgsql
as
$$
begin
    raise notice 'Tx id = %',pg_current_xact_id ();
    insert into t(val) values(p1); 
    if toCommitInside then
        commit; 
    end if;

    raise notice 'Tx id = %',pg_current_xact_id ();
    insert into t(val) values(p2); 
end;
$$;

-- S2
select pg_current_xact_id ();
call t(1,2, false);
select pg_current_xact_id ();
select * from t;

-- S3
select pg_current_xact_id ();
call t(3,3, false);
select pg_current_xact_id ();
select * from t;

-- S4
select pg_current_xact_id ();
call t(3,3, true);
select pg_current_xact_id ();
select * from t;

--S5
begin transaction;
select pg_current_xact_id (); 
call t(4,5, false);
select pg_current_xact_id (); 
commit;
select * from t;

--S6
begin transaction;
select pg_current_xact_id (); 
call t(4,5, true);
select pg_current_xact_id (); 
commit;
select * from t;

 -- Questions:
-- a) Explain what pg_current_xact_id do
-- b) Explain the output in S2
-- c) Explain the output in S3
-- d) Explain the output in S4
-- e) Explain the output in S5
-- f) Explain the output in S6