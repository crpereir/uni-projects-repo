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
declare x RECORD;
begin
   FOR x IN select * from t order by c1 desc LOOP
     raise notice 'x.c1 % x.c2 = %', x.c1, x.c2;
   END LOOP;
end $$ language plpgsql;

-- Questions:
-- a) Explain the behaviour observed in S1 and compare with the explicit use of CURSORS

-- Comportamento observado em S1:
-- O bloco PL/pgSQL começa por declarar uma variável x. Dentro do loop, a construção FOR x IN ... LOOP 
-- é usada para iterar sobre o conjunto de resultados obtido da consulta SELECT * FROM t ORDER BY c1 DESC. 
-- Esta consulta seleciona todas as linhas da tabela t e ordena-as pela coluna c1 em ordem decrescente. 
-- Para cada iteração, a variável de loop x representa uma linha do conjunto de resultados. Dentro do loop, 
-- é gerado um aviso para cada linha, exibindo os valores das colunas c1 e c2 da linha atual. 

-- Comparação com uso explícito de cursores: 
-- Nesse cenário, o uso de cursores explícitos é desnecessário porque a construção FOR x IN ... LOOP simplifica 
-- a iteração sobre o conjunto de resultados obtido da consulta SELECT. 
-- Os cursores explícitos são normalmente usados ​​quando operações de cursor mais complexas são necessárias, como 
-- controle manual sobre abertura, busca e fecho do cursor, ou quando o conjunto de resultados precisa de ser 
-- processado linha a linha com uma lógica mais complexa. A abordagem usada em S1 é mais concisa e legível em 
-- comparação com a definição e gestão explícitos de um cursor.
