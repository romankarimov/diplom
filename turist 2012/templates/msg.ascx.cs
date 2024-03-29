﻿using System;
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
    public partial class WebUserControl3 : System.Web.UI.UserControl
    {
        private string birthday = "~/images/birthday.png";
        private string input = "~/images/in.png";
        private string output = "~/image/output.png";

        public string Image
        {
            set
            {
                if (value == "b")
                {
                    TypeOfMsg.ImageUrl = birthday;
                }
                if (value == "i")
                {
                    TypeOfMsg.ImageUrl = input;
                }
                if (value == "o")
                {
                    TypeOfMsg.ImageUrl = output;
                }
            }
        }

        public string SetFio
        {
            set
            {       
                 Fio.Text = value;
            }
        }
         
    }
}