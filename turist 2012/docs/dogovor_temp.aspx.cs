using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;

using System.Data.SqlClient;
namespace turist.docs
{
    public partial class dogovor_temp : System.Web.UI.Page
    {
        private string datedoc;
        private int orderid;
        
        turist.WebForm14 wf = new WebForm14();
        turist.App_Code.serviceDB sdb = new App_Code.serviceDB();
        turist.App_Code.OrderDB odb = new App_Code.OrderDB();
        turist.App_Code.PeopleDB pdb = new App_Code.PeopleDB();
        turist.App_Code.tpeople tp = new App_Code.tpeople();
        turist.App_Code.Order ord = new App_Code.Order();
        turist.App_Code.t_bazaDB tdb = new App_Code.t_bazaDB();
        turist.App_Code.t_baza tb = new App_Code.t_baza();
        private double costs = 0;
        public void Main()
        {
            string path = @"C:\Users\Roman\Desktop\turist\turist 2012\App_Data\data.txt";
            
            if (!File.Exists(path))
            {
                throw new ApplicationException("File data.txt is not found!");
            }

            
            using (StreamReader sr = File.OpenText(path))
            {

                datedoc = sr.ReadLine();
                orderid = Convert.ToInt32(sr.ReadLine());
                
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Main();
            //datedoc = odb.GetTemp();
            //orderid = Convert.ToInt32(odb.GetTemp2());
            DateTime doc = new DateTime();
            doc = Convert.ToDateTime(datedoc);

            List<turist.App_Code.Order> ordl = odb.GetAllOrders();
            foreach (turist.App_Code.Order ore in ordl)
            {
                if (ore.OrderID == orderid)
                {
                    ord = ore;
                }
            }

            List<turist.App_Code.t_baza> tbdl = tdb.GetAllTurs();
            foreach (turist.App_Code.t_baza tbz in tbdl)
            {
                if (tbz.T_bazaID == ord.T_bazaID)
                {
                    tb = tbz;
                }
            }

            List<turist.App_Code.tpeople> ppl = pdb.GetAllPeoples();
            foreach (turist.App_Code.tpeople pplz in ppl)
            {
                if (pplz.PeopleID == ord.ClientIDppl)
                {
                    tp = pplz;
                }
            }

            //tb = tdb.GetTur(ord.T_bazaID);

            //tp = pdb.GetPeople(ord.ClientIDppl);
            int count = pdb.CountPeopleOrder(orderid);


            setchdoc = Convert.ToString(doc.Day);
            setmdoc = Convert.ToString(doc.Month);
            setbirth = tp.Birthday;
            setnametur = tb.Name;
            fioc.Text = tp.Fio;
            setclient = tp.Fio;
            setndoc = ord.Numbdogov;
            setnpasp = tp.Numberpasp;
            setphone = tp.Phone;
            setemail = tp.Email;
            setdin = ord.Datein;
            setdout =ord.Dateout;
            setfaktadr = tb.About;
            setspasp = tp.Seriapasp;
            setturtip = tb.Way.Substring(0, tb.Way.Length-1)+"у";
            setwherepasp = tp.Wherepasp;
            setwhopasp = tp.Whopasp;
            setcolvo = Convert.ToString(count);
            List<turist.App_Code.cervice> list = odb.GetServiceOrder(orderid);
            int countl = list.Count;
            foreach (turist.App_Code.cervice a in list)
            {
                listserv.Items.Add(a.Name);
               
                costs = costs + a.Cost;
            }
            double costa = ((Convert.ToDouble(tb.Agent) / 100) * Convert.ToDouble(costs));
            costs += (costa);
            setcost = Convert.ToString(costs);
            setcostmin = Convert.ToString(costs * 0.5);
        }

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
        public string setcolvo
        {
            set
            {
                turists.Text = value;
            }
        }
        }
    }
