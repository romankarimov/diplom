<%@ Page Language="C#" MasterPageFile="~/Other.master" AutoEventWireup="true" CodeBehind="Panel.aspx.cs" Inherits="turist.WebForm1" Title="Главная" %>
<%@ Reference Control ="~/templates/msg.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <table  cellpadding="0" cellspacing="0" width="100%" >
        <tr valign = "top" style="vertical-align:top">
            <td align = "center" valign ="top"  >
                <a href="/neworder.aspx"><img class="mainmenu" src="images/docs.png" title="Заказ" alt="Заказ" /><br/>Заказ</a>
            </td>

            
            <td align = "center">
            
                    <a href="/turists.aspx"><img class="mainmenu" src="images/tourists.png" title="Туристы" alt="Туристы" /><br/>Туристы</a>
            </td>
            <td align = "center">
                <a href="/turs.aspx"><img class="mainmenu" src="images/accomodation.png" title="Туристические направления" alt="Я - туроператор"/><br/>Турнаправления</a>
            </td>
        </tr>
        <tr valign = "top" style="vertical-align:top">
            <td align = "center">
                <a href="/"><img class="mainmenu" src="images/payment.png" title="Оплата" alt="Оплата" /><br/>Оплата</a>
            </td>
            <td align = "center">
                <a href="neworderpeople.aspx"><img class="mainmenu" src="images/archive.png" title="Архив" alt="Архив" /><br/>Архив</a>
            </td>
            <td align = "center">
                <a href="/Admin/index.aspx"><img class="mainmenu" src="images/settings.png" title="Настройки" alt="Настройки" /><br/>Настройки</a>
            </td>
        </tr>    
    </table>
</asp:Content>
<asp:Content ID="MessageList" ContentPlaceHolderID="MassageList" runat="server">
    <script runat=server>
    private turist.App_Code.PeopleDB pdb = new turist.App_Code.PeopleDB();
    private turist.App_Code.OrderDB orddb = new turist.App_Code.OrderDB();
    private string date_now = Convert.ToString(DateTime.Now.Date).Substring(0,10);
    private string date_now1 = Convert.ToString(DateTime.Now.Date.AddDays(1)).Substring(0, 10);
    private string date_now2 = Convert.ToString(DateTime.Now.Date.AddDays(2)).Substring(0, 10);
    private int count = 0;
    void Page_Load(Object sender, EventArgs e)
    {
        count = 0;
        /*Дни рождения сегодня, завтра, послезавтра*/
    System.Collections.Generic.List<turist.App_Code.tpeople> pl = pdb.GetAllPeoples();
        foreach (turist.App_Code.tpeople p in pl)
        {
           if (p.Birthday == date_now )
            {
                count += 1;
            turist.WebUserControl3 cntrl = (turist.WebUserControl3)LoadControl("templates/msg.ascx");
            cntrl.SetFio = p.Fio;
            cntrl.Image = "b";
            Today.Controls.Add(cntrl);
            }
            
        }
        if (count == 0)
        {
            turist.WebUserControl3 cntrl = (turist.WebUserControl3)LoadControl("templates/msg.ascx");
            cntrl.SetFio = "Ничего нет";
            Today.Controls.Add(cntrl);
        }
        count = 0;
        foreach (turist.App_Code.tpeople p in pl)
        {
            if (p.Birthday == date_now1)
            {
                count += 1;
                turist.WebUserControl3 cntrl = (turist.WebUserControl3)LoadControl("templates/msg.ascx");
                cntrl.SetFio = p.Fio;
                cntrl.Image = "b";
                Tomorrow.Controls.Add(cntrl);
            }
        }
        if (count == 0)
        {
            turist.WebUserControl3 cntrl = (turist.WebUserControl3)LoadControl("templates/msg.ascx");
            cntrl.SetFio = "Ничего нет";
            Tomorrow.Controls.Add(cntrl);
        }
        count = 0;
        foreach (turist.App_Code.tpeople p in pl)
        {
            if (p.Birthday == date_now2)
            {
                count += 1;
                turist.WebUserControl3 cntrl = (turist.WebUserControl3)LoadControl("templates/msg.ascx");
                cntrl.SetFio = p.Fio;
                cntrl.Image = "b";
                Tomorroww.Controls.Add(cntrl);
            }
        }
        if (count == 0)
        {
            turist.WebUserControl3 cntrl = (turist.WebUserControl3)LoadControl("templates/msg.ascx");
            cntrl.SetFio = "Ничего нет";
            Tomorroww.Controls.Add(cntrl);
        }    
    
    }
    </script>
    
    <table id="MssgListTable">
        <tr><td style="text-align:left">Сегодня:</td></tr>
        <asp:PlaceHolder ID="Today" runat="server"></asp:PlaceHolder>
        <tr><td style="text-align:left">Завтра:</td></tr>
        <asp:PlaceHolder ID="Tomorrow" runat="server"></asp:PlaceHolder>
        <tr><td style="text-align:left">Послезавтра:</td></tr>
        <asp:PlaceHolder ID="Tomorroww" runat="server"></asp:PlaceHolder>
    </table>
</asp:Content>