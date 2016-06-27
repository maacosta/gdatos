namespace MercadoEnvio.Historial_Cliente
{
    partial class frmHistorialCliente
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle13 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle14 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle15 = new System.Windows.Forms.DataGridViewCellStyle();
            this.grvCompraOferta = new System.Windows.Forms.DataGridView();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.rdbOpcion1 = new System.Windows.Forms.RadioButton();
            this.rdbOpcion2 = new System.Windows.Forms.RadioButton();
            this.rdbOpcion3 = new System.Windows.Forms.RadioButton();
            ((System.ComponentModel.ISupportInitialize)(this.grvCompraOferta)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // grvCompraOferta
            // 
            this.grvCompraOferta.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            dataGridViewCellStyle13.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle13.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle13.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle13.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle13.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle13.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle13.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.grvCompraOferta.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle13;
            this.grvCompraOferta.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridViewCellStyle14.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle14.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle14.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle14.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle14.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle14.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle14.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.grvCompraOferta.DefaultCellStyle = dataGridViewCellStyle14;
            this.grvCompraOferta.Location = new System.Drawing.Point(12, 80);
            this.grvCompraOferta.MultiSelect = false;
            this.grvCompraOferta.Name = "grvCompraOferta";
            dataGridViewCellStyle15.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle15.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle15.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle15.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle15.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle15.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle15.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.grvCompraOferta.RowHeadersDefaultCellStyle = dataGridViewCellStyle15;
            this.grvCompraOferta.Size = new System.Drawing.Size(424, 300);
            this.grvCompraOferta.TabIndex = 14;
            // 
            // groupBox1
            // 
            this.groupBox1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox1.Controls.Add(this.rdbOpcion3);
            this.groupBox1.Controls.Add(this.rdbOpcion2);
            this.groupBox1.Controls.Add(this.rdbOpcion1);
            this.groupBox1.Location = new System.Drawing.Point(12, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(424, 62);
            this.groupBox1.TabIndex = 13;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Filtros";
            // 
            // rdbOpcion1
            // 
            this.rdbOpcion1.AutoSize = true;
            this.rdbOpcion1.Checked = true;
            this.rdbOpcion1.Location = new System.Drawing.Point(19, 29);
            this.rdbOpcion1.Name = "rdbOpcion1";
            this.rdbOpcion1.Size = new System.Drawing.Size(50, 17);
            this.rdbOpcion1.TabIndex = 2;
            this.rdbOpcion1.TabStop = true;
            this.rdbOpcion1.Text = "Todo";
            this.rdbOpcion1.UseVisualStyleBackColor = true;
            this.rdbOpcion1.CheckedChanged += new System.EventHandler(this.rdbOpcion_CheckedChanged);
            // 
            // rdbOpcion2
            // 
            this.rdbOpcion2.AutoSize = true;
            this.rdbOpcion2.Location = new System.Drawing.Point(121, 29);
            this.rdbOpcion2.Name = "rdbOpcion2";
            this.rdbOpcion2.Size = new System.Drawing.Size(80, 17);
            this.rdbOpcion2.TabIndex = 3;
            this.rdbOpcion2.Text = "Sin Calificar";
            this.rdbOpcion2.UseVisualStyleBackColor = true;
            this.rdbOpcion2.CheckedChanged += new System.EventHandler(this.rdbOpcion_CheckedChanged);
            // 
            // rdbOpcion3
            // 
            this.rdbOpcion3.AutoSize = true;
            this.rdbOpcion3.Location = new System.Drawing.Point(223, 29);
            this.rdbOpcion3.Name = "rdbOpcion3";
            this.rdbOpcion3.Size = new System.Drawing.Size(90, 17);
            this.rdbOpcion3.TabIndex = 4;
            this.rdbOpcion3.Text = "Calificaciones";
            this.rdbOpcion3.UseVisualStyleBackColor = true;
            this.rdbOpcion3.CheckedChanged += new System.EventHandler(this.rdbOpcion_CheckedChanged);
            // 
            // frmHistorialCliente
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(448, 392);
            this.Controls.Add(this.grvCompraOferta);
            this.Controls.Add(this.groupBox1);
            this.Name = "frmHistorialCliente";
            this.Text = "Historial Cliente";
            this.Load += new System.EventHandler(this.frmHistorialCliente_Load);
            ((System.ComponentModel.ISupportInitialize)(this.grvCompraOferta)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView grvCompraOferta;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.RadioButton rdbOpcion3;
        private System.Windows.Forms.RadioButton rdbOpcion2;
        private System.Windows.Forms.RadioButton rdbOpcion1;
    }
}