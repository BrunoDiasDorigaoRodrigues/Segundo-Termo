create database Mecaninca_Bruno;

use Mecaninca_Bruno;

create table clientes (
id_cliente int auto_increment primary key,
cpf varchar(14) not null unique,
nome varchar (60) not null,
telefone varchar (15) not null,
endereço varchar (100),
email varchar(100)
);

create table Funcionarios (
id_funcionario int auto_increment primary key,
cpf_funcionario varchar(14) not null unique,
nome varchar (60) not null,
telefone_funcionario varchar (15) not null,
endereço varchar (100),
email_Funcionario varchar(100),
cargos char not null,
Expediente datetime not null,
vendas varchar(60) not null
);

create table Veiculos (
Id_Veiculos  int auto_increment primary key,
marca_veiculo varchar (60) not null,
placa_Veiculo char(8) not null,
cor_Veiculo varchar(60) not null,
ano_Veiculo datetime
);

create table serviços (
id_Serviço int auto_increment primary key,
cpf_cliente varchar(14) not null unique,
Telefone_Cliente varchar (15) not null,
Horario_Pedido datetime,
orçamento varchar(100) not null
);

create table modelos (
id_modelos int auto_increment primary key,
modelo_veiculo varchar(60) not null,
ano_modelo datetime,
Cor_modelo varchar(60) not null
);

create table marcas (
id_marcas int auto_increment primary key,
marca_veiculo varchar(60) not null,
modelo_marca varchar(60) not null
);

create table pagamentos (
id_pagamentos int auto_increment primary key,
Data_Pagamento datetime,
valor_total char(60),
Hoarario_de_pagamento datetime,
forma_pagamento varchar(4) not null,
pix char (160) not null, 
debito char (160) not null,
credito char (160) not null,
dinheiro char (160) not null
);

create table pecas (
id_pecas int auto_increment primary key,
tipo_peca char(60) not null,
observacao char(100) not null,
quantidade varchar(150) not null,
modelo_pecas char(60) not null
);

create table fornecedor (
id_fornecedor int auto_increment primary key,
telefone_fornecedor varchar(15) not null,
email varchar(60) not null,
nome_fornecedor varchar(60) not null,
periodo_trabalho datetime,
observacao char(100) not null
);

create table ordens_de_servico (
id_ordens int auto_increment primary key,
tipo_pecas char(80) not null,
observacao char(100) not null,
quantidade varchar (150) not null,
problema_cliente varchar(60) not null,
estimacao_data datetime
);

create table estoque (
id_estoque int auto_increment primary key,
horario_retirada time,
horario_entrada time,
nome_funcionario varchar(60) not null,
horario_retiramento time,
pecas_disponiveis varchar(150) not null,
pecas_indisponiveis varchar(150) not null
);

alter table clientes add emails varchar(100);

alter table Funcionarios add cpf_funcionarios varchar(14) not null unique;

alter table Veiculos add ano_Veiculos datetime;

alter table serviços add Horario_Pedidos datetime;

alter table marcas add marca_veiculos varchar(60) not null;

alter table pagamentos add Data_Pagamentos datetime;

alter table pecas add quantidades varchar(150) not null;

alter table fornecedor add telefone_fornecedores varchar(15) not null;

alter table ordens_de_servico add observacões char(100) not null;

alter table estoque add horario_retiramentos time;

-- apagar
alter table clientes drop column emails;

alter table Funcionarios drop column cpf_funcionarios;

alter table Veiculos drop column ano_Veiculos;

alter table serviços drop column Horario_Pedidos;

alter table marcas drop column marca_veiculos;

alter table pagamentos drop column Data_Pagamentos;

alter table pecas drop column quantidades;

alter table fornecedor drop column telefone_fornecedores;

alter table ordens_de_servico drop column observacões;

alter table estoque drop column horario_retiramentos;