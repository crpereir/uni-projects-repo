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
DROP TABLE IF EXISTS t;

CREATE TABLE t(c1 int PRIMARY KEY, c2 int);
INSERT INTO t VALUES
  (1,1),
  (2,22),
  (3,3),
  (4,44),
  (5,5);

--S1
do
$$
declare x int;
begin
   FOR x IN REVERSE 20..0 BY 5 LOOP
     IF x = 10 then
        continue;
     end if;
     raise notice 'x = %', x;
     EXIT when x = 5; -- executar com e sem esta linha comentada   
   END LOOP;
end $$ language plpgsql;

-- Questions:
-- a) Explain the goal of the code and the language constructions used in S1.
-- O objetivo do código a cima é demonstrar o uso de loops (loop FOR), 
-- instruções condicionais (instrução IF) e loops (CONTINUE e EXIT) em PL.


-- NOTA: se não executar com a linha comentada, o output é 20 15 5
--		 se executar com a linha comentada, o output é 20 15 5 0
