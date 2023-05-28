using System.Security.Cryptography;
using System;

namespace Final_Project
{
    internal class Treinador
    {
        private int _id;
        private string _nome, _idade, _tipo_treinador, _nacionalidade;

        public Treinador(int idTreinador, string nomeTreinador)
        {
            ID = idTreinador;
            Nome = nomeTreinador;
        }

        public String Nome { get => _nome; set => _nome = value; }
        public int ID { get => _id; set => _id = value; }

        public String Idade { get => _idade; set => _idade = value; }

        public String Tipo_treinador { get => _tipo_treinador; set => _tipo_treinador = value; }

        public String Nacionalidade { get => _nacionalidade; set => _nacionalidade = value; }


        public override String ToString()
        {
            return Nome;
        }
    }
}