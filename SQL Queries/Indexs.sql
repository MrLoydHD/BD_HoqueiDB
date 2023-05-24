use Test_Hoquei;
go


/*
Index para a tabela Jogador
*/
CREATE INDEX idx_Jogador_Nome
ON HoqueiPortugues.Jogador (Nome);


/*
Index para a tabela Jogo
*/
CREATE INDEX idx_Jogo_Data
ON HoqueiPortugues.Jogo (Data);
