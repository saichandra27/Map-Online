<%@ Page Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="MyProfile.aspx.cs" Inherits="MyProfile" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table id ="profilebox">
    <tr>
    <td>First Name:</td> 
    <td>
        <asp:TextBox ID="txtfirstname" runat="server"></asp:TextBox></td>  
    </tr>
    <tr>
    <td>Last Name:</td>
    <td>
        <asp:TextBox ID="txtlastname" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td>
    EmailID:
    </td>
    <td>
        <asp:TextBox ID="txtemailid" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td>
    Phone Number:
    </td>
    <td>
        <asp:TextBox ID="txtphonenumber" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td>
    Pets?:
    </td>
    <td>
        <asp:TextBox ID="txtpets" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td>
    Employed?:    
    </td>
    <td>
        <asp:TextBox ID="txtemployed" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td>Income:</td>
    <td>
        <asp:TextBox ID="txtincome" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td>Move-In Date:</td>
    <td>
        <asp:TextBox ID="txtmoveindate" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td>
    Best Days/Time-to-Visit:
    </td>
    <td>
        <asp:TextBox ID="txtbestdays" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td>About You/Comments:</td>
    <td>
    <asp:TextBox ID="txtcomments" runat="server"></asp:TextBox>
    </td>
    </tr>    
    <tr>
    <td>
        
    </td>
    <td>
        <asp:Button ID="btncancel" runat="server" Text="Update" />
    </td>
    </tr>
    </table>
</asp:Content>

