using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Final_Project
{
    class Jogo
    {
        private String _ID, _jornada_num, _resultado_F, _resultado_C, _data_hora, _clube_F_ID, _clube_C_ID, _clube_C_name, _clube_F_name;
        private bool _jogoRealizado;
        public String ID { 
            get => _ID; set => _ID = value; }

        public String Jornada_num { get => _jornada_num; set => _jornada_num = value; }

        public String Resultado_F { get => _resultado_F; set => _resultado_F = value; }

        public String Resultado_C { get => _resultado_C; set => _resultado_C = value; }

        public String Data_hora { get => _data_hora; set => _data_hora = value; }

        public String Clube_F_ID { get => _clube_F_ID; set => _clube_F_ID = value; }

        public String Clube_C_ID { get => _clube_C_ID; set => _clube_C_ID = value; }

        public String Clube_C_name { get => _clube_C_name; set => _clube_C_name = value; }

        public String Clube_F_name { get => _clube_F_name; set => _clube_F_name = value; }

        public bool JogoRealizado { get => _jogoRealizado; set => _jogoRealizado = value; }
    }
}
