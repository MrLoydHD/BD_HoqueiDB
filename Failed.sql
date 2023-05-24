/*
Gerar a próxima jornada
*/

--use p4g7;

-- This file is a SQL script that creates the schema for the HoqueiPortugues database.
-- It is meant to be run on Microsoft SQL Server Management Studio.

-- IF OBJECT_ID('HoqueiPortugues.gerarProximaJornada', 'P') IS NOT NULL
--     DROP PROCEDURE HoqueiPortugues.gerarProximaJornada;
-- GO

-- CREATE PROCEDURE HoqueiPortugues.gerarProximaJornada AS
-- BEGIN

--     --Determinar a próxima jornada
--     DECLARE @ProximaJornada int;
--     SELECT @proximaJornada = ISNULL(MAX(Jornada), 0) + 1 FROM HoqueiPortugues.Jogo;
-- 	DECLARE @IDJogo int;

--     -- Gerar todos os confrontos possiveis
--     CREATE TABLE #confrontosPossiveis (
--         Clube_F_ID int,
--         Clube_C_ID int
--     );

--     IF @proximaJornada = 1 --Começamos na terceira jornada por razões de simplicidade e testagem
--     BEGIN
--         INSERT INTO #confrontosPossiveis
--         --Retira os jogos que já foram realizados
--         SELECT c1.ID, c2.ID
--         FROM HoqueiPortugues.Clube c1, HoqueiPortugues.Clube c2
--         WHERE c1.ID <> c2.ID
--     END
--     ELSE
--     BEGIN
--         -- Inserir apenas os confrontos que ainda não aconteceram
--         INSERT INTO #confrontosPossiveis
--         SELECT c1.ID, c2.ID
--         FROM HoqueiPortugues.Clube c1, HoqueiPortugues.Clube c2
--         WHERE c1.ID <> c2.ID
--         AND NOT EXISTS (
--             SELECT 1 -- Ver se já existe um jogo entre estes dois clubes, apenas retorna 1 para cada linha correspondente
--             FROM HoqueiPortugues.Jogo
--             WHERE (Clube_C_ID = c1.ID AND Clube_F_ID = c2.ID) OR (Clube_C_ID = c2.ID AND Clube_F_ID = c1.ID)
--         );
--     END 
-- 		DECLARE @counter int = 0; -- Contador para limitar o número de jogos
--         -- Escolher um conjunto de confrontos possiveis para a próxima jornada
--         WHILE (SELECT COUNT(*) FROM #confrontosPossiveis) > 0 AND @counter < 7
--         BEGIN

-- 		    IF (SELECT COUNT(DISTINCT Clube_C_ID) FROM HoqueiPortugues.Jogo WHERE Jornada = @proximaJornada) = (SELECT COUNT(ID) FROM HoqueiPortugues.Clube)
-- 			BEGIN
-- 				-- Se todos os clubes já jogaram, avançar para a próxima jornada
-- 				SET @proximaJornada = @proximaJornada + 1;
-- 			END

--             DECLARE @Clube_F_ID int, @Clube_C_ID int;

-- 			--ID do jogo criado
-- 			SET @IDJogo = (SELECT ISNULL(MAX(ID), 0) FROM HoqueiPortugues.Jogo) + 1;

--             SELECT TOP 1 @Clube_F_ID = Clube_F_ID, @Clube_C_ID = Clube_C_ID FROM #confrontosPossiveis 
--             WHERE Clube_F_ID NOT IN (SELECT Clube_F_ID FROM HoqueiPortugues.Jogo WHERE Jornada = @proximaJornada) 
-- 				AND Clube_C_ID NOT IN (SELECT Clube_C_ID FROM HoqueiPortugues.Jogo WHERE Jornada = @proximaJornada)
-- 				AND Clube_F_ID NOT IN (SELECT Clube_C_ID FROM HoqueiPortugues.Jogo WHERE Jornada = @proximaJornada)
-- 				AND Clube_C_ID NOT IN (SELECT Clube_F_ID FROM HoqueiPortugues.Jogo WHERE Jornada = @proximaJornada)
-- 			ORDER BY NEWID();

--             -- Selecionar o pavilhão onde o jogo vai ser realizado
--             DECLARE @Pavilhao_ID int;
--             SELECT @Pavilhao_ID = ID FROM HoqueiPortugues.Pavilhao WHERE Clube_ID = @Clube_C_ID; 
            
--             --Inserir o jogo na tabela
--             INSERT INTO HoqueiPortugues.Jogo (ID ,Jornada, Resultado_F, Resultado_C, Data_hora, Clube_F_ID, Clube_C_ID, Pavilhao_ID, Plantel_F_ID, Plantel_C_ID, JogoRealizado)
--             VALUES (@IDJogo, @proximaJornada, NULL, NULL, GETDATE(), @Clube_F_ID, @Clube_C_ID, @Pavilhao_ID, NULL, NULL, 0);

--             --Remover este confronto da lista de confrontos possiveis
--             DELETE FROM #confrontosPossiveis WHERE Clube_F_ID = @Clube_F_ID AND Clube_C_ID = @Clube_C_ID OR Clube_F_ID = @Clube_C_ID AND Clube_C_ID = @Clube_F_ID;
            
-- 			SET @counter = @counter + 1; -- Incrementar o contador
--         END 

--         DROP TABLE #confrontosPossiveis;
-- END;
-- GO

-- EXEC HoqueiPortugues.gerarProximaJornada;
-- GO

-- SELECT * FROM HoqueiPortugues.Jogo



/*
Create Calendar
*/

-- IF OBJECT_ID('HoqueiPortugues.generateSchedule', 'P') IS NOT NULL
--     DROP PROCEDURE HoqueiPortugues.generateSchedule;
-- GO

-- CREATE PROCEDURE HoqueiPortugues.generateSchedule AS 
-- BEGIN
--     DECLARE @TeamCount INT = 14;  -- number of teams
--     DECLARE @TotalGames INT = @TeamCount * (@TeamCount - 1);  -- total rounds (26 in this case)
--     DECLARE @GameID INT = 15;  -- starting game ID from 15 as first 14 games are already inserted
--     DECLARE @Round INT = 3; -- starting round from 3 as first 2 rounds are already inserted
--     Declare @GamesPerRound INT = 7; -- number of games per round
--     DECLARE @TotalRounds INT = 26; -- total rounds (26 in this case)
--     DECLARE @GameDate DATETIME = '2022-09-15 21:00:00'; -- starting date and time for games from third round
--     DECLARE @Resultado_F INT = NULL; -- example value for Resultado_F
--     DECLARE @Resultado_C INT = NULL; -- example value for Resultado_C
--     DECLARE @Pavilhao_ID INT; -- example value for Pavilhao_ID
--     DECLARE @JogoRealizado BIT = 0; -- example value for JogoRealizado

--     WHILE @Round <= @TotalRounds
--     BEGIN
--         DECLARE @Clube_C_ID INT = 1; -- starting Clube_C_ID from 1
--         WHILE @Clube_C_ID <= @TeamCount
--         BEGIN
            
        
--         END
    
    
--     END
-- END;
-- GO
-- EXEC HoqueiPortugues.generateSchedule;
-- GO

-- SELECT * FROM HoqueiPortugues.Jogo;

--IF OBJECT_ID('HoqueiPortugues.generateSchedule', 'P') IS NOT NULL
--     DROP PROCEDURE HoqueiPortugues.generateSchedule;
--GO

--CREATE PROCEDURE HoqueiPortugues.generateSchedule AS 
--BEGIN
--    DECLARE @Temp TABLE(
--        TeamID INT,
--        TeamName VARCHAR(100),
--        MatchWeek INT
--    )

--    DECLARE @maxID INT;
--    SELECT @maxID = MAX(ID) FROM HoqueiPortugues.Jogo;

--    -- Get all team information from Clube table
--    INSERT INTO @Temp(TeamID, TeamName) 
--    SELECT ID, Nome FROM HoqueiPortugues.Clube;

--    -- Calculate the number of teams
--    DECLARE @TeamCount INT;
--    SELECT @TeamCount = COUNT(*) FROM @Temp;

--    WITH Teams AS (
--        SELECT TeamName,
--               TeamID,
--               TeamNum = ROW_NUMBER() OVER (ORDER BY TeamName)
--        FROM @Temp
--    ), Rounds AS (
--        SELECT RoundNum = ROW_NUMBER() OVER (ORDER BY (SELECT NULL))
--        FROM Teams
--    ), Matches AS (
--        SELECT HomeTeamID = T1.TeamID,
--               AwayTeamID = T2.TeamID,
--               MatchNum = ROW_NUMBER() OVER (ORDER BY (SELECT NULL)),
--               RoundNum
--        FROM Teams T1
--        CROSS JOIN Teams T2
--        INNER JOIN Rounds R ON R.RoundNum = ((T1.TeamNum + T2.TeamNum - 2) % (@TeamCount - 1)) + 1
--        WHERE T1.TeamID < T2.TeamID
--    )
--    INSERT INTO HoqueiPortugues.Jogo(ID, Jornada, Clube_F_ID, Clube_C_ID, Data_hora, Pavilhao_ID, JogoRealizado)
--    SELECT @MaxID + M.MatchNum,
--		   M.RoundNum + 2,  -- Add 2 to start from Jornada 3
--           M.HomeTeamID,
--           M.AwayTeamID,
--           DATEADD(WEEK, M.RoundNum + 2 - 1, '2023-09-01 21:00:00'), -- Adjust the start date accordingly
--           (SELECT TOP 1 ID FROM HoqueiPortugues.Pavilhao WHERE Clube_ID = M.HomeTeamID),
--           0
--    FROM Matches M
--    ORDER BY M.RoundNum, M.MatchNum
--END
--GO

--EXEC HoqueiPortugues.generateSchedule

--SELECT * FROM HoqueiPortugues.Jogo


-- IF OBJECT_ID('HoqueiPortugues.generateSchedule', 'P') IS NOT NULL
--      DROP PROCEDURE HoqueiPortugues.generateSchedule;
-- GO

-- CREATE PROCEDURE generateSchedule AS 
-- BEGIN
--     DECLARE @Temp TABLE(
--         TeamID INT,
--         TeamName VARCHAR(100),
--         MatchWeek INT
--     )

--     -- Get all team information from Clube table
--     INSERT INTO @Temp(TeamID, TeamName) 
--     SELECT ID, Nome FROM HoqueiPortugues.Clube;

--     WITH Teams AS (
--         SELECT TeamName,
--                TeamID,
--                TeamNum = ROW_NUMBER() OVER (ORDER BY TeamName),
--                TeamCount = COUNT(*) OVER()
--         FROM @Temp
--         GROUP  BY TeamName, TeamID
--         WITH ROLLUP
--         HAVING GROUPING(TeamName) = 0 OR COUNT(*) % 2 = 1
--     ), Jornadas AS (
--         SELECT TeamNum AS Jornada
--         FROM Teams
--         WHERE TeamNum < TeamCount
--     ), Positioned AS (
--         SELECT TeamName,
--                TeamID,
--                Jornada,
--                position,
--                TeamCount
--         FROM Teams
--         CROSS JOIN Jornadas
--         CROSS APPLY (SELECT CASE
--                              WHEN TeamNum = TeamCount THEN TeamCount
--                              ELSE 1 + ( ( TeamNum + Jornada - 1 ) % ( TeamCount - 1 ) )
--                         END) CA(position)
--     )
--     INSERT INTO HoqueiPortugues.Jogo(ID, Jornada, Clube_F_ID, Clube_C_ID, Data_hora, Pavilhao_ID, JogoRealizado)
--     SELECT ROW_NUMBER() OVER(ORDER BY (SELECT NULL)),
--            V.Jornada,
--            V.HomeTeamID,
--            V.AwayTeamID,
--            DATEADD(WEEK, V.Jornada - 1, '2023-09-01 21:00:00'), -- adjust this start date as necessary
--            (SELECT TOP 1 ID FROM HoqueiPortugues.Pavilhao WHERE Clube_ID = V.HomeTeamID),
--            0
--     FROM Positioned P1
--     JOIN Positioned P2 ON P1.Jornada = P2.Jornada AND P1.position = 1 + P2.TeamCount - P2.position AND
--                          (P2.Jornada %2 = 0 AND P1.position < P2.position OR P2.Jornada %2 = 1 AND P1.position > P2.position)
--     CROSS APPLY (VALUES(P1.TeamID, P2.TeamID, P1.Jornada), (P2.TeamID, P1.TeamID, P1.Jornada + P1.TeamCount - 1)) V(HomeTeamID, AwayTeamID, Jornada)
--     WHERE V.AwayTeamID IS NOT NULL AND V.HomeTeamID IS NOT NULL
--     ORDER BY V.Jornada 
-- END
-- GO

