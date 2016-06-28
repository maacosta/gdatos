using MercadoEnvio.ABM_Rol;
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

namespace WindowsFormsApplication1.ABM_Usuario
{
    public partial class frmAMUsuario : Form, IFormMDI
    {
        private RolBiz _rolBiz;
        private Usuario _usuario;
        private bool _esCliente;
        private List<string> _tipoDoc;

        public FormFactory FormFactory { get; set; }

        public frmAMUsuario()
        {
            InitializeComponent();
            this._rolBiz = new RolBiz();
        }

        private void frmAMUsuario_Load(object sender, EventArgs e)
        {
            this._tipoDoc = new List<string>()
            {
                "LE","LC","DNI"
            };

            this.cmbTipoDocumento.DataSource = this._tipoDoc;
        }

        public void SetUsuario(Usuario usuario)
        {
            this._usuario = usuario;

            this.LoadUsuario(usuario);
            if (usuario is Cliente)
            {
                this._esCliente = true;
                this.grbCliente.Location = new Point(12, 154);
                this.grbEmpresa.Location = new Point(12, -164);
                this.LoadCliente((Cliente)usuario);
            }
            else if (usuario is Empresa)
            {
                this._esCliente = false;
                this.grbCliente.Location = new Point(12, -164);
                this.grbEmpresa.Location = new Point(12, 154);
                this.LoadEmpresa((Empresa)usuario);
            }
        }

        private void LoadUsuario(Usuario usuario)
        {
            this.txtUsuario.Text = usuario.Username;
            //cargar roles
            var roles = this._rolBiz.GetByUsuario(usuario.Username);
            roles.ForEach(r => this.ucmsRol.SetObject(r, r.Nombre));
            
            this.txtEmail.Text = usuario.Mail;
            this.txtTelefono.Text = usuario.Telefono;
            this.txtCalle.Text = usuario.Calle;
            this.txtNumero.Text = usuario.Numero.HasValue ? usuario.Numero.Value.ToString() : string.Empty;
            this.txtDepartamento.Text = usuario.Depto;
            this.txtPiso.Text = usuario.Piso.HasValue ? usuario.Piso.Value.ToString() : string.Empty;
            this.txtCP.Text = usuario.CodigoPostal;
            this.txtLocalidad.Text = usuario.Localidad;
        }

        private void LoadCliente(Cliente cliente)
        {
            this.txtNombre.Text = cliente.Nombre;
            this.txtApellido.Text = cliente.Apellido;
            this.txtDNI.Text = cliente.Dni.ToString();
            this.cmbTipoDocumento.SelectedItem = this._tipoDoc.FirstOrDefault(i => i == cliente.TipoDocumento);
            this.dtpFechaNacimiento.Value = cliente.FechaNacimiento.HasValue ? cliente.FechaNacimiento.Value : DateTime.Now;
        }

        private void LoadEmpresa(Empresa empresa)
        {
            this.txtRazonSocial.Text = empresa.RazonSocial;
            this.txtCUIT.Text = empresa.Cuit;
            this.txtCiudad.Text = empresa.Ciudad;
            this.txtContacto.Text = empresa.NombreContacto;
            this.txtRubroPrincipal.Text = empresa.RubroPrincipal;
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {

        }

        private void ucmsRol_SelectionClick(object sender, EventArgs e)
        {
            var frm = this.FormFactory.AppendChildForm<frmRol>();
            frm.ShowDialog();
            if (frm.RolList.Count > 0)
            {
                this.ucmsRol.CleanObjects();
                frm.RolList.ForEach(r => this.ucmsRol.SetObject(r, r.Nombre));
            }
        }

    }
}
