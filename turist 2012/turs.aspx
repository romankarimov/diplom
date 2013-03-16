<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="turs.aspx.cs" Inherits="turist.WebForm6" Title="Туры" %>
<%@ Reference Control="~/templates/cntrltur.ascx" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <script runat ="server">
    private turist.App_Code.t_bazaDB  tbdb = new turist.App_Code.t_bazaDB();
    private bool f = false; 
    void Page_Load(Object sender, EventArgs e)
    {
        if (!f)
        {

            System.Collections.Generic.List<turist.App_Code.t_baza > bazes = tbdb.GetAllTurs ();
            foreach (turist.App_Code.t_baza  b in bazes )
            {
                turist.templates.cntrltur cntrl = (turist.templates.cntrltur)LoadControl("templates/cntrltur.ascx");
                cntrl.SName  = b.Name ;
                //cntrl.SWay = b.Way;
                //cntrl.SAddress = b.Address;
                cntrl.SEmail = b.Email;
                cntrl.SPhone = b.Phone;
                //cntrl.SSiteurl = b.Siteurl;
                //cntrl.SAbout = b.About;
                Place1.Controls.Add(cntrl);
            }

            f = true;
        }

    }
   
</script>  
    
<table width="100%" style="border-bottom: solid 4px #664302 ">
    <tr> 
        <td>
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
        <td><a href="edittur.aspx">
        <div style="height:50px;width:100%">
   <table style="width:100%;height:20px; text-align:right"><tbody><tr><td><div style="width:80%;height:20px"></div></td><td style="text-align:center">
        <div style="width:150px;height:20px;border:ridge;box-shadow:rgba(0,0,0,0.4) 10px 10px inherit  ">Изменить данные</div> </td>
   </tr>
       <tr style="height:30px"><td colspan="2"></td></tr>
        </tbody>
       </table>
</div>
        </a>

        </td>
    </tr>
       <tr style="height:14px; vertical-align:top " >
       <td align="left" >Название</td><td align="center"  >Email</td><td align="right"  >Phone</td>
       </tr>
       </table>
       <table width="100%">
       <asp:PlaceHolder ID="Place1" runat="server">
       
       </asp:PlaceHolder></table>
    
</asp:Content>
