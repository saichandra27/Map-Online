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

public partial class Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
        Response.Redirect("home.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
}
