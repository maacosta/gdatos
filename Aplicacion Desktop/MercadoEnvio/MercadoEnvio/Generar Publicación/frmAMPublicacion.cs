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

        public FormFactory FormFactory { get; set; }

        public frmAMPublicacion()
        {
            InitializeComponent();

            this.cmbTipoPublicacion.DataSource = Enum.GetNames(typeof(TipoPublicacion));
            this.cmbTipoPublicacion.SelectedIndex = 0;
            this.txtEstado.Text = Enum.GetName(typeof(Estado), Estado.Borrador);
            this.txtUsuario.Text = GlobalData.Instance.Username;
            this.dtpFechaInicio.Value = GlobalData.Instance.FechaSistema;
            this.dtpFechaFin.Value = GlobalData.Instance.FechaSistema.AddDays(1);
        }

        public void SetNewPublicacion()
        {
            this._publicacion = new Publicacion();
            this._publicacion.Id = 0;
        }

        public void SetPublicacion(Publicacion publicacion)
        {
            this._publicacion = publicacion;
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

        }

        private void btnPausar_Click(object sender, EventArgs e)
        {

        }

        private void btnFinalizar_Click(object sender, EventArgs e)
        {

        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!this.EsValido())
                return;

            this._publicacion.Codigo = this.txtCodigo.Text;
            this._publicacion.TipoPublicacion = ((char)(TipoPublicacion)Enum.Parse(typeof(TipoPublicacion), this.cmbTipoPublicacion.SelectedItem.ToString())).ToString();
            this._publicacion.Estado = ((char)(Estado)Enum.Parse(typeof(Estado), this.txtEstado.Text)).ToString();
            this._publicacion.Descripcion = this.txtDescripcion.Text;
            this._publicacion.Stock = Convert.ToDecimal(this.txtStock.Text);
            this._publicacion.FechaInicio = this.dtpFechaInicio.Value;
            this._publicacion.FechaVencimiento = dtpFechaFin.Value;
            this._publicacion.Precio = Convert.ToDecimal(this.txtPrecio.Text);
            this._publicacion.IdRubro = ((Rubro)this.ucsRubro.Entity).Id;
            this._publicacion.IdVisibilidad = ((Visibilidad)this.ucsVisibilidad.Entity).Id;

            if (this._publicacion.Id == 0)
                this._publicacionBiz.InsPublicacion(this._publicacion);
            else
                this._publicacionBiz.UpdPublicacion(this._publicacion);
        }

        private bool EsValido()
        {
            return true;
        }

        private void btnLimpiar_Click(object sender, EventArgs e)
        {

        }
    }
}
