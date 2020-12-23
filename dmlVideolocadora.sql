/*
	DML - Video Locadora 
	16/11/2020
	Mateus de Jesus Santos
	Projeto de Banco de Dados do Centro Paula Souza
*/

USE VideoLocadora;

-- Full table Scan
SELECT *
FROM Cliente;

-- Verificando estrutura da tabela
DESCRIBE Cliente;

-- Preechendo a tabela Cliente
INSERT INTO Cliente(Nome, Endereco, Telefone, Cpf)
	VALUES('Rafael Oliveira', 'Rua Assis de Almeida', '11967637641', '42283027809');

-- Preechendo a tabela Cliente
INSERT INTO Cliente(Nome, Endereco, Telefone, Cpf)
	VALUES('Gustavo Pereira', 'Rua Castro Alves', '11990548442', '43173127908');

-- Full table Scan
SELECT *
FROM ClienteEspecial;

-- Verificando estrutura da tabela
DESCRIBE ClienteEspecial;

-- Preechendo a tabela ClienteEspecial
INSERT INTO ClienteEspecial(BonusLocacao, DescontoPercentual)
	VALUES(2, 5.25);

-- Full table Scan    
SELECT *
FROM Locacao;

-- Verificando estrutura da tabela
DESCRIBE Locacao;

-- Preechendo a tabela Locacao
INSERT INTO Locacao(CodCliente, CodDVD, DataLocacao, Devolvido, Historico)
	VALUES(1, 2, CURRENT_TIMESTAMP, 1, null);

-- Preechendo a tabela Locacao
INSERT INTO Locacao(CodCliente, CodDVD, DataLocacao, Devolvido, Historico)
	VALUES(2, 1, CURRENT_TIMESTAMP, 0, null);

-- Full table Scan
SELECT *
FROM Distribuidor;

-- Verificando estrutura da tabela
DESCRIBE Distribuidor;

-- Preechendo a tabela Distribuidor
INSERT INTO Distribuidor(RazaoSocial, Endereco, Telefone, NomeContato, Cnpj)
	VALUES('20th Century Fox', 'Av União Ferreira', '1134716973', 'Neuza Stein', '14598459095541');

-- Preechendo a tabela Distribuidor
INSERT INTO Distribuidor(RazaoSocial, Endereco, Telefone, NomeContato, Cnpj)
	VALUES('Walt Disney Studios Motion Pictures', 'Av Ferraz de Vasconcelos', '1123536825', 'Vladmir Buk', '12415733124703');

-- Full table Scan
SELECT *
FROM Dvd;

-- Verificando estrutura da tabela
DESCRIBE Dvd;

-- Preechendo a tabela Dvd
INSERT INTO Dvd(CodDistribuidor, Titulo, Sinopse, Duracao, Valor, Quantidade, PrazoLocacao)
	VALUES(1, 'Titanic', 'Navio bateu no gelo e afundou', 210, 50, 8, 3);

-- Preechendo a tabela Dvd
INSERT INTO Dvd(CodDistribuidor, Titulo, Sinopse, Duracao, Valor, Quantidade, PrazoLocacao)
	VALUES(2, 'Divertidamente', 'Bonecos que te controlam', 160, 25, 19, 2);