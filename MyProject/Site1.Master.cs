using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyProject
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["EmailId"] != null)
            {               
                LinkRegistration.Text = Session["EmailId"].ToString();
                LinkRegistration.NavigateUrl = String.Empty;
                BtnLoginOut.Text = "Sign Out";
            }
            else
            {
                BtnLoginOut.Text = "Sign In";
            }
        }

        protected void BtnLoginOut_Click(object sender, EventArgs e)
        {
            if (Session["EmailId"] != null)
            {
                Session.Remove("EmailId");
                Response.Redirect("Index.aspx");
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}