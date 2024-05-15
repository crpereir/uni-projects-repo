/*
 *   ISEL-DEETC-SisInf
 *   ND 2022-2024
 *
 *   Didactic material to support the course
 *   Information Systems
 *   
 */
--Begin S2
start transaction; 
--set transaction isolation level repeatable read;
--set transaction isolation level serializable;
do
$do$
begin  
if (select count(*) from t) < 3 then
    insert into t(val) values(2);
end if;
end
$do$;
commit;
--End S2
