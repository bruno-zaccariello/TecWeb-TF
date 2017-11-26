--CURSO
INSERT INTO Curso VALUES (1,'SI','Sistemas de Informação');
INSERT INTO Curso VALUES (2,'BD','Banco de Dados');
INSERT INTO Curso VALUES (3,'RC','Redes de Computadores');
INSERT INTO Curso VALUES (4,'ADS','Analise e Desenvolvimento de Sistemas');
INSERT INTO Curso VALUES (5,'JD','Jogos Digitais');

--GRADECURRICULAR
INSERT INTO GradeCurricular VALUES (1,5, 2016,4);
INSERT INTO GradeCurricular VALUES (2,3, 2016,1);
INSERT INTO GradeCurricular VALUES (3,4, 2016,2);
INSERT INTO GradeCurricular VALUES (4,2, 2016,3);
INSERT INTO GradeCurricular VALUES (5,1, 2016,5);

--PERIODO
INSERT INTO Periodo VALUES (1,1, 1);
INSERT INTO Periodo VALUES (2, 3, 1);
INSERT INTO Periodo VALUES (3,3, 3);
INSERT INTO Periodo VALUES (4,5, 1);
INSERT INTO Periodo VALUES (5,5, 2);
INSERT INTO Periodo VALUES (6,5, 3);
INSERT INTO Periodo VALUES (7,7, 3);
INSERT INTO Periodo VALUES (8,9, 1);
INSERT INTO Periodo VALUES (9,9, 3);
INSERT INTO Periodo VALUES (10,2, 1);
INSERT INTO Periodo VALUES (11,2, 2);
INSERT INTO Periodo VALUES (12, 2, 3);

--DISCIPLINA
INSERT INTO Disciplina VALUES (1,'Algoritmos', 40, 5, 95, 'Noções de Lógica. Introdução a Algoritmos. Resolução de problemas utilizando
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
																? CHARLES E. LEISERSON, Thomas H. Cormen, RONALD L. RIVEST, CLIFFORD STEIN , Algoritmos: teoria e prática , CAMPUS - RJ, 2002 ISBN 8-535-20926-3');
INSERT INTO Disciplina VALUES (2,'Arquitetura de Computadores', 60, 10, 90, 'Estrutura básica de computadores. A Unidade Central de Processamento. Estruturas de barramentos. Organização de memória. Sistemas 
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
																				redes ATM. Rio de Janeiro: Campus, 1995.');
INSERT INTO Disciplina VALUES (3,'Banco de Dados', 80, 15, 85, 'Introdução aos sistemas de gerência de bancos de dados. Projeto de banco de dados: 
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
																'COUGO, P. Modelagem Conceitual, 1a Edição, Campus, 1997.');
INSERT INTO Disciplina VALUES (4,'Computação Gráfica', 100, 20, 80, 'Computação gráfica: origem e definição. Introdução ao processamento de imagens. Periféricos. Representação de objetos. Visualização bidimensional. Visualização tridimensional.
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
																	'Tanenbaum, A., Organização Estruturada de Computadores, 4a Edição, 1999.');
INSERT INTO Disciplina VALUES (5,'Engenharia de Software', 120, 25,75, 'Engenharia de Software: Conceitos e objetivos. Paradigmas de desenvolvimento de software: suas fases e
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
																	'Jacobson, I.,Booch, G.,.Rumbaugh, J. The unified software development process, Addison-Wesley, 1999.');

INSERT INTO Disciplina VALUES (6,'Gerenciamento de Projetos de Software', 140, 30, 70, 
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
																? CHARLES E. LEISERSON, Thomas H. Cormen, RONALD L. RIVEST, CLIFFORD STEIN , Algoritmos: teoria e prática , CAMPUS - RJ, 2002 ISBN 8-535-20926-3');
INSERT INTO Disciplina VALUES (7,'Inteligência Artificial', 80, 30, 70, 'Estrutura básica de computadores. A Unidade Central de Processamento. Estruturas de barramentos. Organização de memória. Sistemas 
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
																				redes ATM. Rio de Janeiro: Campus, 1995.');
INSERT INTO Disciplina VALUES (8,'Interação humano-computador', 80, 20, 80, 'Introdução aos sistemas de gerência de bancos de dados. Projeto de banco de dados: 
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
																			'COUGO, P. Modelagem Conceitual, 1a Edição, Campus, 1997.');
INSERT INTO Disciplina VALUES (9,'Linguagens de Programação', 80, 10, 90, 'Computação gráfica: origem e definição. Introdução ao processamento de imagens. Periféricos. Representação de objetos. Visualização bidimensional. Visualização tridimensional.
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
																			'Tanenbaum, A., Organização Estruturada de Computadores, 4a Edição, 1999.');
INSERT INTO Disciplina VALUES (10,'Mecatrônica', 80, 0, 100, 'Engenharia de Software: Conceitos e objetivos. Paradigmas de desenvolvimento de software: suas fases e
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
															'Jacobson, I.,Booch, G.,.Rumbaugh, J. The unified software development process, Addison-Wesley, 1999.');

--PERIODODISCIPLINA
INSERT INTO PeriodoDisciplina VALUES (1,1,2);
INSERT INTO PeriodoDisciplina VALUES (2,1,4);
INSERT INTO PeriodoDisciplina VALUES (3,1,6);
INSERT INTO PeriodoDisciplina VALUES (4,1,8);
INSERT INTO PeriodoDisciplina VALUES (5,1,10);
INSERT INTO PeriodoDisciplina VALUES (6,3,1);
INSERT INTO PeriodoDisciplina VALUES (7,5,2);
INSERT INTO PeriodoDisciplina VALUES (8,7,3);
INSERT INTO PeriodoDisciplina VALUES (9,9,4);
INSERT INTO PeriodoDisciplina VALUES (10,10,5);

--DISCIPLINAOFERTADA
INSERT INTO DisciplinaOfertada VALUES (1,1,2017,'1');
INSERT INTO DisciplinaOfertada VALUES (2,2,2017,'2');
INSERT INTO DisciplinaOfertada VALUES (3,3,2017,'1');
INSERT INTO DisciplinaOfertada VALUES (4,4,2017,'2');
INSERT INTO DisciplinaOfertada VALUES (5,5,2017,'2');
INSERT INTO DisciplinaOfertada VALUES (6,6,2017,'2');
INSERT INTO DisciplinaOfertada VALUES (7,7,2017,'1');
INSERT INTO DisciplinaOfertada VALUES (8,8,2017,'1');
INSERT INTO DisciplinaOfertada VALUES (9,9,2016,'1');
INSERT INTO DisciplinaOfertada VALUES (10,10,2015,'2');

--PROFESSOR
INSERT INTO Professor VALUES (1,11001, 'Avião','Manuela Avila', 'avila@hotmail.com', '11988556633');
INSERT INTO Professor VALUES (2,11002, 'Rio', 'Marcelo Nilo', 'nilo@hotmail.com', '11988545265');
INSERT INTO Professor VALUES (3,11003, 'Candomblé', 'Edvaldo Brito', 'brito@hotmail.com', '11998555123');
INSERT INTO Professor VALUES (4,11004, 'Comuna', 'Daniel Almeida', 'almeida@gmail.com', '11965878723');
INSERT INTO Professor VALUES (5,11005, 'Goleiro', 'Paulo Magalhães', 'magalhaes@hotmail.com', '11952456634');
INSERT INTO Professor VALUES (6,11006, 'Bruto', 'Raul Jungmann', 'jungmann@ig.com.br', '11954879644');
INSERT INTO Professor VALUES (7,11007, 'Neto', 'Geraldo Júlio', 'julio@gmail.com', '11978542118');
INSERT INTO Professor VALUES (8,11008, 'Cacique', 'Etore Labanca', 'labanca@hotmail.com', '11999878245');
INSERT INTO Professor VALUES (9,11009, 'Colorido', 'Fabio Branco', 'branco@ig.com.br', '11945444218');
INSERT INTO Professor VALUES (10,11010, 'Roberval', 'Mário Kertesz', 'kertesz@hotmail.com', '11948785222');

--TURMA
INSERT INTO Turma VALUES (1,1,'Manhã',1, 1);
INSERT INTO Turma VALUES (2,2,'Tarde',2, 1);
INSERT INTO Turma VALUES (3,3,'Noite',3, 8);
INSERT INTO Turma VALUES (4,4,'Manhã',4, 7);
INSERT INTO Turma VALUES (5,5,'Noite',5, 6);
INSERT INTO Turma VALUES (6,6,'Noite',6, 2);
INSERT INTO Turma VALUES (7,7,'Noite',7, 2);
INSERT INTO Turma VALUES (8,8,'Manhã',8, 1);
INSERT INTO Turma VALUES (9,9,'Tarde',9, 5);
INSERT INTO Turma VALUES (10,10,'Manhã',10, 10);

--CURSOTURMA
INSERT INTO CursoTurma VALUES (1,1,7);
INSERT INTO CursoTurma VALUES (2,2,8);
INSERT INTO CursoTurma VALUES (3,3,7);
INSERT INTO CursoTurma VALUES (4,4,10);
INSERT INTO CursoTurma VALUES (5,5,9);
INSERT INTO CursoTurma VALUES (6,1,3);
INSERT INTO CursoTurma VALUES (7,1,4);
INSERT INTO CursoTurma VALUES (8,1,6);
INSERT INTO CursoTurma VALUES (9,4,1);
INSERT INTO CursoTurma VALUES (10,5,7);

--MATRICULA
INSERT INTO Matricula VALUES (1,1,1);
INSERT INTO Matricula VALUES (2,2,1);
INSERT INTO Matricula VALUES (3,3,1);
INSERT INTO Matricula VALUES (4,4,1);
INSERT INTO Matricula VALUES (5,5,1);
INSERT INTO Matricula VALUES (6,6,1);
INSERT INTO Matricula VALUES (7,7,1);
INSERT INTO Matricula VALUES (8,8,2);
INSERT INTO Matricula VALUES (9,9,2);
INSERT INTO Matricula VALUES (10,10,2);