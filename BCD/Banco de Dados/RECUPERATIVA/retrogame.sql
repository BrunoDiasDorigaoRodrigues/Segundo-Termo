DROP DATABASE RECUPERATIVA_RETROGAME_BRUNO;

CREATE DATABASE IF NOT EXISTS RECUPERATIVA_RETROGAME_BRUNO;

USE RECUPERATIVA_RETROGAME_BRUNO;


-- FASE 1 - DDL ESTRUTURA E RESTRICOES
CREATE TABLE  IF NOT EXISTS plataforma (
    id_plataforma int AUTO_INCREMENT,
    nome varchar (80) not NULL UNIQUE,


    constraint pk_id_plataforma PRIMARY KEY (id_plataforma)
);


CREATE TABLE if not exists categoria (
    id_categoria int AUTO_INCREMENT,
    descricao VARCHAR (80) not null UNIQUE,


    constraint pk_id_categoria PRIMARY KEY (id_categoria)
);


create table if not exists cliente (
    id_cliente int AUTO_INCREMENT,
    nome VARCHAR (100) not null,
    email VARCHAR (120) not null unique,
    telefone varchar (20) null,
    ATIVO BOOLEAN DEFAULT TRUE,


    CONSTRAINT pk_id_cliente PRIMARY KEY (id_cliente),
    CONSTRAINT uq_email unique (email)
);


CREATE TABLE jogo (
    id_jogo INT AUTO_INCREMENT,
    titulo VARCHAR (150) not NULL,
    codigo VARCHAR (15) not null,
    ano_lancamento INT NOT NULL,
    quantidade_disponivel INT DEFAULT 0 CHECK (quantidade_disponivel >=0),
    id_plataforma int not null,
    id_categoria int not NULL,


    constraint pk_jogo PRIMARY KEY (id_jogo),
    constraint fk_plataforma Foreign Key (id_plataforma) REFERENCES plataforma (id_plataforma),
    constraint fk_categoria FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria)
);


alter table jogo add desenvolvedora VARCHAR (100);


create TABLE locacao (
    id_locacao int AUTO_INCREMENT,
    data_retirada DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_prevista DATE NOT NULL,
    data_devolucao DATE NULL,
    status_locacao varchar(20) DEFAULT 'ABERTO' check (status_locacao in ('ABERTO', 'DEVOLVIDO', 'ATRASADO')),
    id_cliente int not null,
    id_jogo int not null,


    constraint pk_locacao PRIMARY KEY (id_locacao),
    constraint fk_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
    constraint fk_jogo FOREIGN KEY (id_jogo) REFERENCES jogo (id_jogo)
);


insert into cliente (nome, email, telefone, ativo) values 
('Ana', 'ana@email.com', '12347489', true),
('Bruno', 'bruno@email.com', '19898822', true),
('Cristopher', 'cristopher@email.com', null, true),
('Dave Jones', 'davej@email.com', '121221233', true);


insert into plataforma (nome) VALUES
('Playstation'),
('Xbox'),
('Nintendo'),
('Steam');


insert into categoria (descricao) VALUES
('Acao'),
('Aventura'),
('Mundo Aberto'),
('Luta');


select * from jogo;


insert into jogo (titulo, codigo, ano_lancamento, quantidade_disponivel, id_plataforma, id_categoria, desenvolvedora) VALUES
('Grand Theaf Auto VI', 000000, '2026',200, 1, 3, 'Rockstar Games'),
('Ea Fc 27', 000001, '2026', '300', 2, 3, 'Eletronic Arts'),
('Counter Strike', 000002, '2000', 100, 4, 1, 'Valve'),
('Need For Speed: Underground 2', 000003, '2004', 400, 1, 3, 'Eletronic Arts'),
('The Legend Of Zelda: Ocarina Of Time', 000004, '2026', 500, 3, 3, 'Rockstar North'),
('Elden Ring', 000005, '2022', 600, 2, 2, 'Fromsoftware');

insert into locacao (data_retirada,data_prevista, data_devolucao,status_locacao, id_cliente, id_jogo) VALUES
(NOW(),'2026-12-10', null,'Aberto',1,1),
(NOW(),'2027-11-29',null,'Aberto',2,2),
(NOW(),'2028-09-08',null,'Aberto',3,3);

SELECT * FROM cliente;

UPDATE cliente
SET telefone = '2222222'
WHERE id_cliente = 2;

UPDATE jogo 
SET quantidade_disponivel = quantidade_disponivel + 2
WHERE ano_lancamento > 2000;
insert into cliente (nome, email, telefone, ativo) values 
('Anna', 'anna@email.com', '12347479', false);

DELETE FROM cliente 
WHERE id_cliente = 5;

DELETE FROM cliente 
WHERE id_cliente = 1;

-- Ao tenta excluir ele faz uma restrição de chave estrangeira

-- Fase 3 - DQL: Consultas e analises 

SELECT titulo, ano_lancamento, quantidade_disponivel FROM jogo;

SELECT titulo FROM jogo 
WHERE quantidade_disponivel > 2
ORDER BY titulo DESC;

SELECT titulo FROM jogo
WHERE titulo LIKE '%grand%';

SELECT titulo FROM jogo 
WHERE ano_lancamento BETWEEN 1990 AND 2025;

SELECT id_locacao, cliente, titulo, data_retirada, status_locacao FROM locacao;