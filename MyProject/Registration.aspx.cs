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
    public partial class Registration : System.Web.UI.Page
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
                    using (cmd = new SqlCommand("usp_NewUser", con))
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
                        if (returnValue == -1)
                        {
                            CvEmailExists.IsValid = false;
                        }
                        else
                        {
                            Response.Redirect("Login.aspx");
                        }
                    }
                }
            }
        }

        protected void BtnReset_Click(object sender, EventArgs e)
        {
            TxtEmailId.Text = "";
            TxtConfirmPassword.Text = "";
            TxtPassword.Text = "";
        }

        //protected void CvEmailExists_ServerValidate(object source, ServerValidateEventArgs args)
        //{
        //    if (returnValue == -1)
        //    {
        //        args.IsValid = false;
        //    }
        //    else
        //    {
        //        args.IsValid = true;
        //    }
        //}
    }
}