using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyProject
{
    public partial class Login : System.Web.UI.Page
    {
        private SqlConnection con = null;
        private SqlCommand cmd = null;
        private int returnValue = 0;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                using (con = new SqlConnection(ConfigurationManager.ConnectionStrings["NorthwindCon"].ConnectionString))
                {
                    using (cmd = new SqlCommand("usp_Login", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@EmailId", TxtEmailId.Text);
                        cmd.Parameters.AddWithValue("@Password", TxtPassword.Text);
                        cmd.Parameters.Add(new SqlParameter("@ReturnValue", SqlDbType.Int));
                        cmd.Parameters["@ReturnValue"].Direction = ParameterDirection.ReturnValue;
                        if (con.State == ConnectionState.Closed)
                        {
                            con.Open();
                        }
                        cmd.ExecuteNonQuery();
                        returnValue = (int)cmd.Parameters["@ReturnValue"].Value;
                        if (returnValue == -2)
                        {
                            CustomValidator1.IsValid = false;
                            CustomValidator1.ErrorMessage = "EmailId and Password doesn't match. Please try again";
                        }
                        else if(returnValue == 1)
                        {
                            Session["EmailId"] = TxtEmailId.Text;
                            Response.Redirect("Index.aspx");
                        }
                    }
                }
            }
        }
    }
}