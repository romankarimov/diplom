<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="WebForm13.aspx.cs" Inherits="turist.WebForm13" %>
<script runat="server">
    
    private void Button1_Click(object sender, EventArgs e)
    {
        turist.App_Code.Wordwork Word = new turist.App_Code.Wordwork("/doctemplates/Doc1.dot");
        Word.ReplaceTextByBookmark("NameField", TextBox1.Text);
        Word.ReplaceTextByBookmark("TimeField", TextBox2.Text);
        if (Word.SaveDoc("/docs/") == true)
        {
            Word.Closeword();
        }
        else
        {
            TextBox1.Text = "Error";
            Word.Closeword();
        }
    }
    
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <asp:TextBox ID="TextBox1" runat="server" Text=""></asp:TextBox><br />
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><br />
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
    </div>
</asp:Content>
