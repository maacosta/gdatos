using MercadoEnvio.Biz.Impl;
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

namespace MercadoEnvio.Listado_Estadistico
{
    public partial class frmListadoEstadistico : Form, IFormMDI
    {
        private EstadisticoBiz _estadisticoBiz;

        public FormFactory FormFactory { get; set; }

        public frmListadoEstadistico()
        {
            InitializeComponent();
            this._estadisticoBiz = new EstadisticoBiz();
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            StringBuilder str = new StringBuilder();
            int anio;
            if (!int.TryParse(this.txtAnio.Text, out anio) && anio < 1900)
                str.AppendLine("El año debe ser un valor numérico válido. ");
            if (this.cmbTrimestre.SelectedIndex == -1)
                str.AppendLine("Debe seleccionar un trimestre. ");
            if (this.cmbOpcion.SelectedIndex == -1)
                str.AppendLine("Debe seleccionar una opción. ");

            if (str.Length > 0)
            {
                MessageBox.Show(str.ToString());
                return;
            }

            switch (this.cmbOpcion.SelectedIndex + 1)
            {
                case 1:
                    var op1List = this._estadisticoBiz.GetVendedoresProductosBy(anio, Convert.ToInt32(this.cmbTrimestre.SelectedItem));
                    this.grvEstadistica.DataSource = op1List;
                    break;
                case 2:
                    var op2List = this._estadisticoBiz.GetClientesProductosBy(anio, Convert.ToInt32(this.cmbTrimestre.SelectedItem));
                    this.grvEstadistica.DataSource = op2List;
                    break;
                case 3:
                    var op3List = this._estadisticoBiz.GetVendedoresFacturasBy(anio, Convert.ToInt32(this.cmbTrimestre.SelectedItem));
                    this.grvEstadistica.DataSource = op3List;
                    break;
                case 4:
                    var op4List = this._estadisticoBiz.GetVendedoresMontoFacturadoBy(anio, Convert.ToInt32(this.cmbTrimestre.SelectedItem));
                    this.grvEstadistica.DataSource = op4List;
                    break;
            }
        }

    }
}
