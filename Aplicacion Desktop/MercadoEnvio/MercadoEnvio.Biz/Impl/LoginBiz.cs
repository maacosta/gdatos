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
    public class LoginBiz
    {
        private UsuarioDal _usuarioDal;
        private PermisoDal _permisoDal;

        public LoginBiz()
        {
            this._usuarioDal = new UsuarioDal();
            this._permisoDal = new PermisoDal();
        }

        public List<Rol> Login(string user, string password, DateTime fechaSistema)
        {
            var loginData = this._usuarioDal.GetLoginData(user);

            if (loginData == null)
            {
                throw new UsuarioException(UsuarioTypeExcep.UsuarioInexistente);
            }
            else if (loginData.Intentos >= 3)
            {
                this._usuarioDal.SetFechaBaja(user, fechaSistema);
                throw new UsuarioException(UsuarioTypeExcep.IntentosDeLoginFallidos_UsuarioBloqueado);
            }

            var hash = this.GetHashing(password, loginData.PassSalt);

            var roles = this._usuarioDal.Autenticar(user, hash);

            if (roles == null || roles.Count == 0)
            {
                throw new UsuarioException(UsuarioTypeExcep.ClaveIncorrecta);
            }

            return roles;
        }

        public List<Permiso> GetPermisos(Rol rol)
        {
            return this._permisoDal.GetPermisos(rol.Id);
        }

        public string ComputeHash(string plainText, out string salt)
        {
            byte[] saltBytes = this.GetRandomSalt();

            salt = Convert.ToBase64String(saltBytes);

            string hashValue = this.GetHashing(plainText, saltBytes);

            // Return the result.
            return hashValue;
        }

        private string GetHashing(string plainText, byte[] saltBytes)
        {
            // Convert plain text into a byte array.
            byte[] plainTextBytes = Encoding.UTF8.GetBytes(plainText);

            // Allocate array, which will hold plain text and salt.
            byte[] plainTextWithSaltBytes = new byte[plainTextBytes.Length + saltBytes.Length];

            // Copy plain text bytes into resulting array.
            for (int i = 0; i < plainTextBytes.Length; i++)
                plainTextWithSaltBytes[i] = plainTextBytes[i];

            // Append salt bytes to the resulting array.
            for (int i = 0; i < saltBytes.Length; i++)
                plainTextWithSaltBytes[plainTextBytes.Length + i] = saltBytes[i];

            HashAlgorithm hash = new SHA256Managed();

            // Compute hash value of our plain text with appended salt.
            byte[] hashBytes = hash.ComputeHash(plainTextWithSaltBytes);

            // Create array which will hold hash and original salt bytes.
            byte[] hashWithSaltBytes = new byte[hashBytes.Length + saltBytes.Length];

            // Copy hash bytes into resulting array.
            for (int i = 0; i < hashBytes.Length; i++)
                hashWithSaltBytes[i] = hashBytes[i];

            // Append salt bytes to the result.
            for (int i = 0; i < saltBytes.Length; i++)
                hashWithSaltBytes[hashBytes.Length + i] = saltBytes[i];

            // Convert result into a base64-encoded string.
            string hashValue = Convert.ToBase64String(hashWithSaltBytes);
            return hashValue;
        }

        private byte[] GetRandomSalt()
        {
            // Generate a random number for the size of the salt.
            Random random = new Random();
            int saltSize = random.Next(4, 8);

            // Allocate a byte array, which will hold the salt.
            byte[] saltBytes = new byte[saltSize];

            // Initialize a random number generator.
            RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();

            // Fill the salt with cryptographically strong byte values.
            rng.GetNonZeroBytes(saltBytes);

            return saltBytes;
        }

        public string GetHashing(string plainText, string saltValue)
        {
            byte[] saltBytes = Convert.FromBase64String(saltValue);
            
            return this.GetHashing(plainText, saltBytes);
        }
    }
}
