use p4g7;
go

-- This file is responsible for cleaning UDFs
-- It is meant to be run on Microsoft SQL Server Management Studio.
-- Its not designed to be runned multiple times


IF OBJECT_ID('HoqueiPortugues.ufnJogadoresSemClube') IS NOT NULL
    DROP FUNCTION HoqueiPortugues.ufnJogadoresSemClube;
GO



IF OBJECT_ID('HoqueiPortugues.ufnTreinadoresSemClube') IS NOT NULL
    DROP FUNCTION HoqueiPortugues.ufnTreinadoresSemClube;
GO



IF OBJECT_ID('HoqueiPortugues.fnObterTreinadoresPorJogo') IS NOT NULL
    DROP FUNCTION HoqueiPortugues.fnObterTreinadoresPorJogo;
GO



IF OBJECT_ID('HoqueiPortugues.fnObterJogadoresPorJogo') IS NOT NULL
    DROP FUNCTION HoqueiPortugues.fnObterJogadoresPorJogo;
GO



IF OBJECT_ID('HoqueiPortugues.fnConsultarJogo') IS NOT NULL
    DROP FUNCTION HoqueiPortugues.fnConsultarJogo;
GO



IF OBJECT_ID('HoqueiPortugues.fnVerCalendarioEquipa') IS NOT NULL
    DROP FUNCTION HoqueiPortugues.fnVerCalendarioEquipa;
GO