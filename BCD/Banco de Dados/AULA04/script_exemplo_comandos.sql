-- comentarios
-- comando para criar banco de dados
create database Biblioteca_bc;

-- apagar banco de dados
drop database biblioteca_bc;

-- apagar tabelas do banco
drop table clientes;

-- ativar banco de dados
use biblioteca_bc;

-- criar tabela
create table clientes(
id_cliente int auto_increment primary key,
nome varchar(60) not null,
cpf varchar(14)not null unique,
endereco varchar(150) not null,
email varchar(100)not null,
telefone varchar(15) not null
);



