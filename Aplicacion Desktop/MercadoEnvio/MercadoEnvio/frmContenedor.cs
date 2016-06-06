using MercadoEnvio.ABM_Rol;
using MercadoEnvio.ABM_Rubro;
using MercadoEnvio.ABM_Usuario;
using MercadoEnvio.ABM_Visibilidad;
using MercadoEnvio.ComprarOfertar;
using MercadoEnvio.Facturas;
using MercadoEnvio.Generar_Publicación;
using MercadoEnvio.Historial_Cliente;
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

namespace WindowsFormsApplication1
{
    public partial class frmContenedor : Form
    {
        private FormFactory _formFactory;

        public frmContenedor()
        {
            InitializeComponent();
            this._formFactory = new FormFactory(this);
        }

        private void Contenedor_Load(object sender, EventArgs e)
        {
            frmIngresar frm = new frmIngresar();
            frm.ShowDialog(this);
        }

        private void salirToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void aBMRolToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this._formFactory.OpenChildForm<frmRol>();
        }

        private void aBMRubroToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this._formFactory.OpenChildForm<frmRubro>();
        }

        private void aBMUsuarioToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this._formFactory.OpenChildForm<frmUsuario>();
        }

        private void aBMVisibilidadToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this._formFactory.OpenChildForm<frmVisibilidad>();
        }

        private void generarPublicaciónToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this._formFactory.OpenChildForm<frmGenerarPublicacion>();
        }

        private void historialClienteToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this._formFactory.OpenChildForm<frmHistorialCliente>();
        }

        private void comprarOfertarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this._formFactory.OpenChildForm<frmComprarOfertar>();
        }

        private void facturasToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this._formFactory.OpenChildForm<frmFacturas>();
        }
    }
}
