using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;

namespace Final_Project
{
    internal class Equipa
    {
        private string _id, _nome, _anoFundacao, _pavilhao;
        private List<String> _jogadores, _treinadores;

        public Equipa(string id, string nome)
        {
            _id = id;
            _nome = nome;
        }

        public string ID
        {
            get => _id; set => _id = value;
        }

        public string Nome
        {
            get => _nome; set => _nome = value;
        }

        public List<String> Jogadores
        {
            get => _jogadores; set => _jogadores = value;
        }
        public List<String> Treinadores { 
            get => _treinadores; set => _treinadores = value; 
        }
        public string AnoFundacao
        {
            get => _anoFundacao; set => _anoFundacao = value;
        }

        public string Pavilhao
        {
            get => _pavilhao; set => _pavilhao = value;
        }

        public override string ToString()
        {
            return Nome;
        }
    }
}
