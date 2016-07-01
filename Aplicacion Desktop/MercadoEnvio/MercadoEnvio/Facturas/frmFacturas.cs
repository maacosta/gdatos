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
    public partial class frmFacturas : Form, IFormMDI
    {
        private FacturacionBiz _facturacionBiz;

        public FormFactory FormFactory { get; set; }

        public frmFacturas()
        {
            InitializeComponent();
            this._facturacionBiz = new FacturacionBiz();
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            decimal mdi = 0m, mhi = 0m;
            if (!string.IsNullOrEmpty(this.txtImporteDesde.Text) && !decimal.TryParse(this.txtImporteDesde.Text, out mdi))
            {
                MessageBox.Show("El importe desde debe ser numérico.");
                return;
            }
            if (!string.IsNullOrEmpty(this.txtImporteHasta.Text) && !decimal.TryParse(this.txtImporteHasta.Text, out mhi))
            {
                MessageBox.Show("El importe hasta debe ser numérico.");
                return;
            }
            DateTime? fd = this.dtpFechaDesde.Checked ? this.dtpFechaDesde.Value : (DateTime?)null;
            DateTime? fh = this.dtpFechaHasta.Checked ? this.dtpFechaHasta.Value : (DateTime?)null;
            decimal? md = mdi != 0m ? mdi : (decimal?)null;
            decimal? mh = mhi != 0m ? mhi : (decimal?)null;
            string det = !string.IsNullOrEmpty(this.txtDetalle.Text) ? this.txtDetalle.Text.Trim() : null;
            string usrComp = !string.IsNullOrEmpty(this.txtUsuario.Text) ? this.txtUsuario.Text.Trim() : null;

            var facturas = this._facturacionBiz.GetBy(fd, fh, md, mh, det, usrComp, GlobalData.Instance.Username);
            this.grvFactura.DataSource = facturas;
        }

        private void btnLimpiar_Click(object sender, EventArgs e)
        {
            this.dtpFechaDesde.Checked = false;
            this.dtpFechaHasta.Checked = false;
            this.txtImporteDesde.Text = string.Empty;
            this.txtImporteHasta.Text = string.Empty;
            this.txtDetalle.Text = string.Empty;
            this.txtUsuario.Text = string.Empty;
        }

        private void btnSeleccionar_Click(object sender, EventArgs e)
        {
            if (this.grvFactura.CurrentRow == null)
            {
                MessageBox.Show("Debe seleccionar un item");
                return;
            }
            var frm = this.FormFactory.OpenChildForm<frmFactura>();
            frm.SetFacturacion((Facturacion)this.grvFactura.CurrentRow.DataBoundItem);
        }
    }
}
