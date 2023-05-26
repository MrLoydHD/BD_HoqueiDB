use p4g7;
go

/* Clube insertion*/
insert into HoqueiPortugues.Clube values (1, 'FC Porto', 'Porto', 1956);
insert into HoqueiPortugues.Clube values (2, 'SL Benfica', 'Lisboa', 1904);
insert into HoqueiPortugues.Clube values (3, 'Sporting CP', 'Lisboa', 1906);
insert into HoqueiPortugues.Clube values (4, 'OC Barcelos', 'Barcelos', 1972);
insert into HoqueiPortugues.Clube values (5, 'AD Valongo', 'Valongo', 1942);
insert into HoqueiPortugues.Clube values (6, 'HC Braga', 'Braga', 1995);
insert into HoqueiPortugues.Clube values (7, 'AJ Viana', 'Viana do Castelo', 1982);
insert into HoqueiPortugues.Clube values (8, 'Riba dAve HC', 'Vila Nova de Famalicão', 1972);
insert into HoqueiPortugues.Clube values (9, 'SC Tomar', 'Tomar', 1915);
insert into HoqueiPortugues.Clube values (10, 'GRF Murches', 'Cascais', 1937);
insert into HoqueiPortugues.Clube values (11, 'UD Oliveirense', 'Oliveira de Azeméis', 1967);
insert into HoqueiPortugues.Clube values (12, 'Parede FC', 'Parede', 1928);
insert into HoqueiPortugues.Clube values (13, 'Famalicense AC', 'Vila Nova de Famalicão', 1937);
insert into HoqueiPortugues.Clube values (14, 'CD Paço de Arcos', 'Paço de Arcos', 1944);
go

/*Pavilhão insertion*/
insert into HoqueiPortugues.Pavilhao values (1, 'Dragão Caixa', 'Rua Fernando Andre n1', 2500, 1);
insert into HoqueiPortugues.Pavilhao values (2, 'Pavilhão da Luz','Rua da Luz n32' , 2500, 2);
insert into HoqueiPortugues.Pavilhao values (3, 'Pavilhão João Rocha', 'Rua João Rocha n2' , 3000, 3);
insert into HoqueiPortugues.Pavilhao values (4, 'Pavilhão Municipal de Barcelos', 'Rua de Barcelos n4',2500, 4);
insert into HoqueiPortugues.Pavilhao values (5, 'Pavilhão Municipal de Valongo', 'Rua Arcanjo Valongo n1',1500, 5);
insert into HoqueiPortugues.Pavilhao values (6, 'Pavilhão Municipal de Braga', 'Rua Bracarense n98',1500, 6);
insert into HoqueiPortugues.Pavilhao values (7, 'Pavilhão Municipal de Monserrate', 'Rua de Monserrate n2',1500, 7);
insert into HoqueiPortugues.Pavilhao values (8, 'Pavilhão Municipal de Riba dAve', 'Rua Riba dAve n1',1500, 8);
insert into HoqueiPortugues.Pavilhao values (9, 'Pavilhão Municipal Cidade de Tomar', 'Rua Direita de Tomar n1',1500, 9);
insert into HoqueiPortugues.Pavilhao values (10, 'Pavilhão Municipal de Cascais', 'Avenida de Cascais n3', 1500, 10);
insert into HoqueiPortugues.Pavilhao values (11, 'Pavilhão Dr. Salvador Machado', 'Rua Salvador Machado n32', 1500, 11);
insert into HoqueiPortugues.Pavilhao values (12, 'Pavilhão Desportivo Municipal de Parede', 'Rua Filipe Paredes n32',1500, 12);
insert into HoqueiPortugues.Pavilhao values (13, 'Pavilhão Municipal de Famalicão', 'Rua Famalicão n54',1500, 13);
insert into HoqueiPortugues.Pavilhao values (14, 'Pavilhão Desportivo Municipal de Paço de Arcos', 'Rua paço dos arcos n2',1500, 14);
go

/*Arbitro insertion*/
INSERT INTO HoqueiPortugues.Arbitro VALUES (1, 'João Silva', 45, 'Principal', 'Portugal');
INSERT INTO HoqueiPortugues.Arbitro VALUES (2, 'Antonio Soares', 47, 'Auxiliar', 'Portugal');
INSERT INTO HoqueiPortugues.Arbitro VALUES (3, 'Miguel Santos', 40, 'Principal', 'Portugal');
INSERT INTO HoqueiPortugues.Arbitro VALUES (4, 'Pedro Gomes', 52, 'Auxiliar', 'Portugal');
INSERT INTO HoqueiPortugues.Arbitro VALUES (5, 'Carlos Pereira', 50, 'Principal', 'Portugal');
INSERT INTO HoqueiPortugues.Arbitro VALUES (6, 'Manuel Costa', 43, 'Auxiliar', 'Portugal');
INSERT INTO HoqueiPortugues.Arbitro VALUES (7, 'Ricardo Rocha', 46, 'Principal', 'Portugal');
INSERT INTO HoqueiPortugues.Arbitro VALUES (8, 'Diogo Oliveira', 44, 'Auxiliar', 'Portugal');
INSERT INTO HoqueiPortugues.Arbitro VALUES (9, 'Paulo Almeida', 49, 'Principal', 'Portugal');
INSERT INTO HoqueiPortugues.Arbitro VALUES (10, 'Rui Marques', 41, 'Auxiliar', 'Portugal');
INSERT INTO HoqueiPortugues.Arbitro VALUES (11, 'Luis Gomez', 50, 'Principal', 'Espanha');
INSERT INTO HoqueiPortugues.Arbitro VALUES (12, 'Carlos Sanchez', 47, 'Auxiliar', 'Espanha');
INSERT INTO HoqueiPortugues.Arbitro VALUES (13, 'Antonio Guerra', 52, 'Principal', 'Espanha');
INSERT INTO HoqueiPortugues.Arbitro VALUES (14, 'Ricardo Morales', 46, 'Auxiliar', 'Espanha');
INSERT INTO HoqueiPortugues.Arbitro VALUES (15, 'Miguel Cortes', 45, 'Principal', 'Espanha');
INSERT INTO HoqueiPortugues.Arbitro VALUES (16, 'Pedro Navarro', 49, 'Auxiliar', 'Espanha');
INSERT INTO HoqueiPortugues.Arbitro VALUES (17, 'Mario Rossi', 51, 'Principal', 'Itália');
INSERT INTO HoqueiPortugues.Arbitro VALUES (18, 'Luca Bianchi', 47, 'Auxiliar', 'Itália');
INSERT INTO HoqueiPortugues.Arbitro VALUES (19, 'Giuseppe Conte', 53, 'Principal', 'Itália');
INSERT INTO HoqueiPortugues.Arbitro VALUES (20, 'Alberto Ferrari', 44, 'Auxiliar', 'Itália');
go

/*Especialista Técnico insertion*/
--Clube 1
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (1, 'Manuel Pereira', 45, 'Mecânico', 'Portugal', 1);
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (2, 'João Alves', 42, 'Massagista', 'Portugal', 1);
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (3, 'Pedro Silva', 40, 'Fisioterapeuta', 'Portugal', 1);
go
--Clube 2
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (4, 'Carlos Ferreira', 46, 'Mecânico', 'Espanha', 2);
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (5, 'Ricardo Santos', 43, 'Massagista', 'Espanha', 2);
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (6, 'Fernando Costa', 41, 'Fisioterapeuta', 'Espanha', 2);
go
--Clube 3
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (7, 'Guilherme Sousa', 48, 'Mecânico', 'Portugal', 3);
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (8, 'Rodrigo Almeida', 44, 'Massagista', 'Portugal', 3);
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (9, 'André Gonçalves', 42, 'Fisioterapeuta', 'Portugal', 3);
go
--Clube 4
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (10, 'Luís Ribeiro', 47, 'Mecânico', 'Espanha', 4);
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (11, 'Felipe Monteiro', 45, 'Massagista', 'Espanha', 4);
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (12, 'Miguel Ferreira', 43, 'Fisioterapeuta', 'Espanha', 4);
go
--Clube 5
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (13, 'António Soares', 49, 'Mecânico', 'França', 5);
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (14, 'Francisco Gomes', 46, 'Massagista', 'França', 5);
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (15, 'Rui Santos', 44, 'Fisioterapeuta', 'França', 5);
go
--Clube 6
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (16, 'Tiago Martins', 48, 'Mecânico', 'Argentina', 6);
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (17, 'João Paulo', 45, 'Massagista', 'Argentina', 6);
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (18, 'Leonardo Silva', 43, 'Fisioterapeuta', 'Argentina', 6);
go
--Clube 7
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (19, 'Bruno Oliveira', 47, 'Mecânico', 'Portugal', 7);
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (20, 'Gabriel Santos', 44, 'Massagista', 'Portugal', 7);
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (21, 'Diogo Pinto', 42, 'Fisioterapeuta', 'Portugal', 7);
go
--Clube 8
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (22, 'Carlos Costa', 46, 'Mecânico', 'Espanha', 8);
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (23, 'José Almeida', 43, 'Massagista', 'Espanha', 8);
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (24, 'Rafael Pereira', 41, 'Fisioterapeuta', 'Espanha', 8);
go
--Clube 9
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (25, 'Daniel Mendes', 49, 'Mecânico', 'França', 9);
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (26, 'Gustavo Rocha', 46, 'Massagista', 'França', 9);
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (27, 'Eduardo Silva', 44, 'Fisioterapeuta', 'França', 9);
go
--Clube 10
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (28, 'Lucas Fernandes', 48, 'Mecânico', 'Argentina', 10);
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (29, 'Mateus Rodrigues', 45, 'Massagista', 'Argentina', 10);
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (30, 'Ricardo Teixeira', 43, 'Fisioterapeuta', 'Argentina', 10);
go
--Clube 11
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (31, 'Fábio Guedes', 47, 'Mecânico', 'Portugal', 11);
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (32, 'Hugo Dias', 44, 'Massagista', 'Portugal', 11);
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (33, 'Igor Costa', 42, 'Fisioterapeuta', 'Portugal', 11);
go
--Clube 12
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (34, 'Juliano César', 46, 'Mecânico', 'Espanha', 12);
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (35, 'Leandro Lopes', 43, 'Massagista', 'Espanha', 12);
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (36, 'Marcelo Ribeiro', 41, 'Fisioterapeuta', 'Espanha', 12);
go
--Clube 13
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (37, 'Nelson Duarte', 49, 'Mecânico', 'França', 13);
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (38, 'Otávio Araújo', 46, 'Massagista', 'França', 13);
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (39, 'Paulo Henrique', 44, 'Fisioterapeuta', 'França', 13);
go
--Clube 14
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (40, 'Quintino Ferreira', 48, 'Mecânico', 'Argentina', 14);
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (41, 'Rubens Cardoso', 45, 'Massagista', 'Argentina', 14);
INSERT INTO HoqueiPortugues.Especialista_Tecnico VALUES (42, 'Sérgio Alves', 43, 'Fisioterapeuta', 'Argentina', 14);
go


/*Jogador insertion*/
--Clube 1
INSERT INTO HoqueiPortugues.Jogador VALUES (1, 'Francisco Santos', 25, 'Guarda-Redes', 'Portugal', 1, 1, 0, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (2, 'Pedro Gomes', 28, 'Guarda-Redes', 'Portugal', 2, 1, 1, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (3, 'Carlos Silva', 30, 'Guarda-Redes', 'Espanha', 3, 1, 0, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (4, 'André Soares', 27, 'Guarda-Redes', 'Portugal', 4, 1, 2, 2, 1);
INSERT INTO HoqueiPortugues.Jogador VALUES (5, 'João Rodrigues', 22, 'Jogador de Campo', 'Portugal', 5, 1, 2, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (6, 'Miguel Nunes', 26, 'Jogador de Campo', 'Portugal', 6, 1, 3, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (7, 'Ricardo Silva', 24, 'Jogador de Campo', 'Portugal', 7, 1, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (8, 'Gustavo Ferreira', 29, 'Jogador de Campo', 'Portugal', 8, 1, 4, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (9, 'Fernando Souza', 23, 'Jogador de Campo', 'Portugal', 9, 1, 2, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (10, 'Rafael Costa', 24, 'Jogador de Campo', 'Espanha', 10, 1, 3, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (11, 'Leonardo Alves', 26, 'Jogador de Campo', 'Portugal', 11, 1, 3, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (12, 'Roberto Rodrigues', 25, 'Jogador de Campo', 'Espanha', 12, 1, 1, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (13, 'Tiago Martins', 28, 'Jogador de Campo', 'Portugal', 13, 1, 2, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (14, 'Bruno Pinto', 27, 'Jogador de Campo', 'Portugal', 14, 1, 1, 0, 0);
go
--Clube 2
INSERT INTO HoqueiPortugues.Jogador VALUES (15, 'Luis Gomes', 30, 'Guarda-Redes', 'Portugal', 1, 2, 0, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (16, 'Antonio Silva', 28, 'Guarda-Redes', 'Espanha', 2, 2, 1, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (17, 'David Costa', 32, 'Guarda-Redes', 'Portugal', 3, 2, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (18, 'Alberto Santos', 29, 'Guarda-Redes', 'Espanha', 4, 2, 2, 2, 1);
INSERT INTO HoqueiPortugues.Jogador VALUES (19, 'Hugo Rodrigues', 22, 'Jogador de Campo', 'Portugal', 5, 2, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (20, 'Gabriel Nunes', 24, 'Jogador de Campo', 'Portugal', 6, 2, 3, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (21, 'Victor Lima', 25, 'Jogador de Campo', 'Portugal', 7, 2, 2, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (22, 'Marcos Ferreira', 28, 'Jogador de Campo', 'Espanha', 8, 2, 2, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (23, 'Diogo Souza', 24, 'Jogador de Campo', 'Portugal', 9, 2, 1, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (24, 'Adriano Costa', 26, 'Jogador de Campo', 'Espanha', 10, 2, 3, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (25, 'Alexandre Alves', 24, 'Jogador de Campo', 'Portugal', 11, 2, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (26, 'Ricardo Rodrigues', 23, 'Jogador de Campo', 'Portugal', 12, 2, 2, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (27, 'Igor Martins', 26, 'Jogador de Campo', 'Espanha', 13, 2, 1, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (28, 'Edgar Pinto', 25, 'Jogador de Campo', 'Portugal', 14, 2, 1, 2, 0);
go
--Clube 3
INSERT INTO HoqueiPortugues.Jogador VALUES (29, 'Franco Ramos', 30, 'Guarda-Redes', 'Argentina', 1, 3, 1, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (30, 'Enrique Sanchez', 29, 'Guarda-Redes', 'Espanha', 2, 3, 0, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (31, 'Marco Rossi', 33, 'Guarda-Redes', 'Itália', 3, 3, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (32, 'Diego Fernández', 28, 'Guarda-Redes', 'Espanha', 4, 3, 2, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (33, 'José Ferreira', 25, 'Jogador de Campo', 'Portugal', 5, 3, 1, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (34, 'Luís Almeida', 24, 'Jogador de Campo', 'Portugal', 6, 3, 3, 2, 1);
INSERT INTO HoqueiPortugues.Jogador VALUES (35, 'Rodrigo Silva', 26, 'Jogador de Campo', 'Brasil', 7, 3, 2, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (36, 'Manuel Gomez', 27, 'Jogador de Campo', 'Espanha', 8, 3, 1, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (37, 'Eduardo Pereira', 23, 'Jogador de Campo', 'Portugal', 9, 3, 2, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (38, 'Carlos Martins', 22, 'Jogador de Campo', 'Portugal', 10, 3, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (39, 'Pedro Sousa', 25, 'Jogador de Campo', 'Portugal', 11, 3, 2, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (40, 'Sérgio Gonçalves', 27, 'Jogador de Campo', 'Portugal', 12, 3, 3, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (41, 'Jorge Oliveira', 24, 'Jogador de Campo', 'Portugal', 13, 3, 1, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (42, 'Miguel Pinto', 26, 'Jogador de Campo', 'Portugal', 14, 3, 2, 0, 0);
go
--Clube 4
INSERT INTO HoqueiPortugues.Jogador VALUES (43, 'Sebastián Torres', 28, 'Guarda-Redes', 'Espanha', 1, 4, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (44, 'André Correia', 31, 'Guarda-Redes', 'Portugal', 2, 4, 2, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (45, 'Luca Bianchi', 29, 'Guarda-Redes', 'Itália', 3, 4, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (46, 'Davide Ferraro', 30, 'Guarda-Redes', 'Itália', 4, 4, 2, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (47, 'João Silva', 26, 'Jogador de Campo', 'Portugal', 5, 4, 1, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (48, 'Miguel Antunes', 24, 'Jogador de Campo', 'Portugal', 6, 4, 3, 2, 1);
INSERT INTO HoqueiPortugues.Jogador VALUES (49, 'Rodrigo Almeida', 25, 'Jogador de Campo', 'Brasil', 7, 4, 2, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (50, 'Carlos Sánchez', 27, 'Jogador de Campo', 'Espanha', 8, 4, 1, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (51, 'Bruno Ferreira', 22, 'Jogador de Campo', 'Portugal', 9, 4, 2, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (52, 'Pedro Cardoso', 24, 'Jogador de Campo', 'Portugal', 10, 4, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (53, 'Nuno Lopes', 23, 'Jogador de Campo', 'Portugal', 11, 4, 2, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (54, 'Ricardo Pereira', 28, 'Jogador de Campo', 'Portugal', 12, 4, 3, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (55, 'Diogo Costa', 24, 'Jogador de Campo', 'Portugal', 13, 4, 1, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (56, 'Gonçalo Silva', 27, 'Jogador de Campo', 'Portugal', 14, 4, 2, 0, 0);
go
--Clube 5
INSERT INTO HoqueiPortugues.Jogador VALUES (57, 'Vitor Santos', 27, 'Guarda-Redes', 'Portugal', 1, 5, 1, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (58, 'Adrián Paredes', 31, 'Guarda-Redes', 'Espanha', 2, 5, 2, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (59, 'Fabio Mancini', 29, 'Guarda-Redes', 'Itália', 3, 5, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (60, 'Jorge Fernández', 30, 'Guarda-Redes', 'Espanha', 4, 5, 1, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (61, 'Pedro Dias', 26, 'Jogador de Campo', 'Portugal', 5, 5, 2, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (62, 'Tomás Pires', 24, 'Jogador de Campo', 'Portugal', 6, 5, 3, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (63, 'Renato Carvalho', 23, 'Jogador de Campo', 'Portugal', 7, 5, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (64, 'António Teixeira', 25, 'Jogador de Campo', 'Portugal', 8, 5, 2, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (65, 'Francisco Guerreiro', 23, 'Jogador de Campo', 'Portugal', 9, 5, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (66, 'Ricardo Gomes', 24, 'Jogador de Campo', 'Portugal', 10, 5, 2, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (67, 'Mário Lopes', 24, 'Jogador de Campo', 'Portugal', 11, 5, 1, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (68, 'Carlos Monteiro', 28, 'Jogador de Campo', 'Portugal', 12, 5, 3, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (69, 'João Oliveira', 26, 'Jogador de Campo', 'Portugal', 13, 5, 1, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (70, 'José Almeida', 27, 'Jogador de Campo', 'Portugal', 14, 5, 2, 1, 0);
go
--Clube 6
INSERT INTO HoqueiPortugues.Jogador VALUES (71, 'Ricardo Silva', 27, 'Guarda-Redes', 'Portugal', 1, 6, 1, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (72, 'António Gomes', 31, 'Guarda-Redes', 'Espanhol', 2, 6, 2, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (73, 'Miguel Costa', 29, 'Guarda-Redes', 'Portugal', 3, 6, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (74, 'Pedro Santos', 30, 'Guarda-Redes', 'Portugal', 4, 6, 1, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (75, 'João Alves', 26, 'Jogador de Campo', 'Portugal', 5, 6, 2, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (76, 'Miguel Almeida', 24, 'Jogador de Campo', 'Portugal', 6, 6, 3, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (77, 'Ricardo Carvalho', 23, 'Jogador de Campo', 'Portugal', 7, 6, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (78, 'Roy Biento', 25, 'Jogador de Campo', 'Espanhol', 8, 6, 2, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (79, 'Francisco Costa', 23, 'Jogador de Campo', 'Portugal', 9, 6, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (80, 'Ricardo Costa', 24, 'Jogador de Campo', 'Portugal', 10, 6, 2, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (81, 'Mário Cardoso', 24, 'Jogador de Campo', 'Portugal', 11, 6, 1, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (82, 'Carlos Silva', 28, 'Jogador de Campo', 'Portugal', 12, 6, 3, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (83, 'Rui Oliveira', 26, 'Jogador de Campo', 'Portugal', 13, 6, 1, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (84, 'Diogo Almeida', 27, 'Jogador de Campo', 'Portugal', 14, 6, 2, 1, 0);
go
--Clube 7
INSERT INTO HoqueiPortugues.Jogador VALUES (85, 'Carlos Pereira', 28, 'Guarda-Redes', 'Portugal', 1, 7, 1, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (86, 'Javier Martinez', 31, 'Guarda-Redes', 'Espanhol', 2, 7, 2, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (87, 'Gonçalo Teixeira', 29, 'Guarda-Redes', 'Portugal', 3, 7, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (88, 'Pablo Ruiz', 30, 'Guarda-Redes', 'Espanhol', 4, 7, 1, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (89, 'Luis Rodriguez', 26, 'Jogador de Campo', 'Espanhol', 5, 7, 2, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (90, 'Lucas Fernandez', 24, 'Jogador de Campo', 'Argentino', 6, 7, 3, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (91, 'Hugo Soares', 23, 'Jogador de Campo', 'Portugal', 7, 7, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (92, 'Mateo Aguero', 25, 'Jogador de Campo', 'Argentino', 8, 7, 2, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (93, 'Gabriel Santos', 23, 'Jogador de Campo', 'Portugal', 9, 7, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (94, 'Sérgio Oliveira', 24, 'Jogador de Campo', 'Portugal', 10, 7, 2, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (95, 'André Alves', 24, 'Jogador de Campo', 'Portugal', 11, 7, 1, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (96, 'Julien Leblanc', 28, 'Jogador de Campo', 'Francês', 12, 7, 3, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (97, 'Rui Cardoso', 26, 'Jogador de Campo', 'Portugal', 13, 7, 1, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (98, 'António Ferreira', 27, 'Jogador de Campo', 'Portugal', 14, 7, 2, 1, 0);
go
--Clube 8
INSERT INTO HoqueiPortugues.Jogador VALUES (99, 'Vitor Martins', 26, 'Guarda-Redes', 'Portugal', 1, 8, 1, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (100, 'Fernando Santos', 30, 'Guarda-Redes', 'Espanhol', 2, 8, 2, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (101, 'Paulo Ferreira', 27, 'Guarda-Redes', 'Portugal', 3, 8, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (102, 'Diego Lopez', 29, 'Guarda-Redes', 'Espanhol', 4, 8, 1, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (103, 'Manuel Almeida', 25, 'Jogador de Campo', 'Portugal', 5, 8, 2, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (104, 'Luis Pereira', 26, 'Jogador de Campo', 'Portugal', 6, 8, 3, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (105, 'Pedro Costa', 23, 'Jogador de Campo', 'Portugal', 7, 8, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (106, 'Carlos Silva', 24, 'Jogador de Campo', 'Portugal', 8, 8, 2, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (107, 'Joaquim Rodrigues', 22, 'Jogador de Campo', 'Portugal', 9, 8, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (108, 'Alfredo Gonzalez', 26, 'Jogador de Campo', 'Espanhol', 10, 8, 2, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (109, 'Tiago Ribeiro', 24, 'Jogador de Campo', 'Portugal', 11, 8, 1, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (110, 'João Santos', 25, 'Jogador de Campo', 'Portugal', 12, 8, 3, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (111, 'Daniel Marques', 26, 'Jogador de Campo', 'Portugal', 13, 8, 1, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (112, 'Nuno Silva', 27, 'Jogador de Campo', 'Portugal', 14, 8, 2, 1, 0);
go
--Clube 9 
INSERT INTO HoqueiPortugues.Jogador VALUES (113, 'Tomás Pereira', 27, 'Guarda-Redes', 'Portugal', 1, 9, 1, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (114, 'José Costa', 30, 'Guarda-Redes', 'Espanhol', 2, 9, 2, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (115, 'Francisco Rodrigues', 28, 'Guarda-Redes', 'Portugal', 3, 9, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (116, 'Miguel Almeida', 29, 'Guarda-Redes', 'Espanhol', 4, 9, 1, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (117, 'Diogo Ferreira', 26, 'Jogador de Campo', 'Portugal', 5, 9, 2, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (118, 'Carlos Martins', 24, 'Jogador de Campo', 'Portugal', 6, 9, 3, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (119, 'Pedro Almeida', 22, 'Jogador de Campo', 'Portugal', 7, 9, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (120, 'Daniel Santos', 24, 'Jogador de Campo', 'Portugal', 8, 9, 2, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (121, 'António Soares', 22, 'Jogador de Campo', 'Portugal', 9, 9, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (122, 'Manuel Ferreira', 25, 'Jogador de Campo', 'Espanhol', 10, 9, 2, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (123, 'Joaquim Costa', 24, 'Jogador de Campo', 'Portugal', 11, 9, 1, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (124, 'Ricardo Santos', 23, 'Jogador de Campo', 'Portugal', 12, 9, 3, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (125, 'André Silva', 26, 'Jogador de Campo', 'Portugal', 13, 9, 1, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (126, 'Nuno Almeida', 28, 'Jogador de Campo', 'Portugal', 14, 9, 2, 1, 0);
go
--Clube 10
INSERT INTO HoqueiPortugues.Jogador VALUES (127, 'Luis Ferreira', 27, 'Guarda-Redes', 'Portugal', 1, 10, 1, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (128, 'Francisco Almeida', 29, 'Guarda-Redes', 'Espanhol', 2, 10, 2, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (129, 'Pedro Rodrigues', 28, 'Guarda-Redes', 'Portugal', 3, 10, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (130, 'Manuel Silva', 30, 'Guarda-Redes', 'Espanhol', 4, 10, 1, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (131, 'Carlos Ferreira', 24, 'Jogador de Campo', 'Portugal', 5, 10, 2, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (132, 'José Martins', 26, 'Jogador de Campo', 'Portugal', 6, 10, 3, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (133, 'Joaquim Costa', 22, 'Jogador de Campo', 'Portugal', 7, 10, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (134, 'Nuno Soares', 23, 'Jogador de Campo', 'Portugal', 8, 10, 2, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (135, 'António Pereira', 21, 'Jogador de Campo', 'Portugal', 9, 10, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (136, 'Diogo Costa', 26, 'Jogador de Campo', 'Espanhol', 10, 10, 2, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (137, 'Tomás Santos', 23, 'Jogador de Campo', 'Portugal', 11, 10, 1, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (138, 'Francisco Soares', 24, 'Jogador de Campo', 'Portugal', 12, 10, 3, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (139, 'Pedro Almeida', 25, 'Jogador de Campo', 'Portugal', 13, 10, 1, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (140, 'Carlos Costa', 27, 'Jogador de Campo', 'Portugal', 14, 10, 2, 1, 0);
go
--Clube 11
INSERT INTO HoqueiPortugues.Jogador VALUES (141, 'Miguel Silva', 28, 'Guarda-Redes', 'Portugal', 1, 11, 1, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (142, 'Paulo Costa', 30, 'Guarda-Redes', 'Espanhol', 2, 11, 2, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (143, 'Joaquim Ferreira', 29, 'Guarda-Redes', 'Portugal', 3, 11, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (144, 'Manuel Pereira', 28, 'Guarda-Redes', 'Espanhol', 4, 11, 1, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (145, 'Rui Martins', 25, 'Jogador de Campo', 'Portugal', 5, 11, 2, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (146, 'Daniel Almeida', 24, 'Jogador de Campo', 'Portugal', 6, 11, 3, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (147, 'Tomás Rodrigues', 23, 'Jogador de Campo', 'Portugal', 7, 11, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (148, 'André Ferreira', 23, 'Jogador de Campo', 'Portugal', 8, 11, 2, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (149, 'José Pereira', 21, 'Jogador de Campo', 'Portugal', 9, 11, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (150, 'Pedro Santos', 25, 'Jogador de Campo', 'Espanhol', 10, 11, 2, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (151, 'Carlos Rodrigues', 23, 'Jogador de Campo', 'Portugal', 11, 11, 1, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (152, 'Francisco Almeida', 24, 'Jogador de Campo', 'Portugal', 12, 11, 3, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (153, 'Ricardo Soares', 24, 'Jogador de Campo', 'Portugal', 13, 11, 1, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (154, 'Nuno Costa', 27, 'Jogador de Campo', 'Portugal', 14, 11, 2, 1, 0);
go
--Clube 12
INSERT INTO HoqueiPortugues.Jogador VALUES (155, 'Luis Almeida', 28, 'Guarda-Redes', 'Portugal', 1, 12, 1, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (156, 'Paulo Rodrigues', 31, 'Guarda-Redes', 'Espanhol', 2, 12, 2, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (157, 'Manuel Costa', 28, 'Guarda-Redes', 'Portugal', 3, 12, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (158, 'Carlos Ferreira', 29, 'Guarda-Redes', 'Espanhol', 4, 12, 1, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (159, 'Miguel Martins', 25, 'Jogador de Campo', 'Portugal', 5, 12, 2, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (160, 'Joaquim Almeida', 23, 'Jogador de Campo', 'Portugal', 6, 12, 3, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (161, 'Pedro Costa', 21, 'Jogador de Campo', 'Portugal', 7, 12, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (162, 'António Silva', 22, 'Jogador de Campo', 'Portugal', 8, 12, 2, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (163, 'Francisco Santos', 21, 'Jogador de Campo', 'Portugal', 9, 12, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (164, 'Diogo Almeida', 26, 'Jogador de Campo', 'Espanhol', 10, 12, 2, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (165, 'Tomás Pereira', 23, 'Jogador de Campo', 'Portugal', 11, 12, 1, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (166, 'José Costa', 24, 'Jogador de Campo', 'Portugal', 12, 12, 3, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (167, 'Rui Almeida', 25, 'Jogador de Campo', 'Portugal', 13, 12, 1, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (168, 'Manuel Santos', 26, 'Jogador de Campo', 'Portugal', 14, 12, 2, 1, 0);
go

--Clube 13
INSERT INTO HoqueiPortugues.Jogador VALUES (169, 'Lucas Almeida', 29, 'Guarda-Redes', 'Portugal', 1, 13, 1, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (170, 'Tiago Silva', 32, 'Guarda-Redes', 'Espanhol', 2, 13, 2, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (171, 'Hugo Martins', 29, 'Guarda-Redes', 'Portugal', 3, 13, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (172, 'Francisco Soares', 31, 'Guarda-Redes', 'Espanhol', 4, 13, 1, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (173, 'Gonçalo Pereira', 26, 'Jogador de Campo', 'Portugal', 5, 13, 2, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (174, 'Rafael Almeida', 23, 'Jogador de Campo', 'Portugal', 6, 13, 3, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (175, 'Rodrigo Costa', 24, 'Jogador de Campo', 'Portugal', 7, 13, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (176, 'Miguel Ferreira', 25, 'Jogador de Campo', 'Espanhol', 8, 13, 2, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (177, 'Sérgio Santos', 23, 'Jogador de Campo', 'Portugal', 9, 13, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (178, 'Vítor Almeida', 24, 'Jogador de Campo', 'Espanhol', 10, 13, 2, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (179, 'Pedro Soares', 24, 'Jogador de Campo', 'Portugal', 11, 13, 1, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (180, 'João Rodrigues', 27, 'Jogador de Campo', 'Portugal', 12, 13, 3, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (181, 'Ricardo Costa', 25, 'Jogador de Campo', 'Portugal', 13, 13, 1, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (182, 'António Almeida', 26, 'Jogador de Campo', 'Portugal', 14, 13, 2, 1, 0);
go
--Clube 14
INSERT INTO HoqueiPortugues.Jogador VALUES (183, 'Carlos Costa', 27, 'Guarda-Redes', 'Portugal', 1, 14, 1, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (184, 'João Martins', 31, 'Guarda-Redes', 'Espanhol', 2, 14, 2, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (185, 'Pedro Almeida', 29, 'Guarda-Redes', 'Portugal', 3, 14, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (186, 'Miguel Santos', 30, 'Guarda-Redes', 'Portugal', 4, 14, 1, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (187, 'Ricardo Pereira', 26, 'Jogador de Campo', 'Portugal', 5, 14, 2, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (188, 'André Almeida', 24, 'Jogador de Campo', 'Portugal', 6, 14, 3, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (189, 'Tiago Costa', 23, 'Jogador de Campo', 'Portugal', 7, 14, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (190, 'José Ferreira', 25, 'Jogador de Campo', 'Espanhol', 8, 14, 2, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (191, 'Daniel Santos', 23, 'Jogador de Campo', 'Portugal', 9, 14, 1, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (192, 'Rodrigo Almeida', 24, 'Jogador de Campo', 'Espanhol', 10, 14, 2, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (193, 'Luís Soares', 24, 'Jogador de Campo', 'Portugal', 11, 14, 1, 1, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (194, 'Francisco Rodrigues', 28, 'Jogador de Campo', 'Portugal', 12, 14, 3, 0, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (195, 'Mário Almeida', 26, 'Jogador de Campo', 'Portugal', 13, 14, 1, 2, 0);
INSERT INTO HoqueiPortugues.Jogador VALUES (196, 'Bruno Costa', 27, 'Jogador de Campo', 'Portugal', 14, 14, 2, 1, 0);
go

/*Treinador insertion*/
INSERT INTO HoqueiPortugues.Treinador VALUES (1, 'Jorge Silva', 45, 'Principal', 'Portugal', 1);
INSERT INTO HoqueiPortugues.Treinador VALUES (2, 'Antonio Soares', 47, 'Adjunto', 'Portugal', 1);
INSERT INTO HoqueiPortugues.Treinador VALUES (3, 'Miguel Santos', 40, 'Principal', 'Portugal', 2);
INSERT INTO HoqueiPortugues.Treinador VALUES (4, 'Pedro Gomes', 52, 'Adjunto', 'Portugal', 2);
INSERT INTO HoqueiPortugues.Treinador VALUES (5, 'Carlos Pereira', 50, 'Principal', 'Portugal', 3);
INSERT INTO HoqueiPortugues.Treinador VALUES (6, 'Manuel Costa', 43, 'Adjunto', 'Portugal', 3);
INSERT INTO HoqueiPortugues.Treinador VALUES (7, 'Ricardo Rocha', 46, 'Principal', 'Portugal', 4);
INSERT INTO HoqueiPortugues.Treinador VALUES (8, 'Diogo Oliveira', 44, 'Adjunto', 'Portugal', 4);
INSERT INTO HoqueiPortugues.Treinador VALUES (9, 'Paulo Almeida', 49, 'Principal', 'Portugal', 5);
INSERT INTO HoqueiPortugues.Treinador VALUES (10, 'Rui Marques', 41, 'Adjunto', 'Portugal', 5);
INSERT INTO HoqueiPortugues.Treinador VALUES (11, 'Luis Gomez', 50, 'Principal', 'Espanha', 6);
INSERT INTO HoqueiPortugues.Treinador VALUES (12, 'Carlos Sanchez', 47, 'Adjunto', 'Espanha', 6);
INSERT INTO HoqueiPortugues.Treinador VALUES (13, 'Antonio Guerra', 52, 'Principal', 'Espanha', 7);
INSERT INTO HoqueiPortugues.Treinador VALUES (14, 'Ricardo Morales', 46, 'Adjunto', 'Espanha', 7);
INSERT INTO HoqueiPortugues.Treinador VALUES (15, 'Miguel Cortes', 45, 'Principal', 'Espanha', 8);
INSERT INTO HoqueiPortugues.Treinador VALUES (16, 'Pedro Navarro', 49, 'Adjunto', 'Espanha', 8);
INSERT INTO HoqueiPortugues.Treinador VALUES (17, 'Mario Rossi', 51, 'Principal', 'Itália', 9);
INSERT INTO HoqueiPortugues.Treinador VALUES (18, 'Luca Bianchi', 47, 'Adjunto', 'Itália', 9);
INSERT INTO HoqueiPortugues.Treinador VALUES (19, 'Giuseppe Conte', 53, 'Principal', 'Itália', 10);
INSERT INTO HoqueiPortugues.Treinador VALUES (20, 'Alberto Ferrari', 44, 'Adjunto', 'Itália', 10);
INSERT INTO HoqueiPortugues.Treinador VALUES (21, 'Ricardo Costa', 45, 'Principal', 'Portugal', 11);
INSERT INTO HoqueiPortugues.Treinador VALUES (22, 'João Santos', 47, 'Adjunto', 'Portugal', 11);
INSERT INTO HoqueiPortugues.Treinador VALUES (23, 'Miguel Silva', 40, 'Principal', 'Portugal', 12);
INSERT INTO HoqueiPortugues.Treinador VALUES (24, 'Tomás Silveira', 52, 'Adjunto', 'Portugal', 12);
INSERT INTO HoqueiPortugues.Treinador VALUES (25, 'Ricardo Ares', 50, 'Principal', 'Portugal', 13);
INSERT INTO HoqueiPortugues.Treinador VALUES (26, 'Diogo Santos', 43, 'Adjunto', 'Portugal', 13);
INSERT INTO HoqueiPortugues.Treinador VALUES (27, 'Luís Sousa', 46, 'Principal', 'Portugal', 14);
INSERT INTO HoqueiPortugues.Treinador VALUES (28, 'João Silva', 44, 'Adjunto', 'Portugal', 14);
GO

/* Plantel insertion */
INSERT INTO HoqueiPortugues.Plantel VALUES (1,1)
INSERT INTO HoqueiPortugues.Plantel VALUES (2,2)
INSERT INTO HoqueiPortugues.Plantel VALUES (3,3)
INSERT INTO HoqueiPortugues.Plantel VALUES (4,4)
INSERT INTO HoqueiPortugues.Plantel VALUES (5,5)
INSERT INTO HoqueiPortugues.Plantel VALUES (6,6)
INSERT INTO HoqueiPortugues.Plantel VALUES (7,7)
INSERT INTO HoqueiPortugues.Plantel VALUES (8,8)
INSERT INTO HoqueiPortugues.Plantel VALUES (9,9)
INSERT INTO HoqueiPortugues.Plantel VALUES (10,10)
INSERT INTO HoqueiPortugues.Plantel VALUES (11,11)
INSERT INTO HoqueiPortugues.Plantel VALUES (12,12)
INSERT INTO HoqueiPortugues.Plantel VALUES (13,13)
INSERT INTO HoqueiPortugues.Plantel VALUES (14,14)
INSERT INTO HoqueiPortugues.Plantel VALUES (15,1)
INSERT INTO HoqueiPortugues.Plantel VALUES (16,3)
INSERT INTO HoqueiPortugues.Plantel VALUES (17,2)
INSERT INTO HoqueiPortugues.Plantel VALUES (18,4)
INSERT INTO HoqueiPortugues.Plantel VALUES (19,5)
INSERT INTO HoqueiPortugues.Plantel VALUES (20,7)
INSERT INTO HoqueiPortugues.Plantel VALUES (21,6)
INSERT INTO HoqueiPortugues.Plantel VALUES (22,8)
INSERT INTO HoqueiPortugues.Plantel VALUES (23,9)
INSERT INTO HoqueiPortugues.Plantel VALUES (24,11)
INSERT INTO HoqueiPortugues.Plantel VALUES (25,13)
INSERT INTO HoqueiPortugues.Plantel VALUES (26,12)
INSERT INTO HoqueiPortugues.Plantel VALUES (27,10)
INSERT INTO HoqueiPortugues.Plantel VALUES (28,14)
--Teste (1vs6)
-- INSERT INTO HoqueiPortugues.Plantel VALUES (29,1)
-- INSERT INTO HoqueiPortugues.Plantel VALUES (30,6)
go

/*Jogos insertion*/

--Jornada 1
INSERT INTO HoqueiPortugues.Jogo VALUES (1, 1, 3, 1, '2022-09-01 21:00:00', 1, 2, 2, 1, 2, 1);
INSERT INTO HoqueiPortugues.Jogo VALUES (2, 1, 2, 0, '2022-09-01 21:00:00', 3, 4, 4, 3, 4, 1);
INSERT INTO HoqueiPortugues.Jogo VALUES (3, 1, 5, 1, '2022-09-01 21:00:00', 5, 6, 6, 5, 6, 1);
INSERT INTO HoqueiPortugues.Jogo VALUES (4, 1, 2, 1, '2022-09-01 21:00:00', 7, 8, 8, 7, 8, 1);
INSERT INTO HoqueiPortugues.Jogo VALUES (5, 1, 3, 4, '2022-09-01 21:00:00', 9, 10, 10, 9, 10, 1);
INSERT INTO HoqueiPortugues.Jogo VALUES (6, 1, 1, 3, '2022-09-01 21:00:00', 11, 12, 12, 11, 12, 1);
INSERT INTO HoqueiPortugues.Jogo VALUES (7, 1, 10, 0, '2022-09-01 21:00:00', 13, 14, 14, 13, 14, 1);
go

--Jornada 2
INSERT INTO HoqueiPortugues.Jogo VALUES (8, 2, 2, 1, '2022-09-08 21:00:00', 1, 3, 3, 15, 16, 1);
INSERT INTO HoqueiPortugues.Jogo VALUES (9, 2, 2, 4, '2022-09-08 21:00:00', 2, 4, 4, 17, 18, 1);
INSERT INTO HoqueiPortugues.Jogo VALUES (10, 2, 5, 7, '2022-09-08 21:00:00', 5, 7, 7, 19, 20, 1);
INSERT INTO HoqueiPortugues.Jogo VALUES (11, 2, 2, 4, '2022-09-08 21:00:00', 6, 8, 8, 21, 22, 1);
INSERT INTO HoqueiPortugues.Jogo VALUES (12, 2, 3, 4, '2022-09-08 21:00:00', 9, 11, 11, 23, 24, 1);
INSERT INTO HoqueiPortugues.Jogo VALUES (13, 2, 2, 3, '2022-09-08 21:00:00', 13, 12, 12, 25, 26, 1);
INSERT INTO HoqueiPortugues.Jogo VALUES (14, 2, 5, 3, '2022-09-08 21:00:00', 10, 14, 14, 27, 28, 1);
go

--Jornada 3
INSERT INTO HoqueiPortugues.Jogo VALUES (15, 3, null, null, '2022-09-15 21:00:00', 10, 8, 8, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (16, 3, null, null, '2022-09-15 21:00:00', 13, 5, 5, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (17, 3, null, null, '2022-09-15 21:00:00', 3, 12, 12, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (18, 3, null, null, '2022-09-15 21:00:00', 5, 11, 11, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (19, 3, null, null, '2022-09-15 21:00:00', 7, 2, 2, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (20, 3, null, null, '2022-09-15 21:00:00', 4, 9, 9, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (21, 3, null, null, '2022-09-15 21:00:00', 1, 6, 6, null, null, 0);
go

--Jornada 4
INSERT INTO HoqueiPortugues.Jogo VALUES (22, 4, null, null, '2022-09-22 21:00:00', 10, 3, 3, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (23, 4, null, null, '2022-09-22 21:00:00', 5, 13, 13, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (24, 4, null, null, '2022-09-22 21:00:00', 8, 7, 7, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (25, 4, null, null, '2022-09-22 21:00:00', 4, 14, 14, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (26, 4, null, null, '2022-09-22 21:00:00', 6, 11, 11, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (27, 4, null, null, '2022-09-22 21:00:00', 1, 12, 12, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (28, 4, null, null, '2022-09-22 21:00:00', 9, 2, 2, null, null, 0);
go

--Jornada 5
INSERT INTO HoqueiPortugues.Jogo VALUES (29, 5, null, null, '2022-09-29 21:00:00', 10, 14, 14, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (30, 5, null, null, '2022-09-29 21:00:00', 8, 12, 12, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (31, 5, null, null, '2022-09-29 21:00:00', 13, 11, 11, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (32, 5, null, null, '2022-09-29 21:00:00', 3, 2, 2, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (33, 5, null, null, '2022-09-29 21:00:00', 5, 9, 9, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (34, 5, null, null, '2022-09-29 21:00:00', 7, 6, 7, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (35, 5, null, null, '2022-09-29 21:00:00', 4, 1, 1, null, null, 0);
go

--Jornada 6
INSERT INTO HoqueiPortugues.Jogo VALUES (36, 6, null, null, '2022-10-06 21:00:00', 10, 2, 2, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (37, 6, null, null, '2022-10-06 21:00:00', 11, 9, 9, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (38, 6, null, null, '2022-10-06 21:00:00', 12, 6, 6, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (39, 6, null, null, '2022-10-06 21:00:00', 14, 1, 1, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (40, 6, null, null, '2022-10-06 21:00:00', 8 , 4, 4, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (41, 6, null, null, '2022-10-06 21:00:00', 13, 7, 7, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (42, 6, null, null, '2022-10-06 21:00:00', 5, 3, 3, null, null, 0);
go

--Jornada 7
INSERT INTO HoqueiPortugues.Jogo VALUES (43, 7, null, null, '2022-10-13 21:00:00', 10, 1, 1, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (44, 7, null, null, '2022-10-13 21:00:00', 6, 4, 4, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (45, 7, null, null, '2022-10-13 21:00:00', 9, 7, 7, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (46, 7, null, null, '2022-10-13 21:00:00', 2, 5, 5, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (47, 7, null, null, '2022-10-13 21:00:00', 11, 3, 3, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (48, 7, null, null, '2022-10-13 21:00:00', 12, 13, 13, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (49, 7, null, null, '2022-10-13 21:00:00', 14, 8, 8, null, null, 0);
go

--Jornada 8
INSERT INTO HoqueiPortugues.Jogo VALUES (50, 8, null, null, '2022-10-20 21:00:00', 10, 13, 13, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (51, 8, null, null, '2022-10-20 21:00:00', 3, 8, 8, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (52, 8, null, null, '2022-10-20 21:00:00', 5, 14, 14, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (53, 8, null, null, '2022-10-20 21:00:00', 7, 12, 12, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (54, 8, null, null, '2022-10-20 21:00:00', 4, 11, 11, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (55, 8, null, null, '2022-10-20 21:00:00', 2, 1, 1, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (56, 8, null, null, '2022-10-20 21:00:00', 6, 9, 9, null, null, 0);
go

--Jornada 9
INSERT INTO HoqueiPortugues.Jogo VALUES (57, 9, null, null, '2022-10-27 21:00:00', 10, 6, 6, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (58, 9, null, null, '2022-10-27 21:00:00', 9, 1, 1, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (59, 9, null, null, '2022-10-27 21:00:00', 2, 4, 4, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (60, 9, null, null, '2022-10-27 21:00:00', 11, 7, 7, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (61, 9, null, null, '2022-10-27 21:00:00', 12, 5, 5, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (62, 9, null, null, '2022-10-27 21:00:00', 14, 3, 3, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (63, 9, null, null, '2022-10-27 21:00:00', 8, 13, 13, null, null, 0);
go

--Jornada 10
INSERT INTO HoqueiPortugues.Jogo VALUES (64, 10, null, null, '2022-11-03 21:00:00', 10, 7, 7, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (65, 10, null, null, '2022-11-03 21:00:00', 4, 5, 5, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (66, 10, null, null, '2022-11-03 21:00:00', 1, 3, 3, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (67, 10, null, null, '2022-11-03 21:00:00', 6, 13, 13, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (68, 10, null, null, '2022-11-03 21:00:00', 9, 8, 8, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (69, 10, null, null, '2022-11-03 21:00:00', 2, 14, 14, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (70, 10, null, null, '2022-11-03 21:00:00', 12, 11, 11, null, null, 0);
go

--Jornada 11
INSERT INTO HoqueiPortugues.Jogo VALUES (71, 11, null, null, '2022-11-10 21:00:00', 10, 12, 12, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (72, 11, null, null, '2022-11-10 21:00:00', 14, 11, 11, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (73, 11, null, null, '2022-11-10 21:00:00', 8, 2, 2, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (74, 11, null, null, '2022-11-10 21:00:00', 13, 9, 9, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (75, 11, null, null, '2022-11-10 21:00:00', 3, 6, 6, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (76, 11, null, null, '2022-11-10 21:00:00', 5, 1, 1, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (77, 11, null, null, '2022-11-10 21:00:00', 7, 4, 4, null, null, 0);
go

--Jornada 12
INSERT INTO HoqueiPortugues.Jogo VALUES (78, 12, null, null, '2022-11-17 21:00:00', 10, 4, 4, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (79, 12, null, null, '2022-11-17 21:00:00', 1, 7, 7, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (80, 12, null, null, '2022-11-17 21:00:00', 6, 5, 5, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (81, 12, null, null, '2022-11-17 21:00:00', 9, 3, 3, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (82, 12, null, null, '2022-11-17 21:00:00', 2, 13, 13, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (83, 12, null, null, '2022-11-17 21:00:00', 11, 8, 8, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (84, 12, null, null, '2022-11-17 21:00:00', 12, 14, 14, null, null, 0);
go

--Jornada 13
INSERT INTO HoqueiPortugues.Jogo VALUES (85, 13, null, null, '2022-11-24 21:00:00', 10, 9, 9, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (86, 13, null, null, '2022-11-24 21:00:00', 2, 6, 6, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (87, 13, null, null, '2022-11-24 21:00:00', 11, 1, 1, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (88, 13, null, null, '2022-11-24 21:00:00', 12, 4, 4, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (89, 13, null, null, '2022-11-24 21:00:00', 14, 7, 7, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (90, 13, null, null, '2022-11-24 21:00:00', 8, 5, 5, null, null, 0);
INSERT INTO HoqueiPortugues.Jogo VALUES (91, 13, null, null, '2022-11-24 21:00:00', 13, 3, 3, null, null, 0);
go


/* Plantel_Jogadores insertion */
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (1, 1)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (1, 5)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (1, 6)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (1, 7)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (1, 8)
go

INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (2, 15)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (2, 19)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (2, 20)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (2, 21)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (2, 22)
go

INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (3, 29)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (3, 33)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (3, 34)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (3, 35)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (3, 36)
go

INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (4, 43)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (4, 47)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (4, 48)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (4, 49)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (4, 50)
go

INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (5, 57)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (5, 61)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (5, 62)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (5, 63)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (5, 64)
go

INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (6, 71)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (6, 75)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (6, 76)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (6, 77)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (6, 78)
go

INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (7, 85)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (7, 89)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (7, 90)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (7, 91)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (7, 92)
go

INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (8, 99)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (8, 103)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (8, 104)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (8, 105)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (8, 106)
go

INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (9, 113)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (9, 117)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (9, 118)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (9, 119)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (9, 120)
go

INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (10, 127)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (10, 131)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (10, 132)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (10, 133)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (10, 134)
go

INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (11, 141)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (11, 145)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (11, 146)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (11, 147)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (11, 148)
go

INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (12, 155)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (12, 159)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (12, 160)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (12, 161)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (12, 162)
go

INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (13, 169)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (13, 173)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (13, 174)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (13, 175)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (13, 176)
go

INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (14, 183)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (14, 187)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (14, 188)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (14, 189)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (14, 190)
go

INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (15, 1)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (15, 5)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (15, 6)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (15, 7)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (15, 8)
go

INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (16, 29)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (16, 33)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (16, 34)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (16, 35)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (16, 36)
go

INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (17, 15)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (17, 19)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (17, 20)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (17, 21)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (17, 22)
go

INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (18, 43)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (18, 47)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (18, 48)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (18, 49)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (18, 50)
go

INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (19, 57)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (19, 61)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (19, 62)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (19, 63)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (19, 64)
go

INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (20, 85)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (20, 89)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (20, 90)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (20, 91)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (20, 92)
go

INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (21, 71)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (21, 75)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (21, 76)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (21, 77)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (21, 78)
go

INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (22, 99)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (22, 103)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (22, 104)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (22, 105)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (22, 106)
go

INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (23, 113)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (23, 117)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (23, 118)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (23, 119)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (23, 120)
go

INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (24, 141)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (24, 145)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (24, 146)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (24, 147)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (24, 148)
go

INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (25, 169)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (25, 173)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (25, 174)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (25, 175)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (25, 176)
go

INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (26, 155)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (26, 159)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (26, 160)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (26, 161)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (26, 162)
go

INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (27, 127)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (27, 131)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (27, 132)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (27, 133)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (27, 134)
go

INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (28, 183)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (28, 187)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (28, 188)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (28, 189)
INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (28, 190)
go

-- --Clube 1 (Teste)
-- INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (29, 1)
-- INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (29, 5)
-- INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (29, 6)
-- INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (29, 7)
-- INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (29, 8)
-- go

-- --Clube 6 (Teste)
-- INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (30, 71)
-- INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (30, 75)
-- INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (30, 76)
-- INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (30, 77)
-- INSERT INTO HoqueiPortugues.Plantel_Jogadores VALUES (30, 78)


/*Insert Plantel_Treinadores*/
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (1, 1)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (1, 2)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (2, 3)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (2, 4)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (3, 5)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (3, 6)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (4, 7)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (4, 8)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (5, 9)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (5, 10)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (6, 11)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (6, 12)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (7, 13)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (7, 14)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (8, 15)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (8, 16)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (9, 17)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (9, 18)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (10, 19)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (10, 20)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (11, 21)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (11, 22)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (12, 23)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (12, 24)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (13, 25)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (13, 26)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (14, 27)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (14, 28)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (15, 1)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (15, 2)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (16, 5)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (16, 6)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (17, 3)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (17, 4)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (18, 7)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (18, 8)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (19, 9)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (19, 10)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (20, 13)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (20, 14)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (21, 11)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (21, 12)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (22, 15)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (22, 16)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (23, 17)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (23, 18)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (24, 21)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (24, 22)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (25, 25)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (25, 26)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (26, 23)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (26, 24)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (27, 19)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (27, 20)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (28, 27)
INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (28, 28)


--TESTE (1VS6)
-- INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (29, 1)
-- INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (29, 2)

-- INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (30, 11)
-- INSERT INTO HoqueiPortugues.Plantel_Treinadores VALUES (30, 12)


/*Insert é_arbitrado*/

--Jornada 1
--Jogo 1
INSERT INTO HoqueiPortugues.e_arbitrado VALUES (1, 1)
INSERT INTO HoqueiPortugues.e_arbitrado VALUES (2, 1)
--Jogo 2
INSERT INTO HoqueiPortugues.e_arbitrado VALUES (3, 2)
INSERT INTO HoqueiPortugues.e_arbitrado VALUES (4, 2)
--Jogo 3
INSERT INTO HoqueiPortugues.e_arbitrado VALUES (5, 3)
INSERT INTO HoqueiPortugues.e_arbitrado VALUES (6, 3)
--Jogo 4
INSERT INTO HoqueiPortugues.e_arbitrado VALUES (7, 4)
INSERT INTO HoqueiPortugues.e_arbitrado VALUES (8, 4)
--Jogo 5
INSERT INTO HoqueiPortugues.e_arbitrado VALUES (9, 5)
INSERT INTO HoqueiPortugues.e_arbitrado VALUES (10, 5)
--Jogo 6
INSERT INTO HoqueiPortugues.e_arbitrado VALUES (11, 6)
INSERT INTO HoqueiPortugues.e_arbitrado VALUES (12, 6)
--Jogo 7
INSERT INTO HoqueiPortugues.e_arbitrado VALUES (13, 7)
INSERT INTO HoqueiPortugues.e_arbitrado VALUES (14, 7)

--Jornada 2
--Jogo 8
INSERT INTO HoqueiPortugues.e_arbitrado VALUES (15, 8)
INSERT INTO HoqueiPortugues.e_arbitrado VALUES (16, 8)
--Jogo 9
INSERT INTO HoqueiPortugues.e_arbitrado VALUES (17, 9)
INSERT INTO HoqueiPortugues.e_arbitrado VALUES (18, 9)
--Jogo 10
INSERT INTO HoqueiPortugues.e_arbitrado VALUES (19, 10)
INSERT INTO HoqueiPortugues.e_arbitrado VALUES (20, 10)
--Jogo 11
INSERT INTO HoqueiPortugues.e_arbitrado VALUES (1, 11)
INSERT INTO HoqueiPortugues.e_arbitrado VALUES (2, 11)
--Jogo 12
INSERT INTO HoqueiPortugues.e_arbitrado VALUES (3, 12)
INSERT INTO HoqueiPortugues.e_arbitrado VALUES (4, 12)
--Jogo 13
INSERT INTO HoqueiPortugues.e_arbitrado VALUES (5, 13)
INSERT INTO HoqueiPortugues.e_arbitrado VALUES (6, 13)
--Jogo 14
INSERT INTO HoqueiPortugues.e_arbitrado VALUES (7, 14)
INSERT INTO HoqueiPortugues.e_arbitrado VALUES (8, 14)
go


/*Insert Jogador_GuardaRedes*/

--Clube 1
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (1, 2, 3, 5)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (2, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (3, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (4, 0, 0, 0)

--Clube 2
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (15, 7, 4, 2)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (16, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (17, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (18, 0, 0, 0)

--Clube 3
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (29, 1, 3, 5)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (30, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (31, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (32, 0, 0, 0)

--Clube 4
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (43, 4, 1, 1)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (44, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (45, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (46, 0, 0, 0)

--Clube 5
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (57, 8, 3, 2)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (58, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (59, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (60, 0, 0, 0)

--Clube 6
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (71, 9, 2, 4)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (72, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (73, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (74, 0, 0, 0)

--Clube 7

INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (85, 6, 3, 1)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (86, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (87, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (88, 0, 0, 0)

--Clube 8
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (99, 4, 1, 0)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (100, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (101, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (102, 0, 0, 0)

--Clube 9
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (113, 8, 2, 1)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (114, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (115, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (116, 0, 0, 0)

--Clube 10
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (127, 6, 3, 0)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (128, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (129, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (130, 0, 0, 0)

--Clube 11
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (141, 6, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (142, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (143, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (144, 0, 0, 0)

--Clube 12
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (155, 3, 3, 5)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (156, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (157, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (158, 0, 0, 0)

--Clube 13
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (169, 3, 1, 4)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (170, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (171, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (172, 0, 0, 0)

--Clube 14
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (183, 15, 1, 2)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (184, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (185, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_GuardaRedes VALUES (186, 0, 0, 0)


/*Insert Jogador_Campo*/
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (5, 2, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (6, 1, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (7, 1, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (8, 1, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (9, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (10, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (11, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (12, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (13, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (14, 0, 0, 0, 0)

INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (19, 2, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (20, 1, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (21, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (22, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (23, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (24, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (25, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (26, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (27, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (28, 0, 0, 0, 0)

INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (33, 2, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (34, 1, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (35, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (36, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (37, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (38, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (39, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (40, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (41, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (42, 0, 0, 0, 0)

INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (47, 2, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (48, 1, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (49, 1, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (50, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (51, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (52, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (53, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (54, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (55, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (56, 0, 0, 0, 0)


INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (61, 5, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (62, 1, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (63, 1, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (64, 1, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (65, 1, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (66, 1, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (67, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (68, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (69, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (70, 0, 0, 0, 0)

INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (75, 2, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (76, 1, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (77, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (78, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (79, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (80, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (81, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (82, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (83, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (84, 0, 0, 0, 0)

INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (89, 5, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (90, 1, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (91, 1, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (92, 1, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (93, 1, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (94, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (95, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (96, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (97, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (98, 0, 0, 0, 0)

INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (103, 2, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (104, 1, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (105, 1, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (106, 1, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (107, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (108, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (109, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (110, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (111, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (112, 0, 0, 0, 0)

INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (117, 5, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (118, 1, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (119, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (120, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (121, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (122, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (123, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (124, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (125, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (126, 0, 0, 0, 0)

INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (131, 5, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (132, 1, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (133, 1, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (134, 1, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (135, 1, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (136, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (137, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (138, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (139, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (140, 0, 0, 0, 0)

INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (145, 2, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (146, 1, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (147, 1, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (148, 1, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (149, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (150, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (151, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (152, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (153, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (154, 0, 0, 0, 0)

INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (159, 3, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (160, 1, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (161, 1, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (162, 1, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (163, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (164, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (165, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (166, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (167, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (168, 0, 0, 0, 0)

INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (173, 5, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (174, 5, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (175, 1, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (176, 1, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (177, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (178, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (179, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (180, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (181, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (182, 0, 0, 0, 0)

INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (187, 2, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (188, 1, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (189, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (190, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (191, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (192, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (193, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (194, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (195, 0, 0, 0, 0)
INSERT INTO HoqueiPortugues.Jogador_Campo VALUES (196, 0, 0, 0, 0)