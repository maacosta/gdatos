using MercadoEnvio.Biz.Impl;
using MercadoEnvio.Common.Entity;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using WindowsFormsApplication1.Core;

namespace MercadoEnvio.Facturas
{
    public partial class frmFactura : Form, IFormMDI
    {
        private Facturacion _facturacion;
        private FacturacionBiz _facturacionBiz;

        public FormFactory FormFactory { get; set; }

        public frmFactura()
        {
            InitializeComponent();

            this._facturacionBiz = new FacturacionBiz();
        }

        public void SetFacturacion(Facturacion facturacion)
        {
            this._facturacion = facturacion;
            this.TransformarAControles();
        }

        private void TransformarAControles()
        {
            this.txtNumero.Text = this._facturacion.Numero.ToString();
            this.txtFormaPago.Text = this._facturacion.FormaPago;
            this.dtpFecha.Value = this._facturacion.Fecha;
            this.txtTotal.Text = this._facturacion.Total.ToString();
            this.txtCodigoPublicacion.Text = this._facturacion.CodigoPublicacion.ToString();
            this.txtDescripcion.Text = this._facturacion.Descripcion;
            this.dtpFechaCompra.Value = this._facturacion.FechaCompra;
            this.txtUsuarioComprador.Text = this._facturacion.UsuarioComprador;

            this.grvDetalle.DataSource = this._facturacion.Items;
        }
    }
}
