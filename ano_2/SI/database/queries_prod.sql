
-- Encontre os três clientes que gastaram mais em pedidos.
select c.nome, sum(pr.preco * pr.quantidade) as price from clientes c
join pedidos p on c.id = p.cliente_id
join produtos pr on p.produto_id = pr.id
group by c.nome
order by price desc 
limit 3


-- Encontre os produtos que nunca foram pedidos.
select pr.nome from produtos pr
left join pedidos p on pr.id = p.produto_id
where p.id is null


-- Liste os clientes que fizeram pedidos em todos os anos desde o ano de 2015.
select nome from clientes c 
join pedidos p on p.cliente_id = c.id 
where p.data_pedido >= '2015-01-01'


-- Selecione todos os produtos da tabela "produtos"
select * from produtos p 


-- Selecione todos os clientes que possuem o nome "João"
select * from clientes c where c.nome = 'João'


-- Selecione todos os pedidos feitos no mês atual
select * from pedidos p 
where extract(month from p.data_pedido) = extract(month from current_date)


-- Selecione o nome e o preço de todos os produtos com preço acima de 25
select nome, preco from produtos p where p.preco >= 25


-- Selecione o nome, o email e o telefone de todos os clientes que fizeram pedidos
-- no dia 30 de junho de 2023
select nome, email, telefone 
from clientes c join pedidos p on c.id = p.cliente_id 
where p.data_pedido = '2023-06-30'


-- Selecione o nome do cliente, o nome do produto e a quantidade para todos os 
-- pedidos feitos no último mês, juntamente com o total gasto por cada cliente
select c.nome, pr.nome, p.quantidade, pr.preco * p.quantidade as total_gasto
from clientes c 
join pedidos p on p.cliente_id = c.id 
join produtos pr on p.produto_id = pr.id 



-- Selecione o nome dos produtos que nunca foram pedidos
select nome from produtos pr
join pedidos p on p.produto_id = pr.id 
where p.produto_id is null


-- Selecione o nome do cliente, a quantidade total de produtos pedidos por esse 
-- cliente e a quantidade média de produtos pedidos por todos os clientes
select c.nome, sum(p.quantidade) as quantidade_total, avg(p.quantidade) as quantidade_media
from clientes c join pedidos p on p.cliente_id = c.id 
group by c.nome


-- Selecione os produtos com a menor e a maior quantidade em stock
select p.nome from produtos p
order by p.quantidade desc 
limit 1  
union all
select p.nome from produtos p
order by p.quantidade asc
limit 1

-- Selecione o nome dos clientes que já fizeram pedidos de todos os produtos 
-- disponíveis
select c.nome from clientes c 
join pedidos p on p.cliente_id = c.id 
where p.produto_id = 1 and p.produto_id = 2 and p.produto_id = 3



-- Trigger para atualizar a quantidade de produtos após a inserção de um novo pedido
create or replace function quant_products()
returns trigger
language plpgsql
as $$
declare 
	new_quantity int;
begin 
	update produtos set quantidade = new_quantity
	where quantidade = quantidade;
end;
$$

create trigger trigger_name 
after insert on pedidos
for each row
execute procedure quant_products()



-- Procedure para inserir um novo cliente
create or replace procedure insert_new_client(
	new_nome varchar(100), 
	new_email varchar(100), 
	new_telefone varchar(20)
)
language plpgsql
as $$
begin
	insert into clientes(nome, email, telefone) 
	values (new_nome, new_email, new_telefone);
end; 
$$ 


-- View para exibir detalhes de um pedido com informações do cliente e do produto
create view details as
select 
	c.id as cliente_id,
	c.nome as cliente_nome,
	c.email as cliente_email,
	c.telefone as cliente_telefone,
	pr.id as produto_id,
	pr.nome as produto_nome, 
	pr.preco as produto_preco,
	pr.quantidade as produto_quantidade
from clientes c join pedidos p on c.id = p.cliente_id 
join produtos pr on p.produto_id = pr.id 


-- Function para calcular o total gasto por um cliente
create or replace function total_gasto(cliente_id int)
returns integer 
language plpgsql
as
$$
declare 
	total int;
begin
 	-- logic
	select sum(pr.preco*p.quantidade) into total
	from produtos pr 
	join pedidos p on pr.id = p.produto_id 
	where p.cliente_id = cliente_id;
    
    return total;
end;
$$











