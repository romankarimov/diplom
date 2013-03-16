<%@ Control Language="C#" ClassName="cntrl_turist" AutoEventWireup="true" CodeBehind="cntrlturistp.ascx.cs" Inherits="turist.WebUserControl2" %>

<script runat = "server">

    turist.WebUserControl2 wuc2 = new turist.WebUserControl2();
     void save(Object sender, EventArgs e)
    {
        turist.App_Code.tpeople p = new turist.App_Code.tpeople();
        turist.App_Code.PeopleDB pp = new turist.App_Code.PeopleDB();
        
   }
</script>


<tr>.
<td align="left" style="width:auto" >
    <asp:Image ID="Image1"  runat="server" />
</td>
<td align="left" style="width:1px;display:none">
    <asp:Label ID="ID" runat="server" ></asp:Label>
</td>
<td align="left" style="width:40%">
<asp:Label ID="TuristN" runat="server" ></asp:Label>

</td>
<td align="LEFT" style="width:30%">
    <asp:Label ID="PhoneT" runat="server"></asp:Label>
</td>
<td align="left" style="width:30%">
    <asp:Label ID="EmailP" runat="server"></asp:Label>
</td>
<td align="left" style="width:auto" >
    <asp:ImageButton ID="Image2" OnClientClick="edit"  runat="server" />
</td>
<td align="left" style="width:auto" >
    <asp:ImageButton ID="Image3"   runat="server"  />
</td>
</tr>