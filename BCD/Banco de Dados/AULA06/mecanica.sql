create database Oficina_Bruno;

CREATE table if NOT exists clientes (
   id_clientes int AUTO_INCREMENT PRIMARY key,
   telefone char(15) not null,
   email varchar(100) not null,
   nome_clientes varchar(60) not null,
   endereco VARCHAR(100) not null,
   cpf_cliente char(14) not null unique,
   data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE Table if not exists veiculo(
    id_veiculo int AUTO_INCREMENT PRIMARY KEY,
    descrição_Problema TEXT(300) NOT NULL,
    placa char(8) NOT NULL UNIQUE, 
    cor VARCHAR(25),
    modelo VARCHAR(25),
    quilometragem INT
);

CREATE Table if NOT exists marcas (
    id_marcas INT AUTO_INCREMENT PRIMARY KEY,
    nome_marca VARCHAR(50) NOT NULL,
    pais_origem VARCHAR(30),
    Ano_lançamento YEAR,
    modelo TEXT(500),
    tipo_combustivel ENUM('GASOLINA' , 'DIESEL' , 'GASOLINA') DEFAULT 'ETANOL' NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE Table if NOT exists modelos (
    id_modelo INT AUTO_INCREMENT PRIMARY KEY,
    nome_modelo VARCHAR(30) NOT NULL,
    tipo_modelo VARCHAR('SUV' , 'COMPACTO' , 'SEDAN') DEFAULT 'COMPACTO',
    ano_fabricação YEAR NOT NULL,
    potencia CHAR(10),
    status_modelo ENUM ('ATIVO' , 'INATIVO') DEFAULT 'ATIVO',
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
); 

CREATE TABLE if NOT exists funcionario (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome_funcionario VARCHAR(60) NOT NULL,
    cpf_funcioanario CHAR(14) NOT NULL UNIQUE,
    telefone_funcionario CHAR(15) NOT NULL,
    cargo VARCHAR(30),
    salario DECIMAL(10,2) NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE if NOT exists servicos (
    id_servico INT AUTO_INCREMENT PRIMARY KEY,
    tipo_servico VARCHAR(100) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    data_inicio DATETIME NOT NULL,
    data_termino DATETIME NOT NULL,
    descrição_servico TEXT(500) NOT NULL,
    status_servicos ENUM ('EM ANDAMENTO', 'EM ESPERA' , 'CONCLUIDO') DEFAULT 'EM ANDAMENTO' NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE if NOT exists fornecedores (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    telefone CHAR(15) NOT NULL,
    --Tempo_Entrega VARCHAR(60)
    cnpj CHAR(18) NOT NULL UNIQUE,
    razao_social VARCHAR(100) NOT NULL,
    segmento VARCHAR(50) NOT NULL, 
    endereco VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    status_fornecedor ENUM ('ATIVO' , 'INATIVO') DEFAULT 'ATIVO'
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

use oficina_bruno;

