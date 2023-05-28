using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Final_Project
{
    internal class Tecnico
    {
        private int _id;
        private string _nome;

        public Tecnico(int idTecnico, string nomeTecnico)
        {
            ID = idTecnico;
            Nome = nomeTecnico;
        }

        public String Nome { get => _nome; set => _nome = value; }

        public int ID { get => _id; set => _id = value; }

        public override String ToString()
        {
            return Nome;
        }
    }
}
