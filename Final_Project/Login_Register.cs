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

namespace Final_Project
{
    public partial class Login_Register : Form
    {
        List<Panel> listPanel = new List<Panel>();
        int index = 0;

        private SqlConnection cn;
        public int teste;

        public Login_Register()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            listPanel.Add(loginPanel);
            listPanel[index].BringToFront();
        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void textUsername_TextChanged(object sender, EventArgs e)
        {

        }

        private void textPassword_TextChanged(object sender, EventArgs e)
        {

        }

        private void login_Click(object sender, EventArgs e)
        {
            if (textBox2.Text == "admin" && textBox1.Text == "1234")
            {
                new Main_Admin().Show();
                this.Hide();
            }
            else if(textBox2.Text == "admin" && textBox1.Text != "1234")
            {
                MessageBox.Show("Password de Admin Incorreta!");
            }
            else
            {
                new Main_Client().Show();
                this.Hide();
            }
        }
    }
}
