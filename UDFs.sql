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

IF OBJECT_ID('HoqueiPortugues.ufnPesquisaJogadores') IS NOT NULL
    DROP FUNCTION HoqueiPortugues.ufnPesquisaJogadores;
GO

CREATE FUNCTION HoqueiPortugues.ufnPesquisaJogadoresCampo(@nome varchar(50), @orderby varchar(50))
RETURNS TABLE
AS
RETURN 
    SELECT J.ID, J.Nome, C.ID as Clube_ID, C.Nome as Clube_Nome, JC.Golos_marcados,JC.Assists, J.advertencias ,J.cartoes_azuis, J.cartoes_vermelhos, JC.Penaltis_marcados, JC.Livres_diretos_marcados
    FROM HoqueiPortugues.Jogador J
    INNER JOIN HoqueiPortugues.Jogador_Campo JC ON J.ID = JC.Jogador_ID
    INNER JOIN HoqueiPortugues.Clube C ON J.Clube_ID = C.ID
    WHERE J.Nome LIKE '%' + @Nome + '%'
    ORDER BY 
        CASE 
            WHEN @orderby = 'Golos_Marcados' THEN JC.Golos_marcados
            WHEN @orderby = 'Assists' THEN JC.Assists
            WHEN @orderby = 'Penaltis_Marcados' THEN JC.Penaltis_marcados
            WHEN @orderby = 'Livres_Diretos_Marcados' THEN JC.Livres_diretos_marcados
            WHEN @orderby = 'Advertencias' THEN J.advertencias
            WHEN @orderby = 'Cartoes_Azuis' THEN J.cartoes_azuis
            WHEN @orderby = 'Cartoes_Vermelhos' THEN J.cartoes_vermelhos
        ELSE J.ID
    END; 
GO

/*
Pesquisar guarda redes pelo nome
*/

IF OBJECT_ID('HoqueiPortugues.ufnPesquisaGuardaRedes') IS NOT NULL
    DROP FUNCTION HoqueiPortugues.ufnPesquisaGuardaRedes;
GO

CREATE FUNCTION HoqueiPortugues.ufnPesquisaGuardaRedes(@nome varchar(50), @orderby varchar(50))
RETURNS TABLE
AS
RETURN 
    SELECT J.ID, J.Nome, C.ID as Clube_ID, C.Nome as Clube_Nome, JG.Golos_sofridos, J.advertencias ,J.cartoes_azuis, J.cartoes_vermelhos, JG.Penaltis_defendidos, JG.Livres_diretos_defendidos
    FROM HoqueiPortugues.Jogador J
    INNER JOIN HoqueiPortugues.Jogador_GuardaRedes JG ON J.ID = JG.Jogador_ID
    INNER JOIN HoqueiPortugues.Clube C ON J.Clube_ID = C.ID
    WHERE J.Nome LIKE '%' + @Nome + '%'
    ORDER BY
        CASE 
            WHEN @orderby = 'Golos_Sofridos' THEN JG.Golos_sofridos
            WHEN @orderby = 'Penaltis_Defendidos' THEN JG.Penaltis_defendidos
            WHEN @orderby = 'Livres_Diretos_Defendidos' THEN JG.Livres_diretos_defendidos
            WHEN @orderby = 'Advertencias' THEN J.advertencias
            WHEN @orderby = 'Cartoes_Azuis' THEN J.cartoes_azuis
            WHEN @orderby = 'Cartoes_Vermelhos' THEN J.cartoes_vermelhos
        ELSE J.ID
    END;
GO


