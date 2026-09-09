-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE clientes (
ID_cliente int auto increment primary key PRIMARY KEY,
nome_cliente Varchar(100)
)

CREATE TABLE Pedidos (
ID_Pedido int auto increment primary key PRIMARY KEY,
quantidade varchar(100) not null,
ID_cliente int auto increment primary key,
FOREIGN KEY(ID_cliente) REFERENCES clientes (ID_cliente)
)

CREATE TABLE Produtos+Estoques (
ID_Produto int auto increment primary key,
Nome_Produto Varchar(100),
ID_Estoque int auto increment primary key,
Valor deciamal 10,2,
PRIMARY KEY(ID_Produto,ID_Estoque)
)

CREATE TABLE Fornecedores (
ID_Fornecedor Texto(1) PRIMARY KEY,
Razão_social Texto(1)
)

CREATE TABLE Produtos (
ID_Produto Int auto increment primary key PRIMARY KEY,
Nome_Produto Varchar(100) not null/
CREATE TABLE Item_Produto (
ID_Produto Int,
ID_Fornecedor Int,
ID_Item Int auto increment primary key PRIMARY KEY,
Quantidade Int)

