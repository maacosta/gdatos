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

namespace MercadoEnvio.ABM_Rubro
{
    public partial class frmRubro : Form, IFormMDI
    {
        private RubroBiz _rubroBiz;

        public FormFactory FormFactory { get; set; }
        public Rubro Rubro { get { return null; } }

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
