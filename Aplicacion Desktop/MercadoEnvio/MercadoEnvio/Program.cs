using System;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Windows.Forms;
using WindowsFormsApplication1.Core;

namespace WindowsFormsApplication1
{
    static class Program
    {
        /// <summary>
        /// Punto de entrada principal para la aplicación.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            Application.ApplicationExit += Application_ApplicationExit;
            Application.ThreadException += new ThreadExceptionEventHandler(Application_ThreadException);
            Application.SetUnhandledExceptionMode(UnhandledExceptionMode.CatchException);
            AppDomain.CurrentDomain.UnhandledException += new UnhandledExceptionEventHandler(CurrentDomain_UnhandledException);

            CultureInfo culture = new CultureInfo(ConfigurationManager.AppSettings["DefaultCulture"]);
            Thread.CurrentThread.CurrentCulture = culture;
            Thread.CurrentThread.CurrentUICulture = culture;
            GlobalData.Instance.FechaSistema = Convert.ToDateTime(ConfigurationManager.AppSettings["FechaSistema"]);

            Application.Run(new frmContenedor());
        }

        static void Application_ApplicationExit(object sender, EventArgs e)
        {
            
        }

        static void Application_ThreadException(object sender, ThreadExceptionEventArgs e)
        {
            //if(_logWriter.IsLoggingEnabled())
                //_logWriter.Write(e.Exception.Message, "Unhandled Thread Exception");
        }

        static void CurrentDomain_UnhandledException(object sender, UnhandledExceptionEventArgs e)
        {
            //if (_logWriter.IsLoggingEnabled())
                //_logWriter.Write((e.ExceptionObject as Exception).Message, "Unhandled UI Exception");
        }
    }
}
