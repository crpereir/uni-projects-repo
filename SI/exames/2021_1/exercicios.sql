

-- Exercicio 1
-- produz informação conjunta presente nas tabelas veiculoLigeiro e veiculoPesado. 
-- O atributo tipo deve tomar um dos valores {‘ligeiro’, ‘pesado’}, consoante a 
-- tabela de onde o tuplo foi obtido. Coloque null nos atributos para os quais não é 
-- possível atribuir um valor. 


create view Veiculo (id, matricula, cilindrada, lugares, tara, condutor, tipo)
	as 	
	SELECT 
	vlid,
	vlmatricula,
	vlcilindrada,
	vllugares,
	null as vltara,
	vlcondutor,
	'ligeiros' as tipo
	FROM public.veiculoligeiro
	union all	
	SELECT 
	vlid,
	vlmatricula,
	vlcilindrada,
	null as vllugares,
	vltara,
	vlcondutor,
	'pesados' as tipo
	FROM public.veiculopesado;





-- Exercicio 2
-- Crie em plpgsql o procedimento armazenado InsereVeiculo (com os parâmetros necessários, 
-- incluindo um atributo discriminativo para indicar o tipo de veículo a inserir) que permita 
-- inserir um veículo, ligeiro ou pesado. Garanta que não podem existir veículos ligeiros e 
-- pesados com a mesma matrícula, e que o mesmo condutor não pode estar associado a vários 
-- veículos simultaneamente. Devem ser feitas estas verificações e gerados erros caso elas 
-- não se verifiquem. 


create or replace procedure InsereVeiculo ( 
	vtipo varchar(15), 
	vmatricula varchar(15),
	vcondutor int,
	vlcilindrada int,
	vllugares int,
	vltara int
)

as $$
--declare
-- variable declaration
begin
-- stored procedure body
	if exists(
		select matricula 
		from Veiculo
		where matricula = vmatricula -- verifica se a matricula existe
	) then 
		raise notice 'A matricula já existe';
	end if;

	if exists(
		select condutor
		from Veiculo
		where condutor = vcondutor -- verifico se existe condutor
	) then 
		raise notice 'O condutor já existe';
	end if;
	
	if(vtipo = 'ligeiro') then 
	insert into veiculoligeiro (vlmatricula, vlcilindrada, vllugares, vlcondutor) 
		values (vmatricula, vlcilindrada, vllugares, vcondutor );
		
	elseif(vtipo = 'pesado') then 
	insert into veiculopesado (vlmatricula, vlcilindrada, vltara, vlcondutor)
		values (vmatricula, vlcilindrada, vllugares, vcondutor);	
	else
		raise exception 'Não foi possivel inserir';
	end if;

	commit;

end;

$$ language plpgsql;

































