
drop table if exists sales;
drop table if exists employees;
drop table if exists departments;

create table departments (
    id serial primary key,
    name varchar(100),
    budget decimal(10, 2)
);

create table employees (
    id serial primary key,
    name varchar(100),
    salary decimal(10, 2),
    department_id int references departments(id),
    sales int
);

create table sales (
    id serial primary key,
    employee_id int references employees(id),
    amount decimal(10, 2),
    sale_date date
);


insert into departments (name, budget) values 
	('Marketing', 50000),
	('Sales', 60000),
	('HR', 40000);

insert into employees (name, salary, department_id, sales) values 
	('John Doe', 5000, 1, 10000),
	('Jane Smith', 6000, 2, 15000),
	('Bob Johnson', 7000, 3, 20000);

insert into sales (employee_id, amount, sale_date) values 
	(1, 5000, '2022-01-01'),
	(2, 6000, '2022-02-01'),
	(3, 7000, '2022-03-01');
	


create or replace function employee_salary(employee_id int)
returns int 
as $$
declare 
	employee_salary int;
begin 
	select salary into employee_salary from employees where id = employee_id;
	return employee_salary;
end;$$
language plpgsql;

select employee_salary(2);

drop function if exists total_sales;
create or replace function total_sales(employee_id int)
returns int
as $$
declare 
	total_sales int;
begin
	select sales into total_sales from employees where id = employee_id;
	return total_sales;
end;$$
language plpgsql;

select total_sales(2);


create or replace function total_employees(depart_id int)
returns int
as $$
declare 
	total_employees int;
begin
	select count(department_id) into total_employees from employees where department_id = depart_id;
	return total_employees;
end;$$
language plpgsql;

select total_employees(1);

create or replace procedure change_department(employee_id int, new_department int)
as $$
begin 
	update employees set department_id = new_department where id = employee_id;
end;$$
language plpgsql;

call change_department(3,2);
select * from employees


drop function if exists max_salary;
create or replace function max_salary(depart_id int)
returns text
as $$
declare 
	employee_name text;
begin 
	select name into employee_name
	from employees 
	where department_id = depart_id
	order by salary desc
	limit 1;
	return employee_name;
end;$$
language plpgsql;

select * from employees;
select max_salary(1);



create or replace procedure salary_bonus(depart_id int, threshold int)
as $$
declare 
	total_vendas int;
begin
	-- calcular as vendas de um departamento
	select sum(amount) into total_vendas
	from sales s join employees e on s.employee_id = e.id
	where e.department_id = depart_id;
	
	-- se exceder aumenta, se nao exceder mantém
	if total_vendas > threshold then
		update employees set salary = salary + salary * 0.1
		where department_id = depart_id;
	end if;
end;$$
language plpgsql;

call salary_bonus (1, 6000)

do $$
declare 
	cur cursor for select * from employees;
	employee_info record;
begin 
	open cur;
	loop
		fetch next from cur into employee_info;
		exit when not found;
		raise notice 'info = %', employee_info;
	end loop;
	close cur;
end; $$
language plpgsql;


create or replace function total_vendas_department(depart_id int)
returns int
as $$
declare 
	total_vendas int;
begin
	select sum(sales) into total_vendas 
	from employees 
	where department_id = depart_id;
	return total_vendas;
end;$$
language plpgsql;

select * from employees;
select total_vendas_department(1);

create or replace procedure upgrade_salary()
as $$
declare
	cur cursor for select salary from employees;
	i int;
begin 
	for i in cur loop
		update employees set salary = salary + salary * 0.1;
	end loop;
end;$$
language plpgsql;

call upgrade_salary();
select * from employees;


create or replace function min_salary(depart_id int)
returns varchar(100)
as $$
declare 
	employee_name varchar(100);
begin
	select name into employee_name 
	from employees
	where department_id = depart_id
	order by salary asc
	limit 1;
	return employee_name;
end;$$
language plpgsql;

select * from employees;
select min_salary(1)



create or replace procedure promotion(depart_id int)
as $$
declare 
	employee_name varchar(100);
begin
	-- saber o empregado com maior número de vendas 
	select name into employee_name
	from employees
	where department_id = depart_id
	order by sales desc
	limit 1;

	-- fazer upgrade do salario
	update employees set salary = salary + salary * 0.2 
	where name = employee_name;

end;$$
language plpgsql;


call promotion(1);
select * from employees;


create or replace function departments_info()
returns void 
as $$
declare
	department_info record;
	cur cursor for select * from departments;
begin
	open cur;
	loop
		fetch next from cur into department_info;
		exit when not found;
		raise notice '%', department_info;
	end loop;
	close cur;
end;$$
language plpgsql;


select departments_info();


create or replace function demission(start_date date, end_date date)
returns int
as $$
declare
	total_sales int;
begin
	select sum(sales) into total_sales
	from employees e join sales s on e.id = s.employee_id
	where s.sale_date between start_date and end_date;
	return total_sales; 
end;$$
language plpgsql;

select * from employees;
select demission('2021-01-01', '2023-01-01')


create or replace procedure total(start_date date, end_date date)
as $$
declare 
	emp_id int;
	total_vendas int;
begin
	-- fazer a seleção dos empregados que não fizeram vendas
	select count(sales) into total_vendas 
	from employees e join sales s on e.id = s.employee_id
	where s.sale_date between start_date and end_date;
	
	-- demitir o empregado
	delete from sales where employee_id = emp_id;

	delete from employees where name not in (
		select id from employees group by id having count(sales) < total_vendas
	);
end;$$
language plpgsql;


select * from employees;
call total('2019-01-01', '2020-01-01')


create or replace function upgrade_budget()
returns void
as $$
declare 
	cur cursor for select budget from departments;
	i int;
begin 
	for i in cur loop
		update departments set budget = budget + budget * 0.1;
	end loop;
end; $$
language plpgsql;


select * from departments;
select upgrade_budget();


drop function if exists most_populate_department;
create or replace function most_populate_department()
returns varchar(100)
as $$
declare 
	department_name varchar(100);
begin
	select d.name into department_name from departments d join employees e on d.id = e.department_id 
	where d.id = e.department_id
	group by d.name
	limit 1;
	return department_name;
end;$$
language plpgsql;

select most_populate_department();
select * from employees;


create or replace function sales_info()
returns void 
as $$
declare
	cur cursor for select * from sales;
	sales_info record;
begin
	open cur;
	loop
		fetch next from cur into sales_info;
		exit when not found;
		raise notice '%', sales_info;
	end loop;
	close cur;
end;$$
language plpgsql;


select sales_info()


select * from employees;


create or replace procedure change_employee_department()
as $$
declare
	employee_name varchar(100);
begin
	-- empregado com menor numero de vendas
	select name into employee_name from employees 
	order by sales asc
	limit 1;

	-- mudar de departamento
	if (select department_id from employees where department_id = 1 and name = employee_name) then
		update employees set department_id = 2 where department_id = 1;
	elsif (select department_id from employees where department_id = 2 and name = employee_name) then 
		update employees set department_id = 3 where department_id = 2;
	else 
		update employees set department_id = 1 where department_id = 3;
	end if;
end;$$
language plpgsql;

call change_employee_department(); 

select * from employees;




































