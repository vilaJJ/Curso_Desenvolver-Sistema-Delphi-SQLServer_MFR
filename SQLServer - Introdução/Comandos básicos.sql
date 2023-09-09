-- Criar banco de dados
CREATE DATABASE DB_TESTE2;

-- Utilizar
USE DB_TESTE;

-- Apagar banco de dados
DROP DATABASE DB_TESTE;

-- Criar tabela
CREATE TABLE MinhaPrimeiraTabela(
	id INT IDENTITY NOT NULL PRIMARY KEY,
	descricao VARCHAR(30) NULL
);

-- Alterar tabela
ALTER TABLE MinhaPrimeiraTabela ADD flagAtivo BIT;
ALTER TABLE MinhaPrimeiraTabela DROP COLUMN flagAtivo;

-- Excluir tabela
DROP TABLE MinhaPrimeiraTabela;