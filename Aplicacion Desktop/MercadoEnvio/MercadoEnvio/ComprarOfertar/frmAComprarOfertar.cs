using MercadoEnvio.ABM_Rubro;
using MercadoEnvio.ABM_Visibilidad;
using MercadoEnvio.Biz.Impl;
using MercadoEnvio.Common.Entity;
using MercadoEnvio.Facturas;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using WindowsFormsApplication1.Core;

namespace MercadoEnvio.ComprarOfertar
{
    public partial class frmAComprarOfertar : Form, IFormMDI
    {
        private Publicacion _publicacion;
        private CompraOferta _compraOferta;
        private PublicacionPregunta _publicacionPregunta;
        private CompraOfertaBiz _compraOfertaBiz;
        private FacturacionBiz _facturacionBiz;
        private PublicacionPreguntaBiz _publicacionPreguntaBiz;

        public FormFactory FormFactory { get; set; }

        public frmAComprarOfertar()
        {
            InitializeComponent();

            this._compraOfertaBiz = new CompraOfertaBiz();
            this._facturacionBiz = new FacturacionBiz();
            this._publicacionPreguntaBiz = new PublicacionPreguntaBiz();
        }

        public void SetPublicacion(Publicacion publicacion)
        {
            this._publicacion = publicacion;
            this.TransformarPublicacionAControles();
        }

        private bool EsCompraOfertaValido()
        {
            StringBuilder msg = new StringBuilder();

            decimal monto = 0m;
            if (!decimal.TryParse(this.txtMonto.Text, out monto))
            {
                msg.AppendLine("El monto debe tener formato decimal. ");
            }
            else
            {
                if (((TipoPublicacion)this._publicacion.TipoPublicacion[0]) == TipoPublicacion.Subasta && monto <= Convert.ToDecimal(this.txtPrecio.Text))
                {
                    msg.AppendLine("El monto debe ser superior al precio publicado. ");
                }
            }
            decimal cantidad = 0m;
            if (!decimal.TryParse(this.txtCantidad.Text, out cantidad))
            {
                msg.AppendLine("La cantidad debe tener formato numérico. ");
            }
            else
            {
                if (cantidad > Convert.ToDecimal(this.txtStock.Text))
                {
                    msg.AppendLine("La cantidad supera al stock disponible. ");
                }
            }

            if (msg.Length > 0)
            {
                MessageBox.Show(msg.ToString());
                return false;
            }

            return true;
        }

        private bool EsPreguntaValido()
        {
            StringBuilder msg = new StringBuilder();

            if (this.txtPregunta.Text.Length > 3)
            {
                msg.AppendLine("La pregunta debe ser válida (más de 3 caracteres). ");
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
            this.txtUsuario.Text = this._publicacion.Usuario;
            this.txtCodigo.Text = this._publicacion.Codigo;
            this.txtTipoPublicacion.Text = ((TipoPublicacion)this._publicacion.TipoPublicacion[0]).ToString();
            this.txtDescripcion.Text = this._publicacion.Descripcion;
            this.txtStock.Text = this._publicacion.Stock.ToString();
            this.txtPrecio.Text = this._publicacion.Precio.ToString();

            if ((TipoPublicacion)this._publicacion.TipoPublicacion[0] == TipoPublicacion.Compra_Inmediata)
            {
                this.txtMonto.Enabled = false;
                this.txtMonto.Text = "0";
            }
            else if ((TipoPublicacion)this._publicacion.TipoPublicacion[0] == TipoPublicacion.Subasta)
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

            TipoPublicacion tp = (TipoPublicacion)this._publicacion.TipoPublicacion[0];
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

        private void TransformarAPublicacionPregunta()
        {
            this._publicacionPregunta = new PublicacionPregunta();
            this._publicacionPregunta.IdPublicacion = this._publicacion.Id;
            this._publicacionPregunta.Pregunta = this.txtPregunta.Text; ;
            this._publicacionPregunta.Usuario = GlobalData.Instance.Username;
        }

        private void btnComprarOfertar_Click(object sender, EventArgs e)
        {
            if (!this.EsCompraOfertaValido())
                return;

            this.TransformarACompraOferta();

            if (this._compraOferta.Tipo == ((char)TipoCompraOferta.Compra).ToString())
            {
                this._compraOferta = this._compraOfertaBiz.InsCompra(this._compraOferta);
                var facturacion = this._facturacionBiz.GenerarFacturacion(this._publicacion, this._compraOferta, GlobalData.Instance.FechaSistema);

                var frm = this.FormFactory.OpenChildForm<frmFactura>();
                frm.SetFacturacion(facturacion);
            }
            else
            {
                this._compraOfertaBiz.InsOferta(this._compraOferta);
            }

            this.Close();
        }

        private void btnPreguntar_Click(object sender, EventArgs e)
        {
            if (!this.EsPreguntaValido())
                return;

            this.TransformarAPublicacionPregunta();

            this._publicacionPreguntaBiz.InsPregunta(this._publicacionPregunta);

            this.Close();
        }

        private void frmAComprarOfertar_Load(object sender, EventArgs e)
        {
            if (!GlobalData.Instance.EstaPermitido(TipoFuncionalidad.ComprarOfertar_ABM))
            {
                this.btnComprarOfertar.Enabled = false;
                this.btnPreguntar.Enabled = false;
            }
        }
    }
}
