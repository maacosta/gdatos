using MercadoEnvio.Common.Entity;
using MercadoEnvio.Dal.Impl;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MercadoEnvio.Biz.Impl
{
    public class PublicacionBiz
    {
        private PublicacionDal _publicacionDal;

        public PublicacionBiz()
        {
            this._publicacionDal = new PublicacionDal();
        }

        public List<Publicacion> GetPropiasBy(string username, string texto)
        {
            return this._publicacionDal.GetPropiasBy(username, texto);
        }

        public List<Publicacion> GetNoPropiasBy(string username, string texto, string codigosRubro)
        {
            return this._publicacionDal.GetNoPropiasBy(username, texto, codigosRubro);
        }

        public List<Publicacion> GetFinalizadasBy(string username, DateTime fechaSistema)
        {
            return this._publicacionDal.GetFinalizadasBy(username, fechaSistema);
        }

        public Publicacion InsPublicacion(Publicacion publicacion)
        {
            return this._publicacionDal.InsPublicacion(
                publicacion.TipoPublicacion, 
                publicacion.Estado, 
                publicacion.Descripcion, 
                publicacion.Stock, 
                publicacion.FechaInicio, 
                publicacion.FechaVencimiento, 
                publicacion.Precio, 
                publicacion.Costo, 
                publicacion.PermitirPreguntas, 
                publicacion.IncluirEnvio, 
                publicacion.IdRubro, 
                publicacion.IdVisibilidad, 
                publicacion.Usuario);
        }

        public Publicacion UpdPublicacion(Publicacion publicacion)
        {
            return this._publicacionDal.UpdPublicacion(
                publicacion.Id,
                publicacion.TipoPublicacion, 
                publicacion.Estado, 
                publicacion.Descripcion, 
                publicacion.Stock, 
                publicacion.FechaInicio, 
                publicacion.FechaVencimiento, 
                publicacion.Precio, 
                publicacion.Costo, 
                publicacion.PermitirPreguntas, 
                publicacion.IncluirEnvio, 
                publicacion.IdRubro, 
                publicacion.IdVisibilidad, 
                publicacion.Usuario);
        }

        public void UpdPublicacionEstado(int idPublicacion, string estado)
        {
            this._publicacionDal.UpdPublicacionEstado(idPublicacion, estado);
        }
    }
}
