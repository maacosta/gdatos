using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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

        public TForm AppendChildForm<TForm>() where TForm : Form
        {
            return this.OpenChildForm<TForm>(false, false);
        }

        public TForm OpenChildDialogForm<TForm>() where TForm : Form
        {
            return this.OpenChildForm<TForm>(true, true);
        }

        public TForm OpenChildForm<TForm>() where TForm : Form
        {
            return this.OpenChildForm<TForm>(false, true);
        }

        private TForm OpenChildForm<TForm>(bool asDialog, bool openForm) where TForm : Form
        {
            TForm frm = null;
            if (!this._formList.Exists(f => f.GetType() == typeof(TForm)))
            {
                frm = Activator.CreateInstance<TForm>();

                if (frm.GetType().GetInterfaces().Contains(typeof(IFormMDI)))
                {
                    ((IFormMDI)frm).FormFactory = this;
                }

                if (openForm)
                {
                    if (asDialog)
                    {
                        frm.ShowDialog();
                    }
                    else
                    {
                        this._formList.Add(frm);
                        frm.FormClosed += frm_FormClosed;

                        frm.MdiParent = this._mdiForm;
                        frm.Show();
                    }
                }
            }
            else
            {
                frm = (TForm)this._formList.First(f => f.GetType() == typeof(TForm));
                frm.Activate();
            }
            return frm;
        }

        private void frm_FormClosed(object sender, FormClosedEventArgs e)
        {
            this._formList.Remove((Form)sender);
        }
    }
}
