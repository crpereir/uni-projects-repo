create table condutor( 
 cId serial primary key, 
 cNome varchar(50) 
); 

create table veiculoLigeiro( 
 vlId serial primary key, 
 vlMatricula char(10) not null unique, 
 vlCilindrada int not null, 
 vlLugares int not null default 5, 
 vlCondutor int references condutor 
);

create table veiculoPesado( 
 vlId serial primary key, 
 vlMatricula char(10) not null unique, 
 vlCilindrada int null, 
 vlTara int not null, 
 vlCondutor int references condutor 
);


drop table veiculopesado;
drop table veiculoligeiro;
drop table condutor;