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
using System.Windows.Forms;
using WindowsFormsApplication1.Core;

namespace WindowsFormsApplication1
{
    public partial class frmIngresar : Form
    {
        private bool _esLogin;

        private LoginBiz _loginBiz;

        public frmIngresar()
        {
            InitializeComponent();

            this._loginBiz = new LoginBiz();
            this._esLogin = true;
        }

        public void SetUsuario(string usuario)
        {
            this._esLogin = false;
            this.txtUsuario.Text = usuario;
            this.txtUsuario.ReadOnly = true;
            this.txtRepetir.Visible = true;
            this.label4.Visible = true;
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnAceptar_Click(object sender, EventArgs e)
        {
            if (this._esLogin)
            {
                try
                {
                    var roles = this._loginBiz.Login(this.txtUsuario.Text, this.txtClave.Text, GlobalData.Instance.FechaSistema);

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
            else
            {
                if (this.txtClave.Text != this.txtRepetir.Text)
                {
                    MessageBox.Show("La clave ingresada no coincide con la repetida.");
                    return;
                }
                this._loginBiz.CreateLoginData(this.txtUsuario.Text, this.txtClave.Text);
                MessageBox.Show("La clave fue cambiada con éxito.");
                this.Close();
            }
        }

        private void btnSeleccionar_Click(object sender, EventArgs e)
        {
            GlobalData.Instance.SetRol((Rol)this.cmbRol.SelectedItem);
            this.Close();
        }

        private void LimpiarCampos()
        {
            if (this._esLogin)
            {
                this.txtUsuario.Text = "";
                this.txtClave.Text = "";
            }
            else
            {
                this.txtClave.Text = "";
                this.txtRepetir.Text = "";
            }
        }

        private void frmIngresar_FormClosed(object sender, FormClosedEventArgs e)
        {
            if (this._esLogin)
            {
                if (GlobalData.Instance.Rol == null)
                {
                    Application.Exit();
                }
            }
        }
    }
}
