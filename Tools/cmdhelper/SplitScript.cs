using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace cmdhelper
{
    /// <summary>
    /// splitscript operation path
    /// </summary>
    public class SplitScript : CommandBase
    {
        private int _breakLine;
        private int _breakLineTolerance;

        public SplitScript(string[] args)
            : base(args)
        {
            _breakLine = 2000;
            _breakLineTolerance = 100;
        }

        public void Execute()
        {
            if (this._args.Length < 2)
            {
                this.OnMessageDispatch("Parámetros incorrectos", MessageType.Error);
                this.OnMessageDispatch("Sintáxis: splitscript operation [other_parameters]", MessageType.Info);
            }

            switch (this._args[1])
            {
                case "go":
                    if (this._args.Length != 3)
                    {
                        this.OnMessageDispatch("Parámetros incorrectos", MessageType.Error);
                        this.OnMessageDispatch("Sintáxis: splitscript go script_path", MessageType.Info);
                    }

                    var path = this._args[2];
                    if (!File.Exists(path))
                        this.OnMessageDispatch("El archivo indicado no se encontró", MessageType.Error);

                    this.processGo(path);
                    break;
                default:
                    this.OnMessageDispatch("Parámetros inexistente", MessageType.Error);
                    this.OnMessageDispatch("Parámetros disponibles: go", MessageType.Info);
                    break;
            }
        }

        private void processGo(string path)
        {
            try
            {
                string fn = Path.GetFileNameWithoutExtension(path);
                string pt = Path.GetDirectoryName(path);
                string fne = Path.GetExtension(path);

                using (StreamReader sr = new StreamReader(path))
                {
                    int cf = 1;
                    int cl = 1;
                    string line;
                    StreamWriter sw = null;
                    while ((line = sr.ReadLine()) != null)
                    {
                        if (cf == 1 || (cl > this._breakLine && line.ToLower().CompareTo("go") == 0) || cl > this._breakLine + this._breakLineTolerance)
                        {
                            if (sw != null)
                            {
                                if(line.ToLower().CompareTo("go") == 0)
                                    sw.WriteLine(line);
                                sw.Close();
                            }

                            var pathW = Path.Combine(pt, string.Format("{0}_{1:D3}{2}", fn, cf, fne));
                            sw = new StreamWriter(pathW);
                            cf++;
                            cl = 0;
                            if (line.ToLower().CompareTo("go") != 0)
                            {
                                sw.WriteLine(line);
                                cl++;
                            }
                        }
                        else
                        {
                            sw.WriteLine(line);
                            cl++;
                        }
                    }
                    if (sw != null) sw.Close();
                }
            }
            catch (Exception ex)
            {
                this.OnMessageDispatch("Ocurrió un error intentando leer el archivo: " + ex.Message, MessageType.Error);
            }
        }
    }
}
