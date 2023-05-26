use Test_Hoquei;
go


/*
Indexes para a pesquisa de jogadores
*/
CREATE INDEX idx_nome ON HoqueiPortugues.Jogador (Nome);
CREATE INDEX idx_nacionalidade ON HoqueiPortugues.Jogador (Nacionalidade);
CREATE INDEX idx_nome_clube ON HoqueiPortugues.Clube (Nome);

/*
Indexes para a pesquisa de
*/


