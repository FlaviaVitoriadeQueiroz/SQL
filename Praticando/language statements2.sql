--DLC
--grant, O comando GRANT é usado para dar permissão a um usuário, login ou role para executar uma ação específica (como SELECT, INSERT, EXECUTE etc.).
--revoke, O comando DENY nega explicitamente uma permissão a um usuário, mesmo que ele a tenha herdado de uma role (função). Ele sobrepõe o GRANT.
--deny, O comando REVOKE remove uma permissão que foi concedida com GRANT ou negada com DENY. Após o REVOKE, o usuário volta ao estado sem permissão definida diretamente.

    --Esses comandos são usados para controlar permissões de acesso a objetos no banco de dados

--sintaxe 

--estrutura 
--GRANT permissão
--ON objeto
--TO usuário_ou_role;

--exemplo
GRANT SELECT, INSERT
ON dbo.clientes
TO joao;
    --isso permite que o usuário joao possa selecionar e inserir dados na tabela clientes.


--estrutura
--DENY permissão
--ON objeto
--TO usuário_ou_role;

--exemplo
DENY DELETE
ON dbo.clientes
TO joao;
    --Isso impede que o usuário joao possa deletar dados da tabela clientes, mesmo que ele tenha essa permissão por outro caminho.


--estrutura
--REVOKE permissão
--ON objeto
--TO usuário_ou_role;

--exemplo
REVOKE SELECT, INSERT
ON dbo.clientes
TO joao;
    --Agora o usuário joao não tem mais acesso explícito para SELECT ou INSERT na tabela clientes.



--Esses comandos servem para controlar o que acontece no banco de dados, garantindo que um conjunto de operações sejam executadas com segurança — ou todas acontecem corretamente, ou nenhuma. 
--Uma transação é um bloco de operações SQL que é tratado como uma única unidade lógica.
    --Ou seja: todas as instruções dentro da transação devem concluir com sucesso. Se alguma falhar, você pode reverter tudo com segurança usando ROLLBACK.
--TCL
--begin transaction, Iniciar uma transação
--commit, Finaliza a transação e salva todas as mudanças feitas no banco de dados.
--save transaction, Cria um ponto dentro de uma transação que pode ser usado para rollback parcial.
--rollback, Reverte todas as mudanças feitas desde o último BEGIN TRANSACTION ou SAVE TRANSACTION.

--sintaxe
BEGIN TRANSACTION;

SAVE TRANSACTION nome_do_ponto;

COMMIT;

ROLLBACK;
    --ou
ROLLBACK TRANSACTION nome_do_ponto_de_salvamento;

--exemplo 
BEGIN TRANSACTION;

BEGIN TRY
    INSERT INTO pedidos (cliente_id, data) VALUES (1, GETDATE());

    SAVE TRANSACTION ponto1;

    INSERT INTO itens_pedido (pedido_id, produto_id, quantidade)
    VALUES (999, 3, 2); -- Suponha que isso cause erro (pedido_id inexistente)

    COMMIT;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION ponto1; -- Reverte até o ponto salvo
    -- ou ROLLBACK; para reverter tudo
    PRINT ERROR_MESSAGE();
END CATCH;
