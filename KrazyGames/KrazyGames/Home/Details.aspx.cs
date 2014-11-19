using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using DataAccessLayer;
using System.Data;
using System.Web.UI.WebControls;

namespace KrazyGames
{
    public partial class Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string ID = Request.QueryString["ID"];
            if (ID != null)
            {
                DataAccess pInfo = new DataAccess();
                DataView dv = pInfo.pGetInfo(ID);

                imgProduct.ImageUrl = "/Images/Products/" + dv.Table.Rows[0]["Image"].ToString();
                lblProductName.Text = dv.Table.Rows[0]["Name"].ToString();
                lblReleaseDate.Text = dv.Table.Rows[0]["Release_Date"].ToString();
                lblGameGenre.Text = "Genres: " + pInfo.pGetGameGenre(ID);
                lblProductPrice.Text = "£" + dv.Table.Rows[0]["UnitPrice"].ToString();
                lblProductDescription.Text = "Description: " + dv.Table.Rows[0]["Description"].ToString();
                //lblReview.Text = pInfo.pGetReview(ID);
                lblQuantity.Text = dv.Table.Rows[0]["Quantity"].ToString();

                gvReviews.PageSize = 5;
                gvReviews.AllowPaging = true;
                gvReviews.AutoGenerateColumns = false;
                gvReviews.DataSource = pInfo.getProductReviews(ID);
                gvReviews.DataBind();

                lvImageRating.DataSource = pInfo.pGetGameRating(ID);
                lvImageRating.DataBind();
            }
            else
            {
                Response.Redirect("/Default.aspx");
            }
           
        }
        //Method to handle page index change
        protected void gvReviews_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //Set the page of the grid view to the one selected
            gvReviews.PageIndex = e.NewPageIndex;
            //Bind to show changes
            gvReviews.DataBind();
        }
        protected void btnAddToBasket_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void btnWishList_Click(object sender, ImageClickEventArgs e)
        {
            //If the user is authenticated
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                //Create a new instance of the DataAccess object and call the addwishlist method to add the item to the user's wishlist
                DataAccess wishlist = new DataAccess();
                wishlist.addWishlist(Request.QueryString["ID"], HttpContext.Current.User.Identity.Name.ToString());
                Response.Redirect(Request.RawUrl);
            }
            //If the user is not logged in then redriect to the login page with this page as the return URL
            else
            {
                var returnUrl = Request.RawUrl;
                Response.Redirect(String.Concat("/Login/Logon.aspx", "?ReturnUrl=", returnUrl));
            }
        }

        protected void btnReviewSubmit_Click(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                DataAccess review = new DataAccess();
                review.submitReview(Request.QueryString["ID"], HttpContext.Current.User.Identity.Name.ToString(), ddlRating.SelectedItem.Value, tbReview.Text);
            }
            //If the user is not logged in then redriect to the login page with this page as the return URL
            else
            {
                var returnUrl = Request.RawUrl;
                Response.Redirect(String.Concat("/Login/Logon.aspx", "?ReturnUrl=", returnUrl));
            }
        }
    }
}