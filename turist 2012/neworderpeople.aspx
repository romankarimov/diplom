<%@ Page Title="Документы" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="neworderpeople.aspx.cs" Inherits="turist.WebForm14" %>
<%@ Reference Control ="~/templates/people.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script runat="server">
        private string number = "TUR-" + Convert.ToString(DateTime.Today.Day) + "/" + Convert.ToString(DateTime.Today.Month) + "/" + Convert.ToString(DateTime.Today.Year) + "-" + Convert.ToString(1);
        public string f;
    //HtmlGenericControl message = new HtmlGenericControl();
    void Page_Load(Object sender, EventArgs e)
    {
        
        if (OrderList.SelectedValue =="")
        {
            ListItem lsi = new ListItem();
            lsi.Text = number;
            lsi.Value = "1";
            lsi.Selected = true;
            OrderList.Items.Add(lsi);
            
        }
    }
  
   
    
</script>
    
    <body>
    <div id="Div1" runat="server"> 
    <table width="200" border="1" style="border-bottom-left-radius:6px;border-color:aliceblue">
    <tr><td>Выберите заказ:</td></tr>
    <tr><td><asp:DropDownList ID="OrderList" runat="server" DataSourceID="ObjectDataSource1" DataTextField="Numbdogov" DataValueField="OrderID"></asp:DropDownList>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetAllOrders" TypeName="turist.App_Code.OrderDB"></asp:ObjectDataSource>
        </td></tr>
    <tr><td>Дата оформления:</td></tr>
    <tr><td align="center"><asp:Calendar ID="d_doc" runat="server"></asp:Calendar></td></tr>
    <tr><td>Документы:</td></tr>
        <tr><td><asp:Button ID="Button1" runat="server" Text="Договор" OnClientClick="window.open('/docs/dogovor_temp.aspx');" OnClick="Button1_Click" /></td></tr>
        <tr><td><asp:Button ID="Button2" runat="server" Text="Счет" OnClientClick="window.open('/docs/schet_temp.aspx');" OnClick="Button2_Click" />:</td></tr>
        <tr><td><asp:Button ID="Button3" runat="server" Text="Лист бронирования" OnClientClick="window.open('/docs/listb_temp.aspx');" OnClick="Button3_Click" /></td></tr>
       

    </table>
    </div>
    </body>
</asp:Content>
