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

namespace MercadoEnvio.ABM_Usuario
{
    public partial class frmUsuario : Form, IFormMDI
    {
        public FormFactory FormFactory { get; set; }

        public frmUsuario()
        {
            InitializeComponent();
        }
    }
}
