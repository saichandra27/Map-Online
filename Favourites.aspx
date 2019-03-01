<%@ Page Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Favourites.aspx.cs" Inherits="Favourites" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID ="MyFavourites"   runat="server"  BackColor= "#666699" BorderColor="#33CCFF" BorderStyle="Solid" ForeColor="White" Font-Bold ="true">
        <asp:GridView ID="GridView1" runat="server" 
        AutoGenerateColumns ="false">
        <Columns>
        <asp:TemplateField HeaderText ="MyFavourites">
            <ItemTemplate>
            <table>
            <tr>
            <td>
            Title:
            </td>
            </tr>
            <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
            </td>
            </tr>
               <tr>
            <td>Description</td>
            </tr>
             <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Body") %>'></asp:Label>   </td>
            </tr>
            </table>
            </ItemTemplate>
        </asp:TemplateField>
       
        </Columns>
        </asp:GridView>
    </asp:Panel>
</asp:Content>

