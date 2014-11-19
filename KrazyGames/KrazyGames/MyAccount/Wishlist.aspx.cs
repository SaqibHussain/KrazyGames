using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccessLayer;
using System.Data;

namespace KrazyGames.MyAccount
{
    public partial class Wishlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Setting up the grid view
                GridView1.PageSize = 25;
                GridView1.AutoGenerateColumns = false;
                GridView1.AllowPaging = true;
            }

            DataAccess info = new DataAccess();
            DataView dv = info.getWishlist(HttpContext.Current.User.Identity.Name.ToString());

            GridView1.DataSource = dv;
            GridView1.DataBind();
        }

        //Method to handle page index change
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //Set the page of the grid view to the one selected
            GridView1.PageIndex = e.NewPageIndex;
            //Bind to show changes
            GridView1.DataBind();
        }

        //Method to handle clicking of product name
        protected void lnkbtnDetails_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Details")
            {
                Response.Redirect("/Home/Details.aspx?ID=" + e.CommandArgument);
            }

        }

        //Method to handle delete button
        protected void lnkbtnDelete_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "DeleteRow")
            {
                DataAccess delete = new DataAccess();
                delete.removeWishlist(e.CommandArgument.ToString());
                Response.Redirect(Request.RawUrl);
            }

        }
    }
}