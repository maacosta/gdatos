namespace WindowsFormsApplication1
{
    partial class frmContenedor
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
            this.mnuME = new System.Windows.Forms.MenuStrip();
            this.aplicaciónToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.salirToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.módulosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.aBMRolToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.aBMRubroToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.aBMUsuarioToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.aBMVisibilidadToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.generarPublicaciónToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.historialClienteToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.comprarOfertarToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.facturasToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.listadoEstadísticoToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.seguridadToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.calificarToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuME.SuspendLayout();
            this.SuspendLayout();
            // 
            // mnuME
            // 
            this.mnuME.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.aplicaciónToolStripMenuItem,
            this.módulosToolStripMenuItem,
            this.seguridadToolStripMenuItem});
            this.mnuME.Location = new System.Drawing.Point(0, 0);
            this.mnuME.Name = "mnuME";
            this.mnuME.Size = new System.Drawing.Size(635, 24);
            this.mnuME.TabIndex = 1;
            this.mnuME.Text = "menuStrip1";
            // 
            // aplicaciónToolStripMenuItem
            // 
            this.aplicaciónToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.salirToolStripMenuItem});
            this.aplicaciónToolStripMenuItem.Name = "aplicaciónToolStripMenuItem";
            this.aplicaciónToolStripMenuItem.Size = new System.Drawing.Size(75, 20);
            this.aplicaciónToolStripMenuItem.Text = "&Aplicación";
            // 
            // salirToolStripMenuItem
            // 
            this.salirToolStripMenuItem.Name = "salirToolStripMenuItem";
            this.salirToolStripMenuItem.Size = new System.Drawing.Size(96, 22);
            this.salirToolStripMenuItem.Text = "&Salir";
            this.salirToolStripMenuItem.Click += new System.EventHandler(this.salirToolStripMenuItem_Click);
            // 
            // módulosToolStripMenuItem
            // 
            this.módulosToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.aBMRolToolStripMenuItem,
            this.aBMRubroToolStripMenuItem,
            this.aBMUsuarioToolStripMenuItem,
            this.aBMVisibilidadToolStripMenuItem,
            this.generarPublicaciónToolStripMenuItem,
            this.historialClienteToolStripMenuItem,
            this.comprarOfertarToolStripMenuItem,
            this.facturasToolStripMenuItem,
            this.listadoEstadísticoToolStripMenuItem,
            this.calificarToolStripMenuItem});
            this.módulosToolStripMenuItem.Name = "módulosToolStripMenuItem";
            this.módulosToolStripMenuItem.Size = new System.Drawing.Size(66, 20);
            this.módulosToolStripMenuItem.Text = "&Módulos";
            // 
            // aBMRolToolStripMenuItem
            // 
            this.aBMRolToolStripMenuItem.Name = "aBMRolToolStripMenuItem";
            this.aBMRolToolStripMenuItem.Size = new System.Drawing.Size(180, 22);
            this.aBMRolToolStripMenuItem.Text = "ABM &Rol";
            this.aBMRolToolStripMenuItem.Click += new System.EventHandler(this.aBMRolToolStripMenuItem_Click);
            // 
            // aBMRubroToolStripMenuItem
            // 
            this.aBMRubroToolStripMenuItem.Name = "aBMRubroToolStripMenuItem";
            this.aBMRubroToolStripMenuItem.Size = new System.Drawing.Size(180, 22);
            this.aBMRubroToolStripMenuItem.Text = "ABM Ru&bro";
            this.aBMRubroToolStripMenuItem.Click += new System.EventHandler(this.aBMRubroToolStripMenuItem_Click);
            // 
            // aBMUsuarioToolStripMenuItem
            // 
            this.aBMUsuarioToolStripMenuItem.Name = "aBMUsuarioToolStripMenuItem";
            this.aBMUsuarioToolStripMenuItem.Size = new System.Drawing.Size(180, 22);
            this.aBMUsuarioToolStripMenuItem.Text = "ABM &Usuario";
            this.aBMUsuarioToolStripMenuItem.Click += new System.EventHandler(this.aBMUsuarioToolStripMenuItem_Click);
            // 
            // aBMVisibilidadToolStripMenuItem
            // 
            this.aBMVisibilidadToolStripMenuItem.Name = "aBMVisibilidadToolStripMenuItem";
            this.aBMVisibilidadToolStripMenuItem.Size = new System.Drawing.Size(180, 22);
            this.aBMVisibilidadToolStripMenuItem.Text = "ABM &Visibilidad";
            this.aBMVisibilidadToolStripMenuItem.Click += new System.EventHandler(this.aBMVisibilidadToolStripMenuItem_Click);
            // 
            // generarPublicaciónToolStripMenuItem
            // 
            this.generarPublicaciónToolStripMenuItem.Name = "generarPublicaciónToolStripMenuItem";
            this.generarPublicaciónToolStripMenuItem.Size = new System.Drawing.Size(180, 22);
            this.generarPublicaciónToolStripMenuItem.Text = "Generar &Publicación";
            this.generarPublicaciónToolStripMenuItem.Click += new System.EventHandler(this.generarPublicaciónToolStripMenuItem_Click);
            // 
            // historialClienteToolStripMenuItem
            // 
            this.historialClienteToolStripMenuItem.Name = "historialClienteToolStripMenuItem";
            this.historialClienteToolStripMenuItem.Size = new System.Drawing.Size(180, 22);
            this.historialClienteToolStripMenuItem.Text = "&Historial Cliente";
            this.historialClienteToolStripMenuItem.Click += new System.EventHandler(this.historialClienteToolStripMenuItem_Click);
            // 
            // comprarOfertarToolStripMenuItem
            // 
            this.comprarOfertarToolStripMenuItem.Name = "comprarOfertarToolStripMenuItem";
            this.comprarOfertarToolStripMenuItem.Size = new System.Drawing.Size(180, 22);
            this.comprarOfertarToolStripMenuItem.Text = "&Comprar / Ofertar";
            this.comprarOfertarToolStripMenuItem.Click += new System.EventHandler(this.comprarOfertarToolStripMenuItem_Click);
            // 
            // facturasToolStripMenuItem
            // 
            this.facturasToolStripMenuItem.Name = "facturasToolStripMenuItem";
            this.facturasToolStripMenuItem.Size = new System.Drawing.Size(180, 22);
            this.facturasToolStripMenuItem.Text = "&Facturas";
            this.facturasToolStripMenuItem.Click += new System.EventHandler(this.facturasToolStripMenuItem_Click);
            // 
            // listadoEstadísticoToolStripMenuItem
            // 
            this.listadoEstadísticoToolStripMenuItem.Name = "listadoEstadísticoToolStripMenuItem";
            this.listadoEstadísticoToolStripMenuItem.Size = new System.Drawing.Size(180, 22);
            this.listadoEstadísticoToolStripMenuItem.Text = "Listado &Estadístico";
            this.listadoEstadísticoToolStripMenuItem.Click += new System.EventHandler(this.listadoEstadísticoToolStripMenuItem_Click);
            // 
            // seguridadToolStripMenuItem
            // 
            this.seguridadToolStripMenuItem.Name = "seguridadToolStripMenuItem";
            this.seguridadToolStripMenuItem.Size = new System.Drawing.Size(72, 20);
            this.seguridadToolStripMenuItem.Text = "&Seguridad";
            // 
            // calificarToolStripMenuItem
            // 
            this.calificarToolStripMenuItem.Name = "calificarToolStripMenuItem";
            this.calificarToolStripMenuItem.Size = new System.Drawing.Size(180, 22);
            this.calificarToolStripMenuItem.Text = "C&alificar";
            this.calificarToolStripMenuItem.Click += new System.EventHandler(this.calificarToolStripMenuItem_Click);
            // 
            // frmContenedor
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(635, 469);
            this.Controls.Add(this.mnuME);
            this.IsMdiContainer = true;
            this.MainMenuStrip = this.mnuME;
            this.Name = "frmContenedor";
            this.Text = "MercadoEnvio";
            this.Load += new System.EventHandler(this.Contenedor_Load);
            this.mnuME.ResumeLayout(false);
            this.mnuME.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip mnuME;
        private System.Windows.Forms.ToolStripMenuItem aplicaciónToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem salirToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem módulosToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem seguridadToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem aBMRolToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem aBMRubroToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem aBMUsuarioToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem aBMVisibilidadToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem generarPublicaciónToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem historialClienteToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem comprarOfertarToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem facturasToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem listadoEstadísticoToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem calificarToolStripMenuItem;
    }
}