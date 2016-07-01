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
    public partial class ucMultiSelector : UserControl
    {
        private List<KeyValuePair<object, string>> _entityList;

        public event EventHandler SelectionClick;

        public ucMultiSelector()
        {
            InitializeComponent();
            this._entityList = new List<KeyValuePair<object, string>>();
        }

        public string TextDescription
        {
            get { return this.txtDescripcion.Text; }
        }

        public List<KeyValuePair<object, string>> EntityList
        {
            get { return this._entityList; }
        }

        public void SetObject(object entity, string description)
        {
            this._entityList.Add(new KeyValuePair<object, string>(entity, description));
            this.txtDescripcion.Text = this.GetDescription();
        }

        public void RemoveObject(string description)
        {
            if (this._entityList.Exists(i => i.Value == description))
            {
                var item = this._entityList.First(i => i.Value == description);
                this._entityList.Remove(item);
                this.txtDescripcion.Text = this.GetDescription();
            }
        }

        public void CleanObjects()
        {
            this._entityList.Clear();
            this.txtDescripcion.Text = string.Empty;
        }

        private string GetDescription()
        {
            StringBuilder str = new StringBuilder();
            this._entityList.ForEach(i => str.AppendFormat("{0}, ", i.Value));
            return str.ToString();
        }

        private void btnSeleccionar_Click(object sender, EventArgs e)
        {
            if (this.SelectionClick != null) this.SelectionClick(sender, e);
        }
    }
}
