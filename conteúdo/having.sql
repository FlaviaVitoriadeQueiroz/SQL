--HAVING é usado para filtrar os resultados de grupos, criados pelo GROUP BY
--Ele é parecido com o WHERE, mas enquanto WHERE filtra linhas individuais, o HAVING filtra grupos agregados.

SELECT ClienteID, SUM(Valor) AS TotalGasto
FROM Pedidos
GROUP BY ClienteID
HAVING SUM(Valor) > 200;
--O group by agrupa os pedidos por cliente, somando o valor gasto por cada um.
--O HAVING filtra esses grupos, retornando apenas os clientes que gastaram mais de 200.

SELECT ClienteID, COUNT(*) AS TotalPedidos
FROM Pedidos
WHERE Valor > 50              -- Filtra pedidos com valor > 50
GROUP BY ClienteID
HAVING COUNT(*) > 1;          -- Filtra clientes com mais de 1 pedido
--Aqui o WHERE filtra os pedidos antes do agrupamento, e o HAVING filtra os grupos após a contagem.
--where filtra linhas maiores que 50
--having filtra grupos com mais de 1 pedido