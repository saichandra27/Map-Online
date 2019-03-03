<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<asp:Panel ID="loginpanel" runat="server">
    <table>   
    <tr>
    <td>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
     <asp:Login ID="Login1" runat="server" BackColor="White" BorderColor="Black" 
            BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
            Font-Size="10pt" onauthenticate="Login1_Authenticate">
         <TitleTextStyle BackColor="Black" Font-Bold="True" ForeColor="#FFFFFF" />
        </asp:Login>
        </ContentTemplate>
         </asp:UpdatePanel>
    </td>
    </tr>
    </table>       
    </asp:Panel>
</asp:Content>

