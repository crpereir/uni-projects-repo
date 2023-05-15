-- |Exercício 2| --

-- alinea d)
create or replace procedure novoJogador(userName varchar(25), mail varchar(100), reg varchar(10))
language plpgsql
as $$
begin
	set transaction isolation level read committed;
	insert into JOGADOR(username, email, estado, regiao) values(userName, mail, 'Ativo', reg);
end;
$$;

create or replace procedure InativoOuBanido(cond boolean, uname varchar(25))
language plpgsql
as $$
begin 
	set transaction isolation level read committed;
	if cond = true then
		update jogador set estado = 'Banido' where username = uname;
	else 
		update jogador set estado = 'Inativo' where username = uname;
	end if;
end;
$$;

--alinea e)
create or replace function totalPontosJogador(idjogador int) returns table (totalPontos int)
language plpgsql 
as $$
begin
    return query
        select cast(sum(A.p1) as int) 
            from (
                select pontuacao as p1, id
                from PARTIDANORMAL 
                union all
                select pontuacao as p2, id
                from PONTUACAOMULTIJOGADOR ) as A
        where id = idjogador and A.p1 is not null ;
end;
$$;



--alinea f)
create or replace function totalJogosJogador(idjogador int) returns table (totalJogos int)
language plpgsql
as $$
begin
       return query 
        select cast(count(B.idjogo) as int)
            from (
                select pn.id as id1, pn.nr as nrpartida
                from PARTIDANORMAL pn
                group by pn.id, pn.nr
                union all
                select pm.id as id2, pm.nr as nrpartida
                from PONTUACAOMULTIJOGADOR pm
             	) as A 
            join (
                select *
                from JOGAR j) as B on A.nrpartida = B.nrpartida
        where id1 = idjogador
           group by id1;
end;
$$;

--alinea g)
create or replace function PontosJogoPorJogador(idtjogo varchar(10)) returns table (idjogador int, pontuacaototal int)
language plpgsql
as $$
begin
    return query
        select cast(B.id as int), cast(sum(p1) as int)
            from (select *
                    from JOGAR j) as A
            join (
                    select pn.id as id, sum(pontuacao) as p1, pn.nr as nrpartida
                    from PARTIDANORMAL pn
                    group by pn.id, pn.nr
                    union all 
                    select pm.id as id, sum(pontuacao) as p2, pm.nr as nrpartida
                    from PONTUACAOMULTIJOGADOR pm
                    group by pm.id, pm.nr) as B on A.nrpartida = B.nrpartida
            where A.idjogo = idtjogo
            group by B.id;
end;
$$;
    

--alinea h)
create or replace procedure associar_Cracha (id int, idt varchar(10), nome varchar) 
language plpgsql    
as $$
begin
	set transaction isolation level repeatable read;
     if (
        select p.pontuacao 
        from pontuacaomultijogador p 
	  		join jogador j on j.id = p.id 
			join compra c on c.idjogador = j.id 
			join cracha a on c.idtjogo = a.idt
			join jogos o on o.idt = a.idt
		where j.id = $1 
        order by p.pontuacao desc 
        limit 1 
    ) < (
     	select a.lim_pontos
	  	from pontuacaomultijogador p 
	  		join jogador j on j.id = p.id
			join compra c on c.idjogador  = j.id 
			join cracha a on c.idtjogo = a.idt
			join jogos o on o.idt = a.idt
		where a.nome = $3 and p.id  = j.id 
		order by a.lim_pontos desc
		limit 1
        
    ) then
        raise exception ' O jogador não atingiu o limite de pontos para obter este crachá.';
    else 
    	insert into associarcracha (id, idt, nome) values (id, idt, nome);
    end if;
end;
$$;

--alinea i)
create or replace procedure iniciarConversa(
    in id_jogador int,
    in  nome varchar
) 
language plpgsql
as $$
declare
    conversa_id int default 0;
begin
	set transaction isolation level read committed;
    -- Insere a conversa na tabela de conversas
    insert into conversa (nome) values (nome)
    returning idnt into conversa_id;
   	insert into criarconversa(jogador_id, conversa_id) values (id_jogador, conversa_id);
end;
$$;

--alinea j)
create or replace procedure juntarconversa(in jogador_id int, in conversa_id int)
language plpgsql
as $$
begin
	set transaction isolation level repeatable read;
	if (
		select idnt
		from conversa c 
		where c.idnt = conversa_id
	) >= 1
	then 
		insert into juntarconversa (jogador_id, conversa_id) values (jogador_id, conversa_id);
		return;
	end if;
  
  	raise exception 'A conversa não existe.';
		return;
end;
$$;

--alinea k)
create or replace procedure enviarMensagem(
    in id_jogador int,
    in id_conversa int,
    in mensagem text
)
language plpgsql
as $$
declare 
	dt date;
	hora time;
	texto text;
	idnt int;
begin
	set transaction isolation level read committed;
    insert into mensagens (id_jogador, dt, hora, texto, idnt) 
    values (id_jogador, current_date, current_time, mensagem, id_conversa);
end;
$$;

--alinea l)
create or replace view jogadorTotalInfo    
as select id, username, email, estado, totalJogosJogador(id), totalPontosJogador(id)
    from JOGADOR
    where estado <> 'Banido';

--alinea m)
create or replace function atribuir_cracha() returns trigger
language plpgsql
as $$
declare 
	cracha varchar;
begin
    if novo.pontuacao >= (select lim_pontos from CRACHA where idt = novo.nr) then
		select TOP(1) nome from CRACHA where idt = novo.nr and novo.pontuacao >= lim_pontos into cracha;
    	insert into ASSOCIARCRACHA (id, idt, nome) values (novo.id, novo.nr, cracha);
    end if;
    return null;
end;
$$;

create or replace trigger atribuir_cracha_pn
after insert on PARTIDANORMAL
referencing new table as novo
for each row 
execute function atribuir_cracha();


create or replace trigger atribuir_cracha_pm
after update on PARTIDA
referencing new table as novo
for each row 
when (new.dtfim <> null and new.hfim <> null)
    execute function atribuir_cracha();     
   
--alinea n)
create or replace function banirJogador() returns trigger
language plpgsql
as $$
begin
	IF (TG_OP <> 'DELETE') then
		RAISE EXCEPTION 'gatilho inválido';
	end if;
	update jogador set estado = 'Banido';
	return new;
end;
$$;   
    
create or replace trigger apagarInfojogador
instead of delete on jogadorTotalInfo
for each row
	execute function banirJogador();

