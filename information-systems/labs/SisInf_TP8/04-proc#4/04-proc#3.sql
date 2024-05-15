/*
 *   ISEL-DEETC-SisInf
 *   ND 2022-2024
 *
 *   Didactic material to support the course
 *   Information Systems
 *   
 *   Based on examples from Prof. Matilde Pato
 */

-- Question:
-- Create a procedure to reserve a bike with the necessary parameters to make a reservation. 
-- A client cannot start a new reservation if one is in progress, i.e. the end date in an existing own reservation is null. 
-- Ensure the consistency of the database and the use of previous objects (e.g. triggers). 
-- Bookings are calculated at 2 euros per hour, maximum 5 euros per day.

drop procedure reserve_bike;
create or replace procedure reserve_bike(
    p_cliente integer,
    p_loja integer,
    p_bicicleta integer,
    p_dtinicio timestamp,
    p_dtfim timestamp
)
language plpgsql
as $$
declare
    v_duration interval;
    v_cost numeric(4,2);
begin
    if exists (
        select 1 
        from reserva r
        join clientereserva cr on r.noreserva = cr.reserva and r.loja = cr.loja
        where cr.cliente = p_cliente and r.dtfim is null
    ) then
        raise exception 'Client has an ongoing reservation.';
    end if;

    v_duration := age(p_dtfim, p_dtinicio);
    v_cost := least(extract(day from v_duration) * 5 + extract(hour from v_duration) * 2, 5);

    insert into reserva(noreserva, loja, dtinicio, dtfim, valor, bicicleta)
    values (nextval('reserva_noreserva_seq'), p_loja, p_dtinicio, p_dtfim, v_cost, p_bicicleta);

    insert into clientereserva(cliente, reserva, loja)
    values (p_cliente, currval('reserva_noreserva_seq'), p_loja);
end;
$$;

call reserve_bike(1, 1, 1, '2022-01-01 10:00:00', '2022-01-01 12:00:00');

select * from reserva where cliente = 1;
select * from clientereserva where cliente = 1;






















