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
namespace turist.templates
{
    public partial class cntrltur : System.Web.UI.UserControl
    {
        public string SName
        {
            set
            {
                TurName.Text = value;

            }
        }
        public string SPhone
        {
            set
            {
                Phone.Text = value;

            }
        }
        public string SEmail
        {
            set
            {
                Email.Text = value;

            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}