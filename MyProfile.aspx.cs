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

public partial class MyProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtfirstname.Text = Profile.FirstName;
    }
    protected void btnsaveprofile_Click(object sender, EventArgs e)
    {
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
        
    }
}
