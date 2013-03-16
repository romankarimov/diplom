using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace turist.App_Code
{
    public class saves
    {
        public saves(string numberc, string fioc)
        {
            this.fioc = fioc;
            this.numberc = numberc;
          
        }
        public saves()
        {
           
        }
        private string numberc;
        public string Numberc
        {
            get { return numberc ; }
            set { numberc  = value; }
        }

        private string fioc;
        public string Fioc
        {
            get { return fioc; }
            set { fioc = value; }
        }

    }
}