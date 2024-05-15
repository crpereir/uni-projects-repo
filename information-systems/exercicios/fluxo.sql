

create table livros (
    id int primary key,
    titulo varchar(100),
    autor varchar(100),
    preco decimal(5,2)
);

create table vendas (
    id int primary key,
    livro_id int,
    quantidade int,
    foreign key (livro_id) references livros(id)
);

insert into livros (id, titulo, autor, preco) values
    (1, 'Livro A', 'Autor A', 10.00),
    (2, 'Livro B', 'Autor B', 15.00),
    (3, 'Livro C', 'Autor C', 20.00),
    (4, 'Livro D', 'Autor D', 25.00),
    (5, 'Livro E', 'Autor E', 30.00);

insert into vendas (id, livro_id, quantidade) values
    (1, 1, 100),
    (2, 2, 200),
    (3, 3, 300),
    (4, 4, 400),
    (5, 5, 500);

-----------------------------------------------------------------------------------
-- função que retorna o total de vendas de um livro especifico

drop function total_vendas;

create or replace function total_vendas(id_livro int) 
returns int 
as $$

declare 
    total int;
begin
    select sum(quantidade) into total from vendas where livro_id = id_livro;
    return total;
end; $$
language plpgsql;

select total_vendas(5);

-----------------------------------------------------------------------------------
-- cursor que selecione todos os livros que custam mais de 20€ e usar um loop para
-- escrever os seus titulos

do $$
declare 
    cur cursor for select titulo from livros where preco > 20;
    titulo_livro text;
begin 
    open cur;
    loop   
        fetch next from cur into titulo_livro;
        exit when not found;
        raise notice 'nome livro = %', titulo_livro;
    end loop;
    close cur;
end; $$
language plpgsql;

-----------------------------------------------------------------------------------
-- funcao que retorne o numero total de livros na tabela

create or replace function total()
returns int
as $$
declare 
    total int;
begin
    select count(titulo) into total from livros;
    return total;
end; $$
language plpgsql;

select total();

-----------------------------------------------------------------------------------
-- função que retorna o preço médio dos livros

create or replace function preco_medio()
returns decimal(5,2)
as $$
declare 
    media decimal(5,2);
begin 
    select avg(preco) into media from livros;
    return media;
end; $$
language plpgsql;

select preco_medio();

-----------------------------------------------------------------------------------
-- funcao que retorna o livro mais caro

create or replace function livro_mais_caro()
returns varchar(50)
as $$
declare 
    titulo varchar(50);
begin
    select titulo into titulo from livros order by preco desc limit 1;
    return titulo;
end; $$
language plpgsql;

select livro_mais_caro();

-----------------------------------------------------------------------------------
-- funcao que retorna o total de livros vendidos por um determinado autor

create or replace function vendas_autor(nome_autor varchar(50))
returns integer
as $$
declare
    total_vendas integer;
begin 
    select sum(v.quantidade) into total_vendas from vendas v 
    join livros l on v.livro_id = l.id
    where l.autor = nome_autor;
    return total_vendas;
end;$$
language plpgsql;

select vendas_autor('Autor A');

-----------------------------------------------------------------------------------
-- funcao que retorna o autor mais vendido

create or replace function autor_mais_vendido()
returns varchar(50)
as $$
declare 
    autor_vendido varchar(50);
begin 
    select l.autor into autor_vendido from livros 
    join vendas v on l.id = v.livro_id
    group by l.autor
    order by sum(v.quantidade) desc limit 1;
    return autor_vendido;
end;$$
language plpgsql;

select autor_mais_vendido();

-----------------------------------------------------------------------------------
-- cursor que selecione todos os livros e use um loop para escrever os seus titulos

do $$
declare 
    cur cursor for select titulo from livros;
    titulo_livro text;
begin 
    open cur;
    loop
        fetch next from cur into titulo_livro;
        exit when not found;
        raise notice 'titulo = %', titulo_livro;
    end loop;
    close cur;
end; $$

-----------------------------------------------------------------------------------
-- cursor que selecione todos os livros que custam mais de 20€ e usar um loop para 
-- escrever os seus titulos

do $$
declare 
    cur cursor for select titulo from livros where preco > 20;
    titulo_livro text;
begin
    open cur;
    loop
        fetch next from cur into titulo_livro;
        exit when not found;
        raise notice 'titulo livro = %', titulo_livro;
    end loop;
    close cur;
end;$$

-- cursor que selecione todos os autores e usar um loop para escrever o número de 
-- livros que eles venderam

do $$
declare 
    cur cursor for select autor from livros;
    autor_nome text;
    vendas_total int;
begin   
    open cur;
    loop
        fetch next from cur into autor_nome;
        exit when not found;
        select into vendas_total vendas_autor(autor_nome);
        raise notice 'autor: % vendas: %', autor_nome, vendas_total;
    end loop;
    close cur;
end; $$
















































































