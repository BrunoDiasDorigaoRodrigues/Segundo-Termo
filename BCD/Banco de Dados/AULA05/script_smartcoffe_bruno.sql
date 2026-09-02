-- Projeto smartcoffe

create database smartcoffe_bruno;

use smartcoffe_bruno;

create table clientes (
id_cliente int auto_increment primary key,
cpf varchar(14)unique,
telefone varchar(15) not null,
nome varchar(100) not null,
endereco varchar(150) not null, 
email varchar(100) not null
);

create table funcionario (
id_funcionario int auto_increment primary key,
cpf_funcionario char(11)unique,
telefone varchar(15) not null,
nome varchar(100) not null,
endereco varchar(150) not null, 
cargo char not null
);

create table pedidos (
id_pedido int auto_increment primary key,
cpf_cliente char(11)unique,
telefone_cliente varchar(15) not null,
nome_cliente varchar(100) not null,
endereco varchar(150) not null, 
total_pagar varchar(20) not null,
horario_pedido date not null

);

create table programa fidelidade (
id_fidelidade int auto_increment primary key,
nome_cliente varchar(100) not null,
endereco varchar(150) not null,
cpf_cliente char(11)unique,
nome_social varchar(100) not null,
telefone varchar(15) not null
);

create table produtos (
id_produto int auto_increment primary key,
validade date,
tipo int,
quantidade varchar(100) not null,
nome varchar(100) not null,
preco varchar(100) not null
);

create table pagamento (
id_pagamento int auto_increment primary key,
data_pagamento date,
valor_total varchar(100) not null,
horario_pagamento time,
nome_pagamento varchar(100) not null,
forma_pagamento varchar(100) not null
);
