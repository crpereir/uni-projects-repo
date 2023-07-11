
-- Inserir dados na tabela 'funcionario'
insert into funcionario (num, nome, idade) values
	(1, 'João', 30),
	(2, 'Maria', 25),
	(3, 'Pedro', 35);

-- Inserir dados na tabela 'tarefa'
insert into tarefa (id, nome) values
	(1, 'Limpeza'),
	(2, 'Manutenção'),
	(3, 'Atendimento');

-- Inserir dados na tabela 'funcionario_tarefa'
insert into funcionario_tarefa (num_func, id_tarefa) values
	(1, 1),
	(1, 2),
	(2, 3),
	(3, 1),
	(3, 2);

----------------------------------------------------------------

insert into produtos (nome, preco, quantidade) values
    ('Camisa', 19.99, 50),
    ('Calça', 59.99, 20),
    ('Ténis', 89.99, 10);

insert into clientes (nome, email, telefone) values
    ('João Silva', 'joao@example.com', '1234567890'),
    ('Maria Sousa', 'maria@example.com', '9876543210'),
    ('Carlos Ferreira', 'carlos@example.com', '5555555555');

insert into pedidos (cliente_id, produto_id, quantidade, data_pedido) values
    (1, 2, 2, '2023-06-28'),
    (2, 2, 1, '2023-06-29'),
    (3, 3, 3, '2023-06-30');
    
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   