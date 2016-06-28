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

namespace MercadoEnvio.ABM_Usuario
{
    public partial class frmUsuario : Form, IFormMDI
    {
        private RolBiz _rolBiz;
        private UsuarioBiz _usuarioBiz;

        public FormFactory FormFactory { get; set; }

        public frmUsuario()
        {
            InitializeComponent();
            this._rolBiz = new RolBiz();
            this._usuarioBiz = new UsuarioBiz();
        }

        private void frmUsuario_Load(object sender, EventArgs e)
        {
            var roles = this._rolBiz.GetBy(string.Empty);
            this.cmbRol.DataSource = roles;
            this.cmbRol.DisplayMember = "Nombre";
        }

        private void cmbRol_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.grbCliente.Enabled = true;
            this.grbEmpresa.Enabled = true;
            this.btnBuscar.Enabled = true;
            switch (((Rol)this.cmbRol.SelectedItem).Id)
            {
                case 1:
                    this.grbCliente.Enabled = false;
                    this.grbEmpresa.Enabled = false;
                    this.btnBuscar.Enabled = false;
                    break;
                case 2:
                    this.grbCliente.Location = new Point(12, 72);
                    this.grbEmpresa.Location = new Point(12, -172);
                    break;
                case 3:
                    this.grbCliente.Location = new Point(12, -172);
                    this.grbEmpresa.Location = new Point(12, 72);
                    break;
            }
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            switch (((Rol)this.cmbRol.SelectedItem).Id)
            {
                case 2:
                    decimal dni = 0;
                    decimal.TryParse(this.txtDni.Text, out dni);
                    var clientes = this._usuarioBiz.GetByCliente(this.txtNombre.Text, this.txtApellido.Text, dni, this.txtEmailC.Text);
                    this.grvUsuario.DataSource = clientes;
                    break;
                case 3:
                    var empresas = this._usuarioBiz.GetByEmpresa(this.txtRazonSocial.Text, this.txtCUIT.Text, this.txtEmailE.Text);
                    this.grvUsuario.DataSource = empresas;
                    break;
            }
        }
    }
}
