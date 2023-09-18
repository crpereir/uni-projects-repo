-- a) (a) -- A estratégia é juntar a informação de todas as tabelas e selecionar aquelas em que o cliente é o pedido.
select noident, nif, dtviagem, hinicio, hfim, valfinal 
from (PESSOA p join CLIENTEVIAGEM c on p.id = c.idpessoa) join VIAGEM v on c.viagem = v.idsistema
where p.nproprio like '%António%' and p.apelido like '%Silva%'

-- a) (b) -- O que é feito é a pesquisa numa tabela os ids dos condutores onde conduzem carros do Bruno Ferreira, mas não
		  -- os do Carlos Brito. Depois é dado o nome e o nº identificação daqueles que têm esses ids.
select nproprio, apelido, noident 
from PESSOA
where id in (select distinct c.condutor 
	from (PESSOA p join VEICULO v on p.id = v.proprietario) join CONDUTORHABILITADO c on c.veiculo = v.id
	where p.nproprio like '%Bruno%' and p.apelido like '%Ferreira%'
	except
	select distinct c.condutor 
	from (PESSOA p join VEICULO v on p.id = v.proprietario) join CONDUTORHABILITADO c on c.veiculo = v.id
	where p.nproprio like '%Carlos%' and p.apelido like '%Brito%')
	
-- a) (c) -- Na tabela é feita uma contagem das viagens por cliente. Deste, só basta retirar o nome, o id e o nif.
		  -- A lista ficará ordenada de forma decrescente pelo nº de viagens de cada cliente.
select p.id, p.nproprio, p.apelido, p.nif
from (clienteviagem c join pessoa p on p.id = c.idpessoa) join viagem v on v.idsistema = c.viagem --, pessoa p, viagem v 
where extract(year from v.dtviagem) = 2021
group by p.id
order by count(v.idsistema) desc

-- a) (d) -- Aqui, selecionamos o nif, o id e o nome dos condutores que não estão indicados na tabela VIAGEM.
select p.id, p.nproprio, p.apelido, p.nif
from PESSOA p
where p.atrdisc like 'C' and p.id != all (
	select v.condutor
	from VIAGEM v
)

-- a) (e) -- Aqui, juntamos as tabelas de viagem e pessoa para que contenha os detalhes do condutor com as viagens que
		  -- ele realizou. Depois, só são selecionados aqueles de 2021.
select p.nproprio, p.apelido, count(v.idsistema) numero_viagens
from pessoa p join viagem v on p.id = v.condutor
where extract(year from v.dtviagem) = 2021
group by p.nproprio, p.apelido

-- b) -- Para que tenhamos o nif, o ano da viagem e a contagem de viagens, seria preciso a informação das tabelas de 
	  -- PESSOA, VIAGEM e VEICULO. Depois é feito a contagem das viagens por ano.
select nif, extract(year from dtviagem) viagemYear, count(idsistema)
from (VIAGEM vi join VEICULO ve on vi.veiculo = ve.id) join PESSOA p on ve.proprietario = p.id
group by nif, viagemYear

-- c) -- Depois de juntar as viagens com a informação dos condutores, seriam só extraidos aqueles que fizeram viagens
	  -- em 2021.
select nproprio, apelido, nif, morada 
from PESSOA p join VIAGEM v on p.id = v.condutor
where extract(year from v.dtviagem) = 2021
group by nproprio, apelido, nif, morada 
order by sum(v.valfinal) desc nulls last

-- d) -- Ao juntar a informação dos condutores com as viagens que ele fez, é contado o numero de viagens em 2021 e depois
	  -- é retornado aqueles que tiveram menos que 3 viagens.
select p.nproprio, p.apelido, count(v.idsistema) numero_viagens
from pessoa p join viagem v on p.id = v.condutor
where extract(year from v.dtviagem) = 2021
group by p.nproprio, p.apelido
having count(v.idsistema) < 3

-- e) -- Aqui é criado uma vista onde o conteúdo da vista é feito a junção entre a viagem e os seus condutores
	  -- que depois é feito a contagem das viagens e o total dos preços por id da pessoa e pelo ano da viagem.
create view CONDUTORVIAGENSPORANO (id, ano, numero_viagens, preco_total)
as 
	select id, extract(year from dtviagem) ano, count(idsistema) numero_viagens, sum(valfinal) preco_total
	from pessoa p join viagem v on p.id = v.condutor
	group by id, ano

-- f) -- Aqui cria-se a tabela onde se retira a informação das tabelas CLIENTEVIAGEM e VIAGEM e depois é selecionado aqueles
	  -- que foram feitos em 2021 e é retirado as estatísticas da viagem (neste caso é a classificação média)
create table CLIENTEVIAGEMESTATISTICAS
as
	select c.idpessoa, count(idsistema) numero_viagens, avg(v.classificacao) classificacao_media
	from clienteviagem c join viagem v on c.viagem = v.idsistema
	group by c.idpessoa, extract(year from v.dtviagem)
	having extract(year from v.dtviagem) = 2021






