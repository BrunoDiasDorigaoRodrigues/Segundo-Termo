CREATE DATABASE if NOT EXISTS castello_relacionamentos;
USE castello_relacionamentos;

CREATE TABLE Clientes (
ID_Cliente INT PRIMARY KEY AUTO_INCREMENT,
Nome_Cliente VARCHAR(100) NOT NULL
);

CREATE TABLE Pedidos (
id_pedido INT AUTO_INCREMENT PRIMARY KEY, 
id_cliente INT NOT NULL,
data_pedido DATE NOT NULL,
valor_total DECIMAL(10,2) NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
);

CREATE TABLE estoque (
id_estoque INT PRIMARY KEY AUTO_INCREMENT,
id_produto INT NOT NULL UNIQUE,
quantidade INT NOT NULL,
FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

CREATE Table produtos (
    id_produto int AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR (100) not NULL,
    preco DECIMAL (10, 2)
);

SELECT * FROM produtos;

INSERT INTO produtos (Nome_produto, preco) VALUES
('produto A', 10.00),
('produto B', 20.00),
('produto C', 30.00);

-- desafios cardinalidade

-- 1. Uma categoria pode possuir vários produtos. Cada produto pertence a apenas
-- uma categoria.

-- Categoria e relacionamento 1,1 e 1n

-- 2. Um funcionário pode registrar vários pedidos. Cada pedido é registrado por um
-- funcionário.

-- O funcionario será 1,1 enquanto o pedido será 1,n 

-- 3. Um fornecedor comercializa vários produtos, e o mesmo produto pode ser
-- comprado de vários fornecedores.

-- Fornecedor 1,n  produto 1,n

-- 4. Uma mesa pode existir sem nenhuma reserva futura. Uma reserva deve estar
-- vinculada a uma mesa.

-- cliente 1,1  Reserva 0,n

-- 5. Um pedido possui vários itens. Um item de pedido pertence a um único pedido.

-- Pedido 1,n Item 1,1