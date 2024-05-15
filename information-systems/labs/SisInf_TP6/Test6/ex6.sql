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
declare
   x record;
   nrows int;
   ctx text;
begin
   select * into strict x from t where c1 > 1; -- (experimentar com > 1, > 100 e = 1)
   GET CURRENT DIAGNOSTICS nrows = ROW_COUNT,ctx=PG_CONTEXT; raise notice 'nrows=%, context: %',nrows, ctx;
    exception 
	   when no_data_found then
	         raise notice 'Não existem linhas';
	   when too_many_rows then
	         raise notice 'Encontradas mais do que 1 linhas';
end; $$ language plpgsql;

-- Questions:
-- a) Explain the behaviour observed in S1. What the difference between NOT FOUND and no_data_found? 
-- No bloco PL/pgSQL em S1, há uma seleção de uma linha da tabela t onde o valor da coluna c1 é maior que 1. 
-- SELECT INTO STRICT: Esta é uma forma de instrução SELECT INTO que requer que a consulta retorne exatamente uma linha. 
-- Se a consulta retornar zero linhas, uma exceção NO_DATA_FOUND será levantada. Se a consulta retornar mais de uma linha,
-- uma exceção TOO_MANY_ROWS será levantada.
-- GET CURRENT DIAGNOSTICS: Esta instrução é usada para obter informações de diagnóstico sobre a última operação SQL executada. 
-- Neste caso, está sendo usado para obter o número de linhas afetadas pela instrução SELECT e o contexto do PostgreSQL no 
-- momento da exceção.
-- EXCEPTION: Este bloco captura exceções que podem ser levantadas pela instrução SELECT INTO STRICT. Ele captura as exceções 
-- NO_DATA_FOUND e TOO_MANY_ROWS e levanta avisos (notices) indicando a natureza do problema.
