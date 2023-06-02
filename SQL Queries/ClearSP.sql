use p4g7;
GO


-- This file is responsible for cleaning the stored procedures
-- It is meant to be run on Microsoft SQL Server Management Studio.
-- Its not designed to be runned multiple times


IF OBJECT_ID('HoqueiPortugues.calcularClassificacao', 'P') IS NOT NULL DROP PROCEDURE HoqueiPortugues.calcularClassificacao;
GO



IF OBJECT_ID('HoqueiPortugues.contratarJogador', 'P') IS NOT NULL DROP PROCEDURE HoqueiPortugues.contratarJogador;
GO



IF OBJECT_ID('HoqueiPortugues.contratarJogadorClube', 'P') IS NOT NULL DROP PROCEDURE HoqueiPortugues.contratarJogadorClube;
GO



IF OBJECT_ID('HoqueiPortugues.jogadorSemClube', 'P') IS NOT NULL DROP PROCEDURE HoqueiPortugues.jogadorSemClube;
GO



IF OBJECT_ID('HoqueiPortugues.contratarJogadorSemClube', 'P') IS NOT NULL DROP PROCEDURE HoqueiPortugues.contratarJogadorSemClube;
GO



IF OBJECT_ID('HoqueiPortugues.contratarTreinador', 'P') IS NOT NULL DROP PROCEDURE HoqueiPortugues.contratarTreinador;
GO



IF OBJECT_ID('HoqueiPortugues.contratarTreinadorClube', 'P') IS NOT NULL DROP PROCEDURE HoqueiPortugues.contratarTreinadorClube;
GO



IF OBJECT_ID('HoqueiPortugues.treinadorSemClube', 'P') IS NOT NULL DROP PROCEDURE HoqueiPortugues.treinadorSemClube;
GO



IF OBJECT_ID('HoqueiPortugues.contratarTreinadorSemClube', 'P') IS NOT NULL DROP PROCEDURE HoqueiPortugues.contratarTreinadorSemClube;
GO



IF OBJECT_ID('HoqueiPortugues.adicionarEspecialistaTecnico', 'P') IS NOT NULL DROP PROCEDURE HoqueiPortugues.adicionarEspecialistaTecnico;
GO



IF OBJECT_ID('HoqueiPortugues.removerEspecialistaTecnico', 'P') IS NOT NULL DROP PROCEDURE HoqueiPortugues.removerEspecialistaTecnico;
GO



IF OBJECT_ID('HoqueiPortugues.simularJogo', 'P') IS NOT NULL DROP PROCEDURE HoqueiPortugues.simularJogo;
GO



IF OBJECT_ID('HoqueiPortugues.PesquisaJogadoresCampo', 'P') IS NOT NULL DROP PROCEDURE HoqueiPortugues.PesquisaJogadoresCampo;
GO



IF OBJECT_ID('HoqueiPortugues.PesquisaGuardaRedes', 'P') IS NOT NULL DROP PROCEDURE HoqueiPortugues.PesquisaGuardaRedes;
GO



IF OBJECT_ID('HoqueiPortugues.STeliminarUltimoPlantel', 'P') IS NOT NULL DROP PROCEDURE HoqueiPortugues.STeliminarUltimoPlantel;
GO



IF OBJECT_ID('HoqueiPortugues.STeliminarUltimosPlanteis', 'P') IS NOT NULL DROP PROCEDURE HoqueiPortugues.STeliminarUltimosPlanteis;
GO



IF OBJECT_ID('HoqueiPortugues.adicionarArbitros', 'P') IS NOT NULL DROP PROCEDURE HoqueiPortugues.adicionarArbitros;
GO



IF OBJECT_ID('HoqueiPortugues.eliminarArbitros', 'P') IS NOT NULL DROP PROCEDURE HoqueiPortugues.eliminarArbitros;
GO



IF OBJECT_ID('HoqueiPortugues.updateResultado', 'P') IS NOT NULL DROP PROCEDURE HoqueiPortugues.updateResultado;
GO