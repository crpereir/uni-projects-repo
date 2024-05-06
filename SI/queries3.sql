
drop table if exists sales;
drop table if exists employees;

create table employees (
	id int primary key,
	salary decimal(10,2),
	years_of_service int
);

create table sales (
	id int primary key,
	employee_id int references employees(id),
	sales decimal(10,2)
);

insert into employees (id, salary, years_of_service) values
	(1, 50000, 5),
	(2, 60000, 3),
	(3, 70000, 2);

insert into sales (id, employee_id, sales) values
	(1, 1, 10000),
	(2, 1, 20000),
	(3, 2, 15000),
	(4, 3, 25000);
	

create or replace function total_sales(emp_id int)
returns int
as $$
declare
	total_sales int;
begin 
	if exists (select 1 from employees where id = emp_id) then
		select sum(sales) into total_sales from sales where employee_id = emp_id;
		return total_sales;
	else 
		total_sales := 0;
		return total_sales;
	end if;
end; $$
language plpgsql;


select total_sales(1);
select total_sales(4);

create or replace procedure update_salary(emp_id int, performance int)
as $$
declare 
	increase_percent decimal;
begin 
	if perfomance = 5 then
		increase_percent := 0.15;
	elsif performance = 4 then
		increase_percent := 0.10;
	else 
		increase_percent := 0.05;
	end if;

	update employees set salary = salary + salary * increase_percent
	where id = emp_id;

end; $$
language plpgsql;




do $$
declare
	cur cursor for select * from employees;
	employee record;
	i int;
begin
	for employee in cur loop
		for i in 1..employee.years_of_service loop
			employee.salary := employee.salary + employee.salary * 0.1;
		end loop;

		update employees set salary = employee.salary
		where id = employee.salary;

	end loop;
end;$$
language plpgsql;


























































