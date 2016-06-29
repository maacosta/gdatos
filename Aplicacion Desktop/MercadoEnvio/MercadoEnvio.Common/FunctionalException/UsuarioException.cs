using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MercadoEnvio.Common.FunctionalException
{
    public enum UsuarioTypeExcep
    {
        IntentosDeLoginFallidos_UsuarioBloqueado,
        UsuarioInexistente,
        ClaveIncorrecta,
        UsuarioYaExiste
    }

    public class UsuarioException : Exception
    {
        public UsuarioTypeExcep ExceptionType { get; private set; }

        public UsuarioException(UsuarioTypeExcep type)
            : base(type.ToString())
        {
            this.ExceptionType = type;
        }
    }
}
