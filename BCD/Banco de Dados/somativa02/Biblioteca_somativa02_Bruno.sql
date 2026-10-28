-- Active: 1788351676172@@127.0.0.1@3306@biblioteca_som2
-- Fase 1
CREATE DATABASE biblioteca_som2;

use biblioteca_som2

create Table cliente (
    id_cliente int PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) UNIQUE,
    telefone VARCHAR(20),
    ativo BOOLEAN DEFAULT TRUE
);

create table livro (
    quantidade_disponivel INT DEFAULT 0,
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(120) NOT NULL,
    isbn CHAR(13) NOT NULL UNIQUE,
    ano_publicado INT,
    editora VARCHAR(100),
    constraint ck_quantidade_disponivel CHECK (quantidade_disponivel >=0) 
);

CREATE Table emprestimo (
    id_emprestimo INT AUTO_INCREMENT,
    data_emprestimo DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_prevista DATE NOT NULL,
    data_devolucao DATE,
    status_emprestimo VARCHAR(20) DEFAULT 'ABERTO',
    id_cliente INT NOT NULL,
    id_livro INT NOT NULL,
    constraint pk_id_emprestimo PRIMARY KEY (id_emprestimo),
    constraint ck_status_emprestimo CHECK (status_emprestimo = 'aberto'),
    constraint fk_id_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente) on update CASCADE on delete RESTRICT,
    constraint fk_id_livro FOREIGN KEY (id_livro) REFERENCES livro (id_livro) on update CASCADE on delete RESTRICT   
);

-- Fase 2

INSERT INTO cliente (nome, email, telefone, ativo) VALUES
('Bruno Dias', 'BrunoDias@gmail.com', '199999991', TRUE ),
('Cristhoper', 'Cristhoper@gmail.com', '199999992', TRUE ),
('João Moreira', 'JoãoMoreira@gmail.com', '199999993', TRUE ),
('Jonas', 'Jonas@gmail.com', '199999994', TRUE );

INSERT INTO livro (quantidade_disponivel, id_livro, titulo, autor, isbn, ano_publicado, editora) VALUES
(100,'1','CRISTIANO RONALDO: A BIOGRAFIA','Cristiano Ronaldo','6588513402',2026,'BOOK ONE EDITORA LTDA'    ),
(70,'2','Yo soy el Diego','Diego Maradona','9788408066484',2006,'Editorial Planeta'),
(60,'3','Estrela Solitaria','Pele','9788571644939',1995, 'Companhia das Letras'),
(78,'4','Simplesmente Zico','Zico','9788572448413',2014,'Editora Contexto'),
(43,'5','Tostão: Lembranças','Tostão','9788572340847',1997,' DBA'),
(58,'6','Nunca Fui Santo','Marcos','9788579302893',2020,'Universo dos Livros');

INSERT INTO emprestimo (data_emprestimo, data_prevista, data_devolucao, status_emprestimo, id_cliente, id_livro) VALUES
('2026-07-17 08:20:00', '2026-08-17 ', '2026-08-18 ', 'ABERTO', 3, 1 ),
('2026-07-18 08:25:00', '2026-07-18 ', '2026-07-19 ', 'ABERTO', 4, 2 ),
('2026-07-19 08:30:00', '2026-07-19 ', '2026-07-20 ', 'ABERTO', 5, 3 );


-- O id do jacó não estara vinculado a um emprestimo de livro apenas cadastrado como cliente, agora quando tento excluir um cliente que possua emprestimo acontece um erro por conta do pk.
INSERT INTO cliente (nome, email, telefone, ativo) VALUES
('Jacó','jacó@gmail.com','199999995', TRUE)

DELETE FROM cliente
WHERE id_cliente = 3;

UPDATE livro
SET quantidade_disponivel = '72'
WHERE id_livro = 2;

UPDATE livro
SET quantidade_disponivel = '102'
WHERE id_livro = 1;

UPDATE cliente
SET telefone = '199999996'
WHERE id_cliente = 3;

SELECT * FROM cliente;

SELECT * FROM livro;
SELECT * FROM emprestimo;

SELECT nome FROM cliente;

SELECT DISTINCT nome
FROM cliente;


-- Fase 3

SELECT titulo,autor,quantidade_disponivel 
FROM livro;

SELECT titulo, quantidade_disponivel
FROM livro 
ORDER BY quantidade_disponivel DESC;

SELECT titulo
FROM livro
WHERE titulo LIKE 'Estrela Solitaria%';

SELECT titulo,ano_publicado
FROM livro
WHERE ano_publicado BETWEEN 2015 AND 2025;

SELECT id_emprestimo, nome, titulo, 