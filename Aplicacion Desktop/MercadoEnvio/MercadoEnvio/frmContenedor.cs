using MercadoEnvio.ABM_Rol;
using MercadoEnvio.ABM_Rubro;
using MercadoEnvio.ABM_Usuario;
using MercadoEnvio.ABM_Visibilidad;
using MercadoEnvio.Biz.Impl;
using MercadoEnvio.ComprarOfertar;
using MercadoEnvio.Facturas;
using MercadoEnvio.Generar_Publicación;
using MercadoEnvio.Historial_Cliente;
using MercadoEnvio.Listado_Estadistico;
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
        private PublicacionBiz _publicacionBiz;
        private FacturacionBiz _facturacionBiz;
        private FormFactory _formFactory;

        public frmContenedor()
        {
            InitializeComponent();
            this._formFactory = new FormFactory(this);
            this._publicacionBiz = new PublicacionBiz();
            this._facturacionBiz = new FacturacionBiz();
        }

        private void Contenedor_Load(object sender, EventArgs e)
        {
            frmIngresar frm = new frmIngresar();
            frm.ShowDialog(this);

            if (GlobalData.Instance.Rol != null)
            {
                this.aBMRolToolStripMenuItem.Visible = GlobalData.Instance.EstaPermitido(TipoFuncionalidad.Rol_V);
                this.aBMRubroToolStripMenuItem.Visible = GlobalData.Instance.EstaPermitido(TipoFuncionalidad.Rubro_V);
                this.aBMUsuarioToolStripMenuItem.Visible = GlobalData.Instance.EstaPermitido(TipoFuncionalidad.Usuario_ABM);
                this.aBMVisibilidadToolStripMenuItem.Visible = GlobalData.Instance.EstaPermitido(TipoFuncionalidad.Visibilidad_V);
                this.generarPublicaciónToolStripMenuItem.Visible = GlobalData.Instance.EstaPermitido(TipoFuncionalidad.Publicacion_V);
                this.historialClienteToolStripMenuItem.Visible = GlobalData.Instance.EstaPermitido(TipoFuncionalidad.HistorialCliente_V);
                this.comprarOfertarToolStripMenuItem.Visible = GlobalData.Instance.EstaPermitido(TipoFuncionalidad.ComprarOfertar_V);
                this.facturasToolStripMenuItem.Visible = GlobalData.Instance.EstaPermitido(TipoFuncionalidad.ConsultaFacturas_V);
                this.listadoEstadísticoToolStripMenuItem.Visible = GlobalData.Instance.EstaPermitido(TipoFuncionalidad.ListadoEstadistico_V);
            }

            //verificar publicaciones finalizadas (de subastas)
            var publicacionesFinalizadas = this._publicacionBiz.GetFinalizadasBy(GlobalData.Instance.Username, GlobalData.Instance.FechaSistema);
            if (publicacionesFinalizadas != null && publicacionesFinalizadas.Count > 0)
            {
                MessageBox.Show(string.Format("Se detectaron {0} publicaciones vencidas. Se procede a generar la correspondiente facturación.", publicacionesFinalizadas.Count));
                int cantFact = this._facturacionBiz.GenerarFacturacionSubasta(publicacionesFinalizadas);
                MessageBox.Show(string.Format("Se generaron {0} facturas.", cantFact));
            }
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

        private void listadoEstadísticoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this._formFactory.OpenChildForm<frmListadoEstadistico>();
        }
    }
}
