-- Active: 1788351676172@@127.0.0.1@3306@smartcoffee_dml_bruno
USE SMARTCOFFEE_DML_BRUNO;

-- INSERINDO DADOS NO DB
-- DML: INSERTS, UPDATE, DELETE

INSERT INTO cliente (nome,email,telefone,cidade,ativo) VALUES
('Adryan Costa','adryan@gmail.com','1999999901','Limeira',TRUE), 
('Ana Francisca','anaFrancisca@gmail.com','1999999902','Lençois Paulista',TRUE), 
('Ana Julia','AnnaJulia@gmail.com','1999999903','Limeira',TRUE), 
('Beatriz Barros','BeatrizB@gmail.com','1999999905','Limeira',TRUE), 
('Beatriz Santana','BeatrizS@gmail.com','1999999906','Australia',TRUE), 
('Bruno Dias','BrunoDias@gmail.com','1999999907','Limeira',TRUE), 
('Cristhoper da Costa','Cristhoper@gmail.com','1999999908','Mogi guaçu',TRUE), 
('Davi Guerra','Davi@gmail.com',NULL,'Limeira',TRUE), 
('Gabriel Lucio','@gmail.com','1999999910','Limeira',TRUE), 
('Giovana Santana','Giovana@gmail.com',NULL,'juqueropólis',FALSE), 
('Gabriela Lima','Gabriela2@gmail.com','1999999911','juqueropólis',TRUE), 
('Gustavo Couto','Gustavogmail.com','1999999912','Limeira',FALSE), 
('Isabeli Sousa','Isabeli@gmail.com',NULL,'Limeira',TRUE), 
('Jacó de Souza','Jacó@gmail.com','1999999913','Limeira',TRUE), 
('João Moreira','Joao2@gmail.com','1999999914','Limeira',TRUE), 
('Jhon Pierre','Jhon@gmail.com','1999999915','Limeira',TRUE), 
('Jonas Dawid','Jonas@gmail.com','1999999916','Rio de Janeiro',TRUE), 
('Juan Pablo','Juan@gmail.com','1999999917','Limeira',TRUE), 
('Julia Fernanda','Julia@gmail.com','1999999918','Limeira',TRUE); 

-- INSERINDO CAMPOS COM CHAVE ESTRANGEIRA
INSERT INTO produto (nome,preco,ativo,id_categoria) VALUES
('Manteiga Giovana', 14.00, TRUE,4)

INSERT INTO pedido (data_pedido,status,valor_total,id_cliente) VALUES
(NOW(),'ABERTO',14.80,20)

SET @pedido = LAST_INSERT_ID();
;SELECT @pedido;


-- ATUALIZANDO OU MODIFICANDO DADOS NO BD
-- EX 1: ATUALIZANDO INFORMAÇÕES INDIVIDUAIS
UPDATE cliente
SET telefone = '199999888801'
WHERE id_cliente = 20;

UPDATE cliente
SET ativo = TRUE
WHERE id_cliente = 18, 19;

-- NUNCA, JAMAIS, NEVER ESQUEÇAM DE UTILIZAR O WHERE

-- REGRA DE OURO

SELECT * FROM cliente
WHERE id_cliente = 18;

-- SEGUNDA ETAPA
UPDATE cliente
SET ativo = FALSE
WHERE id_cliente = 18;

-- EX 2: ATUALIZANDO MAIS DO QUE UM CAMPO
UPDATE cliente
SET telefone = '1999888016',
    cidade = 'Campinas'
WHERE id_cliente = 15;

-- EX 3: ATUALIZANDO COM CONDICIONAIS
UPDATE produto
SET preco = preco * 2.50
WHERE id_categoria = 1;

-- APAGANDO DADOS
-- EX 1: APAGAR DADOS SEM CONTER INFORMAÇÕES
DELETE FROM cliente;

-- EX 2: APAGAR DADOS COM CONDIÇÕES
DELETE FROM cliente
WHERE id_cliente = 18;

-- EX 3: APAGANDO DADOS DE TODA TABELA
TRUNCATE TABLE cliente;

-- EX 4: APAGAR DE FORMA REPRESENTATIVA OU LÓGICA
UPDATE produto
SET ativo = FALSE
WHERE id_produto 19;

-----------------------------------------------
-- REALIZANDO PASSOS PARA UMA COMPRA NA SMARTCOFFEE
-- PASSO 1: CADASTRAR UM NOVO CLIENTE
INSERT INTO cliente (nome,email,telefone,cidade,ativo) VALUES
('Bruno A','brunoa@gmail.com','19999123456','Piracicaba',TRUE);
SET @cliente = LAST_INSERT_ID();

-- PASSO 2: CRIAR O PEDIDO

INSERT INTO pedido (data_pedido,status,valor_total,id_cliente) VALUES
(NOW(), 'ABERTO',0.00,20);
SET @pedido = LAST_INSERT_ID();

-- PASSO 3: INSERIR ITENS NO PEDIDO
INSERT INTO item_pedido (id_pedido, id_produto,quantidade,preco_unitario) VALUES
(@pedido,4,1,73.13),
(@pedido,11,1,11.25);

-- PASSO 4: ATUALIZAR O TOTAL E STATUS
UPDATE pedido
SET valor_total = 84.38,
    status = 'Preparando'
WHERE id_pedido = @pedido;

-- PASSO 5: REGISTRAR PAGAMENTO
INSERT INTO pagamento (id_pedido, id_forma_pagamento, valor, data_pagamento) VALUES
(@pedido,1,84.38, NOW());

-- CONSULTAR DADOS EM TABELAS BD
-- CONSULTAR TODA A TABELA
SELECT * FROM categoria;
SELECT * FROM cliente
WHERE id_cliente =  51;

