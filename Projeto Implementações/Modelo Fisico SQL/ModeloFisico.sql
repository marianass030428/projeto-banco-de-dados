-- DATABASE
CREATE DATABASE projeto;
USE projeto;
--DROP DATABASE projeto;


-- TABELAS
-- ENTIDADES

DROP TABLE IF EXISTS Cidade;
-- Tabela Cidade
CREATE TABLE Cidade(
  Cidade_ID INT NOT NULL,
  Nome CHAR(100) NOT NULL,
  PRIMARY KEY (Cidade_ID));
  
  INSERT INTO Cidade(Cidade_ID, Nome) VALUES (01, 'São Paulo');
  INSERT INTO Cidade(Cidade_ID, Nome) VALUES (02, 'Guarulhos');
  INSERT INTO Cidade(Cidade_ID, Nome) VALUES (03, 'Campinas');
  INSERT INTO Cidade(Cidade_ID, Nome) VALUES (04, 'São Bernado');
  INSERT INTO Cidade(Cidade_ID, Nome) VALUES (05, 'São José do Rio Preto');
  INSERT INTO Cidade(Cidade_ID, Nome) VALUES (06, 'Santos');
  INSERT INTO Cidade(Cidade_ID, Nome) VALUES (07, 'Cricíuma');
  INSERT INTO Cidade(Cidade_ID, Nome) VALUES (08, 'Ouro Preto');
  INSERT INTO Cidade(Cidade_ID, Nome) VALUES (09, 'Duque de Caxias');

  SELECT * FROM Cidade;


DROP TABLE IF EXISTS Estado;
-- Tabela Estado
CREATE TABLE Estado(
  Estado_ID INT NOT NULL,
  Nome VARCHAR(MAX) NOT NULL,
  UF VARCHAR(45) NOT NULL,
  PRIMARY KEY (Estado_ID));
  
  INSERT INTO Estado(Estado_ID, Nome, UF) VALUES (1, 'São Paulo', 'SP');
  INSERT INTO Estado(Estado_ID, Nome, UF) VALUES (2, 'Minas Gerais', 'MG');
  INSERT INTO Estado(Estado_ID, Nome, UF) VALUES (3, 'Bahia', 'MG');
  INSERT INTO Estado(Estado_ID, Nome, UF) VALUES (4, 'Paraná', 'PR');
  INSERT INTO Estado(Estado_ID, Nome, UF) VALUES (5, 'Mato Grosso do Sul', 'MS');

SELECT * FROM Estado;


DROP TABLE IF EXISTS Usuario;
-- Tabela Usuario
CREATE TABLE Usuario(
  Usuario_ID INT NOT NULL,
  Nome VARCHAR(MAX) NOT NULL,
  CPF VARCHAR(11) NOT NULL,
  Email VARCHAR(MAX) NOT NULL,
  Senha VARCHAR(15) NOT NULL,
  Fumante BIT NULL,
  Animais_De_Estimacao BIT NULL,
  Genero INT NULL, -- 1-MASCULINO; 2-FEMININO; 3-OUTRO 
  Aniversario DATE NULL,
  Anuncio_De_Perfil BIT NULL,
  PRIMARY KEY (Usuario_ID));
  
  INSERT INTO Usuario(Usuario_ID, Nome, CPF, Email, Senha, Fumante, Animais_De_Estimacao, Genero, Aniversario, Anuncio_De_Perfil) VALUES (001, 'Joaquim Ribas', '11111111111', 'joaquim@gmail.com', 'jOao528', NULL, NULL, 1, '1991-05-22', 1);
  INSERT INTO Usuario(Usuario_ID, Nome, CPF, Email, Senha, Fumante, Animais_De_Estimacao, Genero, Aniversario, Anuncio_De_Perfil) VALUES (002, 'Maria Silveira', '22222222222', 'maria@gmail.com', 'ma9934ria', 0, NULL, 2, '2000-09-01', 0);
  INSERT INTO Usuario(Usuario_ID, Nome, CPF, Email, Senha, Fumante, Animais_De_Estimacao, Genero, Aniversario, Anuncio_De_Perfil) VALUES (003, 'Rubens Souza', '33333333333', 'rubens@gmail.com', 'rbs314',1, 1, 1, '1997-11-16', 1);
  INSERT INTO Usuario(Usuario_ID, Nome, CPF, Email, Senha, Fumante, Animais_De_Estimacao, Genero, Aniversario, Anuncio_De_Perfil) VALUES (004, 'Carla Pereira', '44444444444', 'carlinha@gmail.com', 'crlpr352',0, 0, 2, '2000-09-02', 0);

SELECT * FROM Usuario;


DROP TABLE IF EXISTS Preferencias_Do_Usuario;
-- Tabela PreferenciasDoUsuario
CREATE TABLE Preferencias_Do_Usuario(
  Fumantes BIT NULL,
  Animais_De_Estimacao BIT NULL,
  Genero INT NULL, -- 1-MASCULINO; 2-FEMININO; 3-SEM PREFERÊNCIA 
  Procura_Garagem BIT NULL,
  Numero_De_Vagas INT NULL,
  Cidade_ID INT NOT NULL,
  Estado_ID INT NOT NULL,
  Preferencias_UsuarioID INT NOT NULL,
  INDEX fk_PreferenciasDoUsuario_Cidade1_idx (Cidade_ID ASC),
  INDEX fk_PreferenciasDoUsuario_Estado1_idx (Estado_ID ASC),
  INDEX fk_PreferenciasDoUsuario_Usuario2_idx (Preferencias_UsuarioID ASC),
  PRIMARY KEY (Preferencias_UsuarioID),
  CONSTRAINT fk_PreferenciasDoUsuario_Cidade
    FOREIGN KEY (Cidade_ID)
    REFERENCES Cidade (Cidade_ID),
  CONSTRAINT fk_PreferenciasDoUsuario_Estado
    FOREIGN KEY (Estado_ID)
    REFERENCES Estado (Estado_ID),
  CONSTRAINT fk_PreferenciasDoUsuario_Usuario
    FOREIGN KEY (Preferencias_UsuarioID)
    REFERENCES Usuario (Usuario_ID));

	INSERT INTO  Preferencias_Do_Usuario(Fumantes, Animais_De_Estimacao, Genero, Procura_Garagem, Numero_De_Vagas, Cidade_ID, Estado_ID, Preferencias_UsuarioID) VALUES (0, 1, 3, 0, NULL, 01, 1, 001);
	INSERT INTO  Preferencias_Do_Usuario(Fumantes, Animais_De_Estimacao, Genero, Procura_Garagem, Numero_De_Vagas, Cidade_ID, Estado_ID, Preferencias_UsuarioID) VALUES (1, 1, 2, 0, NULL, 01, 1, 002);
	INSERT INTO  Preferencias_Do_Usuario(Fumantes, Animais_De_Estimacao, Genero, Procura_Garagem, Numero_De_Vagas, Cidade_ID, Estado_ID, Preferencias_UsuarioID) VALUES (0, 1, 1, 1, 1, 03, 1, 003);

	SELECT * FROM  Preferencias_Do_Usuario;

DROP TABLE IF EXISTS Tipo_De_Contato;
-- Tabela TipoDeContato`
CREATE TABLE Tipo_De_Contato(
  Tipo_ID INT NOT NULL,
  Nome VARCHAR(200) NOT NULL,
  PRIMARY KEY (Tipo_ID));
  
  INSERT INTO Tipo_De_Contato (Tipo_ID, Nome) VALUES (1, 'WhatsApp');
  INSERT INTO Tipo_De_Contato (Tipo_ID, Nome) VALUES (2, 'Facebook');
  INSERT INTO Tipo_De_Contato (Tipo_ID, Nome) VALUES (3, 'Instagram');
  
  SELECT * FROM Tipo_De_Contato;


DROP TABLE IF EXISTS Casa;
-- Tabela Casa
CREATE TABLE Casa(
  Casa_ID INT NOT NULL,
  Nome VARCHAR(MAX) NOT NULL,
  Logadouro VARCHAR(MAX) NOT NULL,
  Numero_Da_Casa INT NOT NULL,
  Complemento VARCHAR(100) NULL,
  CEP CHAR(8) NOT NULL,
  Anunciar_Casa BIT NOT NULL,
  Quantidade_De_Vagas INT NULL,
  Tem_Fumantes BIT NOT NULL,
  Tem_Animais_De_Estimacao BIT NOT NULL,
  Tipo_De_Quarto INT NOT NULL, -- 1-Individual; 2-Compartilhado; 3-Individuais e compartilhados,
  Tem_Garagem BIT NOT NULL,
  Numero_De_Vagas_Na_Garagem INT NULL,
  Restricao_De_Genero INT NOT NULL, -- 1-Todos os gêneros; 2-Apenas homens; 3-Apenas mulheres,
  Descricao VARCHAR(MAX) NULL,
  Cidade_ID INT NOT NULL,
  Estado_ID INT NOT NULL,
  PRIMARY KEY (Casa_ID),
  INDEX fk_Casa_Cidade1_idx (Cidade_ID ASC),
  INDEX fk_Casa_Estado1_idx (Estado_ID ASC),
  CONSTRAINT fk_Casa_Cidade
    FOREIGN KEY (Cidade_ID)
    REFERENCES Cidade (Cidade_ID),
  CONSTRAINT fk_Casa_Estado
    FOREIGN KEY (Estado_ID)
    REFERENCES Estado (Estado_ID));
    
    INSERT INTO Casa (Casa_ID, Nome, Logadouro, Numero_Da_Casa, Complemento, CEP, Anunciar_Casa, Quantidade_De_Vagas, Tem_Fumantes, Tem_Animais_De_Estimacao, Tipo_De_Quarto, Tem_Garagem, Numero_De_Vagas_Na_Garagem, Restricao_De_Genero, Descricao, Cidade_ID, Estado_ID) 
	VALUES (1, 'Reublica do IF', 'R. Pedro Vicente - Canindé', 625, NULL, 01109010, 1, 3, 0, 0, 2, 0, NULL, 1, NULL, 1, 1);
	INSERT INTO Casa (Casa_ID,Nome, Logadouro, Numero_Da_Casa, Complemento, CEP, Anunciar_Casa, Quantidade_De_Vagas, Tem_Fumantes, Tem_Animais_De_Estimacao, Tipo_De_Quarto, Tem_Garagem, Numero_De_Vagas_Na_Garagem, Restricao_De_Genero, Descricao, Cidade_ID, Estado_ID) 
	VALUES (2, 'FemRep', 'Av. Tiradentes', 25, NULL, 07134678, 1, 2, 0, 1, 2, 0, NULL, 3, 'Republica feminina de estudantes do IFSP.', 3, 1);
    
    SELECT * FROM Casa;
    
    
DROP TABLE IF EXISTS Contato;
-- Tabela Contato
CREATE TABLE Contato(
  Contato_ID INT NOT NULL,
  Informacao VARCHAR(2000) NOT NULL,
  Tipo_ID INT NOT NULL,
  Usuario_ID INT NULL,
  Casa_ID INT NULL,
  PRIMARY KEY (Contato_ID),
  INDEX fk_Contato_TipoDeContato1_idx (Tipo_ID ASC),
  INDEX fk_Contato_Usuario1_idx (Usuario_ID ASC),
  INDEX fk_Contato_Casa1_idx (Casa_ID ASC),
  CONSTRAINT fk_Contato_TipoDeContato1
    FOREIGN KEY (Tipo_ID)
    REFERENCES Tipo_De_Contato (Tipo_ID),
  CONSTRAINT fk_Contato_Usuario1
    FOREIGN KEY (Usuario_ID)
    REFERENCES Usuario (Usuario_ID),
  CONSTRAINT fk_Contato_Casa1
    FOREIGN KEY (Casa_ID)
    REFERENCES Casa (Casa_ID));
    
    INSERT INTO Contato (Contato_ID, Informacao, Tipo_ID, Usuario_ID, Casa_ID) VALUES (1, '@maria_silvera', 3, 2, NULL);
    INSERT INTO Contato (Contato_ID, Informacao, Tipo_ID, Usuario_ID, Casa_ID) VALUES (2, '@RepublicaFeminina', 3, NULL, 2);
    
    SELECT * FROM Contato;


DROP TABLE IF EXISTS Residente;
-- Tabela Residente
CREATE TABLE Residente(
  Residente_ID INT NOT NULL,
  Status_Administrador BIT NOT NULL,
  Data_De_Deletacao DATE NULL,
  Casa_ID INT NOT NULL,
  Usuario_ID INT NOT NULL,
  PRIMARY KEY (Residente_ID),
  INDEX fk_Residente_Casa1_idx (Casa_ID ASC),
  INDEX fk_Residente_Usuario1_idx (Usuario_ID ASC),
  CONSTRAINT fk_Residente_Casa1
    FOREIGN KEY (Casa_ID)
    REFERENCES Casa (Casa_ID),
  CONSTRAINT fk_Residente_Usuario1
    FOREIGN KEY (Usuario_ID)
    REFERENCES Usuario (Usuario_ID));
    
    INSERT INTO Residente (Residente_ID, Status_Administrador, Data_De_Deletacao, Casa_ID, Usuario_ID) VALUES (1, 1, NULL, 1, 1);
	INSERT INTO Residente (Residente_ID, Status_Administrador, Data_De_Deletacao, Casa_ID, Usuario_ID) VALUES (2, 0, NULL, 2, 3);
	INSERT INTO Residente (Residente_ID, Status_Administrador, Data_De_Deletacao, Casa_ID, Usuario_ID) VALUES (3, 0, NULL, 1, 4);
    
    SELECT * FROM Residente;


DROP TABLE IF EXISTS Penalidade;
-- Tabela Penalidade
CREATE TABLE Penalidade(
  Penalidade_ID INT NOT NULL,
  Titulo VARCHAR(MAX) NOT NULL,
  PRIMARY KEY (Penalidade_ID));

  INSERT INTO Penalidade (Penalidade_ID, Titulo) VALUES (1, 'Realizar a mesma tarefa durante um mês.');
  INSERT INTO Penalidade (Penalidade_ID, Titulo) VALUES (2, 'Receber mais 2 tarefas (designadas pelo administrador da casa).');
  INSERT INTO Penalidade (Penalidade_ID, Titulo) VALUES (3, 'Realizar uma tarefa no lugar de outro residente.');

  SELECT * FROM Penalidade;

DROP TABLE IF EXISTS Tarefa_Periodica;
-- Table TarefaPeriodica
CREATE TABLE Tarefa_Periodica(
  Tarefa_PeriodicaID INT NOT NULL,
  Titulo VARCHAR(MAX) NOT NULL,
  Descricao VARCHAR(MAX) NULL,
  Periodicidade_Da_Tarefa INT NOT NULL, -- 1- Diária; 2-Semanal; 3-Mensal; 4-Anual
  Data_De_Criacao DATE NOT NULL,
  Data_De_Inicio DATE NOT NULL,
  Data_Da_Ultima_Instancia DATE NULL,
  Indicacao_De_Atraso BIT NOT NULL,
  Data_De_Exclusão DATE NULL,
  Casa_ID INT NOT NULL,
  Penalidade_ID INT NOT NULL,
  Residente_Criador_ID INT NOT NULL,
  PRIMARY KEY (Tarefa_PeriodicaID),
  INDEX fk_TarefaPeriodica_Casa1_idx (Casa_ID ASC),
  INDEX fk_TarefaPeriodica_Penalidade1_idx (Penalidade_ID ASC),
  INDEX fk_TarefaPeriodica_Residente1_idx (Residente_Criador_ID ASC),
  CONSTRAINT fk_TarefaPeriodica_Casa1
    FOREIGN KEY (Casa_ID)
    REFERENCES Casa (Casa_ID),
  CONSTRAINT fk_TarefaPeriodica_Penalidade1
    FOREIGN KEY (Penalidade_ID)
    REFERENCES Penalidade (Penalidade_ID),
  CONSTRAINT fk_TarefaPeriodica_Residente1
    FOREIGN KEY (Residente_Criador_ID)
    REFERENCES Residente (Residente_ID));

	INSERT INTO Tarefa_Periodica(Tarefa_PeriodicaID, Titulo, Descricao, Periodicidade_Da_Tarefa, Data_De_Criacao, Data_De_Inicio, Data_Da_Ultima_Instancia, Indicacao_De_Atraso, Data_De_Exclusão, Casa_ID, Penalidade_ID, Residente_Criador_ID) VALUES (1, 'Lavar roupa', 'Lavar as roupas sujas de todos os moradores da casa.', 1, '2020-04-09', '2020-04-09', '2020-11-27', 0, NULL, 1, 1, 2);

	SELECT * FROM Tarefa_Periodica;

DROP TABLE IF EXISTS Preferencias_Da_Casa;
-- Tabela PreferenciasDaCasa
CREATE TABLE Preferencias_Da_Casa(
  Fumantes BIT NULL,
  Animais_De_Estimacao BIT NULL,
  Genero INT NOT NULL, -- 1-Todos os gêneros; 2-Apenas Homens; 3-Mulheres
  Idade_Minima_Dos_Residentes INT NULL,
  Idade_Maxima_Dos_Residentes INT NULL,
  Casa_ID INT NOT NULL,
  PRIMARY KEY (Casa_ID),
  INDEX fk_PreferenciasDaCasa_Casa1_idx (Casa_ID ASC),
  CONSTRAINT fk_PreferenciasDaCasa_Casa1
    FOREIGN KEY (Casa_ID)
    REFERENCES Casa (Casa_ID));

	INSERT INTO Preferencias_Da_Casa(Fumantes, Animais_De_Estimacao, Genero, Idade_Minima_Dos_Residentes, Idade_Maxima_Dos_Residentes, Casa_ID) VALUES (0, 0, 3, 18, NULL, 1);
	INSERT INTO Preferencias_Da_Casa(Fumantes, Animais_De_Estimacao, Genero, Idade_Minima_Dos_Residentes, Idade_Maxima_Dos_Residentes, Casa_ID) VALUES (1, 1, 1, 18, 20, 2);

	SELECT * FROM Preferencias_Da_Casa;

DROP TABLE IF EXISTS Registro_De_Tarefas_E_Despesas;
-- Tabela RegistroDeTarefasEDespesas
CREATE TABLE Registro_De_Tarefas_E_Despesas(
  Registro INT NOT NULL,
  Responsável INT NOT NULL, --Identificação do responsável pelo registro
  Identificacao_Do_Tipo INT NOT NULL, -- Se é sobre uma tarefa ou despesa. 1-Tarefa; 2-Despesa
  Data_Do_Registro DATE NOT NULL,
  Descricao VARCHAR(MAX) NULL,
  Casa_ID INT NOT NULL,
  PRIMARY KEY (Registro),
  INDEX fk_RegistroDeTarefasEDespesas_Casa1_idx (Casa_ID ASC),
  CONSTRAINT fk_RegistroDeTarefasEDespesas_Casa1
    FOREIGN KEY (Casa_ID)
    REFERENCES Casa (Casa_ID));

	INSERT INTO Registro_De_Tarefas_E_Despesas(Registro, Responsável, Identificacao_Do_Tipo, Data_Do_Registro, Descricao, Casa_ID) VALUES (1, 3, 2, '2020/07/27', 'Conta de água foi paga.', 2);

	SELECT * FROM Registro_De_Tarefas_E_Despesas;


DROP TABLE IF EXISTS Despesa;
-- Tabela Despesa
CREATE TABLE Despesa(
  Despesa_ID INT NOT NULL,
  Titulo VARCHAR(MAX) NOT NULL,
  Data_De_Vencimento DATE NOT NULL,
  Data_Em_Que_Foi_Paga DATE NULL,
  Valor DECIMAL NOT NULL,
  Indicacao_De_Pagamento BIT NOT NULL, --Se esta paga
  Data_De_Exclusao DATE NULL,
  Casa_ID INT NOT NULL,
  PRIMARY KEY (Despesa_ID),
  INDEX fk_Despesa_Casa1_idx (Casa_ID ASC),
  CONSTRAINT fk_Despesa_Casa1
    FOREIGN KEY (Casa_ID)
    REFERENCES Casa (Casa_ID));

	INSERT INTO Despesa(Despesa_ID, Titulo, Data_De_Vencimento, Data_Em_Que_Foi_Paga, Valor, Indicacao_De_Pagamento, Data_De_Exclusao, Casa_ID) VALUES(1, 'Conta de Água', '2020-12-15', '2020-12-04', 260.76, 1, NULL, 1);
	INSERT INTO Despesa(Despesa_ID, Titulo, Data_De_Vencimento, Data_Em_Que_Foi_Paga, Valor, Indicacao_De_Pagamento, Data_De_Exclusao, Casa_ID) VALUES(2, 'Conta de Água', '2020-07-30', '2020-07-27', 198.45, 1, NULL, 2);
	INSERT INTO Despesa(Despesa_ID, Titulo, Data_De_Vencimento, Data_Em_Que_Foi_Paga, Valor, Indicacao_De_Pagamento, Data_De_Exclusao, Casa_ID) VALUES(3, 'Conta de Luz', '2020-05-10', '2020-05-05', 474.56, 1, '2020-05-23', 2);
	INSERT INTO Despesa(Despesa_ID, Titulo, Data_De_Vencimento, Data_Em_Que_Foi_Paga, Valor, Indicacao_De_Pagamento, Data_De_Exclusao, Casa_ID) VALUES(4, 'Conta de Internet e TV', '2020-12-30', NULL, 697.32, 0, NULL, 1);

	SELECT * FROM Despesa;

DROP TABLE IF EXISTS Tarefa;
-- Tabela Tarefa
CREATE TABLE Tarefa(
  Tarefa_ID INT NOT NULL,
  Titulo VARCHAR(MAX) NOT NULL,
  Descricao VARCHAR(MAX) NULL,
  Data_De_Criacao DATE NOT NULL,
  Data_Da_Tarefa DATE NOT NULL,
  Data_De_Finalizacao DATE NULL,
  Data_Da_Penalidade DATE NULL,
  Status_Da_Penalidade BIT NULL,--Indica se a penalidade da tarefa está inativa (0/FALSE), ativa (NULL) ou concluída (1/TRUE).
  Indicacao_De_Atraso BIT NOT NULL,
  Data_De_Exclusão DATE NULL,
  Penalidade_ID INT NOT NULL,
  Casa_ID INT NOT NULL,
  Residente_CriadorID INT NOT NULL,
  Residente_FinalizadorID INT NOT NULL,
  PRIMARY KEY (Tarefa_ID),
  INDEX fk_Tarefa_Casa1_idx (Casa_ID ASC),
  INDEX fk_Tarefa_Penalidade1_idx (Penalidade_ID ASC),
  INDEX fk_Tarefa_Residente1_idx (Residente_CriadorID ASC),
  INDEX fk_Tarefa_Residente2_idx (Residente_FinalizadorID ASC),
  CONSTRAINT fk_Tarefa_Casa1
    FOREIGN KEY (Casa_ID)
    REFERENCES Casa (Casa_ID),
  CONSTRAINT fk_Tarefa_Penalidade1
    FOREIGN KEY (Penalidade_ID)
    REFERENCES Penalidade (Penalidade_ID),
  CONSTRAINT fk_Tarefa_Residente1
    FOREIGN KEY (Residente_CriadorID)
    REFERENCES Residente(Residente_ID),
  CONSTRAINT fk_Tarefa_Residente2
    FOREIGN KEY (Residente_FinalizadorID)
    REFERENCES Residente (Residente_ID));
	
	INSERT INTO Tarefa(Tarefa_ID, Titulo, Descricao, Data_De_Criacao, Data_Da_Tarefa, Data_De_Finalizacao, Data_Da_Penalidade, Status_Da_Penalidade, Indicacao_De_Atraso, Data_De_Exclusão, Penalidade_ID , Casa_ID, Residente_CriadorID, Residente_FinalizadorID) VALUES (1, 'Comprar tinta para pintura dos quartos', NULL, '2018-04-23', '2018-04-28', '2018-04-28', NULL, 0, 0, NULL, 3, 1, 1, 1);
	
	SELECT * FROM Tarefa;

-- TABELAS DE RELACIONAMENTO

DROP TABLE IF EXISTS Convite;
-- Tabela Convite
CREATE TABLE Convite(
  Convite_ID INT IDENTITY(1,1) NOT NULL,
  Residente_ID INT NOT NULL,
  Usuario_ConvidadoID INT NOT NULL,
  Data_Do_Convite DATE NOT NULL,
  Data_De_Resposta DATE NULL,
  Resposta BIT NULL,
  PRIMARY KEY (Convite_ID, Residente_ID, Usuario_ConvidadoID),
  INDEX fk_Residente_has_Usuario_Usuario1_idx (Usuario_ConvidadoID ASC),
  INDEX fk_Residente_has_Usuario_Residente1_idx (Residente_ID ASC),
  CONSTRAINT fk_Residente_has_Usuario_Residente1
    FOREIGN KEY (Residente_ID)
    REFERENCES Residente (Residente_ID),
  CONSTRAINT fk_Residente_has_Usuario_Usuario1
    FOREIGN KEY (Usuario_ConvidadoID)
    REFERENCES Usuario (Usuario_ID));

	INSERT INTO Convite(Residente_ID, Usuario_ConvidadoID, Data_Do_Convite, Data_De_Resposta, Resposta) VALUES (2, 4, '2019-11-08', '2019-11-28', 1);

	SELECT * FROM Convite;


DROP TABLE IF EXISTS Despesa_Do_Residente;
-- Tabela DespesaDoResidente
CREATE TABLE Despesa_Do_Residente(
  Desp_Res_ID INT IDENTITY(1,1) NOT NULL,
  Residente_ID INT  NOT NULL,
  Despesa_ID INT NOT NULL,
  Data_De_Contribuicao DATE NULL,
  Data_Prevista_Da_Contribuicao DATE NOT NULL,
  Valor_Da_Contribuicao DECIMAL NOT NULL,
  Responsável BIT NOT NULL,
  Contribuinte BIT NOT NULL,
  Indicacao_De_Atraso BIT NOT NULL,
  Data_De_Exclusao DATE NULL,
  Valor_Da_Despesa DECIMAL NOT NULL,
  PRIMARY KEY (Residente_ID, Despesa_ID),
  INDEX fk_Residente_has_Despesa_Despesa1_idx (Despesa_ID ASC),
  INDEX fk_Residente_has_Despesa_Residente1_idx (Residente_ID ASC),
  CONSTRAINT fk_Residente_has_Despesa_Residente1
    FOREIGN KEY (Residente_ID)
    REFERENCES Residente (Residente_ID),
  CONSTRAINT fk_Residente_has_Despesa_Despesa1
    FOREIGN KEY (Despesa_ID)
    REFERENCES Despesa (Despesa_ID));

	  INSERT INTO Despesa_Do_Residente(Residente_ID, Despesa_ID, Data_De_Contribuicao, Data_Prevista_Da_Contribuicao, Valor_Da_Contribuicao, Responsável, Contribuinte, Indicacao_De_Atraso, Data_De_Exclusao, Valor_Da_Despesa) VALUES (1, 1, '2020-11-29', '2020-12-01', 60.00, 1, 1, 0, NULL, 260.76);
	  INSERT INTO Despesa_Do_Residente(Residente_ID, Despesa_ID, Data_De_Contribuicao, Data_Prevista_Da_Contribuicao, Valor_Da_Contribuicao, Responsável, Contribuinte, Indicacao_De_Atraso, Data_De_Exclusao, Valor_Da_Despesa) VALUES (3, 4, '2020-11-30', '2020-12-01', 75.00, 0, 1, 0, NULL, 697.32);

	  SELECT * FROM Despesa_Do_Residente;

DROP TABLE IF EXISTS Tarefa_Periodica_Do_Residente;
-- Tabela TarefaPeriodicaDoResidente
CREATE TABLE Tarefa_Periodica_Do_Residente(
  Tarefa_Per_Do_Res_ID INT IDENTITY(1,1) NOT NULL,
  Residente_ID INT NOT NULL,
  Tarefa_PeriodicaID INT NOT NULL,
  Data_De_Atribuicao DATE NULL,
  PRIMARY KEY (Tarefa_Per_Do_Res_ID, Residente_ID, Tarefa_PeriodicaID),
  INDEX fk_Residente_has_TarefaPeriodica_TarefaPeriodica1_idx (Tarefa_PeriodicaID ASC),
  INDEX fk_Residente_has_TarefaPeriodica_Residente1_idx (Residente_ID ASC) ,
  CONSTRAINT fk_Residente_has_TarefaPeriodica_Residente1
    FOREIGN KEY (Residente_ID)
    REFERENCES Residente (Residente_ID),
  CONSTRAINT fk_Residente_has_TarefaPeriodica_TarefaPeriodica1
    FOREIGN KEY (Tarefa_PeriodicaID)
    REFERENCES Tarefa_Periodica (Tarefa_PeriodicaID));

	INSERT INTO Tarefa_Periodica_Do_Residente(Residente_ID, Tarefa_PeriodicaID, Data_De_Atribuicao) VALUES (2, 1, NULL);

	SELECT * FROM Tarefa_Periodica_Do_Residente;

DROP TABLE IF EXISTS Tarefa_Do_Residente;
-- Tabela TarefaDoResidente
CREATE TABLE Tarefa_Do_Residente(
  Tarefa_Do_Res_ID INT IDENTITY(1,1) NOT NULL,
  Residente_ID INT NOT NULL,
  Tarefa_ID INT NOT NULL,
  Data_De_Atribuicao DATE NOT NULL,
  PRIMARY KEY (Tarefa_Do_Res_ID, Residente_ID, Tarefa_ID),
  INDEX fk_Residente_has_Tarefa_Tarefa1_idx (Tarefa_ID ASC),
  INDEX fk_Residente_has_Tarefa_Residente1_idx (Residente_ID ASC),
  CONSTRAINT fk_Residente_has_Tarefa_Residente1
    FOREIGN KEY (Residente_ID)
    REFERENCES Residente (Residente_ID),
  CONSTRAINT fk_Residente_has_Tarefa_Tarefa1
    FOREIGN KEY (Tarefa_ID)
    REFERENCES Tarefa (Tarefa_ID));

	INSERT INTO Tarefa_Do_Residente(Residente_ID, Tarefa_ID, Data_De_Atribuicao) VALUES (3, 1, '2020-04-23');

	SELECT * FROM Tarefa_Do_Residente;