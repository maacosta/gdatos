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

namespace MercadoEnvio.Generar_Publicación
{
    public partial class frmGenerarPublicacion : Form, IFormMDI
    {
        private PublicacionBiz _publicacionBiz;

        public FormFactory FormFactory { get; set; }

        public frmGenerarPublicacion()
        {
            InitializeComponent();
            this._publicacionBiz = new PublicacionBiz();
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            var list = this._publicacionBiz.GetByDesc(GlobalData.Instance.Username, this.txtTexto.Text);

            this.grvPublicacion.DataSource = list;
        }

        private void btnLimpiar_Click(object sender, EventArgs e)
        {
            this.txtTexto.Text = "";
        }

        private void btnSeleccionar_Click(object sender, EventArgs e)
        {
            if (this.grvPublicacion.CurrentRow == null)
            {
                MessageBox.Show("Debe seleccionar un item");
                return;
            }

            var frm = this.FormFactory.OpenChildForm<frmAMPublicacion>();
            frm.SetPublicacion((Publicacion)this.grvPublicacion.CurrentRow.DataBoundItem);
        }

        private void btnNuevo_Click(object sender, EventArgs e)
        {
            var frm = this.FormFactory.OpenChildForm<frmAMPublicacion>();
            frm.SetNewPublicacion();
        }
    }
}
