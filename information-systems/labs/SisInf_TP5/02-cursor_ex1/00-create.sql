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
do
$$
declare x int;
begin
    FOR x IN 0..20 BY 2 LOOP 
        insert into x values(x,x::varchar(10)); --what ::varchar does?
    END LOOP;
end 
$$ language plpgsql;


-- ::varchar é usado para fazer uma conversão explicita de um valor de um determinado 
-- tipo de dados para o tipo de dados varchar