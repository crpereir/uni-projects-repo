/*
 *   ISEL-DEETC-SisInf
 *   ND 2022-2024
 *
 *   Didactic material to support the course
 *   Information Systems
 *   
 *   Based on examples from Prof. Matilde Pato
 */

-- Question
-- a) Create a trigger that checks if a bicycle can be reserved for a given period. 
--    It should raise an error with code family 23xxx and different messages for the situations 
--    where the reserve it is not possible. Reasons: dates overlap;
--    If the booking is in progress, i.e. if the end date is NULL, the bike cannot be used for other 
--    bookings, nor can the customer start another booking.
--    Note: Check Allen's interval relations to implement all the intersection possibilities: 
--    https://en.wikipedia.org/wiki/Allen%27s_interval_algebra 

create or replace function check_reservation()
returns trigger 
as $$
declare
    reserva_in_progress boolean;
    reserva_possible boolean;
begin
    
    select count(*) > 0 into reserva_in_progress
    from reserva
    where bicicleta = new.bicicleta and datafim is null;

    select count(*) = 0 into reserva_possible
    from reserva
    where bicicleta = new.bicicleta and (datainicio, datafim) overlaps (new.datainicio, new.datafim);

    if reserva_in_progress then
        raise exception using errcode = '23000', message = 'Bicicleta em uso';
    end if;

    if not reserva_possible then
        raise exception using errcode = '23000', message = 'Reserva impossivel';
    end if;

    return new;
end;$$
language plpgsql;


create trigger reservation
before insert or update on reserva
for each row execute function check_reservation();



