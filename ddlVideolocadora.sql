/*
	DDL - Video Locadora 
	16/11/2020
	Mateus de Jesus Santos
	Projeto de Banco de Dados do Centro Paula Souza
*/

DROP DATABASE IF EXISTS VideoLocadora;

CREATE DATABASE VideoLocadora;

USE VideoLocadora;

-- Criação da tabela Cliente
CREATE TABLE Cliente(
	CodCliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Nome VARCHAR(80) NOT NULL,
	Endereco VARCHAR(80) NOT NULL, 
	Telefone CHAR(11),
	Cpf CHAR(11) NOT NULL
);

-- Criação de um índice de Nome na tabela Cliente
CREATE INDEX IDX_Nome 
	ON Cliente(Nome);

-- Criação de um índice único de Cpf na tabela Cliente
CREATE UNIQUE INDEX IDX_Cpf
	ON Cliente(Cpf);

-- Criação da tabela Cliente Especial
CREATE TABLE ClienteEspecial(
	CodCliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	BonusLocacao INT NOT NULL,
	DescontoPercentual DECIMAL(5,2) NOT NULL
);

-- Relacionando as tabelas Cliente e Cliente Especial 1:1
ALTER TABLE ClienteEspecial
	ADD CONSTRAINT FK_Cliente_ClienteEspecial
		FOREIGN KEY(CodCliente)
		REFERENCES Cliente(CodCliente);

-- Criação da tabela Locacao
CREATE TABLE Locacao(
	CodEmprestimo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	CodCliente INT NOT NULL,
	CodDVD INT NOT NULL,
	DataLocacao DATETIME,
	Devolvido BIT NOT NULL,
	Historico BIT
);

-- Criação da tabela Distribuidor
CREATE TABLE Distribuidor(
	CodDistribuidor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	RazaoSocial VARCHAR(40) NOT NULL,
	Endereco VARCHAR(80) NOT NULL,
	Telefone CHAR(11) NOT NULL,
	NomeContato VARCHAR(12),
	Cnpj CHAR(14) NOT NULL
);

-- Criação de um índice único de Cnpj na tabela Distribuidor
CREATE UNIQUE INDEX IDX_Cnpj
	ON Distribuidor(Cnpj);

-- Criação da tabela DVD
CREATE TABLE Dvd(
	CodDVD INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	CodDistribuidor INT NOT NULL,
	Titulo VARCHAR(20) NOT NULL,
	Sinopse VARCHAR(92),
	Duracao INT,
	Valor CHAR(5),
	Quantidade CHAR(99) NOT NULL,
	PrazoLocacao INT
);

-- Relacionando as tabelas Distribuidor e Dvd 1:N
ALTER TABLE Dvd
	ADD CONSTRAINT FK_Distribuidor_Dvd
		FOREIGN KEY(CodDistribuidor)
		REFERENCES Distribuidor(CodDistribuidor);

-- Relacionamento N:N
-- Pimeira parte
ALTER TABLE Locacao
	ADD CONSTRAINT FK_Dvd_Locacao
		FOREIGN KEY(CodDvd)
		REFERENCES Dvd(CodDvd);

-- Segunda parte
ALTER TABLE Locacao
	ADD CONSTRAINT FK_Cliente_Locacao
		FOREIGN KEY(CodCliente)
		REFERENCES Cliente(CodCliente);