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
        }
    }
}
