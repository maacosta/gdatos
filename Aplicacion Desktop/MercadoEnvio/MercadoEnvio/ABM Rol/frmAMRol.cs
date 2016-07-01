using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using WindowsFormsApplication1.Core;

namespace WindowsFormsApplication1.ABM_Rol
{
    public partial class frmAMRol : Form, IFormMDI
    {
        public FormFactory FormFactory { get; set; }

        public frmAMRol()
        {
            InitializeComponent();
        }
    }
}
