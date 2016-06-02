using MercadoEnvio.Dal.Biz;
using MercadoEnvio.Dal.Dto;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MercadoEnvio.ABM_Rol
{
    public partial class Form1 : Form
    {
        private RolDal _rolDal;

        public Form1()
        {
            InitializeComponent();
            this._rolDal = new RolDal();
            List<Rol> rolList = this._rolDal.GetByUser(1);
        }
    }
}
