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
    public partial class WebUserControl2: System.Web.UI.UserControl
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }
        private string male = "~/images/male.png";
        private string female = "~/images/female.png";
        private string edit = "~/images/edit.png";
        private string delete = "~/images/del.png";
        
        public string Sex
        {
            set
            {
                Image2.ImageUrl = edit;

                Image3.ImageUrl = delete;
                if (value == "m")
                {
                    Image1.ImageUrl = male;
                    
                }
                else
                {
                    Image1.ImageUrl = female;
                }
            }
        }
        
        public string Fio
        {
            set
            {
                TuristN.Text = value;
                
            }
        }
        public string IDImage
        {
            set
            {
                Image2.ID = "edit" + value;
                Image3.ID = "delete" + value;
            }
        }
       
        public string Phone
        {
            set
            {
                PhoneT.Text = value;
               
            }
        }
        public string Email
        {
            set
            {
                EmailP.Text = value; 
            }
        }
        protected void Delete(object sender, EventArgs e)
        {
            
        }
        
        protected void Image3_Click(object sender, ImageClickEventArgs e)
        {
           
        }
        
       
    }
}