using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

namespace turist
{
    
    public partial class neworder : System.Web.UI.Page
    {
        private int idt = 5;
       
        private int ordern;
        protected void Page_Load(object sender, EventArgs e)
        {
            Turist1.Text = "";
            Turist2.Text = "";
            Turist3.Text = "";
            Turist4.Text = "";
        }
        
        protected void Button1_Click(object sender, EventArgs e)
        {

            turist.App_Code.Order ord = new turist.App_Code.Order();
            
            turist.App_Code.OrderDB odb = new App_Code.OrderDB();
            turist.App_Code.PeopleDB pdb = new App_Code.PeopleDB();
            turist.App_Code.serviceDB sdb = new turist.App_Code.serviceDB();
            ord.Numbdogov = numberdoc.Text;
            ord.ClientIDppl = Convert.ToInt32(Clients.SelectedValue);
            ord.Datein = Convert.ToString(D_in.SelectedDate.Day) + "." + Convert.ToString(D_in.SelectedDate.Month) + "." + Convert.ToString(D_in.SelectedDate.Year); ;
            ord.Dateout = Convert.ToString(D_out.SelectedDate.Day) + "." + Convert.ToString(D_out.SelectedDate.Month) + "." + Convert.ToString(D_out.SelectedDate.Year); ;
            ord.OrderID = 1;
            ord.T_bazaID = Convert.ToInt32(Turs.SelectedValue);
            
            ordern = odb.InsertOrder(ord);
            List<turist.App_Code.tpeople> ltp = new List<App_Code.tpeople>();
            if (Turist1.Text != Turist4.Text)
            {
                pdb.InsertPeopleInOrder(Convert.ToInt32(Turist1.SelectedValue), ordern);
            }
            if (Turist2.Text != Turist4.Text)
            {
                pdb.InsertPeopleInOrder(Convert.ToInt32(Turist2.SelectedValue), ordern);
            }
            if (Turist3.Text != Turist4.Text)
            {
                pdb.InsertPeopleInOrder(Convert.ToInt32(Turist3.SelectedValue), ordern);
            }
            if ( Turist4.Text != "")
            {
                pdb.InsertPeopleInOrder(Convert.ToInt32(Turist4.SelectedValue), ordern);
            }
            for (int i = 0; i <= CheckBoxList1.Items.Count-1; i++)
            {
                if (CheckBoxList1.Items[i].Selected)
                {
                    sdb.InsertServiceInOrder(Convert.ToInt32(CheckBoxList1.Items[i].Value),ordern);
                }
            }
            ResolveUrl("neworderpeople.aspx");         
        }

        protected void Turs_SelectedIndexChanged(object sender, EventArgs e)
        {
            ObjectDataSource5.SelectParameters[0].DefaultValue = Turs.SelectedValue;

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            ResolveUrl("neworderpeople.aspx");
        }
        private void Button_DOG(object sender, EventArgs e)
        {

           /* turist.App_Code.Wordwork Word = new turist.App_Code.Wordwork("/doctemplates/Doc1.dot");
            Word.ReplaceTextByBookmark("NameField", numberdoc.Text);
            Word.ReplaceTextByBookmark("TimeField", Turs.Text);
            if (Word.SaveDoc("/docs/") == true)
            {
                Word.Closeword();
            }
            else
            {
                HtmlGenericControl message = new HtmlGenericControl();
                message.InnerText = "<p font=\"red\">Ошибка сохранения документа<p>";
                mas.Controls.Add(message);

                Word.Closeword();
            }*/
        }
        private void Button_SHT(object sender, EventArgs e)
        {

          /*  turist.App_Code.Wordwork Word = new turist.App_Code.Wordwork("/doctemplates/Doc1.dot");
            Word.ReplaceTextByBookmark("NameField", numberdoc.Text);
            Word.ReplaceTextByBookmark("TimeField", Turs.Text);
            if (Word.SaveDoc("/docs/") == true)
            {
                Word.Closeword();
            }
            else
            {
                HtmlGenericControl message = new HtmlGenericControl();
                message.InnerText = "<p font=\"red\">Ошибка сохранения документа<p>";
                mas.Controls.Add(message);

                Word.Closeword();
            }*/
        }
        private void Button_LST(object sender, EventArgs e)
        {

            /*turist.App_Code.Wordwork Word = new turist.App_Code.Wordwork("/doctemplates/Doc1.dot");
            Word.ReplaceTextByBookmark("NameField", numberdoc.Text);
            Word.ReplaceTextByBookmark("TimeField", Turs.Text);
            if (Word.SaveDoc("/docs/") == true)
            {
                Word.Closeword();
            }
            else
            {
                HtmlGenericControl message = new HtmlGenericControl();
                message.InnerText = "<p font=\"red\">Ошибка сохранения документа<p>";
                mas.Controls.Add(message);

                Word.Closeword();
            }*/
        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void addturist_click(object sender, EventArgs e)
        {
            for (int i = 1; i < 5; i++)
            {

                turist.WebUserControl3 cntrl = (turist.WebUserControl3)LoadControl("templates/people.ascx");
                cntrl.setid = idt;
                ListOfTurists.Controls.Add(cntrl);
                idt += 1;
            }
        }

        protected void Button1_Click2(object sender, EventArgs e)
        {
            
            ResolveUrl("neworderpeople.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            turist.App_Code.OrderDB odb = new App_Code.OrderDB();
            if (odb.ClearTable() == 1)
            {
                Button3.Text = "YES";
            }

        }
   
    
    }
}
