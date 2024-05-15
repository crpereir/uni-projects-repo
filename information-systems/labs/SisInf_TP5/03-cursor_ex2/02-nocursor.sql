--TODO
-- Without using a cursor (use only an update statement)
-- create a script that updates the balance of accounts by 10% of the age of their owners, but only for customers over 65 

update public.account as a
set balance = a.balance + (c.age * 0.1)::money
from public.client as c
where a.client = c.id
and c.age > 65;

