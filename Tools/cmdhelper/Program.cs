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
            //args = new string[] { "joinscript", @"C:\tfs\GDatos\Base de Datos\Scripts" };

            if (args.Length == 0)
            {
                PrintMessage("Especifique un comando", MessageType.Error);
                return;
            }

            CommandBase cmd = null;
            switch (args[0])
            {
                case "splitscript":
                    cmd = new SplitScript(args);
                    break;
                case "joinscript":
                    cmd = new JoinScript(args);
                    break;
                default:
                    PrintMessage("Comando inexistente", MessageType.Error);
                    PrintMessage("Comandos disponibles: splitscript", MessageType.Info);
                    break;
            }
            if (cmd != null)
            {
                cmd.MessageDispatch += new MessageDispatcher(PrintMessage);
                cmd.Execute();
            }
        }

        static void PrintMessage(string message, MessageType type)
        {
            Console.WriteLine(message);
        }
    }
}
