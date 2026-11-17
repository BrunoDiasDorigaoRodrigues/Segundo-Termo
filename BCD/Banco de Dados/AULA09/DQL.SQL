-- Active: 1788351676172@@127.0.0.1@3306@smartcoffee_dml_bruno
INSERT INTO cliente (nome,email,telefone,cidade,ativo) VALUES 
('Edson Wladimir', 'edson@email.com','199999888244','Paris',TRUE);

-- Exemplo de estrutura simples de SELECT
-- SELECT coluna
-- FROM tabela;

-- EX 1: SELECT para consultar todas as colunas
SELECT * FROM cliente;

-- EX 2: consultando por colunas
SELECT nome, email FROM cliente;

-- EX 3: Inserindo apelido nas colunas -- alias
SELECT nome AS cliente
FROM cliente;
SELECT nome as cliente, telefone AS contato, ativo AS STATUS
FROM cliente;
SELECT nome, preco, preco * 0.90 AS Preco_Promocional
FROM produto;

-- EX 4: DISTINCT - eliminar repetições

SELECT cidade FROM cliente;

SELECT DISTINCT cidade
FROM cliente;

-- SEM DISTINCT O ITEM IRÁ APARECER VÁRIAS VEZES
-- COM DISTINCT O ITEM IRÁ APARECER APENAS UMA VEZ

-- EX 5: filtro em registros
SELECT nome, preco
FRoM produto
WHERE preco > 10;
-- RETORNA VALORES ACIMA DE 10 REAIS EM SEUS PREÇOS

SELECT nome, preco
FROM cliente 
WHERE ativo = TRUE;
-- RETORNA PRODUTOS ATIVOS

SELECT id_pedido, data_pedido, valor_total
FROM pedido
WHERE valor_total >= 25.00;
-- RETORNA PEDIDOS ACIMA DE DETERMINADO VALOR

-- OPERADORES DE COMPARAÇÃO 
-- = IGUAL
-- <> OU != DIFERENTE
-- > MAIOR QUE
-- >= MAIOR OU IGUAL QUE
-- < MENOR QUE
-- <= MENOR OU IGUAL QUE

-- EX 6: uso de AND, OR e NOT

SELECT nome, preco
FROM produto
WHERE preco >= 8.00 AND preco <= 20.00;


-- OR - PELO MENOS UMA CONDIÇÃO VERDADEIRA

SELECT nome, cidade
FROM cliente
WHERE cidade = 'Limeira' OR cidade = 'Piracicaba';

--NOT - NEGAR NÃO TRAZER RESULTADO QUE FOI APRESENTADO
SELECT nome,cidade
FROM cliente
WHERE NOT cidade = 'Limeira';
-- ELE VAI TRAZER QUALQUER CIDADE QUE NÃO FOR LIMEIRA

-- JUNTOS - AND E OR SEMPRE UTILIZAR OS ()
SELECT nome, cidade, ativo AS STATUS
FROM cliente
WHERE ativo = TRUE
AND (cidade = 'Limeira' OR 'Americana');

-- EX: 7 pesquisando por intervalos - BETWEEN
SELECT nome, preco 
FROM produto
WHERE preco BETWEEN 8.00 AND 15.00;

SELECT id_pedido, data_pedido, valor_total
FROM pedido
WHERE data_pedido BETWEEN '2026-09-01 00:00:00' AND '2026-09-30 23:59:59';

-- EX 8: IN com várias possibilidades
SELECT nome, cidade
FROM cliente
WHERE cidade IN ('limeira','Americana','Piracicaba')

SELECT nome, cidade
From cliente
WHERE cidade ON NOT IN ('Limeira','Campinas');

-- EX 9: Exmplo com textos ou pesquisar por textos - LIKE
-- coringas
-- % Vários caracteres
-- _ exatamnete um Caracter 

SELECT nome  
FROM produto
WHERE nome LIKE 'café%'
-- retornar produtos que possuem a palavra café e que começam com ela

SELECT nome 
FROM produto 
WHERE nome LIKE '%chocolate%';
-- retornar produtos que possuem a palavra chocolate

SELECT nome 
FROM produto
WHERE nome LIKE '%Silva';
-- Retornar nomes que terminam com silva

SELECT nome 
FROM produto
WHERE nome LIKE '_afé%';

-- EX 10: NULL - ausencia de valor
SELECT nome, telefone
FROM cliente
WHERE telefone IS NULL;

SELECT nome, telefone
FROM cliente
WHERE telefone IS NOT NULL;

-- EX 11: ORDER BY - ordenar resultados
-- ASC significa crescente
-- DESC significa DECRESCENTe

SELECT nome, preco 
FROM  produto
ORDER BY preco ASC;

SELECT nome, preco 
FROM produto
ORDER BY preco DESC;

SELECT cidade, nome 
FROM cliente
ORDER BY cidade ASC, nome DESC;

-- EX 12: LIMIT - limitando a quantidade de linha 
SELECT nome, preco 
FROM produto
ORDER BY preco DESC
LIMIT 8;

SELECT nome, preco 
FROM produto
ORDER BY nome
LIMIT 8 OFFSET 8;

-- EX 13: cálculo de colunas
SELECT nome, preco, preco * 2.00 AS preco_atualizado
FROM produto;

SELECT id_item, quantidade, preco_unitario, quantidade * preco_unitario AS Total_Compra
FROM item_pedido;

-- EX 14: funções para consulta 
-- textos
SELECT UPPER(nome) AS Nome_Cliente, LOWER(email) AS Email_Minusculo 
FROM cliente;

SELECT CONCAT(nome, ' - ', cidade) AS Cliente_Cidade
FROM cliente;

SELECT nome, preco, ROUND(preco * 0.90, 2) AS preço_Desconto
FROM produto;

-- DATAS
SELECT id_pedido, data_pedido, DAY(data_pedido) AS DIA, MONTH(data_pedido) AS MÊS, YEAR(data_pedido) AS ANO 
FROM pedido;

-- SUBSTITUINDO O NULL NO RESULTADO
SELECT nome, COALESCE(telefone, 'Não Informado') AS Contato 
FROM cliente;

-- Ex 15: Funções de agregação - sum, avg, min, max, count
-- COUNT - contar quantidade de registros
--sum- soma de valores 
-- avg - media de valores
-- min - menor valor
-- max - maior valor

SELECT COUNT(*) AS Total_Clientes
FROM cliente;
-- resultado de quantidade de clientes

SELECT AVG(preco) AS Media_Precos
FROM produto;
-- media do valor dos produtos

SELECT MIN(preco) AS promoção, MAX(preco) AS reajuste, AVG(preco) AS media_precos
FROM produto;
-- Resumo de precos

SELECT SUM(valor_total) AS faturamento_mensal
FROM pedido
WHERE status = 'ABERTO'
-- Total de pedidos finalizados ou Abertos

-- EX 16: GROUP BY - agrupar dados
SELECT cidade, COUNT(*) AS qtde_cidades
FROM cliente
GROUP BY cidade;
-- consulta por grupos de cidades

SELECT id_categoria, COUNT(*) AS qtde_cidades
FROM produto 
GROUP BY id_categoria;
-- Quantidade de produtos por categoria

-- EX 17: HAVING - Filtro por grupos
SELECT cidade, COUNT(*) AS quantidade_clientes
FROM cliente
GROUP BY cidade
HAVING COUNT(*) >= 2;

-- dica: usar o HAVING e não esquecer o GROUP BY

----------------------------------------------------------
-- EX: 18 consulta completa
SELECT colunas
FROM tabela
WHERE condicao
GROUP BY colunas_agrupar
HAVING condicao 
ORDER BY colunas
LIMIT quantidade;
-- Dica para seguir em ordem lógica para ua consulta parcial ou completa
----------------------------------------------------------

SELECT COUNT(nome) AS Total_produtos
FROM produto;

-- PARTE 2 - RELACIONAMENTOS ENTRE TABELAS - JOINS
-- JOIN - JUNÇÃO DE TABELAS
-- EX 19: PEDIDOS COM O NOME DO CLIENTE
-- INNER JOIN - RETORNA REGISTROS QUE POSSUEM CORRESPONDÊNCIAS ENTRE TABELAS

SELECT P.id_pedido, P.data_pedido, C.nome AS cliente, P.valor_total
FROM pedido AS P
INNER JOIN cliente AS C 
ON C.id_cliente = P.id_cliente;

-- OBS: RELACIONE O CLIENte CUJO ID_CLIENTE GRAVADO NO PEDIDO
-- P E C SÃO APELIDOS OU ALIASES PARA DEIXAR MAIS CURTAS E LEGÍVEIS

-- LEFT JOIN - MANTÉM TODOS OS REGISTROS DA TABELA DA ESQUERDA MESMO QUANDO NÃO POSSUI CORRESPONDÊNCIA NA TABELA DA DIREITA
-- EX 20: TODOS OS CLIENTES< INCLUSIVE QUEM NUNCA COMRPOU OU QUEM NUNCA REALIZOU PEDIDO

SELECT C.nome, P.id_pedido, P.data_pedido
FROM cliente AS C 
LEFT JOIN pedido AS P  
ON P.id_cliente = C.id_cliente
ORDER BY C.nome

-- EX 21: CLIENTES SEM PEDIDOS
SELECT C.id_cliente, C.nome 
FROM cliente AS C 
LEFT JOIN pedido AS P
ON P.id_cliente = C.id_cliente
WHERE P.id_pedido IS NULL;

-- JOIN COM TRÊS TABELAS
-- EX 22: ITENS DE PEDIDO COM NOME DO PRODUTO
SELECT P.id_pedido, PR.nome AS produto, IP.quantidade, IP.preco_unitario,
IP.quantidade * IP.preco_unitario AS subtotal
FROM pedido AS P
INNER JOIN item_pedido AS IP
ON IP.id_pedido = P.id_pedido
INNER JOIN produto AS PR 
ON PR.id_produto = IP.id_produto
ORDER BY P.id_pedido;

-- EX 23 - AGREGAÇÃO + JOINS
-- QUANTIDADE DE PRODUTOS POR CATEGORIA
SELECT CA.nome AS categoria, COUNT(PR.id_produto) AS qtde_produtos
FROM categoria AS CA
LEFT JOIN produto AS PR
ON PR.id_categoria = CA.id_categoria
GROUP BY CA.id_categoria, CA.nome
ORDER BY qtde_produtos DESC;

-- EX 24: TOTAL COMPRADO POR CLIENTE
SELECT C.nome AS cliente, COUNT(P.id_pedido) AS qtde_pedidos, SUM(P.valor_total) AS total_comprado
FROM cliente AS C 
INNER JOIN pedido AS P
ON P.id_cliente = C.id_cliente
WHERE P.status = 'PREPARANDO'
GROUP BY C.id_cliente, C.nome
ORDER BY total_comprado DESC;

-- RELATORIO COMPLETo DO PEDIDO
-- EX 25: COMBINAR VÁRIAS TABELAS EM UMA CONSULTA
SELECT P.id_pedido, DATE_FORMAT(P.data_pedido, '%d %m %Y %H:%I') AS DATA,
C.nome AS cliente, PR.nome AS produto, IP.quantidade, IP.preco_unitario, IP.quantidade * IP.preco_unitario AS subtotal
FROM pedido AS P 
INNER JOIN cliente AS C
ON C.id_cliente = P.id_cliente
INNER JOIN item_pedido AS IP
ON IP.id_pedido = P.id_pedido
INNER JOIN produto AS PR 
ON PR.id_produto = IP.id_produto
ORDER BY P.id_pedido, PR.nome;

-- OBS: PADRÃO DE FORMATAÇÃO DE DATA NO BRASIL
-- DATE_FORMAT(P.DATA_PEDIDO, '%d %m %Y %H:%I')

-- CRIANDO CLASSIFICAÇÕES
-- EX 26 - CASE - PERMITE CONSTRUIR UMA CLASSIFICAÇÃO BASEADA EM REGRAS
SELECT nome, preco, 
CASE
    WHEN preco < 8.00 THEN 'Economico'
    WHEN preco <= 15.00 THEN 'Intermediário'
    ELSE 'premium'
END AS CLASSIFICAÇÃO
FROM produto
ORDER BY preco;

-- SUBCONSULTA
-- É UMA CONSULTA DENTRO DE OUTRA CONSULTA
-- EX 27: PRODUTOS ACIMA DO PRECO MEDIO
SELECT nome, preco
FROM produto 
WHERE preco > (SELECT AVG(preco)
FROM produto
)
ORDER BY preco DESC;

-- DEMONSTRAÇÃO COMPLETA E FINAL
-- PASSO 1 - VISUALIZAR PRODUTOS
SELECT * FROM produto;
-- PASSO 2 - SELECIONAR SOMENTE O NECESSARIO
SELECT nome, preco FROM produto;
--PASSO 3 - FILTRO
SELECT nome, preco FROM produto
WHERE preco >= 10;
-- PASSO 4 - ORDENAR INFORMAÇÕES
SELECT nome, preco FROM produto
WHERE preco >= 10.00
ORDER BY preco DESC;
-- PASSO 5 - MOSTRAR CATEGORIA
SELECT PR.nome AS produto, CA.nome AS categoria, PR.preco 
FROM produto AS PR
INNER JOIN categoria AS CA 
ON CA.id_categoria = PR.id_categoria
WHERE PR.preco >= 10.00
ORDER BY PR.preco DESC;

-- PASSO 6 - PERGUNTA GERENCIAL
SELECT CA.nome AS categoria, COUNT(PR.id_produto) AS produtos, ROUND(AVG(PR.preco), 2) AS preco_medio
FROM categoria AS CA
INNER JOIN produto AS PR
ON PR.id_categoria = CA.id_categoria
GROUP BY CA.id_categoria, CA.nome
ORDER BY preco_medio DESC;