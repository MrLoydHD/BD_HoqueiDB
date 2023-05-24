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
    public partial class Main_Admin : Form
    {
        private SqlConnection cn;
        public Main_Admin()
        {
            InitializeComponent();
        }

        private void Main_Admin_Load(object sender, EventArgs e)
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
            panelCalendario.Visible = false;
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

        private void logOut_button_Click(object sender, EventArgs e)
        {
            new Login_Register().Show();
            this.Hide();
        }

        private void calendario_button_Click(object sender, EventArgs e)
        {
            panelClassificacao.Visible = false;
            panelCalendario.Visible = true;
            loadJornada(0);
        }

        private void loadJornada(int jornadaSelecionada)
        {
            cn = getSGBDConnection();

            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand("SELECT Jogo.ID, Jogo.Jornada, Jogo.Resultado_F, Jogo.Resultado_C, Jogo.Data_hora, Jogo.Pavilhao_ID, Jogo.Plantel_F_ID, Jogo.Plantel_C_ID, Jogo.JogoRealizado, ClubeCasa.Nome AS NomeClubeCasa, ClubeFora.Nome AS NomeClubeFora FROM HoqueiPortugues.Jogo JOIN HoqueiPortugues.Clube AS ClubeCasa ON Jogo.Clube_C_ID = ClubeCasa.ID JOIN HoqueiPortugues.Clube AS ClubeFora ON Jogo.Clube_F_ID = ClubeFora.ID WHERE Jornada=@jornada", cn);

            cmd.Parameters.AddWithValue("@jornada", jornadaSelecionada);

            SqlDataReader reader = cmd.ExecuteReader();

            List<TextBox> clubesCasa = new List<TextBox>() { clubeC_1_J1, clubeC_2_J1, clubeC_3_J1, clubeC_4_J1, clubeC_5_J1, clubeC_6_J1, clubeC_7_J1 };
            List<TextBox> clubesFora = new List<TextBox>() { clubeF_1_J1, clubeF_2_J1, clubeF_3_J1, clubeF_4_J1, clubeF_5_J1, clubeF_6_J1, clubeF_7_J1 };
            List<TextBox> clubesCasa_res = new List<TextBox>() { clubeC_1_J1_res, clubeC_2_J1_res, clubeC_3_J1_res, clubeC_4_J1_res, clubeC_5_J1_res, clubeC_6_J1_res, clubeC_7_J1_res };
            List<TextBox> clubesFora_res = new List<TextBox>() { clubeF_1_J1_res, clubeF_2_J1_res, clubeF_3_J1_res, clubeF_4_J1_res, clubeF_5_J1_res, clubeF_6_J1_res, clubeF_7_J1_res };
            List<Button> detalhes_buttons = new List<Button>() { detalhes_jogo1, detalhes_jogo2, detalhes_jogo3, detalhes_jogo4, detalhes_jogo5, detalhes_jogo6, detalhes_jogo7 };
            List<Button> adicionar_buttons = new List<Button>() { adicionarJogo1_button, adicionarJogo2_button, adicionarJogo3_button, adicionarJogo4_button, adicionarJogo5_button, adicionarJogo6_button, adicionarJogo7_button };

            int i = 0;

            while (reader.Read())
            {
                Jogo J = new Jogo();
                J.ID = reader["ID"].ToString();
                J.Jornada_num = reader["Jornada"].ToString();
                J.Resultado_C = reader["Resultado_C"].ToString();
                J.Resultado_F = reader["Resultado_F"].ToString();
                J.Data_hora = reader["Data_hora"].ToString();
                J.Clube_C_name = reader["NomeClubeCasa"].ToString();
                J.Clube_F_name = reader["NomeClubeFora"].ToString();
                J.JogoRealizado = (bool)reader["JogoRealizado"];

                jornada1_textBox.Text = "Jornada " + J.Jornada_num;
                data1_textBox.Text = J.Data_hora;

                if (i < 7)
                {
                    clubesCasa[i].Text = J.Clube_C_name;
                    clubesFora[i].Text = J.Clube_F_name;

                    clubesCasa_res[i].Text = J.Resultado_C;
                    clubesFora_res[i].Text = J.Resultado_F;

                    detalhes_buttons[i].Tag = J.ID;

                    if (!J.JogoRealizado)
                    {
                        adicionar_buttons[i].Visible = true;
                        adicionar_buttons[i].Tag = J.ID;
                    }
                }

                i++;
            }

            cn.Close();
        }


        private void jogadores_Click(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (int.TryParse(comboBox1.SelectedItem.ToString(), out int jornadaSelecionada))
            {
                label1.Visible = true;
                label2.Visible = true;
                label3.Visible = true;
                label4.Visible = true;
                label5.Visible = true;
                label6.Visible = true;
                label7.Visible = true;
                detalhes_jogo1.Visible = true;
                detalhes_jogo2.Visible = true;
                detalhes_jogo3.Visible = true;
                detalhes_jogo4.Visible = true;
                detalhes_jogo5.Visible = true;
                detalhes_jogo6.Visible = true;
                detalhes_jogo7.Visible = true;
                loadJornada(jornadaSelecionada);
            }
            else
            {
                MessageBox.Show("Seleção inválida.");
            }
        }

        private void detalhesButtons_Click(object sender, EventArgs e)
        {
            Button detalhesButton = (Button)sender;
            int jogoID = int.Parse(detalhesButton.Tag.ToString());

            panelClassificacao.Visible = false;
            panelCalendario.Visible = false;
            panelDetalhes.Visible = true;
            loadDetalhesJogo(jogoID);
        }

        private void loadDetalhesJogo(int jogoID)
        {
            cn = getSGBDConnection();

            if (!verifySGBDConnection())
                return;

            SqlConnection cn1 = getSGBDConnection();
            cn1.Open();

            SqlConnection cn2 = getSGBDConnection();
            cn2.Open();

            SqlCommand cmd = new SqlCommand("spGetJogoDetalhes", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@jogoID", jogoID);

            SqlDataReader reader = cmd.ExecuteReader();

            SqlCommand cmd1 = new SqlCommand("spGetJogadores", cn1);
            cmd1.CommandType = CommandType.StoredProcedure;

            cmd1.Parameters.AddWithValue("@jogoID", jogoID);

            SqlDataReader reader1 = cmd1.ExecuteReader();

            SqlCommand cmd2 = new SqlCommand("spGetTreinadores", cn2);
            cmd2.CommandType = CommandType.StoredProcedure;

            cmd2.Parameters.AddWithValue("@jogoID", jogoID);

            SqlDataReader reader2 = cmd2.ExecuteReader();

            List<TextBox> arbitros_textbox = new List<TextBox>() { arbitro1_textBox, arbitro2_textbox };
            List<TextBox> jogadoresCasa_textbox = new List<TextBox>() { jogador1_casa_textbox, jogador2_casa_textbox, jogador3_casa_textbox, jogador4_casa_textbox };
            List<TextBox> jogadoresFora_textbox = new List<TextBox>() { jogador1_fora_textbox, jogador2_fora_textbox, jogador3_fora_textbox, jogador4_fora_textbox };

            int i = 0;

            while (reader.Read())
            {
                JogoInfo J = new JogoInfo();
                J.ID = reader["ID"].ToString();
                J.Jornada = reader["Jornada"].ToString();
                J.Resultado_C = reader["Resultado_C"].ToString();
                J.Resultado_F = reader["Resultado_F"].ToString();
                J.Data_hora = reader["Data_hora"].ToString();
                J.NomeClubeCasa = reader["NomeClubeCasa"].ToString();
                J.NomeClubeFora = reader["NomeClubeFora"].ToString();
                J.NomePavilhao = reader["NomePavilhao"].ToString();
                J.ArbitroNome = reader["ArbitroNome"].ToString();
                J.ClubeCasaID = reader["ClubeCasaID"].ToString();
                J.ClubeForaID = reader["ClubeForaID"].ToString();

                arbitros_textbox[i].Text = J.ArbitroNome;
                dataHora_textbox.Text = J.Data_hora;
                jornada_textbox.Text = J.Jornada;
                pavilhao_textbox.Text = J.NomePavilhao;
                clubeCasa_textbox.Text = J.NomeClubeCasa;
                clubeFora_textbox.Text = J.NomeClubeFora;
                resultadoCasa_textbox.Text = J.Resultado_C;
                resultadoFora_textbox.Text = J.Resultado_F;

                int c = 0;
                int f = 0;

                while (reader1.Read())
                {
                    J.NomeJogador = reader1["NomeJogador"].ToString();
                    J.PosicaoJogador = reader1["Posicao"].ToString();

                    if (J.ClubeCasaID == reader1["ClubeID"].ToString() && J.PosicaoJogador == "Jogador de Campo")
                    {
                        jogadoresCasa_textbox[c].Text = J.NomeJogador;
                        c++;
                    }
                    else if(J.ClubeCasaID == reader1["ClubeID"].ToString() && J.PosicaoJogador == "Guarda-Redes")
                    {
                        jogador5_casa_textbox.Text = J.NomeJogador;
                    }
                    else if(J.ClubeForaID == reader1["ClubeID"].ToString() && J.PosicaoJogador == "Jogador de Campo")
                    {
                        jogadoresFora_textbox[f].Text = J.NomeJogador;
                        f++;
                    }
                    else
                    {
                        jogador5_fora_textbox.Text = J.NomeJogador;
                    }
                }

                while (reader2.Read())
                {
                    J.NomeTreinador = reader2["NomeTreinador"].ToString();
                    J.Tipo_treinador = reader2["Tipo_treinador"].ToString();

                    if (J.ClubeCasaID == reader2["ClubeID"].ToString() && J.Tipo_treinador == "Principal")
                    {
                        treinador_casa_textbox.Text = J.NomeTreinador;
                    }
                    else if (J.ClubeCasaID == reader2["ClubeID"].ToString() && J.Tipo_treinador == "Adjunto")
                    {
                        treinadorAd_casa_textbox.Text = J.NomeTreinador;
                    }
                    else if (J.ClubeForaID == reader2["ClubeID"].ToString() && J.Tipo_treinador == "Principal")
                    {
                        treinador_fora_textbox.Text = J.NomeTreinador;
                    }
                    else
                    {
                        treinadorAd_fora_textbox.Text = J.NomeTreinador;
                    }
                }

                i++;
            }

            cn.Close();
            cn1.Close();
            cn2.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            panelClassificacao.Visible = false;
            panelDetalhes.Visible = false;
            panelCalendario.Visible = true;
            loadJornada(0);
        }
    }
}
