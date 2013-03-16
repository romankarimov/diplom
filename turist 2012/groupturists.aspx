<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="groupsturists.aspx.cs" Inherits="turist.WebForm5" Title="Группы туристов" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <script runat=server>
        void Page_Load(Object sender, EventArgs e)
        {
            MultiView1.SetActiveView(main);
        }
        void New_group(Object sender, EventArgs e)
        {
            MultiView1.SetActiveView(newgrp);
        }
        void Change_Name(Object sender, EventArgs e) //
        {
            try
            {
                if (MultiView1.GetActiveView() == main)
                {
                    MultiView1.SetActiveView(chnamev);
                    
                }
               
            }
            catch
            {
            }
            
        }
        void Ch_Name(Object sender, EventArgs e) //Записываем переименование
        {
            try
            {
               
                    MultiView1.SetActiveView(main);

            }
            catch
            {
            }

        }
        void Delete_Group(Object sender, EventArgs e)//Удаляем запись
        {
            try
            {
            }
            catch
            {
            }
            
        }
        
        void Save_New_Group(Object sender, EventArgs e) //Сохраняем группу
        {
            try
            {
                MultiView1.SetActiveView(main);
            }
            catch
            {
            }
        }
    </script>
    <div runat="server" width="100%" style="text-align:left">
        <asp:MultiView ID="MultiView1" runat="server">
        <asp:View Id="main" runat="server">
            <asp:Button ID="newgr" runat="server" OnClick="New_group" Text="Создать новую группу" />   
            <div width="100%" runat=server>
            <table cellpadding=0 cellspacing =0 width="100%"><tr align=left>
            <td>Текущий список:</td>
            <td align=left>
                <asp:DropDownList ID="DropDownList1" Width="100px" runat="server">
                
                </asp:DropDownList>
            </td>
            <td style="padding:0,0,0,0;">
                <asp:Button ID="chname" OnClick="Change_Name" runat="server" Text="Переименовать" />
            
                <asp:Button ID="delgr" OnClick="Delete_Group" runat="server" Text="Удалить" />
            </td>
            </tr></table>
            </div>
            <table id="Table1" runat="server">
                <tr><td width="50%"> <div  class="brdin">
                <asp:CheckBoxList ID="CheckBoxList1" runat="server">
            
                </asp:CheckBoxList>
                </div></td>
                </tr>
            </table>
        </asp:View>
        <asp:View Id="newgrp" runat="server">
              
            <div id="Div1" runat=server>
            <table><tr align=left>
            <td>Название группы:</td>
            <td><asp:TextBox ID="namegroup" runat="server"></asp:TextBox></td>
            </tr><tr>
            <td>Тип:</td>
            <td>
                <asp:DropDownList ID="typegroup" runat="server">
                <asp:ListItem Value="people" Text="Физические лица" />
                <asp:ListItem Value="organisation" Text="Организации" />
                </asp:DropDownList>
            </td>
            </tr>
            <tr align=right>
            <td  colspan=2>
                <asp:Button ID="savenewgr" OnClick="Save_New_Group" runat="server" Text="Сохранить" /></td></tr></table>
            </div>
            
        </asp:View>
         <asp:View Id="chnamev" runat="server">
              
            <div id="Div2" runat=server>
            <table><tr align=left>
            <td>Новое название:</td>
            <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
            </tr>
            <tr align=right>
            <td  colspan=2>
                <asp:Button ID="Button1" OnClick="Ch_Name" runat="server" Text="Сохранить" /></td></tr></table>
            </div>
            
        </asp:View>
         
        </asp:MultiView>
        
    
    </div>
</asp:Content>
