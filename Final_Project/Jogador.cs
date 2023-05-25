using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Final_Project
{
    public class Jogador
    {
        private String _nome;
        private int _id;

        public String Nome { get => _nome; set => _nome = value; }
        public int ID { get => _id; set => _id = value; }

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
