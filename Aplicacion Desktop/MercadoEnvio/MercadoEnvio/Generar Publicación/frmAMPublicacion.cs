using MercadoEnvio.ABM_Rubro;
using MercadoEnvio.ABM_Visibilidad;
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
        public FormFactory FormFactory { get; set; }

        public frmAMPublicacion()
        {
            InitializeComponent();

            this.dtpFechaInicio.Value = GlobalData.Instance.FechaSistema;
            this.dtpFechaFin.Value = GlobalData.Instance.FechaSistema.AddMonths(1);
        }

        public void SetPublicacion(Publicacion publicacion)
        {

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
                this.ucsVisibilidad.SetObject(frm.Visibilidad, frm.Visibilidad.Codigo);
        }
    }
}
