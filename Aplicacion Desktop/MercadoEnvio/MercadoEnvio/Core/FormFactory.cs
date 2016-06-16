using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApplication1.Core
{
    public class FormFactory
    {
        private List<Form> _formList;
        private Form _mdiForm;

        public FormFactory(Form mdiForm)
        {
            this._mdiForm = mdiForm;
            this._formList = new List<Form>();
        }

        public void OpenChildForm<TForm>() where TForm : Form
        {
            if (!this._formList.Exists(f => f.GetType() == typeof(TForm)))
            {
                var frm = Activator.CreateInstance<TForm>();
                this._formList.Add(frm);

                if (frm.GetType().GetInterfaces().Contains(typeof(IFormMDI)))
                {
                    ((IFormMDI)frm).FormFactory = this;
                }

                frm.FormClosed += frm_FormClosed;
                frm.MdiParent = this._mdiForm;
                frm.Show();
            }
            else
            {
                this._formList.First(f => f.GetType() == typeof(TForm)).Activate();
            }
        }

        private void frm_FormClosed(object sender, FormClosedEventArgs e)
        {
            this._formList.Remove((Form)sender);
        }
    }
}
