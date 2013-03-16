<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="newservice.aspx.cs" Inherits="turist.WebForm11" Title="Добавление услуги" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script runat="server">
private turist.App_Code.serviceDB db = new turist.App_Code.serviceDB();
private turist.App_Code.cervice srvc = new turist.App_Code.cervice();
private turist.App_Code.t_bazaDB tbdb = new turist.App_Code.t_bazaDB();
private bool nullturs = false;
private string connectionString;
private int size_list_t = 0;
void Page_Load(Object sender, EventArgs e)
{
 /*   System.Collections.Generic.List<turist.App_Code.t_baza> bazes = tbdb.GetAllTurs();
    if (bazes.Count == 0) 
    {
        HtmlGenericControl message = new HtmlGenericControl();
        message.InnerHtml = "<p>Список туристических баз пуст!</p>";
        tur_list.Controls.Add(message);
        nullturs = true;
    }
    */
}
protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
{
    ListTurWays.SelectMethod="GetAllTurWayByOperator("+Convert.ToString(DropDownList1.SelectedValue)+")";
    
}
void SaveNewService(Object sender, EventArgs e)
{
    if (!nullturs)
    {
        turist.App_Code.cervice nsrvc = new turist.App_Code.cervice();
        
        nsrvc.Name = setvname.Text;
        nsrvc.Cost = Convert.ToInt32(cost.Text);
        nsrvc.Comment = comment.Text;
        int r = db.InsertService(nsrvc);
        // Button1.Text = nsrvc.Name;

       size_list_t = CheckBoxList1.Items.Count;
        for (int i = 0; i < size_list_t; i++)
        {
            if (CheckBoxList1.Items[i].Selected==true)
            {
                db.InsertServiceInTur(r, Convert.ToInt32(CheckBoxList1.Items[i].Value));
            }
        }
        
        
        
        
        if (r != 0)
        {
            HtmlGenericControl message = new HtmlGenericControl();
            message.InnerHtml = "<h5 style='color: Red'>Услуга #" + Convert.ToString(r) + " успешно записана!</h5>";
            mas.Controls.Add(message);
        }
    }
}
   
</script>
 <div id="Div1" width="100%" heigth="100%" runat="server">
    <table width="100%">
    <tr align="left" >Добавление новой услуги
        <td>
        <tr align=left>
        <td>Название услуги</td><td><asp:TextBox ID="setvname" runat="server"></asp:TextBox></td>  
        </tr>
        <tr align=left>
        <td>Цена</td><td>
            <asp:TextBox ID="cost" runat="server" />
            </td>  
        </tr>
        
        <tr align=left>
        <td>Описание</td><td><asp:TextBox ID="comment" runat="server"></asp:TextBox></td>  
        </tr>
        <tr align=left>
        <td>Туроператор</td><td>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="ListTurOperators" DataTextField="Name" DataValueField="TuroperatorID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
            <asp:ObjectDataSource ID="ListTurOperators" runat="server" SelectMethod="GetAllTurOperator" TypeName="turist.App_Code.t_bazaDB"></asp:ObjectDataSource>
            </td>  
        </tr>
        <tr align=left>
        <td>Турнаправление</td><td id="tur_list" runat="server">
            <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="ListTurWays" DataTextField="Name" DataValueField="ID">
            </asp:CheckBoxList>
            <asp:ObjectDataSource ID="ListTurWays" runat="server" SelectMethod="GetAllTurWay" TypeName="turist.App_Code.t_bazaDB"></asp:ObjectDataSource>
            </td>  
            
        </tr>
        </td>
    </tr>
    <tr><td colspan=2 id="mas" runat="server"></td> </tr>
    </table>
    
    <div style="text-align:right">
        <asp:Button ID="Button1" OnClick="SaveNewService" runat="server" Text="Сохранить" /></div>
    
</div>
</asp:Content>
