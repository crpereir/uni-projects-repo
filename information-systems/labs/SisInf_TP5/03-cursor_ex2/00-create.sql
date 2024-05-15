
start transaction;
drop table if exists public.account;
drop table if exists public.client;

create table public.client
(
	id serial primary key,
	"name" varchar(100) not null,
	age int not null check (age between 0 and 120),
	"date" timestamp with time zone not null default now()
);

select * from client;
select * from account;

create table public.account
(
	id serial primary key,
	"description" varchar(100) not null,
	balance money not null,
	client int not null references client,
	updated timestamp with time zone null
);

-- Populate Clients
do
$$
declare i int;
declare age int;
declare n varchar(100);
declare ncli int := 100000; 
begin
    FOR i IN 0..ncli BY 1 LOOP 
        age := floor(random() * 120 + 1)::int;
        n := 'Client ' || i::varchar(10);
        insert into client("name",age,"date") values(n,age,now());
    END LOOP;
end 
$$ language plpgsql;

--Populate Accounts
do
$$
declare acc int := 1000;
declare n int := 3;
declare idcli int;
declare "desc" varchar(100);
declare aux int; 
declare balance money;
begin
    FOR i IN 0..acc BY 1 LOOP 
        aux := floor(random() * n)::int;
        idcli := floor(random() * (select max(id) from client) + 1)::int;
        FOR j IN 0..aux BY 1 LOOP 
            "desc" := 'Account no. ' || j::varchar(10);
            balance := floor(random() * 100000);
            insert into account("description", balance,client,updated) values("desc",balance,idcli,now());
            
        END LOOP;
    END LOOP;
end 
$$ language plpgsql;


commit;