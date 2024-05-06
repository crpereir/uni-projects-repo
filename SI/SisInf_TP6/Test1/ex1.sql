/*
 *   ISEL-DEETC-SisInf
 *   ND 2022-2024
 *
 *   Didactic material to support the course
 *   Information Systems
 *   
 *   Based on examples from Prof. Walter Vieira
 */


--S0
create function f(p char(5)) returns integer
return character_length(p)*2;

--S1
do
language plpgsql
$$
declare x int;

begin 
     x = f(55);
end;
$$;

--S2
do
language plpgsql
$$
declare x int;

begin 
     x = f(55::varchar);
     raise notice 'x = %', x;
end;
$$;

-- Questions:
-- a) Explain the behaviour observed in S1.
-- da erro uma vez que a função f recebe um parametro do tipo char e o valor que está
-- a ser passado é um valor do tipo integer

-- b) Explain the behaviour observed in S2. Compare it with S1.
-- ao contrario de S1, este troço de código sql funciona uma vez que é feito um cast no 
-- parametro passado à função f (passando este a ser do tipo varchar)
