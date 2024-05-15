/*
 *   ISEL-DEETC-SisInf
 *   MP 2022-2024
 *
 *   Didactic material to support the course
 *   Information Systems
 *
 */
/* populate */

INSERT INTO pessoa (nome, morada, email, telefone, noident, nacionalidade, atrdisc) VALUES
    ('John Doe', '123 Main St, City1', 'john.doe@email.com', '1234567890', 'A123456789', 'USA', 'C'),
    ('Jane Smith', '456 Elm St, City2', 'jane.smith@email.com', '9876543210', 'B987654321', 'Canada', 'G'),
    ('Alice Johnson', '789 Oak St, City3', 'alice.johnson@email.com', '1112223333', 'C111222333', 'UK', 'C'),
    ('Bob Brown', '555 Pine St, City4', 'bob.brown@email.com', '4445556666', 'D444555666', 'Australia', 'G'),
    ('Eva Davis', '999 Cedar St, City5', 'eva.davis@email.com', '7778889999', 'E777888999', 'France', 'C'),
    ('David Lee', '222 Birch St, City6', 'david.lee@email.com', '3331119999', 'F333111999', 'Germany', 'G'),
    ('Maria Garcia', '333 Willow St, City7', 'maria.garcia@email.com', '5556667777', 'G555666777', 'Spain', 'C'),
    ('Michael Martin', '777 Redwood St, City8', 'michael.martin@email.com', '6667778888', 'H666777888', 'Italy', 'G'),
    ('Sophia White', '888 Aspen St, City9', 'sophia.white@email.com', '111222333', 'I111222333', 'Portugal', 'C'),
    ('William Harris', '111 Sequoia St, City10', 'william.harris@email.com', '222333', 'J222333444', 'Brazil', 'G');
   
   
INSERT INTO loja (codigo, email, endereco, localidade, gestor) VALUES
    (1, 'loja1@example.com', 'Endereco Loja 1', 'Localidade 1', 2),
    (2, 'loja2@example.com', 'Endereco Loja 2', 'Localidade 2', 4),
    (3, 'loja3@example.com', 'Endereco Loja 3', 'Localidade 3', 6),
    (4, 'loja4@example.com', 'Endereco Loja 4', 'Localidade 4', 8);
  
INSERT INTO dispositivo (noserie, latitude, longitude, bateria) VALUES
    (1, 12.3456, 78.9012, 50),
    (2, 23.4567, 89.0123, 60),
    (3, 34.5678, 90.1234, 70),
    (4, 45.6789, 12.3456, 80),
    (5, 56.7890, 23.4567, 90),
    (6, 67.8901, 34.5678, 95),
    (7, 78.9012, 45.6789, 75),
    (8, 89.0123, 56.7890, 85);
   
INSERT INTO bicicleta (id, peso, raio, modelo, marca, mudanca, estado, atrdisc, dispositivo) VALUES
    (1, 14.50, 18, 'Modelo A', 'Marca X', 6, 'livre', 'C', 1),
    (2, 16.75, 23, 'Modelo B', 'Marca Y', 1, 'ocupado', 'E', 2),
    (3, 13.25, 13, 'Modelo C', 'Marca Z', 24, 'em manutencao', 'C', 3),
    (4, 15.00, 18, 'Modelo A', 'Marca X', 6, 'livre', 'C', 4),
    (5, 17.50, 23, 'Modelo B', 'Marca Y', 1, 'ocupado', 'E', 5),
    (6, 14.25, 13, 'Modelo C', 'Marca Z', 24, 'em manutencao', 'E', 6),
    (7, 12.75, 16, 'Modelo D', 'Marca W', 18, 'ocupado', 'E', 7),
    (8, 14.90, 15, 'Modelo E', 'Marca V', 6, 'livre', 'E', 8);
   
   
INSERT INTO classica (bicicleta, nomudanca) VALUES
    (1, 3),
    (3, 0),
    (4, 0); 
   
INSERT INTO electrica (bicicleta, autonomia, velocidade) values
	(2, 50, 25),
    (5, 50, 25),
    (6, 60, 30),
    (7, 70, 35),
   	(8, 60, 35);   
   
INSERT INTO reserva (noreserva,loja, dtinicio, dtfim, valor, bicicleta) VALUES
    (1,1, '2023-10-27 09:00:00', '2023-10-27 10:00:00', 10.00, 1),
    (2,1, '2023-10-27 10:30:00', '2023-10-27 11:30:00', 12.50, 2),
    (1,2, '2023-10-27 12:00:00', '2023-10-27 13:00:00', 9.75, 3),
    (1,4, '2023-10-27 13:30:00', '2023-10-27 14:30:00', 11.25, 4),
    (1,3, '2023-10-27 15:00:00', '2023-10-27 16:00:00', 8.50, 5),
    (2,3, '2023-10-27 16:30:00', '2023-10-27 17:30:00', 15.00, 6),
    (2,2, '2023-10-28 09:00:00', NULL, 11.00, 7),
    (3,2, '2023-10-28 10:30:00', NULL, 10.25, 8),
    (3,1, '2023-10-28 12:00:00', '2023-10-28 13:00:00', 13.75, 1),
    (4,1, '2023-10-28 13:30:00', '2023-10-28 14:30:00', 14.50, 2);
   
INSERT INTO telefoneloja (loja, notelefone) VALUES
    (1, '123456789'),
    (1, '234567890'),
    (2, '345678901'),
    (2, '456789012'),
    (3, '567890123'),
    (3, '678901234'),
    (4, '789012345'),
    (4, '890123456'),
    (4, '901234567');
   
INSERT INTO clientereserva (cliente, reserva, loja) VALUES
    (1, 1, 1),
    (2, 2, 1),
    (3, 1, 2),
    (4, 1, 4),
    (5, 1, 3),
    (6, 2, 3),
    (7, 2, 2),
    (8, 3, 2),
    (9, 3, 1),
    (10, 4, 1);
