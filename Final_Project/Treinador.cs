using System.Security.Cryptography;
using System;

namespace Final_Project
{
    internal class Treinador
    {
        private int _id;
        private string _nome;

        public Treinador(int idTreinador, string nomeTreinador)
        {
            ID = idTreinador;
            Nome = nomeTreinador;
        }

        public String Nome { get => _nome; set => _nome = value; }
        public int ID { get => _id; set => _id = value; }

        public override String ToString()
        {
            return Nome;
        }
    }
}