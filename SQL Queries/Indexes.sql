use Test_Hoquei;
go

/*
Indices para a pesquisa de jogadores por nome e nacionalidade
*/
CREATE INDEX idx_nome ON HoqueiPortugues.Jogador (Nome);
CREATE INDEX idx_nacionalidade ON HoqueiPortugues.Jogador (Nacionalidade);
CREATE INDEX idx_nome_clube ON HoqueiPortugues.Clube (Nome);


