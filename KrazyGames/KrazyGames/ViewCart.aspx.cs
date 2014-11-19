using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KrazyGames
{
    public partial class ViewCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                BindData();
        }

        protected void BindData()
        {
            gvShoppingCart.DataSource = Cart.basket.Items;
            gvShoppingCart.DataBind();
        }

        protected void gvShoppingCart_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // If we are binding the footer row, let's add in our total
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[3].Text = "Total: " + Cart.basket.GetSubTotal().ToString("C");
            }
        }

        /**
         * This is the method that responds to the Remove button's click event
         */
        protected void gvShoppingCart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                int productId = Convert.ToInt32(e.CommandArgument);
                Cart.basket.RemoveItem(productId);
            }
            BindData();
        }

        protected void btnUpdateCart_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gvShoppingCart.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    // We'll use a try catch block in case something other than a number is typed in
                    // If so, we'll just ignore it.
                    try
                    {
                        // Get the productId from the GridView's datakeys
                        int productId = Convert.ToInt32(gvShoppingCart.DataKeys[row.RowIndex].Value);
                        // Find the quantity TextBox and retrieve the value
                        int quantity = int.Parse(((TextBox)row.Cells[1].FindControl("txtQuantity")).Text);
                        Cart.basket.SetItemQuantity(productId, quantity);
                    }
                    catch (FormatException) { }
                }
            }

            BindData();
        }


    }
}