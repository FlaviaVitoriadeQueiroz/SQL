--a lingaugem sql é dividida em 4 tipos primários
    --DML - data manipulation language
        --select, insert, update, delete

    --DDL -  data definition language
        --create, alter, drop, truncate

    --DCL - data control language
        --grant, revoke, deny

    --TCL - transaction control language
        --begin transaction, commit, save, transaction, rollback

--DML
--select, seleciona os dados em um banco de dados
--insert, insere dados em um banco de dados
--update, atualizada os dados em um banco de dados
--delete, deleta os dados em um banco de dados

    --sintaxe
    SELECT nome, idade
    FROM clientes
    WHERE idade >= 18
    ORDER BY nome ASC;


    INSERT INTO clientes (nome, idade, email)
    VALUES ('João Silva', 30, 'joao@email.com');


    UPDATE clientes
    SET idade = 31 --SET é usado para definir os novos valores das colunas ao atualizar registros
    WHERE nome = 'João Silva';


    DELETE FROM clientes
    WHERE idade < 18; --é necessário uma condição para não excluir todos os dados

--DDL
--create, para criar elementos no banco de dados, como o banco de dados, tabelas, indexes, procedures, views, functions e tiggers
--alter, altera estruturas, como o banco de dados, tabelas, indexes, procedures, views, functions e tiggers
--drop, apaga objetos, como o banco de dados, tabelas, indexes, procedures, views, functions e tiggers
--trucate, remove todos os registros de uma tabela, incluindo os espaços alocados para registros

--procedure
    --Uma procedure é um conjunto de comandos SQL armazenado no banco de dados, que pode ser executado sempre que necessário.
    --Ela funciona como uma função/método em linguagens de programação, mas no contexto de banco de dados.

--trigger
    --Uma trigger (ou gatilho) é um tipo especial de objeto no banco de dados que executa automaticamente um conjunto de comandos SQL em resposta a eventos como: INSERT, UPDATE, DELETE
    --Ou seja, é um código que é disparado automaticamente quando algo acontece em uma tabela.
    --serve para
        --Auditoria (registrar mudanças em tabelas)
        --Validação de dados
        --Atualização automática de outras tabelas
        --Bloquear ações indesejadas
    --Tipos de triggers no SQL Server:
        --AFTER trigger (ou FOR): Executa depois do evento (insert, update, delete).
        --INSTEAD OF trigger: Executa em vez do evento original — usada quando você quer substituir a ação padrão.

--Exemplo de uma trigger AFTER:
--CREATE TRIGGER trg_Auditoria_Clientes
--ON clientes
--AFTER INSERT, UPDATE
--AS
--BEGIN
    --INSERT INTO log_clientes (cliente_id, acao, data)
    --SELECT id, 'INSERT/UPDATE', GETDATE()
    --FROM inserted;
--END;
        --Nesse exemplo, toda vez que a tabela clientes for alterada, a trigger registra no log o ID do cliente e a data da alteração.


--Exemplo de trigger INSTEAD OF:
--CREATE TRIGGER trg_Bloquear_Delete_Clientes
--ON clientes
--INSTEAD OF DELETE
--AS
--BEGIN
    --PRINT 'Não é permitido deletar registros da tabela clientes.';
--END;
        --Aqui, a trigger impede a exclusão de dados na tabela clientes.


    --sintaxe
    --criando um bd
    CREATE DATABASE nome_do_banco;

    --criando uma tabela
    CREATE TABLE nome_da_tabela (
    coluna1 VARCHAR(50),
    coluna2 INT
    );

    --criando um index
    CREATE INDEX nome_do_indice
    ON nome_da_tabela (coluna1, coluna2);

    --criando um procedure
    --CREATE PROCEDURE nome_da_procedure
    --@param1 tipo, @param2 tipo
    --AS
    --BEGIN
         -- instruções SQL
    --END;

    --criando um view
    --CREATE VIEW nome_da_view AS
    --SELECT coluna1, coluna2
    --FROM tabela
    --WHERE condição;

    --criando uma function
    --CREATE FUNCTION nome_da_funcao (@param tipo)
    --RETURNS tipo_de_retorno
    --AS
    --BEGIN
        -- corpo da função
    --RETURN valor;
    --END;

    --criando um trigger
    --CREATE TRIGGER nome_da_trigger
    --ON nome_da_tabela
    --AFTER INSERT, UPDATE, DELETE
    --AS
    --BEGIN
        -- instruções SQL executadas automaticamente
    --END;

    --alterando um bd
    ALTER DATABASE nome_do_banco
    COLLATE novo_collation;

    --alterando uma tabela
    ALTER TABLE nome_da_tabela
    ADD nova_coluna tipo;

    --alterando uma coluna
    ALTER TABLE nome_da_tabela
    ALTER COLUMN nome_coluna novo_tipo;

    --removendo tabela
    EXEC sp_rename 'nome_antigo', 'nome_novo';

    --alterando procedure
    --ALTER PROCEDURE nome_da_procedure
    --@param1 tipo
    --AS
    --BEGIN
        -- nova lógica
    --END;

    --alterando view
    --ALTER VIEW nome_da_view AS
    --SELECT ...

    --alterando function
    --ALTER FUNCTION nome_da_funcao(@param tipo) RETURNS tipo
    --AS
    --BEGIN
        --RETURN ...
    --END;

    --alterando trigger
    --ALTER TRIGGER nome_da_trigger
    --ON nome_da_tabela
    --AFTER INSERT
    --AS
    --BEGIN
        -- nova lógica
    --END;

    --excluindo bd
    DROP DATABASE nome_do_banco;

    --excluindo tabela
    DROP TABLE nome_da_tabela;

    --excluindo index
    DROP INDEX nome_do_indice ON nome_da_tabela;

    --excluindo procedure
    DROP PROCEDURE nome_da_procedure;

    --excluindo view
    DROP VIEW nome_da_view;

    --excluindo function
    DROP FUNCTION nome_da_funcao;

    --excluindo trigger
    DROP TRIGGER nome_da_trigger;

    --removendo todos os elementos da tabela
    TRUNCATE TABLE nome_da_tabela;










