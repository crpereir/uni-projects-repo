/*
 *   ISEL-DEETC-SisInf
 *   MP 2024
 *
 *   Didactic material to support the course
 *   Information Systems
 *   
 */
/* drop table */
drop table if exists loja;
drop table if exists pessoa;

/* create table */

create table if not exists pessoa( 
id serial primary key,
nome varchar(40) not null,
morada varchar(150) not null,
email varchar(40) unique,
telefone varchar(30) unique,
noident char(12) unique,
nacionalidade varchar(20) not null,
atrdisc char(2) not null constraint pess_disc check (atrdisc in ('C','G'))
);


create table if not exists loja( 
codigo integer primary key,
email varchar(40) unique,
endereco varchar(100) not null,
localidade varchar(30) not null,
gestor integer,
constraint loj_gestor foreign key(gestor) references pessoa(id)
);
