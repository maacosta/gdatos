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
            var usuario = this.InsUsuario((Usuario)cliente);

            this._usuarioDal.InsCliente(usuario.Id, cliente.Dni, cliente.TipoDocumento, cliente.Apellido, cliente.Nombre, cliente.FechaNacimiento, cliente.FechaCreacion);
        }

        public void InsEmpresa(Empresa empresa)
        {
            var usuario = this.InsUsuario((Usuario)empresa);

            this._usuarioDal.InsEmpresa(usuario.Id, empresa.Cuit, empresa.RazonSocial, empresa.Ciudad, empresa.NombreContacto, empresa.RubroPrincipal, empresa.FechaCreacion);
        }

        private Usuario InsUsuario(Usuario usuario)
        {
            return this._usuarioDal.InsUsuario(usuario.Username, usuario.Mail, usuario.Telefono, usuario.Calle, usuario.Numero, usuario.Piso, usuario.Depto, usuario.CodigoPostal, usuario.Localidad);
        }

        public void UpdCliente(Cliente cliente)
        {
            this.UpdUsuario((Usuario)cliente);

            this._usuarioDal.UpdCliente(cliente.Id, cliente.Dni, cliente.TipoDocumento, cliente.Apellido, cliente.Nombre, cliente.FechaNacimiento);
        }

        public void UpdEmpresa(Empresa empresa)
        {
            this.UpdUsuario((Usuario)empresa);

            this._usuarioDal.UpdEmpresa(empresa.Id, empresa.Cuit, empresa.RazonSocial, empresa.Ciudad, empresa.NombreContacto, empresa.RubroPrincipal);
        }

        private void UpdUsuario(Usuario usuario)
        {
            this._usuarioDal.UpdUsuario(usuario.Username, usuario.Mail, usuario.Telefono, usuario.Calle, usuario.Numero, usuario.Piso, usuario.Depto, usuario.CodigoPostal, usuario.Localidad);
        }
    }
}
