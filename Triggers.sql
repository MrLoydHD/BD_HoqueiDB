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

