/*
 *   ISEL-DEETC-SisInf
 *   ND 2022-2024
 *
 *   Didactic material to support the course
 *   Information Systems
 *   
 */

do
$$
declare
   t record; --what is the type record?
   c cursor (v int) for select i from x where i>v; -- What is different in the declaration of this vector?
begin
   for t IN c (v := 2) loop -- Why there is no need to open the cursor like in previous examples?
      raise notice 'valor de i = %', t.i;
   end loop;
end; 
$$ language plpgsql;


-- type record é um tipo de dados genérico no PostgreSQL que pode conter uma linha de dados com qualquer 
-- estrutura. Neste caso, t é declarado como uma variável do tipo record, que conterá a linha buscada no cursor.

-- Na declaração do cursor c, a diferença está na inclusão de um parâmetro (v int) entre parênteses. 
-- Isto parametriza o cursor, permitindo passar um valor para o cursor quando ele for usado em instruções subsequentes.

-- Quando utilizamos um cursor dentro de um for loop, o cursor é automaticamente aberto, percorrido e fechado. Por esse 
-- motivo nao precisamos de fazer open.

