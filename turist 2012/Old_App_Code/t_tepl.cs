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
 * Класс "Теплоход"
 */
namespace turist.App_Code
{
    public class t_tepl
    {
        public t_tepl(int t_teplID, string name, string siteurl, string about, 
            string phone, string email, string address, string way, int bazaID)
        {
            this.t_teplID = t_teplID;
            this.name=name;
            this.about=about;
            this.address=address;
            this.email=email;
            this.phone=phone;
            this.siteurl=siteurl; //www address
            this.bazaID = bazaID;
        }
        public t_tepl() { }

        private int t_teplID;
        public int t_TeplID
        {
            get { return t_teplID; }
            set { t_teplID = value; }
        }

        private string name;
        public string Name
        {
            get { return name; }
            set { name = value; }
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

        private int bazaID;
        public int BazaID
        {
            get { return bazaID; }
            set { bazaID = value; }
        }
    }
}
