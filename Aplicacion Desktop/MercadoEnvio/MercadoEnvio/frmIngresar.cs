using MercadoEnvio.Biz.Impl;
using MercadoEnvio.Common.FunctionalException;
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
                GlobalData.Instance.Roles = this._loginBiz.Login(this.txtUsuario.Text, this.txtClave.Text);

                this.Close();
            }
            catch (UsuarioException funEx)
            {
                switch (funEx.ExceptionType)
                {
                    case UsuarioTypeExcep.IntentosDeLoginFallidos_UsuarioBloqueado:
                        MessageBox.Show("Superó la cantidad de intentos fallidos. Usuario bloqueado.");
                        Application.Exit();
                        break;
                    case UsuarioTypeExcep.UsuarioInexistente:
                        MessageBox.Show("Usuario inexistente.");
                        break;
                    case UsuarioTypeExcep.ClaveIncorrecta:
                        MessageBox.Show("Clave incorrecta.");
                        break;
                }
            }
            this.LimpiarCampos();
        }

        private void btnSeleccionar_Click(object sender, EventArgs e)
        {

        }

        private void LimpiarCampos()
        {
            this.txtUsuario.Text = "";
            this.txtClave.Text = "";
        }
    }
}
