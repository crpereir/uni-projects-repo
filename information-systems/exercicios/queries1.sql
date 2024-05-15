

drop table if exists employees;
drop table if exists departments;

-- Cria a tabela departments
CREATE TABLE departments (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

-- Insere dados na tabela departments
INSERT INTO departments (id, name) VALUES (1, 'Departamento 1');
INSERT INTO departments (id, name) VALUES (2, 'Departamento 2');
INSERT INTO departments (id, name) VALUES (3, 'Departamento 3');

-- Cria a tabela employees
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    salary DECIMAL(10, 2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

-- Insere dados na tabela employees
INSERT INTO employees (id, name, salary, department_id) VALUES (1, 'Faisca', 5000.00, 1);
INSERT INTO employees (id, name, salary, department_id) VALUES (2, 'Matte', 6000.00, 2);
INSERT INTO employees (id, name, salary, department_id) VALUES (3, 'Sally', 7000.00, 3);

create table employees (
    id serial primary key,
    name varchar(50),
    salary int, 
    department_id int foreign key
);

insert into employees (name, salary) values
    ('Faisca McQueen', 10000),
    ('Doc Hudson', 8000),
    ('Mater', 6000),
    ('Sally Carrera', 7000),
    ('Ramone', 4000),
    ('Flo', 6000),
    ('Sheriff', 7500),
    ('Luigi', 5500),
    ('Guido', 5500),
    ('Fillmore', 6500);

create table departments (
    id serial primary key,
    name varchar(50)
);

insert into departments (name) values
    ('Vendas'),
    ('Marketing'),
    ('TI'),
    ('Recursos Humanos'),
    ('Financeiro'),
    ('Logística'),
    ('Produção'),
    ('Atendimento ao Cliente'),
    ('Jurídico'),
    ('Administração');

----------------------------------------------------------------------------------
-- Exercicio 1
-- Escreva uma consulta simples para selecionar todos os registros de uma tabela.

select * from employees;
select id, name, salary from employees;

----------------------------------------------------------------------------------
-- Exercicio 2
-- Selecione os funcionários com um salário superior a 5000.

select name, salary from employees where salary >= 5000;

----------------------------------------------------------------------------------
-- Exercicio 3
-- Selecione todos os funcionários ordenados pelo nome.

select name, salary from employees order by name asc;

----------------------------------------------------------------------------------
-- Exercicio 4
-- Calcule o total de salários pagos.

select count(salary) from employees; -- o count conta
select sum(salary) from employees    -- o sum soma os valores

----------------------------------------------------------------------------------
-- Exercicio 5
-- Calcule a média salarial por departamento.

alter table employees add column department_id int;
update employees set department_id = 2 where salary > 6000;
select * from employees;

select avg(salary) from employees group by department_id;

----------------------------------------------------------------------------------
-- Exercicio 6
-- Selecione os nomes dos funcionários e seus respectivos departamentos.

select e.name, d.name from employees e join departments d on e.department_id = d.id;

----------------------------------------------------------------------------------
-- Exercicio 7
-- Selecione os nomes dos funcionários com um salário superior a 5000 e seus 
-- respectivos departamentos.

select e.name, d.name from employees e join departments d on e.department_id = d.id 
where salary > 7000

----------------------------------------------------------------------------------
-- Exercicio 8
-- Selecione os departamentos com menos de 5 funcionários.

SELECT d.name
FROM departments d 
JOIN employees e ON d.id = e.department_id
GROUP BY d.name
HAVING COUNT(e.id) < 5;

select * from employees e 
----------------------------------------------------------------------------------
-- Exercicio 9
-- Selecione os funcionários que ganham mais que a média de seus departamentos.

select e.name from employees e join departments d on e.department_id = d.id 
where salary > (select avg(salary) from employees)

----------------------------------------------------------------------------------
-- Exercicio 10
-- Insira um novo funcionário na tabela e atualize o salário de outro.

insert into employees (name, salary) values ('Mate', '20000');
select * from employees e;

update employees set salary = 10000 where name = 'Sally Carrera';
select * from employees e;

----------------------------------------------------------------------------------
-- Exercicio 11
-- Use um cursor para iterar sobre os registros da tabela employees e exibir 
-- seus nomes.

----------------------------------------------------------------------------------
-- Exercicio 12
-- Use um cursor para iterar sobre os registros da tabela employees e exibir os 
-- nomes dos funcionários com salário superior a 5000.

----------------------------------------------------------------------------------
-- Exercicio 13
-- Crie uma função que retorne o número total de funcionários na tabela.
commit;
create or replace function total_func()
returns integer
language plpgsql
as $$
declare 
	total_count integer;
begin 
	select count(name) into total_count from employees;
	return total_count;
end;
$$; 

select total_func();

----------------------------------------------------------------------------------
-- Exercicio 14
-- Crie uma função que retorne o nome do departamento com o ID fornecido.

create or replace function depart_name(id_dep integer)
returns varchar(50)
language plpgsql
as $$
declare name_depart varchar(50);
begin 
	select name into name_depart from departments d where d.id = id_dep;
	return name_depart;
end;
$$;

select depart_name(1);
select depart_name(2);


----------------------------------------------------------------------------------
-- Exercicio 15
-- Crie uma função que utilize um cursor para calcular a soma dos salários de 
-- todos os funcionários.


































