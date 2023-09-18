begin;
create table PESSOA (
	id integer primary key,
	noident char(12) unique not null,
	nif char(12) unique not null,
	nproprio varchar(10) not null,
	apelido varchar(15) not null,
	morada varchar(150) not null,
	codpostal integer check (codpostal <= 9999999) not null,
	localidade varchar(150) not null,
	atrdisc char(2) check ( atrdisc like '%P%' or atrdisc like '%C%' or atrdisc like '%CL%' ) not null
);

create table TIPOVEICULO (
	tipo integer primary key,
	nlugares integer check ( 0 < nlugares and nlugares <= 8 ) not null,
	multiplicador numeric(1) not null,
	designacao char(10) check ( designacao like '%Luxo%' or designacao like '%Normal%' or designacao like '%XL%' ) not null
);

create table PROPRIETARIO (
	idpessoa integer primary key,
	foreign key (idpessoa) references PESSOA(id),
	dtnascimento date not null
);

create table VEICULO (
	id integer primary key,
	matricula varchar(10) unique not null,
	tipo integer not null,
	foreign key (tipo) references TIPOVEICULO(tipo),
	modelo varchar(10) not null,
	marca varchar(10) not null,
	ano integer check (ano > 0) not null,
	proprietario integer not null,
	foreign key (proprietario) references PROPRIETARIO(idpessoa	)
);

create table CONDUTOR (
	idpessoa integer primary key,
	foreign key (idpessoa) references PESSOA(id),
	ncconducao varchar(20) not null,
	dtnascimento date not null
);

create table CONDUTORHABILITADO (
	condutor integer,
	foreign key (condutor) references CONDUTOR(idpessoa),
	veiculo integer,
	foreign key (veiculo) references VEICULO(id),
	primary key (condutor, veiculo)
);

create table CONTACTO(
	idpessoa integer,
	foreign key (idpessoa) references PESSOA(id),
	ntelefone varchar(15) check (ntelefone like '+%'),
	primary key (idpessoa, ntelefone)
);

create table CORVEICULO(
	veiculo integer,
	foreign key (veiculo) references VEICULO(id),
	cor varchar(10),
	primary key (veiculo, cor)
);

create table PERIODOACTIVO(
	veiculo integer,
	foreign key (veiculo) references VEICULO(id),
	condutor integer,
	foreign key (condutor) references CONDUTOR(idpessoa),
	dtinicio timestamp,
	primary key (veiculo, condutor, dtinicio),
	dtfim timestamp,
	lat decimal(6,2) not null,
	long decimal (6,2) not null
);

create table VIAGEM(
	idsistema integer primary key not null,
	hinicio time not null,
	hfim time,
	dtviagem date not null,
	valestimado decimal(5,2) not null,
	valfinal decimal(5,2),
	latinicio decimal(6,2) not null,
	longinicio decimal(6,2) not null,
	latfim decimal(6,2),
	longfim decimal(6,2),
	classificacao integer check (classificacao >= 1 and classificacao <= 5) not null,
	veiculo integer not null,
	condutor integer not null,
	dtinicio timestamp not null,
	foreign key (veiculo, condutor, dtinicio) references PERIODOACTIVO(veiculo, condutor, dtinicio)
);

create table CLIENTEVIAGEM(
	idpessoa integer,
	foreign key (idpessoa) references PESSOA(id),
	viagem integer,
	foreign key (viagem) references VIAGEM(idsistema),
	primary key (idpessoa, viagem)
);
commit;

