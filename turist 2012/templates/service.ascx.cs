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
        
       
        
        
        public string SName
        {
            set
            {
                ServiceName1.Text  = value;
                
            }
        }
        public string SCost
        {
            set
            {
                ServiceCost1.Text = value;
            }
        }
        public string SAbout
        {
            set
            {
                ServiceAbout1.Text = value;
            }
        }
         
    }
}