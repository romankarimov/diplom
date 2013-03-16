<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="orders.aspx.cs" Inherits="turist.WebForm3" Title="Заказы" %>
<%@ Reference Control="~/templates/order.ascx" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server"  >

<script runat="server">

    turist.App_Code.OrderDB odb = new turist.App_Code.OrderDB();
    turist.App_Code.OrganizationDB orgdb = new turist.App_Code.OrganizationDB();
    turist.App_Code.PeopleDB pdb = new turist.App_Code.PeopleDB();
    void Page_Load(Object sender, EventArgs e)
    {
            System.Collections.Generic.List<turist.App_Code.Order> ord = odb.GetAllOrders();
            foreach (turist.App_Code.Order o in ord)
            {
                turist.WebUserControl4 cntrl = (turist.WebUserControl4)LoadControl("templates/order.ascx");
                cntrl.SName = o.Numbdogov;
                cntrl.SCost = o.Datein;
                
                if (Convert.ToString(o.ClientIDppl) != "") 
                {
                    cntrl.SClient = pdb.GetFioPeople(o.ClientIDppl);
                }
                
                Place1.Controls.Add(cntrl);
            }
    }    

</script>


<table>
    <asp:PlaceHolder ID="Place1" runat="server">
       
    </asp:PlaceHolder>
</table>

</asp:Content>
