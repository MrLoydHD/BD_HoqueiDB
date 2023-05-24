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
Pesquisa de jogadores de campo por nome
*/
