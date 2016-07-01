using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace WindowsFormsApplication1.Core
{
    public partial class ucSelector : UserControl
    {
        private object _entity;

        public event EventHandler SelectionClick;

        public ucSelector()
        {
            InitializeComponent();
        }

        public string TextDescription
        {
            get { return this.txtDescripcion.Text; }
        }

        public object Entity
        {
            get { return this._entity; }
        }

        public void SetObject(object entity, string description)
        {
            this._entity = entity;
            this.txtDescripcion.Text = description;
        }

        private void btnSeleccionar_Click(object sender, EventArgs e)
        {
            if (this.SelectionClick != null) this.SelectionClick(sender, e);
        }
    }
}
