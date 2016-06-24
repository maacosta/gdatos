using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace cmdhelper
{
    public class JoinScript : CommandBase
    {
        private string _joinFileName;
        private string _patternFilter;

        public JoinScript(string[] args)
            : base(args)
        {
            this._joinFileName = "script_joined.sql";
            this._patternFilter = "*.sql";
        }

        public override void Execute()
        {
            if (this._args.Length < 2)
            {
                this.OnMessageDispatch("Parámetros incorrectos", MessageType.Error);
                this.OnMessageDispatch("Sintáxis: joinscript path", MessageType.Info);
            }

            if (!Directory.Exists(this._args[1]))
            {
                this.OnMessageDispatch("El path indicado no existe", MessageType.Error);
            }

            using (StreamWriter sw = new StreamWriter(Path.Combine(this._args[1], this._joinFileName)))
            {
                sw.WriteLine("/* LDA Archivo unificado {0} */", DateTime.Now.ToString("dd/MM/yyyy HH:mi:ss"));
                sw.WriteLine();
                this.ProcessDirectory(this._args[1], sw);
            }
        }

        private void ProcessDirectory(string path, StreamWriter sw)
        {
            foreach (var dir in Directory.GetDirectories(path))
            {
                this.ProcessDirectory(dir, sw);
            }
            foreach (var fil in Directory.GetFiles(path, this._patternFilter))
            {
                if (fil == Path.Combine(path, this._joinFileName))
                    continue;

                sw.WriteLine(string.Format("/* LDA Archivo: {0} */", fil.Substring(this._args[1].Length)));
                sw.WriteLine();
                using (StreamReader sr = new StreamReader(fil))
                {
                    sw.Write(sr.ReadToEnd());
                }
                sw.WriteLine();
                sw.WriteLine("GO");
                sw.WriteLine();
            }
        }
    }
}
