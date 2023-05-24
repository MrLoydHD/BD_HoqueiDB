using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Final_Project
{
    class JogoInfo
    {
        private String _ID, _jornada, _resultado_F, _resultado_C,  _nomeClubeCasa, _idClubeCasa, _nomeClubeFora, _idClubeFora, _nomePavilhao, _treinadorCasaNome, _treinadorForaNome, _arbitroNome, _data_hora, _nomeJogador, _posicaoJogador, _nomeTreinador, _tipo_treinador;

        public String ID
        {
            get => _ID; set => _ID = value;
        }

        public String Jornada { get => _jornada; set => _jornada = value; }

        public String Resultado_F { get => _resultado_F; set => _resultado_F = value; }

        public String Resultado_C { get => _resultado_C; set => _resultado_C = value; }

        public String Data_hora { get => _data_hora; set => _data_hora = value; }

        public String ClubeCasaID { get => _idClubeCasa; set => _idClubeCasa = value; }

        public String ClubeForaID { get => _idClubeFora; set => _idClubeFora = value; }

        public String NomeClubeCasa { get => _nomeClubeCasa; set => _nomeClubeCasa = value; }

        public String NomeClubeFora { get => _nomeClubeFora; set => _nomeClubeFora = value; }

        public String NomePavilhao { get => _nomePavilhao; set => _nomePavilhao = value; }

        public String TreinadorCasaNome { get => _treinadorCasaNome; set => _treinadorCasaNome = value; }

        public String TreinadorForaNome { get => _treinadorForaNome; set => _treinadorForaNome = value; }

        public String ArbitroNome { get => _arbitroNome; set => _arbitroNome = value; }

        public String NomeJogador { get => _nomeJogador; set => _nomeJogador = value; }

        public String PosicaoJogador { get => _posicaoJogador; set => _posicaoJogador = value; }

        public String NomeTreinador { get => _nomeTreinador; set => _nomeTreinador = value; }

        public String Tipo_treinador { get => _tipo_treinador; set => _tipo_treinador = value; }
    }
}
