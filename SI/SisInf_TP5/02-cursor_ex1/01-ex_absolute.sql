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
   x int;
   c cursor for select i from x;
begin
   OPEN c; 
   fetch absolute(5) from c into x;
   loop
        exit when not found; -- What is the purpose of this line?
        raise notice 'valor de i = %', x; --what raise notice does? Why not using a variation of printf?
        fetch prior from c into x;
   end loop;
   close c;
end; 
$$ language plpgsql;

-- O propósito para esta linha 10 é que serve como uma condição de término para o loop. 
-- No contexto do postgresql, é comumente usado com loops de cursor para sair do loop quando 
-- não há mais linhas para buscar no conjunto de resultados do cursor.


-- o raise notice é usado para fins de depuração. Ele envia uma mensagem para o log do PostgreSQL. 
-- Neste caso, gera um aviso que mostra o valor da variável x. É semelhante ao printf em outras 
-- linguagens, usado para imprimir valores durante a depuração.