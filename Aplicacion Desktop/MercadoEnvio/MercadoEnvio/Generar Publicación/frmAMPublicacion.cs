using MercadoEnvio.ABM_Rubro;
using MercadoEnvio.ABM_Visibilidad;
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

namespace MercadoEnvio.Generar_Publicación
{
    public partial class frmAMPublicacion : Form, IFormMDI
    {
        private enum TipoPublicacion
        {
            Compra_Inmediata = 'C',
            Subasta = 'S'
        }
        private enum Estado
        {
            Borrador = 'B',
            Activa = 'A',
            Pausada = 'P',
            Finalizada = 'F'
        }
        private Publicacion _publicacion;
        private PublicacionBiz _publicacionBiz;
        private string[] _tipoPublicacionList;

        public FormFactory FormFactory { get; set; }

        public frmAMPublicacion()
        {
            InitializeComponent();

            this._publicacionBiz = new PublicacionBiz();

            this._tipoPublicacionList = Enum.GetNames(typeof(TipoPublicacion));

            this.InicializarDatos();
        }

        private void InicializarDatos()
        {
            this.SetNewPublicacion();

            this.cmbTipoPublicacion.DataSource = this._tipoPublicacionList;
            this.cmbTipoPublicacion.SelectedIndex = 0;
            this.txtEstado.Text = Enum.GetName(typeof(Estado), Estado.Borrador);
            this.txtUsuario.Text = GlobalData.Instance.Username;
            this.dtpFechaInicio.Value = GlobalData.Instance.FechaSistema;
            this.dtpFechaFin.Value = GlobalData.Instance.FechaSistema.AddDays(1);

            this.txtCodigo.Text = string.Empty;
            this.chkPermitirPreguntas.Checked = true;
            this.txtDescripcion.Text = string.Empty;
            this.txtStock.Text = string.Empty;
            this.txtPrecio.Text = string.Empty;
            this.txtCosto.Text = string.Empty;
            this.ucsRubro.SetObject(new Rubro(), string.Empty);
            this.ucsVisibilidad.SetObject(new Visibilidad(), string.Empty);
            this.chkIncluirEnvio.Checked = false;
        }

        public void SetNewPublicacion()
        {
            this._publicacion = new Publicacion();
            this._publicacion.Id = 0;
        }

        public void SetPublicacion(Publicacion publicacion)
        {
            this._publicacion = publicacion;
            this.TransformarAControles();
        }

        private void ucsRubro_SelectionClick(object sender, EventArgs e)
        {
            var frm = this.FormFactory.OpenChildDialogForm<frmRubro>();
            if(frm.Rubro != null)
                this.ucsRubro.SetObject(frm.Rubro, frm.Rubro.Codigo);
        }

        private void ucsVisibilidad_SelectionClick(object sender, EventArgs e)
        {
            var frm = this.FormFactory.OpenChildDialogForm<frmVisibilidad>();
            if (frm.Visibilidad != null)
            {
                this.ucsVisibilidad.SetObject(frm.Visibilidad, frm.Visibilidad.Codigo);
                if (frm.Visibilidad.PorcentajeEnvio == 0m)
                {
                    this.chkIncluirEnvio.Enabled = false;
                    this.chkIncluirEnvio.Checked = false;
                }
                else
                {
                    this.chkIncluirEnvio.Enabled = true;
                }
            }
        }

        private void cmbTipoPublicacion_SelectedIndexChanged(object sender, EventArgs e)
        {
            var lb = (ComboBox)sender;
            if (lb.SelectedItem.ToString() == TipoPublicacion.Subasta.ToString())
            {
                this.dtpFechaFin.Enabled = false;
                this.txtStock.Text = "1";
                this.txtStock.ReadOnly = true;
            }
            else if (lb.SelectedItem.ToString() == TipoPublicacion.Compra_Inmediata.ToString())
            {
                this.dtpFechaFin.Enabled = true;
                this.txtStock.ReadOnly = false;
            }
        }

        private void btnActivar_Click(object sender, EventArgs e)
        {
            this._publicacionBiz.UpdPublicacionEstado(this._publicacion.Id, ((char)Estado.Activa).ToString());
        }

        private void btnPausar_Click(object sender, EventArgs e)
        {
            this._publicacionBiz.UpdPublicacionEstado(this._publicacion.Id, ((char)Estado.Pausada).ToString());
        }

        private void btnFinalizar_Click(object sender, EventArgs e)
        {
            this._publicacionBiz.UpdPublicacionEstado(this._publicacion.Id, ((char)Estado.Finalizada).ToString());
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!this.EsValido())
                return;

            this.TransformarAPublicacion();

            if (this._publicacion.Id == 0)
                this._publicacionBiz.InsPublicacion(this._publicacion);
            else
                this._publicacionBiz.UpdPublicacion(this._publicacion);
        }

        private bool EsValido()
        {
            StringBuilder msg = new StringBuilder();

            decimal precio = 0m;
            if (!decimal.TryParse(this.txtPrecio.Text, out precio))
            {
                msg.AppendLine("El precio debe tener formato decimal. ");
            }
            decimal costo = 0m;
            if (!decimal.TryParse(this.txtCosto.Text, out costo))
            {
                msg.AppendLine("El costo debe tener formato decimal. ");
            }
            if (this.txtDescripcion.Text.Trim().Length < 3)
            {
                msg.AppendLine("Ingrese una descripción válida. ");
            }
            if (((Rubro)this.ucsRubro.Entity).Id != 0)
            {
                msg.AppendLine("Debe seleccionar un rubro. ");
            }
            if (((Visibilidad)this.ucsVisibilidad.Entity).Id != 0)
            {
                msg.AppendLine("Debe seleccionar una visibilidad. ");
            }

            if (msg.Length > 0)
            {
                MessageBox.Show(msg.ToString());
                return false;
            }

            return true;
        }

        private void TransformarAControles()
        {
            this.txtCodigo.Text = this._publicacion.Codigo;
            this.cmbTipoPublicacion.SelectedItem = this._tipoPublicacionList.First(i => i == this._publicacion.TipoPublicacion);
            this.txtEstado.Text = ((Estado)Enum.Parse(typeof(Estado), this._publicacion.Estado)).ToString();
            this.chkPermitirPreguntas.Checked = this._publicacion.PermitirPreguntas;
            this.txtDescripcion.Text = this._publicacion.Descripcion;
            this.txtStock.Text = this._publicacion.Stock.ToString();
            this.dtpFechaInicio.Value = this._publicacion.FechaInicio;
            this.dtpFechaFin.Value = this._publicacion.FechaVencimiento;
            this.txtPrecio.Text = this._publicacion.Precio.ToString();
            this.txtCosto.Text = this._publicacion.Costo.ToString();
            this.ucsRubro.SetObject(new Rubro() { Id = this._publicacion.IdRubro, Codigo = this._publicacion.CodigoRubro }, this._publicacion.CodigoRubro);
            this.ucsVisibilidad.SetObject(new Visibilidad() { Id = this._publicacion.IdVisibilidad, Codigo = this._publicacion.CodigoVisibilidad }, this._publicacion.CodigoVisibilidad);
            this.chkIncluirEnvio.Checked = this._publicacion.IncluirEnvio;
        }

        private void TransformarAPublicacion()
        {
            this._publicacion.Codigo = this.txtCodigo.Text;
            this._publicacion.TipoPublicacion = ((char)(TipoPublicacion)Enum.Parse(typeof(TipoPublicacion), this.cmbTipoPublicacion.SelectedItem.ToString())).ToString();
            this._publicacion.Estado = ((char)(Estado)Enum.Parse(typeof(Estado), this.txtEstado.Text)).ToString();
            this._publicacion.PermitirPreguntas = this.chkPermitirPreguntas.Checked;
            this._publicacion.Descripcion = this.txtDescripcion.Text;
            this._publicacion.Stock = Convert.ToDecimal(this.txtStock.Text);
            this._publicacion.FechaInicio = this.dtpFechaInicio.Value;
            this._publicacion.FechaVencimiento = dtpFechaFin.Value;
            this._publicacion.Precio = Convert.ToDecimal(this.txtPrecio.Text);
            this._publicacion.Costo = Convert.ToDecimal(this.txtCosto.Text);
            this._publicacion.IdRubro = ((Rubro)this.ucsRubro.Entity).Id;
            this._publicacion.IdVisibilidad = ((Visibilidad)this.ucsVisibilidad.Entity).Id;
            this._publicacion.IncluirEnvio = this.chkIncluirEnvio.Checked;
        }
        
        private void btnLimpiar_Click(object sender, EventArgs e)
        {
            this.InicializarDatos();
        }

        private void txtEstado_TextChanged(object sender, EventArgs e)
        {
            var txt = (TextBox)sender;

            if (txt.Text == Estado.Borrador.ToString())
            {
                if (this._publicacion.Id == 0)
                {
                    this.btnLimpiar.Enabled = true;
                    this.btnActivar.Enabled = false;
                    this.btnPausar.Enabled = false;
                    this.btnFinalizar.Enabled = false;
                }
                else
                {
                    this.btnLimpiar.Enabled = false;
                    this.btnActivar.Enabled = true;
                    this.btnPausar.Enabled = true;
                    this.btnFinalizar.Enabled = true;
                }
                this.btnGuardar.Enabled = true;
            }
            else
            {
                this.btnLimpiar.Enabled = false;
                this.btnGuardar.Enabled = false;
            }
            if (txt.Text == Estado.Activa.ToString())
            {
                this.btnActivar.Enabled = false;
                this.btnPausar.Enabled = true;
                this.btnFinalizar.Enabled = true;
            }
            else if (txt.Text == Estado.Pausada.ToString())
            {
                this.btnActivar.Enabled = true;
                this.btnPausar.Enabled = false;
                this.btnFinalizar.Enabled = true;
            }
            else if (txt.Text == Estado.Finalizada.ToString())
            {
                this.btnActivar.Enabled = false;
                this.btnPausar.Enabled = false;
                this.btnFinalizar.Enabled = false;
            }
        }
    }
}
