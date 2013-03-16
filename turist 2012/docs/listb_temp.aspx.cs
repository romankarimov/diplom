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
    public partial class listb_temp : System.Web.UI.Page
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
            date1.Text = Convert.ToString(doc);
            date2.Text = Convert.ToString(doc);
            
            date3.Text = Convert.ToString(doc);
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


           
            setnametur = tb.Name;
            
            setndoc = ord.Numbdogov;
            setclientfio = tp.Fio;
            setturfio = tb.Name;
            setdin = ord.Datein;
            setdout = ord.Dateout;
            setturfio = tb.Fio;
            DateTime di = Convert.ToDateTime(ord.Datein);
            DateTime dou = Convert.ToDateTime(ord.Dateout);
            string dl = Convert.ToString(dou.Day-di.Day);
            dlin.Text = dl;
            setcolvo = Convert.ToString(count);
            List<turist.App_Code.cervice> list = odb.GetServiceOrder(orderid);
            foreach (turist.App_Code.cervice a in list)
            {
                
                costs = costs + a.Cost;
            }
            double costa = ((Convert.ToDouble(tb.Agent) / 100) * Convert.ToDouble(costs));
            costs += (costa);
            setcost = Convert.ToString(costs);
            //setcostmin = Convert.ToString(costs * 0.5);
        }
        public string setndoc
        {
            set
            {
                ndoc.Text = (value);
            }
        }
        
       
        public string setnametur
        {
            set
            {
                nametur.Text = (value);
            }
        }
        public string setclientfio
        {
            set
            {
                clientfio.Text = (value);
            }
        }
        public string setturfio
        {
            set
            {
                turfio.Text = (value);
            }
        }
       
        public string setdin
        {
            set
            {
                din.Text = (value);
            }
            get
            {
                return din.Text;
            }
        }
        public string setdout
        {
            set
            {
                dout.Text = (value);
            }
            get
            {
                return dout.Text;
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
      
        public string setcolvo
        {
            set
            {
                turists.Text = value;
            }
        }
    }
}