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
        public FormFactory FormFactory { get; set; }

        public frmListadoEstadistico()
        {
            InitializeComponent();
        }
    }
}
