--EXISTS
SELECT Nome
FROM Clientes AS c
WHERE EXISTS (
    SELECT *
    FROM Pedidos AS p
    WHERE p.ClienteID = c.ID
);

--EXISTS verifica se existe pelo menos uma linha retornada por uma subconsulta.
--Se existe algum resultado, retorna TRUE.
--Se não existir nenhum, retorna FALSE.

--ANY
SELECT Nome
FROM Produtos
WHERE Preco > ANY (
    SELECT Preco
    FROM Produtos
    WHERE Categoria = 'Promoção'
);
--Esse SELECT retorna produtos **mais caros que pelo menos um produto da categoria 'Promoção'.

--ANY é usado para comparar um valor com o resultado de uma subconsulta que retorna vários valores.
--Ele verifica se a condição é verdadeira para pelo menos um valor da subconsulta.

--outro exemplo:
SELECT Nome
FROM Clientes
WHERE Cidade = ANY (
    SELECT Cidade
    FROM Filiais
);
--Lista todos os clientes que estão em qualquer cidade onde há uma filial.
--= ANY (mesmo que dizer "está contido em")

--ALL
SELECT Nome
FROM Produtos
WHERE Preco > ALL (
    SELECT Preco
    FROM Produtos
    WHERE Categoria = 'Promoção'
);
--Retorna os produtos cujos preços são maiores do que TODOS os preços dos produtos da categoria Promoção.

--O operador ALL é usado para comparar um valor com todos os valores retornados por uma subconsulta.
--A condição só será verdadeira se for verdadeira para todos os valores da subconsulta.
