<%@ Control Language="C#" ClassName="cntrl_turist" AutoEventWireup="true" CodeBehind="service.ascx.cs" Inherits="turist.WebUserControl1" %>

<script runat = "server">
</script>


<td align="left" style="width:33%">
<a href="#"  title="Всплывающее окно"><!--onclick="document.getElementById('wind').style.display='block'; return false;" -->
    <asp:Label ID="ServiceName1" runat="server" ></asp:Label>
</a>
<div id="wind" class="wind">
<table id="Table1" width ="100%" >
        <tr align=center>
        <td>
        <tr align="left"><td Width="120px">
            Базы:</td><td  width="120"><asp:Label ID="fio" Width="120px" runat="server"></asp:Label></td>
        </tr>
        </td>
        </tr>        
        </table>
        <button type="button" value="закрыть" onclick="document.getElementById('wind').style.display='none'; return false;">
        закрыть</button>
</div>
</td>
<td align="center" style="width:33%">
    <asp:Label ID="ServiceCost1" runat="server"></asp:Label>
</td>
<td align="right" style="width:33%">
    <asp:Label ID="ServiceAbout1" runat="server"></asp:Label>
</td>
</tr>