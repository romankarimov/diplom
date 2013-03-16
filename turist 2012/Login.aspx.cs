using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using turist.App_Code;
namespace turist
{
    public partial class Login : System.Web.UI.Page
    {
        protected void LoginAction_Click(object sender, EventArgs e)
        {
            
            /*
        try
            {
            
                // Извлечь из БД и сравнить с введенным 
                turist.App_Code.users.MemberDB mdb = new turist.App_Code.users.MemberDB();
                turist.App_Code.member mmb = new turist.App_Code.member();
                mmb = mdb.ValidateUser(log.Text, pas.Text);
                if (mmb.Passwd.Length > 4)
                {
                    Session["fio"] = mmb.Fio;
                
                    // Создать временный cookie-набор (второй параметр false),
                    // записать в него  метку аутентификации и перенаправить
                    // на исходную запрошенную страницу или MyDefault.aspx
                    FormsAuthentication.RedirectFromLoginPage(log.Text, false);
                }
                else
                {
                    HtmlGenericControl message = new HtmlGenericControl();
                    message.InnerHtml = "<h2 style='color: Red'>Неверное имя или пароль!</h2>";
                    massage.Controls.Add(message);
                
                }
            }
        catch
            {
                HtmlGenericControl message = new HtmlGenericControl();
                message.InnerHtml = "<h2 style='color: Red'>Ошибка входа!</h2><br/><h3 style='color:DarkBlue'><a href='mailto:roman-kmail@mail.ru'>Написать администратору<a/></h3>";
                massage.Controls.Add(message);
            }
    */

        }
        protected void LoginButton_Click(object sender, EventArgs e)
        {

            string login = Login1.UserName;
            string password = Login1.Password;
            string user = UserType.SelectedItem.Value;
            
           
            try
            {
                if (user == "menedger")
                {
                    App_Code.security.security security = new App_Code.security.security();
                    member member = new member();
                    MemberDB memberDB = new MemberDB();
                    try
                    {
                        member = memberDB.GetMember(security.menedgerautho(login, password));
                        HttpCookie cookie = new HttpCookie("User");
                        cookie["fio"] = member.Fio;
                        cookie["role"] = memberDB.GetMemberRole(member.MemberID);
                        Response.Cookies.Add(cookie);
                        cookie.Expires = DateTime.Now.AddHours(3);
                        Response.Redirect("~/Panel.aspx",true);
                        
                    }
                    catch
                    {
                        Login1.FailureText = "Email или пароль не верны!";
                    }
                    
                }
                else
                {
                    App_Code.security.security security = new App_Code.security.security();
                    menedger menedger = new menedger();
                    MemberDB memberDB = new MemberDB();
                    try
                    {
                        menedger = memberDB.GetMenedger(security.menedgerautho(login, password));
                        HttpCookie cookie = new HttpCookie("User");
                        cookie["fio"] = menedger.Fio;
                        Response.Cookies.Add(cookie);
                        cookie.Expires = DateTime.Now.AddHours(3);
                        Response.Redirect("~/provider/Panel.aspx", true);
                    }
                    catch
                    {
                        Login1.FailureText = "Email или пароль не верны!";
                    }

                }
            }
            catch
            {
                Login1.FailureText = "Вход не удался";
            }
        }
        

        
    }
}
