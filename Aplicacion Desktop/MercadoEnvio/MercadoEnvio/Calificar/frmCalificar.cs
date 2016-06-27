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

namespace MercadoEnvio.Calificar
{
    public partial class frmCalificar : Form, IFormMDI
    {
        private PublicacionCalificacionBiz _publicacionCalificacionBiz;
        private PublicacionCalificacion _publicacionCalificacion;

        public FormFactory FormFactory { get; set; }

        public frmCalificar()
        {
            InitializeComponent();
            this._publicacionCalificacionBiz = new PublicacionCalificacionBiz();
        }

        private void rdbOpcion_CheckedChanged(object sender, EventArgs e)
        {
            int opcion = this.rdbOpcion1.Checked ? 1 : 2;
            this.LoadCalificaciones(opcion);
        }

        private void grvCalificacion_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            int opcion = this.rdbOpcion1.Checked ? 1 : 2;
            this.LoadCalificaciones(opcion);
        }

        private void LoadCalificaciones(int opcion)
        {
            var calificaciones = this._publicacionCalificacionBiz.GetOpcionBy(GlobalData.Instance.Username, opcion);

            this.grvCalificacion.DataSource = calificaciones;

            this.btnSeleccionar.Enabled = opcion == 2;
            this.tcbCalificacion.Enabled = opcion == 2;
            this.txtComentario.Enabled = opcion == 2;
            this.txtComentario.Text = string.Empty;
            this.tcbCalificacion.Value = 0;
            this.btnSeleccionar.Text = "&Calificar";
            this._publicacionCalificacion = null;
        }

        private void btnSeleccionar_Click(object sender, EventArgs e)
        {
            if (!this.EsValido())
                return;

            var calificacion = new PublicacionCalificacion()
            {
                IdPublicacion = this._publicacionCalificacion.IdPublicacion,
                Calificacion = Convert.ToInt32(this.tcbCalificacion.Value),
                Comentario = this.txtComentario.Text,
                Fecha = GlobalData.Instance.FechaSistema,
                Usuario = GlobalData.Instance.Username
            };

            this._publicacionCalificacionBiz.InsCalificacion(calificacion);
            MessageBox.Show(string.Format("Se calificó la compra de la publicación ({0}) exitosamente", this._publicacionCalificacion.CodigoPublicacion));
        }

        private bool EsValido()
        {
            StringBuilder str = new StringBuilder();
            if (this._publicacionCalificacion == null)
            {
                str.AppendLine("Debe seleccionar una publicación para calificar. ");
            } 
            if (this.tcbCalificacion.Value == 0)
            {
                str.AppendLine("Debe indicar un valor a la calificación. ");
            }
            if (str.Length > 0)
            {
                MessageBox.Show(str.ToString());
                return false;
            }

            return true;
        }

        private void grvCalificacion_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            this._publicacionCalificacion = (PublicacionCalificacion)this.grvCalificacion.CurrentRow.DataBoundItem;

            this.btnSeleccionar.Text = string.Format("&Calificar: ({0})", this._publicacionCalificacion.CodigoPublicacion);
        }
    }
}
