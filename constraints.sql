--DEFAULT
CREATE TABLE Usuarios (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Ativo BIT DEFAULT 1
);
--O DEFAULT define um valor padrão que será usado em uma coluna se nenhum valor for fornecido durante a inserção de dados.
--Se você inserir um novo usuário sem informar o campo Ativo, ele automaticamente será 1 (ativo).

--INDEX
CREATE INDEX idx_nome ON Usuarios(Nome);
--INDEX é usado para melhorar a performance de buscas em tabelas. Ele funciona como um índice em um livro — ajuda o banco a encontrar dados mais rapidamente.
--Tipos comuns: Índice simples (uma coluna), Índice composto (mais de uma coluna), Índice único (UNIQUE INDEX)
--Índices aceleram leitura, mas podem deixar inserções/atualizações um pouco mais lentas.
--Quando usar índices?
    --A coluna é muito usada em WHERE, JOIN, ORDER BY, GROUP BY
    --A tabela é grande
    --Você precisa melhorar a performance de leitura
--Evite criar índices demais:
    --Eles ocupam espaço em disco
    --Tornam as inserções, atualizações e deleções mais lentas (o banco precisa atualizar o índice também)

--Index com mais de uma coluna:
CREATE INDEX idx_nome_cidade ON Clientes(Nome, Cidade);
--exemplo de consulta:
SELECT * FROM Clientes WHERE Nome = 'João' AND Cidade = 'São Paulo';


--CLUSTERED INDEX
CREATE CLUSTERED INDEX idx_clientes_id ON Clientes(ID);
--Um índice clustered (agrupado) define a ordem física dos dados na tabela. Ou seja, os dados são armazenados no disco na mesma ordem do índice.
--Características:
    --Cada tabela só pode ter um CLUSTERED INDEX (pois os dados só podem estar fisicamente ordenados de uma forma).
    --Por padrão, a chave primária (PRIMARY KEY) cria um clustered index, a menos que você diga o contrário.

--NONCLUSTERED INDEX
CREATE NONCLUSTERED INDEX idx_clientes_nome ON Clientes(Nome);

--outro exemplo:
CREATE TABLE Produtos (
    ID INT PRIMARY KEY,  -- clustered index automático
    Nome VARCHAR(100),
    Categoria VARCHAR(50),
    Preco DECIMAL(10,2)
);
--Use quando:
    --Você faz buscas frequentes (WHERE) por colunas que não são a chave primária.
    --Você usa muito ORDER BY, JOIN ou GROUP BY com colunas específicas.
    --A tabela é grande e o desempenho de leitura é importante.

--INCLUDE
CREATE NONCLUSTERED INDEX idx_nome_preco
ON Produtos(Nome)
INCLUDE (Preco, Categoria);
--Você pode incluir colunas adicionais no índice para evitar ir na tabela buscar o resto dos dados. Isso é chamado de "cobrir a consulta".
--exemplo de consulta que se beneficia do índice com INCLUDE:
SELECT Nome, Preco, Categoria FROM Produtos WHERE Nome = 'Teclado';

-- Criando índice nonclustered para buscas por nome
CREATE NONCLUSTERED INDEX idx_nome ON Produtos(Nome);

--Um índice nonclustered (não agrupado) é uma estrutura separada da tabela. Ele aponta para os dados reais, como um índice no final do livro. Ou seja
--Um NONCLUSTERED INDEX é uma estrutura separada da tabela, que armazena os valores da(s) coluna(s) indexada(s) e um ponteiro para a linha real dos dados na tabela.
--Características:
    --Uma tabela pode ter vários NONCLUSTERED INDEXES.
    --É ideal para buscas em colunas que não são a chave primária, ou que não definem a ordem física dos dados.
    --Ele contém uma cópia da(s) coluna(s) indexada(s) e um ponteiro (chave de localização) para a linha real.

--CHECK
CREATE TABLE Produtos (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Preco DECIMAL(10, 2),
    CHECK (Preco >= 0)
);
--CHECK impõe uma regra de validação sobre os valores que podem ser inseridos em uma coluna. Neste caso, o preco nao pode ser negativo.
