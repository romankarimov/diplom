<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="neworder.aspx.cs" Inherits="turist.neworder" Title="Заказ" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script runat="server">
    //HtmlGenericControl message = new HtmlGenericControl();
        private int w;
        int number = 0;
    void Page_Load(Object sender, EventArgs e)
    {
        turist.App_Code.Order or = new turist.App_Code.Order();
        turist.App_Code.OrderDB or_db = new turist.App_Code.OrderDB();
        
       // w = or_db.InsertOrder("df",1,2,"sd","sds");
        
        
       /* Random RND = new Random();
        if (number == 0)*/
        number = DateTime.Now.Minute;
        
            //number = RND.Next(1, 30);
            //int number = 1;
            numberdoc.Text = "TUR-" + Convert.ToString(DateTime.Today.Day) + "/" + Convert.ToString(DateTime.Today.Month) + "/" + Convert.ToString(DateTime.Today.Year) + "-" + Convert.ToString(number);
            //message.InnerHtml = "ошибка при передаче значений";
            //mas.Controls.Add(message);
        
        ObjectDataSource5.SelectParameters[0].DefaultValue = Turs.SelectedValue;
        CheckBoxList1.DataSourceID = ObjectDataSource5.ID;
        
        turist.App_Code.serviceDB sdb = new turist.App_Code.serviceDB();
        
    }
    
    private int idt = 5;

    //HtmlGenericControl message = new HtmlGenericControl();
 
    void View1(Object sender, EventArgs e)
    {
        turist.WebUserControl3 cntrl = (turist.WebUserControl3)LoadControl("templates/people.ascx");
        cntrl.setid = idt;
        ListOfTurists.Controls.Add(cntrl);
        idt += 1;
    }
    
    
</script>
    <div runat="server" style="width:auto"> 
    <table width="100%">
    <tr><td width="50%"><div id="mas" runat="server" style="text-align:left">
        <asp:Button ID="Button3" runat="server" Text="ClearTable" OnClick="Button3_Click"/>
        </div>
        &nbsp;<tr width="50%" ><td>Номер документа:</td><td>
        <asp:TextBox ID="numberdoc" Width="100%" runat="server"></asp:TextBox></td></tr>
    <tr><td>Туристическое направление:</td><td>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetAllTurs" TypeName="turist.App_Code.t_bazaDB"></asp:ObjectDataSource>
        <asp:DropDownList ID="Turs" Width="100%" runat="server" DataSourceID="ObjectDataSource1" DataTextField="Name" DataValueField="T_bazaID" OnSelectedIndexChanged="Turs_SelectedIndexChanged" AutoPostBack="True">
            <asp:ListItem Value="0"></asp:ListItem>
        </asp:DropDownList>
    </td></tr>
    <tr><td align="center">Дата заезда</td><td align="center">Дата отъезда</td></tr>
    <tr><td align="center"><asp:Calendar ID="D_in" runat="server"></asp:Calendar></td><td align="center"><asp:Calendar ID="D_out" runat="server"></asp:Calendar></td></tr>
    <tr><td colspan=2 align="center">Заказчик</td></tr>
    <tr>
    <td><input id="Org" type="radio" runat=server checked="true" />Физические лица</td>
    <td><input id="Ppl" type="radio" runat =server  />Организации</td>
    </tr>
    <tr><td>ФИО:</td><td>
        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="GetAllPeoples" TypeName="turist.App_Code.PeopleDB"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetAllOrganizations" TypeName="turist.App_Code.OrganizationDB"></asp:ObjectDataSource>
        <asp:DropDownList ID="Clients" Width="100%" runat="server" DataSourceID="ObjectDataSource3" DataTextField="Fio" DataValueField="PeopleID" >
        
        </asp:DropDownList>
    </td></tr>
    <!--<tr><td colspan=2>Услуги</td></tr>-->
    
    </td>
    </tr>
   <tr> <td colspan="2" style="text-align:center ">Туристы</td></tr>
    <tr><asp:ObjectDataSource ID="DataSource" runat="server" SelectMethod="GetAllPeoples" TypeName="turist.App_Code.PeopleDB"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" SelectMethod="GetServicesTur" TypeName="turist.App_Code.serviceDB"></asp:ObjectDataSource>
        </tr>
    <tr><td width="200">Турист 1:</td><td width="100%" align="left">
        <asp:DropDownList ID="Turist1" Width="100%" runat="server" DataSourceID="DataSource" DataTextField="Fio" DataValueField="PeopleID">
            <asp:ListItem Value="0" Text="" Selected="True"></asp:ListItem>
         </asp:DropDownList>
    </td></tr>
    <tr><td width="200">Турист 2:</td><td width="100%" align="left">
        <asp:DropDownList ID="Turist2" Width="100%" runat="server" DataSourceID="DataSource" DataTextField="Fio" DataValueField="PeopleID">
         <asp:ListItem Value="0" Text="" Selected="True"></asp:ListItem>
        </asp:DropDownList>
    </td></tr>
    <tr><td width="200">Турист 3:</td><td width="100%" align="left">
        <asp:DropDownList ID="Turist3" Width="100%" runat="server" DataSourceID="DataSource" DataTextField="Fio" DataValueField="PeopleID">
        </asp:DropDownList>
    </td></tr>
    <tr><td width="200">Турист 4:</td><td width="100%" align="left">
        <asp:DropDownList ID="Turist4" Width="100%" runat="server" DataSourceID="DataSource" DataTextField="Fio" DataValueField="PeopleID">
         <asp:ListItem Value="0" Text="" Selected="True"></asp:ListItem>
        </asp:DropDownList>
    </td></tr>
    <asp:PlaceHolder ID="ListOfTurists" runat="server"></asp:PlaceHolder>
    <tr><td colspan="2" style="text-align:right" onclick="View1">
        <asp:Button ID="Button2" OnClick="addturist_click" runat="server" BorderStyle="None" BackColor="White" Text="Добавить туриста" />
        </td>
        
    </tr>
     <tr><td>Услуги:</td><td style="text-align:left">
    <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="ObjectDataSource5" DataTextField="Name" DataValueField="ServiceID" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged"></asp:CheckBoxList>
         <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" SelectMethod="GetServicesTurCost" TypeName="turist.App_Code.serviceDB">
             <SelectParameters>
                 <asp:Parameter  DefaultValue="1" Name="turID" Type="Int32" />
             </SelectParameters>
         </asp:ObjectDataSource>
         
         </td></tr>
    <tr><td></td><td  align=right>
        <asp:Button ID="Button1" runat="server" Text="Сохранить" OnClick="Button1_Click" />
        <a href="neworderpeople.aspx" runat="server"><div style="border:solid;width:50px">Дальше</div></a>
        </td>
    </tr>
    </table>
    </div>
    

</asp:Content>
