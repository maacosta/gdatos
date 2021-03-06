﻿using MercadoEnvio.Common.Entity;
using MercadoEnvio.Dal.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using MercadoEnvio.Common.FunctionalException;
using System.Data.SqlClient;


namespace MercadoEnvio.Dal.Impl
{
    public class UsuarioDal : BaseDal
    {
        public void UpdLoginData(string username, string passwordHash, string salt)
        {
            object[] param = new object[] { username, passwordHash, salt };

            this._db.ExecuteNonQuery("LOS_DE_ADELANTE.sp_usuario_updLoginData", param);
        }

        public Usuario InsUsuario(string username, string email, string telefono, string calle, decimal? numero, decimal? piso, string departamento, string cp, string localidad)
        {
            try
            {
                object[] param = new object[] { username, email, telefono, calle, numero, piso, departamento, cp, localidad };

                var data = this._db.ExecuteSprocAccessor<Usuario>("LOS_DE_ADELANTE.sp_usuario_insUsuario", param).First();

                return data;
            }
            catch (SqlException sqlEx)
            {
                throw new UsuarioException(UsuarioTypeExcep.UsuarioYaExiste);
            }
        }

        public void UpdUsuario(string username, string email, string telefono, string calle, decimal? numero, decimal? piso, string departamento, string cp, string localidad)
        {
            object[] param = new object[] { username, email, telefono, calle, numero, piso, departamento, cp, localidad };

            this._db.ExecuteSprocAccessor<Usuario>("LOS_DE_ADELANTE.sp_usuario_updUsuario", param);
        }

        public void InsCliente(int idUsuario, decimal dni, string tipoDocumento, string apellido, string nombre, DateTime? fechaNacimiento, DateTime fechaSistema)
        {
            object[] param = new object[] { idUsuario, dni, tipoDocumento, apellido, nombre, fechaNacimiento, fechaSistema };

            this._db.ExecuteNonQuery("LOS_DE_ADELANTE.sp_usuario_insCliente", param);
        }

        public void InsEmpresa(int idUsuario, string cuit, string razonSocial, string ciudad, string contacto, string rubroPrincipal, DateTime fechaSistema)
        {
            object[] param = new object[] { idUsuario, cuit, razonSocial, ciudad, contacto, rubroPrincipal, fechaSistema };

            this._db.ExecuteNonQuery("LOS_DE_ADELANTE.sp_usuario_insEmpresa", param);
        }

        public void UpdCliente(int idUsuario, decimal dni, string tipoDocumento, string apellido, string nombre, DateTime? fechaNacimiento)
        {
            try
            {
                object[] param = new object[] { idUsuario, dni, tipoDocumento, apellido, nombre, fechaNacimiento };

                this._db.ExecuteNonQuery("LOS_DE_ADELANTE.sp_usuario_updCliente", param);
            }
            catch (SqlException sqlEx)
            {
                throw new ClienteException(ClienteTypeExcep.TipoDniYaExistente);
            }
        }

        public void UpdEmpresa(int idUsuario, string cuit, string razonSocial, string ciudad, string contacto, string rubroPrincipal)
        {
            object[] param = new object[] { idUsuario, cuit, razonSocial, ciudad, contacto, rubroPrincipal };

            this._db.ExecuteNonQuery("LOS_DE_ADELANTE.sp_usuario_updEmpresa", param);
        }

        public UsuarioLogin GetLoginData(string username)
        {
            object[] param = new object[] { username };

            var data = this._db.ExecuteSprocAccessor<UsuarioLogin>("LOS_DE_ADELANTE.sp_usuario_getLoginData", param).FirstOrDefault();

            return data;
        }

        public List<Cliente> GetByCliente(string nombre, string apellido, decimal dni, string email)
        {
            object[] param = new object[] { nombre, apellido, dni, email };

            var data = this._db.ExecuteSprocAccessor<Cliente>("LOS_DE_ADELANTE.sp_usuario_getClienteFiltros", param).ToList();

            return data;
        }

        public List<Empresa> GetByEmpresa(string razonSocial, string cuit, string email)
        {
            object[] param = new object[] { razonSocial, cuit, email };

            var data = this._db.ExecuteSprocAccessor<Empresa>("LOS_DE_ADELANTE.sp_usuario_getEmpresaFiltros", param).ToList();

            return data;
        }

        public void SetFechaBaja(string username, DateTime fechaSistema)
        {
            object[] param = new object[] { username, fechaSistema };

            this._db.ExecuteSprocAccessor<UsuarioLogin>("LOS_DE_ADELANTE.sp_usuario_setFechaBaja", param);
        }

        public List<Rol> Autenticar(string username, string passHashed)
        {
            object[] param = new object[] { username, passHashed };

            var data = this._db.ExecuteSprocAccessor<Rol>("LOS_DE_ADELANTE.sp_usuario_login", param).ToList();

            return data;
        }

        #region Estadisticas

        public List<EstVendProd> GetVendedoresProductosBy(int anio, int trimestre)
        {
            object[] param = new object[] { anio, trimestre };

            var data = this._db.ExecuteSprocAccessor<EstVendProd>("LOS_DE_ADELANTE.sp_usuario_getVendedoresProductos", param).ToList();

            return data;
        }

        public List<EstCompProd> GetClientesProductosBy(int anio, int trimestre)
        {
            object[] param = new object[] { anio, trimestre };

            var data = this._db.ExecuteSprocAccessor<EstCompProd>("LOS_DE_ADELANTE.sp_usuario_getClientesProductos", param).ToList();

            return data;
        }

        public List<EstVendFact> GetVendedoresFacturasBy(int anio, int trimestre)
        {
            object[] param = new object[] { anio, trimestre };

            var data = this._db.ExecuteSprocAccessor<EstVendFact>("LOS_DE_ADELANTE.sp_usuario_getVendedoresFacturas", param).ToList();

            return data;
        }

        public List<EstVendMontoFact> GetVendedoresMontoFacturadoBy(int anio, int trimestre)
        {
            object[] param = new object[] { anio, trimestre };

            var data = this._db.ExecuteSprocAccessor<EstVendMontoFact>("LOS_DE_ADELANTE.sp_usuario_getVendedoresMontoFacturado", param).ToList();

            return data;
        }
        #endregion
    }
}
