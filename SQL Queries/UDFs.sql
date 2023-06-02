use Test_Hoquei;
go 

/*
UFDF que retorna os jogadores que não têm clube
*/

IF OBJECT_ID('HoqueiPortugues.ufnJogadoresSemClube') IS NOT NULL
    DROP FUNCTION HoqueiPortugues.ufnJogadoresSemClube;
GO

CREATE FUNCTION HoqueiPortugues.ufnJogadoresSemClube()
RETURNS TABLE
AS
RETURN 
(
    SELECT * FROM HoqueiPortugues.Jogador WHERE Clube_ID IS NULL
);
GO

/*
UFDF que retorna os treinadores que não têm clube
*/

IF OBJECT_ID('HoqueiPortugues.ufnTreinadoresSemClube') IS NOT NULL
    DROP FUNCTION HoqueiPortugues.ufnTreinadoresSemClube;
GO

CREATE FUNCTION HoqueiPortugues.ufnTreinadoresSemClube()
RETURNS TABLE
AS
RETURN 
(
    SELECT * FROM HoqueiPortugues.Treinador WHERE Clube_ID IS NULL
);
GO

/*
Obter os treinadores que participaram num jogo
*/

CREATE FUNCTION HoqueiPortugues.fnObterTreinadoresPorJogo(@Jogo_ID int)
RETURNS TABLE 
AS 
RETURN 
(
    SELECT Clube_C_ID AS ClubeID, Treinador.Nome AS NomeTreinador, Treinador.Tipo_treinador 
    FROM HoqueiPortugues.Jogo 
    JOIN HoqueiPortugues.Plantel ON Jogo.Plantel_C_ID = Plantel.ID 
    JOIN HoqueiPortugues.Plantel_Treinadores ON Plantel.ID = Plantel_Treinadores.Plantel_ID
    JOIN HoqueiPortugues.Treinador ON Plantel_Treinadores.Treinador_ID = Treinador.ID
    WHERE Jogo.ID = @Jogo_ID
    UNION
    SELECT Clube_F_ID AS ClubeID, Treinador.Nome AS NomeTreinador, Treinador.Tipo_treinador 
    FROM HoqueiPortugues.Jogo 
    JOIN HoqueiPortugues.Plantel ON Jogo.Plantel_F_ID = Plantel.ID 
    JOIN HoqueiPortugues.Plantel_Treinadores ON Plantel.ID = Plantel_Treinadores.Plantel_ID
    JOIN HoqueiPortugues.Treinador ON Plantel_Treinadores.Treinador_ID = Treinador.ID
    WHERE Jogo.ID = @Jogo_ID
);
GO

--SELECT * FROM HoqueiPortugues.fnObterTreinadoresPorJogo(1);

/*
Obter jogadores de um que participaram num jogo
*/

CREATE FUNCTION HoqueiPortugues.fnObterJogadoresPorJogo(@Jogo_ID int)
RETURNS TABLE 
AS 
RETURN 
(
    SELECT J.Clube_C_ID AS ClubeID, Jog.Nome AS NomeJogador, Jog.Posicao
    FROM HoqueiPortugues.Jogo J
    JOIN HoqueiPortugues.Plantel P ON J.Plantel_C_ID = P.ID 
    JOIN HoqueiPortugues.Plantel_Jogadores PJ ON P.ID = PJ.Plantel_ID
    JOIN HoqueiPortugues.Jogador Jog ON PJ.Jogador_ID = Jog.ID
    WHERE J.ID = @Jogo_ID

    UNION

    SELECT J.Clube_F_ID AS ClubeID, Jog.Nome AS NomeJogador, Jog.Posicao
    FROM HoqueiPortugues.Jogo J
    JOIN HoqueiPortugues.Plantel P ON J.Plantel_F_ID = P.ID 
    JOIN HoqueiPortugues.Plantel_Jogadores PJ ON P.ID = PJ.Plantel_ID
    JOIN HoqueiPortugues.Jogador Jog ON PJ.Jogador_ID = Jog.ID
    WHERE J.ID = @Jogo_ID
);
GO
-- SELECT * FROM HoqueiPortugues.fnObterJogadoresPorJogo(1);


/*
Consultar dados de dum jogo
*/

CREATE FUNCTION HoqueiPortugues.fnConsultarJogo(@Jogo_ID int)
RETURNS TABLE 
AS 
RETURN 
(
    SELECT DISTINCT Jogo.ID, Jogo.Jornada, Pavilhao.Nome AS NomePavilhao, 
        ClubeCasa.Nome AS NomeClubeCasa, ClubeFora.Nome AS NomeClubeFora, 
        ClubeCasa.ID AS ClubeCasaID, ClubeFora.ID AS ClubeForaID, 
        Jogo.Resultado_C, Jogo.Resultado_F, 
        Arbitro.Nome AS ArbitroNome, 
        Jogo.Data_hora
    FROM HoqueiPortugues.Jogo
    JOIN HoqueiPortugues.e_arbitrado ON Jogo.ID = HoqueiPortugues.e_arbitrado.Jogo_ID
    JOIN HoqueiPortugues.Arbitro ON e_arbitrado.Arbitro_ID = Arbitro.ID
    JOIN HoqueiPortugues.Pavilhao ON Jogo.Pavilhao_ID = Pavilhao.ID
    JOIN HoqueiPortugues.Clube AS ClubeCasa ON Jogo.Clube_C_ID = ClubeCasa.ID
    JOIN HoqueiPortugues.Clube AS ClubeFora ON Jogo.Clube_F_ID = ClubeFora.ID
    WHERE Jogo.ID = @Jogo_ID 
);
GO

-- SELECT * FROM HoqueiPortugues.fnConsultarJogo(1);

/*
Ver o calendário de jogos de uma equipa
*/

CREATE FUNCTION HoqueiPortugues.fnVerCalendarioEquipa(@Clube_ID int)
RETURNS TABLE 
AS 
RETURN 
(
    SELECT Jogo.Jornada,
        ClubeCasa.Nome AS NomeClubeCasa, ClubeFora.Nome AS NomeClubeFora, 
        Jogo.Resultado_C, Jogo.Resultado_F, 
        Pavilhao.Nome AS NomePavilhao, 
        Jogo.Data_hora
    FROM HoqueiPortugues.Jogo
    JOIN HoqueiPortugues.Pavilhao ON Jogo.Pavilhao_ID = Pavilhao.ID
    JOIN HoqueiPortugues.Clube AS ClubeCasa ON Jogo.Clube_C_ID = ClubeCasa.ID
    JOIN HoqueiPortugues.Clube AS ClubeFora ON Jogo.Clube_F_ID = ClubeFora.ID
    WHERE ClubeCasa.ID = @Clube_ID OR ClubeFora.ID = @Clube_ID
);
GO

-- SELECT * FROM HoqueiPortugues.fnVerCalendarioEquipa(1);


