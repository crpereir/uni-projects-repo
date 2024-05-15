/*
 *   ISEL-DEETC-SisInf
 *   ND 2022-2024
 *
 *   Didactic material to support the course
 *   Information Systems
 *   
 *   Based on examples from Prof. Walter Vieira
 */

-- S0
drop table if exists t;
create table T	
(
	tid serial primary key,
	val real not null
);


do
$$
declare x int;
begin
    FOR x IN 0..50 BY 1 LOOP 
        insert into T(val) values(random()*1000); 
    END LOOP;
end 
$$ language plpgsql;