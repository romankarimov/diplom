using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace turist.docs
{
    public partial class dogovor : System.Web.UI.Page
    {
        turist.App_Code.serviceDB sdb = new App_Code.serviceDB();
        

        public string setndoc
        {
            set
            {
                ndoc.Text = (value);
            }
        }
        public string setmdoc
        {
            set
            {
                mdoc.Text = (value);
            }
        }
        public string setchdoc
        {
            set
            {

                chdoc.Text = value;
            }
        }
        public string setclient
        {
            set
            {
                client.Text = (value);
                fio.Text=value;
                fioc.Text = value;
            }
        }
        public string setturtip
        {
            set
            {
                turtip.Text = (value);
            }
        }

        public string setnametur
        {
            set
            {
                nametur.Text = (value);
            }
        }
        public string setfaktadr
        {
            set
            {
                faktadr.Text = (value);
            }
        }
        public string setdin
        {
            set
            {
                din.Text = (value);
            }
        }
        public string setdout
        {
            set
            {
                dout.Text = (value);
            }
        }
        public string setturists
        {
            set
            {
                turists.Text = (value);
            }
        }
        public string setcost
        {
            set
            {
                cost.Text = (value);
            }
        }
        public string setcostmin
        {
            set
            {
                costmin.Text = (value);
            }
        }
        public string setbirth
        {
            set
            {
                birth.Text = (value);
            }
        }
        public string setnpasp
        {
            set
            {
                npasp.Text = (value);
            }
        }
        public string setspasp
        {
            set
            {
                spasp.Text = (value);
            }
        }
        public string setwhopasp
        {
            set
            {
                whopasp.Text = (value);
            }
        }
        public string setwherepasp
        {
            set
            {
                wherepasp.Text = (value);
            }
        }
        public string setphone
        {
            set
            {
                phone.Text = (value);
            }
        }
        public string setemail
        {
            set
            {
                email.Text = (value);
            }
        }
        public int setorderlist
        {
            set
            {
                listserv.DataSource = sdb.GetServicesOrder(value);
            }
        }
        }
    }
