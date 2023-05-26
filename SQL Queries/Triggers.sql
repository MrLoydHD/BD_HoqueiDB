use Test_Hoquei;
go

--Cria um trigger se ele não existir
IF OBJECT_ID('HoqueiPortugues.trg_Jogador_Campo', 'TR') IS NOT NULL
    DROP TRIGGER HoqueiPortugues.trg_Jogador_Campo;
GO

CREATE TRIGGER HoqueiPortugues.eliminarJogadorPosicao
ON HoqueiPortugues.Jogador
INSTEAD OF DELETE
AS
BEGIN
	--DELETE na tabela Jogador_Campo
    DELETE FROM HoqueiPortugues.Jogador_Campo 
    WHERE Jogador_ID IN (SELECT ID FROM DELETED);

    -- DELETE na tabela Jogador_GuardaRedes
    DELETE FROM HoqueiPortugues.Jogador_GuardaRedes 
    WHERE Jogador_ID IN (SELECT ID FROM DELETED);

    -- DELETE na tabela Plantel_Jogadores
    DELETE FROM HoqueiPortugues.Plantel_Jogadores
    WHERE Jogador_ID IN (SELECT ID FROM DELETED);

	-- DELETE na tabela Jogador
    DELETE FROM HoqueiPortugues.Jogador
    WHERE ID IN (SELECT ID FROM DELETED);
END;
GO

/*
Remover treinador de um clube
*/

--Cria um trigger se ele não existir
IF OBJECT_ID('HoqueiPortugues.TeliminarTreinador', 'TR') IS NOT NULL
    DROP TRIGGER HoqueiPortugues.TeliminarTreinador;
GO

CREATE TRIGGER HoqueiPortugues.TeliminarTreinador
ON HoqueiPortugues.Treinador
INSTEAD OF DELETE
AS
BEGIN
    -- DELETE na tabela Plantel_Treinadores
    DELETE FROM HoqueiPortugues.Plantel_Treinadores 
    WHERE Treinador_ID IN (SELECT ID FROM DELETED);

    -- DELETE na tabela Treinador
    DELETE FROM HoqueiPortugues.Treinador
    WHERE ID IN (SELECT ID FROM DELETED);
END;


/*
Elininar o platenl de um clube
*/

--Cria um trigger se ele não existir
IF OBJECT_ID('HoqueiPortugues.eliminarUltimoPlantel', 'TR') IS NOT NULL
    DROP TRIGGER HoqueiPortugues.eliminarUltimoPlantel;
GO

CREATE TRIGGER HoqueiPortugues.eliminarUltimoPlantel
ON HoqueiPortugues.Plantel
INSTEAD OF DELETE
AS
BEGIN
    --UPDATE na tabela Jogo
    UPDATE HoqueiPortugues.Jogo 
    SET Plantel_F_ID = NULL, Plantel_C_ID = NULL
    WHERE Plantel_F_ID IN (SELECT ID FROM DELETED) OR Plantel_C_ID IN (SELECT ID FROM DELETED);

    --DELETE na tabela Plantel_Jogadores
    DELETE FROM HoqueiPortugues.Plantel_Jogadores 
    WHERE Plantel_ID IN (SELECT ID FROM DELETED);

    -- DELETE na tabela Plantel_Treinadores
    DELETE FROM HoqueiPortugues.Plantel_Treinadores 
    WHERE Plantel_ID IN (SELECT ID FROM DELETED);

    -- DELETE na tabela Plantel
    DELETE FROM HoqueiPortugues.Plantel
    WHERE ID IN (SELECT ID FROM DELETED);
END;

/*
Não permite inserir um arbitro que já tenha sido inserido naquela jornada
*/

--Cria um trigger se ele não existir
IF OBJECT_ID('HoqueiPortugues.verificarArbitroJornada', 'TR') IS NOT NULL
    DROP TRIGGER HoqueiPortugues.verificarArbitroJornada;
GO


CREATE TRIGGER HoqueiPortugues.verificarArbitroJornada
ON HoqueiPortugues.e_arbitrado
INSTEAD OF INSERT
AS
BEGIN 
 -- Para cada linha na tabela inserida
    BEGIN TRY
        DECLARE @Jogo_ID int, @Arbitro_ID int;
        DECLARE inserted_cursor CURSOR FOR SELECT Jogo_ID, Arbitro_ID FROM inserted;
        OPEN inserted_cursor;

        FETCH NEXT FROM inserted_cursor INTO @Jogo_ID, @Arbitro_ID;
        WHILE @@FETCH_STATUS = 0
        BEGIN
            -- Determina a jornada do jogo
            DECLARE @Jornada int;
            SELECT @Jornada = Jornada FROM HoqueiPortugues.Jogo WHERE ID = @Jogo_ID;

            -- Verifica se o árbitro já arbitrou um jogo nesta jornada
            IF EXISTS (SELECT 1 
                    FROM HoqueiPortugues.e_arbitrado ea
                    JOIN HoqueiPortugues.Jogo j ON ea.Jogo_ID = j.ID
                    WHERE ea.Arbitro_ID = @Arbitro_ID AND j.Jornada = @Jornada)
            BEGIN
                RAISERROR('Um dos árbitros já arbitrou um jogo nesta jornada', 16, 1);
                RETURN;
            END

            -- Se o árbitro ainda não arbitraram um jogo nesta jornada, insere o árbitro
            INSERT INTO HoqueiPortugues.e_arbitrado (Jogo_ID, Arbitro_ID) VALUES (@Jogo_ID, @Arbitro_ID);

            FETCH NEXT FROM inserted_cursor INTO @Jogo_ID, @Arbitro_ID;
        END
    END TRY
    BEGIN CATCH
        IF CURSOR_STATUS('local', 'inserted_cursor') >= 0
        BEGIN
            CLOSE inserted_cursor;
            DEALLOCATE inserted_cursor;
        END;
        -- Re-lança o erro para que possa ser tratado por outro bloco CATCH ou retornado ao cliente
        THROW 50000, 'Erro ao inserir árbitro', 1;
    END CATCH
END;
GO


/*
Verifica se o plantel de jogadores foi corretamente inserido no plantel
*/

--Cria um trigger se ele não existir
IF OBJECT_ID('HoqueiPortugues.verificarPlantelJogadores', 'TR') IS NOT NULL
    DROP TRIGGER HoqueiPortugues.verificarPlantelJogadores;
GO

CREATE TRIGGER HoqueiPortugues.verificarPlantelJogadores
ON HoqueiPortugues.Plantel_Jogadores
INSTEAD OF INSERT
AS
BEGIN
    -- Verifica se os jogadores já estão inseridos no plantel
    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE EXISTS (
            SELECT 1
            FROM HoqueiPortugues.Plantel_Jogadores pj
            WHERE pj.Plantel_ID = i.Plantel_ID AND pj.Jogador_ID = i.Jogador_ID
        )
    )
    BEGIN
        RAISERROR ('Um jogador não pode ser inserido mais que uma vez no plantel', 16, 1);
        RETURN;
    END;

    -- Insere os jogadores no plantel
    INSERT INTO HoqueiPortugues.Plantel_Jogadores (Plantel_ID, Jogador_ID)
    SELECT Plantel_ID, Jogador_ID
    FROM inserted;
END;
GO

/*
Verificar se o plantel de treinador foi corretamente inserido no plantel
*/

--Cria um trigger se ele não existir
IF OBJECT_ID('HoqueiPortugues.verificarPlantelTreinadores', 'TR') IS NOT NULL
    DROP TRIGGER HoqueiPortugues.verificarPlantelTreinadores;
GO

CREATE TRIGGER HoqueiPortugues.verificarPlantelTreinadores
ON HoqueiPortugues.Plantel_Treinadores
INSTEAD OF INSERT
AS
BEGIN
    -- Verifica se os treinadores já estão inseridos no plantel
    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE EXISTS (
            SELECT 1
            FROM HoqueiPortugues.Plantel_Treinadores pt
            WHERE pt.Plantel_ID = i.Plantel_ID AND pt.Treinador_ID = i.Treinador_ID
        )
    )
    BEGIN
        RAISERROR ('Um treinador não pode ser inserido mais que uma vez no plantel', 16, 1);
        RETURN;
    END;

    -- Insere os treinadores no plantel
    INSERT INTO HoqueiPortugues.Plantel_Treinadores (Plantel_ID, Treinador_ID)
    SELECT Plantel_ID, Treinador_ID
    FROM inserted;
END;









