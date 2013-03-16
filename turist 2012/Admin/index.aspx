<%@ Page Title="Панель администрирования Турист" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="turist.Admin.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width:500px;height:100%">
    <table  style="width:100%" >
       
        <tr  valign = "top" style="vertical-align:top">
            
            <td align = "center" valign ="top"  >
                <a href="members.aspx"><img style="height:100px;width:100px" class="mainmenu" src="../images/admin/icon-groups-friends.png" title="Сотрудники" alt="Список сотрудников" /><br/>Сотрудники</a>
            </td>
            <td align = "center" valign ="top"  >
                <a href="addsotr.aspx"><img style="height:100px;width:100px" class="mainmenu" src="../images/admin/icon-addfriend.png" title="Добавить сотрудника" alt="Новый сотрудник" /><br/>Новый сотрудник</a>
            </td>
            <td align = "center" valign ="top"  >
                <a href="new.aspx"><img style="height:100px;width:100px" class="mainmenu" src="../images/admin/icon-chat.png" title="Добавить новость" alt="Добавление новости" /><br/>Добавить новость</a>
            </td>
        </tr>
        <tr valign = "top" style="vertical-align:top">
            <td align = "center" valign ="top"  >
                <a href="addmenedger.aspx"><img style="height:100px;width:100px" class="mainmenu" src="../images/admin/icon-businesscardalt.png" title="Добавить менеджера" alt="Добавление менеджера туроператора" /><br/>Новый менеджер</a>
            </td>
            <td style="visibility:hidden" align = "center" valign ="top"  >
                <a href="index.aspx" ><img style="height:100px;width:100px" class="mainmenu" src="../images/admin/icon-calendaralt-cronjobs.png" title="" alt="Новый сотрудник" /><br/>??</a>
            </td>
            <td style="visibility:hidden" align = "center" valign ="top"  >
                <a href="new.aspx"><img style="height:100px;width:100px" class="mainmenu" src="../images/admin/icon-chat.png" title="Добавить новость" alt="Добавление новости" /><br/>Добавить новость</a>
            </td>
        </tr>
        
    </table>
    </div>
    <div style="width:250px;height:100%"></div>
</asp:Content>
