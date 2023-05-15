--alinea o)

begin
	
-- d) Feito
create or replace procedure test_criar_jogador(
    uName varchar(25), 
    mail varchar(100), 
    reg varchar(10),
    ntest int
)
language plpgsql 
as $$
declare
	newPlayer integer not null default 0;
   	code char(5) default '00000';
    msg text;
begin
	set transaction isolation level read committed;
    call novoJogador(uName, mail, reg);
   	select j.id  from jogador j where j.username = uName into newPlayer; 
    raise notice 'teste=%: Criar um novo jogador: Resultado OK. Username e id do novo jogador = (%, %)', ntest, uName, newPlayer;
exception
    when others then
        raise notice 'teste=%: O Criar um novo jogador: Resultado FAIL', ntest;
       	get stacked diagnostics
            code = RETURNED_SQLSTATE, msg = MESSAGE_TEXT;
        raise notice 'code=%, msg=%', code, msg;
        rollback;
end;
$$; 

call test_criar_jogador('lm', 'lm@gmail.com', 'Asia', 1);
call test_criar_jogador('ab', 'mn@gmail.com', 'Europa', 2);

create or replace procedure test_jogador_inativo_ou_banido(
	uName varchar(25),
	cond boolean,
    ntest int
)
language plpgsql 
as $$
declare
	newEstado varchar(25) not null default 'ssasds';
   	code char(5) default '00000';
    msg text;
begin
	set transaction isolation level read committed;
    call InativoOuBanido(cond, uName);
   	select estado  from jogador where username = uName into newEstado; 
    raise notice 'teste=%: Alterar o estado de um jogador: Resultado OK. Estado do jogador = %', ntest, newEstado;
exception
    when others then
        raise notice 'teste=%: Alterar o estado de jogador: Resultado FAIL', ntest;
       	get stacked diagnostics
            code = RETURNED_SQLSTATE, msg = MESSAGE_TEXT;
        raise notice 'code=%, msg=%', code, msg;
        rollback;
end;
$$;

call test_jogador_inativo_ou_banido('ab', false, 1);
call test_jogador_inativo_ou_banido('dddd', true, 2);

--e) feito
create or replace procedure test_total_de_pontos_jogador(
    idjogador int,
    ntest int
)
language plpgsql 
as $$
declare
	points int not null default 0;
   	code char(5) default '00000';
    msg text;
begin
    select totalPontosJogador(idjogador) into points;
   	raise notice 'teste=%: Total de pontos de um jogador: Resultado OK. Total de pontos do jogador = %', ntest, points;
exception
    when others then
        raise notice 'teste=%: Total de pontos de um jogador: Resultado FAIL', ntest;
       	get stacked diagnostics
            code = RETURNED_SQLSTATE, msg = MESSAGE_TEXT;
        raise notice 'code=%, msg=%', code, msg;
        rollback;
end;
$$;

call test_total_de_pontos_jogador(3, 1);
call test_total_de_pontos_jogador(88888, 2);

--f) Feito
create or replace procedure test_total_de_jogos_jogador(
    idjogador int,
    ntest int
)
language plpgsql 
as $$
declare
	jogos int not null default 0;
   	code char(5) default '00000';
    msg text;
begin
    select totalJogosJogador(idjogador) into jogos;
   	raise notice 'teste=%: Total de jogos de um jogador: Resultado OK. Total de jogos do jogador % = %', ntest, idjogador ,jogos;
exception
    when others then
        raise notice 'teste=%: Total de jogos de um jogador: Resultado FAIL', ntest;
       	get stacked diagnostics
            code = RETURNED_SQLSTATE, msg = MESSAGE_TEXT;
        raise notice 'code=%, msg=%', code, msg;
        rollback;
end;
$$;

call test_total_de_jogos_jogador(3, 1);
call test_total_de_jogos_jogador(55555, 2);

--g) Feito
create or replace procedure test_pontos_do_jogo_por_jogador(
    idtjogo varchar(10),
    ntest int
)
language plpgsql 
as $$
declare
	jogo record;
   	code char(5) default '00000';
    msg text;
begin
    select PontosJogoPorJogador(idtjogo) into jogo;
   if jogo is null then
   	raise exception ' Game does not exist.';
   else 	
   	raise notice 'teste=%: Pontos de um jogo por jogador: Resultado OK. Jogo % = %', ntest, idtjogo, jogo;
   end if;
exception
    when others then
        raise notice 'teste=%: Total de jogos de um jogador: Resultado FAIL', ntest;
       	get stacked diagnostics
            code = RETURNED_SQLSTATE, msg = MESSAGE_TEXT;
        raise notice 'code=%, msg=%', code, msg;
        rollback;
end;
$$;

call test_pontos_do_jogo_por_jogador('abcde12345', 1);
call test_pontos_do_jogo_por_jogador('12345', 2);

--h)
create or replace procedure test_associar_cracha(
    idtjogo varchar(10), 
    idjogador int,
    n varchar,
    ntest int
)
language plpgsql 
as $$
declare
	id_jogador int not null default 0;
   	code char(5) default '00000';
    msg text;
begin
	set transaction isolation level read committed;
    call associar_Cracha(idjogador, idtjogo, n);
   	select id from associarcracha a where a.id = idjogador and a.nome  = n into id_jogador;
   	raise notice 'teste=%: Atribuição de um cracha a um jogador: Resultado OK. O cracha "%" foi atribuido ao jogador %', ntest, n, idjogador;
exception
    when others then
        raise notice 'teste=%: Atribuição de um cracha a um jogador: Resultado FAIL', ntest;
       	get stacked diagnostics
            code = RETURNED_SQLSTATE, msg = MESSAGE_TEXT;
        raise notice 'code=%, msg=%', code, msg;
        rollback;
end;
$$;

call test_associar_cracha('abcde12345', 6, 'Rookie', 1);
call test_associar_cracha('pqrst21314', 11, 'Level 100', 2 );

--i) Feito
create or replace procedure test_criar_conversa( 
    idjogador int,
    n varchar,
    ntest int
)
language plpgsql 
as $$
declare
	idconversa int not null default 0;
   	code char(5) default '00000';
    msg text;
begin
	set transaction isolation level read committed;
    call iniciarConversa(idjogador, n);
   	select idnt from conversa c where c.nome = n into idconversa;  
   	raise notice 'teste=%: Jogador inicia conversa: Resultado OK. A conversa "%" foi iniciada pelo jogador %', ntest, n, idjogador;
exception
    when others then
        raise notice 'teste=%: Jogador inicia conversa: Resultado FAIL', ntest;
       	get stacked diagnostics
            code = RETURNED_SQLSTATE, msg = MESSAGE_TEXT;
        raise notice 'code=%, msg=%', code, msg;
        rollback;
end;
$$;

call test_criar_conversa(6, 'Conversa 4', 1);
call test_criar_conversa(20, 'Conversa 5', 2 );

--j) Feito
create or replace procedure test_aderir_a_uma_conversa( 
    idjogador int,
    idconversa int,
    ntest int
)
language plpgsql 
as $$
declare
	n varchar not null default ' ';
   	code char(5) default '00000';
    msg text;
begin
    call juntarconversa(idjogador, idconversa);
   	select nome from conversa a where idnt = idconversa into n;  
   	raise notice 'teste=%: Jogador inicia conversa: Resultado OK. O jogador % aderiu com sucesso à conversa "%"', ntest, idjogador, n;
exception
    when others then
        raise notice 'teste=%: Jogador inicia conversa: Resultado FAIL', ntest;
       	get stacked diagnostics
            code = RETURNED_SQLSTATE, msg = MESSAGE_TEXT;
        raise notice 'code=%, msg=%', code, msg;
        rollback;
end;
$$;

call test_aderir_a_uma_conversa(6, 3, 1);
call test_aderir_a_uma_conversa(20, 2, 2 );

--k) Feito
create or replace procedure test_enviar_uma_mensagem( 
    idjogador int,
    idconversa int,
    mensagem text,
    ntest int
)
language plpgsql 
as $$
declare
	mes text;
   	code char(5) default '00000';
    msg text;
begin
    call enviarmensagem(idjogador, idconversa, mensagem);
   	select texto  from mensagens m where m.idnt = idconversa into mes;
   	if mes is null then
   		raise exception 'Conversa nº % não existe', idconversa;
   	else 
   		raise notice 'teste=%: Jogador envia mensagem: Resultado OK. O jogador % enviou a mensagem "%" com sucesso', ntest, idjogador, mensagem;
	end if;	
exception
    when others then
        raise notice 'teste=%: Jogador envia mensagem: Resultado FAIL', ntest;
       	get stacked diagnostics
            code = RETURNED_SQLSTATE, msg = MESSAGE_TEXT;
        raise notice 'code=%, msg=%', code, msg;
        rollback;
end;
$$;

call test_enviar_uma_mensagem(6, 3, 'Amanhã ganho-te no 1x1', 1);
call test_enviar_uma_mensagem(20, 2, 'Amanhã ganho-te no 1x1', 2);

--m)
create or replace procedure test_trigger_associar_cracha(
	partida int,
	cond boolean, 
	ntest int
)
language plpgsql 
as $$
declare
	n varchar not null default 'cracha';
   	code char(5) default '00000';
    msg text;
begin
	set transaction isolation level repeatable read;
   	if cond = true then
   		insert into PARTIDANORMAL (nr, id, dificuldade, pontuacao) values (4, 10, partida, 500);
   		select nome from ASSOCIARCRACHA a where a.idt = partida into n; 
   		raise notice 'teste=%: Inserir partida na tabela PARTIDANORMAL: Resultado OK. Cracha atribuido = %', ntest, n;
   	else 
   		update PARTIDA p set p.dtfim = current_date and p.hfim = current_time where p.nr = partida;
   		select nome from ASSOCIARCRACHA a where a.idt = partida into n; 
   		raise notice 'teste=%: Atualizar a partida na tabela PARTIDA: Resultado OK. Cracha atribuido = %', ntest, n;
   	end if;
exception
    when others then
        raise notice 'teste=%: Inserir partida na tabela PARTIDANORMAL ou atualizar a partida na tabela PARTIDA: Resultado FAIL', ntest;
       	get stacked diagnostics
            code = RETURNED_SQLSTATE, msg = MESSAGE_TEXT;
        raise notice 'code=%, msg=%', code, msg;
        rollback;
end;
$$;

call test_trigger_associar_cracha(3, true, 1);
call test_trigger_associar_cracha(4, false, 2);

--n)

create or replace procedure test_trigger_apagar_view(ntest int)
language plpgsql 
as $$
declare
	x varchar;
   	code char(5) default '00000';
    msg text;
begin
	--set transaction isolation level repeatable read;
   	delete from jogadorTotalInfo;
   	for x in (select estado from JOGADOR) loop	
   		if x <> 'Banido' then
   			raise exception 'Não correu bem.';
   		else 
   			continue;
   		end if;
   	end loop;
   	raise notice 'teste=%: Apagar a view: Resultado OK.', ntest;
exception
    when others then
        raise notice 'teste=%: Jogador envia mensagem: Resultado FAIL', ntest;
       	get stacked diagnostics
            code = RETURNED_SQLSTATE, msg = MESSAGE_TEXT;
        raise notice 'code=%, msg=%', code, msg;
        rollback;
end;
$$;
 
call test_trigger_apagar_view(1);

commit;