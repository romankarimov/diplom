using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
namespace turist.docs
{
    public partial class schet_temp : System.Web.UI.Page
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


            
            setnametur = tb.Name;
                       setclient = tp.Fio;
            numbdoc.Text = datedoc;
            setcolvo = Convert.ToString(count);
            List<turist.App_Code.cervice> list = odb.GetServiceOrder(orderid);
            foreach (turist.App_Code.cervice a in list)
            {
                serv.Items.Add(a.Name);
                costs = costs + a.Cost;
            }
            double costa = ((Convert.ToDouble(tb.Agent) / 100) * Convert.ToDouble(costs));
            costs += (costa);
            setcost = Convert.ToString(costs);
           
        }
       
        public string setclient
        {
            set
            {
                client.Text = (value);
               
            }
        }
       
        public string setnametur
        {
            set
            {
                nametur.Text = (value);
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
                cost0.Text = value;
                cost1.Text = value;
                cost2.Text = value;
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