using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Final_Project
{
    public partial class Main : Form
    {
        //List<Panel> listPanel = new List<Panel>();
        private SqlConnection cn;
        public Main()
        {
            InitializeComponent();
        }

        private void Main_Load(object sender, EventArgs e)
        {
            cn = getSGBDConnection();

            if (!verifySGBDConnection())
                return;

            //listPanel.Add(panelInicial);
            //listPanel.Add(panelClassificacao);
            //listPanel[0].BringToFront();

            cn.Close();
        }

        private SqlConnection getSGBDConnection()
        {
            return new SqlConnection("data source= tcp:mednat.ieeta.pt\\SQLSERVER,8101;initial catalog=p4g7;uid=p4g7;password=2040900925@HJ");
        }

        private bool verifySGBDConnection()
        {
            if (cn == null)
                cn = getSGBDConnection();

            if (cn.State != ConnectionState.Open)
                cn.Open();

            return cn.State == ConnectionState.Open;
        }

        private void classificacaoButton_Click(object sender, EventArgs e)
        {
            panelClassificacao.Visible = true;
            loadClassificacao();
        }

        private void loadClassificacao()
        {
            cn = getSGBDConnection();
            cn.Open();

            using (SqlCommand command = new SqlCommand("HoqueiPortugues.calcularClassificacao", cn))
            {
                command.CommandType = CommandType.StoredProcedure;

                SqlDataReader reader = command.ExecuteReader();

                DataTable dataTable = new DataTable();

                // Adicionar coluna "Posição"
                dataTable.Columns.Add("Posição", typeof(int));

                dataTable.Load(reader);

                // Preencher coluna "Posição" com números das linhas
                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
                    dataTable.Rows[i]["Posição"] = i + 1;
                }

                dataGridView1.DataSource = dataTable;
            }

            // Renomear colunas e alterar largura
            dataGridView1.Columns[0].HeaderText = "Posição";
            dataGridView1.Columns[1].HeaderText = "Equipa";
            dataGridView1.Columns[2].HeaderText = "Jogos";
            dataGridView1.Columns[3].HeaderText = "Pontos";
            dataGridView1.Columns[4].HeaderText = "Vitórias";
            dataGridView1.Columns[5].HeaderText = "Empates";
            dataGridView1.Columns[6].HeaderText = "Derrotas";
            dataGridView1.Columns[7].HeaderText = "Golos Marcados";
            dataGridView1.Columns[8].HeaderText = "Golos Sofridos";
            dataGridView1.Columns[9].HeaderText = "Diferença de Golos";
            dataGridView1.Columns[0].Width = 60;
            dataGridView1.Columns[2].Width = 60;
            dataGridView1.Columns[3].Width = 60;
            dataGridView1.Columns[4].Width = 60;
            dataGridView1.Columns[5].Width = 60;
            dataGridView1.Columns[6].Width = 60;

            cn.Close();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void logOut_button_Click(object sender, EventArgs e)
        {
            new Login_Register().Show();
            this.Hide();
        }
    }
}
