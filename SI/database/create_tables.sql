

create table funcionario( 
 num int primary key, 
 nome varchar(255) not null, 
 idade int not null
);


create table tarefa( 
 	id int primary key, 
 	nome varchar(255) not null
);


create table funcionario_tarefa( 
 	num_func int references Funcionario, 
 	id_tarefa int references Tarefa, 
	primary key(num_func, id_tarefa) 
);


--------------------------------------------------------

create table produtos (
    id serial primary key,
    nome varchar(100),
    preco decimal(10, 2),
    quantidade int
);

create table clientes (
    id serial primary key,
    nome varchar(100),
    email varchar(100),
    telefone varchar(20)
);

create table pedidos (
    id serial primary key,
    cliente_id int references clientes(id),
    produto_id int references produtos(id),
    quantidade int,
    data_pedido date
);


drop table produtos;
drop table clientes;
drop table pedidos;
































