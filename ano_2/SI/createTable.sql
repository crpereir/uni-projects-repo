begin

create table JOGADOR(
	id 	serial,
	username	varchar not null unique,
	email	varchar not null unique,
	estado	varchar constraint st check (estado in ('Ativo', 'Inativo', 'Banido')) not null,
	regiao	varchar constraint rg check (regiao in ('Europa', 'Oceania', 'America', 'Africa', 'Asia'))not null,
	primary key (id)
); 

create table JOGOS(
	idt	varchar(10) not null check (idt like '__________'),
	nome	varchar not null unique,
	url	varchar not null,
	primary key (idt)
);

create table COMPRA (
	idjogador	integer not null,
	idtjogo	varchar(10) check (idtjogo like '__________') not null,
	dt	date not null,
	preco	decimal(5,2) not null,
	primary key (idjogador, idtjogo),
	foreign key (idjogador) references JOGADOR (id) ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (idtjogo) references JOGOS(idt) ON DELETE CASCADE ON UPDATE CASCADE
);

create table PARTIDA (
	nr 	serial not null unique,
	dtinicio	date not null,
	dtfim	date CHECK(dtfim >= dtinicio),
	hinicio	time not null,
	hfim	time,
	regiao	varchar constraint rg check (regiao in ('Europa', 'Oceania', 'America', 'Africa', 'Asia')) not null,
	primary key (nr)
);

create table JOGAR (
	idjogo varchar(10) not null check (idjogo like '__________'),
	nrpartida int,
	primary key (idjogo, nrpartida),
	foreign key (idjogo) references JOGOS(idt) ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (nrpartida) references PARTIDA(nr) ON DELETE CASCADE ON UPDATE CASCADE
);

create table PARTIDANORMAL(
	nr	integer not null,
	id	integer not null,
	dificuldade	integer check (dificuldade BETWEEN 1 AND 5) not null,
	pontuacao	integer not null,
	primary key (nr, id),
	foreign key  (nr) references PARTIDA (nr) ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (id) references JOGADOR (id) ON DELETE CASCADE ON UPDATE CASCADE
);

create table PARTIDAMULTIJOGADOR (
	nr	integer not null,
	estado	varchar CONSTRAINT st check (estado in ('Por iniciar', 'A aguardar jogadores', 'Em curso', 'Terminada')) not null,
	primary key (nr),
	foreign key (nr) references PARTIDA (nr) ON DELETE CASCADE ON UPDATE CASCADE
);

create table PONTUACAOMULTIJOGADOR (
	id	integer not null,
	nr	integer not null,
	pontuacao	integer not null,
	primary key (nr, id),
	foreign key (nr) references PARTIDA (nr) ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (id) references JOGADOR (id) ON DELETE CASCADE ON UPDATE CASCADE
);

create table CRACHA (
	idt	varchar(10) not null check (idt like '__________'),
	nome	varchar not null,
	url_img	varchar not null,
	lim_pontos	integer not null,
	primary key (idt, nome),
	foreign key (idt) references JOGOS (idt) ON DELETE CASCADE ON UPDATE CASCADE
	--foreign key (id, username, email) references JOGADOR (id, username, email) ON DELETE CASCADE ON UPDATE CASCADE
);

create table CONVERSA (
	idnt	serial not null,
	nome	varchar not null,
	primary key (idnt)
);

create table MENSAGENS (
	nr	serial not null unique,
	id_jogador int not null,
	dt	date not null,
	hora	time not null,
	texto	varchar not null,
	idnt	integer not null,
	primary key (nr, idnt, id_jogador),
	foreign key (idnt) references CONVERSA (idnt) ON DELETE CASCADE ON UPDATE cascade,
	foreign key (id_jogador) references JOGADOR (id) ON DELETE CASCADE ON UPDATE CASCADE
);

create table ASSOCIARCRACHA (
    id integer,
    idt varchar(10) not null,
    nome varchar not null,
    primary key (id, idt, nome),
    --foreign key (id) references JOGADOR (id) ON DELETE CASCADE ON UPDATE cascade,
	foreign key (idt, nome) references CRACHA (idt, nome) ON DELETE CASCADE ON UPDATE CASCADE
);

create table CRIARCONVERSA(
	jogador_id integer,
    conversa_id integer unique,
    primary key (jogador_id, conversa_id),
    foreign key (conversa_id) references CONVERSA (idnt) ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (jogador_id) references JOGADOR (id) ON DELETE CASCADE ON UPDATE CASCADE
);

create table JUNTARCONVERSA (
    jogador_id integer,
    conversa_id integer,
    primary key (jogador_id, conversa_id),
    foreign key (conversa_id) references CONVERSA (idnt) ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (jogador_id) references JOGADOR (id) ON DELETE CASCADE ON UPDATE CASCADE
);

commit;