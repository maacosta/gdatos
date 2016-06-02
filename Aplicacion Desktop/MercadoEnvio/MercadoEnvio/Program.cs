using Microsoft.Practices.EnterpriseLibrary.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApplication1
{
    static class Program
    {
        static LogWriter _logWriter;
        /// <summary>
        /// Punto de entrada principal para la aplicación.
        /// </summary>
        [STAThread]
        static void Main()
        {
            LogWriterFactory logWriterFactory = new LogWriterFactory();
            _logWriter = logWriterFactory.Create();
            
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            Application.ApplicationExit += Application_ApplicationExit;
            Application.ThreadException += new ThreadExceptionEventHandler(Application_ThreadException);
            Application.SetUnhandledExceptionMode(UnhandledExceptionMode.CatchException);
            AppDomain.CurrentDomain.UnhandledException += new UnhandledExceptionEventHandler(CurrentDomain_UnhandledException);

            Application.Run(new MercadoEnvio.ABM_Rol.Form1());
            //Application.Run(new Form1());
        }

        static void Application_ApplicationExit(object sender, EventArgs e)
        {
            _logWriter.Dispose();
        }

        static void Application_ThreadException(object sender, ThreadExceptionEventArgs e)
        {
            if(_logWriter.IsLoggingEnabled())
                _logWriter.Write(e.Exception.Message, "Unhandled Thread Exception");
        }

        static void CurrentDomain_UnhandledException(object sender, UnhandledExceptionEventArgs e)
        {
            if (_logWriter.IsLoggingEnabled())
                _logWriter.Write((e.ExceptionObject as Exception).Message, "Unhandled UI Exception");
        }
    }
}
