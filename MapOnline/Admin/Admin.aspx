<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin_Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style ="height:450px;">
<h2>Admin Panel:</h2>
<table>
<tr><th>Admin Options</th><th>Registered Users</th></tr>
<tr>
<td valign ="top">
<table>
<tr>
<td>
    <asp:TextBox ID="txtrolename" runat="server"></asp:TextBox>
    <asp:Button ID="btnCreateRole" runat="server" Text="CreateRole" OnClick="btnCreateRole_Click"/>
</td>
</tr>
<tr>
<td>
<table>
<tr>
<td>Available Users</td>
<td>Available Roles</td>
</tr>
<tr>
<td style="height: 72px">
    <asp:ListBox ID="lstusers" runat="server" Height="95px" Width="105px"></asp:ListBox>
</td>
<td style="height: 72px">
    <asp:ListBox ID="lstRoles" runat="server" Height="92px" Width="95px"></asp:ListBox>
</td>
</tr>
</table>
</td>
</tr>
<tr>
<td>
    <asp:Button ID="btnAssignRoleToUser" runat="server" Text="Assign Role To User" Width="175px" OnClick="btnAssignRoleToUser_Click" />
</td>
</tr>
<tr>
<td>
    <asp:Button ID="btnRemoveUserFromUser" runat="server" Text="Remove User From Role" OnClick="btnRemoveUserFromUser_Click" />
    
</td>
</tr>
<tr>
<td>
    <asp:Button ID="btnRemoveRoles" runat="server" Text="Delete Roles" Width="176px" OnClick="btnRemoveRoles_Click" />
</td>
</tr>
<tr>
<td>
    <asp:Label ID="Label1" runat="server"></asp:Label>
</td>
</tr>
</table></td>
<td valign ="top">
    <asp:GridView ID="GridView1" runat="server" BackColor="White" 
        BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
        EnableModelValidation="True" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
</td>
</tr>
</table>
<asp:HyperLink ID="HyperLink1" NavigateUrl="http://www.mapoline.somee.com/Admin/manage.aspx" runat="server"><h2>Update database</h2></asp:HyperLink>
</div>
</asp:Content>

