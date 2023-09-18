-- Selecione todos os funcionários.
select * from funcionarios f

-- Selecione todos os projetos.
select * from projetos p 

-- Selecione todos os clientes.
select * from clientes c 

-- Selecione todos os contratos.
select * from contratos c 

-- Selecione o nome e o cargo de todos os funcionários.
select nome, cargo from funcionarios f 

-- Selecione o nome e a descrição de todos os projetos.
select nome, descricao from projetos p 

-- Selecione o nome e a morada de todos os clientes.
select nome, morada from clientes c 

-- Selecione o projeto_id e o cliente_id de todos os contratos.
select projeto_id, cliente_id from contratos c 

-- Selecione todos os funcionários contratados após uma determinada data.
select * from funcionarios where data_contratacao >= '2020-02-15'

-- Selecione todos os projetos que ainda não foram concluídos.
select * from projetos where data_fim = null

-- Selecione todos os clientes que possuem contratos ativos.


-- Selecione o nome dos funcionários e o nome dos projetos em que estão trabalhando.
select nome from funcionarios f join projetos p on f.cargo = p.descricao 

-- Selecione a contagem de funcionários para cada cargo.
select t.id, count(ft.num_func) from funcionario_tarefa ft 
join tarefa t on t.id = ft.id_tarefa 
group by t.id
 

-- Selecione a soma da idade de todos os funcionários.
select sum(idade) from funcionario f  


-- Selecione a média da idade dos funcionários.
select avg(idade) from funcionario f  


-- Selecione o nome do cliente e o número de projetos em que está envolvido.
select nome, count(ft.id_tarefa) 
from funcionario f 
join funcionario_tarefa ft on f.num = ft.num_func 
group by f.nome


-- Função para calcular a média de idade dos funcionários
create or replace function ave_age()
returns int
language plpgsql
as $$
declare 
	avg_age int;
begin 
	select avg(idade) avg_age from funcionario;
	return avg_age;
end;
$$


-- Trigger para inserir automaticamente um registro na tabela funcionario_tarefa 
-- quando um funcionário for atribuído a uma tarefa
create or replace function add_func_trig()
returns trigger
language plpgsql
as $$
declare
	tarefa int;
begin	
	insert into funcionario_tarefa(num_func, id_tarefa) values 
	(num_func, tarefa);
end; $$


create trigger add_func 
after insert on funcionario_tarefa
for each row 
	execute procedure add_func_trig();



-- Procedure para atualizar o nome de uma tarefa
create or replace procedure update_tarefa(
	in id int 
 	--nome varchar(255)
)
language plpgsql
as $$
declare
	new_name varchar(50);
begin
	update tarefa set nome = new_name where id = id_tarefa;
end; $$



-- View para listar todos os funcionários juntamente com suas respectivas tarefas
create view func_tarefa as
select f.num, f.nome, f.idade, t.nome as nome_tarefa
from funcionario f 
join funcionario_tarefa ft on f.num = ft.num_func 
join tarefa t on t.id = ft.id_tarefa 
where f.num = ft.num_func and t.id = ft.id_tarefa;
















