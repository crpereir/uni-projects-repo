create table students (
    id serial primary key,
    name varchar(100),
    age int,
    grade float
);

insert into students (name, age, grade) values 
('John', 20, 3.5), 
('Jane', 22, 3.7), 
('Bob', 21, 3.2), 
('Alice', 20, 3.8)
('Charlie', 23, 3.9),
('David', 20, 3.1),
('Eve', 22, 3.6),
('Frank', 21, 3.3),
('Grace', 20, 3.4),
('Helen', 22, 3.5),
('Ivan', 21, 3.6),
('Judy', 20, 3.7),
('Kevin', 22, 3.8),
('Linda', 21, 3.9),
('Mary', 20, 4.0),
('Nancy', 22, 4.1),
('Oscar', 21, 4.2),
('Peter', 20, 4.3),
('Quincy', 22, 4.4),
('Roger', 21, 4.5),
('Sally', 20, 4.6),
('Tom', 22, 4.7),
('Ursula', 21, 4.8),
('Victor', 20, 4.9),
('Wendy', 22, 5.0),
('Xavier', 21, 5.1),
('Yvonne', 20, 5.2),
('Zack', 22, 5.3),
('Walter', 21, 5.4),
('Violet', 20, 5.5),
('Ulysses', 22, 5.6),
('Tina', 21, 5.7),
('Simon', 20, 5.8),
('Rita', 22, 5.9),
('Quincy', 21, 6.0),
('Paul', 20, 6.1),
('Oscar', 22, 6.2),
('Nancy', 21, 6.3),
('Mary', 20, 6.4),
('Linda', 22, 6.5),
('Kevin', 21, 6.6),
('Judy', 20, 6.7),
('Ivan', 22, 6.8),
('Helen', 21, 6.9),
('Frank', 20, 7.0),
('Eve', 22, 7.1),
('David', 21, 7.2),
('Charlie', 20, 7.3),
('Bob', 22, 7.4),
('Jane', 21, 7.5),
('John', 20, 7.6);


create index idx_students_age
on students (age);

drop index idx_students_age;
drop table students;

set enable_seqscan = off;
explain analyze select * from students where age = 20;


create table orders (
    id serial primary key,
    customer_id int,
    product_id int,
    order_date date,
    quantity int
);

insert into orders (customer_id, product_id, order_date, quantity) values
(1, 1, '2022-01-01', 1),
(1, 2, '2022-01-02', 2),
(1, 3, '2022-01-03', 3),
(2, 1, '2022-01-01', 1),
(2, 2, '2022-01-02', 2),
(2, 3, '2022-01-03', 3),
(3, 1, '2022-01-01', 1),
(3, 2, '2022-01-02', 2),
(3, 3, '2022-01-03', 3),
(4, 1, '2022-01-01', 1),
(4, 2, '2022-01-02', 2),
(4, 3, '2022-01-03', 3),
(5, 1, '2022-01-01', 1),
(5, 2, '2022-01-02', 2),
(5, 3, '2022-01-03', 3),
(6, 1, '2022-01-01', 1),
(6, 2, '2022-01-02', 2),
(6, 3, '2022-01-03', 3),
(7, 1, '2022-01-01', 1),
(7, 2, '2022-01-02', 2),
(7, 3, '2022-01-03', 3),
(8, 1, '2022-01-01', 1),
(8, 2, '2022-01-02', 2),
(8, 3, '2022-01-03', 3),
(9, 1, '2022-01-01', 1),
(9, 2, '2022-01-02', 2),
(9, 3, '2022-01-03', 3),
(10, 1, '2022-01-01', 1),
(10, 2, '2022-01-02', 2),
(10, 3, '2022-01-03', 3);

create index idx_orders_customer_id
on orders (customer_id);

drop index idx_orders_customer_id;
explain analyze select * from orders where customer_id = 1;

create index idx_orders_order_date
on orders (order_date);

drop index idx_orders_order_date;
explain analyze select * from orders where order_date = '2022-01-01';