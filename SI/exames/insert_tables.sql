
insert into employees (name, age, department, salary)
values ('John Doe', 35, 'IT', 5000.00),
       ('Jane Smith', 28, 'HR', 4500.00),
       ('Michael Johnson', 42, 'Sales', 6000.00),
       ('Emily Davis', 31, 'Marketing', 5500.00);

      
insert into products (name, category, price)
values ('iPhone', 'tecnology', 899.99),
       ('Computer', 'tecnology', 1299.99),
       ('Television', 'information', 1499.99),
       ('Airpods', 'accessories', 199.99);

      
insert into orders (employee_id, product_id, quantity, order_date)
values (1, 1, 2, '2023-06-15'),
       (1, 3, 1, '2023-06-18'),
       (2, 2, 1, '2023-06-17'),
       (3, 4, 3, '2023-06-19'),
       (4, 1, 2, '2023-06-15');
