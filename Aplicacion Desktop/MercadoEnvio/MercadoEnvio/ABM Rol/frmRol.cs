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

namespace MercadoEnvio.ABM_Rol
{
    public partial class frmRol : Form, IFormMDI
    {
        private RolBiz _rolBiz;

        public FormFactory FormFactory { get; set; }

        public frmRol()
        {
            InitializeComponent();
            this._rolBiz = new RolBiz();
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            var roles = this._rolBiz.GetBy(this.textBox1.Text);
            this.grvRol.DataSource = roles;
        }
    }
}
