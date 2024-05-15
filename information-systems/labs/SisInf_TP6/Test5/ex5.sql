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
declare nrows int;
begin
   delete from t where c1 = 222;
   IF NOT FOUND THEN
         raise notice 'não foram apagadas linhas';
    end if;
end; $$ language plpgsql;


-- S2
do
language plpgsql
$$
declare
   nrows int;
begin
   delete from t where c1 = 2;
   GET CURRENT DIAGNOSTICS nrows = ROW_COUNT;
   raise notice '% linhas removidas', nrows;
end; $$ ;

-- Questions:
-- a) Explain the behaviour observed in S1. What NOT FOUND does? Is there other constant to be use to cover other situations?

-- S1: O bloco PL/pgSQL em S1 tenta excluir linhas da tabela t onde o valor da coluna c1 é igual a 222. 
-- O bloco verifica se alguma linha foi afetada pela exclusão usando a condição IF NOT FOUND. Essa condição 
-- verifica se a operação de exclusão não encontrou nenhuma linha para excluir. Se nenhuma linha foi encontrada 
-- para excluir, ou seja, se NOT FOUND for verdadeiro, o bloco levanta um aviso (notice) informando que nenhuma 
-- linha foi excluída.O uso de NOT FOUND neste contexto é específico para operações de exclusão ou outras operações 
-- que não retornam um resultado direto. Ele verifica se a operação anterior afetou zero linhas. Para outras situações, 
-- como operações de seleção (SELECT), pode-se usar a condição FOUND, que verifica se a consulta retornou alguma linha.

-- b) Explain the behaviour observed in S2. What information in can obtain with GET DIAGNOSTICS?

-- S2: O bloco PL/pgSQL em S2 também tenta excluir linhas da tabela t onde o valor da coluna c1 é igual a 2. Após a operação 
-- de exclusão, a quantidade de linhas afetadas é obtida usando GET DIAGNOSTICS nrows = ROW_COUNT;. Esta instrução coloca o 
-- número de linhas afetadas pela última operação SQL em uma variável. Em seguida, um aviso é levantado, informando quantas 
-- linhas foram removidas. GET DIAGNOSTICS é uma forma de acessar informações sobre o estado da última operação SQL executada 
-- no contexto do bloco PL/pgSQL. Ele fornece informações como o número de linhas afetadas, o código de erro e outras informações 
-- diagnósticas.


