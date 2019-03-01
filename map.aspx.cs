using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections.Generic;
using Mapoline;
using System.Data.SqlClient;
using System.Text;

public partial class map : System.Web.UI.Page
{
    protected string title = string.Empty;
    protected string crdnts = string.Empty;
    protected string cnt = string.Empty;
    protected string id = string.Empty;
    string text = ""; Guid userid;
    SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["cnn"].ConnectionString);
  

    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = "";
        ViewState["city"] = "hyderabad";
        if (!IsPostBack)
        {
            Bind(); 
            ClientScript.RegisterStartupScript(GetType(), "key", "markicons();", true);
        }
        else if (IsPostBack)
        {
            ClientScript.RegisterStartupScript(GetType(), "key", "setmarkeric();", true);
        }
        if (User.Identity.IsAuthenticated == false)
        {
            pfvts.Style.Add("display", "none");
            pprofle.Style.Add("display", "none");
            plgn.Style.Add("display", "inline");
            araddproperty.Style.Add("display", "none");
            btnlogout.Style.Add("display", "none");
            btnsetasfavourite.Text = "sing in to save your favorites items";
            btnsetasfavourite.Enabled = false;
        }
        else
        {
            pfvts.Style.Add("display", "inline");
            pprofle.Style.Add("display", "inline");
            plgn.Style.Add("display", "none");
            araddproperty.Style.Add("display", "inline");
            btnlogout.Style.Add("display", "inline");
            btnsetasfavourite.Text = "set as Favourite Item";
            btnsetasfavourite.Enabled = true;
        }
        InitializeProfileBox();
        btnlogout.Click += new EventHandler(btnlogout_Click);
    }

    protected void btnlogout_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Response.Redirect("map.aspx");
    }

    //protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    //{
    //    GridView1.EditIndex = -1;
    //    Bind();
    //}

    //protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    //{

    //}

    //protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    //{
    //    GridView1.EditIndex = e.NewEditIndex;
    //    Bind();
    //}

    protected void btndisplayprts_Click(object sender, EventArgs e)
    {
        ViewState["city"] = TextBox1.Text;
        GetAllData(TextBox1.Text);
    }

    protected void btnedit_Click(object sender, EventArgs e)
    {
        txtfirstname.Visible = true;
        txtlastname.Visible = true;
        txtemailid.Visible = true;
        txtphonenumber.Visible = true;
        txtpets.Visible = true;
        txtemployed.Visible = true;
        txtincome.Visible = true;
        txtmoveindate.Visible = true;
        txtbestdays.Visible = true;
        txtcomments.Visible = true;
        trfirstname.Visible = true;
        trlastname.Visible = true;
        tremailid.Visible = true;
        trphonenumber.Visible = true;
        trpets.Visible = true;
        tremployed.Visible = true;
        trincome.Visible = true;
        trmoveindate.Visible = true;
        trbestdays.Visible = true;
        trabout.Visible = true;
        lblfirstname.Visible = false;
        lbllastname.Visible = false;
        lblemailid.Visible = false;
        lblphonenumber.Visible = false;
        lblpets.Visible = false;
        lblemployed.Visible = false;
        lblincome.Visible = false;
        lblmoveindate.Visible = false;
        lblbestdays.Visible = false;
        lblcomments.Visible = false;        
        btnedit.Visible = false;
        btnupdate.Visible = true;
        System.Threading.Thread.Sleep(3000);
    }

    protected void btnupdate_Click(object sender, EventArgs e)
    {
        txtfirstname.Text = Profile.FirstName;
        txtlastname.Text = Profile.LastName;
        txtemailid.Text = Profile.EmailID;
        txtphonenumber.Text = Profile.PhoneNumber;
        txtpets.Text = Profile.Pets;
        txtemployed.Text = Profile.Employed;
        txtincome.Text = Profile.Income;
        txtmoveindate.Text = Profile.MoveInDate;
        txtbestdays.Text = Profile.BestDays;
        txtcomments.Text = Profile.Comments;
        Profile.FirstName = txtfirstname.Text;
        Profile.LastName = txtlastname.Text;
        Profile.EmailID = txtemailid.Text;
        Profile.PhoneNumber = txtphonenumber.Text;
        Profile.Pets = txtpets.Text;
        Profile.Employed = txtemployed.Text;
        Profile.Income = txtincome.Text;
        Profile.MoveInDate = txtmoveindate.Text;
        Profile.BestDays = txtbestdays.Text;
        Profile.Comments = txtcomments.Text;
        Profile.Save();
        InitializeProfileBox();
        btnedit.Visible = true;
        System.Threading.Thread.Sleep(3000);
    }

    public void InitializeProfileBox()
    {
        btnupdate.Visible = false;
        txtfirstname.Visible = false;
        txtlastname.Visible = false;
        txtemailid.Visible = false;
        txtphonenumber.Visible = false;
        txtpets.Visible = false;
        txtemployed.Visible = false;
        txtincome.Visible = false;
        txtmoveindate.Visible = false;
        txtbestdays.Visible = false;
        txtcomments.Visible = false;
        trfirstname.Visible = false;
        trlastname.Visible = false;
        tremailid.Visible = false;
        trphonenumber.Visible = false;
        trpets.Visible = false;
        tremployed.Visible = false;
        trincome.Visible = false;
        trmoveindate.Visible = false;
        trbestdays.Visible = false;
        trabout.Visible = false;
        lblfirstname.Visible = true;
        lbllastname.Visible = true;
        lblemailid.Visible = true;
        lblphonenumber.Visible = true;
        lblpets.Visible = true;
        lblemployed.Visible = true;
        lblincome.Visible = true;
        lblmoveindate.Visible = true;
        lblbestdays.Visible = true;
        lblcomments.Visible = true;
        if (Profile.FirstName != "")
        {
            trfirstname.Visible = true;
            lblfirstname.Text = Profile.FirstName;
        }
        if (Profile.LastName != "")
        {
            trlastname.Visible = true;
            lbllastname.Text = Profile.LastName;
        }
        if (Profile.EmailID != "")
        {
            tremailid.Visible = true;
            lblemailid.Text = Profile.EmailID;
        }
        if (Profile.Employed != "")
        {
            tremployed.Visible = true;
            lblemployed.Text = Profile.Employed;
        }
        if (Profile.PhoneNumber != "")
        {
            trphonenumber.Visible = true;
            lblphonenumber.Text = Profile.PhoneNumber;
        }
        if (Profile.Pets != "")
        {
            trpets.Visible = true;
            lblpets.Text = Profile.Pets;
        }
        if (Profile.Income != "")
        {
            trincome.Visible = true;
            lblincome.Text = Profile.Income;
        }
        if (Profile.MoveInDate != "")
        {
            trmoveindate.Visible = true;
            lblmoveindate.Text = Profile.MoveInDate;
        }
        if (Profile.BestDays != "")
        {
            trbestdays.Visible = true;
            lblbestdays.Text = Profile.BestDays;
        }
        if (Profile.Comments != "")
        {
            trabout.Visible = true;
            lblcomments.Text = Profile.Comments;
        }
    }
    
    private int GetAllData(string city)
    {
        title = string.Empty;
        crdnts = string.Empty;
        cnt = string.Empty;
        id = string.Empty;
        List<Properties> Proty = GetData(city);
        FillArraywithData(Proty);
        return Proty.Count;
    }
    
    private void GetAllDataByQuery(string query)
    {
        title = string.Empty;
        crdnts = string.Empty;
        cnt = string.Empty;
        id = string.Empty;
        List<Properties> Proty = GetDataByQuery(query);
        FillArraywithData(Proty);
    }
    
    private void FillArraywithData(List<Properties> Proty)
    {

        foreach (Properties p in Proty)
        {
          
                if (id == string.Empty)
                {
                    id = "\"" + p.ID + "\"";
                }
                else
                {
                    id = id + ",\"" + p.ID + "\"";
                }
                text = "<a href=" + p.Link + ">" + p.Title + "</a>";
                if (title == string.Empty)
                {
                    title = "\"" + text + "\"";
                }
                else
                {
                    title = title + ",\"" + text + "\"";
                }
                if (crdnts == string.Empty)
                {
                    crdnts = "\"" + p.Coordinate + "\"";
                }
                else
                {
                    crdnts = crdnts + "," + "\"" + p.Coordinate + "\"";
                }
                if (cnt == string.Empty)
                {
                    cnt = "\"" + RemoveAllSpecialCharacters(p.Body) + "\"";
                }
                else
                {
                    cnt = cnt + "," + "\"" + RemoveAllSpecialCharacters(p.Body) + "\"";
                }
            
        }
    }

    private static string RemoveAllSpecialCharacters(string text)
    {
        StringBuilder sb = new StringBuilder();
        bool lastWasInvalid = false;
        foreach (char c in text)
        {
            if (char.IsLetterOrDigit(c))
            {
                sb.Append(c);
                lastWasInvalid = false;
            }
            else
            {
                if (!lastWasInvalid)
                    sb.Append(" ");
                lastWasInvalid = true;
            }
        }

        return sb.ToString().ToLowerInvariant().Trim();

    }

    private List<Properties> GetData(string city)
    {
        
        List<Properties> properties = new List<Properties>();
        SqlCommand cmd = new SqlCommand("RetrieveMapoline_properties", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@city", city));
        cnn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            Properties property = new Properties();
            property.ID = Convert.ToInt32(dr["Propertyid"]);
            property.Title = dr["Title"].ToString();
            property.Address = dr["Address"].ToString();
            property.Category = dr["Category"].ToString();
            property.Link = dr["Link"].ToString();
            property.Body = dr["Body"].ToString();
            property.Coordinate = dr["Coordinate"].ToString();
            properties.Add(property);
        }
        dr.Close();
        cnn.Close();
        return properties;
    }
    
    private List<Properties> GetDataByQuery(string query)
    {        
        List<Properties> properties = new List<Properties>();
        SqlCommand cmd = new SqlCommand("retrievepropertiesbyquery", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@query", query));
        cnn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            Properties property = new Properties();
            property.ID = Convert.ToInt32(dr["Propertyid"]);
            property.Title = dr["Title"].ToString();
            property.Address = dr["Address"].ToString();
            property.Category = dr["Category"].ToString();
            property.Link = dr["Link"].ToString();
            property.Body = dr["Body"].ToString();
            property.Coordinate = dr["Coordinate"].ToString();
            properties.Add(property);
        }
        dr.Close();
        cnn.Close();
        return properties;
    }       
    
    private void SetFavourite()
    {
        SqlCommand cmd = new SqlCommand("mapoline_setfavourite", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@userid",GetUserId()));
        cmd.Parameters.Add(new SqlParameter("@propertyid", Convert.ToInt32(TextBox2.Text)));
        cnn.Open();
        cmd.ExecuteNonQuery();
        cnn.Close();
    }
    
    private Guid GetUserId()
    {
        //SqlCommand cmd = new SqlCommand("mapoline_getuserid", cnn);
        //cnn.Open();
        //cmd.CommandType = CommandType.StoredProcedure;
        //cmd.Parameters.Add(new SqlParameter("@username", SqlDbType.NVarChar,234)).Value = User.Identity.Name;
        //cmd.Parameters.Add(new SqlParameter("@userid",SqlDbType.UniqueIdentifier,1024)).Direction = ParameterDirection.Output;       
        //Guid userid = (Guid)cmd.Parameters["@userid"].Value;
        //cnn.Close();
        //return userid;
        SqlCommand cmd = new SqlCommand("select userid from aspnet_users where username = '"+User.Identity.Name+"'", cnn);
        cnn.Open();
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds, "users");
        userid = (Guid)ds.Tables["users"].Rows[0][0];        
        cnn.Close();
        return userid;
    }
    
    private List<int> GetPropertyid()
    {
        List<int> propertyid = new List<int>();
        SqlCommand cmd = new SqlCommand("mapoline_retrievefavourites", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@userid", GetUserId()));
        cnn.Open();
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds, "propertyid");
        cnn.Close();
        return propertyid;
    }

    protected void CreateUserWizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        MembershipCreateStatus p = MembershipCreateStatus.Success;
        Membership.CreateUser(CreateUserWizard1.UserName,
           CreateUserWizard1.Password, CreateUserWizard1.Email,
        CreateUserWizard1.Question, CreateUserWizard1.Answer, true, out p);
    }

    protected void CreateUserWizard1_ContinueButtonClick(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }

    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        if (Membership.ValidateUser(Login1.UserName, Login1.Password) == true)
        {
            Session["user"] = User.Identity.Name;
            FormsAuthentication.RedirectFromLoginPage(Login1.UserName, true);
        }
    }

    private void Bind()
    {
        try
        {
            SqlCommand cmd = new SqlCommand("mapoline_retrievefavourites", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@userid", GetUserId()));
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "favourites");
            foreach (DataRow dr in ds.Tables["favourites"].Rows)
            {
                SqlCommand cmd1 = new SqlCommand("select title,body,Link from mapoline_properties where propertyid = '" + dr[0].ToString() + "'", cnn);
                SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
                da1.Fill(ds, "favouriteslist");
            }
            Repeater1.DataSource = ds.Tables["favouriteslist"];
            Repeater1.DataBind();
        }
        catch { }
    }

    protected void btneditnotes_Click(object sender, ImageClickEventArgs e)
    {
        Label1.Text = "Processing............................";
        btneditnotes.Style.Add("display", "none");
        btnupdatenotes.Style.Add("display", "block");
        txtnotes.Style.Add("display", "block");
        lblnotes.Style.Add("display", "none");
        System.Threading.Thread.Sleep(3000);
        Label1.Text = "Process Completed";
    }

    protected void btnupdatenotes_Click(object sender, EventArgs e)
    {
        txtnotes.Style.Add("display", "none");
        lblnotes.Style.Add("display", "inline");
        btnupdatenotes.Style.Add("display", "none");
        btneditnotes.Style.Add("display", "block");
        System.Threading.Thread.Sleep(3000);
    }

    protected void btnsetasfavourite_Click(object sender, EventArgs e)
    {
        Label1.Text = "Processing......";
        SetFavourite();
        System.Threading.Thread.Sleep(3000);
        Label1.Text = "Process Completed";
        Bind();
    }

    protected void btnfind_Click(object sender, EventArgs e)
    {
        title = string.Empty;
        crdnts = string.Empty;
        cnt = string.Empty;
        id = string.Empty;
        string query = txtbathrooms.Text +".00 "+ txtbedrooms.Text +".00 " + txtplace.Text + " "+ txtrentrange.Text;        
        string city = ViewState["city"].ToString();
        List<Properties> properties = new List<Properties>();
        SqlCommand cmd = new SqlCommand("select * from mapoline_properties where city ='Hyderabad' and  FREETEXT(title,'" + query + "')", cnn);
        cnn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            Properties property = new Properties();
            property.ID = Convert.ToInt32(dr["Propertyid"]);
            property.Title = dr["Title"].ToString();
            property.Address = dr["Address"].ToString();
            property.Category = dr["Category"].ToString();
            property.Link = dr["Link"].ToString();
            property.Body = dr["Body"].ToString();
            property.Coordinate = dr["Coordinate"].ToString();
            properties.Add(property);
        }
        dr.Close();
        cnn.Close();
        FillArraywithData(properties);
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "editComments")
        {
            TextBox txtcomments = (TextBox)Repeater1.Items[e.Item.ItemIndex].FindControl("txtcomments");
            txtcomments.Visible = true;
            ImageButton btnedit = (ImageButton)Repeater1.Items[e.Item.ItemIndex].FindControl("btnedit");
            btnedit.Visible = false;
            Button btnupdate = (Button)Repeater1.Items[e.Item.ItemIndex].FindControl("btnupdate");
            btnupdate.Visible = true;
        }
        if (e.CommandName == "updateComments")
        {
            Bind();
            Button btnupdate = (Button)Repeater1.Items[e.Item.ItemIndex].FindControl("btnupdate");
            btnupdate.Visible = false;
            TextBox txtcomments = (TextBox)Repeater1.Items[e.Item.ItemIndex].FindControl("txtcomments");
            txtcomments.Visible = false;
            ImageButton btnedit = (ImageButton)Repeater1.Items[e.Item.ItemIndex].FindControl("btnedit");
            btnedit.Visible = true;
        }
    }
}


