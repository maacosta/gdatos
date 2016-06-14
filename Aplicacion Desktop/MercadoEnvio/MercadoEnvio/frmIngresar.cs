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

namespace WindowsFormsApplication1
{
    public partial class frmIngresar : Form
    {
        public frmIngresar()
        {
            InitializeComponent();

            LoginBiz login = new LoginBiz();

            var plainText = "clave";
            string salt;
            var hash = login.ComputeHash(plainText, out salt);
            var res = login.GetHashing(plainText, salt);

            var r = res == hash;
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnAceptar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnSeleccionar_Click(object sender, EventArgs e)
        {

        }
    }
}
