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
using System.Collections;

namespace Final_Project
{
    public partial class Main_Client : Form
    {
        private SqlConnection cn;
        public Main_Client()
        {
            InitializeComponent();
        }

        private void Main_Client_Load(object sender, EventArgs e)
        {
            cn = getSGBDConnection();

            if (!verifySGBDConnection())
                return;

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
            panelDetalhes.Visible = false;
            panelEquipas.Visible = false;
            panelJogadores.Visible = false;
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

                reader.Close();

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
            panelCalendario.Visible = true;
            panelDetalhes.Visible = false;
            panelEquipas.Visible = false;
            panelClassificacao.Visible = false;
            panelJogadores.Visible = false;
            loadJornada(0);
        }

        private void loadJornada(int jornadaSelecionada)
        {
            button1.Tag = jornadaSelecionada;

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
                        detalhes_buttons[i].Visible = false;
                    }
                    else
                    {
                        detalhes_buttons[i].Visible = true;
                    }
                }

                i++;
            }

            reader.Close();
            cn.Close();
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

            panelCalendario.Visible = false;
            panelDetalhes.Visible = true;
            panelEquipas.Visible = false;
            panelClassificacao.Visible = false;
            panelJogadores.Visible = false;
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

            SqlCommand cmd = new SqlCommand("SELECT * FROM HoqueiPortugues.fnConsultarJogo(@Jogo_ID)", cn);

            cmd.Parameters.AddWithValue("@Jogo_ID", jogoID);

            SqlDataReader reader = cmd.ExecuteReader();

            SqlCommand cmd1 = new SqlCommand("SELECT * FROM HoqueiPortugues.fnObterJogadoresPorJogo(@Jogo_ID)", cn1);

            cmd1.Parameters.AddWithValue("@Jogo_ID", jogoID);

            SqlDataReader reader1 = cmd1.ExecuteReader();

            SqlCommand cmd2 = new SqlCommand("SELECT * FROM HoqueiPortugues.fnObterTreinadoresPorJogo(@Jogo_ID)", cn2);

            cmd2.Parameters.AddWithValue("@Jogo_ID", jogoID);

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
                    else if (J.ClubeCasaID == reader1["ClubeID"].ToString() && J.PosicaoJogador == "Guarda-Redes")
                    {
                        jogador5_casa_textbox.Text = J.NomeJogador;
                    }
                    else if (J.ClubeForaID == reader1["ClubeID"].ToString() && J.PosicaoJogador == "Jogador de Campo")
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

            reader.Close();
            reader1.Close();
            reader2.Close();
            cn.Close();
            cn1.Close();
            cn2.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Button retrocederParaCalendario = (Button)sender;
            int jornada = int.Parse(retrocederParaCalendario.Tag.ToString());
            panelCalendario.Visible = true;
            panelDetalhes.Visible = false;
            panelEquipas.Visible = false;
            panelClassificacao.Visible = false;
            panelJogadores.Visible = false;
            loadJornada(jornada);
        }


        private void Equipa_button_Click(object sender, EventArgs e)
        {
            panelEquipas.Visible = true;
            panelJogadores.Visible = false;
            panelClassificacao.Visible = false;
            panelCalendario.Visible = false;
            panelDetalhes.Visible = false;
            equipasEquipa_button.Visible = false;
            equipasTecnicos_button.Visible = false;
            equipasJogos_button.Visible = false;
            label56.Visible = false;
            label57.Visible = false;
            textboxNomeEquipa.Text = "";
            pavilhaoNome_textbox.Text = "";
            anoFundacao_textbox.Text = "";
            dataGridViewJogosEquipa.Visible = false;
            dataGridViewJC.Visible = false;
            dataGridViewGR.Visible = false;
            dataGridViewT.Visible = false;
            jogadoresCampo_label.Visible = false;
            guardaRedes_label.Visible = false;
            treinadores_label.Visible = false;
            tecnicos_label.Visible = false;
            dataGridViewTec.Visible = false;
            loadEquipas();
        }

        private int currentClube;
        private void loadEquipas()
        {
            cn = getSGBDConnection();

            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand("SELECT Clube.ID AS ClubeID, Clube.Nome AS ClubeNome, Clube.Ano_fund AS AnoFund, Pavilhao.Nome AS PavilhaoNome FROM HoqueiPortugues.Clube JOIN HoqueiPortugues.Pavilhao ON Clube.ID=Pavilhao.Clube_ID", cn);
            SqlDataReader reader = cmd.ExecuteReader();
            listBoxEquipas.Items.Clear();

            while (reader.Read())
            {
                Equipa E = new Equipa(reader["ClubeID"].ToString(), reader["ClubeNome"].ToString());
                E.ID = reader["ClubeID"].ToString();
                E.Nome = reader["ClubeNome"].ToString();
                E.AnoFundacao = reader["AnoFund"].ToString();
                E.Pavilhao = reader["PavilhaoNome"].ToString();

                listBoxEquipas.Items.Add(E);
            }

            currentClube = 0;
            cn.Close();
        }

        private void listBoxEquipas_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (listBoxEquipas.SelectedIndex > 0)
            {
                currentClube = listBoxEquipas.SelectedIndex;
            }
            equipasEquipa_button.Visible = true;
            equipasTecnicos_button.Visible = true;
            equipasJogos_button.Visible = true;
            label56.Visible = true;
            label57.Visible = true;
            dataGridViewJogosEquipa.Visible = false;
            jogadoresCampo_label.Visible = false;
            guardaRedes_label.Visible = false;
            treinadores_label.Visible = false;
            dataGridViewJC.Visible = false;
            dataGridViewGR.Visible = false;
            dataGridViewT.Visible = false;
            tecnicos_label.Visible = false;
            dataGridViewTec.Visible = false;
            textboxNomeEquipa.Text = ((Equipa)listBoxEquipas.SelectedItem).Nome;
            anoFundacao_textbox.Text = ((Equipa)listBoxEquipas.SelectedItem).AnoFundacao;
            pavilhaoNome_textbox.Text = ((Equipa)listBoxEquipas.SelectedItem).Pavilhao;
        }

        private void equipasJogos_button_Click(object sender, EventArgs e)
        {
            dataGridViewJogosEquipa.Visible = true;
            dataGridViewJC.Visible = false;
            dataGridViewGR.Visible = false;
            dataGridViewT.Visible = false;
            jogadoresCampo_label.Visible = false;
            guardaRedes_label.Visible = false;
            treinadores_label.Visible = false;
            tecnicos_label.Visible = false;
            dataGridViewTec.Visible = false;

            int clubeID = Int32.Parse(((Equipa)listBoxEquipas.SelectedItem).ID);

            cn = getSGBDConnection();
            cn.Open();

            using (SqlCommand command = new SqlCommand("SELECT * FROM HoqueiPortugues.fnVerCalendarioEquipa(@Clube_ID)", cn))
            {
                command.Parameters.AddWithValue("@Clube_ID", clubeID);

                SqlDataReader reader = command.ExecuteReader();

                DataTable dataTable = new DataTable();

                dataTable.Load(reader);

                reader.Close();

                dataGridViewJogosEquipa.DataSource = dataTable;
            }

            cn.Close();
        }

        private void equipasEquipa_button_Click(object sender, EventArgs e)
        {
            dataGridViewJogosEquipa.Visible = false;
            dataGridViewJC.Visible = true;
            dataGridViewGR.Visible = true;
            dataGridViewT.Visible = true;
            jogadoresCampo_label.Visible = true;
            guardaRedes_label.Visible = true;
            treinadores_label.Visible = true;
            tecnicos_label.Visible = false;
            dataGridViewTec.Visible = false;

            loadClubeEquipa();
        }

        private void loadClubeEquipa()
        {
            cn = getSGBDConnection();

            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand("SELECT Jogador.Nome, Jogador.Idade, Jogador.Nacionalidade, Jogador.Num_camisola FROM HoqueiPortugues.Jogador INNER JOIN HoqueiPortugues.Jogador_Campo ON Jogador.ID = Jogador_Campo.Jogador_ID WHERE Jogador.Clube_ID = @Clube_ID", cn);
            cmd.Parameters.AddWithValue("@Clube_ID", ((Equipa)listBoxEquipas.SelectedItem).ID);
            SqlDataReader reader = cmd.ExecuteReader();

            DataTable dataTable = new DataTable();

            dataTable.Load(reader);

            reader.Close();

            dataGridViewJC.DataSource = dataTable;

            cn.Close();

            SqlConnection cn1 = getSGBDConnection();
            cn1.Open();

            if (!verifySGBDConnection())
                return;

            SqlCommand cmd1 = new SqlCommand("SELECT Jogador.Nome, Jogador.Idade, Jogador.Nacionalidade, Jogador.Num_camisola FROM HoqueiPortugues.Jogador INNER JOIN HoqueiPortugues.Jogador_GuardaRedes ON Jogador.ID = Jogador_GuardaRedes.Jogador_ID WHERE Jogador.Clube_ID = @Clube_ID", cn1);
            cmd1.Parameters.AddWithValue("@Clube_ID", ((Equipa)listBoxEquipas.SelectedItem).ID);
            SqlDataReader reader1 = cmd1.ExecuteReader();

            DataTable dataTable1 = new DataTable();

            dataTable1.Load(reader1);

            reader1.Close();

            dataGridViewGR.DataSource = dataTable1;

            cn1.Close();

            SqlConnection cn2 = getSGBDConnection();
            cn2.Open();

            if (!verifySGBDConnection())
                return;

            SqlCommand cmd2 = new SqlCommand("SELECT Treinador.Nome, Treinador.Idade, Treinador.Tipo_treinador, Treinador.Nacionalidade FROM HoqueiPortugues.Treinador WHERE Treinador.Clube_ID = @Clube_ID", cn2);
            cmd2.Parameters.AddWithValue("@Clube_ID", ((Equipa)listBoxEquipas.SelectedItem).ID);
            SqlDataReader reader2 = cmd2.ExecuteReader();

            DataTable dataTable2 = new DataTable();

            dataTable2.Load(reader2);

            reader2.Close();

            dataGridViewT.DataSource = dataTable2;

            cn2.Close();
        }

        private void equipasTecnicos_button_Click(object sender, EventArgs e)
        {
            dataGridViewJogosEquipa.Visible = false;
            dataGridViewJC.Visible = false;
            dataGridViewGR.Visible = false;
            dataGridViewT.Visible = false;
            jogadoresCampo_label.Visible = false;
            guardaRedes_label.Visible = false;
            treinadores_label.Visible = false;
            tecnicos_label.Visible = true;
            dataGridViewTec.Visible = true;

            loadTecnicos();
        }

        private void loadTecnicos()
        {
            SqlConnection cn3 = getSGBDConnection();

            if (!verifySGBDConnection())
                return;

            cn3.Open();

            SqlCommand cmd3 = new SqlCommand("SELECT Especialista_Tecnico.Nome, Especialista_Tecnico.Idade, Especialista_Tecnico.Especialidade, Especialista_Tecnico.Nacionalidade FROM HoqueiPortugues.Especialista_Tecnico WHERE Especialista_Tecnico.Clube_ID = @Clube_ID", cn3);
            cmd3.Parameters.AddWithValue("@Clube_ID", ((Equipa)listBoxEquipas.SelectedItem).ID);
            SqlDataReader reader3 = cmd3.ExecuteReader();

            DataTable dataTable3 = new DataTable();

            dataTable3.Load(reader3);

            reader3.Close();

            dataGridViewTec.DataSource = dataTable3;

            cn3.Close();
        }



        private void jogadores_Click(object sender, EventArgs e)
        {
            panelEquipas.Visible = false;
            panelJogadores.Visible = true;
            panelJogadoresCampo.Visible = false;
            panelVerGR.Visible = false;
            panelClassificacao.Visible = false;
            panelCalendario.Visible = false;
            panelDetalhes.Visible = false;
        }

        private void jogadoresJC_button_Click(object sender, EventArgs e)
        {
            panelJogadoresCampo.Visible = true;
            panelVerGR.Visible = false;
            nomeJC_texbox.Text = "";
            ordenarPorJC_comboBox.SelectedItem = null;
            clubeJC_comboBox.SelectedItem = null;
            nacionalidadeJC_comboBox.SelectedItem = null;
            nacionalidadeJC_comboBox.Items.Clear();
            clubeJC_comboBox.Items.Clear();

            SqlConnection cn = getSGBDConnection();
            cn.Open();

            SqlCommand cmd = new SqlCommand("SELECT DISTINCT J.Nacionalidade FROM HoqueiPortugues.Jogador AS J INNER JOIN HoqueiPortugues.Jogador_Campo AS JC ON J.ID = JC.Jogador_ID", cn);

            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                nacionalidadeJC_comboBox.Items.Add(reader["Nacionalidade"].ToString());
            }

            reader.Close();
            cn.Close();

            SqlConnection cn1 = getSGBDConnection();
            cn1.Open();

            SqlCommand cmd1 = new SqlCommand("SELECT Nome FROM HoqueiPortugues.Clube", cn1);

            SqlDataReader reader1 = cmd1.ExecuteReader();

            while (reader1.Read())
            {
                clubeJC_comboBox.Items.Add(reader1["Nome"].ToString());
            }

            reader1.Close();
            cn1.Close();

            loadJCDefault();
        }

        private void loadJCDefault()
        {
            cn = getSGBDConnection();

            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand("SELECT J.Nome AS JogadorNome, C.Nome AS ClubeNome, JC.Golos_marcados, JC.Assists, J.advertencias, J.cartoes_azuis, J.cartoes_vermelhos, JC.Penaltis_marcados, JC.Livres_diretos_marcados FROM HoqueiPortugues.Jogador AS J INNER JOIN HoqueiPortugues.Jogador_Campo AS JC ON J.ID = JC.Jogador_ID INNER JOIN HoqueiPortugues.Clube AS C ON J.Clube_ID = C.ID", cn);
            SqlDataReader reader = cmd.ExecuteReader();

            DataTable dataTable = new DataTable();

            dataTable.Load(reader);

            reader.Close();

            dataGridViewVerJC.DataSource = dataTable;

            cn.Close();
        }

        private void pesquisarJC_Click(object sender, EventArgs e)
        {
            if(nomeJC_texbox.Text != "" || ordenarPorJC_comboBox.SelectedItem != null || clubeJC_comboBox.SelectedItem != null || nacionalidadeJC_comboBox.SelectedItem != null)
            {
                cn = getSGBDConnection();
                cn.Open();

                using (SqlCommand command = new SqlCommand("HoqueiPortugues.PesquisaJogadoresCampo", cn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@nome", nomeJC_texbox.Text);
                    command.Parameters.AddWithValue("@orderby", ordenarPorJC_comboBox.SelectedItem);
                    command.Parameters.AddWithValue("@nome_clube", clubeJC_comboBox.SelectedItem);
                    command.Parameters.AddWithValue("@nacionalidade", nacionalidadeJC_comboBox.SelectedItem);


                    SqlDataReader reader = command.ExecuteReader();

                    DataTable dataTable = new DataTable();

                    dataTable.Load(reader);

                    reader.Close();

                    dataGridViewVerJC.DataSource = dataTable;
                }

                // Renomear colunas e alterar largura
                //dataGridView1.Columns[0].HeaderText = "Posição";
                //dataGridView1.Columns[0].Width = 60;

                cn.Close();
            }
            else
            {
                loadJCDefault();
            }
        }

        private void jogadoresGR_button_Click(object sender, EventArgs e)
        {
            panelJogadoresCampo.Visible = false;
            panelVerGR.Visible = true;
            nomeGR_textBox.Text = "";
            ordenarPorGR_comboBox.SelectedItem = null;
            clubeGR_comboBox.SelectedItem = null;
            nacionalidadeGR_comboBox.SelectedItem = null;
            nacionalidadeGR_comboBox.Items.Clear();
            clubeGR_comboBox.Items.Clear();

            SqlConnection cn = getSGBDConnection();
            cn.Open();

            SqlCommand cmd = new SqlCommand("SELECT DISTINCT J.Nacionalidade FROM HoqueiPortugues.Jogador AS J INNER JOIN HoqueiPortugues.Jogador_GuardaRedes AS GR ON J.ID = GR.Jogador_ID", cn);

            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                nacionalidadeGR_comboBox.Items.Add(reader["Nacionalidade"].ToString());
            }

            reader.Close();
            cn.Close();

            SqlConnection cn1 = getSGBDConnection();
            cn1.Open();

            SqlCommand cmd1 = new SqlCommand("SELECT Nome FROM HoqueiPortugues.Clube", cn1);

            SqlDataReader reader1 = cmd1.ExecuteReader();

            while (reader1.Read())
            {
                clubeGR_comboBox.Items.Add(reader1["Nome"].ToString());
            }

            reader1.Close();
            cn1.Close();

            loadGRDefault();
        }

        private void loadGRDefault()
        {
            SqlConnection cn1 = getSGBDConnection();
            cn1.Open();

            if (!verifySGBDConnection())
                return;

            SqlCommand cmd1 = new SqlCommand("SELECT J.Nome AS JogadorNome, C.Nome AS ClubeNome, GR.Golos_sofridos, J.advertencias, J.cartoes_azuis, J.cartoes_vermelhos, GR.Penaltis_defendidos, GR.Livres_diretos_defendidos FROM HoqueiPortugues.Jogador AS J INNER JOIN HoqueiPortugues.Jogador_GuardaRedes AS GR ON J.ID = GR.Jogador_ID INNER JOIN HoqueiPortugues.Clube AS C ON J.Clube_ID = C.ID", cn1);
            SqlDataReader reader1 = cmd1.ExecuteReader();

            DataTable dataTable1 = new DataTable();

            dataTable1.Load(reader1);

            reader1.Close();

            dataGridViewVerGR.DataSource = dataTable1;

            cn.Close();
        }

        private void pesquisarGR_Click(object sender, EventArgs e)
        {
            if (nomeGR_textBox.Text != "" || ordenarPorGR_comboBox.SelectedItem != null || clubeGR_comboBox.SelectedItem != null || nacionalidadeGR_comboBox.SelectedItem != null)
            {
                cn = getSGBDConnection();
                cn.Open();

                using (SqlCommand command = new SqlCommand("HoqueiPortugues.PesquisaGuardaRedes", cn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@nome", nomeGR_textBox.Text);
                    command.Parameters.AddWithValue("@orderby", ordenarPorGR_comboBox.SelectedItem);
                    command.Parameters.AddWithValue("@nome_clube", clubeGR_comboBox.SelectedItem);
                    command.Parameters.AddWithValue("@nacionalidade", nacionalidadeGR_comboBox.SelectedItem);


                    SqlDataReader reader = command.ExecuteReader();

                    DataTable dataTable = new DataTable();

                    dataTable.Load(reader);

                    reader.Close();

                    dataGridViewVerGR.DataSource = dataTable;
                }

                // Renomear colunas e alterar largura
                //dataGridView1.Columns[0].HeaderText = "Posição";
                //dataGridView1.Columns[0].Width = 60;

                cn.Close();
            }
            else
            {
                loadGRDefault();
            }
        }
    }
}
