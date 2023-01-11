using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


namespace MyProject
{
    public class MyProject_BLL
    {
        public DataTable GetProducts(int? categoryid = null)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["NorthwindCon"].ConnectionString))
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter("usp_GetProducts", con))
                    {
                        DataTable dt = new DataTable();
                        adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                        if (categoryid == null)
                        {
                            adapter.Fill(dt);
                            return dt;
                        }
                        else
                        {
                            adapter.SelectCommand.Parameters.AddWithValue("@CategoryId", categoryid);
                            adapter.Fill(dt);
                            return dt;
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}