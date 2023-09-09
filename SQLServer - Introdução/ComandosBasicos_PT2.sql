-- Cria um banco de dados.
CREATE DATABASE Vendas;

-- Utiliza o banco de dados.
USE Vendas;

-- Cria uma tabela.
CREATE TABLE Categorias(
	codigo INTEGER NOT NULL IDENTITY PRIMARY KEY,
	descricao VARCHAR(30) NULL
);

-- Insere informa��es na tabela.
INSERT INTO Categorias (descricao) VALUES
	('Limpeza'),
	('Alimenta��o'),
	('Higiene');

-- Seleciona todas as informa��es da tabela.
SELECT * FROM Categorias;

-- Seleciona as informa��es da tabela pelas colunas escolhidas.
SELECT codigo, descricao FROM Categorias;
SELECT codigo FROM Categorias;
SELECT descricao FROM Categorias;

-- Utilizando WHERE para filtragem.
SELECT codigo, descricao FROM Categorias WHERE codigo = 1;									-- Igual
SELECT codigo, descricao FROM Categorias WHERE codigo <> 2;									-- Diferente
SELECT codigo, descricao FROM Categorias WHERE codigo < 3;									-- Menor que
SELECT codigo, descricao FROM Categorias WHERE codigo > 1;									-- Maior que
SELECT codigo, descricao FROM Categorias WHERE codigo >= 2;									-- Maior ou igual que
SELECT codigo, descricao FROM Categorias WHERE codigo <= 1;									-- Menor ou igual que
SELECT codigo, descricao FROM Categorias WHERE codigo IN (1, 3);							-- Valores exatos
SELECT codigo, descricao FROM Categorias WHERE codigo NOT IN (1, 2);						-- Valores exatos com Nega��o
SELECT codigo, descricao FROM Categorias WHERE codigo BETWEEN 1 AND 3;						-- Valores exatos
SELECT codigo, descricao FROM Categorias WHERE descricao = 'Alimenta��o' OR codigo = 1;		-- Valores VARCHAR e operador OU (OR).
SELECT codigo, descricao FROM Categorias WHERE descricao LIKE '%a%';						-- Operador Like: cont�m letra 'a'.
SELECT codigo, descricao FROM Categorias WHERE descricao LIKE 'al%';						-- Operador Like: come�a com a palavra 'al'.
SELECT codigo, descricao FROM Categorias WHERE descricao LIKE '%ene';						-- Operador Like: termina com a letra 'ene'.

-- Atualizar registros (UPDATE):
-- � importante realizar um SELECT com o WHERE que ser� utilizado no UPDATE, para verificar se os dados alterados s�o os desejados.
SELECT * FROM Categorias WHERE codigo = 3; 
UPDATE Categorias SET descricao = 'Higiene Pessoal' WHERE codigo = 3;

SELECT * FROM Categorias WHERE codigo = 1;
UPDATE Categorias SET descricao = 'Limpeza de banheiro' WHERE codigo = 1;

SELECT * FROM Categorias WHERE codigo = 2;
UPDATE Categorias SET descricao = 'Alimenta��o saud�vel' WHERE codigo = 2;

-- Apagar registros (DELETE):
-- � importante realizar um SELECT com o WHERE que ser� utilizado no UPDATE, para verificar se os dados alterados s�o os desejados.
SELECT * FROM Categorias WHERE codigo = 2;
DELETE FROM Categorias WHERE codigo = 2;
DELETE Categorias WHERE codigo = 2; -- Outra sintaxe espec�fica do SQLServer.
DELETE Categorias; -- Sem Where, ir� apagar todos os registros.

-- Apagar sequ�ncia das chaves prim�rias.
DBCC CHECKIDENT ('Categorias', RESEED, 0);

-- Visualizar estrutura do Banco de dados e das tabelas.
SP_HELPDB Vendas;
SP_HELP Categorias;

-- Ordenar a sele��o de registros
SELECT * FROM Categorias ORDER BY codigo;		-- Padr�o ascedente (ASC);
SELECT * FROM Categorias ORDER BY codigo ASC;	-- Ascedente (ASC).
SELECT * FROM Categorias ORDER BY codigo DESC;	-- Decrescente (DESC).
SELECT * FROM Categorias ORDER BY descricao ASC;
SELECT * FROM Categorias ORDER BY descricao DESC;

-- Utilizar tabelas tempor�rias (assim que fechar a conex�o, as tabelas s�o destru�das).
SELECT * INTO #TEMP01_CATEGORIAS FROM Categorias;			-- Tabela tempor�ria local
INSERT INTO #TEMP01_CATEGORIAS (descricao) VALUES
	('Lanches');

SELECT * FROM Categorias;
SELECT * FROM #TEMP01_CATEGORIAS;

SELECT * INTO ##TEMP02_CATEORIAS_GLOBAL FROM Categorias;	-- Tabela tempor�ria global
INSERT INTO ##TEMP02_CATEORIAS_GLOBAL (descricao) VALUES
	('Artigos de escrit�rio');

SELECT * FROM Categorias;
SELECT * FROM ##TEMP02_CATEORIAS_GLOBAL;

CREATE TABLE #TESTE_LOCAL(		-- Criando tabela tempor�ria local
	codigo INTEGER NOT NULL IDENTITY PRIMARY KEY,
	teste VARCHAR(30) NULL
);
CREATE TABLE ##TESTE_GLOBAL(		-- Criando tabela tempor�ria local
	codigo INTEGER NOT NULL IDENTITY PRIMARY KEY,
	teste VARCHAR(30) NULL
);

INSERT INTO #TESTE_LOCAL (teste) VALUES
	('Frutas'),
	('Verduras'),
	('Massas');

INSERT INTO ##TESTE_GLOBAL (teste) VALUES
	('Bebidas'),
	('Legumes'),
	('Carnes');

SELECT * FROM #TESTE_LOCAL;
SELECT * FROM ##TESTE_GLOBAL;