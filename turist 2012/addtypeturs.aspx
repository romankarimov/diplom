<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="addtypeturs.aspx.cs" Inherits="turist.addtypeturs" Title="Новый тип турнаправления" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script runat="server">
private turist.App_Code.t_bazaDB  db = new turist.App_Code.t_bazaDB();
 private turist.App_Code.t_baza tb = new turist.App_Code.t_baza();

 void Save(Object sender, EventArgs e)
 {

     Boolean fileOK = false;
     String path = Server.MapPath("~/images/typetur/");
     if (Uploadturtypefoto.HasFile)
     {
         String fileExtension =
             System.IO.Path.GetExtension(Uploadturtypefoto.FileName).ToLower();
         String[] allowedExtensions = { ".gif", ".png", ".jpeg", ".jpg", ".bmp" };
         for (int i = 0; i < allowedExtensions.Length; i++)
         {
             if (fileExtension == allowedExtensions[i])
             {
                 fileOK = true;
             }
         }
     }
     string file;
     if (fileOK)
     {
         try
         {
             Uploadturtypefoto.PostedFile.SaveAs(path
                 + Uploadturtypefoto.FileName);
             file = "Файл добавлен";
         }
         catch (Exception ex)
         {
             file = "Файл не добавлен"+ex.Message;
         }
     }
     else
     {
         file = "Файл не поддерживается";
     }

     turist.App_Code.turtype type = new turist.App_Code.turtype();

     type.Name = name.Text;
     type.Comment = about.Text;
     type.Pathfoto = "../images/typetur/" + Convert.ToString(Uploadturtypefoto.FileName);
     int r = db.AddTurType(type);
     if (r != 0)
     {
         HtmlGenericControl message = new HtmlGenericControl();
         message.InnerHtml = "<h5 style='color: Red'>Турбаза #" + Convert.ToString(r) + " успешно записана!</h5>"+file;
         mas.Controls.Add(message);
     }
     else
     {
         HtmlGenericControl message = new HtmlGenericControl();
         message.InnerHtml = "ошибка при передаче значений." + file;
         mas.Controls.Add(message);
     }

 }
</script>
    
    
<div id="Div1" width="100%" heigth="100%" runat="server">
    <table width="100%">
    <tr id="listtypes">
        <td style="text-align:left" colspan="2">
            <!-- Список всех типов -->
            <asp:BulletedList ID="BulletedList1" runat="server" DataSourceID="ListTypeTur" DataTextField="Name" DataValueField="ID" >
            </asp:BulletedList>

            <asp:ObjectDataSource ID="ListTypeTur" runat="server" SelectMethod="GetAllTurTypes" TypeName="turist.App_Code.t_bazaDB"></asp:ObjectDataSource>

        </td>
    </tr>
    <tr align="left" >Добавление новой туристической базы
        <td>
        <tr align=left>
        <td>Название</td><td><asp:TextBox ID="name" runat="server"></asp:TextBox></td>  
        </tr>
        
        <tr align=left>
        <td>Описание</td><td>
            <asp:TextBox ID="about" runat="server"></asp:TextBox></td>  
        </tr>
         <tr align=left>
        <td>Изображение</td><td>
            <asp:FileUpload ID="Uploadturtypefoto" runat="server" ToolTip="Выберите изображение" />
            </td>  
        </tr>
        
       
        </td>
    </tr>
    <tr><td colspan=2 id="mas" runat="server"></td> </tr>
    </table>
    
    <div style="text-align:right">
        <asp:Button ID="Сохранить" OnClick="Save" runat="server" Text="Сохранить" /></div>
    
</div>
    
</asp:Content>
