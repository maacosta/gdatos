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

namespace MercadoEnvio.ComprarOfertar
{
    public partial class frmAComprarOfertar : Form, IFormMDI
    {
        private Publicacion _publicacion;
        private CompraOferta _compraOferta;
        private CompraOfertaBiz _compraOfertaBiz;

        public FormFactory FormFactory { get; set; }

        public frmAComprarOfertar()
        {
            InitializeComponent();

            this._compraOfertaBiz = new CompraOfertaBiz();
        }

        public void SetPublicacion(Publicacion publicacion)
        {
            this._publicacion = publicacion;
            this.TransformarPublicacionAControles();
        }

        private bool EsValido()
        {
            StringBuilder msg = new StringBuilder();

            decimal precio = 0m;
            if (!decimal.TryParse(this.txtMonto.Text, out precio))
            {
                msg.AppendLine("El monto debe tener formato decimal. ");
            }
            decimal cantidad = 0m;
            if (!decimal.TryParse(this.txtCantidad.Text, out cantidad))
            {
                msg.AppendLine("La cantidad debe tener formato numérico. ");
            }
            if (msg.Length > 0)
            {
                MessageBox.Show(msg.ToString());
                return false;
            }

            return true;
        }

        private void TransformarPublicacionAControles()
        {
            this.txtCodigo.Text = this._publicacion.Codigo;
            this.txtTipoPublicacion.Text = ((TipoPublicacion)Enum.Parse(typeof(TipoPublicacion), this._publicacion.TipoPublicacion)).ToString();
            this.txtDescripcion.Text = this._publicacion.Descripcion;
            this.txtStock.Text = this._publicacion.Stock.ToString();
            this.txtPrecio.Text = this._publicacion.Precio.ToString();

            if ((TipoPublicacion)Enum.Parse(typeof(TipoPublicacion), this._publicacion.TipoPublicacion) == TipoPublicacion.Compra_Inmediata)
            {
                this.txtMonto.Enabled = false;
                this.txtMonto.Text = "0";
            }
            else if ((TipoPublicacion)Enum.Parse(typeof(TipoPublicacion), this._publicacion.TipoPublicacion) == TipoPublicacion.Subasta)
            {
                this.txtCantidad.Enabled = false;
                this.txtCantidad.Text = "1";
            }

            if (!this._publicacion.PermitirPreguntas)
            {
                this.txtPregunta.Enabled = false;
                this.btnPreguntar.Enabled = false;
            }
        }

        private void TransformarACompraOferta()
        {
            this._compraOferta = new CompraOferta();
            this._compraOferta.IdPublicacion = this._publicacion.Id;
            this._compraOferta.Tipo = this.GetTipoCompraOferta(this._publicacion);
            this._compraOferta.Fecha = GlobalData.Instance.FechaSistema;
            this._compraOferta.Cantidad = Convert.ToDecimal(this.txtCantidad.Text);
            this._compraOferta.Monto = Convert.ToDecimal(this.txtMonto.Text);
            this._compraOferta.Usuario = GlobalData.Instance.Username;
        }

        private string GetTipoCompraOferta(Publicacion publicacion)
        {
            string tipoCO = string.Empty;

            TipoPublicacion tp = (TipoPublicacion)Enum.Parse(typeof(TipoPublicacion), this._publicacion.TipoPublicacion);
            switch (tp)
            {
                case TipoPublicacion.Compra_Inmediata:
                    tipoCO = ((char)TipoCompraOferta.Compra).ToString();
                    break;
                case TipoPublicacion.Subasta:
                    tipoCO = ((char)TipoCompraOferta.Oferta).ToString();
                    break;
            }

            return tipoCO;
        }

        private void btnComprarOfertar_Click(object sender, EventArgs e)
        {
            if (!this.EsValido())
                return;

            this.TransformarACompraOferta();

            if (this._compraOferta.Tipo == ((char)TipoCompraOferta.Compra).ToString())
                this._compraOfertaBiz.InsCompra(this._compraOferta);
            else
                this._compraOfertaBiz.InsOferta(this._compraOferta);

            this.Close();
        }
    }
}
