/*
 *   ISEL-DEETC-SisInf
 *   ND 2022-2024
 *
 *   Didactic material to support the course
 *   Information Systems
 *   
 */

/**
*   Using a cursor, delete all even numbers from table X.
*/

-- TODO

do $$
declare
    cur cursor for select i from X where i % 2 = 0;
    value int;
begin
    open cur;
    loop
        fetch next from cur into value;
        exit when value is null;
        delete from X where i = value;
        --raise notice 'valor de i = %', x; 
    end loop;
    close cur;
end $$ language plpgsql;

