﻿using System;
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
            panelAdicionarJogo.Visible = false;
            editarResultadoPanel.Visible = false;
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
            panelAdicionarJogo.Visible = false;
            editarResultadoPanel.Visible = false;
            panelClassificacao.Visible = false;
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
                        detalhes_buttons[i].Visible = false;
                        adicionar_buttons[i].Tag = new ButtonData(int.Parse(J.ID), int.Parse(J.Jornada_num));
                    }
                    else
                    {
                        detalhes_buttons[i].Visible = true;
                        adicionar_buttons[i].Visible = false;
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
            panelAdicionarJogo.Visible = false;
            editarResultadoPanel.Visible = false;
            panelClassificacao.Visible = false;
            loadDetalhesJogo(jogoID);
        }

        private void loadDetalhesJogo(int jogoID)
        {
            updateResultado_button.Tag = jogoID;

            cn = getSGBDConnection();

            if (!verifySGBDConnection())
                return;

            SqlConnection cn1 = getSGBDConnection();
            cn1.Open();

            SqlConnection cn2 = getSGBDConnection();
            cn2.Open();

            SqlCommand cmd = new SqlCommand("HoqueiPortugues.consultarJogo", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Jogo_ID", jogoID);

            SqlDataReader reader = cmd.ExecuteReader();

            SqlCommand cmd1 = new SqlCommand("HoqueiPortugues.obterJogadoresPorJogo", cn1);
            cmd1.CommandType = CommandType.StoredProcedure;

            cmd1.Parameters.AddWithValue("@Jogo_ID", jogoID);

            SqlDataReader reader1 = cmd1.ExecuteReader();

            SqlCommand cmd2 = new SqlCommand("HoqueiPortugues.obterTreinadoresPorJogo", cn2);
            cmd2.CommandType = CommandType.StoredProcedure;

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
            panelAdicionarJogo.Visible = false;
            editarResultadoPanel.Visible = false;
            panelClassificacao.Visible = false;
            loadJornada(jornada);
        }

        private void editarResultado_click(object sender, EventArgs e)
        {
            editarResultadoPanel.Visible = true;
        }

        private void updateResultado_button_Click(object sender, EventArgs e)
        {
            Button guardar = (Button)sender;
            int jogoID = int.Parse(guardar.Tag.ToString());

            if (!string.IsNullOrEmpty(editarResultadoCasa_textbox.Text) && int.TryParse(editarResultadoCasa_textbox.Text, out int num) && !string.IsNullOrEmpty(editarResultadoFora_textbox.Text) && int.TryParse(editarResultadoFora_textbox.Text, out int num1))
            {
                SqlConnection cn = getSGBDConnection();
                cn.Open();

                SqlCommand cmd = new SqlCommand("HoqueiPortugues.updateResultado", cn);
                cmd.Parameters.Add(new SqlParameter("@Jogo_ID", jogoID));
                cmd.Parameters.Add(new SqlParameter("@Resultado_F", num1));
                cmd.Parameters.Add(new SqlParameter("@Resultado_C", num));
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw new Exception("Failed to update Jogo in database. \n ERROR MESSAGE: \n" + ex.Message);
                }
                finally
                {
                    cn.Close();
                }
            }
            else
            {
                MessageBox.Show("Por favor insira um resultado válido");
            }

            editarResultadoPanel.Visible = false;
            editarResultadoFora_textbox.Text = "";
            editarResultadoCasa_textbox.Text = "";
            loadDetalhesJogo(jogoID);
        }

        private void editarRetroceder_button_Click(object sender, EventArgs e)
        {
            editarResultadoPanel.Visible = false;
            editarResultadoFora_textbox.Text = "";
            editarResultadoCasa_textbox.Text = "";
        }

        private void adicionarButtons_Click(object sender, EventArgs e)
        {
            Button adicionarButton = (Button)sender;

            ButtonData addButton = (ButtonData)adicionarButton.Tag;
            int jogoID = int.Parse(addButton.IDJogo.ToString());
            int jornada = int.Parse(addButton.IDClube.ToString()); // AQUI GUARDA A JORNADA

            ButtonData buttonData = new ButtonData(jogoID, jornada);
            guardarJogo.Tag = buttonData;

            panelClassificacao.Visible = false;
            panelCalendario.Visible = false;
            panelDetalhes.Visible = false;
            panelAdicionarJogo.Visible = true;
            panelAdicionarPlantelCasa.Visible = true;
            panelAdicionarPlantelFora.Visible = false;
            panelAdicionarArbitros.Visible = false;
            panelAdicionarResultadoJogo.Visible = false;
            classificacaoButton.Visible = false;
            calendario_button.Visible = false;
            Equipa_button.Visible = false;
            jogadores.Visible = false;
            pictureBox1.Visible = false;
            loadAddPlantel(jogoID, "C");
        }

        private Dictionary<string, Jogador> jogadoresSelecionadosMap = new Dictionary<string, Jogador>
        {
            { "JC1_selected", null },
            { "JC2_selected", null },
            { "JC3_selected", null },
            { "JC4_selected", null },
            { "GR_selected", null },
        };

        private Dictionary<string, Treinador> treinadoresSelecionadosMap = new Dictionary<string, Treinador>
        {
            { "TPR_selected", null },
            { "TAD_selected", null },
        };

        private void clearDic (Dictionary<string, Jogador> dic, Dictionary<string, Treinador> dic1)
        {
            List<string> keys = new List<string>(dic.Keys);
            foreach (string key in keys)
            {
                dic[key] = null;
            }

            List<string> keys1 = new List<string>(dic1.Keys);
            foreach (string key in keys1)
            {
                dic1[key] = null;
            }
        }
        private void loadAddPlantel(int jogoID, String casa_ou_fora)
        {
            clearDic(jogadoresSelecionadosMap, treinadoresSelecionadosMap);

            cn = getSGBDConnection();

            if (cn.State != ConnectionState.Open)
                cn.Open();

            if (!verifySGBDConnection())
                return;

            SqlConnection cn1 = getSGBDConnection();
            cn1.Open();

            SqlCommand cmd = new SqlCommand($"SELECT Clube_{(casa_ou_fora)}_ID, Jogador.ID AS JogadorID, Jogador.Nome AS NomeJogador, Jogador.Posicao FROM HoqueiPortugues.Jogo JOIN HoqueiPortugues.Clube ON Jogo.Clube_{(casa_ou_fora)}_ID = Clube.ID JOIN HoqueiPortugues.Jogador ON Clube.ID = Jogador.Clube_ID WHERE Jogo.ID = @jogoID", cn);
            cmd.Parameters.AddWithValue("@jogoID", jogoID);
            SqlDataReader reader = cmd.ExecuteReader();

            SqlCommand cmd1 = new SqlCommand($"SELECT Clube_{(casa_ou_fora)}_ID, Treinador.ID AS TreinadorID, Treinador.Nome AS NomeTreinador, Treinador.Tipo_treinador FROM HoqueiPortugues.Jogo JOIN HoqueiPortugues.Clube ON Jogo.Clube_{(casa_ou_fora)}_ID = Clube.ID JOIN HoqueiPortugues.Treinador ON Clube.ID = Treinador.Clube_ID WHERE Jogo.ID = @jogoID", cn1);
            cmd1.Parameters.AddWithValue("@jogoID", jogoID);
            SqlDataReader reader1 = cmd1.ExecuteReader();

            while (reader.Read())
            {
                if(casa_ou_fora == "C")
                {
                    proximo1_button.Tag = new ButtonData(jogoID, int.Parse(reader[$"Clube_{(casa_ou_fora)}_ID"].ToString()));
                }
                else
                {
                    proximo2_button.Tag = new ButtonData(jogoID, int.Parse(reader[$"Clube_{(casa_ou_fora)}_ID"].ToString()));

                }
                int idJogador = Int32.Parse(reader["JogadorID"].ToString());
                string nomeJogador = reader["NomeJogador"].ToString();
                Jogador jogador = new Jogador(idJogador, nomeJogador);

                if (reader["Posicao"].ToString() == "Jogador de Campo" && casa_ou_fora == "C")
                {
                    JC1_casa_combobox.Items.Add(jogador);
                    JC2_casa_combobox.Items.Add(jogador);
                    JC3_casa_combobox.Items.Add(jogador);
                    JC4_casa_combobox.Items.Add(jogador);
                }
                else if (reader["Posicao"].ToString() == "Guarda-Redes" && casa_ou_fora == "C")
                {
                    GR_casa_combobox.Items.Add(jogador);
                }
                else if (reader["Posicao"].ToString() == "Jogador de Campo" && casa_ou_fora == "F")
                {
                    JC1_fora_combobox.Items.Add(jogador);
                    JC2_fora_combobox.Items.Add(jogador);
                    JC3_fora_combobox.Items.Add(jogador);
                    JC4_fora_combobox.Items.Add(jogador);
                }
                else
                {
                    GR_fora_combobox.Items.Add(jogador);
                }
            }

            while (reader1.Read())
            {               
                int idTreinador = Int32.Parse(reader1["TreinadorID"].ToString());
                string nomeTreinador = reader1["NomeTreinador"].ToString();
                Treinador treinador = new Treinador(idTreinador, nomeTreinador);
            
                if (reader1["Tipo_treinador"].ToString() == "Principal" && casa_ou_fora == "C")
                {
                    TPR_casa_combobox.Items.Add(treinador);
                }
                else if (reader1["Tipo_treinador"].ToString() == "Adjunto" && casa_ou_fora == "C")
                {
                    TAD_casa_combobox.Items.Add(treinador);
                }
                else if (reader1["Tipo_treinador"].ToString() == "Principal" && casa_ou_fora == "F")
                {
                    TPR_fora_combobox.Items.Add(treinador);
                }
                else
                {
                    TAD_fora_combobox.Items.Add(treinador);
                }
            }

            reader.Close();
            reader1.Close();
            cn.Close();
            cn1.Close();
        }

        private Dictionary<string, Arbitro> arbitrosSelecionadosMap = new Dictionary<string, Arbitro>
        {
            { "Arbitro1_selected", null },
            { "Arbitro2_selected", null },
        };

        private void clearArbitros(Dictionary<string, Arbitro> dic)
        {
            List<string> keys1 = new List<string>(dic.Keys);
            foreach (string key in keys1)
            {
                dic[key] = null;
            }
        }

        private void loadAddArbitros(int jogoID)
        {
            clearArbitros(arbitrosSelecionadosMap);

            retroceder4_button.Tag = jogoID;

            cn = getSGBDConnection();

            if (cn.State != ConnectionState.Open)
                cn.Open();

            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand("SELECT ID, Nome FROM HoqueiPortugues.Arbitro", cn);
            SqlDataReader reader = cmd.ExecuteReader();

            proximo3_button.Tag = jogoID;

            while (reader.Read())
            {
                int idArbitro = Int32.Parse(reader["ID"].ToString());
                string nomeArbitro = reader["Nome"].ToString();
                Arbitro arbitro = new Arbitro(idArbitro, nomeArbitro);

                arbitro1_combobox.Items.Add(arbitro);
                arbitro2_combobox.Items.Add(arbitro);
            }

            reader.Close();
            cn.Close();
        }

        private void retroceder1_button_Click(object sender, EventArgs e)
        {
            // Volta à pagina dos jogos, limpa os comboboxes e o texto
            JC1_casa_combobox.Items.Clear();
            JC2_casa_combobox.Items.Clear();
            JC3_casa_combobox.Items.Clear();
            JC4_casa_combobox.Items.Clear();
            GR_casa_combobox.Items.Clear();
            TPR_casa_combobox.Items.Clear();
            TAD_casa_combobox.Items.Clear();
            JC1_casa_combobox.Text = "";
            JC2_casa_combobox.Text = "";
            JC3_casa_combobox.Text = "";
            JC4_casa_combobox.Text = "";
            GR_casa_combobox.Text = "";
            TPR_casa_combobox.Text = "";
            TAD_casa_combobox.Text = "";
            panelClassificacao.Visible = false;
            panelCalendario.Visible = true;
            panelDetalhes.Visible = false;
            panelAdicionarJogo.Visible = false;
            panelEquipas.Visible = false;
            classificacaoButton.Visible = true;
            calendario_button.Visible = true;
            Equipa_button.Visible = true;
            jogadores.Visible = true;
            pictureBox1.Visible = true;
        }

        private void retroceder2_button_Click(object sender, EventArgs e)
        {
            // Elimina o ultimo plantel e volta à pagina dos jogos e limpa os comboboxes e o texto dos 2 panels
            SqlConnection cn = getSGBDConnection();
            cn.Open();

            SqlCommand cmd = new SqlCommand("HoqueiPortugues.STeliminarUltimoPlantel", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Failed to delete plantel in database. \n ERROR MESSAGE: \n" + ex.Message);
            }
            finally
            {
                cn.Close();
            }

            JC1_casa_combobox.Items.Clear();
            JC2_casa_combobox.Items.Clear();
            JC3_casa_combobox.Items.Clear();
            JC4_casa_combobox.Items.Clear();
            GR_casa_combobox.Items.Clear();
            TPR_casa_combobox.Items.Clear();
            TAD_casa_combobox.Items.Clear();
            JC1_casa_combobox.Text = "";
            JC2_casa_combobox.Text = "";
            JC3_casa_combobox.Text = "";
            JC4_casa_combobox.Text = "";
            GR_casa_combobox.Text = "";
            TPR_casa_combobox.Text = "";
            TAD_casa_combobox.Text = "";
            JC1_fora_combobox.Items.Clear();
            JC2_fora_combobox.Items.Clear();
            JC3_fora_combobox.Items.Clear();
            JC4_fora_combobox.Items.Clear();
            GR_fora_combobox.Items.Clear();
            TPR_fora_combobox.Items.Clear();
            TAD_fora_combobox.Items.Clear();
            JC1_fora_combobox.Text = "";
            JC2_fora_combobox.Text = "";
            JC3_fora_combobox.Text = "";
            JC4_fora_combobox.Text = "";
            GR_fora_combobox.Text = "";
            TPR_fora_combobox.Text = "";
            TAD_fora_combobox.Text = "";
            panelClassificacao.Visible = false;
            panelCalendario.Visible = true;
            panelDetalhes.Visible = false;
            panelAdicionarJogo.Visible = false;
            panelEquipas.Visible = false;
            classificacaoButton.Visible = true;
            calendario_button.Visible = true;
            Equipa_button.Visible = true;
            jogadores.Visible = true;
            pictureBox1.Visible = true;

        }

        private void retroceder4_button_Click(object sender, EventArgs e)
        {
            // Elimina os ultimos 2 planteis e o e_arbitrado e volta à pagina dos jogos e limpa os comboboxes e o texto de todos os panels
            Button retroceder4_button = (Button)sender;
            int jogoID = int.Parse(retroceder4_button.Tag.ToString());

            SqlConnection cn = getSGBDConnection();
            SqlConnection cn1 = getSGBDConnection();
            cn.Open();
            cn1.Open();

            SqlCommand cmd = new SqlCommand("HoqueiPortugues.STeliminarUltimosPlanteis", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Failed to delete plantel in database. \n ERROR MESSAGE: \n" + ex.Message);
            }
            finally
            {
                cn.Close();
            }

            SqlCommand cmd1 = new SqlCommand("HoqueiPortugues.eliminarArbitros", cn1);
            cmd1.CommandType = CommandType.StoredProcedure;
            cmd1.Parameters.Add(new SqlParameter("@Jogo_ID", jogoID));
            try
            {
                cmd1.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Failed to delete e_arbitrado in database. \n ERROR MESSAGE: \n" + ex.Message);
            }
            finally
            {
                cn1.Close();
            }

            JC1_casa_combobox.Items.Clear();
            JC2_casa_combobox.Items.Clear();
            JC3_casa_combobox.Items.Clear();
            JC4_casa_combobox.Items.Clear();
            GR_casa_combobox.Items.Clear();
            TPR_casa_combobox.Items.Clear();
            TAD_casa_combobox.Items.Clear();
            JC1_casa_combobox.Text = "";
            JC2_casa_combobox.Text = "";
            JC3_casa_combobox.Text = "";
            JC4_casa_combobox.Text = "";
            GR_casa_combobox.Text = "";
            TPR_casa_combobox.Text = "";
            TAD_casa_combobox.Text = "";
            JC1_fora_combobox.Items.Clear();
            JC2_fora_combobox.Items.Clear();
            JC3_fora_combobox.Items.Clear();
            JC4_fora_combobox.Items.Clear();
            GR_fora_combobox.Items.Clear();
            TPR_fora_combobox.Items.Clear();
            TAD_fora_combobox.Items.Clear();
            JC1_fora_combobox.Text = "";
            JC2_fora_combobox.Text = "";
            JC3_fora_combobox.Text = "";
            JC4_fora_combobox.Text = "";
            GR_fora_combobox.Text = "";
            TPR_fora_combobox.Text = "";
            TAD_fora_combobox.Text = "";
            arbitro1_combobox.Items.Clear();
            arbitro2_combobox.Items.Clear();
            arbitro1_combobox.Text = "";
            arbitro2_combobox.Text = "";
            resultadoEquipaCasa_textbox.Text = "";
            resultadoEquipaFora_textbox.Text = "";
            panelClassificacao.Visible = false;
            panelCalendario.Visible = true;
            panelDetalhes.Visible = false;
            panelAdicionarJogo.Visible = false;
            panelEquipas.Visible = false;
            classificacaoButton.Visible = true;
            calendario_button.Visible = true;
            Equipa_button.Visible = true;
            jogadores.Visible = true;
            pictureBox1.Visible = true;


        }

        private void retroceder3_button_Click(object sender, EventArgs e)
        {
            // Elimina os ultimos 2 planteis e volta a pagina dos jogos e limpa os comboboxes e o texto dos 3 panels
            SqlConnection cn = getSGBDConnection();
            cn.Open();

            SqlCommand cmd = new SqlCommand("HoqueiPortugues.STeliminarUltimosPlanteis", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Failed to delete plantel in database. \n ERROR MESSAGE: \n" + ex.Message);
            }
            finally
            {
                cn.Close();
            }

            JC1_casa_combobox.Items.Clear();
            JC2_casa_combobox.Items.Clear();
            JC3_casa_combobox.Items.Clear();
            JC4_casa_combobox.Items.Clear();
            GR_casa_combobox.Items.Clear();
            TPR_casa_combobox.Items.Clear();
            TAD_casa_combobox.Items.Clear();
            JC1_casa_combobox.Text = "";
            JC2_casa_combobox.Text = "";
            JC3_casa_combobox.Text = "";
            JC4_casa_combobox.Text = "";
            GR_casa_combobox.Text = "";
            TPR_casa_combobox.Text = "";
            TAD_casa_combobox.Text = "";
            JC1_fora_combobox.Items.Clear();
            JC2_fora_combobox.Items.Clear();
            JC3_fora_combobox.Items.Clear();
            JC4_fora_combobox.Items.Clear();
            GR_fora_combobox.Items.Clear();
            TPR_fora_combobox.Items.Clear();
            TAD_fora_combobox.Items.Clear();
            JC1_fora_combobox.Text = "";
            JC2_fora_combobox.Text = "";
            JC3_fora_combobox.Text = "";
            JC4_fora_combobox.Text = "";
            GR_fora_combobox.Text = "";
            TPR_fora_combobox.Text = "";
            TAD_fora_combobox.Text = "";
            arbitro1_combobox.Items.Clear();
            arbitro2_combobox.Items.Clear();
            arbitro1_combobox.Text = "";
            arbitro2_combobox.Text = "";
            panelClassificacao.Visible = false;
            panelCalendario.Visible = true;
            panelDetalhes.Visible = false;
            panelAdicionarJogo.Visible = false;
            panelEquipas.Visible = false;
            classificacaoButton.Visible = true;
            calendario_button.Visible = true;
            Equipa_button.Visible = true;
            jogadores.Visible = true;
            pictureBox1.Visible = true;

        }

        private void proximo1_button_Click(object sender, EventArgs e)
        {
            SqlConnection cn = getSGBDConnection();
            SqlConnection cn1 = getSGBDConnection();
            SqlConnection cn2 = getSGBDConnection();
            SqlConnection cn3 = getSGBDConnection();
            cn.Open();
            cn1.Open();
            cn2.Open();
            cn3.Open();

            int idJogo = ((ButtonData)proximo1_button.Tag).IDJogo;

            //verificar se todos os jogadores e treinadores foram selecionados
            //criar plantel
            if (JC1_casa_combobox.SelectedItem != null && JC2_casa_combobox.SelectedItem != null && JC3_casa_combobox.SelectedItem != null && JC4_casa_combobox.SelectedItem != null && GR_casa_combobox.SelectedItem != null && TPR_casa_combobox.SelectedItem != null && TAD_casa_combobox.SelectedItem != null)
            {
                ButtonData buttonData = (ButtonData)proximo1_button.Tag;
                int idClube = buttonData.IDClube;
                int idJogador1 = jogadoresSelecionadosMap["JC1_selected"].ID;
                int idJogador2 = jogadoresSelecionadosMap["JC2_selected"].ID;
                int idJogador3 = jogadoresSelecionadosMap["JC3_selected"].ID;
                int idJogador4 = jogadoresSelecionadosMap["JC4_selected"].ID;
                int idJogadorGR = jogadoresSelecionadosMap["GR_selected"].ID;
                int idTreinadorPR = treinadoresSelecionadosMap["TPR_selected"].ID;
                int idTreinadorAD = treinadoresSelecionadosMap["TAD_selected"].ID;

                //criar plantel
                SqlCommand cmd1 = new SqlCommand("SELECT MAX(ID) AS LastID FROM HoqueiPortugues.Plantel", cn1);
                SqlDataReader reader1 = cmd1.ExecuteReader();
                reader1.Read();
                int idPlantel = int.Parse(reader1["LastID"].ToString()) + 1;
                reader1.Close();

                SqlCommand cmd = new SqlCommand("INSERT INTO HoqueiPortugues.Plantel VALUES (@plantel_id,@clube_id)");
                cmd.Parameters.AddWithValue("@plantel_id", idPlantel);
                cmd.Parameters.AddWithValue("@clube_id", idClube);
                cmd.Connection = cn;
                cmd.CommandType = CommandType.Text;

                try
                {
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw new Exception("Failed to update plantel in database. \n ERROR MESSAGE: \n" + ex.Message);
                }
                finally
                {
                    cn.Close();
                }

                SqlCommand cmd2 = new SqlCommand("INSERT INTO HoqueiPortugues.Plantel_Jogadores (Plantel_ID, Jogador_ID) VALUES (@PLANTEL_ID, @JogadorCampo1_ID), (@PLANTEL_ID, @JogadorCampo2_ID), (@PLANTEL_ID, @JogadorCampo3_ID), (@PLANTEL_ID, @JogadorCampo4_ID), (@PLANTEL_ID, @GuardaRedes_ID)");
                cmd2.Parameters.AddWithValue("@PLANTEL_ID", idPlantel);
                cmd2.Parameters.AddWithValue("@JogadorCampo1_ID", idJogador1);
                cmd2.Parameters.AddWithValue("@JogadorCampo2_ID", idJogador2);
                cmd2.Parameters.AddWithValue("@JogadorCampo3_ID", idJogador3);
                cmd2.Parameters.AddWithValue("@JogadorCampo4_ID", idJogador4);
                cmd2.Parameters.AddWithValue("@GuardaRedes_ID", idJogadorGR);
                cmd2.Connection = cn2;
                cmd2.CommandType = CommandType.Text;

                try
                {
                    cmd2.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw new Exception("Failed to update plantel in database. \n ERROR MESSAGE: \n" + ex.Message);
                }
                finally
                {
                    cn2.Close();
                }

                SqlCommand cmd3 = new SqlCommand("INSERT INTO HoqueiPortugues.Plantel_Treinadores (Plantel_ID, Treinador_ID) VALUES (@PLANTEL_ID, @TreinadorPrincipal_ID), (@PLANTEL_ID, @TreinadorAdjunto_ID)");
                cmd3.Parameters.AddWithValue("@PLANTEL_ID", idPlantel);
                cmd3.Parameters.AddWithValue("@TreinadorPrincipal_ID", idTreinadorPR);
                cmd3.Parameters.AddWithValue("@TreinadorAdjunto_ID", idTreinadorAD);
                cmd3.Connection = cn3;
                cmd3.CommandType = CommandType.Text;

                try
                {
                    cmd3.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw new Exception("Failed to update plantel in database. \n ERROR MESSAGE: \n" + ex.Message);
                }
                finally
                {
                    cn3.Close();
                }
            }
            else
            {
                MessageBox.Show("Por favor selecione todos os jogadores e treinadores");
            }

            panelAdicionarPlantelCasa.Visible = false;
            panelAdicionarPlantelFora.Visible = true;
            loadAddPlantel(idJogo, "F");

            cn1.Close();
        }

        private void proximo2_button_Click(object sender, EventArgs e)
        {
            SqlConnection cn = getSGBDConnection();
            SqlConnection cn1 = getSGBDConnection();
            SqlConnection cn2 = getSGBDConnection();
            SqlConnection cn3 = getSGBDConnection();
            cn.Open();
            cn1.Open();
            cn2.Open();
            cn3.Open();

            int idJogo = ((ButtonData)proximo2_button.Tag).IDJogo;

            //verificar se todos os jogadores e treinadores foram selecionados
            //criar plantel
            if (JC1_fora_combobox.SelectedItem != null && JC2_fora_combobox.SelectedItem != null && JC3_fora_combobox.SelectedItem != null && JC4_fora_combobox.SelectedItem != null && GR_fora_combobox.SelectedItem != null && TPR_fora_combobox.SelectedItem != null && TAD_fora_combobox.SelectedItem != null)
            {
                ButtonData buttonData = (ButtonData)proximo2_button.Tag;
                int idClube = buttonData.IDClube;
                int idJogador1 = jogadoresSelecionadosMap["JC1_selected"].ID;
                int idJogador2 = jogadoresSelecionadosMap["JC2_selected"].ID;
                int idJogador3 = jogadoresSelecionadosMap["JC3_selected"].ID;
                int idJogador4 = jogadoresSelecionadosMap["JC4_selected"].ID;
                int idJogadorGR = jogadoresSelecionadosMap["GR_selected"].ID;
                int idTreinadorPR = treinadoresSelecionadosMap["TPR_selected"].ID;
                int idTreinadorAD = treinadoresSelecionadosMap["TAD_selected"].ID;

                //criar plantel
                SqlCommand cmd1 = new SqlCommand("SELECT MAX(ID) AS LastID FROM HoqueiPortugues.Plantel", cn1);
                SqlDataReader reader1 = cmd1.ExecuteReader();
                reader1.Read();
                int idPlantel = int.Parse(reader1["LastID"].ToString()) + 1;
                reader1.Close();

                SqlCommand cmd = new SqlCommand("INSERT INTO HoqueiPortugues.Plantel VALUES (@plantel_id,@clube_id)");
                cmd.Parameters.AddWithValue("@plantel_id", idPlantel);
                cmd.Parameters.AddWithValue("@clube_id", idClube);
                cmd.Connection = cn;
                cmd.CommandType = CommandType.Text;

                try
                {
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw new Exception("Failed to update plantel in database. \n ERROR MESSAGE: \n" + ex.Message);
                }
                finally
                {
                    cn.Close();
                }

                SqlCommand cmd2 = new SqlCommand("INSERT INTO HoqueiPortugues.Plantel_Jogadores (Plantel_ID, Jogador_ID) VALUES (@PLANTEL_ID, @JogadorCampo1_ID), (@PLANTEL_ID, @JogadorCampo2_ID), (@PLANTEL_ID, @JogadorCampo3_ID), (@PLANTEL_ID, @JogadorCampo4_ID), (@PLANTEL_ID, @GuardaRedes_ID)");
                cmd2.Parameters.AddWithValue("@PLANTEL_ID", idPlantel);
                cmd2.Parameters.AddWithValue("@JogadorCampo1_ID", idJogador1);
                cmd2.Parameters.AddWithValue("@JogadorCampo2_ID", idJogador2);
                cmd2.Parameters.AddWithValue("@JogadorCampo3_ID", idJogador3);
                cmd2.Parameters.AddWithValue("@JogadorCampo4_ID", idJogador4);
                cmd2.Parameters.AddWithValue("@GuardaRedes_ID", idJogadorGR);
                cmd2.Connection = cn2;
                cmd2.CommandType = CommandType.Text;

                try
                {
                    cmd2.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw new Exception("Failed to update plantel in database. \n ERROR MESSAGE: \n" + ex.Message);
                }
                finally
                {
                    cn2.Close();
                }

                SqlCommand cmd3 = new SqlCommand("INSERT INTO HoqueiPortugues.Plantel_Treinadores (Plantel_ID, Treinador_ID) VALUES (@PLANTEL_ID, @TreinadorPrincipal_ID), (@PLANTEL_ID, @TreinadorAdjunto_ID)");
                cmd3.Parameters.AddWithValue("@PLANTEL_ID", idPlantel);
                cmd3.Parameters.AddWithValue("@TreinadorPrincipal_ID", idTreinadorPR);
                cmd3.Parameters.AddWithValue("@TreinadorAdjunto_ID", idTreinadorAD);
                cmd3.Connection = cn3;
                cmd3.CommandType = CommandType.Text;

                try
                {
                    cmd3.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw new Exception("Failed to update plantel in database. \n ERROR MESSAGE: \n" + ex.Message);
                }
                finally
                {
                    cn3.Close();
                }
            }
            else
            {
                MessageBox.Show("Por favor selecione todos os jogadores e treinadores");
            }

            panelAdicionarPlantelFora.Visible = false;
            panelAdicionarArbitros.Visible = true;
            loadAddArbitros(idJogo);

            cn1.Close();
        }

        private void guardarJogo_Click(object sender, EventArgs e)
        {
            Button guardar = (Button)sender;
            ButtonData buttonData = (ButtonData)guardar.Tag;
            int jogoID = buttonData.IDJogo;
            int jornada = buttonData.IDClube;  //É A JORNADA

            if (!string.IsNullOrEmpty(resultadoEquipaCasa_textbox.Text) && int.TryParse(resultadoEquipaCasa_textbox.Text, out int num) && !string.IsNullOrEmpty(resultadoEquipaFora_textbox.Text) && int.TryParse(resultadoEquipaFora_textbox.Text, out int num1))
            {
                SqlConnection cn = getSGBDConnection();
                cn.Open();

                SqlCommand cmd = new SqlCommand("HoqueiPortugues.simularJogo", cn);
                cmd.Parameters.Add(new SqlParameter("@Jogo_ID", jogoID));
                cmd.Parameters.Add(new SqlParameter("@Resultado_F", int.Parse(resultadoEquipaCasa_textbox.Text)));
                cmd.Parameters.Add(new SqlParameter("@Resultado_C", int.Parse(resultadoEquipaFora_textbox.Text)));
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw new Exception("Failed to update Jogo in database. \n ERROR MESSAGE: \n" + ex.Message);
                }
                finally
                {
                    cn.Close();
                }
            }
            else
            {
                MessageBox.Show("Por favor insira um resultado válido");
            }

            JC1_casa_combobox.Items.Clear();
            JC2_casa_combobox.Items.Clear();
            JC3_casa_combobox.Items.Clear();
            JC4_casa_combobox.Items.Clear();
            GR_casa_combobox.Items.Clear();
            TPR_casa_combobox.Items.Clear();
            TAD_casa_combobox.Items.Clear();
            JC1_casa_combobox.Text = "";
            JC2_casa_combobox.Text = "";
            JC3_casa_combobox.Text = "";
            JC4_casa_combobox.Text = "";
            GR_casa_combobox.Text = "";
            TPR_casa_combobox.Text = "";
            TAD_casa_combobox.Text = "";
            JC1_fora_combobox.Items.Clear();
            JC2_fora_combobox.Items.Clear();
            JC3_fora_combobox.Items.Clear();
            JC4_fora_combobox.Items.Clear();
            GR_fora_combobox.Items.Clear();
            TPR_fora_combobox.Items.Clear();
            TAD_fora_combobox.Items.Clear();
            JC1_fora_combobox.Text = "";
            JC2_fora_combobox.Text = "";
            JC3_fora_combobox.Text = "";
            JC4_fora_combobox.Text = "";
            GR_fora_combobox.Text = "";
            TPR_fora_combobox.Text = "";
            TAD_fora_combobox.Text = "";
            arbitro1_combobox.Items.Clear();
            arbitro2_combobox.Items.Clear();
            arbitro1_combobox.Text = "";
            arbitro2_combobox.Text = "";
            resultadoEquipaCasa_textbox.Text = "";
            resultadoEquipaFora_textbox.Text = "";
            panelClassificacao.Visible = false;
            panelCalendario.Visible = true;
            panelDetalhes.Visible = false;
            panelAdicionarJogo.Visible = false;
            panelEquipas.Visible = false;
            classificacaoButton.Visible = true;
            calendario_button.Visible = true;
            Equipa_button.Visible = true;
            jogadores.Visible = true;
            pictureBox1.Visible = true;

            loadJornada(jornada);
        }

        private void proximo3_button_Click(object sender, EventArgs e)
        {
            SqlConnection cn = getSGBDConnection();
            cn.Open();

            Button proximo3_button = (Button)sender;
            int jogoID = int.Parse(proximo3_button.Tag.ToString());

            if (arbitro1_combobox.SelectedItem != null && arbitro2_combobox.SelectedItem != null)
            {
                int idArbitro1 = arbitrosSelecionadosMap["Arbitro1_selected"].ID;
                int idArbitro2 = arbitrosSelecionadosMap["Arbitro2_selected"].ID;

                SqlCommand cmd = new SqlCommand("INSERT INTO HoqueiPortugues.e_arbitrado (Jogo_ID, Arbitro_ID) VALUES (@Jogo_ID, @ArbitroPrincipal_ID), (@Jogo_ID, @ArbitroAuxiliar_ID)");
                cmd.Parameters.AddWithValue("@Jogo_ID", jogoID);
                cmd.Parameters.AddWithValue("@ArbitroPrincipal_ID", idArbitro1);
                cmd.Parameters.AddWithValue("@ArbitroAuxiliar_ID", idArbitro2);
                cmd.Connection = cn;
                cmd.CommandType = CommandType.Text;

                try
                {
                    cmd.ExecuteNonQuery();
                    panelAdicionarArbitros.Visible = false;
                    panelAdicionarResultadoJogo.Visible = true;
                }
                catch (SqlException ex)
                {
                    if (ex.Number == 50000)
                    {
                        MessageBox.Show("Um dos árbitros já arbitrou um jogo nesta jornada");
                    }
                }
                finally
                {
                    cn.Close();
                }
            }
            else
            {
                MessageBox.Show("Por favor selecione os dois árbitros");
            }
        }

        private void JC1_combobox_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (JC1_casa_combobox.SelectedItem != null)
            {
                Jogador jogadorSelecionado = (Jogador)JC1_casa_combobox.SelectedItem;

                if (jogadoresSelecionadosMap?.Values.Any(j => j?.ID == jogadorSelecionado.ID) == false)
                {
                    if (jogadoresSelecionadosMap.ContainsKey("JC1_selected"))
                    {
                        // Atualize a entrada do dicionário se ela já existir
                        jogadoresSelecionadosMap["JC1_selected"] = jogadorSelecionado;
                    }
                    else
                    {
                        // Adicione a entrada ao dicionário se ela ainda não existir
                        jogadoresSelecionadosMap.Add("JC1_selected", jogadorSelecionado);
                    }
                }
                else
                {
                    MessageBox.Show("O jogador selecionado já foi selecionado noutro lugar!");
                    JC1_casa_combobox.SelectedItem = null; // Limpe a seleção se o jogador já foi selecionado antes
                }
            }
        }

        private void JC2_combobox_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (JC2_casa_combobox.SelectedItem != null)
            {
                Jogador jogadorSelecionado = (Jogador)JC2_casa_combobox.SelectedItem;

                if (jogadoresSelecionadosMap?.Values.Any(j => j?.ID == jogadorSelecionado.ID) == false)
                {
                    if (jogadoresSelecionadosMap.ContainsKey("JC2_selected"))
                    {
                        // Atualize a entrada do dicionário se ela já existir
                        jogadoresSelecionadosMap["JC2_selected"] = jogadorSelecionado;
                    }
                    else
                    {
                        // Adicione a entrada ao dicionário se ela ainda não existir
                        jogadoresSelecionadosMap.Add("JC2_selected", jogadorSelecionado);
                    }
                }
                else
                {
                    MessageBox.Show("O jogador selecionado já foi selecionado noutro lugar!");
                    JC2_casa_combobox.SelectedItem = null; // Limpe a seleção se o jogador já foi selecionado antes
                }
            }
        }

        private void JC3_combobox_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (JC3_casa_combobox.SelectedItem != null)
            {
                Jogador jogadorSelecionado = (Jogador)JC3_casa_combobox.SelectedItem;

                if (jogadoresSelecionadosMap?.Values.Any(j => j?.ID == jogadorSelecionado.ID) == false)
                {
                    if (jogadoresSelecionadosMap.ContainsKey("JC3_selected"))
                    {
                        // Atualize a entrada do dicionário se ela já existir
                        jogadoresSelecionadosMap["JC3_selected"] = jogadorSelecionado;
                    }
                    else
                    {
                        // Adicione a entrada ao dicionário se ela ainda não existir
                        jogadoresSelecionadosMap.Add("JC3_selected", jogadorSelecionado);
                    }
                }
                else
                {
                    MessageBox.Show("O jogador selecionado já foi selecionado noutro lugar!");
                    JC3_casa_combobox.SelectedItem = null; // Limpe a seleção se o jogador já foi selecionado antes
                }
            }
        }

        private void JC4_combobox_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (JC4_casa_combobox.SelectedItem != null)
            {
                Jogador jogadorSelecionado = (Jogador)JC4_casa_combobox.SelectedItem;

                if (jogadoresSelecionadosMap?.Values.Any(j => j?.ID == jogadorSelecionado.ID) == false)
                {
                    if (jogadoresSelecionadosMap.ContainsKey("JC4_selected"))
                    {
                        // Atualize a entrada do dicionário se ela já existir
                        jogadoresSelecionadosMap["JC4_selected"] = jogadorSelecionado;
                    }
                    else
                    {
                        // Adicione a entrada ao dicionário se ela ainda não existir
                        jogadoresSelecionadosMap.Add("JC4_selected", jogadorSelecionado);
                    }
                }
                else
                {
                    MessageBox.Show("O jogador selecionado já foi selecionado noutro lugar!");
                    JC4_casa_combobox.SelectedItem = null; // Limpe a seleção se o jogador já foi selecionado antes
                }
            }
        }

        private void GR_combobox_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (GR_casa_combobox.SelectedItem != null)
            {
                Jogador jogadorSelecionado = (Jogador)GR_casa_combobox.SelectedItem;

                if (jogadoresSelecionadosMap?.Values.Any(j => j?.ID == jogadorSelecionado.ID) == false)
                {
                    if (jogadoresSelecionadosMap.ContainsKey("GR_selected"))
                    {
                        // Atualize a entrada do dicionário se ela já existir
                        jogadoresSelecionadosMap["GR_selected"] = jogadorSelecionado;
                    }
                    else
                    {
                        // Adicione a entrada ao dicionário se ela ainda não existir
                        jogadoresSelecionadosMap.Add("GR_selected", jogadorSelecionado);
                    }
                }
                else
                {
                    MessageBox.Show("O jogador selecionado já foi selecionado noutro lugar!");
                    GR_casa_combobox.SelectedItem = null; // Limpe a seleção se o jogador já foi selecionado antes
                }
            }
        }

        private void TPR_combobox_SelectedIndexChanged(object sender, EventArgs e)
        {
            Treinador treinadorSelecionado = (Treinador)TPR_casa_combobox.SelectedItem;

            if(treinadoresSelecionadosMap.ContainsKey("TPR_selected"))
            {
                // Atualize a entrada do dicionário se ela já existir
                treinadoresSelecionadosMap["TPR_selected"] = treinadorSelecionado;
            }
            else
            {
                // Adicione a entrada ao dicionário se ela ainda não existir
                treinadoresSelecionadosMap.Add("TPR_selected", treinadorSelecionado);
            }
        }

        private void TAD_combobox_SelectedIndexChanged(object sender, EventArgs e)
        {
            Treinador treinadorSelecionado = (Treinador)TAD_casa_combobox.SelectedItem;

            if (treinadoresSelecionadosMap.ContainsKey("TAD_selected"))
            {
                // Atualize a entrada do dicionário se ela já existir
                treinadoresSelecionadosMap["TAD_selected"] = treinadorSelecionado;
            }
            else
            {
                // Adicione a entrada ao dicionário se ela ainda não existir
                treinadoresSelecionadosMap.Add("TAD_selected", treinadorSelecionado);
            }
        }

        private void JC1_fora_combobox_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (JC1_fora_combobox.SelectedItem != null)
            {
                Jogador jogadorSelecionado = (Jogador)JC1_fora_combobox.SelectedItem;

                if (jogadoresSelecionadosMap?.Values.Any(j => j?.ID == jogadorSelecionado.ID) == false)
                {
                    if (jogadoresSelecionadosMap.ContainsKey("JC1_selected"))
                    {
                        // Atualize a entrada do dicionário se ela já existir
                        jogadoresSelecionadosMap["JC1_selected"] = jogadorSelecionado;
                    }
                    else
                    {
                        // Adicione a entrada ao dicionário se ela ainda não existir
                        jogadoresSelecionadosMap.Add("JC1_selected", jogadorSelecionado);
                    }
                }
                else
                {
                    MessageBox.Show("O jogador selecionado já foi selecionado noutro lugar!");
                    JC1_fora_combobox.SelectedItem = null; // Limpe a seleção se o jogador já foi selecionado antes
                }
            }
        }

        private void JC2_fora_combobox_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (JC2_fora_combobox.SelectedItem != null)
            {
                Jogador jogadorSelecionado = (Jogador)JC2_fora_combobox.SelectedItem;

                if (jogadoresSelecionadosMap?.Values.Any(j => j?.ID == jogadorSelecionado.ID) == false)
                {
                    if (jogadoresSelecionadosMap.ContainsKey("JC2_selected"))
                    {
                        // Atualize a entrada do dicionário se ela já existir
                        jogadoresSelecionadosMap["JC2_selected"] = jogadorSelecionado;
                    }
                    else
                    {
                        // Adicione a entrada ao dicionário se ela ainda não existir
                        jogadoresSelecionadosMap.Add("JC2_selected", jogadorSelecionado);
                    }
                }
                else
                {
                    MessageBox.Show("O jogador selecionado já foi selecionado noutro lugar!");
                    JC2_fora_combobox.SelectedItem = null; // Limpe a seleção se o jogador já foi selecionado antes
                }
            }
        }

        private void JC3_fora_combobox_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (JC3_fora_combobox.SelectedItem != null)
            {
                Jogador jogadorSelecionado = (Jogador)JC3_fora_combobox.SelectedItem;

                if (jogadoresSelecionadosMap?.Values.Any(j => j?.ID == jogadorSelecionado.ID) == false)
                {
                    if (jogadoresSelecionadosMap.ContainsKey("JC3_selected"))
                    {
                        // Atualize a entrada do dicionário se ela já existir
                        jogadoresSelecionadosMap["JC3_selected"] = jogadorSelecionado;
                    }
                    else
                    {
                        // Adicione a entrada ao dicionário se ela ainda não existir
                        jogadoresSelecionadosMap.Add("JC3_selected", jogadorSelecionado);
                    }
                }
                else
                {
                    MessageBox.Show("O jogador selecionado já foi selecionado noutro lugar!");
                    JC3_fora_combobox.SelectedItem = null; // Limpe a seleção se o jogador já foi selecionado antes
                }
            }
        }

        private void JC4_fora_combobox_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (JC4_fora_combobox.SelectedItem != null)
            {
                Jogador jogadorSelecionado = (Jogador)JC4_fora_combobox.SelectedItem;

                if (jogadoresSelecionadosMap?.Values.Any(j => j?.ID == jogadorSelecionado.ID) == false)
                {
                    if (jogadoresSelecionadosMap.ContainsKey("JC4_selected"))
                    {
                        // Atualize a entrada do dicionário se ela já existir
                        jogadoresSelecionadosMap["JC4_selected"] = jogadorSelecionado;
                    }
                    else
                    {
                        // Adicione a entrada ao dicionário se ela ainda não existir
                        jogadoresSelecionadosMap.Add("JC4_selected", jogadorSelecionado);
                    }
                }
                else
                {
                    MessageBox.Show("O jogador selecionado já foi selecionado noutro lugar!");
                    JC4_fora_combobox.SelectedItem = null; // Limpe a seleção se o jogador já foi selecionado antes
                }
            }
        }

        private void GR_fora_combobox_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (GR_fora_combobox.SelectedItem != null)
            {
                Jogador jogadorSelecionado = (Jogador)GR_fora_combobox.SelectedItem;

                if (jogadoresSelecionadosMap?.Values.Any(j => j?.ID == jogadorSelecionado.ID) == false)
                {
                    if (jogadoresSelecionadosMap.ContainsKey("GR_selected"))
                    {
                        // Atualize a entrada do dicionário se ela já existir
                        jogadoresSelecionadosMap["GR_selected"] = jogadorSelecionado;
                    }
                    else
                    {
                        // Adicione a entrada ao dicionário se ela ainda não existir
                        jogadoresSelecionadosMap.Add("GR_selected", jogadorSelecionado);
                    }
                }
                else
                {
                    MessageBox.Show("O jogador selecionado já foi selecionado noutro lugar!");
                    GR_fora_combobox.SelectedItem = null; // Limpe a seleção se o jogador já foi selecionado antes
                }
            }
        }

        private void TPR_fora_combobox_SelectedIndexChanged(object sender, EventArgs e)
        {
            Treinador treinadorSelecionado = (Treinador)TPR_fora_combobox.SelectedItem;

            if (treinadoresSelecionadosMap.ContainsKey("TPR_selected"))
            {
                // Atualize a entrada do dicionário se ela já existir
                treinadoresSelecionadosMap["TPR_selected"] = treinadorSelecionado;
            }
            else
            {
                // Adicione a entrada ao dicionário se ela ainda não existir
                treinadoresSelecionadosMap.Add("TPR_selected", treinadorSelecionado);
            }
        }

        private void TAD_fora_combobox_SelectedIndexChanged(object sender, EventArgs e)
        {
            Treinador treinadorSelecionado = (Treinador)TAD_fora_combobox.SelectedItem;

            if (treinadoresSelecionadosMap.ContainsKey("TAD_selected"))
            {
                // Atualize a entrada do dicionário se ela já existir
                treinadoresSelecionadosMap["TAD_selected"] = treinadorSelecionado;
            }
            else
            {
                // Adicione a entrada ao dicionário se ela ainda não existir
                treinadoresSelecionadosMap.Add("TAD_selected", treinadorSelecionado);
            }
        }

        private void arbitro1_combobox_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (arbitro1_combobox.SelectedItem != null)
            {
                Arbitro arbitroSelecionado = (Arbitro)arbitro1_combobox.SelectedItem;

                if (arbitrosSelecionadosMap?.Values.Any(j => j?.ID == arbitroSelecionado.ID) == false)
                {
                    if (arbitrosSelecionadosMap.ContainsKey("Arbitro1_selected"))
                    {
                        // Atualize a entrada do dicionário se ela já existir
                        arbitrosSelecionadosMap["Arbitro1_selected"] = arbitroSelecionado;
                    }
                    else
                    {
                        // Adicione a entrada ao dicionário se ela ainda não existir
                        arbitrosSelecionadosMap.Add("Arbitro1_selected", arbitroSelecionado);
                    }
                }
                else
                {
                    MessageBox.Show("O arbitro selecionado já foi selecionado noutro lugar!");
                    arbitro1_combobox.SelectedItem = null; 
                }
            }
        }

        private void arbitro2_combobox_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (arbitro2_combobox.SelectedItem != null)
            {
                Arbitro arbitroSelecionado = (Arbitro)arbitro2_combobox.SelectedItem;

                if (arbitrosSelecionadosMap?.Values.Any(j => j?.ID == arbitroSelecionado.ID) == false)
                {
                    if (arbitrosSelecionadosMap.ContainsKey("Arbitro2_selected"))
                    {
                        // Atualize a entrada do dicionário se ela já existir
                        arbitrosSelecionadosMap["Arbitro2_selected"] = arbitroSelecionado;
                    }
                    else
                    {
                        // Adicione a entrada ao dicionário se ela ainda não existir
                        arbitrosSelecionadosMap.Add("Arbitro2_selected", arbitroSelecionado);
                    }
                }
                else
                {
                    MessageBox.Show("O arbitro selecionado já foi selecionado noutro lugar!");
                    arbitro2_combobox.SelectedItem = null;
                }
            }
        }

        private void Equipa_button_Click(object sender, EventArgs e)
        {
            panelEquipas.Visible = true;
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
                Equipa E = new Equipa();
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
            textboxNomeEquipa.Text = ((Equipa)listBoxEquipas.SelectedItem).Nome;
            anoFundacao_textbox.Text = ((Equipa)listBoxEquipas.SelectedItem).AnoFundacao;
            pavilhaoNome_textbox.Text = ((Equipa)listBoxEquipas.SelectedItem).Pavilhao;
        }

        private void equipasJogos_button_Click(object sender, EventArgs e)
        {
            dataGridViewJogosEquipa.Visible = true;

            int clubeID = Int32.Parse(((Equipa)listBoxEquipas.SelectedItem).ID);

            cn = getSGBDConnection();
            cn.Open();

            using (SqlCommand command = new SqlCommand("HoqueiPortugues.", cn))
            {
                command.CommandType = CommandType.StoredProcedure;

                SqlDataReader reader = command.ExecuteReader();

                DataTable dataTable = new DataTable();

                dataTable.Load(reader);

                reader.Close();

                dataGridViewJogosEquipa.DataSource = dataTable;
            }

            // Renomear colunas e alterar largura
            dataGridView1.Columns[0].HeaderText = "Posição";
            dataGridView1.Columns[0].Width = 60;

            cn.Close();
        }

        private void equipasEquipa_button_Click(object sender, EventArgs e)
        {
            dataGridViewJogosEquipa.Visible = false;

            loadClubeEquipa();
        }

        private void loadClubeEquipa()
        {

        }




        private void jogadores_Click(object sender, EventArgs e)
        {

        }
    }
}
