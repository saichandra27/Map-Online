<%@ Page Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="panelcreateuser" runat="server">
  <table>  
  <tr>
  <td>
  <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" BackColor="#FFFFFF" 
          BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" 
          Font-Names="Verdana" Font-Size="10pt" 
          oncontinuebuttonclick="CreateUserWizard1_ContinueButtonClick" 
          onfinishbuttonclick="CreateUserWizard1_FinishButtonClick">                 
          <TitleTextStyle BackColor="Black" Font-Bold="True" ForeColor="#FFFFFF" />          
      </asp:CreateUserWizard>
  </td>  
  </tr>
  <tr>
  <td align="center">
      <asp:Button ID="Button3" runat="server" Text="!!!...Remind Me Later....!!!"  
          CssClass ="btn" onclick="Button3_Click"  />
  </td>  
  </tr>
  </table>      
  </asp:Panel>  
</asp:Content>

