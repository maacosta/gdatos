using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace cmdhelper
{
    public delegate void MessageDispatcher(string message, MessageType type);

    public enum MessageType { Info, Error, Warning };

    class Program
    {
        static void Main(string[] args)
        {
            //args = new string[] { "splitscript", "go", @"C:\tfs\GDatos\Base de Datos\gd_esquema.Maestra.Table.sql" };

            if (args.Length == 0)
                PrintMessage("Especifique un comando", MessageType.Error);


            switch (args[0])
            {
                case "splitscript":
                    SplitScript cmd = new SplitScript(args);
                    cmd.MessageDispatch += new MessageDispatcher(PrintMessage);
                    cmd.Execute();
                    break;
                default:
                    PrintMessage("Comando inexistente", MessageType.Error);
                    PrintMessage("Comandos disponibles: splitscript", MessageType.Info);
                    break;
            }
        }

        static void PrintMessage(string message, MessageType type)
        {
            Console.WriteLine(message);
        }
    }
}
