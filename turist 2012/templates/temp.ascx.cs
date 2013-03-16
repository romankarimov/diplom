using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace turist.templates
{
    public partial class temp : System.Web.UI.UserControl
    {
       
            public string text1
            {
                set {
                    TextBox1.Text = value;
                }
            }
            public string text2
            {
                set
                {
                    TextBox2.Text = value;
                }
            }

       
    }
}