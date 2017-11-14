/*
	1 - Davison Casagrande - RA 1701749
	2 - Victor Vinicius G. Barbosa - RA 1700642
	3 - Bruno C. Zaccariello - RA 1700604
	4 -	Gabriel Aubert Costa - RA 1700382
	5 - Leonardo de Melo Cardoso - RA 1700579
	6 - Eduardo Marinho - RA 1700158
	SI 2B - NOITE
 */


DECLARE @dbName VARCHAR(10)
SET @dbName = 'IMPACTA'

IF(EXISTS (SELECT name 
			FROM master.dbo.sysdatabases 
			WHERE name = @dbName))
BEGIN
	USE master
	DROP DATABASE IMPACTA
END
CREATE DATABASE IMPACTA
GO

USE IMPACTA;
GO

CREATE SCHEMA LMS
GO

CREATE TABLE LMS.Curso
(
	ID INT ,
	Sigla VARCHAR(5) NOT NULL,
	Nome VARCHAR(50) NOT NULL,
	CONSTRAINT PK_Curso PRIMARY KEY(ID),
	CONSTRAINT UQ_Curso_Sigla UNIQUE(Sigla),
	CONSTRAINT UQ_Curso_Nome UNIQUE(Nome)
)

CREATE TABLE LMS.GradeCurricular
(
	ID INT,
	ID_Curso INT NOT NULL,
	Ano SMALLINT NOT NULL,
	Semestre CHAR(1) NOT NULL,
	CONSTRAINT PK_GradeCurricular PRIMARY KEY (ID),
	CONSTRAINT UQ_GradeCurricular UNIQUE(ID_Curso, Ano, Semestre)
)

CREATE TABLE LMS.Periodo
(
	ID INT,
	ID_GradeCurricular INT NOT NULL,
	Numero TINYINT NOT NULL,
	CONSTRAINT PK_Periodo PRIMARY KEY (ID),
	CONSTRAINT UQ_Perido UNIQUE(ID_GradeCurricular, Numero)
)

CREATE TABLE LMS.PeriodoDisciplina
(
	ID INT,
	ID_Periodo INT NOT NULL,
	ID_Disciplina INT NOT NULL,
	CONSTRAINT PK_PeriodoDisciplina PRIMARY KEY (ID),
	CONSTRAINT UQ_PeridoDisciplina UNIQUE(ID_Periodo, ID_Disciplina)
)

CREATE TABLE LMS.Aluno
(
	ID INT,
	RA INT NOT NULL,
	Nome VARCHAR(120) NOT NULL,
	Email VARCHAR(80) NOT NULL,
	Celular CHAR(11) NOT NULL,
	ID_Curso INT NOT NULL,
	Sigla_Curso CHAR(2) NOT NULL,
	CONSTRAINT PK_Aluno PRIMARY KEY (ID),
	CONSTRAINT UQ_Aluno_RA UNIQUE(RA)
)

CREATE TABLE LMS.CursoTurma
(
	ID INT,
	ID_Curso INT NOT NULL,
	ID_Turma INT NOT NULL,
	CONSTRAINT PK_CursoTurma PRIMARY KEY (ID),
	CONSTRAINT UQ_CursoTurma UNIQUE(ID_Curso, ID_Turma)
)

CREATE TABLE LMS.Disciplina
(
	ID INT,
	Nome VARCHAR(240) NOT NULL,
	CargaHoraria TINYINT NOT NULL,
	Teoria DECIMAL(3) NOT NULL,
	Pratica DECIMAL(3) NOT NULL,
	Ementa TEXT NOT NULL,
	Competencias TEXT NOT NULL,
	Habilidades TEXT NOT NULL,
	Conteudo TEXT NOT NULL,
	Bibliografia_Basica TEXT NOT NULL,
	Biliografia_Complementar TEXT NOT NULL,
	CONSTRAINT PK_Disciplina PRIMARY KEY (ID),
	CONSTRAINT UQ_Disciplina_Nome UNIQUE(Nome)
)

CREATE TABLE LMS.DisciplinaOfertada
(
	ID INT,
	ID_Disciplina INT NOT NULL,
	Ano SMALLINT NOT NULL,
	Semestre CHAR(1) NOT NULL,
	CONSTRAINT PK_DisciplinaOfertada PRIMARY KEY (ID),
	CONSTRAINT UQ_DisciplinaOfertada UNIQUE(ID_Disciplina, Ano, Semestre)
)

CREATE TABLE LMS.Matricula
(
	ID INT,
	ID_Aluno INT NOT NULL,
	ID_Turma INT NOT NULL,
	CONSTRAINT PK_Matricula PRIMARY KEY (ID),
	CONSTRAINT UQ_Matricula UNIQUE(ID_Aluno, ID_Turma)
)

CREATE TABLE LMS.Resposta
(
	ID INT,
	ID_Questao INT NOT NULL,
	ID_Aluno INT NOT NULL,
	Data_Avaliacao DATE NOT NULL,
	Nota DECIMAL(4,2) NOT NULL,
	Avaliacao TEXT NOT NULL,
	Descricao TEXT NOT NULL,
	Data_de_Envio DATE NOT NULL,
	CONSTRAINT PK_Resposta PRIMARY KEY (ID),
	CONSTRAINT UQ_Resposta_QuestaoAluno UNIQUE(ID_Questao, ID_Aluno)
)

CREATE TABLE LMS.Turma
(
	ID INT,
	ID_DisciplinaOfertada INT NOT NULL,
	Identificacao_Turma CHAR(1) NOT NULL, -- Alterado ID (Char(1)) para Identificação_Turma
	Turno VARCHAR(15) NOT NULL,
	ID_Professor INT NOT NULL, --(fk professor)
	CONSTRAINT PK_Turma PRIMARY KEY (ID),
	CONSTRAINT UQ_Turma_DisciplinaofertadaProfessor UNIQUE(ID_DisciplinaOfertada, ID_Professor)
)

CREATE TABLE LMS.Questao
(
	ID INT,
	ID_Turma INT NOT NULL,
	Numero INT NOT NULL,
	Data_Limite_Entrega DATE NOT NULL,
	Descricao TEXT NOT NULL,
	Data DATE NOT NULL, 
	CONSTRAINT PK_Questao PRIMARY KEY (ID),
	CONSTRAINT UQ_Questao UNIQUE(ID_Turma, Numero)
)

CREATE TABLE LMS.ArquivosResposta
(
	ID INT,
	ID_Resposta INT NOT NULL,
	Arquivo VARCHAR(500) NOT NULL,
	CONSTRAINT PK_ArquivosResposta PRIMARY KEY (ID),
	CONSTRAINT UQ_ArquivosResposta UNIQUE(ID_Resposta, Arquivo)
)

CREATE TABLE LMS.Professor
(
	ID INT,
	RA INT NOT NULL,
	Apelido VARCHAR(30) NOT NULL,
	Nome VARCHAR(120) NOT NULL,
	Email VARCHAR(80) NOT NULL,
	Celular CHAR(11) NOT NULL,
	CONSTRAINT PK_Professor PRIMARY KEY (ID),
	CONSTRAINT UQ_Professor_RA UNIQUE(RA),
	CONSTRAINT UQ_Professor_Apelido UNIQUE(Apelido)
)

CREATE TABLE LMS.ArquivosQuestao
(
	ID INT,
	ID_Questao INT NOT NULL,
	Arquivo VARCHAR(500) NOT NULL,
	CONSTRAINT PK_ArquivosQuestao PRIMARY KEY (ID),
	CONSTRAINT UQ_ArquivosQUestao UNIQUE(ID_Questao, Arquivo)
)

ALTER TABLE LMS.GradeCurricular
ADD CONSTRAINT FK_GradeCurricular_Curso FOREIGN KEY (ID_Curso) REFERENCES LMS.Curso(ID);

ALTER TABLE LMS.Periodo
ADD CONSTRAINT FK_Periodo_GradeCurricular FOREIGN KEY (ID_GradeCurricular) REFERENCES LMS.GradeCurricular(ID);

ALTER TABLE LMS.PeriodoDisciplina
ADD CONSTRAINT FK_PeriodoDisciplina_Periodo FOREIGN KEY (ID_Periodo) REFERENCES LMS.Periodo(ID)

ALTER TABLE LMS.PeriodoDisciplina
ADD CONSTRAINT FK_PeriodoDisciplina_Disciplina FOREIGN KEY (ID_Disciplina) REFERENCES LMS.Disciplina(ID)

IF COL_LENGTH('LMS.Aluno', 'ID_Curso') IS NOT NULL
BEGIN
	ALTER TABLE LMS.Aluno
	ADD CONSTRAINT FK_Aluno_Curso FOREIGN KEY (ID_Curso) REFERENCES LMS.Curso(ID);    
END

ALTER TABLE LMS.CursoTurma
ADD CONSTRAINT FK_CursoTurma_Curso FOREIGN KEY (ID_Curso) REFERENCES LMS.Curso(ID)

ALTER TABLE LMS.CursoTurma
ADD CONSTRAINT FK_CursoTurma_Turma FOREIGN KEY (ID_Turma) REFERENCES LMS.Turma(ID)

ALTER TABLE LMS.DisciplinaOfertada
ADD CONSTRAINT FK_DisciplinaOfertada_Disciplina FOREIGN KEY (ID_Disciplina) REFERENCES LMS.Disciplina(ID)

ALTER TABLE LMS.Matricula
ADD CONSTRAINT FK_Matricula_Aluno FOREIGN KEY (ID_Aluno) REFERENCES LMS.Aluno(ID)

ALTER TABLE LMS.Matricula
ADD CONSTRAINT FK_Matricula_Turma FOREIGN KEY (ID_Turma) REFERENCES LMS.Turma(ID)

ALTER TABLE LMS.Resposta
ADD CONSTRAINT FK_Resposta_Questao FOREIGN KEY (ID_Questao) REFERENCES LMS.Questao(ID)

ALTER TABLE LMS.Resposta
ADD CONSTRAINT FK_Resposta_Aluno FOREIGN KEY (ID_Aluno) REFERENCES LMS.Aluno(ID)

ALTER TABLE LMS.Turma
ADD CONSTRAINT FK_Turma_DisciplinaOfertada FOREIGN KEY (ID_DisciplinaOfertada) REFERENCES LMS.DisciplinaOfertada(ID)

ALTER TABLE LMS.Turma
ADD CONSTRAINT FK_Turma_Professor FOREIGN KEY (ID_Professor) REFERENCES LMS.Professor(ID)

ALTER TABLE LMS.Questao
ADD CONSTRAINT FK_Questao_Turma FOREIGN KEY (ID_Turma) REFERENCES LMS.Turma(ID)

ALTER TABLE LMS.ArquivosResposta
ADD CONSTRAINT FK_ArquivosResposta_Resposta FOREIGN KEY (ID_Resposta) REFERENCES LMS.Resposta(ID)

ALTER TABLE LMS.ArquivosQuestao
ADD CONSTRAINT FK_ArquivosQuestao_Questao FOREIGN KEY (ID_Questao) REFERENCES LMS.Questao(ID)


insert into LMS.Curso values (1, 'SI','Sistemas de Informação')
insert into LMS.Curso values (2, 'BD','Banco de Dados')
insert into LMS.Curso values (3, 'RC','Redes de Computadores')
insert into LMS.Curso values (4, 'ADS','Analise e Desenvolvimento de Sistemas')
insert into LMS.Curso values (5, 'JD','Jogos Digitais')

select * from LMS.Curso 

insert into LMS.GradeCurricular values()
