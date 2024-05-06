/*
 *   ISEL-DEETC-SisInf
 *   ND 2022-2024
 *
 *   Didactic material to support the course
 *   Information Systems
 *   
 *   Based on examples from Prof. Matilde Pato
 */

 -- Questions:
 -- a) Create a stored procedure to change the state of a bicycle from "free" (livre) to "under maintenance" (Em manutenção). 
 -- Indicate in your implementation what the impact would be if the number of possible states were changed.

create or replace procedure change_state(id_bicicleta integer)
as $$
declare
    estado_bicicleta varchar(30);
begin

    select estado into estado_bicicleta
    from bicicleta
    where id = id_bicicleta;

    if estado_bicicleta = 'livre' then
        update bicicleta set estado = 'em manutencao'
        where id = id_bicicleta;
    end if;

end;$$
language plpgsql;

-- In my implementation, the impact of changing the number of possible states would be that 
-- I would have to add more conditions to the if statement to check the new states.

