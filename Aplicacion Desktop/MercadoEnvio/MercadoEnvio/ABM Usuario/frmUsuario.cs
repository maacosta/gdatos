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
using WindowsFormsApplication1;
using WindowsFormsApplication1.ABM_Usuario;
using WindowsFormsApplication1.Core;

namespace MercadoEnvio.ABM_Usuario
{
    public partial class frmUsuario : Form, IFormMDI
    {
        private List<string> _tipoUsuarios;
        const string CLIENTE = "Cliente";
        const string EMPRESA = "Empresa";

        private UsuarioBiz _usuarioBiz;

        public FormFactory FormFactory { get; set; }

        public frmUsuario()
        {
            InitializeComponent();
            this._usuarioBiz = new UsuarioBiz();
        }

        private void frmUsuario_Load(object sender, EventArgs e)
        {
            this._tipoUsuarios = new List<string>()
            {
                CLIENTE, EMPRESA
            };
            this.cmbRol.DataSource = this._tipoUsuarios;
        }

        private void cmbRol_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.cmbRol.SelectedValue.ToString() == CLIENTE)
            {
                this.grbCliente.Location = new Point(12, 72);
                this.grbEmpresa.Location = new Point(12, -172);
                this.btnNuevo.Text = "&Nuevo Cliente";
            }
            else if (this.cmbRol.SelectedValue.ToString() == EMPRESA)
            {
                this.grbCliente.Location = new Point(12, -172);
                this.grbEmpresa.Location = new Point(12, 72);
                this.btnNuevo.Text = "&Nueva Empresa";
            }
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            if (this.cmbRol.SelectedValue.ToString() == CLIENTE)
            {
                decimal dni = 0;
                decimal.TryParse(this.txtDni.Text, out dni);
                var clientes = this._usuarioBiz.GetByCliente(this.txtNombre.Text, this.txtApellido.Text, dni, this.txtEmailC.Text);
                this.grvUsuario.DataSource = clientes;
            }
            else if (this.cmbRol.SelectedValue.ToString() == EMPRESA)
            {
                var empresas = this._usuarioBiz.GetByEmpresa(this.txtRazonSocial.Text, this.txtCUIT.Text, this.txtEmailE.Text);
                this.grvUsuario.DataSource = empresas;
            }
        }

        private void btnSeleccionar_Click(object sender, EventArgs e)
        {
            if (this.grvUsuario.CurrentRow.DataBoundItem == null)
            {
                MessageBox.Show("Seleccione un item.");
                return;
            }
            var frm = this.FormFactory.OpenChildForm<frmAMUsuario>();
            frm.SetUsuario((Usuario)this.grvUsuario.CurrentRow.DataBoundItem);
        }

        private void btnLimpiar_Click(object sender, EventArgs e)
        {
            this.txtNombre.Text = string.Empty;
            this.txtApellido.Text = string.Empty;
            this.txtDni.Text = string.Empty;
            this.txtEmailC.Text = string.Empty;
            this.txtRazonSocial.Text = string.Empty;
            this.txtCUIT.Text = string.Empty;
            this.txtEmailE.Text = string.Empty;
        }

        private void btnCambiarClave_Click(object sender, EventArgs e)
        {
            if (this.grvUsuario.CurrentRow.DataBoundItem == null)
            {
                MessageBox.Show("Seleccione un item.");
                return;
            }
            var usuario = (Usuario)this.grvUsuario.CurrentRow.DataBoundItem;
            var frm = this.FormFactory.AppendChildForm<frmIngresar>();
            frm.SetUsuario(usuario.Username);
            frm.ShowDialog();
        }

        private void btnNuevo_Click(object sender, EventArgs e)
        {
            var frm = this.FormFactory.OpenChildForm<frmAMUsuario>();
            if (this.cmbRol.SelectedValue.ToString() == CLIENTE)
            {
                frm.SetNuevoCliente();
            }
            else if (this.cmbRol.SelectedValue.ToString() == EMPRESA)
            {
                frm.SetNuevaEmpresa();
            }
        }
    }
}
