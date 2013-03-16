<%@ Control Language="C#" ClassName="cntrl_turist" AutoEventWireup="true" CodeBehind="msg.ascx.cs" Inherits="turist.WebUserControl3" %>

<tr>
<td>
    <asp:Image ID="TypeOfMsg" runat="server"></asp:Image>
</td>
<td>
    <a onmouseover="document.getElementById('PopUp').style.display = 'none' " onmouseout="document.getElementById('PopUp').style.display = 'none' " onfocus='this.blur();'>
    <p ID="textfio" runat="server" onclick=""><asp:Label ID="Fio" runat=server></asp:Label></p>
    </a>
    <div id='PopUp' style='display: none; position: relative; border: solid black 1px; padding: 10px; background-color: rgb(255,255,225); text-align: justify; font-size: 12px; width: 135px;'>
        <!-- Содержимое всплываюшего окна. Заменить none на block -->
    </div>
</td>
</tr>