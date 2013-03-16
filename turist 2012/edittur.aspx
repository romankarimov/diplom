<%@ Page Title="Изменение агентского вознаграждения" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="edittur.aspx.cs" Inherits="turist.WebForm16" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <script runat ="server">
   
    void Page_Load(Object sender, EventArgs e)
    {
            

    }
   
</script>  
    
<table width="100%" style="border-bottom: solid 4px #664302 ">
    <tr> 
        <td colspan="2">
            <a href="addturs.aspx">
        <div style="height:50px;width:100%">
   <table style="width:100%;height:20px; text-align:right"><tbody><tr><td><div style="width:80%;height:20px"></div></td><td style="text-align:center">
        <div style="width:150px;height:20px;border:ridge;box-shadow:rgba(0,0,0,0.4) 10px 10px inherit  ">Новое турнаправление</div> </td>
   </tr>
       <tr style="height:30px"><td colspan="2"></td></tr>
        </tbody>
       </table>
</div>
        </a>
    
        </td>
        </tr>
    </table>

    <table style="width:60%">
        <tr>
            <td colspan ="2" style="text-align:center">
                <asp:DropDownList ID="Tur_l" runat="server" Width="200px" DataSourceID="ObjectDataSource1" DataTextField="Name" DataValueField="T_bazaID" OnSelectedIndexChanged="Tur_l_SelectedIndexChanged" AutoPostBack="True" ></asp:DropDownList>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetAllTurs" TypeName="turist.App_Code.t_bazaDB"></asp:ObjectDataSource>
            </td>
        </tr><!--
        <tr>
            <td  style="text-align:center">
                Название
            </td>
            <td  style="text-align:center">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td  style="text-align:center">
                Адресс
            </td>
            
            <td  style="text-align:center">
              <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
              
            </td>
            </tr>
            <tr>
            <td  style="text-align:center">
                Как проехать
            </td>

            <td  style="text-align:center">
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
           
        </tr>
             <tr>
            <td  style="text-align:center">
                Телефон
            </td>
            <td  style="text-align:center">
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </td>

        </tr>
             <tr>
            <td  style="text-align:center">
                Сайт
            </td>
            <td  style="text-align:center">
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            </td>

        </tr>
             <tr>
            <td  style="text-align:center">
                Электронная почта
            </td>
            <td  style="text-align:center">
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            </td>

        </tr>-->
             <tr>
            <td  style="text-align:center">
                Агентское вознаграждение
            </td>
            <td  style="text-align:center">
                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
            </td>

        </tr>
        <tr>
            <td  style="text-align:right" colspan="2">
                
        <asp:Button ID="Button1" runat="server" Text="Cохранить" OnClick="Button1_Click" />
            <!--<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" EnableModelValidation="True">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Название" SortExpression="Name" />
                    <asp:BoundField DataField="Way" HeaderText="Как проехать" SortExpression="Way" />
                    <asp:BoundField DataField="About" HeaderText="Тип турнаправления" SortExpression="About" />
                    <asp:BoundField DataField="Address" HeaderText="Адрес" SortExpression="Address" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Phone" HeaderText="Телефон" SortExpression="Phone" />
                    <asp:BoundField DataField="Siteurl" HeaderText="Сайт" SortExpression="Siteurl" />
                    <asp:BoundField DataField="Agent" HeaderText="Агентское вознаграждение" SortExpression="Agent" />
                </Columns>
                </asp:GridView>-->
            </td>

        </tr>
        
    </table>
        
        
    
</asp:Content>