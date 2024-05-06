
/*
 *   ISEL-DEETC-SisInf
 *   ND 2022-2024
 *
 *   Didactic material to support the course
 *   Information Systems
 *   
 */

/**
*   Create a function (predicate) that validades if a string represents a "valid" e-mail. 
*   The function should then be used to in a check constraint associated to the table. 
*
*
*/

-- A: Show the function code. Have a rational to choose the type of parameter.
create or replace function valid_string(email text)
returns boolean
as $$
begin 
	if email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$' then
        return true;
    else
        return false;
    end if;
end;
$$ language plpgsql;


-- B: Show the code that adds the constraint check to the table. 
alter table pessoa add constraint valid_email check (valid_string(email));

-- C: Present Examples that test the implementation 
insert into pessoa(nome, morada, email, telefone, noident, nacionalidade, atrdisc) 
values ('faisca', 'rua faisca', 'faisca@isel.pt', '999999999999', '777777777777', 'PT', 'G');


