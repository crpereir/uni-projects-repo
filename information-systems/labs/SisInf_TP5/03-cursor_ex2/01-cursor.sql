--TODO
-- Using cursors
-- create a script that updates the balance of accounts by 10% of the age of their owners, but only for customers over 65 

do $$
declare
    client_id int;
    client_age int;
    account_id int;
    account_balance money;
    age_bonus money;
    cur_cursor cursor for
        select c.id as client_id, c.age as client_age, a.id as account_id, a.balance as account_balance
        from public.client c
        join public.account a on c.id = a.client
        where c.age > 65;
begin
    open cur_cursor;
    loop
        fetch cur_cursor into client_id, client_age, account_id, account_balance;
        exit when client_id is null;
        
        -- Calculate age bonus (10% of client's age)
        age_bonus := client_age * 0.1;
        
        -- Update account balance
        update public.account
        set balance = balance + age_bonus
        where id = account_id;
    end loop;
    close cur_cursor;
end $$;
