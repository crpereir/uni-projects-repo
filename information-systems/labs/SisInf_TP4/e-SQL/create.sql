/*
 *   ISEL-DEETC-SisInf
 *   ND 2024
 *
 *   Didactic material to support the course
 *   Information Systems
 *   
 */

drop table if exists store;
drop table if exists person;

/* create table */
create table if not exists person( 
	id serial primary key,
	name varchar(40) not null,
	address varchar(150) not null,
	email varchar(40) unique,
	phone varchar(30) unique,
	pin char(12) unique, -- personal identification number
	nationality varchar(20) not null,
	atrdisc char(2) not null constraint person_disc check (atrdisc in ('C','G'))
);


create table if not exists store( 
	code integer primary key,
	email varchar(40) unique,
	address varchar(100) not null,
	city varchar(30) not null,
	manager integer,
	constraint loj_manager foreign key(manager) references person(id)
);

/* populate */

INSERT INTO person (name, address, email, phone, pin, nationality, atrdisc) VALUES
    ('John Doe', '123 Main St, City1', 'john.doe@email.com', '1234567890', 'A123456789', 'USA', 'C'),
    ('Jane Smith', '456 Elm St, City2', 'jane.smith@email.com', '9876543210', 'B987654321', 'Canada', 'G'),
    ('Alice Johnson', '789 Oak St, City3', 'alice.johnson@email.com', '1112223333', 'C111222333', 'UK', 'C'),
    ('Bob Brown', '555 Pine St, City4', 'bob.brown@email.com', '4445556666', 'D444555666', 'Australia', 'G'),
    ('Eva Davis', '999 Cedar St, City5', 'eva.davis@email.com', '7778889999', 'E777888999', 'France', 'C'),
    ('David Lee', '222 Birch St, City6', 'david.lee@email.com', '3331119999', 'F333111999', 'Germany', 'G'),
    ('Maria Garcia', '333 Willow St, City7', 'maria.garcia@email.com', '5556667777', 'G555666777', 'Spain', 'C'),
    ('Michael Martin', '777 Redwood St, City8', 'michael.martin@email.com', '6667778888', 'H666777888', 'Italy', 'G'),
    ('Sophia White', '888 Aspen St, City9', 'sophia.white@email.com', '111222333', 'I111222333', 'Portugal', 'C'),
    ('William Harris', '111 Sequoia St, City10', 'william.harris@email.com', '222333', 'J222333444', 'Brazil', 'G');
   
   
INSERT INTO store (code, email, address, city, manager) VALUES
    (1, 'store1@example.com', 'Store Address 1', 'City 1', 2),
    (2, 'store2@example.com', 'Store Address 2', 'City 2', 4),
    (3, 'store3@example.com', 'Store Address 3', 'City 3', 6),
    (4, 'store4@example.com', 'Store Address 4', 'City 4', 8);