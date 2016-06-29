using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MercadoEnvio.Common.FunctionalException
{
    public enum ClienteTypeExcep
    {
        TipoDniYaExistente
    }

    public class ClienteException : Exception
    {
        public ClienteTypeExcep ExceptionType { get; private set; }

        public ClienteException(ClienteTypeExcep type)
            : base(type.ToString())
        {
            this.ExceptionType = type;
        }
    }
}
