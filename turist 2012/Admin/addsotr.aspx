<%@ Page Title="Новый сотрудник" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="addsotr.aspx.cs" Inherits="turist.WebForm15" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script runat="server">
 private turist.App_Code.users.MemberDB mdb = new turist.App_Code.users.MemberDB();
 private turist.App_Code.member mmb = new turist.App_Code.member();
 void SaveNewMember(Object sender, EventArgs e)
 {
     mmb.Fio = UserName.Text;
     mmb.Passwd = Password.Text;
     mmb.Email = Email.Text;
     mmb.Phone = Phone.Text;
     mmb.Login = UserLogin.Text;
     
     mmb.Dolgn = Convert.ToInt32(DolgnList.SelectedValue);
     ErrorMessage.Text = "Сотрудник №" + mdb.InsertMember(mmb) + " успешно создан";
 }

</script>   
    
    <table style="width:100%; ">
      
        <tr>
            <td style="width:35%">

            </td>
        
     
            <td style="width:30%">
    <div runat="server" style=";text-align:center;top:100px;">
    
                
                <table>
                    <tr>
                        <td align="center" colspan="2">Зарегистрировать новую учетную запись</td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">ФИО пользователя:</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="Поле &quot;Имя пользователя&quot; является обязательным." ToolTip="Поле &quot;Имя пользователя&quot; является обязательным." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label1" runat="server" AssociatedControlID="UserLogin">Имя пользователя:</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="UserLogin" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserLogin" ErrorMessage="Поле &quot;Имя пользователя&quot; является обязательным." ToolTip="Поле &quot;Имя пользователя&quot; является обязательным." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Пароль:</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Поле &quot;Пароль&quot; является обязательным." ToolTip="Поле &quot;Пароль&quot; является обязательным." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Подтвердите пароль:</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Поле &quot;Подтвердите пароль&quot; является обязательным." ToolTip="Поле &quot;Подтвердите пароль&quot; является обязательным." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">Электронная почта:</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="Поле &quot;Электронная почта&quot; является обязательным." ToolTip="Поле &quot;Электронная почта&quot; является обязательным." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                     <tr>
                        <td align="right">
                            <asp:Label ID="PhoneLabel" runat="server" AssociatedControlID="Phone">Телефон:</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Phone" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="PhoneRequired" runat="server" ControlToValidate="Phone" ErrorMessage="Поле &quot;Телефон&quot; является обязательным." ToolTip="Поле &quot;Телефон&quot; является обязательным." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                     <tr>
                        <td align="right">
                            <asp:Label ID="Dolgn" runat="server" AssociatedControlID="Dolgn">Должность:</asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DolgnList" runat="server" DataSourceID="ObjectDataSource1" DataTextField="Name" DataValueField="ID">
                            </asp:DropDownList>

                            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetAllDolgn" TypeName="turist.App_Code.users.MemberDB"></asp:ObjectDataSource>

                            <asp:RequiredFieldValidator ID="DolgnRequired" runat="server" ControlToValidate="DolgnList" ErrorMessage="Поле &quot;Должность&quot; является обязательным." ToolTip="Поле &quot;Должность&quot; является обязательным." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                  
                    <tr>
                        <td align="center" colspan="2">
                            <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="Значения &quot;Пароль&quot; и &quot;Подтвердите пароль&quot; должны совпадать." ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2" style="color:Red;">
                            <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                        </td>
                    </tr>
                </table>
            
            
                <table border="0" cellspacing="5" style="width:100%;height:100%;">
                    <tr align="right">
                        <td align="right" colspan="0">
                            <asp:Button ID="StepNextButton" runat="server"  Text="Создать пользователя"  OnClick="SaveNewMember" />
                        </td>
                    </tr>
                </table>
            
       
        
   
</div>
    </td>
    
            <td style="width:35%">

            </td>
        </tr>
    </table>

</asp:Content>

