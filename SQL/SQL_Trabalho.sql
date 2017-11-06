/*
Davison Casagrande - RA 1701749
Victor Vinicius G. barbosa RA 1700642
Bruno C. Zaccariello RA 1700604
Gabriel Aubert Costa RA 1700382
Leonardo de Melo RA 1700579 
Eduardo Marinho RA 1700158
SI 2B - NOITE
 */

CREATE DATABASE IMPACTA
GO

CREATE SCHEMA LMS
GO


CREATE TABLE LMS.Curso(
	ID INT ,
	Sigla VARCHAR(5) NOT NULL,
	Nome VARCHAR(50) NOT NULL,
	CONSTRAINT UQ_Curso UNIQUE(Sigla, Nome),
	CONSTRAINT PK_Curso PRIMARY KEY (ID)
	)

CREATE TABLE LMS.GradeCurricular
(
	ID INT,
	Sigla_Grade VARCHAR(5) NOT NULL,
	Ano SMALLINT NOT NULL,
	Semestre CHAR(1) NOT NULL,
	CONSTRAINT PK_GradeCurricular PRIMARY KEY (ID),
	CONSTRAINT UQ_GradeCurricular UNIQUE(Sigla_Curso_Grade, Ano, Semestre),
	CONSTRAINT fk_Curso FOREIGN KEY (Sigla_Curso_Grade)

)

CREATE TABLE LMS.Periodo
(
	ID INT,
	Sigla_Periodo VARCHAR(5) NOT NULL,
	Ano_Periodo SMALLINT NOT NULL,
	Numero TINYINT NOT NULL,
	Semestre_Periodo CHAR(1) NOT NULL,
	CONSTRAINT PK_Periodo PRIMARY KEY (ID),
	CONSTRAINT UQ_Perido UNIQUE(ID_GradeCurricular, Numero)
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

CREATE TABLE LMS.PeriodoDisciplina
(
	ID INT,
	Sigla_Disciplina VARCHAR(5) NOT NULL,
	Ano_Disciplina SMALLINT NOT NULL,
	Semestre_Disciplina CHAR(1) NOT NULL,
	Numero_Disciplina TINYINT NOT NULL,
	Nome_Disciplina VARCHAR(240) NOT NULL,
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
	ID_Curso INT NOT NULL,--? POrque não é FK em aluno?
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
	CONSTRAINT UQ_Resposta_QuestaoAluno UNIQUE(ID_Questao, ID_Questao)
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
	Data DATE NOT NULL, -- Esse nome "Data" pode?
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
	CONSTRAINT UQ_Professor UNIQUE(RA),
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