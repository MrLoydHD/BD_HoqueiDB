using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Final_Project
{
    public class Jogador
    {
        private String _nome, _idade, _posicao, _nacionalidade, _num_camisola;
        private int _id;

        public String Nome { get => _nome; set => _nome = value; }
        public int ID { get => _id; set => _id = value; }

        public String Idade { get => _idade; set => _idade = value; }

        public String Posicao { get => _posicao; set => _posicao = value; }

        public String Nacionalidade { get => _nacionalidade; set => _nacionalidade = value; }

        public String Num_camisola { get => _num_camisola; set => _num_camisola = value; }

        public Jogador(int id, string nome)
        {
            ID = id;
            Nome = nome;
        }
        public override String ToString()
        {
            return Nome;
        }
    }

}
