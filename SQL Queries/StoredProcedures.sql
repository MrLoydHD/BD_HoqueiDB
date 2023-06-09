use p4g7;
--use Test_Hoquei;
go

-- This file is a SQL script that creates the schema for the HoqueiPortugues database.
-- It is meant to be run on Microsoft SQL Server Management Studio.

/*
RETORNAR AS CLASSIFICAÇÕES DOS CLUBES DA LIGA PORTUGUESA DE HOQUEI EM PATINS
*/

-- Exclui o procedimento se ele já existir

CREATE PROCEDURE HoqueiPortugues.calcularClassificacao AS 
BEGIN

    CREATE TABLE #classificacao (
        Clube_ID int,
        NomeClube varchar(50),
        Jogos int,
        Pontos int,
        Vitorias int,
        Empates int,
        Derrotas int,
        GolosMarcados int,
        GolosSofridos int,
        DiferencaGolos int
    );

    DECLARE @Clube_ID int, @NomeClube nvarchar(50);
    DECLARE ClubeCursor CURSOR FOR SELECT ID, Nome from HoqueiPortugues.Clube;
    OPEN ClubeCursor;
    FETCH NEXT FROM ClubeCursor INTO @Clube_ID, @NomeClube;
    WHILE @@FETCH_STATUS = 0
        BEGIN
            -- Calcular as estatísticas para este clube
            DECLARE @Jogos int = 0, @Pontos int = 0, @Vitorias int = 0, @Empates int = 0, @Derrotas int = 0, @GolosMarcados int = 0, @GolosSofridos int = 0, @DiferencaGolos int = 0; 
            
                --Calcular as estatísticas para este clube
                SELECT @Jogos = COUNT(*) FROM HoqueiPortugues.Jogo WHERE (Clube_F_ID = @Clube_ID OR Clube_C_ID = @Clube_ID) AND Resultado_F IS NOT NULL AND Resultado_C IS NOT NULL AND JogoRealizado = 1;

                SELECT @Vitorias = COUNT(*) FROM HoqueiPortugues.Jogo WHERE (Clube_F_ID = @Clube_ID AND Resultado_F > Resultado_C) OR (Clube_C_ID = @Clube_ID AND Resultado_C > Resultado_F) AND Resultado_F IS NOT NULL AND Resultado_C IS NOT NULL AND JogoRealizado = 1;

                SELECT @Empates = COUNT(*) FROM HoqueiPortugues.Jogo WHERE (Clube_F_ID = @Clube_ID AND Resultado_F = Resultado_C) OR (Clube_C_ID = @Clube_ID AND Resultado_C = Resultado_F) AND Resultado_F IS NOT NULL AND Resultado_C IS NOT NULL AND JogoRealizado = 1;

                SELECT @Derrotas = @Jogos - @Vitorias - @Empates;

                SELECT @GolosMarcados = SUM(Case When Clube_F_ID = @Clube_ID Then Resultado_F else Resultado_C end),
                       @GolosSofridos = SUM(Case When Clube_F_ID = @Clube_ID Then Resultado_C else Resultado_F end)
                FROM HoqueiPortugues.Jogo
                WHERE (Clube_F_ID = @Clube_ID OR Clube_C_ID = @Clube_ID) AND Resultado_F IS NOT NULL AND Resultado_C IS NOT NULL AND JogoRealizado = 1;

                SELECT @DiferencaGolos = @GolosMarcados - @GolosSofridos;

                SELECT @Pontos = @Vitorias * 3 + @Empates;

            INSERT INTO #classificacao VALUES (@Clube_ID, @NomeClube, @Jogos, @Pontos, @Vitorias, @Empates, @Derrotas, @GolosMarcados, @GolosSofridos, @DiferencaGolos);
            FETCH NEXT FROM ClubeCursor INTO @Clube_ID, @NomeClube;
        END

        CLOSE ClubeCursor;
        DEALLOCATE ClubeCursor;

        SELECT NomeClube, Jogos, Pontos, Vitorias, Empates, Derrotas, GolosMarcados, GolosSofridos, DiferencaGolos FROM #classificacao ORDER BY Pontos DESC, DiferencaGolos DESC, GolosMarcados DESC, GolosSofridos ASC;

        DROP TABLE #classificacao;
END;
GO


/*
CONTRATAR UM JOGADOR QUE NÃO ESTEJA NA BASE DE DADOS (ESTRANGEIRO)
*/

--Exclui o procedimento se ele já existir

CREATE PROCEDURE HoqueiPortugues.contratarJogador 
    @Nome AS varchar(50), @Idade AS int, @Posicao AS varchar(50), @Nacionalidade AS varchar(50), @Num_camisola AS int, @Clube_ID AS int
AS  
BEGIN
    
    --Verifica se o numero da camisola já não está ocupado
    IF EXISTS (SELECT * FROM HoqueiPortugues.Jogador WHERE Num_camisola = @Num_camisola) 
        BEGIN
            RAISERROR('Numero da camisola já está ocupado', 16, 1);
            RETURN;
        END
    ELSE 
    BEGIN
        DECLARE @Jogador_ID int;
        SET @Jogador_ID = (SELECT MAX(ID) FROM HoqueiPortugues.Jogador) + 1;
        INSERT INTO HoqueiPortugues.Jogador (ID, Nome, Idade, Posicao, Nacionalidade, Num_camisola, Clube_ID, advertencias, cartoes_azuis, cartoes_vermelhos)
		VALUES (@Jogador_ID, @Nome, @Idade, @Posicao, @Nacionalidade, @Num_camisola, @Clube_ID, 0, 0, 0);
    --Se for um jogador de campo
        IF @Posicao = 'Jogador de Campo'
        BEGIN
        INSERT INTO HoqueiPortugues.Jogador_Campo(Jogador_ID, Golos_marcados, Assists, Penaltis_marcados, Livres_diretos_marcados) 
        VALUES (@Jogador_ID, 0, 0 , 0 , 0);
        END 
    -- Se for um guarda-redes
        IF @Posicao = 'Guarda-Redes'
        BEGIN
            INSERT INTO HoqueiPortugues.Jogador_GuardaRedes(Jogador_ID, Golos_sofridos, Penaltis_defendidos, Livres_diretos_defendidos) 
            VALUES (@Jogador_ID, 0, 0 , 0);
        END
    END
    
END;
GO

/*
CONTRATAR UM JOGADOR A OUTRO CLUBE
*/

--Exclui o procedimento se ele já existir

CREATE PROCEDURE HoqueiPortugues.contratarJogadorClube 
    @Jogador_ID AS int , @Nome AS varchar(50), @NumeroCamisola int, @Clube_Antigo AS int, @Clube_Novo AS int
AS
BEGIN
    --Verifica se o numero da camisola já não está ocupado
    IF EXISTS (SELECT * FROM HoqueiPortugues.Jogador WHERE Num_camisola = @NumeroCamisola) 
        BEGIN
            RAISERROR('Numero da camisola já está ocupado', 16, 1);
            RETURN;
        END
    ELSE 
    BEGIN
        UPDATE HoqueiPortugues.Jogador SET Clube_ID = @Clube_Novo, Num_camisola=@NumeroCamisola WHERE ID = @Jogador_ID AND Clube_ID = @Clube_Antigo;
    END 
END;
GO

/*
JOGADOR SAI DO CLUBE PASSANDO A ESTAR SEM CLUBE
*/

--Exclui o procedimento se ele já existir

CREATE PROCEDURE HoqueiPortugues.jogadorSemClube 
    @Jogador_ID AS int , @Clube_ID AS int
AS
BEGIN
    --Verifica se o clube ficaria sem jogadores suficientes (8)
    IF (SELECT COUNT(*) FROM HoqueiPortugues.Jogador WHERE Clube_ID = @Clube_ID) = 8
        BEGIN
            RAISERROR('O clube não pode ficar só com 8 jogadores', 16, 1);
            RETURN;
        END
    ELSE
        BEGIN
            UPDATE HoqueiPortugues.Jogador SET Clube_ID = NULL, Num_camisola = NULL WHERE ID = @Jogador_ID AND Clube_ID = @Clube_ID;
        END
END;
GO

/*
CONTRATAR UM JOGADOR QUE NÃO TENHA CLUBE
*/

--Exclui o procedimento se ele já existir

CREATE PROCEDURE HoqueiPortugues.contratarJogadorSemClube 
    @Jogador_ID AS int , @Clube_Novo AS int, @NumeroCamisola int
AS
BEGIN
    IF EXISTS (SELECT * FROM HoqueiPortugues.Jogador WHERE Num_camisola = @NumeroCamisola) 
        BEGIN
            RAISERROR('Numero da camisola já está ocupado', 16, 1);
            RETURN;
        END
    ELSE 
        BEGIN
            UPDATE HoqueiPortugues.Jogador SET Clube_ID = @Clube_Novo, Num_camisola=@NumeroCamisola WHERE ID = @Jogador_ID AND Clube_ID IS NULL;
        END   
END;
GO

/*
CONTRATAR UM TREINADOR QUE NÃO ESTEJA NA BASE DE DADOS (ESTRANGEIRO)
*/

--Exclui o procedimento se ele já existir

CREATE PROCEDURE HoqueiPortugues.contratarTreinador 
    @Nome AS varchar(50), @Idade AS int, @Tipo_treinador AS varchar(50), @Nacionalidade AS varchar(50), @Clube_ID AS int
AS
BEGIN

    DECLARE @Treinador_ID int;

    SET @Treinador_ID = (SELECT MAX(ID) FROM HoqueiPortugues.Treinador) + 1;

    INSERT INTO HoqueiPortugues.Treinador (ID, Nome, Idade, Tipo_treinador, Nacionalidade, Clube_ID)
    VALUES (@Treinador_ID, @Nome, @Idade, @Tipo_treinador, @Nacionalidade, @Clube_ID);

END
GO

/*
CONTRATAR UM TREINADOR A OUTRO CLUBE
*/

--Exclui o procedimento se ele já existir

CREATE PROCEDURE HoqueiPortugues.contratarTreinadorClube 
    @Treinador_ID AS int , @Nome AS varchar(50), @Clube_Antigo AS int, @Clube_Novo AS int
AS
BEGIN
    
    UPDATE HoqueiPortugues.Treinador SET Clube_ID = @Clube_Novo WHERE ID = @Treinador_ID AND Clube_ID = @Clube_Antigo;
      
END;
GO

/*
TREINADOR SAI DO CLUBE PASSANDO A FICAR SEM CLUBE
*/

--Exclui o procedimento se ele já existir

CREATE PROCEDURE HoqueiPortugues.treinadorSemClube 
    @Treinador_ID AS int , @Clube_ID AS int
AS
BEGIN

    UPDATE HoqueiPortugues.Treinador SET Clube_ID = NULL WHERE ID = @Treinador_ID AND Clube_ID = @Clube_ID;
      
END;
GO

/*
CONTRATAR UM JOGADOR QUE NÃO TENHA CLUBE
*/

--Exclui o procedimento se ele já existir

CREATE PROCEDURE HoqueiPortugues.contratarTreinadorSemClube 
    @Treinador_ID AS int , @Clube_Novo AS int
AS
BEGIN
    
    UPDATE HoqueiPortugues.Treinador SET Clube_ID = @Clube_Novo WHERE ID = @Treinador_ID AND Clube_ID IS NULL;
      
END;
GO


/*
ADICIONAR ESPECIALISTA TÉCNICO
*/

--Exclui o procedimento se ele já existir

CREATE PROCEDURE HoqueiPortugues.adicionarEspecialistaTecnico 
    @Nome varchar(50) , 
    @idade int,
    @especialidade varchar(50), 
    @nacionalidade varchar(50),
    @Clube_ID AS int
AS
BEGIN
    
    -- Insere o especialista técnico
    DECLARE @EspecialistaTecnico_ID int;
    SET @EspecialistaTecnico_ID = (SELECT MAX(ID) FROM HoqueiPortugues.Especialista_Tecnico) + 1;

    INSERT INTO HoqueiPortugues.Especialista_Tecnico (ID, Nome, idade, especialidade, nacionalidade, Clube_ID)
    VALUES (@EspecialistaTecnico_ID, @Nome ,@idade, @especialidade, @nacionalidade, @Clube_ID);
END
GO

/*
REMOVER ESPECIALISTA TÉCNICO
*/

--Exclui o procedimento se ele já existir

CREATE PROCEDURE HoqueiPortugues.removerEspecialistaTecnico 
    @Especialista_ID AS int , 
    @Clube_ID AS int
AS
BEGIN

    -- Remove o especialista técnico
    DELETE FROM HoqueiPortugues.Especialista_Tecnico WHERE ID = @Especialista_ID;
END
GO

/*
SIMULAR JOGO
*/

--Exclui o procedimento se ele já existir

CREATE PROCEDURE HoqueiPortugues.simularJogo 
    @Jogo_ID AS int , @Resultado_F AS int, @Resultado_C AS int
AS
BEGIN
    DECLARE @Plantel_F_ID int, @Plantel_C_ID int;

    SELECT TOP 2 @Plantel_C_ID = ID, @Plantel_F_ID = ID + 1
    FROM HoqueiPortugues.Plantel
    ORDER BY ID DESC;

    UPDATE HoqueiPortugues.Jogo 
    SET Resultado_F = @Resultado_F, 
    Resultado_C = @Resultado_C,
    Plantel_F_ID = @Plantel_F_ID,
    Plantel_C_ID = @Plantel_C_ID, 
    JogoRealizado = 1 
    WHERE ID = @Jogo_ID;

    DECLARE @JogadoresF  TABLE (Jogador_ID int);
    DECLARE @JogadoresC TABLE (Jogador_ID int);

    INSERT INTO @JogadoresF
    SELECT Jogador_ID FROM HoqueiPortugues.Plantel_Jogadores WHERE Plantel_ID = @Plantel_F_ID;

    INSERT INTO @JogadoresC
    SELECT Jogador_ID FROM HoqueiPortugues.Plantel_Jogadores WHERE Plantel_ID = @Plantel_C_ID;

    -- Atualizar estatisticas dos jogadores
    -- Cada jogador tem uma chance de 10% de receber uma advertencia, 5% de receber um cartao azul e 1% de receber um cartao vermelho
    -- A distribuição de golos é feita de forma aleatória, sendo que os golos têm de ser totalmente distribuidos pelos jogadores de campo
    -- Assume-se que o numero de golos não exceda o resultado da equipa
    -- Assume-se que o numero de golos sofridos não exceda o resultado da equipa adversária
    DECLARE @Jogador_Id int;
    DECLARE @Assistant_Id int;
    DECLARE @GolosMarcadosF int = @Resultado_F -- Numero de golos que a equipa de fora marcou
    DECLARE @GolosSofridosF int = @Resultado_C -- Numero de golos que a equipa da casa marcou
    DECLARE @AssistsF int = 0;
    DECLARE @AssistsC int = 0;
    DECLARE @Livres_Diretos_DefendidosF int;
    DECLARE @Penaltis_DefendidosF int;
    DECLARE @Livres_Diretos_DefendidosC int;
    DECLARE @Penaltis_DefendidosC int;
    DECLARE @CounterF int = 0;
    DECLARE @CounterC int = 0;
    DECLARE @NumberOfPlayersF int;
    DECLARE @NumberOfPlayersC int;


    -- Distribuir as advertencias, cartoes azuis e cartoes vermelhos pelos jogadores da equipa de fora
    WHILE EXISTS (SELECT * FROM @JogadoresF)
    BEGIN
        SELECT TOP 1 @Jogador_Id = Jogador_ID FROM @JogadoresF ORDER BY NEWID();

        UPDATE HoqueiPortugues.Jogador 
        SET advertencias = CASE WHEN RAND() < 0.4 THEN advertencias + CAST(ROUND((4 * RAND() + 1), 0) AS INT) ELSE advertencias END,
            cartoes_azuis = CASE WHEN RAND() < 0.15 THEN cartoes_azuis + 1 ELSE cartoes_azuis END,
            cartoes_vermelhos = CASE WHEN RAND() < 0.05 THEN cartoes_vermelhos + 1 ELSE cartoes_vermelhos END
        WHERE ID = @Jogador_Id;

        IF EXISTS (SELECT 1 FROM HoqueiPortugues.Jogador_GuardaRedes WHERE Jogador_ID = @Jogador_Id)
        BEGIN
            
            SET @NumberOfPlayersF = (SELECT COUNT(*) FROM @JogadoresF);
            
            IF @CounterF = 0
            BEGIN
                UPDATE HoqueiPortugues.Jogador_GuardaRedes
                SET Golos_sofridos = Golos_sofridos + @Resultado_C,
                Livres_Diretos_Defendidos = Livres_Diretos_Defendidos + CAST(ROUND((4 * RAND() + 1), 0) AS INT),
                Penaltis_Defendidos = Penaltis_Defendidos + CAST(ROUND((4 * RAND() + 1), 0) AS INT)
                WHERE Jogador_ID = @Jogador_Id;
            END 


            IF @NumberOfPlayersF = 1
            BEGIN
                DELETE FROM @JogadoresF WHERE Jogador_ID = @Jogador_Id;            
            END
            SET @CounterF = @CounterF + 1;
        END
        ELSE
        BEGIN
            -- Distribuir os golos pelos jogadores de campo
            IF @GolosMarcadosF > 0
            BEGIN

                SET @Livres_Diretos_DefendidosC = CASE WHEN RAND() < 0.80 THEN 1 ELSE 0 END;
                SET @Penaltis_DefendidosC = CASE WHEN @Livres_Diretos_DefendidosC = 0 AND RAND() < 0.80 THEN 1 ELSE 0 END;

                UPDATE HoqueiPortugues.Jogador_Campo
                SET Golos_marcados = Golos_marcados + 1,
                    Livres_diretos_marcados = CASE WHEN @Livres_Diretos_DefendidosC = 0 AND @Penaltis_DefendidosC = 0 THEN Livres_diretos_marcados + 1 ELSE Livres_diretos_marcados END,
                    Penaltis_marcados = CASE WHEN @Penaltis_DefendidosC = 0 AND @Livres_Diretos_DefendidosC = 0 THEN Penaltis_marcados + 1 ELSE Penaltis_marcados END
                WHERE Jogador_ID = @Jogador_Id;

                SET @GolosMarcadosF = @GolosMarcadosF - 1;

                IF @AssistsF < @Resultado_F
                BEGIN
                    SELECT TOP 1 @Assistant_Id = Jogador_ID FROM @JogadoresF ORDER BY NEWID();

                    UPDATE HoqueiPortugues.Jogador_Campo
                    SET Assists = Assists + 1
                    WHERE Jogador_ID = @Assistant_Id;
                    SET @AssistsF = @AssistsF + 1;
                END 
            END
            ELSE
            BEGIN
                DELETE FROM @JogadoresF WHERE Jogador_ID = @Jogador_Id;
            END
        END
    END

    -- Distribuir as advertencias, cartoes azuis e cartoes vermelhos pelos jogadores da equipa da casa
    WHILE EXISTS (SELECT * FROM @JogadoresC)
    BEGIN
        SELECT TOP 1 @Jogador_Id = Jogador_ID FROM @JogadoresC ORDER BY NEWID();

        UPDATE HoqueiPortugues.Jogador 
        SET advertencias = CASE WHEN RAND() < 0.4 THEN advertencias + CAST(ROUND((4 * RAND() + 1), 0) AS INT) ELSE advertencias END,
            cartoes_azuis = CASE WHEN RAND() < 0.15 THEN cartoes_azuis + 1 ELSE cartoes_azuis END,
            cartoes_vermelhos = CASE WHEN RAND() < 0.05 THEN cartoes_vermelhos + 1 ELSE cartoes_vermelhos END
        WHERE ID = @Jogador_Id;

        IF EXISTS (SELECT 1 FROM HoqueiPortugues.Jogador_GuardaRedes WHERE Jogador_ID = @Jogador_Id)
        BEGIN
            SET @NumberOfPlayersC = (SELECT COUNT(*) FROM @JogadoresC);

            IF @CounterC = 0
            BEGIN
                UPDATE HoqueiPortugues.Jogador_GuardaRedes
                SET Golos_sofridos = Golos_sofridos + @Resultado_F,
                    Livres_Diretos_Defendidos = Livres_Diretos_Defendidos + CAST(ROUND((4 * RAND() + 1), 0) AS INT),
                    Penaltis_Defendidos = Penaltis_Defendidos + CAST(ROUND((4 * RAND() + 1), 0) AS INT)
                WHERE Jogador_ID = @Jogador_Id;
            END
            --Remover o jogador da lista de jogadores
            IF @NumberOfPlayersC = 1
            BEGIN
                DELETE FROM @JogadoresC WHERE Jogador_ID = @Jogador_Id;
            END

            SET @CounterC = @CounterC + 1;
        END
        ELSE
        BEGIN
            -- Distribuir os golos pelos jogadores de campo

            IF @GolosSofridosF > 0
            BEGIN

                SET @Livres_Diretos_DefendidosF = CASE WHEN RAND() < 0.80 THEN 1 ELSE 0 END;
                SET @Penaltis_DefendidosF = CASE WHEN @Livres_Diretos_DefendidosF = 0 AND RAND() < 0.80 THEN 1 ELSE 0 END;

                UPDATE HoqueiPortugues.Jogador_Campo
                SET Golos_marcados = Golos_marcados + 1,
                    Livres_diretos_marcados = CASE WHEN @Livres_Diretos_DefendidosF = 0 AND @Penaltis_DefendidosF = 0 THEN Livres_diretos_marcados + 1 ELSE Livres_diretos_marcados END,
                    Penaltis_marcados = CASE WHEN @Penaltis_DefendidosF = 0 AND @Livres_Diretos_DefendidosF = 0 THEN Penaltis_marcados + 1 ELSE Penaltis_marcados END
                WHERE Jogador_ID = @Jogador_Id;

                IF @AssistsC < @Resultado_C
                BEGIN
                   SELECT TOP 1 @Assistant_Id = Jogador_ID FROM @JogadoresC ORDER BY NEWID();

                   UPDATE HoqueiPortugues.Jogador_Campo
                   SET Assists = Assists + 1
                   WHERE Jogador_ID = @Jogador_Id;  

                   SET @AssistsC = @AssistsC + 1;
                END

                SET @GolosSofridosF = @GolosSofridosF - 1;
            END
            ELSE
            BEGIN
                DELETE FROM @JogadoresC WHERE Jogador_ID = @Jogador_Id;
            END
        END
    END
END;
GO


/*
PESQUISAR JOGADORES DE CAMPO E ORDENÁ-LOS POR DIFERENTES ESTATISTICAS
*/

--Exclui o procedimento se ele já existir

CREATE PROCEDURE HoqueiPortugues.PesquisaJogadoresCampo
    @nome varchar(50),
    @orderby varchar(50) = NULL,
    @nacionalidade varchar(50) = NULL,
    @nome_clube varchar(50) = NULL
AS
BEGIN
    SELECT J.Nome, C.Nome as Clube_Nome, J.Nacionalidade, JC.Golos_marcados, JC.Assists, J.advertencias, J.cartoes_azuis, J.cartoes_vermelhos, JC.Penaltis_marcados, JC.Livres_diretos_marcados
    FROM HoqueiPortugues.Jogador J
    INNER JOIN HoqueiPortugues.Jogador_Campo JC ON J.ID = JC.Jogador_ID
    INNER JOIN HoqueiPortugues.Clube C ON J.Clube_ID = C.ID
    WHERE J.Nome LIKE '%' + @Nome + '%' AND
        (@nacionalidade IS NULL OR J.Nacionalidade = @nacionalidade) AND 
        (@nome_clube IS NULL OR C.Nome = @nome_clube)
    ORDER BY 
        CASE 
            WHEN @orderby = 'Golos Marcados' THEN JC.Golos_marcados
            WHEN @orderby = 'Assistências' THEN JC.Assists
            WHEN @orderby = 'Penaltis Marcados' THEN JC.Penaltis_marcados
            WHEN @orderby = 'Livres Diretos Marcados' THEN JC.Livres_diretos_marcados
            WHEN @orderby = 'Advertências' THEN J.advertencias
            WHEN @orderby = 'Cartões Azuis' THEN J.cartoes_azuis
            WHEN @orderby = 'Cartões Vermelhos' THEN J.cartoes_vermelhos
        ELSE J.ID 
    END DESC
END;
GO


/*
PESQUISAR GUARDA REDES E ORDENÁ-LOS POR DIFERENTES ESTATISTICAS
*/

--Exclui o procedimento se ele já existir

CREATE PROCEDURE HoqueiPortugues.PesquisaGuardaRedes
    @nome varchar(50),
    @orderby varchar(50) = NULL,
    @nacionalidade varchar(50) = NULL,
    @nome_clube varchar(50) = NULL
AS
BEGIN
    SELECT J.Nome, C.Nome as Clube_Nome, J.Nacionalidade, JG.Golos_sofridos, J.advertencias ,J.cartoes_azuis, J.cartoes_vermelhos, JG.Penaltis_defendidos, JG.Livres_diretos_defendidos
    FROM HoqueiPortugues.Jogador J
    INNER JOIN HoqueiPortugues.Jogador_GuardaRedes JG ON J.ID = JG.Jogador_ID
    INNER JOIN HoqueiPortugues.Clube C ON J.Clube_ID = C.ID
    WHERE J.Nome LIKE '%' + @Nome + '%' AND
        (@nacionalidade IS NULL OR J.Nacionalidade = @nacionalidade) AND 
        (@nome_clube IS NULL OR C.Nome = @nome_clube)
    ORDER BY
        CASE 
            WHEN @orderby = 'Golos Sofridos' THEN JG.Golos_sofridos
            WHEN @orderby = 'Penaltis Defendidos' THEN JG.Penaltis_defendidos
            WHEN @orderby = 'Livres Diretos Defendidos' THEN JG.Livres_diretos_defendidos
            WHEN @orderby = 'Advertências' THEN J.advertencias
            WHEN @orderby = 'Cartões Azuis' THEN J.cartoes_azuis
            WHEN @orderby = 'Cartões Vermelhos' THEN J.cartoes_vermelhos
        ELSE J.ID
    END DESC;
END
GO


/*
ELIMINAR O ÚLTTIMO PLANTEL CRIADO
*/


--Exclui o procedimento se ele já existir

CREATE PROCEDURE HoqueiPortugues.STeliminarUltimoPlantel 
AS
BEGIN 
    DELETE TOP (1) FROM HoqueiPortugues.Plantel WHERE ID = (SELECT MAX(ID) FROM HoqueiPortugues.Plantel);
END;
GO


/*
ELIMINAR OS DOIS ÚLTIMOS PLANTEIS CRIADOS
*/

--Exclui o procedimento se ele já existir

CREATE PROCEDURE HoqueiPortugues.STeliminarUltimosPlanteis
AS
BEGIN 
    DELETE TOP (2) FROM HoqueiPortugues.Plantel WHERE ID IN (SELECT TOP (2) ID FROM HoqueiPortugues.Plantel ORDER BY ID DESC);
END;
GO


/*
ADICIONAR ÁRBITROS A UM JOGO
*/

--Exclui o procedimento se ele já existir

CREATE PROCEDURE HoqueiPortugues.adicionarArbitros 
    @Jogo_ID AS int , @ArbitroPrincipal_ID AS int, @ArbitroAuxiliar_ID AS int
AS
BEGIN
    --Verifica se os arbitros são diferentes pessoas
    IF @ArbitroPrincipal_ID = @ArbitroAuxiliar_ID
        BEGIN
            RAISERROR('Arbitros não podem ser a mesma pessoa', 16, 1);
            RETURN;
        END

    INSERT INTO HoqueiPortugues.e_arbitrado (Jogo_ID, Arbitro_ID)
    VALUES (@Jogo_ID, @ArbitroPrincipal_ID),
           (@Jogo_ID, @ArbitroAuxiliar_ID);

END;
GO


/*
ELIMINAR OS ÁRBITROS DO ÚLTIMO JOGO
*/

--Exclui o procedimento se ele já existir

CREATE PROCEDURE HoqueiPortugues.eliminarArbitros 
    @Jogo_ID AS int
AS 
BEGIN
    DELETE TOP (2) FROM HoqueiPortugues.e_arbitrado WHERE Jogo_ID = @Jogo_ID;
END
GO 

/*
Dar update ao resultado de um jogo que já tenha acontecido
*/

--Exclui o procedimento se ele já existir

CREATE PROCEDURE HoqueiPortugues.updateResultado 
    @Jogo_ID AS int , @Resultado_F AS int, @Resultado_C AS int
AS
BEGIN
    --Verifica se o jogo já aconteceu
    IF NOT EXISTS (SELECT * FROM HoqueiPortugues.Jogo WHERE ID = @Jogo_ID AND JogoRealizado = 1)
        BEGIN
            RAISERROR('Jogo ainda não aconteceu', 16, 1);
            RETURN;
        END

    UPDATE HoqueiPortugues.Jogo 
    SET Resultado_F = @Resultado_F, 
    Resultado_C = @Resultado_C
    WHERE ID = @Jogo_ID;
END;
GO