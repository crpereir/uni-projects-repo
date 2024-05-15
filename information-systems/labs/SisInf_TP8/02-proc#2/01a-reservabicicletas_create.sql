/*
 *   ISEL-DEETC-SisInf
 *   MP 2022-2024
 *
 *   Didactic material to support the course
 *   Information Systems
 *
 */

/* drop table */
drop table if exists clientereserva;
drop table if exists telefoneloja;
drop table if exists reserva;
drop table if exists electrica;
drop table if exists classica;
drop table if exists bicicleta;
drop table if exists dispositivo;
drop table if exists loja;
drop table if exists pessoa;

/* create table */

create table if not exists pessoa( 
id serial primary key,
nome varchar(40) not null,
morada varchar(150) not null,
email varchar(300) unique ,
telefone varchar(30) unique,
noident char(12) unique,
nacionalidade varchar(20) not null,
atrdisc char(2) not null constraint pess_disc check (atrdisc in ('C','G'))
);


create table if not exists loja( 
codigo integer primary key,
email varchar(300) unique ,
endereco varchar(100) not null,
localidade varchar(30) not null,
gestor integer,
constraint loj_gestor foreign key(gestor) references pessoa(id)
);


create table if not exists dispositivo( 
noserie integer primary key,
latitude numeric(6,4) not null,
longitude numeric(6,4) not null,
bateria integer constraint disp_bateria check (bateria >=0 and bateria<=100) 
);


create table if not exists bicicleta( 
id integer primary key,
peso numeric(4,2) not null,
raio integer constraint bic_raio check (raio >= 13 and raio <= 23),
modelo varchar(20) not null,
marca varchar(30) not null,
mudanca integer constraint bic_mudanca check (mudanca in (1, 6, 18, 24)),
estado varchar(30) not null constraint bic_estado check (estado in ('livre', 'ocupado','em manutencao')),
atrdisc char(2) not null constraint bic_disc check (atrdisc in ('C','E')),
dispositivo integer,
constraint bic_dispositivo foreign key (dispositivo) references dispositivo(noserie) 
);

create table if not exists classica( 
bicicleta integer primary key,
nomudanca integer not null constraint class_nomud check (nomudanca >= 0 and nomudanca <= 5),
constraint class_bic foreign key (bicicleta) references bicicleta(id)
);

create table if not exists electrica( 
bicicleta integer primary key, 
autonomia integer not null constraint elec_autonomia check (autonomia >= 0),
velocidade integer not null constraint elec_velocidade check (velocidade >= 0),
constraint class_bic foreign key (bicicleta) references bicicleta(id)
);

create table if not exists reserva( 
noreserva integer,
loja integer,
dtinicio timestamp not null,
dtfim timestamp constraint res_dtfim check (dtfim > dtinicio),
valor numeric(4,2) not null,
bicicleta integer,
primary key (noreserva,loja),
constraint res_date unique(dtinicio,dtfim,bicicleta), 
constraint res_loja foreign key (loja) references loja(codigo),
constraint res_bicicleta foreign key (bicicleta) references bicicleta(id)
);

create table if not exists telefoneloja( 
loja integer,
notelefone varchar(10),
primary key (loja,notelefone),
constraint tel_loja foreign key (loja) references loja(codigo)
);

create table if not exists clientereserva( 
cliente integer,
reserva integer,
loja  integer,
primary key (cliente, reserva, loja),
constraint cres_cliente foreign key (cliente) references pessoa(id),
constraint cres_reserva foreign key (reserva,loja) references reserva(noreserva,loja)
);