using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

using System.Collections.Generic;

namespace turist
{
    public partial class WebUserControl1 : System.Web.UI.UserControl
    {

        private string edit = "~/images/edit.png";
        private string delete = "~/images/del.png";
        
        public string Name
        {
            set
            {
                TuristN.Text = value;
                Image2.ImageUrl = edit;
                Image3.ImageUrl = delete;
                
            }
        }
        public string Director
        {
            set
            {
                directorl.Text = value;
            }
        }
        public string Address
        {
            set
            {
                address.Text = value;
            }
        }
         
    }
}