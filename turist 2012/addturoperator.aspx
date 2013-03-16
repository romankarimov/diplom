<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="addturoperator.aspx.cs" Inherits="turist.addturoperator" Title="Новый туристический оператор" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script runat="server">
private turist.App_Code.t_bazaDB  db = new turist.App_Code.t_bazaDB();


void Save(Object sender, EventArgs e)
{
    turist.App_Code.turoperator  to = new turist.App_Code.turoperator();
    turist.App_Code.fototuroperator fto = new turist.App_Code.fototuroperator();
    to.Name = orgname.Text;
    to.Address1 = address1.Text;
    to.Address2 = address2.Text;
    to.Bank = bank.Text;
    to.Bikbank = bikbank.Text;
    to.Contactname = contactname.Text;
    to.Contactphone = contactphone.Text;
    to.Contactposition = contactposition.Text;
    to.Director = director.Text;
    to.Inn = inn.Text;
    to.Kpp = kpp.Text;
    to.Ogrn = ogrn.Text;
    to.Okpo = okpo.Text;
    to.Orgemail = orgemail.Text;
    to.Orgface = orgface.Text;
    to.Orgphone = orgphone.Text;
    to.Orgschet = korschet.Text;
    to.Position = position.Text;
    to.Rschet = rschet.Text;
    
    int f1 = 0;
    //int f2 = 0;
    int r = db.AddTurOperator(to);
    if (r != 0)
    {
        if (foto1.FileName.Length >= 3)
        {
            fto.Path = "../images/turoperator/" + Convert.ToString(foto1.FileName);
            fto.Comment = aboutfoto1.Text;
            f1 = db.AddFotoTurWay(fto.Path, fto.Comment, r);
        }
        
        if (f1 != 0)
        {
            HtmlGenericControl message = new HtmlGenericControl();
            message.InnerHtml = "<h5 style='color: Red'>Туроператор #" + Convert.ToString(r) + " успешно записан!</h5>";
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
    
        <tr align=center>
        <td>
            <tr align="center">
            <td colspan="2" id="name">
                Добавление нового туристического оператора
            </td></tr><tr align="left">
            <td Width="120px">
            Название организации:</td><td width="120"><asp:TextBox ID="orgname" Width="120px" runat="server"></asp:TextBox></td></tr><tr align="left"><td Width="120px">
            Руководитель:</td><td width="120"><asp:TextBox ID="director" Width="120px" runat="server"></asp:TextBox></td></tr><tr align="left"><td Width="120px">
            Должность:</td><td width="120"><asp:TextBox ID="position" Text="директор" Width="120px" runat="server"></asp:TextBox></td></tr><tr align="left"><td Width="120px">
            Организация в лице:</td><td width="120"><asp:TextBox ID="orgface" Text="директора __________, действующего на основании Устава" Width="120px" runat="server"></asp:TextBox></td></tr><tr align="Center"><td Width="120px" colspan=2>
            Контактная информация</td></tr><tr align="left"><td Width="120px">
            Юридический адрес:</td><td width="120"><asp:TextBox ID="address2" Width="120px" TextMode="MultiLine" runat="server"></asp:TextBox></td></tr><tr align="left"><td Width="120px">
            Почтовый адрес:</td><td width="120"><asp:TextBox ID="address1" Width="120px" TextMode="MultiLine" MaxLength="1"  runat="server"></asp:TextBox></td></tr><tr align="left"><td Width="120px">
            Электронная почта:</td><td width="120"><asp:TextBox ID="orgemail" Width="120px" MaxLength="45" runat="server"></asp:TextBox></td></tr><tr align="left"><td Width="120px">
            Телефон:</td><td width="120"><asp:TextBox ID="orgphone" Width="120px" MaxLength="13" runat="server"></asp:TextBox></td></tr><tr align="center"><td Width="120px" colspan=2>
            Контактное лицо</td></tr><tr align="left"><td Width="120px">
            ФИО:</td><td width="120"><asp:TextBox ID="contactname" Width="120px" MaxLength="150" runat="server"></asp:TextBox></td></tr><tr align="left"><td Width="120px">
            Должность:</td><td width="120"><asp:TextBox ID="contactposition" Width="120px"  runat="server"></asp:TextBox></td></tr><tr align="left"><td Width="120px">
            Телефон:</td><td width="120"><asp:TextBox ID="contactphone" Width="120px" runat="server"></asp:TextBox></td></tr><tr align="center"><td Width="120px" colspan=2>
            Банковские реквизиты</td></tr><tr align="left"><td Width="120px">
            БИК:</td><td width="120"><asp:TextBox ID="bikbank" Width="120px" runat="server"></asp:TextBox></td></tr><tr align="left"><td Width="120px">
            Банк:</td><td width="120"><asp:TextBox ID="bank" Width="120px" runat="server"></asp:TextBox></td></tr><tr align="left"><td Width="120px">
            Р/с:</td><td width="120"><asp:TextBox ID="rschet" Width="120px" runat="server"></asp:TextBox></td></tr><tr align="left"><td Width="120px">
            Кор. счет:</td><td width="120"><asp:TextBox ID="korschet" Width="120px" runat="server"></asp:TextBox></td></tr><tr align="center"><td Width="120px" colspan=2>
            Коды</td></tr><tr align="left"><td Width="120px">
            ИНН:</td><td width="120"><asp:TextBox ID="inn" Width="120px" runat="server"></asp:TextBox></td></tr><tr align="left"><td Width="120px">
            КПП:</td><td width="120"><asp:TextBox ID="kpp" Width="120px" runat="server"></asp:TextBox></td></tr><tr align="left"><td Width="120px">
            ОГРН:</td><td width="120"><asp:TextBox ID="ogrn" Width="120px" runat="server"></asp:TextBox></td></tr><tr align="left"><td Width="120px">
            ОКПО:</td><td width="120"><asp:TextBox ID="okpo" Width="120px" runat="server"></asp:TextBox></td></tr></td></tr>
    <tr>
        <td colspan="2" id="images">
            Изображение</td>
    </tr>
    <tr>
        <td>
             
            <asp:FileUpload ID="foto1" runat="server" />
             
        </td>
        <td>
            <asp:TextBox ID="aboutfoto1" runat="server" TextMode="MultiLine"></asp:TextBox>
        </td>
    </tr>
        
    <tr><td colspan=2 id="mas" runat="server"></td> </tr>
    </table>
    
    <div style="text-align:right">
        <asp:Button ID="Сохранить" OnClick="Save" runat="server" Text="Сохранить" /></div>
    
</div>
    
</asp:Content>
