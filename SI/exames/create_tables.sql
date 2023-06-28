create table employees (
	id serial primary key,
	name varchar(50),
	age integer,
	department varchar(50),
	salary decimal(10,2)
);

create table products (
	id serial primary key,
	name varchar(50),
	category varchar(50),
	price decimal(10, 2)
);

create table orders (
	id serial primary key,
	employee_id integer,
	product_id integer,
	quantity integer,
	order_date date
);

create table funcionario
