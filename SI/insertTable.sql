begin

insert into jogador (username, email, estado, regiao) values
	('ab', 'ab@gmail.com', 'Ativo', 'Europa'),	--
	('bc', 'bc@hotmail.com', 'Banido', 'Asia'),	--
	('cd', 'cd@gmail.com', 'Ativo', 'America'),--
	('de', 'de@gmail.com', 'Inativo', 'Europa'),--
	('ef', 'ef@gmail.com', 'Ativo', 'Oceania'), --
	('fg', 'fg@hotmail.com', 'Inativo', 'America'),--
	('gh', 'gh@hotmail.com', 'Inativo', 'Asia'),--
	('hi', 'hi@gmail.com', 'Banido', 'Africa'), --
	('ij', 'ij@gmail.com', 'Ativo', 'Africa'),--
	('jk', 'jk@gmail.com', 'Ativo', 'Europa'),--
	('kl', 'kl@hotmail.com', 'Inativo', 'Oceania');--
	
insert into jogos (idt, nome, url) values
	('abcde12345', 'Call Of Duty', 'www.cod.com'),
	('fghij67890', 'Tom Clancys Rainbow Six', 'www.tcrs.com'),
	('klmno10111', 'Valorant', 'www.valorant.com'),
	('pqrst21314', 'GTAV', 'www.gtav.com'),
	('uvwxy15161', 'BattleFront II', 'www.battlefront.com'),
	('zabcd71819', 'Phasmofobia', 'www.phasmofobia.com');
	
insert into compra (idjogador, idtjogo, dt, preco) values
	(7, 'uvwxy15161', '2020-08-20', 44.99),
	(3, 'abcde12345', '2021-04-17', 79.99),
	(8, 'klmno10111', '2022-11-09', 19.99),
	(1, 'fghij67890', '2021-05-10', 74.99),
	(3, 'zabcd71819', '2020-10-31', 14.99),
	(6, 'uvwxy15161', '2020-07-23', 49.99),
	(10, 'pqrst21314', '2019-12-25', 64.99),
	(9, 'fghij67890', '2021-06-12', 69.99),
	(2, 'abcde12345', '2020-09-07', 84.99),
	(4, 'klmno10111', '2019-03-27', 19.99),
	(5, 'zabcd71819', '2021-04-29', 14.99),
	(11, 'fghij67890', '2021-05-10', 74.99),
	(6, 'abcde12345', '2021-04-17', 79.99),
	(4, 'fghij67890', '2021-05-10', 74.99);
	
insert into partida (dtinicio, dtfim, hinicio, hfim, regiao) values
	('2022-08-17', '2022-08-17', '14:55:52', '15:33:02', 'Europa'),		--partidanormal 1
	('2023-03-21', '2023-03-21', '18:28:03', '23:09:55', 'Oceania'),	--partidanormal 2
	('2023-05-01', null, '15:30:01', null, 'Asia'),						--partidamultijogador 3
	('2023-05-01', null, '19:55:43', null, 'Africa'),					--partidamultijogador 4
	('2023-05-02', null, '15:45:17', null, 'America'),					--partidamultijogador 5
	('2021-12-01', '2021-12-01', '20:34:44', '23:56:23', 'Europa'),		--partidanormal 6
	('2022-04-10', '2022-04-10', '16:05:27', '18:23:32', 'Europa'),		--partidamultijogador 7
	('2021-09-24', '2021-09-24', '19:55:43', '22:01:15', 'Oceania'),	--partidanormal 8
	('2023-04-30', '2023-05-01', '22:48:01', '02:04:57', 'America');	--partidanormal 9

insert into jogar(idjogo, nrpartida) values
	('klmno10111', 1),
	('fghij67890', 2),
	('abcde12345', 3),
	('fghij67890', 4),
	('zabcd71819', 5),
	('pqrst21314', 6),
	('uvwxy15161', 7),
	('zabcd71819', 8),
	('abcde12345', 9);
	
insert into partidanormal (nr, id, dificuldade, pontuacao) values
	(1, 4, 3, 100),
	(2, 11, 5, 350),
	(6, 10, 2, 150),
	(8, 5, 1, 50),
	(9, 3, 4, 250);
	
insert into partidamultijogador (nr, estado) values
	(3, 'Por iniciar'),
	(4, 'A aguardar jogadores'),
	(5, 'Em curso'),
	(7, 'Terminada');
	
insert into pontuacaomultijogador (id, nr, pontuacao) values
	(7, 3, 350),
    (9, 4, 150),
    (3, 5, 225),
    (6, 5, 400),
    (1, 7, 250),
   	(4, 7, 450);
    
insert into cracha (idt, nome, url_img, lim_pontos) values
	('abcde12345', 'Rookie', 'www.cod.com/rookie.png', 300),
  	('abcde12345', 'Expert', 'www.cod.com/expert.png', 800),
  	('abcde12345', 'Veteran', 'www.cod.com/veteran.png', 2000),
  	('fghij67890', 'Apprentice', 'www.tcrs.com/apprentice.png', 250),
  	('fghij67890', 'Master', 'www.tcrs.com/master.png', 650),
  	('fghij67890', 'All Down', 'www.tcrs.com/alldown.png', 1000),
  	('klmno10111', 'Freshman', 'www.valorant.com/freshman.png', 100),
  	('klmno10111', 'Squads Lider', 'www.valorant.com/squadslider.png', 450),
  	('klmno10111', 'Team Chief', 'www.valorant.com/teamchief.png', 1500),
  	('pqrst21314', 'Level 10', 'www.gtav.com/level10.png', 250),
  	('pqrst21314', 'Level 25', 'www.gtav.com/level25.png', 500),
  	('pqrst21314', 'Level 50', 'www.gtav.com/level50.png', 1000),
  	('pqrst21314', 'Level 100', 'www.gtav.com/level100.png', 15000),
  	('uvwxy15161', 'Jedi apprentice', 'www.battlefront.com/jedisapprentice.png', 500),
  	('uvwxy15161', 'The force', 'www.battlefront.com/theforce.png', 1000),
  	('uvwxy15161', 'True Jedi', 'www.battlefront.com/truejedi.png', 2500),
  	('zabcd71819', 'Strange things in the basement', 'www.phasmofobia.com/strangethingsinthebasement.png', 150),
  	('zabcd71819', 'Ghosts are real', 'www.phasmofobia.com/ghostsarereal.png', 300),
  	('zabcd71819', 'Are you there?', 'www.phasmofobia.com/areyouthere.png', 950),
  	('zabcd71819', 'Hunter', 'www.phasmofobia.com/hunter.png', 2000);

insert into conversa (nome) values
	('Conversa 1'),
	('Conversa 2'),
	('Conversa 3');

insert into mensagens (id_jogador, dt, hora, texto, idnt) values
	(1, '2023-04-30', '14:30:00', 'Olá, como estão?', 1),
	(2, '2023-04-30', '14:35:00', 'Está tudo bem!', 1),
	(3, '2023-04-30', '14:40:00', 'Que tal uma partida mais tarde?', 1),
	(4, '2023-04-30', '15:00:00', 'Alguém quer jogar agora?', 2),
	(5, '2023-04-30', '15:05:00', 'Eu quero!', 2),
	(4, '2023-04-30', '15:10:00', 'Também :)!', 2),
	(6, '2023-04-30', '16:15:00', 'Ganhei o meu primeiro crachá!!', 3),
	(7, '2023-04-30', '16:30:00', 'Wow, parabéns!', 3);

insert into amizade (idjogador1, idjogador2) values
	(11, 3),
	(5, 4),
	(9, 1),
	(7, 2),
	(6, 10),
	(3, 1),
	(4, 1),
	(5, 9), 
	(2, 6), 
	(5, 3),
	(5, 8),
	(9, 7);

insert into jogador_estat (idjogador, n_partidas, n_jogos, total_pontos_jogos_partidas) values
	(1, 1, 1, 300),
	(2, null, null, null),
	(3, 1, 2, 225),
	(4, 2, 2, 550),
	(5, 1, 1, 50),
	(6, 1, 2, 400),
	(7, 1, 1, 350),
	(8, null, null, null),
	(9, 1, 1, 150),
	(10, 1, 1, 150),
	(11, 1, 1, 350);

insert into jogo_estat (idjogo, n_partidas, total_pontos, n_jogadores) values
	('abcde12345', 2, 10, 1),
	('fghij67890', 2, 10, 2),
	('klmno10111', 1, 10, 1),
	('pqrst21314', 1, 10, 1),
	('uvwxy15161', 1, 10, 2),
	('zabcd71819', 2, 10, 3);
	
commit;