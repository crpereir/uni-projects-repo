/*
 *   ISEL-DEETC-SisInf
 *   MP 2024
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