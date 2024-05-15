/*
 *   ISEL-DEETC-SisInf
 *   ND 2022-2024
 *
 *   Didactic material to support the course
 *   Information Systems
 *   
 */

do
$$
declare
   x int;
   c cursor for select i from x;
begin
   OPEN c; 
   fetch last from c into x;
   loop
        exit when not found;
        raise notice 'valor de i = %', x; 
        fetch prior from c into x;
   end loop;
   close c;
end; 
$$ language plpgsql;
