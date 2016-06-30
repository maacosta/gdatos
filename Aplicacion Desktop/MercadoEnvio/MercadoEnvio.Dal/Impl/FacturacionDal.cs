using MercadoEnvio.Common.Entity;
using MercadoEnvio.Dal.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace MercadoEnvio.Dal.Impl
{
    public class FacturacionDal : BaseDal
    {
        public List<Facturacion> GetBy(DateTime? fechaDesde, DateTime? fechaHasta, decimal? montoDesde, decimal? montoHasta, string textoDetalle, string usuarioComprador, string usuario)
        {
            var mapper = new FacturacionResultSetMapper();

            object[] param = new object[] { fechaDesde, fechaHasta, montoDesde, montoHasta, textoDetalle, usuarioComprador, usuario };

            var data = this._db.ExecuteSprocAccessor<Facturacion>("LOS_DE_ADELANTE.sp_factura_getFacturaFiltros", mapper, param).ToList();

            return data;
        }

        public Facturacion InsFacturacion(int idPublicacion, int idCompraOferta, DateTime fechaSistema)
        {
            var mapper = new FacturacionResultSetMapper();

            object[] param = new object[] { idPublicacion, idCompraOferta, fechaSistema };

            var data = this._db.ExecuteSprocAccessor<Facturacion>("LOS_DE_ADELANTE.sp_factura_insFactura", mapper, param).First();

            return data;
        }
    }

    internal class FacturacionResultSetMapper : IResultSetMapper<Facturacion>
    {
        public IEnumerable<Facturacion> MapSet(System.Data.IDataReader reader)
        {
            Dictionary<int, Facturacion> modelList = new Dictionary<int, Facturacion>();

            Facturacion model;
            FacturacionItem modelItem;

            while (reader.Read())
            {
                model = new Facturacion
                {
                    Id = reader.GetInt32(0),
                    IdFormaPago = reader.GetInt32(1),
                    FormaPago = reader.GetString(2),
                    Numero = reader.GetDecimal(3),
                    Fecha = reader.GetDateTime(4),
                    Total = reader.GetDecimal(5),
                    Usuario = reader.GetString(6)
                };
                modelList.Add(model.Id, model);
            }

            //Item
            if (reader.NextResult())
                while (reader.Read())
                {
                    int modelId = reader.GetInt32(0);
                    if (modelList.ContainsKey(modelId))
                    {
                        modelItem = new FacturacionItem
                        {
                            IdFactura = reader.GetInt32(0),
                            Id = reader.GetInt32(1),
                            IdCompraOferta = reader.GetInt32(2),
                            Monto = reader.GetDecimal(3),
                            Cantidad = reader.GetDecimal(4)
                        };
                        modelList[modelId].Items.Add(modelItem);
                    }
                }

            return modelList.Select(a => a.Value); ;
        }
    }
}
