using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace cmdhelper
{
    public abstract class CommandBase
    {
        protected string[] _args;


        public event MessageDispatcher MessageDispatch;


        public CommandBase(string[] args)
        {
            this._args = args;
        }


        public abstract void Execute();

        protected void OnMessageDispatch(string message, MessageType type)
        {
            if (this.MessageDispatch != null) this.MessageDispatch(message, type);
        }
    }
}
