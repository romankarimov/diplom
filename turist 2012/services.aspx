<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="services.aspx.cs" Inherits="turist.WebForm8" Title="Услуги" %>
<%@ Reference Control ="~/templates/service.ascx" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script runat ="server">
    private turist.App_Code.serviceDB  sdb = new turist.App_Code.serviceDB();
    private bool f = false; 
    void Page_Load(Object sender, EventArgs e)
    {
        if (!f)
        {

            System.Collections.Generic.List<turist.App_Code.cervice > services = sdb.GetAllServices ();
            foreach (turist.App_Code.cervice  s in services )
            {
                turist.WebUserControl1 cntrl = (turist.WebUserControl1)LoadControl("templates/service.ascx");
                cntrl.SName  = s.Name ;
                cntrl.SCost = Convert.ToString(s.Cost);
                cntrl.SAbout = s.Comment;
                Place1.Controls.Add(cntrl);
            }

            f = true;
        }

    }
   
</script>
<table width="100%" style="border-bottom: solid 4px #664302 ">
       <tr style="height:14px; vertical-align:top " >
       <td align="left" >Название</td><td align="center"  >Цена</td><td align="right"  >Описание</td>
       </tr>
       </table>
       <table width="100%">
       <asp:PlaceHolder ID="Place1" runat="server">
       
       </asp:PlaceHolder></table>
</asp:Content>
