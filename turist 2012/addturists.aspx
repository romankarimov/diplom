<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="addturists.aspx.cs" Inherits="turist.WebForm5" Title="Новый турист" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    
    <script runat="server">
        private turist.App_Code.PeopleDB pdb = new turist.App_Code.PeopleDB();
        private turist.App_Code.OrganizationDB odb = new turist.App_Code.OrganizationDB();
        private int r = 0;
  
      void Page_Load(Object sender, EventArgs e)
      {
      }
     void Check_Clicked1(Object sender, EventArgs e)
     {
         MultiView1.SetActiveView(fiz);
         
       }
     void Check_Clicked2(Object sender, EventArgs e)
     {
        
         MultiView1.SetActiveView(urik);
         
     }
     
     void SaveNewTurist(Object sender, EventArgs e)
     {
         if (MultiView1.GetActiveView() == fiz  )
         {
             turist.App_Code.tpeople ppl = new turist.App_Code.tpeople();
             ppl.PeopleID = 1;
             ppl.Fio = fio.Text;
             ppl.FioLat = fiol.Text;
             ppl.Birthday = birthday.Text;
             ppl.Address = address.Text;
             ppl.Email = email.Text;
             ppl.Numberpasp = numberpasp.Text;
             ppl.Numberzpasp = numberzpasp.Text;
             ppl.Phone = phone.Text;
             ppl.Seriapasp = seriapasp.Text;
             ppl.Seriazpasp = seriazpasp.Text;
             ppl.Sex = sex.SelectedValue;
             ppl.Wherendzpasp = wherendzpasp.Text;
             ppl.Wherepasp = wherepasp.Text;
             ppl.Wherezpasp = wherezpasp.Text;
             ppl.Whopasp = whopasp.Text;
             ppl.Whozpasp = whozpasp.Text;
             r= pdb.Insertpeople(ppl);
             if (r != 0)
             {
                 HtmlGenericControl message = new HtmlGenericControl();
                 message.InnerHtml = "<h5 style='color: Red'>Физ.лицо #" + Convert.ToString(r) + " успешно записано!</h5>";
                 mas.Controls.Add(message);
             }
             else
             {
                 HtmlGenericControl message = new HtmlGenericControl();
                 message.InnerHtml = "<h5 style='color: Red'>Ошибка тут! Фл</h5>";
                 mas.Controls.Add(message);
             } 
         }
         if (MultiView1.GetActiveView() == urik) 
         {
             turist.App_Code.torganization org = new turist.App_Code.torganization();
             org.OrganizationID = 1;
             org.Name = orgname.Text;
             org.Address1 = address1.Text;
             org.Address2 = address2.Text;
             org.Bank = bank.Text;
             org.Bikbank = bikbank.Text;
             org.Contactname = contactname.Text;
             org.Contactphone = contactphone.Text;
             org.Contactposition = contactposition.Text;
             org.Director = director.Text;
             org.Inn = inn.Text;
             org.Kpp = kpp.Text;
             org.Ogrn = ogrn.Text;
             org.Okpo = okpo.Text;
             org.Orgemail = orgemail.Text;
             org.Orgface = orgface.Text;
             org.Orgphone = orgphone.Text;
             org.Orgschet = korschet.Text;
             org.Position = position.Text;
             org.Rschet = rschet.Text;
             r = odb.InsertOrganization(org);
             if (r != 0)
             {
                 HtmlGenericControl message = new HtmlGenericControl();
                 message.InnerHtml = "<h5 style='color: Red'>Орг.лицо #" + Convert.ToString(r) + " успешно записано!</h5>";
                 mas.Controls.Add(message);
             }
             else
             {
                 HtmlGenericControl message = new HtmlGenericControl();
                 message.InnerHtml = "<h5 style='color: Red'>Ошибка тут! Юл</h5>";
                 mas.Controls.Add(message);
             } 
         }
      }
   </script>
    <script type="text/javascript">
        function toTranslit(text) {
            return text.replace(/([а-яё])|([\s_-])|([^a-z\d])/gi,
            function (all, ch, space, words, i) {
                if (space || words) {
                    return space ? '-' : '';
                }
                var code = ch.charCodeAt(0),
                    index = code == 1025 || code == 1105 ? 0 :
                        code > 1071 ? code - 1071 : code - 1039,
                    t = ['yo', 'a', 'b', 'v', 'g', 'd', 'e', 'zh',
                        'z', 'i', 'y', 'k', 'l', 'm', 'n', 'o', 'p',
                        'r', 's', 't', 'u', 'f', 'h', 'c', 'ch', 'sh',
                        'shch', '', 'y', '', 'e', 'yu', 'ya'
                    ];
                return t[index];
            });
        }
        function SetTranslit(val) {
            document.getElementById('<%= fiol.ClientID %>').value = toTranslit(val);
}
</script>
    <div>
    <table>
    <tr>
    <td width="50px">
        
        </td>
    <td width="100%">
    <div id="mas" runat="server"></div>
    <asp:MultiView ID="MultiView1" ActiveViewIndex="0" runat="server">
        <asp:View id="fiz" runat=server >
        <asp:Panel ID="Panel1" runat="server">
            <asp:Button ID="Button4" OnClick="Check_Clicked1" runat="server" Text="Физические лица" />
            <asp:Button ID="Button5" OnClick="Check_Clicked2" runat="server" Text="Юридические лица" />
            </asp:Panel>
        <asp:Panel ID="Panel2" Width="100%" runat="server"  >
        <table id="Table1" width ="100%" >
        <tr align=center>
        <td>
        <tr align="left"><td Width="120px">
            ФИО:</td><td  width="120"><asp:TextBox onkeyup="SetTranslit(this.value)"  ID="fio" Width="120px" runat="server"></asp:TextBox></td></tr><tr align="left"><td Width="120px">
            ФИО лат.:</td><td width="120"><asp:TextBox  ID="fiol" Width="120px" runat="server"></asp:TextBox></td></tr><tr align="left"><td Width="120px">
            Пол:</td><td>
                <asp:DropDownList ID="sex" runat="server">
                
                <asp:ListItem Value="m" Text="мужчина" Selected=True />
                <asp:ListItem Value="f" Text="женщина" />
                </asp:DropDownList>
                
            </td>
        </tr>
         <tr align="left"><td Width="120px">
            Адрес:</td><td width="120"><asp:TextBox ID="address" Width="120px" MaxLength="150" TextMode="MultiLine" runat="server"></asp:TextBox></td></tr><tr align="left"><td Width="120px">
            Электронная почта:</td><td width="120"><asp:TextBox ID="email" Width="120px" MaxLength="45" runat="server"></asp:TextBox></td></tr><tr align="left"><td Width="120px">
            Телефон:</td><td width="120"><asp:TextBox ID="phone" Width="120px" MaxLength="13" runat="server"></asp:TextBox></td></tr><tr align="left"><td Width="120px">
            Дата рождения:</td><td width="120"><asp:TextBox ID="birthday" Width="120px" Placeholder="dd.mm.yyyy" runat="server"></asp:TextBox></td></tr><tr align="Center"><td Width="120px" colspan=2>
            Внутренний паспорт</td></tr><tr align="left"><td Width="120px">
            Серия паспорта:</td><td width="120"><asp:TextBox ID="seriapasp" Width="120px" MaxLength="50"  runat="server"></asp:TextBox></td></tr><tr align="left"><td Width="120px">
            Номер паспорта:</td><td width="120"><asp:TextBox ID="numberpasp" Width="120px" MaxLength="50"  runat="server"></asp:TextBox></td></tr><tr align="left"><td Width="120px">
            Кем выдан паспорт:</td><td width="120"><asp:TextBox ID="whopasp" Width="120px" MaxLength="50"  runat="server"></asp:TextBox></td></tr><tr align="left"><td Width="120px">
            Когда выдан паспорт:</td><td width="120"><asp:TextBox ID="wherepasp" Width="120px" MaxLength="50"  runat="server"></asp:TextBox></td></tr><tr align="Center"><td Width="120px" colspan=2>
            Загран. паспорт</td></tr><tr align="left"><td Width="120px">
            Серия паспорта:</td><td width="120"><asp:TextBox ID="seriazpasp" Width="120px" MaxLength="50"  runat="server"></asp:TextBox></td></tr><tr align="left"><td Width="120px">
            Номер паспорта:</td><td width="120"><asp:TextBox ID="numberzpasp" Width="120px" MaxLength="50"  runat="server"></asp:TextBox></td></tr><tr align="left"><td Width="120px">
            Кем выдан паспорт:</td><td width="120"><asp:TextBox ID="whozpasp" Width="120px" MaxLength="50"  runat="server"></asp:TextBox></td></tr><tr align="left"><td Width="120px">
            Когда выдан паспорт:</td><td width="120"><asp:TextBox ID="wherezpasp" Width="120px" MaxLength="50"  runat="server"></asp:TextBox></td></tr><tr align="left"><td Width="120px">
            Действителен до:</td><td width="120"><asp:TextBox ID="wherendzpasp" Width="120px" MaxLength="50"  runat="server"></asp:TextBox></td></tr><tr align="left"><td Width="120px">
            Добавить в группы:</td><td> <asp:CheckBoxList ID="CheckBoxList1" runat="server">
            </asp:CheckBoxList></td></tr>
        </td>
        </tr>
        </table>
    </asp:Panel>
        </asp:View>
        <asp:View ID="urik" runat=server>
        <asp:Panel ID="Panel4" runat="server">
            <asp:Button ID="Button2" OnClick="Check_Clicked1" runat="server" Text="Физические лица" />
            <asp:Button ID="Button3" OnClick="Check_Clicked2" runat="server" Text="Юридические лица" />
        </asp:Panel>
        <asp:Panel ID="Panel3" runat="server">
         <table id="urist" width ="100%" >
        <tr align=center>
        <td>
        <tr align="left"><td Width="120px">
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
            ОКПО:</td><td width="120"><asp:TextBox ID="okpo" Width="120px" runat="server"></asp:TextBox></td></tr></td></tr></table></asp:Panel></asp:View></asp:MultiView></tr></table></div><div style="text-align:right">
    <asp:Button ID="Button1" OnClick="SaveNewTurist"  runat="server" Text="Сохранить"/></div>
    
</asp:Content>
