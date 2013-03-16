<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="addturs.aspx.cs" Inherits="turist.WebForm7" Title="Новое туристическое направление" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script runat="server">
private turist.App_Code.t_bazaDB  db = new turist.App_Code.t_bazaDB();


void Save(Object sender, EventArgs e)
{
    turist.App_Code.turway  tw = new turist.App_Code.turway();
    turist.App_Code.fototurway ftw = new turist.App_Code.fototurway();
    
    tw.Name = name.Text ;
    tw.Agent = Convert.ToInt32(agent.Text);
    tw.Comment = comment.Text;
    tw.Country = country.Text;
    tw.Idtype = Convert.ToInt32(ListTurType.SelectedValue);
    tw.Idturoperator = Convert.ToInt32(ListTurOperator.SelectedValue);
    int f1 = 0;
    int f2 = 0;
    int r = db.AddTurWay(tw);
    if (r != 0)
    {
        if (foto1.FileName.Length >= 3)
        {
            ftw.Path = "../images/turway/" + Convert.ToString(foto1.FileName);
            ftw.Comment = aboutfoto1.Text;
            f1 = db.AddFotoTurWay(ftw.Path, ftw.Comment, r);
        }
        if (foto2.FileName.Length >= 3)
        {
            ftw.Path = "../images/turway/" + Convert.ToString(foto2.FileName);
            ftw.Comment = aboutfoto2.Text;
            f2 = db.AddFotoTurWay(ftw.Path, ftw.Comment, r);
        }
        if ((f1 != 0) && (f2 != 0))
        {
            HtmlGenericControl message = new HtmlGenericControl();
            message.InnerHtml = "<h5 style='color: Red'>Турбаза #" + Convert.ToString(r) + " успешно записана!</h5>";
            mas.Controls.Add(message);
        }
        else
        {
            HtmlGenericControl message = new HtmlGenericControl();
            message.InnerHtml = "ошибка записи изображений";
            mas.Controls.Add(message);
        }
    }
    else
        {
        HtmlGenericControl message = new HtmlGenericControl();
        message.InnerHtml = "ошибка при передаче значений";
        mas.Controls.Add(message);
    }
        
}
</script>
    
    
<div id="Div1" width="100%" heigth="100%" runat="server">
    <table width="100%">
    <tr align="left" >Добавление нового туристического направления
        <td>
        <tr align=left>
        <td>Название</td><td>
            <asp:TextBox ID="name" runat="server"></asp:TextBox></td>  
        </tr>
        <tr align=left>
        <td>Туристический оператор</td><td>
            <asp:DropDownList ID="ListTurOperator" runat="server" DataSourceID="ListTurOperator" DataTextField="Name" DataValueField="TuroperatorID"></asp:DropDownList>
            <asp:ObjectDataSource ID="ListTurOperatorSource" runat="server" SelectMethod="GetAllTurOperator" TypeName="turist.App_Code.t_bazaDB"></asp:ObjectDataSource>
        </tr>
        <tr align=left>
        <td>Тип турнаправления<td>
            <asp:DropDownList ID="ListTurType" runat="server" DataSourceID="ListTurType" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
            <asp:ObjectDataSource ID="ListTurTypeSource" runat="server" SelectMethod="GetAllTurTypes" TypeName="turist.App_Code.t_bazaDB"></asp:ObjectDataSource>
        </tr>
        <tr align=left>
        <td>Агентское вознаграждение</td><td>
            <asp:TextBox ID="agent" runat="server" />
            </td>  
        </tr>
        <tr align=left>
        <td>Описание</td><td>
            <asp:TextBox ID="comment" runat="server" TextMode="MultiLine" />
            </td>  
        </tr>
        <tr align=left>
        <td>Страна</td><td>
            <asp:TextBox ID="country" runat="server" />
            </td>  
        </tr>
              
        </td>
    </tr>
    <tr>
        <td colspan="2" id="images">
            Изображения</td>
    </tr>
    <tr>
        <td>
             
            <asp:FileUpload ID="foto1" runat="server" />
             
        </td>
        <td>
            <asp:TextBox ID="aboutfoto1" runat="server" TextMode="MultiLine"></asp:TextBox>
        </td>
    </tr>
         <tr>
        <td>
             
            <asp:FileUpload ID="foto2" runat="server" />
             
        </td>
        <td>
            <asp:TextBox ID="aboutfoto2" runat="server" TextMode="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr><td colspan=2 id="mas" runat="server"></td> </tr>
    </table>
    
    <div style="text-align:right">
        <asp:Button ID="Сохранить" OnClick="Save" runat="server" Text="Сохранить" /></div>
    
</div>
    
</asp:Content>
