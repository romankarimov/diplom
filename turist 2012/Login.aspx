<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="turist.Login" Title="Вход на сайт" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Вход на сайт</title>
    <link href="css/printable.css" rel="stylesheet" type="text/css" >
    <style type="text/css">
        .auto-style1 {
            width: 149px;
        }
    </style>
</head>
<body style="height:100%;width:100%; background-color:#EFF3FB">
    <script runat=server ></script>
    
    
    <form id="form1"  runat="server">
    <div style="height:10%;width:100%;text-align:center">
        <asp:DropDownList  ID="UserType" runat="server" Font-Names="Verdana"  Font-Size="0.8em" ForeColor="#333333" >
            <asp:ListItem Selected="True" Text="Вход для турагента" Value="member"></asp:ListItem>
            <asp:ListItem Text ="Вход для туроператора" Value="menedger"></asp:ListItem>
        </asp:DropDownList>
    </div>
    <div height=100% widht=100% align=center >
        <div >
             <asp:Login ID="Login1" runat="server" BackColor="#EFF3FB" BorderColor="#B5C7DE" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" style="margin-left: 0px"  Width="174px">
                 <InstructionTextStyle Font-Italic="True" ForeColor="Black" />

                 <LayoutTemplate>
                     <table cellpadding="4" cellspacing="0" style="border-collapse:collapse;">
                         <tr>
                             <td>
                                 <table cellpadding="0">
                                     <tr>
                                         <td align="center" colspan="2" style="color:White;background-color:#507CD1;font-size:0.9em;font-weight:bold;">Выполнить вход</td>
                                     </tr>
                                     <tr>
                                         <td align="right">
                                             <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Email:</asp:Label>
                                         </td>
                                         <td class="auto-style1">
                                             <asp:TextBox ID="UserName" runat="server" Font-Size="0.8em"></asp:TextBox>
                                             <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="Поле &quot;Email&quot; является обязательным." ToolTip="Поле &quot;Email&quot; является обязательным." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td align="right">
                                             <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Пароль:</asp:Label>
                                         </td>
                                         <td class="auto-style1">
                                             <asp:TextBox ID="Password" runat="server" Font-Size="0.8em" TextMode="Password"></asp:TextBox>
                                             <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Поле &quot;Пароль&quot; является обязательным." ToolTip="Поле &quot;Пароль&quot; является обязательным." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                         </td>
                                     </tr>
                                     
                                     <tr>
                                         <td align="center" colspan="2" style="color:Red;">
                                             <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td align="right" colspan="2">
                                             <asp:Button ID="LoginButton" runat="server" BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" CommandName="Login" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" Text="Выполнить вход" ValidationGroup="Login1" OnClick="LoginButton_Click" />
                                         </td>
                                     </tr>
                                 </table>
                             </td>
                         </tr>
                     </table>
                 </LayoutTemplate>
                 <LoginButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" />
                 <TextBoxStyle Font-Size="0.8em" />
                 <TitleTextStyle BackColor="#507CD1" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
             </asp:Login>
        </div>
    </div>
    </form>
</body>
</html>
