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

namespace MercadoEnvio.ABM_Rubro
{
    public partial class frmRubro : Form
    {
        private RubroBiz _rubroBiz;

        public frmRubro()
        {
            InitializeComponent();
            this._rubroBiz = new RubroBiz();
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            var list = this._rubroBiz.GetByDesc(this.txtTexto.Text);

            this.grvRubro.DataSource = list;
        }
    }
}
