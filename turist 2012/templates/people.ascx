<%@ Control Language="C#" ClassName="cntrl_turist" AutoEventWireup="true" CodeBehind="people.ascx.cs" Inherits="turist.WebUserControl3" %>

<tr><td width="200" >
    <asp:Label ID="Text_F" runat="server" Text=""></asp:Label></td><td width="100%" align="left">
        <asp:DropDownList ID="Service" Width="100%" runat="server" DataSourceID="DataSource" DataTextField="Fio" DataValueField="PeopleID">
        </asp:DropDownList>
    </td></tr>