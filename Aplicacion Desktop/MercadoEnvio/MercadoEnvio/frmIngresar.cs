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
        private LoginBiz _loginBiz;

        public frmIngresar()
        {
            InitializeComponent();

            this._loginBiz = new LoginBiz();

            //var plainText = "admin";
            //string salt;
            //var hash = this._loginBiz.ComputeHash(plainText, out salt);
            //var res = this._loginBiz.GetHashing(plainText, salt);

            //var r = res == hash;
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                if (this._loginBiz.Login(this.txtUsuario.Text, this.txtClave.Text))
                {
                    this.Close();
                }
                else
                {
                    MessageBox.Show("Usuario o Clave incorrecta");
                    this.txtUsuario.Text = "";
                    this.txtClave.Text = "";
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Usuario bloqueado");
                this.Close();
            }
        }

        private void btnSeleccionar_Click(object sender, EventArgs e)
        {

        }
    }
}
