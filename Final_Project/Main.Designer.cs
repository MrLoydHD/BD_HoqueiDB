
namespace Final_Project
{
    partial class Main
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Main));
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.classificacaoButton = new System.Windows.Forms.Button();
            this.panelClassificacao = new System.Windows.Forms.Panel();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.classificacaoLabel = new System.Windows.Forms.Label();
            this.calendario_button = new System.Windows.Forms.Button();
            this.Equipa_button = new System.Windows.Forms.Button();
            this.logOut_button = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.panelClassificacao.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
            this.pictureBox1.Location = new System.Drawing.Point(1, -10);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(84, 84);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.pictureBox1.TabIndex = 0;
            this.pictureBox1.TabStop = false;
            // 
            // classificacaoButton
            // 
            this.classificacaoButton.BackColor = System.Drawing.Color.DarkOrange;
            this.classificacaoButton.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.classificacaoButton.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.classificacaoButton.ForeColor = System.Drawing.Color.White;
            this.classificacaoButton.Location = new System.Drawing.Point(91, 12);
            this.classificacaoButton.Name = "classificacaoButton";
            this.classificacaoButton.Size = new System.Drawing.Size(120, 46);
            this.classificacaoButton.TabIndex = 5;
            this.classificacaoButton.Text = "Classificação";
            this.classificacaoButton.UseVisualStyleBackColor = false;
            this.classificacaoButton.Click += new System.EventHandler(this.classificacaoButton_Click);
            // 
            // panelClassificacao
            // 
            this.panelClassificacao.Controls.Add(this.dataGridView1);
            this.panelClassificacao.Controls.Add(this.classificacaoLabel);
            this.panelClassificacao.Location = new System.Drawing.Point(1, 80);
            this.panelClassificacao.Name = "panelClassificacao";
            this.panelClassificacao.Size = new System.Drawing.Size(818, 497);
            this.panelClassificacao.TabIndex = 6;
            this.panelClassificacao.Visible = false;
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(18, 61);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowHeadersWidth = 30;
            this.dataGridView1.Size = new System.Drawing.Size(781, 364);
            this.dataGridView1.TabIndex = 8;
            // 
            // classificacaoLabel
            // 
            this.classificacaoLabel.Font = new System.Drawing.Font("Segoe UI", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.classificacaoLabel.ForeColor = System.Drawing.Color.DarkOrange;
            this.classificacaoLabel.Location = new System.Drawing.Point(0, -19);
            this.classificacaoLabel.Name = "classificacaoLabel";
            this.classificacaoLabel.Size = new System.Drawing.Size(818, 58);
            this.classificacaoLabel.TabIndex = 7;
            this.classificacaoLabel.Text = "Tabela de Classificação";
            this.classificacaoLabel.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // calendario_button
            // 
            this.calendario_button.BackColor = System.Drawing.Color.DarkOrange;
            this.calendario_button.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.calendario_button.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.calendario_button.ForeColor = System.Drawing.Color.White;
            this.calendario_button.Location = new System.Drawing.Point(217, 12);
            this.calendario_button.Name = "calendario_button";
            this.calendario_button.Size = new System.Drawing.Size(193, 46);
            this.calendario_button.TabIndex = 9;
            this.calendario_button.Text = "Calendário/Resultados";
            this.calendario_button.UseVisualStyleBackColor = false;
            // 
            // Equipa_button
            // 
            this.Equipa_button.BackColor = System.Drawing.Color.DarkOrange;
            this.Equipa_button.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.Equipa_button.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Equipa_button.ForeColor = System.Drawing.Color.White;
            this.Equipa_button.Location = new System.Drawing.Point(416, 12);
            this.Equipa_button.Name = "Equipa_button";
            this.Equipa_button.Size = new System.Drawing.Size(85, 46);
            this.Equipa_button.TabIndex = 10;
            this.Equipa_button.Text = "Equipa";
            this.Equipa_button.UseVisualStyleBackColor = false;
            // 
            // logOut_button
            // 
            this.logOut_button.BackColor = System.Drawing.Color.DarkOrange;
            this.logOut_button.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.logOut_button.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.logOut_button.ForeColor = System.Drawing.Color.White;
            this.logOut_button.Location = new System.Drawing.Point(722, 12);
            this.logOut_button.Name = "logOut_button";
            this.logOut_button.Size = new System.Drawing.Size(85, 46);
            this.logOut_button.TabIndex = 13;
            this.logOut_button.Text = "Log Out";
            this.logOut_button.UseVisualStyleBackColor = false;
            this.logOut_button.Click += new System.EventHandler(this.logOut_button_Click);
            // 
            // Main
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(819, 577);
            this.Controls.Add(this.logOut_button);
            this.Controls.Add(this.Equipa_button);
            this.Controls.Add(this.calendario_button);
            this.Controls.Add(this.panelClassificacao);
            this.Controls.Add(this.classificacaoButton);
            this.Controls.Add(this.pictureBox1);
            this.Name = "Main";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Main";
            this.Load += new System.EventHandler(this.Main_Load);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.panelClassificacao.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Button classificacaoButton;
        private System.Windows.Forms.Panel panelClassificacao;
        private System.Windows.Forms.Label classificacaoLabel;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Button calendario_button;
        private System.Windows.Forms.Button Equipa_button;
        private System.Windows.Forms.Button logOut_button;
    }
}