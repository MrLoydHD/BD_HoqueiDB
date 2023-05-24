-- USE p4g7;
-- GO

USE Test_Hoquei;
GO


-- This file is responsible for creating the tables and the foreign keys of the HoqueiPortugues database.
-- It is meant to be run on Microsoft SQL Server Management Studio.
-- Its not designed to be runned multiple times
DROP TABLE IF EXISTS HoqueiPortugues.Plantel_Jogadores;
DROP TABLE IF EXISTS HoqueiPortugues.Plantel_Treinadores;
DROP TABLE IF EXISTS HoqueiPortugues.e_arbitrado;
DROP TABLE IF EXISTS HoqueiPortugues.Jogo;
DROP TABLE IF EXISTS HoqueiPortugues.Plantel;
DROP TABLE IF EXISTS HoqueiPortugues.Arbitro;
DROP TABLE IF EXISTS HoqueiPortugues.Treinador;
DROP TABLE IF EXISTS HoqueiPortugues.Jogador_GuardaRedes;
DROP TABLE IF EXISTS HoqueiPortugues.Jogador_Campo;
DROP TABLE IF EXISTS HoqueiPortugues.Jogador;
DROP TABLE IF EXISTS HoqueiPortugues.Especialista_Tecnico;
DROP TABLE IF EXISTS HoqueiPortugues.Pavilhao;
DROP TABLE IF EXISTS HoqueiPortugues.Clube;
GO

CREATE TABLE HoqueiPortugues.Clube(
    ID int PRIMARY KEY,
    Nome varchar(50) NOT NULL,
    Cidade varchar(50) NOT NULL,
    Ano_fund int NOT NULL
);
GO

CREATE TABLE HoqueiPortugues.Pavilhao(
    ID int PRIMARY KEY,
    Nome varchar(50) NOT NULL,
    Endereco varchar(50) NOT NULL,
    Capacidade int NOT NULL,
    Clube_ID int NOT NULL
);
GO

CREATE TABLE HoqueiPortugues.Especialista_Tecnico(
    ID int PRIMARY KEY,
    Nome varchar(50) NOT NULL,
    Idade int NOT NULL,
    Especialidade varchar(50) NOT NULL,
    Nacionalidade varchar(50) NOT NULL,
    Clube_ID int NOT NULL
);
GO

CREATE TABLE HoqueiPortugues.Jogador(
    ID int PRIMARY KEY,
    Nome varchar(50) NOT NULL,
    Idade int NOT NULL,
    Posicao varchar(50) NOT NULL,
    Nacionalidade varchar(50) NOT NULL,
    Num_camisola int NOT NULL,
    Clube_ID int,
    advertencias int NOT NULL,
    cartoes_azuis int NOT NULL,
    cartoes_vermelhos int NOT NULL, 
    --inapto BIT NOT NULL, 
);
GO

CREATE TABLE HoqueiPortugues.Jogador_Campo(
    Jogador_ID int PRIMARY KEY,
    Golos_marcados int NOT NULL,
    Assists int NOT NULL,
    Penaltis_marcados int NOT NULL,
    Livres_diretos_marcados int NOT NULL
);
GO

CREATE TABLE HoqueiPortugues.Jogador_GuardaRedes(
    Jogador_ID int PRIMARY KEY,
    Golos_sofridos int NOT NULL,
    Penaltis_defendidos int NOT NULL,
    Livres_diretos_defendidos int NOT NULL
);
GO

CREATE TABLE HoqueiPortugues.Treinador(
    ID int PRIMARY KEY,
    Nome varchar(50) NOT NULL,
    Idade int NOT NULL,
    Tipo_treinador varchar(50) NOT NULL,
    Nacionalidade varchar(50) NOT NULL,
    Clube_ID int 
);
GO

CREATE TABLE HoqueiPortugues.Jogo(
    ID int PRIMARY KEY,
    Jornada int NOT NULL,
    Resultado_F int,
    Resultado_C int,
    Data_hora DATETIME NOT NULL,
    Clube_F_ID int NOT NULL,
    Clube_C_ID int NOT NULL,
    Pavilhao_ID int NOT NULL,
    Plantel_F_ID int,
    Plantel_C_ID int,
	JogoRealizado bit NOT NULL
);
GO

CREATE TABLE HoqueiPortugues.Arbitro(
    ID int PRIMARY KEY,
    Nome varchar(50) NOT NULL,
    Idade int NOT NULL,
    Tipo_arbitro varchar(50) NOT NULL,
    Nacionalidade varchar(50) NOT NULL
);
GO

CREATE TABLE HoqueiPortugues.e_arbitrado(
    Arbitro_ID int NOT NULL,
    Jogo_ID int NOT NULL,
    PRIMARY KEY (Arbitro_ID, Jogo_ID)
);
GO

CREATE TABLE HoqueiPortugues.Plantel(
    ID int PRIMARY KEY,
    Clube_ID int NOT NULL,
);
GO

CREATE TABLE HoqueiPortugues.Plantel_Jogadores(
    Plantel_ID int NOT NULL,
    Jogador_ID int NOT NULL,
    PRIMARY KEY (Plantel_ID, Jogador_ID),
);
GO

CREATE TABLE HoqueiPortugues.Plantel_Treinadores(
    Plantel_ID int NOT NULL,
    Treinador_ID int NOT NULL,
    PRIMARY KEY (Plantel_ID, Treinador_ID),
);
GO

-- Adicionando as restrições de chave estrangeira
ALTER TABLE HoqueiPortugues.Pavilhao
    ADD FOREIGN KEY (Clube_ID) REFERENCES HoqueiPortugues.Clube(ID);
GO

ALTER TABLE HoqueiPortugues.Especialista_Tecnico
    ADD FOREIGN KEY (Clube_ID) REFERENCES HoqueiPortugues.Clube(ID);
GO

ALTER TABLE HoqueiPortugues.Jogador
    ADD FOREIGN KEY (Clube_ID) REFERENCES HoqueiPortugues.Clube(ID);
GO

ALTER TABLE HoqueiPortugues.Jogador_Campo
    ADD FOREIGN KEY (Jogador_ID) REFERENCES HoqueiPortugues.Jogador(ID);
GO

ALTER TABLE HoqueiPortugues.Jogador_GuardaRedes
    ADD FOREIGN KEY (Jogador_ID) REFERENCES HoqueiPortugues.Jogador(ID);
GO

ALTER TABLE HoqueiPortugues.Treinador
    ADD FOREIGN KEY (Clube_ID) REFERENCES HoqueiPortugues.Clube(ID);
GO

ALTER TABLE HoqueiPortugues.Plantel
    ADD FOREIGN KEY (Clube_ID) REFERENCES HoqueiPortugues.Clube(ID);
GO

ALTER TABLE HoqueiPortugues.Jogo
    ADD FOREIGN KEY (Clube_F_ID) REFERENCES HoqueiPortugues.Clube(ID),
        FOREIGN KEY (Clube_C_ID) REFERENCES HoqueiPortugues.Clube(ID),
        FOREIGN KEY (Pavilhao_ID) REFERENCES HoqueiPortugues.Pavilhao(ID),
        FOREIGN KEY (Plantel_F_ID) REFERENCES HoqueiPortugues.Plantel(ID),
        FOREIGN KEY (Plantel_C_ID) REFERENCES HoqueiPortugues.Plantel(ID);
GO

ALTER TABLE HoqueiPortugues.Plantel_Jogadores
    ADD FOREIGN KEY (Plantel_ID) REFERENCES HoqueiPortugues.Plantel(ID),
        FOREIGN KEY (Jogador_ID) REFERENCES HoqueiPortugues.Jogador(ID);
GO

ALTER TABLE HoqueiPortugues.Plantel_Treinadores
    ADD FOREIGN KEY (Plantel_ID) REFERENCES HoqueiPortugues.Plantel(ID),
        FOREIGN KEY (Treinador_ID) REFERENCES HoqueiPortugues.Treinador(ID);
GO

ALTER TABLE HoqueiPortugues.e_arbitrado
    ADD FOREIGN KEY (Arbitro_ID) REFERENCES HoqueiPortugues.Arbitro(ID),
        FOREIGN KEY (Jogo_ID) REFERENCES HoqueiPortugues.Jogo(ID);
GO

