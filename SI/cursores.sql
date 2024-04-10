
drop table if exists employees;
drop table if exists department;

------------------------------------------------------------------------------

create table employees (
    id serial primary key,
    name varchar(50),
    salary int, 
    department_id int references departments
);

create table department (
    id serial primary key,
    name varchar(50)
);

------------------------------------------------------------------------------

insert into department (name) values
    ('corridas'),
    ('oficina'),
    ('reforma');
    
insert into employees (name, salary, department_id) values 
    ('Faisca', 5000, '1'),
    ('Matte', 6000, '2'),
    ('Sally', 7000, '1'),
    ('Doc Hudson', 8000, '3'),
    ('Luigi', 6000, '2'),
    ('Guido', 6000, '2'),
    ('Fillmore', 6500, '1'),
    ('Ramone', 4000, '1'),
    ('Flo', 6000, '1'),
    ('Sheriff', 7500, '3');

------------------------------------------------------------------------------
-- cursor que seleciona todos os registos de uma tabela 
do $$
declare 
    cur cursor for select * from employees;
    reg employees%ROWTYPE;

begin
    open cur;
    loop
        fetch next from cur into reg;
        exit when not found;
        raise notice 'data = %', reg;
    end loop;
    close cur;
end;$$

------------------------------------------------------------------------------
-- cursor com parametros
-- cursor que seleciona registos de uma tabela onde o salário é maior do que um
-- valor especifico

do $$
declare 
    salary_limit numeric := 6500;
    cur cursor for select * from employees where salary >= salary_limit;
    reg employees%ROWTYPE;
begin 
    open cur;
    loop    
        fetch next from cur into reg;
        exit when not found;
        raise notice '%', reg;
    end loop;
    close cur;
end; $$

----------------------------------------------------------------------------

do $$
declare 
	i departments%ROWTYPE;
	cur cursor (dept_id integer) for select e.name from employees e where e.department_id = dept_id;
	employee_name text;
begin
    for i in select * from departments loop	
        open cur(i.id);
        loop
            fetch next from cur into employee_name;
            exit when not found;
            raise notice 'department: %', i.name;
            raise notice 'employee: %', employee_name;
        end loop;
        close cur;
    end loop;
end; $$
	
----------------------------------------------------------------------------
--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- cursor que percorre todos os registos na tabela employees e escreve o 
-- nome de cada funcionario

do $$
declare 
    cur cursor for select name from employees;
    employee_name text;
begin
    open cur;
    loop
        fetch next from cur into employee_name;
        exit when not found;
        raise notice '%', employee_name;
    end loop;
    close cur;
end;$$

----------------------------------------------------------------------------
-- cursor que aceita um argumento de salário e escreve o nome de todos os 
-- employees que ganham mais do que esse salário

do $$
declare
    cur cursor(salary_limit integer) for select name from employees where salary > salary_limit;
    employee_name text;

begin
    open cur(6500);
    loop    
        fetch next from cur into employee_name;
        exit when not found;
        raise notice 'nome = %', employee_name;
    end loop;
    close cur;
end; $$
	
----------------------------------------------------------------------------
-- cursor que aceita um argumento de salário e escreve o nome de todos os 
-- funcionários que ganham mais do que esse salário, agrupados por departamento

do $$
declare
    depart departments%ROWTYPE;
    employee_name text;
    cur cursor(salary_limit integer, dep_id integer) for 
        select name 
        from employees 
        where department_id = dep_id and salary > salary_limit;
begin
    for depart in select * from departments loop
        open cur(5000, depart.id);
        loop
            fetch next from cur into employee_name;
            exit when not found;
            raise notice '%', employee_name;
        end loop;
        close cur;
    end loop;
end; $$


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	