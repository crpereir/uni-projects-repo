/*
 *   ISEL-DEETC-SisInf
 *   ND 2022-2024
 *
 *   Didactic material to support the course
 *   Information Systems
 *   
*/

-- S1

-- Question:
-- a) Create a procedure p1(variadic int[] ) that receives an array of int values and insert them on table T. 

create or replace procedure p1(variadic int[])
as $$
declare 
    i int;
begin 
   foreach i in array $1
   loop
      insert into t(val) values(i);
   end loop;
end;$$ 
language plpgsql;

-- b) Test the procedure assuring that any error will guarantee a consistent state (all or nothing)

call p1(1,2,3,4,5);

select * from t;