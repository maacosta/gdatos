using MercadoEnvio.Biz.Impl;
using MercadoEnvio.Common.Entity;
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
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                var roles = this._loginBiz.Login(this.txtUsuario.Text, this.txtClave.Text);

                GlobalData.Instance.Username = this.txtUsuario.Text;
                if (roles.Count == 1)
                {
                    GlobalData.Instance.SetRol(roles[0]);
                    this.Close();
                }
                else
                {
                    this.grbAutenticacion.Visible = false;
                    this.cmbRol.DataSource = roles;
                    this.cmbRol.DisplayMember = "Nombre";
                }

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
                this.LimpiarCampos();
            }
        }

        private void btnSeleccionar_Click(object sender, EventArgs e)
        {
            GlobalData.Instance.SetRol((Rol)this.cmbRol.SelectedItem);
            this.Close();
        }

        private void LimpiarCampos()
        {
            this.txtUsuario.Text = "";
            this.txtClave.Text = "";
        }

        private void frmIngresar_FormClosed(object sender, FormClosedEventArgs e)
        {
            if (GlobalData.Instance.Rol == null)
            {
                Application.Exit();
            }
        }
    }
}
