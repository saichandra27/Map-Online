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
using System.Data.SqlClient;

public partial class Favourites : System.Web.UI.Page
{
    SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["cnn"].ConnectionString);
    Guid userid;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private void GetFavourites()
    {
        SqlCommand cmd = new SqlCommand("mapoline_retrievefavourites", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@userid", GetUserId()));
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "favourites");
        GridView1.DataSource = ds.Tables["favourites"];
        GridView1.DataBind();
    }

    protected void HyperLink6_Click(object sender, EventArgs e)
    {

        GetFavourites();
    }
    protected void HyperLink6_Load(object sender, EventArgs e)
    {

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
        SqlCommand cmd = new SqlCommand("select userid from aspnet_users where username = '" + User.Identity.Name + "'", cnn);
        cnn.Open();
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds, "users");
        userid = (Guid)ds.Tables["users"].Rows[0][0];
        cnn.Close();
        return userid;
    }
}
