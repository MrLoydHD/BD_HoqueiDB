using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Final_Project
{
    internal class ButtonData
    {
        private int _idJogo;
        private int _idClube;

        public ButtonData(int jogoID, int clubeID)
        {
            this._idClube = clubeID;
            this._idJogo = jogoID;
        }

        public int IDJogo { get => _idJogo; set => _idJogo = value; }
        public int IDClube { get => _idClube; set => _idClube = value; }
    }
}
