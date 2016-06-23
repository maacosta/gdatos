using MercadoEnvio.ABM_Rubro;
using MercadoEnvio.Biz.Impl;
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

namespace MercadoEnvio.ComprarOfertar
{
    public partial class frmComprarOfertar : Form, IFormMDI
    {
        private PublicacionBiz _publicacionBiz;

        public FormFactory FormFactory { get; set; }

        public frmComprarOfertar()
        {
            InitializeComponent();
            this._publicacionBiz = new PublicacionBiz();
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            var list = this._publicacionBiz.GetNoPropiasBy(GlobalData.Instance.Username, this.txtTexto.Text, this.ucmsRubro.TextDescription);

            this.grvPublicacion.DataSource = list;
        }

        private void btnLimpiar_Click(object sender, EventArgs e)
        {
            this.txtTexto.Text = "";
            this.ucmsRubro.CleanObjects();
        }

        private void ucmsRubro_SelectionClick(object sender, EventArgs e)
        {
            var frm = this.FormFactory.AppendChildForm<frmRubro>();
            frm.SeleccionMultiple = true;
            frm.ShowDialog();
            if (frm.RubroList.Count > 0)
            {
                this.ucmsRubro.CleanObjects();
                frm.RubroList.ForEach(r => this.ucmsRubro.SetObject(r, r.Codigo));
            }
        }
    }
}
