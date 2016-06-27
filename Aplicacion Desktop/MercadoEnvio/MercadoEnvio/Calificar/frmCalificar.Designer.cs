namespace MercadoEnvio.Calificar
{
    partial class frmCalificar
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            this.grvCalificacion = new System.Windows.Forms.DataGridView();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.rdbOpcion2 = new System.Windows.Forms.RadioButton();
            this.rdbOpcion1 = new System.Windows.Forms.RadioButton();
            this.btnSeleccionar = new System.Windows.Forms.Button();
            this.tcbCalificacion = new System.Windows.Forms.TrackBar();
            this.txtComentario = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.grvCalificacion)).BeginInit();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.tcbCalificacion)).BeginInit();
            this.SuspendLayout();
            // 
            // grvCalificacion
            // 
            this.grvCalificacion.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.grvCalificacion.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.grvCalificacion.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle2.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.grvCalificacion.DefaultCellStyle = dataGridViewCellStyle2;
            this.grvCalificacion.Location = new System.Drawing.Point(12, 132);
            this.grvCalificacion.MultiSelect = false;
            this.grvCalificacion.Name = "grvCalificacion";
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle3.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle3.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle3.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle3.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle3.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.grvCalificacion.RowHeadersDefaultCellStyle = dataGridViewCellStyle3;
            this.grvCalificacion.Size = new System.Drawing.Size(424, 248);
            this.grvCalificacion.TabIndex = 16;
            this.grvCalificacion.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.grvCalificacion_CellClick);
            // 
            // groupBox1
            // 
            this.groupBox1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox1.Controls.Add(this.rdbOpcion2);
            this.groupBox1.Controls.Add(this.rdbOpcion1);
            this.groupBox1.Location = new System.Drawing.Point(12, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(424, 62);
            this.groupBox1.TabIndex = 15;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Filtros";
            // 
            // rdbOpcion2
            // 
            this.rdbOpcion2.AutoSize = true;
            this.rdbOpcion2.Location = new System.Drawing.Point(172, 29);
            this.rdbOpcion2.Name = "rdbOpcion2";
            this.rdbOpcion2.Size = new System.Drawing.Size(133, 17);
            this.rdbOpcion2.TabIndex = 3;
            this.rdbOpcion2.Text = "Pendientes de Calificar";
            this.rdbOpcion2.UseVisualStyleBackColor = true;
            this.rdbOpcion2.CheckedChanged += new System.EventHandler(this.rdbOpcion_CheckedChanged);
            // 
            // rdbOpcion1
            // 
            this.rdbOpcion1.AutoSize = true;
            this.rdbOpcion1.Checked = true;
            this.rdbOpcion1.Location = new System.Drawing.Point(19, 29);
            this.rdbOpcion1.Name = "rdbOpcion1";
            this.rdbOpcion1.Size = new System.Drawing.Size(126, 17);
            this.rdbOpcion1.TabIndex = 2;
            this.rdbOpcion1.TabStop = true;
            this.rdbOpcion1.Text = "Ultimas calificaciones";
            this.rdbOpcion1.UseVisualStyleBackColor = true;
            this.rdbOpcion1.CheckedChanged += new System.EventHandler(this.rdbOpcion_CheckedChanged);
            // 
            // btnSeleccionar
            // 
            this.btnSeleccionar.Location = new System.Drawing.Point(12, 80);
            this.btnSeleccionar.Name = "btnSeleccionar";
            this.btnSeleccionar.Size = new System.Drawing.Size(75, 46);
            this.btnSeleccionar.TabIndex = 20;
            this.btnSeleccionar.Text = "&Calificar";
            this.btnSeleccionar.UseVisualStyleBackColor = true;
            this.btnSeleccionar.Click += new System.EventHandler(this.btnSeleccionar_Click);
            // 
            // tcbCalificacion
            // 
            this.tcbCalificacion.Location = new System.Drawing.Point(94, 81);
            this.tcbCalificacion.Maximum = 5;
            this.tcbCalificacion.Name = "tcbCalificacion";
            this.tcbCalificacion.Size = new System.Drawing.Size(104, 45);
            this.tcbCalificacion.TabIndex = 21;
            // 
            // txtComentario
            // 
            this.txtComentario.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtComentario.Location = new System.Drawing.Point(205, 81);
            this.txtComentario.MaxLength = 255;
            this.txtComentario.Multiline = true;
            this.txtComentario.Name = "txtComentario";
            this.txtComentario.Size = new System.Drawing.Size(231, 45);
            this.txtComentario.TabIndex = 22;
            // 
            // frmCalificar
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(448, 392);
            this.Controls.Add(this.txtComentario);
            this.Controls.Add(this.tcbCalificacion);
            this.Controls.Add(this.btnSeleccionar);
            this.Controls.Add(this.grvCalificacion);
            this.Controls.Add(this.groupBox1);
            this.Name = "frmCalificar";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.grvCalificacion)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.tcbCalificacion)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView grvCalificacion;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.RadioButton rdbOpcion2;
        private System.Windows.Forms.RadioButton rdbOpcion1;
        private System.Windows.Forms.Button btnSeleccionar;
        private System.Windows.Forms.TrackBar tcbCalificacion;
        private System.Windows.Forms.TextBox txtComentario;
    }
}