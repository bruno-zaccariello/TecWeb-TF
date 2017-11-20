/*
	1 - Davison Casagrande - RA 1701749
	2 - Victor Vinicius G. Barbosa - RA 1700642
	3 - Bruno C. Zaccariello - RA 1700604
	4 -	Gabriel Aubert Costa - RA 1700382
	5 - Leonardo de Melo Cardoso - RA 1700579
	6 - Eduardo Marinho - RA 1700158
	SI 2B - NOITE
 */

 --VERIFICAR PARA FAZER DROP
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
	ID INT IDENTITY,
	Sigla VARCHAR(5) NOT NULL,
	Nome VARCHAR(50) NOT NULL,
	CONSTRAINT PK_Curso PRIMARY KEY(ID),
	CONSTRAINT UQ_Curso_Sigla UNIQUE(Sigla),
	CONSTRAINT UQ_Curso_Nome UNIQUE(Nome)
)

CREATE TABLE LMS.GradeCurricular
(
	ID INT IDENTITY,
	ID_Curso INT NOT NULL,
	Ano SMALLINT NOT NULL,
	Semestre CHAR(1) NOT NULL,
	CONSTRAINT PK_GradeCurricular PRIMARY KEY (ID),
	CONSTRAINT UQ_GradeCurricular UNIQUE(ID_Curso, Ano, Semestre)
)

CREATE TABLE LMS.Periodo
(
	ID INT IDENTITY,
	ID_GradeCurricular INT NOT NULL,
	Numero TINYINT NOT NULL,
	CONSTRAINT PK_Periodo PRIMARY KEY (ID),
	CONSTRAINT UQ_Perido UNIQUE(ID_GradeCurricular, Numero)
)

CREATE TABLE LMS.PeriodoDisciplina
(
	ID INT IDENTITY,
	ID_Periodo INT NOT NULL,
	ID_Disciplina INT NOT NULL,
	CONSTRAINT PK_PeriodoDisciplina PRIMARY KEY (ID),
	CONSTRAINT UQ_PeridoDisciplina UNIQUE(ID_Periodo, ID_Disciplina)
)

CREATE TABLE LMS.Aluno
(
	ID INT IDENTITY,
	RA INT NOT NULL,
	Nome VARCHAR(120) NOT NULL,
	Email VARCHAR(80) NOT NULL,
	Celular CHAR(11) NOT NULL,
	ID_Curso INT NOT NULL,--? POrque não é FK em aluno? Criar em forma de descrição e perguntar para o professor. Executar em teste o FK.
	--Sigla_Curso CHAR(2) NOT NULL, --**? Não existe referencia para fk, então devo manter a coluna sigla de Curso?
	CONSTRAINT PK_Aluno PRIMARY KEY (ID),
	CONSTRAINT UQ_Aluno_RA UNIQUE(RA)
)

CREATE TABLE LMS.CursoTurma
(
	ID INT IDENTITY,
	ID_Curso INT NOT NULL,
	ID_Turma INT NOT NULL,
	CONSTRAINT PK_CursoTurma PRIMARY KEY (ID),
	CONSTRAINT UQ_CursoTurma UNIQUE(ID_Curso, ID_Turma)
)

CREATE TABLE LMS.Disciplina
(
	ID INT IDENTITY,
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
	ID INT IDENTITY,
	ID_Disciplina INT NOT NULL,
	Ano SMALLINT NOT NULL,
	Semestre CHAR(1) NOT NULL,
	CONSTRAINT PK_DisciplinaOfertada PRIMARY KEY (ID),
	CONSTRAINT UQ_DisciplinaOfertada UNIQUE(ID_Disciplina, Ano, Semestre)
)

CREATE TABLE LMS.Matricula
(
	ID INT IDENTITY,
	ID_Aluno INT NOT NULL,
	ID_Turma INT NOT NULL,
	CONSTRAINT PK_Matricula PRIMARY KEY (ID),
	CONSTRAINT UQ_Matricula UNIQUE(ID_Aluno, ID_Turma)
)

CREATE TABLE LMS.Resposta
(
	ID INT IDENTITY,
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
	ID INT IDENTITY,
	ID_DisciplinaOfertada INT NOT NULL,
	Identificacao_Turma CHAR(1) NOT NULL, -- Alterado ID (Char(1)) para Identificação_Turma
	Turno VARCHAR(15) NOT NULL,
	ID_Professor INT NOT NULL, --(fk professor)
	CONSTRAINT PK_Turma PRIMARY KEY (ID),
	CONSTRAINT UQ_Turma_DisciplinaofertadaProfessor UNIQUE(ID_DisciplinaOfertada, ID_Professor)
)

CREATE TABLE LMS.Questao
(
	ID INT IDENTITY,
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
	ID INT IDENTITY,
	ID_Resposta INT NOT NULL,
	Arquivo VARCHAR(500) NOT NULL,
	CONSTRAINT PK_ArquivosResposta PRIMARY KEY (ID),
	CONSTRAINT UQ_ArquivosResposta UNIQUE(ID_Resposta, Arquivo)
)

CREATE TABLE LMS.Professor
(
	ID INT IDENTITY,
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
	ID INT IDENTITY,
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

GO
---------------------------------------------------------------------
/* ETAPA 2 */

--CURSO
INSERT INTO LMS.Curso VALUES ('SI','Sistemas de Informação')
INSERT INTO LMS.Curso VALUES ('BD','Banco de Dados')
INSERT INTO LMS.Curso VALUES ('RC','Redes de Computadores')
INSERT INTO LMS.Curso VALUES ('ADS','Analise e Desenvolvimento de Sistemas')
INSERT INTO LMS.Curso VALUES ('JD','Jogos Digitais')

--GRADECURRICULAR
INSERT INTO LMS.GradeCurricular VALUES (5, 2016,'4')
INSERT INTO LMS.GradeCurricular VALUES (3, 2016,'8')
INSERT INTO LMS.GradeCurricular VALUES (4, 2016,'8')
INSERT INTO LMS.GradeCurricular VALUES (2, 2016,'4')
INSERT INTO LMS.GradeCurricular VALUES (1, 2016,'8')
INSERT INTO LMS.GradeCurricular VALUES (1, 2017,'8')
INSERT INTO LMS.GradeCurricular VALUES (2, 2017,'4')
INSERT INTO LMS.GradeCurricular VALUES (3, 2017,'8')
INSERT INTO LMS.GradeCurricular VALUES (5, 2017,'8')

--PERIODO
INSERT INTO LMS.Periodo VALUES (1, 1)
INSERT INTO LMS.Periodo VALUES (3, 1)
INSERT INTO LMS.Periodo VALUES (3, 3)
INSERT INTO LMS.Periodo VALUES (5, 1)
INSERT INTO LMS.Periodo VALUES (5, 2)
INSERT INTO LMS.Periodo VALUES (5, 3)
INSERT INTO LMS.Periodo VALUES (7, 3)
INSERT INTO LMS.Periodo VALUES (9, 1)
INSERT INTO LMS.Periodo VALUES (9, 3)
INSERT INTO LMS.Periodo VALUES (2, 1)
INSERT INTO LMS.Periodo VALUES (2, 2)
INSERT INTO LMS.Periodo VALUES (2, 3)

--ALUNO
INSERT INTO LMS.Aluno VALUES (10001, 'Carlos', 'carlos@gmail.com', '11988556633', 2)
INSERT INTO LMS.Aluno VALUES (10002, 'Victor', 'victor@hotmail.com', '11988545265', 3)
INSERT INTO LMS.Aluno VALUES (10003, 'Leonardo', 'leo@hotmail.com', '11998555123', 2)
INSERT INTO LMS.Aluno VALUES (10004, 'Thiago', 'thiago@gmail.com', '11965878723', 5)
INSERT INTO LMS.Aluno VALUES (10005, 'David', 'david@hotmail.com', '11952456634', 4)
INSERT INTO LMS.Aluno VALUES (10006, 'Miguel', 'david@ig.com.br', '11954879644', 4)
INSERT INTO LMS.Aluno VALUES (10007, 'Sophia', 'sophia@gmail.com', '11978542118', 4)
INSERT INTO LMS.Aluno VALUES (10008, 'Davi', 'davi@hotmail.com', '11999878245', 1)
INSERT INTO LMS.Aluno VALUES (10009, 'Arthur', 'arthur@ig.com.br', '11945444218', 1)
INSERT INTO LMS.Aluno VALUES (10010, 'Pedro', 'pedro@hotmail.com', '11948785222', 1)
INSERT INTO LMS.Aluno VALUES (10011, 'Alice', 'alice@hotmail.com', '1194878521', 4)
INSERT INTO LMS.Aluno VALUES (10012, 'Gabriel', 'gabriel@gmail.com', '11900005589', 2)
INSERT INTO LMS.Aluno VALUES (10013, 'Bernardo', 'bernardo@ig.com.br', '11966654521', 4)
INSERT INTO LMS.Aluno VALUES (10014, 'Lucas', 'lucas@hotmail.com', '11225578774', 2)
INSERT INTO LMS.Aluno VALUES (10015, 'Julia', 'julia@ig.com.br', '11222457889', 3)
INSERT INTO LMS.Aluno VALUES (10016, 'Matheus', 'matheus@hotmail.com', '11222254879', 1)
INSERT INTO LMS.Aluno VALUES (10017, 'Rafael', 'rafael@gmail.com', '11445875632', 1)
INSERT INTO LMS.Aluno VALUES (10018, 'Heitor', 'heitor@hotmail.com', '11888779654', 2)
INSERT INTO LMS.Aluno VALUES (10019, 'Isabella', 'isabella@ig.com.br', '11115458964', 1)
INSERT INTO LMS.Aluno VALUES (10020, 'Enzo', 'enzo@hotmail.com', '12555875469', 5)
INSERT INTO LMS.Aluno VALUES (10021, 'Guilherme', 'guilherme@hotmail.com', '21548752500', 4)
INSERT INTO LMS.Aluno VALUES (10022, 'Nicolas', 'nicolas@gmail.com', '11525965478', 1)
INSERT INTO LMS.Aluno VALUES (10023, 'Manuela', 'manuela@ig.com.br', '11500045889', 1)
INSERT INTO LMS.Aluno VALUES (10024, 'Lorenzo', 'lorenzo@hotmail.com', '21554587963', 4)
INSERT INTO LMS.Aluno VALUES (10025, 'Gustavo', 'gustavo@hotmail.com', '3658878402', 4)
INSERT INTO LMS.Aluno VALUES (10026, 'Laura', 'laura@ig.com.br', '11952466321', 5)
INSERT INTO LMS.Aluno VALUES (10027, 'Luiza', 'luiza@hotmail.com', '11957778542', 1)
INSERT INTO LMS.Aluno VALUES (10028, 'Valentina', 'valentina@gmail.com', '1125554028', 1)
INSERT INTO LMS.Aluno VALUES (10029, 'Nicole', 'nicole@gmail.com', '1355487214', 3)
INSERT INTO LMS.Aluno VALUES (10030, 'Eduardo', 'eduardo@gmail.com', '1325559659', 1)

--DISCIPLINA
INSERT INTO LMS.Disciplina VALUES ('Algoritmos', 40, 5, 95, 'Noções de Lógica. Introdução a Algoritmos. Resolução de problemas utilizando
															algoritmos e raciocínio lógico. Tipos de Dados. Variáveis e Constantes.
															Expressões e Operadores. Estruturas de Controle: Estruturas Básicas,
															Estruturas Condicionais e Estruturas de Repetição. Estruturas Básicas de
															Dados: Vetores, Matrizes e Registros. Arquivos. Funções.', 
															'Possibilitar ao aluno o desenvolvimento de formas de representações computacionais de
															problemas reais, através de algoritmos simples.',
															'No decorrer da disciplina serão trabalhadas as seguintes habilidades: - utilizar de forma correta 
															(conforme a sintaxe da linguagem) as estruturas da linguagem (declaração de variáveis, condicionais,
															 laços de repetição) - conhecer as palavras reservadas e sua utilização - trabalhar com tipos de 
															 dados primitivos (imutáveis) e tipos de dados por referência (mutáveis) - desenvolver programas 
															 seguindo o formato de programação procedural - compreender e utilizar a modularização de 
															 algoritmos através de funções ou métodos.', 
															 '• I UNIDADE • APRESENTAÇÃO E INTRODUÇÃO A ALGORITMOS • ALGORITMOS: VARIÁVEIS, OPERADORES E CONSTANTES
															 • ALGORITMOS: ESTRUTURAS DE SELEÇÃO • VISUALG: AULA PRÁTICA – FUNDAMENTOS • ESTRUTURAS DE REPETIÇÃO
															 • VETORES • VISUALG: AULA PRÁTICA – ESTRUTURAS DE REPETIÇÃO • II UNIDADE • VETORES • AULA PRÁTICA: VETORES
															 • MODULARIZAÇÃO DE ALGORITMOS • VISUALG: AULA PRÁTICA – MODULARIZAÇÃO • VISUALG: AULA PRÁTICA – GERAL
															 • PROCESSO DE PROGRAMAÇÃO • LINGUAGENS DE PROGRAMAÇÃO', 
															 'Novatec Editora. ISBN 85-7522-073-X',
															 'Donald E. Knuth (1973) The Art of Computer Programming, Volume 1: Fundamental Algorithms (2ª edição). Addison-Wesley, ISBN 0-201-03809-9 (em inglês)
																↑ CHARLES E. LEISERSON, Thomas H. Cormen, RONALD L. RIVEST, CLIFFORD STEIN , Algoritmos: teoria e prática , CAMPUS - RJ, 2002 ISBN 8-535-20926-3')
INSERT INTO LMS.Disciplina VALUES ('Arquitetura de Computadores', 60, 10, 90, 'Estrutura básica de computadores. A Unidade Central de Processamento. Estruturas de barramentos. Organização de memória. Sistemas 
																				de entrada/saída. Suporte ao sistema operacional. Padrões de arquiteturas. Introdução a arquiteturas dedicadas.',
																			'Identificar o funcionamento e relacionamento entre os componentes de computadores e seus periféricos;
																				Instalar e configurar computadores, isolados ou em redes, periféricos e softwares.
																				Identificar a origem de falhas no funcionamento de computadores, periféricos e softwares avaliando seus efeitos;',
																			'Capacitar o aluno nos conceitos gerais de administração de redes de computadores e
																				gestão de recursos ',
																			' Arquitetura de von >euman. Técnicas de Pipeline.
																				• Introdução às Arquiteturas RISC e CISC.',
																			'TANENBAUM, ANDREW S. Redes de Computadores. Rio de Janeiro, Campus, quarta
																				edição, 2003.',
																			'SOARES, Luiz Fernando Gomes. Redes de Computadores: das LANs, MANs e WANs às
																				redes ATM. Rio de Janeiro: Campus, 1995.')
INSERT INTO LMS.Disciplina VALUES ('Banco de Dados', 80, 15, 85, 'Introdução aos sistemas de gerência de bancos de dados. Projeto de banco de dados: 
																	conceitual, lógico e físico. Modelo conceitual de entidades e relacionamentos. Modelo 
																	de dados relacional. Dependências funcionais e normalização. Linguagens de definição e 
																	de manipulação de dados. Álgebra relacional e sql. Restrições de integridade e visões. 
																	Organização física de bancos de dados: técnicas de armazenamento e indexação.',
																'Para o exercício destas atividades, o aluno deve adquirir competências em:
																	acompanhar a evolução das tecnologias de informação de forma autônoma e independente;
																	prospectar novas tecnologias da informação e auxiliar sua incorporação às estratégias, 
																	planejamentos e práticas da organização;
																	empreender a busca de soluções para os desafios das organizações e de novas oportunidades
																	de crescimento profissional;
																	identificar problemas de ordem organizacional, operacional ou sistêmica, relacionados com 
																	dados e informações e propor soluções inéditas com base técnica e científica ou adequar as 
																	já existentes à realidade, sejam elas automatizadas ou manuais;
																	gerenciar projetos de desenvolvimento de sistemas de Banco de Dados envolvendo atividades em equipe.',
																'O especialista nesta área deve capacitar-se para solucionar problemas, por meio da construção de modelos
																	de dados, de sua implantação e administração. Amplamente, estas atividades envolvem habilidades em:
																	planejamento e desenvolvimento projetos de sistemas de bancos de dados;
																	pesquisa dos requisitos e os recursos necessários;
																	avaliar o desempenho do sistema, em processos de usuários ou grupos;
																	aplicação de técnicas e procedimentos de trabalho, instrumentos, ferramentas convencionais e informatizadas, de acordo com especificações;
																	atender usuários administrando o banco de dados, dentro dos princípios de qualidade, produtividade, podendo, quando for o caso, prestar consultoria ou assessoria técnica;
																	conceber e coordenar a elaboração de projetos de sistemas de bancos de dados, a partir de decisões em grupo de trabalho;
																	controlar e coordenar acessos através da administração de Bancos de Dados e de Usuários;
																	planejar e definir recursos de armazenamento de dados.',
																'Banco de Dados e usuários de banco de dados. Conceitos e arquiteturas de sistema de banco de dados. Modelagem de dados. Modelos conceituais. 
																	Modelo de dados relacional. Modelo de dados relacional estendido. Dependência funcional e normalização. Projeto de banco de dados 
																	relacional. Metodologia de projeto de banco de dados relacional.',
																'SAYÃO, L.F. Modelos teóricos em ciência da informação; abstração e método científico. (2001).',
																'COUGO, P. Modelagem Conceitual, 1a Edição, Campus, 1997.')
INSERT INTO LMS.Disciplina VALUES ('Computação Gráfica', 100, 20, 80, 'Computação gráfica: origem e definição. Introdução ao processamento de imagens. Periféricos. Representação de objetos. Visualização bidimensional. Visualização tridimensional.
																			Introdução ao realismo tridimensional. ',
																		'O cumprimento da disciplina busca dar ao aluno, ao final do semestre, condições de:
																			1. Dominar os conceitos básicos de Computação Gráfica 2D e 3D;
																			2. Implementar um software que envolva técnicas de Computação Gráfica;
																			3. Dimensionar um ambiente de trabalho que envolva periféricos com capacidade gráfica.',
																		' As competências do profissional de Expressão Gráfica compreendem uma base sólida de conhecimentos em Geometria Plana
																			e Espacial, Normas Técnicas da ABNT e Normas Técnicas para desenvolvimento de Projetos que o possibilite utilizar
																			na Representação de Projetos Auxiliados por Computador nas diversas áreas.
																			O profissional formado deverá ser capaz de:
																			Atuar no setor produtivo, utilizando tecnologias avançadas em equipes multidisciplinares, criando, experimentando,
																			analisando, simulando e validando os projetos, principalmente quanto ao desenho, à forma e à interação com o seu
																			ambiente;
																			Atuar em pesquisas direcionadas ao desenvolvimento de sistemas de inovação nos setores industriais de diversas 
																			áreas, tais como, indústria automobilística e de autopeças, indústria mecânica, indústria cosmética, embalagens,
																			construção civil, arquitetura e mobiliário;
																			Representar modelos através dos conhecimentos da Expressão e Computação Gráfica;
																			Agregar conhecimentos das áreas de Engenharia, Expressão Gráfica e novas tecnologias para o desenvolvimento de
																			projetos computadorizados;
																			Utilizar ferramentas gráficas computacionais;
																			Simular, analisar e testas os produtos projetados utilizando as ferramentas específicas disponíveis nos softwares
																			CAD;
																			Desenvolver a capacidade de leitura, interpretação e expressão gráfica;
																			Desenvolver a capacidade de síntese, aliada à capacidade de compreensão e expressão oral e escrita;
																			Conduzir e interpretar resultados de atividades práticas e experimentais;
																			Compreender os problemas socioeconômicos, culturais e do meio ambiente;
																			Conceber, analisar sistemas e processos utilizando a modelagem computacional gráfica.',
																		'Introdução à Computação Gráfica
																		Biblioteca Gráfica OpenGL
																		Processamento de Imagens
																		Representação de Objetos e Cenas
																		Processo de Visualização
																		Curvas e Superfícies Paramétricas
																		Geração de Imagens com Realismo
																		Tópicos de Computação Gráfica',
																	'Tanenbaum, A., Computer Arquitecture, 4a edição, Prentice Hall., 1998.',
																	'Tanenbaum, A., Organização Estruturada de Computadores, 4a Edição, 1999.')
INSERT INTO LMS.Disciplina VALUES ('Engenharia de Software', 120, 25,75, 'Engenharia de Software: Conceitos e objetivos. Paradigmas de desenvolvimento de software: suas fases e
																		características. Tópicos avançados em Engenharia de Software.',
																	'Os assuntos serão apresentados em aulas expositivas. Os assuntos apresentados serão trabalhados em laboratório
																		e posteriormente os alunos serão convidados a apresentar seminário sobre os trabalhos desenvolvidos. ',
																	'Ao longo da disciplina, o aluno deverá desenvolver as seguintes habilidades: 
																		- discutir a evolução da engenharia de software; 
																		- diferenciar os principais paradigmas da engenharia de software; 
																		- compreender cada etapa do desenvolvimento de software; 
																		- distinguir os diversos processos de desenvolvimento de software abordados.',
																	'Introdução à Engenharia de Software [3 horas-aula]
																		- Evolução do Software
																		- Ciclo de vida',
																	'Wazlawick, R. S. Análise e Projeto de Sistemas Orientados a Objetos. Rio de Janeiro: Campus/Elsevier, 2004.',
																	'Jacobson, I.,Booch, G.,.Rumbaugh, J. The unified software development process, Addison-Wesley, 1999.')

INSERT INTO LMS.Disciplina VALUES ('Gerenciamento de Projetos de Software', 140, 30, 70, 
															'Noções de Lógica. Introdução a Algoritmos. Resolução de problemas utilizando
																algoritmos e raciocínio lógico. Tipos de Dados. Variáveis e Constantes.
																Expressões e Operadores. Estruturas de Controle: Estruturas Básicas,
																Estruturas Condicionais e Estruturas de Repetição. Estruturas Básicas de
																Dados: Vetores, Matrizes e Registros. Arquivos. Funções.', 
															'Possibilitar ao aluno o desenvolvimento de formas de representações computacionais de
																problemas reais, através de algoritmos simples.',
															'No decorrer da disciplina serão trabalhadas as seguintes habilidades: - utilizar de forma correta 
																(conforme a sintaxe da linguagem) as estruturas da linguagem (declaração de variáveis, condicionais,
																laços de repetição) - conhecer as palavras reservadas e sua utilização - trabalhar com tipos de 
																dados primitivos (imutáveis) e tipos de dados por referência (mutáveis) - desenvolver programas 
																seguindo o formato de programação procedural - compreender e utilizar a modularização de 
																algoritmos através de funções ou métodos.', 
															'• I UNIDADE • APRESENTAÇÃO E INTRODUÇÃO A ALGORITMOS • ALGORITMOS: VARIÁVEIS, OPERADORES E CONSTANTES
																 • ALGORITMOS: ESTRUTURAS DE SELEÇÃO • VISUALG: AULA PRÁTICA – FUNDAMENTOS • ESTRUTURAS DE REPETIÇÃO
																• VETORES • VISUALG: AULA PRÁTICA – ESTRUTURAS DE REPETIÇÃO • II UNIDADE • VETORES • AULA PRÁTICA: VETORES
																• MODULARIZAÇÃO DE ALGORITMOS • VISUALG: AULA PRÁTICA – MODULARIZAÇÃO • VISUALG: AULA PRÁTICA – GERAL
																• PROCESSO DE PROGRAMAÇÃO • LINGUAGENS DE PROGRAMAÇÃO', 
															'Novatec Editora. ISBN 85-7522-073-X',
															'Donald E. Knuth (1973) The Art of Computer Programming, Volume 1: Fundamental Algorithms (2ª edição). Addison-Wesley, ISBN 0-201-03809-9 (em inglês)
																↑ CHARLES E. LEISERSON, Thomas H. Cormen, RONALD L. RIVEST, CLIFFORD STEIN , Algoritmos: teoria e prática , CAMPUS - RJ, 2002 ISBN 8-535-20926-3')
INSERT INTO LMS.Disciplina VALUES ('Inteligência Artificial', 80, 30, 70, 'Estrutura básica de computadores. A Unidade Central de Processamento. Estruturas de barramentos. Organização de memória. Sistemas 
																				de entrada/saída. Suporte ao sistema operacional. Padrões de arquiteturas. Introdução a arquiteturas dedicadas.',
																			'Identificar o funcionamento e relacionamento entre os componentes de computadores e seus periféricos;
																				Instalar e configurar computadores, isolados ou em redes, periféricos e softwares.
																				Identificar a origem de falhas no funcionamento de computadores, periféricos e softwares avaliando seus efeitos;',
																			'Capacitar o aluno nos conceitos gerais de administração de redes de computadores e
																				gestão de recursos ',
																			' Arquitetura de von >euman. Técnicas de Pipeline.
																				• Introdução às Arquiteturas RISC e CISC.',
																			'TANENBAUM, ANDREW S. Redes de Computadores. Rio de Janeiro, Campus, quarta
																				edição, 2003.',
																			'SOARES, Luiz Fernando Gomes. Redes de Computadores: das LANs, MANs e WANs às
																				redes ATM. Rio de Janeiro: Campus, 1995.')
INSERT INTO LMS.Disciplina VALUES ('Interação humano-computador', 80, 20, 80, 'Introdução aos sistemas de gerência de bancos de dados. Projeto de banco de dados: 
																				conceitual, lógico e físico. Modelo conceitual de entidades e relacionamentos. Modelo 
																				de dados relacional. Dependências funcionais e normalização. Linguagens de definição e 
																				de manipulação de dados. Álgebra relacional e sql. Restrições de integridade e visões. 
																				Organização física de bancos de dados: técnicas de armazenamento e indexação.',
																			'Para o exercício destas atividades, o aluno deve adquirir competências em:
																				acompanhar a evolução das tecnologias de informação de forma autônoma e independente;
																				prospectar novas tecnologias da informação e auxiliar sua incorporação às estratégias, 
																				planejamentos e práticas da organização;
																				empreender a busca de soluções para os desafios das organizações e de novas oportunidades
																				de crescimento profissional;
																				identificar problemas de ordem organizacional, operacional ou sistêmica, relacionados com 
																				dados e informações e propor soluções inéditas com base técnica e científica ou adequar as 
																				já existentes à realidade, sejam elas automatizadas ou manuais;
																				gerenciar projetos de desenvolvimento de sistemas de Banco de Dados envolvendo atividades em equipe.',
																			'O especialista nesta área deve capacitar-se para solucionar problemas, por meio da construção de modelos
																				de dados, de sua implantação e administração. Amplamente, estas atividades envolvem habilidades em:
																				planejamento e desenvolvimento projetos de sistemas de bancos de dados;
																				pesquisa dos requisitos e os recursos necessários;
																				avaliar o desempenho do sistema, em processos de usuários ou grupos;
																				aplicação de técnicas e procedimentos de trabalho, instrumentos, ferramentas convencionais e informatizadas, de acordo com especificações;
																				atender usuários administrando o banco de dados, dentro dos princípios de qualidade, produtividade, podendo, quando for o caso, prestar consultoria ou assessoria técnica;
																				conceber e coordenar a elaboração de projetos de sistemas de bancos de dados, a partir de decisões em grupo de trabalho;
																				controlar e coordenar acessos através da administração de Bancos de Dados e de Usuários;
																				planejar e definir recursos de armazenamento de dados.',
																			'Banco de Dados e usuários de banco de dados. Conceitos e arquiteturas de sistema de banco de dados. Modelagem de dados. Modelos conceituais. 
																				Modelo de dados relacional. Modelo de dados relacional estendido. Dependência funcional e normalização. Projeto de banco de dados 
																				relacional. Metodologia de projeto de banco de dados relacional.',
																			'SAYÃO, L.F. Modelos teóricos em ciência da informação; abstração e método científico. (2001).',
																			'COUGO, P. Modelagem Conceitual, 1a Edição, Campus, 1997.')
INSERT INTO LMS.Disciplina VALUES ('Linguagens de Programação', 80, 10, 90, 'Computação gráfica: origem e definição. Introdução ao processamento de imagens. Periféricos. Representação de objetos. Visualização bidimensional. Visualização tridimensional.
																				Introdução ao realismo tridimensional. ',
																			'O cumprimento da disciplina busca dar ao aluno, ao final do semestre, condições de:
																				1. Dominar os conceitos básicos de Computação Gráfica 2D e 3D;
																				2. Implementar um software que envolva técnicas de Computação Gráfica;
																				3. Dimensionar um ambiente de trabalho que envolva periféricos com capacidade gráfica.',
																			'As competências do profissional de Expressão Gráfica compreendem uma base sólida de conhecimentos em Geometria Plana
																				e Espacial, Normas Técnicas da ABNT e Normas Técnicas para desenvolvimento de Projetos que o possibilite utilizar
																				na Representação de Projetos Auxiliados por Computador nas diversas áreas.
																				O profissional formado deverá ser capaz de:
																				Atuar no setor produtivo, utilizando tecnologias avançadas em equipes multidisciplinares, criando, experimentando,
																				analisando, simulando e validando os projetos, principalmente quanto ao desenho, à forma e à interação com o seu
																				ambiente;
																				Atuar em pesquisas direcionadas ao desenvolvimento de sistemas de inovação nos setores industriais de diversas 
																				áreas, tais como, indústria automobilística e de autopeças, indústria mecânica, indústria cosmética, embalagens,
																				construção civil, arquitetura e mobiliário;
																				Representar modelos através dos conhecimentos da Expressão e Computação Gráfica;
																				Agregar conhecimentos das áreas de Engenharia, Expressão Gráfica e novas tecnologias para o desenvolvimento de
																				projetos computadorizados;
																				Utilizar ferramentas gráficas computacionais;
																				Simular, analisar e testas os produtos projetados utilizando as ferramentas específicas disponíveis nos softwares
																				CAD;
																				Desenvolver a capacidade de leitura, interpretação e expressão gráfica;
																				Desenvolver a capacidade de síntese, aliada à capacidade de compreensão e expressão oral e escrita;
																				Conduzir e interpretar resultados de atividades práticas e experimentais;
																				Compreender os problemas socioeconômicos, culturais e do meio ambiente;
																				Conceber, analisar sistemas e processos utilizando a modelagem computacional gráfica.',
																			'Introdução à Computação Gráfica
																				Biblioteca Gráfica OpenGL
																				Processamento de Imagens
																				Representação de Objetos e Cenas
																				Processo de Visualização
																				Curvas e Superfícies Paramétricas
																				Geração de Imagens com Realismo
																				Tópicos de Computação Gráfica',
																			'Tanenbaum, A., Computer Arquitecture, 4a edição, Prentice Hall., 1998.',
																			'Tanenbaum, A., Organização Estruturada de Computadores, 4a Edição, 1999.')
INSERT INTO LMS.Disciplina VALUES ('Mecatrônica', 80, 0, 100, 'Engenharia de Software: Conceitos e objetivos. Paradigmas de desenvolvimento de software: suas fases e
																características. Tópicos avançados em Engenharia de Software.',
															'Os assuntos serão apresentados em aulas expositivas. Os assuntos apresentados serão trabalhados em laboratório
																e posteriormente os alunos serão convidados a apresentar seminário sobre os trabalhos desenvolvidos. ',
															'Ao longo da disciplina, o aluno deverá desenvolver as seguintes habilidades: 
																- discutir a evolução da engenharia de software; 
																- diferenciar os principais paradigmas da engenharia de software; 
																- compreender cada etapa do desenvolvimento de software; 
																- distinguir os diversos processos de desenvolvimento de software abordados.',
															'Introdução à Engenharia de Software [3 horas-aula]
																- Evolução do Software
																- Ciclo de vida',
															'Wazlawick, R. S. Análise e Projeto de Sistemas Orientados a Objetos. Rio de Janeiro: Campus/Elsevier, 2004.',
															'Jacobson, I.,Booch, G.,.Rumbaugh, J. The unified software development process, Addison-Wesley, 1999.')

--PERIODODISCIPLINA
INSERT INTO LMS.PeriodoDisciplina VALUES (1,2)
INSERT INTO LMS.PeriodoDisciplina VALUES (1,4)
INSERT INTO LMS.PeriodoDisciplina VALUES (1,6)
INSERT INTO LMS.PeriodoDisciplina VALUES (1,8)
INSERT INTO LMS.PeriodoDisciplina VALUES (1,10)
INSERT INTO LMS.PeriodoDisciplina VALUES (3,1)
INSERT INTO LMS.PeriodoDisciplina VALUES (5,2)
INSERT INTO LMS.PeriodoDisciplina VALUES (7,3)
INSERT INTO LMS.PeriodoDisciplina VALUES (9,4)
INSERT INTO LMS.PeriodoDisciplina VALUES (11,5)

--DISCIPLINAOFERTADA
INSERT INTO LMS.DisciplinaOfertada VALUES (1,2017,'1')
INSERT INTO LMS.DisciplinaOfertada VALUES (2,2017,'2')
INSERT INTO LMS.DisciplinaOfertada VALUES (3,2017,'1')
INSERT INTO LMS.DisciplinaOfertada VALUES (4,2017,'2')
INSERT INTO LMS.DisciplinaOfertada VALUES (5,2017,'2')
INSERT INTO LMS.DisciplinaOfertada VALUES (6,2017,'2')
INSERT INTO LMS.DisciplinaOfertada VALUES (7,2017,'1')
INSERT INTO LMS.DisciplinaOfertada VALUES (8,2017,'1')
INSERT INTO LMS.DisciplinaOfertada VALUES (9,2016,'1')
INSERT INTO LMS.DisciplinaOfertada VALUES (10,2015,'2')

--PROFESSOR
INSERT INTO LMS.Professor VALUES (11001, 'Avião','Manuela Avila', 'avila@hotmail.com', '11988556633')
INSERT INTO LMS.Professor VALUES (11002, 'Rio', 'Marcelo Nilo', 'nilo@hotmail.com', '11988545265')
INSERT INTO LMS.Professor VALUES (11003, 'Candomblé', 'Edvaldo Brito', 'brito@hotmail.com', '11998555123')
INSERT INTO LMS.Professor VALUES (11004, 'Comuna', 'Daniel Almeida', 'almeida@gmail.com', '11965878723')
INSERT INTO LMS.Professor VALUES (11005, 'Goleiro', 'Paulo Magalhães', 'magalhaes@hotmail.com', '11952456634')
INSERT INTO LMS.Professor VALUES (11006, 'Bruto', 'Raul Jungmann', 'jungmann@ig.com.br', '11954879644')
INSERT INTO LMS.Professor VALUES (11007, 'Neto', 'Geraldo Júlio', 'julio@gmail.com', '11978542118')
INSERT INTO LMS.Professor VALUES (11008, 'Cacique', 'Etore Labanca', 'labanca@hotmail.com', '11999878245')
INSERT INTO LMS.Professor VALUES (11009, 'Colorido', 'Fabio Branco', 'branco@ig.com.br', '11945444218')
INSERT INTO LMS.Professor VALUES (11010, 'Roberval', 'Mário Kertesz', 'kertesz@hotmail.com', '11948785222')

--TURMA
INSERT INTO LMS.Turma VALUES (1,'A', 'Manhã', 1)
INSERT INTO LMS.Turma VALUES (3,'A', 'Tarde', 1)
INSERT INTO LMS.Turma VALUES (3,'B', 'Noite', 8)
INSERT INTO LMS.Turma VALUES (7,'C', 'Manhã', 7)
INSERT INTO LMS.Turma VALUES (9,'D', 'Noite', 6)
INSERT INTO LMS.Turma VALUES (1,'A', 'Noite', 2)
INSERT INTO LMS.Turma VALUES (10,'A', 'Noite', 2)
INSERT INTO LMS.Turma VALUES (5,'B', 'Manhã', 1)
INSERT INTO LMS.Turma VALUES (2,'A', 'Tarde', 5)
INSERT INTO LMS.Turma VALUES (2,'C', 'Manhã', 10)

--CURSOTURMA
INSERT INTO LMS.CursoTurma VALUES (1,7)
INSERT INTO LMS.CursoTurma VALUES (2,8)
INSERT INTO LMS.CursoTurma VALUES (3,7)
INSERT INTO LMS.CursoTurma VALUES (4,10)
INSERT INTO LMS.CursoTurma VALUES (5,9)
INSERT INTO LMS.CursoTurma VALUES (1,3)
INSERT INTO LMS.CursoTurma VALUES (1,4)
INSERT INTO LMS.CursoTurma VALUES (1,6)
INSERT INTO LMS.CursoTurma VALUES (4,1)
INSERT INTO LMS.CursoTurma VALUES (5,7)

--MATRICULA
INSERT INTO LMS.Matricula VALUES (1,1)
INSERT INTO LMS.Matricula VALUES (10,1)
INSERT INTO LMS.Matricula VALUES (20,1)
INSERT INTO LMS.Matricula VALUES (30,1)
INSERT INTO LMS.Matricula VALUES (25,1)
INSERT INTO LMS.Matricula VALUES (15,1)
INSERT INTO LMS.Matricula VALUES (5,1)
INSERT INTO LMS.Matricula VALUES (2,2)
INSERT INTO LMS.Matricula VALUES (3,2)
INSERT INTO LMS.Matricula VALUES (4,2)

--QUESTAO
INSERT INTO LMS.Questao VALUES (1, 1, '20171117', 'Objetiva Concursos - 2015 - Pref. São Pedro do Sul/RS) - Assinalar a alternativa que apresenta a ferramenta administrativa do sistema
													operacional Windows XP Professional, que permite que se visualize erros de segurança ou a iniciação ou interrupção de um programa, registradas em logs',
												'20171110')
INSERT INTO LMS.Questao VALUES (1, 2, '20171120', 'O Filtro do SmartScreen da Microsoft é um recurso do Internet Explorer que ajuda a detectar sites de Phishing e sites de:',
												'20171111')
INSERT INTO LMS.Questao VALUES (1, 3, '20171125', 'A Internet baseia-se no protocolo TCP/IP em que o endereço IP pode ser designado de maneira fixa ou variável.
													O responsável por designar endereços IP variáveis que possibilitam a navegação na Web é o servidor de',
												'20171112')
INSERT INTO LMS.Questao VALUES (2, 1, '20171130', 'No Windows XP, a ___ é usada para separar as subpastas e compor um caminho para um determinado arquivo no computador.',
												'20171113')
INSERT INTO LMS.Questao VALUES (2, 2, '20171201', 'ma mensagem de correio eletrônico (e-mail) não solicitada, geralmente com fins publicitários e enviada em massa, caracteriza um:',
												'20171114')
INSERT INTO LMS.Questao VALUES (9, 1, '20171210', 'Marque V para as assertivas verdadeiras e F para as falsas:  
													( ) No menu Iniciar podemos colocar apenas 20 programas. 
													( ) Quando ligamos o PC a primeira ação deste é o boot. 
													( ) O Administrador é conhecido também como ROOT e tem todos os direitos sobre o PC.',
												'20171115')
INSERT INTO LMS.Questao VALUES (9, 2, '20171220', 'No OUTLOOK 2007, os e-mails encontram-se organizados em pastas, como, por exemplo, Caixa de Entrada, Caixa de Saída e Itens Enviados.
													 Um e-mail recebido é imediatamente respondido pelo usuário e, em seguida, enviado para o destinatário. Em que pastas encontram-se, 
													 respectivamente, o e-mail recebido e sua resposta?',
												'20171116')
INSERT INTO LMS.Questao VALUES (9, 3, '20171225', '(OBJETIVA - 2016 - Prefeitura de Coronel Bicaco/RS - Agente administrativo) - Por meio da guia Apresentação de Slides do PowerPoint 2007 é possível, EXCETO:',
												'20171117')
INSERT INTO LMS.Questao VALUES (3, 1, '20171230', 'No editor de texto WORD 2007, um recurso amplamente utilizado para padronização de documentos é o estilo, que consiste em um(a)',
												'20171118')
INSERT INTO LMS.Questao VALUES (6, 1, '20180101', 'A respeito do Internet Explorer, sua principal função é',
												'20171119')

--ARQUIVOQUESTAO
INSERT INTO LMS.ArquivosQuestao VALUES (1, 'A.TXT')
INSERT INTO LMS.ArquivosQuestao VALUES (2, 'B.TXT')
INSERT INTO LMS.ArquivosQuestao VALUES (2, 'C.TXT')
INSERT INTO LMS.ArquivosQuestao VALUES (3, 'D.TXT')
INSERT INTO LMS.ArquivosQuestao VALUES (3, 'E.TXT')
INSERT INTO LMS.ArquivosQuestao VALUES (3, 'F.TXT')
INSERT INTO LMS.ArquivosQuestao VALUES (4, 'G.TXT')
INSERT INTO LMS.ArquivosQuestao VALUES (4, 'H.TXT')
INSERT INTO LMS.ArquivosQuestao VALUES (4, 'I.TXT')
INSERT INTO LMS.ArquivosQuestao VALUES (4, 'J.TXT')

--RESPOSTA
INSERT INTO LMS.Resposta VALUES (1, 30, '20171001', 10, 'Gerenciamento de computador.', 'Fontes de dados (ODBC).', '20171010') 
INSERT INTO LMS.Resposta VALUES (2, 30, '20171001', 10, 'Malware', 'Ringware', '20171011')
INSERT INTO LMS.Resposta VALUES (3, 30, '20171001', 10, 'HTTP', 'HTML', '20171012')
INSERT INTO LMS.Resposta VALUES (4, 30, '20171001', 10, '\', '|', '20171013')
INSERT INTO LMS.Resposta VALUES (5, 30, '20171001', 10, 'vírus', 'spam', '20171014')
INSERT INTO LMS.Resposta VALUES (1, 20, '20171001', 10, 'F, V, V', 'V, V, V', '20171015')
INSERT INTO LMS.Resposta VALUES (3, 20, '20171001', 10, 'Caixa de Saída e Itens Enviados', 'Caixa de Entrada e Itens Enviados', '20171016')
INSERT INTO LMS.Resposta VALUES (5, 20, '20171001', 10, 'Mostrar a apresentação de slides em tela inteira usando o Modo de Exibição do Apresentador.', 
														'Ocultar o slide atual da apresentação.',
														'20171017')
INSERT INTO LMS.Resposta VALUES (1, 10, '20171001', 10, 'conjunto de caracteres que pode ser copiado sempre que se desejar', 'padronização de rodapé e cabeçalho para documentos.', '20171018')
INSERT INTO LMS.Resposta VALUES (2, 05, '20171001', 10, 'navegar entre as pastas locais do computador.', 'editar arquivos de texto.', '20171019')


--ARQUIVOSRESPOSTA
INSERT INTO LMS.ArquivosResposta VALUES (10, 'RA.TXT')
INSERT INTO LMS.ArquivosResposta VALUES (10, 'RB.TXT')
INSERT INTO LMS.ArquivosResposta VALUES (10, 'RC.TXT')
INSERT INTO LMS.ArquivosResposta VALUES (5, 'RD.TXT')
INSERT INTO LMS.ArquivosResposta VALUES (5, 'RE.TXT')
INSERT INTO LMS.ArquivosResposta VALUES (1, 'RF.TXT')
INSERT INTO LMS.ArquivosResposta VALUES (2, 'RG.TXT')
INSERT INTO LMS.ArquivosResposta VALUES (3, 'RH.TXT')
INSERT INTO LMS.ArquivosResposta VALUES (4, 'RI.TXT')
INSERT INTO LMS.ArquivosResposta VALUES (8, 'RJ.TXT')


