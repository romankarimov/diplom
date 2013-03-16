<%@ Page Language="C#" ClassName="cntrl_turist" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="turists.aspx.cs" Inherits="turist.WebForm2" Title="Туристы" %>
<%@ Reference Control ="~/templates/cntrlturistp.ascx" %>
<%@ Reference Control ="~/templates/cntrlturisto.ascx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  
   <script runat=server>
       private turist.App_Code.PeopleDB pdb = new turist.App_Code.PeopleDB();
       private turist.App_Code.OrganizationDB  odb = new turist.App_Code.OrganizationDB();
       
      
       private bool f = false;
       private bool u = false;
      
         
       
       void Page_Load(Object sender, EventArgs e)
       {
           
           if (!f)
           {
                
               System.Collections.Generic.List<turist.App_Code.tpeople> peoplel = pdb.GetAllPeoples();
               foreach (turist.App_Code.tpeople p in peoplel)
               {
                   turist.WebUserControl2 cntrl = (turist.WebUserControl2)LoadControl("templates/cntrlturistp.ascx");
                   cntrl.Fio  = p.Fio;
                   cntrl.Phone = p.Phone;
                   cntrl.Email = p.Email;
                   cntrl.Sex = p.Sex;
                   cntrl.IDImage = Convert.ToString(p.PeopleID);
                   
                   
                   Place1.Controls.Add(cntrl);
               }
               
              // Form1.Controls.Add(message);
               f = true;
           }
           PeopleView.SetActiveView(Form1);
           
           }
       void View1(Object sender, EventArgs e)
       {
           if (!f)
           {
               //message.InnerHtml = "";
               System.Collections.Generic.List<turist.App_Code.tpeople> peoplel = pdb.GetAllPeoples();
               foreach (turist.App_Code.tpeople p in peoplel)
               {
                   turist.WebUserControl2 cntrl = (turist.WebUserControl2)LoadControl("templates/cntrlturistp.ascx");
                   cntrl.Fio = p.Fio;
                   cntrl.Phone = p.Phone;
                   cntrl.Email = p.Email;
                   cntrl.Sex = p.Sex;
                  
                   //message.InnerHtml = message.InnerHtml + begin + p.Fio + "     " + p.Email + "     " + p.Phone + divb + dive + end + "<br/>";
                   Place1.Controls.Add(cntrl);
                   //message.InnerHtml = message.InnerHtml + begin + p.Fio + "     " + p.Email + "     " + p.Phone + divb + dive + end + "<br/>";

               }
               f = true;
           }
           PeopleView.SetActiveView(Form1 );
       }
       void View2(Object sender, EventArgs e)
       {
           if (!u)
           {

               //message.InnerHtml = "";
               System.Collections.Generic.List<turist.App_Code.torganization> orgl = odb.GetAllOrganizations();
               foreach (turist.App_Code.torganization o in orgl)
               {
                   turist.WebUserControl1 cntrl = (turist.WebUserControl1)LoadControl("templates/cntrlturisto.ascx");
                   cntrl.Director  = o.Director ;
                   cntrl.Name  = o.Name;
                   cntrl.Address = o.Address1 ;
                   //cntrl.Sex = p.Sex;

                   //message.InnerHtml = message.InnerHtml + begin + p.Fio + "     " + p.Email + "     " + p.Phone + divb + dive + end + "<br/>";
                   Place2.Controls.Add(cntrl);
                   //message.InnerHtml = message.InnerHtml + begin + o.Name + "     " + o.Contactname + "     " + o.Contactphone + "     " + o.Orgemail + divb + dive + end + "<br/>";

               }
               u = true;
           }
           PeopleView.SetActiveView(Form2);   
       }
            
   </script>

    <a href="addturists.aspx">
        <div style="height:50px;width:100%">
   <table style="width:100%;height:20px; text-align:right"><tbody><tr><td><div style="width:80%;height:20px"></div></td><td style="text-align:center">
        <div style="width:100px;height:20px;border:ridge;box-shadow:rgba(0,0,0,0.4) 10px 10px inherit  "> Новый турист</div> </td>
   </tr>
       <tr style="height:30px"><td colspan="2"></td></tr>
        </tbody>
       </table>
</div>
        </a>
    
    <asp:Panel ID="Panel1" runat="server">
     <asp:Button OnClick="View1"  ID="bp" Text="Физические лица" runat="server" />
        &nbsp;&nbsp;
    <asp:Button ID="bo" OnClick="View2" Text="Юридические лица" runat="server" />
    </asp:Panel>
   
        <div runat="server" style="width:100%; height:100%" >
       <asp:MultiView ID="PeopleView" ActiveViewIndex=0   runat="server">
       <asp:View ID="Form1"  runat=server>
       <table width="100%" style="border-bottom: solid 4px #664302 ">
       <tr style="height:14px; vertical-align:top " >
       <td align="left" style="width:40%" >ФИО</td><td align="LEFT" style="width:30%" >Телефон</td><td align="left" style="width:30%" >Email</td>
       </tr>
       </table>
       <table>
       <asp:PlaceHolder ID="Place1" runat="server">
       
       </asp:PlaceHolder></table>
       </asp:View>
       <asp:View ID="Form2" runat=server>
       <table  style="border-bottom: solid 4px #664302;width:100% " >
       <tr style="height:14px; vertical-align:top  " >
       <td align="left" style="width:40%" >Название</td><td align="LEFT" style="width:30%" >Руководитель</td><td align="left" style="width:30%" >Адрес</td>
       </tr>
          
       </table>
        <table width="100%">
             <asp:PlaceHolder ID="Place2" runat="server">
       
       </asp:PlaceHolder>
      </table>
       </asp:View>
       </asp:MultiView>
       </div>    
    
    
</asp:Content>