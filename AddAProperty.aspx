<%@ Page Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="AddAProperty.aspx.cs" Inherits="Admin_AddAProperty" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table>
<tr>
<th>The Basics</th>
</tr>
<tr>
<td>Price:</td>
<td>
    <asp:TextBox ID="txtprice" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td>Bedrooms:</td>
<td>
    <asp:TextBox ID="txtbedrooms" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td>
Cats Allowed?
</td>
<td>
    <asp:TextBox ID="txtcatsallowed" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td>
Dogs Allowed?
</td>
<td>
    <asp:TextBox ID="txtdogsallowed" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td>
What kind of listing is this?
</td>
<td>
    <asp:TextBox ID="txtlistings" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td>
Minimum Lease Length:
</td>
<td>
    <asp:TextBox ID="txtleaselength" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td>
Unit # :
</td>
<td>
    <asp:TextBox ID="txtunit" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td>
Property Type:
</td>
<td>
    <asp:TextBox ID="txtpropertytype" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td>Date Available:</td>
<td>
    <asp:TextBox ID="txtdateavailable" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td>
Deposit:
</td>
<td>
    <asp:TextBox ID="txtdeposit" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td>
Square Feet:
</td>
<td>
    <asp:TextBox ID="txtsquarefeet" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td>
Parking:
</td>
<td>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td>
Community Name:
</td>
<td>
    <asp:TextBox ID="txtcommunityname" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td>
Contact Phone:
</td>
<td>
    <asp:TextBox ID="txtcontactphone" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td colspan ="2">
The name and the email address <br />that renters should contact you at will be set later.
</td>
</tr>
</table>
<table>
<tr>
<th colspan ="2">
Location
</th>
</tr>
<tr>
<td>Full Address:</td>
<td>
<asp:TextBox ID="txtfulladdress" runat="server"></asp:TextBox>    
</td>
</tr>
<tr>
<td>
Neighborhood 
</td>
<td>
    <asp:TextBox ID="txtneighborhood" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td>
Brief Description 
</td>
<td>
    <asp:TextBox ID="txtbriefdescription" runat="server" TextMode ="MultiLine"></asp:TextBox>
</td>
</tr>
<tr>
<td>
YouTube Property Video URL
</td>
</tr>
<tr>
<td>

</td>
</tr>
<tr>
<th colspan ="2">Accepting Online Rental Applications</th></tr>
<tr>
<td colspan ="2">
<h4>Mapoline offers its own Online Rental Applications as a free tool for listers.</h4>
<ul>
    <li>Comprehensive application</li>
    <li>Applicant credit screening info and background check results automatically included</li>
    <li>Free for you, only $25/applicant for them (payable online)</li>
    <li>Automatically stored with your listings</li>
    <li>Can be emailed to applicants</li>
    <li>No faxing, legwork, or payment collection required</li>
    <li>Printable</li>
</ul>
</td>
</tr>
<tr>
<td>
    <asp:CheckBox ID="CheckBox1" runat="server" />
</td>
<td>
   I have Read And Accept The Terms and Condition.
</td>
</tr>
<tr>
<td colspan ="2">
    <asp:Button ID="btncreate" runat="server" Text="Create" 
        onclick="btncreate_Click" />
</td>
</tr>
</table>
</asp:Content>

