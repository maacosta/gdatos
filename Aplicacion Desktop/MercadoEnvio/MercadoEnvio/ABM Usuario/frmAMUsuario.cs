using MercadoEnvio.ABM_Rol;
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

namespace WindowsFormsApplication1.ABM_Usuario
{
    public partial class frmAMUsuario : Form, IFormMDI
    {
        private RolBiz _rolBiz;
        private UsuarioBiz _usuarioBiz;

        private Usuario _usuario;
        private List<Rol> _roles;
        private bool _esCliente;
        private List<string> _tipoDoc;

        public FormFactory FormFactory { get; set; }

        public frmAMUsuario()
        {
            InitializeComponent();
            this._rolBiz = new RolBiz();
            this._usuarioBiz = new UsuarioBiz();
        }

        private void frmAMUsuario_Load(object sender, EventArgs e)
        {
            this._tipoDoc = new List<string>()
            {
                "LE","LC","DNI"
            };

            this.cmbTipoDocumento.DataSource = this._tipoDoc;
        }

        public void SetNuevoCliente()
        {
            this._usuario = new Cliente()
            {
                FechaCreacion = GlobalData.Instance.FechaSistema
            };
            this.SetUsuario(this._usuario);
        }

        public void SetNuevaEmpresa()
        {
            this._usuario = new Empresa()
            {
                FechaCreacion = GlobalData.Instance.FechaSistema
            };
            this.SetUsuario(this._usuario);
        }

        public void SetUsuario(Usuario usuario)
        {
            this._usuario = usuario;

            this.LoadUsuario(usuario);
            if (usuario is Cliente)
            {
                this._esCliente = true;
                this.grbCliente.Location = new Point(12, 100);
                this.grbEmpresa.Location = new Point(12, -164);
                this.LoadCliente((Cliente)usuario);
            }
            else if (usuario is Empresa)
            {
                this._esCliente = false;
                this.grbCliente.Location = new Point(12, -164);
                this.grbEmpresa.Location = new Point(12, 100);
                this.LoadEmpresa((Empresa)usuario);
            }
        }

        private void LoadUsuario(Usuario usuario)
        {
            if(usuario.Id != 0) this.txtUsuario.ReadOnly = true;
            this.txtUsuario.Text = usuario.Username;
            //cargar roles
            this._roles = this._rolBiz.GetByUsuario(usuario.Username);
            this._roles.ForEach(r => this.ucmsRol.SetObject(r, r.Nombre));
            
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
            if (!this.EsValido())
                return;

            this.TransformarAUsuario();

            try
            {
                if (this._esCliente)
                {
                    if (this._usuario.Id == 0)
                        this._usuarioBiz.InsCliente(this._usuario as Cliente);
                    else
                        this._usuarioBiz.UpdCliente(this._usuario as Cliente);
                }
                else
                {
                    if (this._usuario.Id == 0)
                        this._usuarioBiz.InsEmpresa(this._usuario as Empresa);
                    else
                        this._usuarioBiz.UpdEmpresa(this._usuario as Empresa);
                }
                this._rolBiz.SetRolesToUsuario(this._usuario.Username, this.ucmsRol.EntityList.Select(i => (Rol)i.Key).ToList());
                this.Close();
            }
            catch (ClienteException cliEx)
            {
                switch (cliEx.ExceptionType)
                {
                    case ClienteTypeExcep.TipoDniYaExistente:
                        MessageBox.Show("El Tipo Documento y DNI ya existen.");
                        break;
                }
            }
            catch (UsuarioException usrEx)
            {
                switch (usrEx.ExceptionType)
                {
                    case UsuarioTypeExcep.UsuarioYaExiste:
                        MessageBox.Show("El Usuario ya existe.");
                        break;
                }
            }
        }

        private bool EsValido()
        {
            StringBuilder str = new StringBuilder();

            if (string.IsNullOrWhiteSpace(this.txtUsuario.Text))
                str.AppendLine("El usuario es obligatorio. ");

            int piso;
            if (!int.TryParse(this.txtPiso.Text, out piso))
                str.AppendLine("El Piso debe ser numérico. ");

            int numero;
            if (!int.TryParse(this.txtNumero.Text, out numero))
                str.AppendLine("El Número debe ser numérico. ");

            if (this._esCliente)
            {
                Int64 dni;
                if (string.IsNullOrWhiteSpace(this.txtDNI.Text))
                    str.AppendLine("El DNI es obligatorio. ");
                else if (!Int64.TryParse(this.txtDNI.Text, out dni))
                    str.AppendLine("El DNI debe ser numérico. ");


                if (this.cmbTipoDocumento.SelectedItem == null)
                    str.AppendLine("El Tipo Documento es obligatorio. ");
            }
            else
            {
                if (string.IsNullOrWhiteSpace(this.txtRazonSocial.Text))
                    str.AppendLine("La Razón Social es obligatoria. ");
            }

            if (str.Length > 0)
            {
                MessageBox.Show(str.ToString());
                return false;
            }
            return true;
        }

        private void TransformarAUsuario()
        {
            this._usuario.Username = this.txtUsuario.Text;
            //cargar roles
            var roles = this._rolBiz.GetByUsuario(this._usuario.Username);
            roles.ForEach(r => this.ucmsRol.SetObject(r, r.Nombre));

            this._usuario.Mail = this.txtEmail.Text;
            this._usuario.Telefono = this.txtTelefono.Text;
            this._usuario.Calle = this.txtCalle.Text;
            if (!string.IsNullOrWhiteSpace(this.txtNumero.Text)) this._usuario.Numero = Convert.ToDecimal(this.txtNumero.Text);
            this._usuario.Depto = this.txtDepartamento.Text;
            if (!string.IsNullOrWhiteSpace(this.txtPiso.Text)) this._usuario.Piso = Convert.ToDecimal(this.txtPiso.Text);
            this._usuario.CodigoPostal = this.txtCP.Text;
            this._usuario.Localidad = this.txtLocalidad.Text;

            if (this._esCliente)
            {
                var cliente = (Cliente)this._usuario;
                cliente.Nombre = this.txtNombre.Text;
                cliente.Apellido = this.txtApellido.Text;
                cliente.Dni = Convert.ToDecimal(this.txtDNI.Text);
                cliente.TipoDocumento = this.cmbTipoDocumento.SelectedValue.ToString();
                cliente.FechaNacimiento = this.dtpFechaNacimiento.Checked ? this.dtpFechaNacimiento.Value : (DateTime?)null;
            }
            else
            {
                var empresa = (Empresa)this._usuario;
                empresa.RazonSocial = this.txtRazonSocial.Text;
                empresa.Cuit = this.txtCUIT.Text;
                empresa.Ciudad = this.txtCiudad.Text;
                empresa.NombreContacto = this.txtContacto.Text;
                empresa.RubroPrincipal = this.txtRubroPrincipal.Text;
            }
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
