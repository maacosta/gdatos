using MercadoEnvio.Biz.Impl;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using WindowsFormsApplication1.Core;

namespace MercadoEnvio.Historial_Cliente
{
    public partial class frmHistorialCliente : Form, IFormMDI
    {
        private CompraOfertaBiz _compraOfertaBiz;

        public FormFactory FormFactory { get; set; }

        public frmHistorialCliente()
        {
            InitializeComponent();
            this._compraOfertaBiz = new CompraOfertaBiz();
        }

        private void frmHistorialCliente_Load(object sender, EventArgs e)
        {
            this.LoadHistory();
        }

        private void rdbOpcion_CheckedChanged(object sender, EventArgs e)
        {
            this.LoadHistory();
        }

        private void LoadHistory()
        {
            int opcion = this.rdbOpcion1.Checked ? 1 : this.rdbOpcion2.Checked ? 2 : 3;
            var coList = this._compraOfertaBiz.GetByOpcion(GlobalData.Instance.Username, opcion);
            this.grvCompraOferta.DataSource = coList;
        }
    }
}
