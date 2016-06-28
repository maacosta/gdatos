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

namespace MercadoEnvio.ABM_Rol
{
    public partial class frmRol : Form, IFormMDI
    {
        private RolBiz _rolBiz;

        public FormFactory FormFactory { get; set; }
        public List<Rol> RolList
        {
            get
            {
                List<Rol> rl = new List<Rol>();
                DataGridViewSelectedRowCollection rows = this.grvRol.SelectedRows;
                foreach (DataGridViewRow r in rows)
                {
                    rl.Add((Rol)r.DataBoundItem);
                }
                return rl;
            }
        }

        public frmRol()
        {
            InitializeComponent();
            this._rolBiz = new RolBiz();
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            var roles = this._rolBiz.GetBy(this.textBox1.Text);
            this.grvRol.DataSource = roles;
        }

        private void btnSeleccionar_Click(object sender, EventArgs e)
        {
            if (this.grvRol.CurrentRow == null)
            {
                MessageBox.Show("Seleccione un item.");
            }
            else
            {
                if (this.RolList.Exists(r => r.Id == 1))
                    MessageBox.Show("No puede seleccionar el rol Administrador.");
                else
                    this.Close();
            }
        }
    }
}
