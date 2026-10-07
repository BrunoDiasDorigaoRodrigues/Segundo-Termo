-- Active: 1788351676172@@127.0.0.1@3306@smartcoffee_dml_bruno
-- ============================================================
-- AULA 09 - ATIVIDADE PRÁTICA DE DQL
-- Nome: _______________________________________________
-- Turma: ______________________ Data: _________________
-- Base: smartcoffee_dql
-- ============================================================
USE smartcoffee_dql;

-- PARTE A - AQUECIMENTO

-- 1. Liste todos os clientes cadastrados.
SELECT nome AS cliente
FROM cliente;

-- 2. Exiba apenas nome, cidade e e-mail dos clientes.
SELECT nome, cidade, email AS cliente
FROM cliente;

-- 3. Liste os nomes das cidades sem repetir valores.
SELECT DISTINCT cidade
FROM cliente;

-- 4. Liste todos os produtos em ordem crescente de preço.
SELECT nome 
FROM  produto
ORDER BY preco ASC;

-- 5. Mostre apenas os 5 produtos mais caros.
SELECT nome, preco 
FROM produto
ORDER BY preco DESC
LIMIT 5;

-- PARTE B - FILTROS

-- 6. Liste os produtos com preço entre R$ 8,00 e R$ 15,00.
SELECT nome, preco 
FROM produto
WHERE preco BETWEEN 8.00 AND 15.00;

-- 7. Liste os clientes das cidades Limeira ou Americana.
SELECT nome, cidade
FROM cliente
WHERE cidade IN ('limeira','Americana');

-- 8. Localize os produtos cujo nome contém a palavra “Café”.
SELECT nome  
FROM produto
WHERE nome LIKE 'café%'

-- 9. Liste os clientes que não informaram telefone.
SELECT nome, telefone
FROM cliente
WHERE telefone IS NULL;

-- 10. Mostre os pedidos FINALIZADOS com valor acima de R$ 20,00,
--     do maior para o menor valor.
SELECT nome, preco
FRoM produto
WHERE preco >= 20;
-- PARTE C - CÁLCULOS E AGRUPAMENTOS

-- 11. Informe quantos produtos estão cadastrados.
SELECT nome AS produtos
FROM produto;

-- 12. Mostre menor preço, maior preço e preço médio dos produtos.
SELECT MIN(preco) AS Menor_Precos
FROM produto;
SELECT AVG(preco) AS Media_Precos
FROM produto;
SELECT SUM(preco) AS Maior_Precos
FROM produto;

-- 13. Informe quantos clientes existem em cada cidade.
SELECT cidade, COUNT(*) AS quantidade_clientes
FROM cliente
GROUP BY cidade
HAVING COUNT(*) >= 2;

-- 14. Mostre somente as cidades que possuem dois ou mais clientes.
SELECT cidade, COUNT(*) AS quantidade_clientes
FROM cliente
GROUP BY cidade
HAVING COUNT(*) >= 2;

-- 15. Calcule o faturamento total considerando apenas pedidos FINALIZADOS.

SELECT SUM(valor_total) AS faturamento_total
FROM pedido
WHERE status = 'Aberto '


