using MercadoEnvio.Biz.Impl;
using MercadoEnvio.Common.Entity;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using WindowsFormsApplication1.Core;

namespace MercadoEnvio.ABM_Rubro
{
    public partial class frmRubro : Form, IFormMDI
    {
        private RubroBiz _rubroBiz;

        public FormFactory FormFactory { get; set; }
        public Rubro Rubro 
        { 
            get 
            { 
                return this.grvRubro.CurrentRow != null ? (Rubro)this.grvRubro.CurrentRow.DataBoundItem : null; 
            } 
        }
        public List<Rubro> RubroList
        {
            get
            {
                List<Rubro> rl = new List<Rubro>();
                DataGridViewSelectedRowCollection rows = this.grvRubro.SelectedRows;
                foreach (DataGridViewRow r in rows)
                {
                    rl.Add((Rubro)r.DataBoundItem);
                }
                return rl;
            }
        }

        public frmRubro()
        {
            InitializeComponent();
            this._rubroBiz = new RubroBiz();
        }

        public bool SeleccionMultiple
        {
            get { return this.grvRubro.MultiSelect; }
            set { this.grvRubro.MultiSelect = value; }
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            var list = this._rubroBiz.GetByDesc(this.txtTexto.Text);

            this.grvRubro.DataSource = list;
        }

        private void btnLimpiar_Click(object sender, EventArgs e)
        {
            this.txtTexto.Text = "";
        }

        private void btnSeleccionar_Click(object sender, EventArgs e)
        {
            if (this.grvRubro.CurrentRow == null)
            {
                MessageBox.Show("Seleccione un item.");
            }
            else
                this.Close();
        }
    }
}
