--Uma subquery é uma consulta dentro de outra consulta.
--Ela serve para fornecer dados para a consulta principal, podendo retornar um valor, uma linha, uma tabela, ou até uma condição lógica.

--No SELECT como uma coluna calculada
--No FROM como uma tabela temporária (tabela derivada)
--No WHERE ou HAVING como condição

--exemplo 1: Subquery no SELECT
SELECT 
    Nome,
    (SELECT COUNT(*) 
     FROM Pedidos p 
     WHERE p.ClienteID = c.ID) AS TotalPedidos
FROM Clientes c;
--contar quantos pedidos cada cliente fez. Aqui, para cada cliente, a subquery conta quantos pedidos ele fez.

--exemplo 2: Subquery no WHERE
SELECT Nome, Preco
FROM Produtos
WHERE Preco > (
    SELECT AVG(Preco)
    FROM Produtos
);
--listar produtos mais caros que a média dos preços.
--Aqui, a subquery calcula a média dos preços, e o SELECT principal mostra os produtos acima da média.

--exemplo 3: Subquery no FROM
SELECT Categoria, MediaPreco
FROM (
    SELECT Categoria, AVG(Preco) AS MediaPreco
    FROM Produtos
    GROUP BY Categoria
) AS Sub;
--usar uma subquery como tabela intermediária.
--Aqui, a subquery agrupa os produtos por categoria e calcula a média. A consulta externa mostra o resultado.

--Onde usar subqueries:
--Precisa de um valor calculado	No SELECT
--Precisa filtrar com base em outra tabela	No WHERE ou HAVING
--Quer criar uma tabela intermediária	No FROM
--Precisa verificar existência	Com EXISTS