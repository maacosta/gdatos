using MercadoEnvio.Biz.Impl;
using MercadoEnvio.Common.Entity;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using WindowsFormsApplication1.Core;

namespace MercadoEnvio.ABM_Visibilidad
{
    public partial class frmVisibilidad : Form, IFormMDI
    {
        private VisibilidadBiz _visibilidadBiz;

        public FormFactory FormFactory { get; set; }
        public Visibilidad Visibilidad 
        { 
            get 
            { 
                return this.grvVisibilidad.CurrentRow != null ? (Visibilidad)this.grvVisibilidad.CurrentRow.DataBoundItem : null; 
            } 
        }

        public frmVisibilidad()
        {
            InitializeComponent();
            this._visibilidadBiz = new VisibilidadBiz();
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            var list = this._visibilidadBiz.GetByDesc(this.txtTexto.Text);

            this.grvVisibilidad.DataSource = list;
        }

        private void btnLimpiar_Click(object sender, EventArgs e)
        {
            this.txtTexto.Text = "";
        }

        private void btnSeleccionar_Click(object sender, EventArgs e)
        {
            if (this.grvVisibilidad.CurrentRow == null)
            {
                MessageBox.Show("Seleccione un item.");
            }
            else
                this.Close();
        }
    }
}
