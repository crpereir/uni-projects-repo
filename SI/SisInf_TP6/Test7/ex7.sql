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
 declare x record;
BEGIN
       insert into t values(1,111);
end; $$ language plpgsql;

-- Questions:
-- a) Change the code in S1 so:
  -- key violations are trapped inside an error handling
  -- When a key violation happens, the key value is change to the T.c1 maximum plus 1
  -- In other situations just print the error
 
--S1
do $$
declare
    x RECORD;
    max_c1 int;
begin
    -- Get the maximum value of c1
    select max(c1) into max_c1 from t;

    -- Attempt to insert a record into table t
    begin
        insert into t values (1, 111); -- Try to insert a record with existing primary key (key violation)
    exception
        when unique_violation then
            -- Change the key value to the maximum value of c1 plus 1
            insert into t values (max_c1 + 1, 111);
    end;

    -- Try to insert another record
    begin
        -- You can add another INSERT statement here to try inserting a different record
        raise notice 'Insertion successful';
    exception
        when others then
            -- Print any other errors that may occur
            raise notice 'Error: %', sqlerrm;
    end;
end $$ language plpgsql;


--b) Explain any problems your code has

-- a) O código dentro do bloco PL/pgSQL primeiro recupera o valor máximo de c1 da tabela t usando uma instrução 
-- SELECT MAX(c1) e o armazena na variável max_c1. Em seguida, ele tenta inserir um registro na tabela t com valor 
-- de chave primária 1. Se esta inserção causar uma violação de chave (ou seja, o valor de chave primária já existe), 
-- ele captura a exceção unique_violation e insere um novo registro com o valor de chave primária definido para max_c1 + 1. 
-- Isso garante que o registro inserido terá um valor de chave primária exclusivo. Além disso, ele tenta outra inserção 
-- (você pode adicionar outra instrução INSERT aqui para testar diferentes cenários) e trata quaisquer outros erros usando 
-- o bloco de exceção WHEN other. 
-- b) Um problema potencial com este código é que se várias sessões estiverem executando o bloco simultaneamente, 
-- há uma chance de que ambas tentem inserir registros com o mesmo valor c1 após capturar a exceção
-- de violação de chave. Isso poderia levar a outra violação de chave se ambas as sessões inserirem registros com o mesmo 
-- valor c1. Para evitar esse problema, talvez seja necessário implementar um mecanismo de bloqueio para garantir que apenas 
-- uma sessão possa modificar a tabela por vez. Além disso, o código não trata todos os erros possíveis que podem ocorrer 
-- durante a inserção, pois apenas captura a exceção unique_violation e imprime quaisquer outros erros usando SQLERRM. 
-- Dependendo dos requisitos, você pode querer adicionar um tratamento de erros mais específico para diferentes tipos de erros.
