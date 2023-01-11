using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyProject
{
    public partial class Mobiles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MyProject_BLL obj = new MyProject_BLL();
                DlProduct_Beverages.DataSource = obj.GetProducts(1);
                DlProduct_Beverages.DataBind();
            }
        }

        protected void DlProduct_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (Session["EmailId"] == null)
            {
                Button b1 = e.Item.FindControl("BtnAddToCart") as Button;
                b1.Enabled = false;
            }
        }

        protected void DlProduct_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Add")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Success", "alert('Product added to cart')", true);
            }
        }
    }
}