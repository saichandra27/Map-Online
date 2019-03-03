using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Admin_Admin : System.Web.UI.Page
{
    SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["cnn"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetUserInfo(); 
            BindUsers();
            BindRoles();
        }
    }
    protected void btnCreateRole_Click(object sender, EventArgs e)
    {
        Label1.Text = "";
        //try
        //{
            if (!Roles.RoleExists(txtrolename.Text))
            {
                Roles.CreateRole(txtrolename.Text);
                BindUsers();
                BindRoles();
                Label1.Text = "Role(s) Created Successfully";
            }
            else
            {
                Label1.Text = "Role(s) Already Exists";
            }
        //}
        //catch (Exception ex)
        //{
        //    Label1.Text = ex.Message;
        //}
    }
    protected void btnAssignRoleToUser_Click(object sender, EventArgs e)
    {
        Label1.Text = "";
        try
        {
            if (!Roles.IsUserInRole(lstRoles.SelectedItem.Text))
            {
                Roles.AddUserToRole(lstusers.SelectedItem.Text, lstRoles.SelectedItem.Text);
                BindUsers();
                BindRoles();
                Label1.Text = "User Assigned To User Successfully";
            }
            else
            {
                Label1.Text = "Role(s) Already Assigned To User";
            }
        }
        catch (Exception ex)
        {
            Label1.Text = ex.Message;
        }
    }
    public void BindUsers()
    {
        SqlDataAdapter da = new SqlDataAdapter("select UserName from aspnet_users", cnn);
        DataSet ds = new DataSet();
        da.Fill(ds, "Roles");
        lstusers.DataSource = ds;
        lstusers.DataTextField = "UserName";
        lstRoles.DataValueField = "RoleName";
        lstusers.DataBind();
    }
    public void BindRoles()
    {
        SqlDataAdapter da = new SqlDataAdapter("select RoleName from aspnet_Roles", cnn);
        DataSet ds = new DataSet();
        da.Fill(ds, "Roles");
        lstRoles.DataSource = ds;
        lstRoles.DataTextField = "RoleName";
        lstRoles.DataValueField = "RoleName";
        lstRoles.DataBind();
    }
    protected void btnRemoveUserFromUser_Click(object sender, EventArgs e)
    {
        Label1.Text = "";
        try
        {
            Roles.RemoveUserFromRole(lstusers.SelectedItem.Text, lstRoles.SelectedItem.Text);
            BindUsers();
            BindRoles();
            Label1.Text = "User Is Removed From The Role Successfully";
        }
        catch (Exception ex)
        {
            Label1.Text = ex.Message;
        }
    }
    protected void btnRemoveRoles_Click(object sender, EventArgs e)
    {
        Label1.Text = "";
        try
        {
            Roles.RemoveUserFromRole(lstusers.SelectedItem.Text, lstRoles.SelectedItem.Text);
            BindUsers();
            BindRoles();
            Label1.Text = "User Is Removed From The Role Successfully";
        }
        catch (Exception ex)
        {
            Label1.Text = ex.Message;
        }
    }
    private void GetUserInfo()
    {
        SqlCommand cmd = new SqlCommand("getuserinfo", cnn);
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds,"userinfo");
        GridView1.DataSource = ds.Tables["userinfo"];
        GridView1.DataBind();
//        create procedure getuserinfo
//as
//begin
//select e.username, eb.email from aspnet_Users e inner join aspnet_Membership eb on e.UserId = eb.UserId
//end
//execute getuserinfo
    }
}