-- comando para criar bd
-- 1
create database biblioteca_Bruno;
create database if not exists biblioteca_Bruno

-- comando para apagar
drop database biblioteca_Bruno;

-- 2
-- Atualizar schemas


-- 3
-- comando para ativar bd 
use biblioteca_Bruno;


-- comando criar tabela
create table clientes (
id_cliente int auto_increment primary key,
cpf varchar(14) not null unique,
nome varchar(60) not null,
telefone varchar(15) not null,
endereco varchar(100),
data_nascimento date not null
);

create table if not exists clientes (
id_cliente int auto_increment primary key,
cpf varchar(14) not null unique,
nome varchar(60) not null,
telefone varchar(15) not null,
endereco varchar(100),
data_nascimento date not null,
status_cliente enum ('pendente', 'ativo', 'nativo') default "ativo",
data_cadastro timestamp default current_timestamp
);

create table funcionarios (
id_funcionario int auto_increment primary key,
cargo varchar(14) not null unique,
nome_funcionario varchar(60) not null,
telefone varchar(12) not null,
valor decimal(5,2) default 0.00,
ponto datetime not null,
cargos char not null,
vendas varchar(60) not null
);


-- comando apagar tabela
drop table funcionarios;

-- comandos para alterar e corrigir
-- adicionar um campo (atributo) novo
alter table clientes add email varchar(100);

-- modificar tipo de dados ou campos
alter table clientes modify email varchar(100);

-- renomear tabelas
rename table cristhoper to clientes;

-- excluir atributo
alter table clientes drop column email;

-- visualizar tabelas no bd
show tables;

-- limpar dados da tabela
truncate table clientes;

-- inserir dados no bd
insert into clientes (id_cliente, cpf, nome, telefone, endereco, data_nascimento)
values ('', 'Bruno', '123.456.789-78', '(19) 98140-6512', 'rua senai' '29/11/2009', 'ativo','');

create table funcionarios (
id_funcionarios int primary key,
email varchar(255) unique
);

insert into funcionarios (id_funcionarios, email)
values (1,'bruno@senai.com.br');

-- comando para consultar informações na tabela
select * from funcionarios;