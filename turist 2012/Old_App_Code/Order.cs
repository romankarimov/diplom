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

using System.Web.Configuration;
using System.Collections.Generic;
using System.Data.SqlClient;

/*
 * Создаем заказ
 */
namespace turist.App_Code
{
    public class Order
    {
        public Order(int orderID, string numbdogov, 
            int t_bazaID, 
            int clientIDppl, //List<tpeople> turists,
              string datein, string dateout) 
        {
            this.orderID = orderID;
            this.numbdogov = numbdogov; //номер договора    
            this.t_bazaID = t_bazaID; //Вид тура
           
            //Клиент - заказчик путевки
            this.clientIDppl = clientIDppl; //Клиент-физлицо
        
           // this.turists = turists; //список туристов
            this.datein = datein;//дата
            this.dateout = dateout;//дата
        }

        public Order() { }

        private int orderID;
        public int OrderID
        {
            get { return orderID; }
            set { orderID = value; }
        }

        private string numbdogov;
        public string Numbdogov
        {
            get { return numbdogov; }
            set { numbdogov = value; }
        }

        private int t_bazaID;
        public int T_bazaID
        {
            get { return t_bazaID; }
            set { t_bazaID = value; }
        }

       

        private int clientIDppl;
        public int ClientIDppl
        {
            get { return clientIDppl; }
            set { clientIDppl = value; }
        }

      

        /*private List<tpeople> turists;
        public List<tpeople> Turists
        {
            get { return turists; }
            set { turists = value; }
        }*/

        private string datein;
        public string Datein
        {
            get { return datein; }
            set { datein = value; }
        }

        private string dateout;
        public string Dateout
        {
            get { return dateout; }
            set { dateout = value; }
        }

          
    }
}
