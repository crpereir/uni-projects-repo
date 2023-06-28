
-- selecionar todos os funcionarios (id e nome) da tabela employees
select id, name from employees


-- selecionar o nome e o preço dos produtos na categoria "tecnologia" da tabela products
select * from products

select name, price 
from products 
where products.category = 'tecnology'


-- selecionar o nome do departamento e a média salarial dos funcionários de cada departamento
-- ordenados em ordem decrescente de média salarial
select * from employees

select department, avg(salary) as salary
from employees
group by department 
order by salary desc


-- selecionar o nome e a idade dos funcionários que têm um salário acima de 5000
select salary from employees

select name, age from employees 
where employees.salary >= 5000


-- selecionar o nome dos produtos e a quantidade total de pedidos para cada produto, ordenados
-- em ordem decrescente de quantidade
select * from orders 
 
select p.name as product_name, sum(quantity) as total_orders
from products p
join orders on p.id = product_id 
group by p.name
order by total_orders desc


-- selecionar o nome dos funcionários que fizeram pelo menos um pedido, juntamente com o valor atual 
-- gasto por cada funcionário em pedidos, ordenados em ordem decrescente de valor total
select e.name, sum(p.price * o.quantity) as total_spent
from employees e
join orders o on e.id = o.employee_id 
join products p on o.product_id = p.id 
group by e.name 
order by total_spent desc;


-- listar todos os produtos com o preço acima de 900
select * from products where price > 900


-- listar os funcionários com idade superior a 30 anos e salário acima de 5000
select * from employees where age > 30 and salary > 5000


-- listar todos os pedidos feitos por um determinado funcionário (com base no id do funcionário)
select * from orders 


-- calcular a média salarial dos funcionários por departamento
select department, avg(salary) from employees 
group by department 


-- listar os produtos vendidos no dia 2023-06-19
select * from products 
join orders on orders.product_id = products.id 
where order_date = '2023-06-19'


-- calcular o total de vendas por categoria de produto
select category, sum(quantity) 
from products 
join orders on orders.product_id = products.id 
group by category


-- listar os funcionários mais jovens de cada departamento
select * from employees
order by age asc


-- calcular a quantidade total de produtos vendidos por funcionário
select name, sum(quantity)
from employees
join orders on orders.employee_id = employees.id 
group by name


-- listar os funcionários que não fizeram nenhum pedido
select name, quantity
from employees 
left join orders on orders.employee_id = employees.id 
where quantity = 0


-- listar os funcionários e a quantidade de pedidos feitos por cada um deles, em
-- ordem decrescente da quantidade de pedidos
select name, quantity from employees 
join orders on orders.employee_id = employees.id 
order by quantity desc


SELECT e.name, COUNT(o.id) AS order_count
FROM employees e
LEFT JOIN orders o ON e.id = o.employee_id
GROUP BY e.id
ORDER BY order_count DESC;


-- listar os produtos que foram vendidos mais de duas vezes, juntamente com a quantidade 
-- total vendida de cada produto
select * from products

select name, sum(quantity) as quantity from products 
join orders on orders.product_id = products.id 
where quantity >= 2
group by name



-- PROCEDURES
-- criar um stored procedure chamado getEmployeeCount que retorne o número total de funcionários na 
-- tabela employees
create or replace procedure getEmployeeCount()
language plpgsql
as $$
begin 
	select count(id) from employees;	
end;$$


-- criar um procedimento armazenado chamado updateProductPrice que receba o id de um produto e um
-- novo preço como parâmetros, e atualize o preço desse produto na tabela Products
create or replace procedure updateProductPrice(product_id int, product_price decimal(10, 2))
language plpgsql
as $$
begin 
	update products set price = product_price
	where id = product_id;
end;$$



-- criar o procedimento armazenado chamado calculateOrderTotal que receba o id de um pedido como 
-- parâmetro e calcule o valor total desse pedido (quantidade * preço) e atualize o campo total na 
-- tabela orders
select * from orders

create or replace procedure calculateOrderTotal(order_id int)
language plpgsql
as $$
declare 
	total_order decimal(10,2);
begin 
	select (quantity * price) into total_order
	from orders
	join products on orders.product_id = products.id 
	where orders.id = order_id;
	
	update orders 
	set total = total_order
	where id = order_id;
end;$$


-- TRIGGERS
-- criar um trigger chamado updateEmployeeCount que seja adicionado sempre que um novo funcionário for
-- inserido na tabela employees e atualize o número total de funcionários numa tabela de controlo separada
create or replace function updateEmployeeCount()
returns trigger 
as 
$$
begin 
	if TG_OP = 'insert' then
		update employeeCountTable
		set total_employees = total_employees + 1;
	end if;
	return new;
end;$$


create trigger updateEmployeeCountTrigger
after insert on employees
for each row execute updateEmployeeCount();































































