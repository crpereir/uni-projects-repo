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
        y int;
begin
   select * into x, y from t where c1 = 2;
   raise notice 'x = %, y = %', x, y;
   insert into t values(111,222) returning c1,c2 into x,y;
   raise notice 'x = %, y = %', x, y;
   delete from t where c1 = 111 returning c1, c2 into x,y;  
   raise notice 'x = %, y = %', x, y;
end $$ language plpgsql;´

--S2
do
$$
declare x int;
        y int;
begin
   select * into x, y from t where c1 = 2;
   raise notice 'x = %, y = %', x, y;
   insert into t values(111,222) returning c1,c2 into x,y;
   raise notice 'x = %, y = %', x, y;
   delete from t where c1 = 0 returning c1, c2 into x,y;  
   raise notice 'x = %, y = %', x, y;
end $$ language plpgsql;

-- Questions:
-- a) Explain the behaviour observed in S1. Explain what the returning keyword do.

-- Em S1, começa-se por declarar duas variáveis ​​inteiras x e y. O bloco então executa um SELECT 
-- para recuperar valores da tabela t onde c1 é igual a 2. Os valores recuperados são atribuídos 
-- às variáveis ​​x e y. É gerado um aviso, imprimindo os valores de x e y. É executada uma instrução
-- insert para inserir uma nova linha na tabela t com valores (111, 222). A cláusula RETURNING é usada 
-- para retornar os valores inseridos das colunas c1 e c2 nas variáveis ​​​​x e y. É gerado outro aviso, que 
-- imprime os novos valores de x e y. É gerado um aviso final, imprimindo os valores de x e y. 


-- b) Explain the behaviour observed in S2. Experiment variations with other commands (update and insert)

-- S2 é semelhante a S1, exceto que a instrução DELETE tem como alvo uma linha onde c1 é igual a 0, o que 
-- não existe na tabela. Conseqüentemente, a instrução DELETE não exclui nenhuma linha e a cláusula RETURNING 
-- retorna valores NULL para c1 e c2 nas variáveis ​​x e y. Avisos são gerados após a execução de cada instrução,
-- exibindo os valores de x e y. Como a instrução DELETE não afetou nenhuma linha, os valores de x e y permanecem
-- inalterados em relação aos valores iniciais recuperados pela instrução SELECT. 