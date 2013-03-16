using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
/*
 * Класс "Гостиница"
 */
namespace turist.App_Code
{
    public class t_gost
    {
        public t_gost(int t_gostID, string name, string siteurl, string about, 
            string phone, string email, string address, string bronurl)
        {
            this.t_gostID = t_gostID;
            this.name=name;
            this.bronurl=bronurl; //www stranici bronirovaniya nomerov
            this.about=about;
            this.address=address;
            this.email=email;
            this.phone=phone;
            this.siteurl=siteurl; //www address
        }
        public t_gost() { }
        
        private int t_gostID;
        public int t_GostID
        {
            get { return t_gostID; }
            set { t_gostID = value; }
        }

        private string name;
        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        private string bronurl;
        public string Bronurl
        {
            get { return bronurl; }
            set { bronurl = value; }
        }

        private string about;
        public string About
        {
            get { return about; }
            set { about = value; }
        }

        private string address;
        public string Address
        {
            get { return address; }
            set { address = value; }
        }

        private string email;
        public string Email
        {
            get { return email; }
            set { email = value; }
        }

        private string phone;
        public string Phone
        {
            get { return phone; }
            set { phone = value; }
        }

        private string siteurl;
        public string Siteurl
        {
            get { return siteurl; }
            set { siteurl = value; }
        }
    }
}
