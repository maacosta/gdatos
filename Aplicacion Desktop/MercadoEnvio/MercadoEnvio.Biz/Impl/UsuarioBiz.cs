using System;
using System.Security.Cryptography;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MercadoEnvio.Dal.Impl;
using MercadoEnvio.Common.FunctionalException;
using MercadoEnvio.Common.Entity;

namespace MercadoEnvio.Biz.Impl
{
    public class UsuarioBiz
    {
        private UsuarioDal _usuarioDal;

        public UsuarioBiz()
        {
            this._usuarioDal = new UsuarioDal();
        }

        public List<Cliente> GetByCliente(string nombre, string apellido, decimal dni, string email)
        {
            return this._usuarioDal.GetByCliente(nombre, apellido, dni, email); 
        }

        public List<Empresa> GetByEmpresa(string razonSocial, string cuit, string email)
        {
            return this._usuarioDal.GetByEmpresa(razonSocial, cuit, email);
        }

        public void InsCliente(Cliente cliente)
        {

        }

        public void InsEmpresa(Empresa empresa)
        {

        }
    }
}
