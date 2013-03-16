using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace turist
{
    public partial class WebForm16 : System.Web.UI.Page
    {
         private turist.App_Code.t_bazaDB  tbdb = new turist.App_Code.t_bazaDB();
        private List<turist.App_Code.t_baza> bazes;

        protected void Page_Load(object sender, EventArgs e)
        {
            Tur_l_SelectedIndexChanged(sender,e);
        }

        protected void Tur_l_SelectedIndexChanged(object sender, EventArgs e)
        {
            bazes = tbdb.GetAllTurs();
            foreach (turist.App_Code.t_baza b in bazes )
            {
                if(b.T_bazaID == Convert.ToInt32(Tur_l.SelectedValue))
                {
                   /* TextBox1.Text = b.Name;
                    TextBox2.Text = b.Address;
                    TextBox3.Text = b.Way;
                    TextBox4.Text = b.Phone;
                    TextBox5.Text = b.Siteurl;
                    TextBox6.Text = b.Email;*/
                    TextBox7.Text = Convert.ToString(b.Agent);
                }
                
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            tbdb.UpdateAgent(Convert.ToInt32(Tur_l.SelectedValue), Convert.ToInt32(TextBox7.Text));
           // tbdb.UpdateTur(Convert.ToInt32(Tur_l.SelectedValue),TextBox1.Text,TextBox3.Text,TextBox2.Text,TextBox6.Text,TextBox4.Text,TextBox5.Text,"",Convert.ToInt32(TextBox7.Text));
        }
        }
    }
