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
 * Класс "Турпутевка заграничная"
 */
namespace turist.App_Code
{
    public class t_zagr
    {
          public t_zagr(int t_zagrID, string name, string siteurl, string about, 
            string phone, string email, string address, string country, int cost)
        {
            this.t_zagrID = t_zagrID;
            this.name=name;
            this.country=country; 
            this.about=about;
            this.address=address;
            this.email=email;
            this.phone=phone;
            this.siteurl=siteurl; //www address
            this.cost = cost;
        }
        public t_zagr() { }

        private int t_zagrID;
        public int t_ZagrID
        {
            get { return t_zagrID; }
            set { t_zagrID = value; }
        }

        private string name;
        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        private string country;
        public string Country
        {
            get { return country; }
            set { country = value; }
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
        
        private int cost;
        public int Cost
        {
            get { return cost; }
            set { cost = value; }
        }
    }
}
