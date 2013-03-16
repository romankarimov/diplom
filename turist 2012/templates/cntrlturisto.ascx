<%@ Control Language="C#" ClassName="cntrl_turist" AutoEventWireup="true" CodeBehind="cntrlturisto.ascx.cs" Inherits="turist.WebUserControl1" %>

<script runat = "server">
    
    /*
    public turist.App_Code.tpeople Peoplet
    {
        set
        {<a href="../Old_App_Code/t_gost.cs">../Old_App_Code/t_gost.cs</a>
            SetPeople(value);
        }
    }
    void SetPeople(turist.App_Code.tpeople em1)
    {
        if (em1.Sex == "m")
        {
            Image1.ImageUrl = male;
        }
        else { Image1.ImageUrl = female; }
        TuristN.Text = em1.Fio;
            fio.Text = em1.Fio;
            fiol.Text = em1.FioLat;
            birthday.Text = em1.Birthday;
            phone.Text = em1.Phone;
            PhoneT.Text = em1.Phone;
            address.Text = em1.Address;
            numberpasp.Text = em1.Numberpasp;
            numberzpasp.Text=em1.Numberzpasp;
            seriapasp.Text=em1.Seriapasp ;
            seriazpasp.Text=em1.Seriazpasp ;
            wherendzpasp.Text=em1.Wherendzpasp  ;
            wherepasp.Text=em1.Wherepasp ;
            wherezpasp.Text=em1.Wherezpasp ;
            whopasp.Text=em1.Whopasp ;
            whozpasp.Text=em1.Whozpasp ;
            EmailP.Text = em1.Email;
        
    }  */
</script>


<tr style="width:100%">

<td align="left"  style="width:40%" >
   <asp:Label ID="TuristN" runat="server" ></asp:Label>
</td>
<td align="LEFT" style="width:30%">
    <asp:Label ID="directorl" runat="server"></asp:Label>
</td>
<td align="LEFT"  style="width:30%">
    <asp:Label ID="address" runat="server"></asp:Label>
</td>
<td align="left" style="width:auto" >
    <asp:ImageButton ID="Image2" OnClientClick="edit"  runat="server" />
</td>
<td align="left" style="width:auto" >
    <asp:ImageButton ID="Image3"   runat="server"  />
</td>

</tr>