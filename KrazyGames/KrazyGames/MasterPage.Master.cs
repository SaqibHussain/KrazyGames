using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using DataAccessLayer;
using System.Data;

namespace KrazyGames
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Set up post url for wishlist
            lnkbtnWishList.PostBackUrl = "/MyAccount/Wishlist.aspx";
            //If the user is logged in
            if (HttpContext.Current.Request.IsAuthenticated)
            {
                //New object
                DataAccess info = new DataAccess();
                //Create new dataview and fill with the logged in user's info
                DataView dv = info.getUserInfo(HttpContext.Current.User.Identity.Name.ToString());
                //Set the label's text to the first and last name
                lblLoginStatus.Text = "Welcome, " + dv[0][1].ToString() + " " + dv[0][2].ToString();
                //New dataview declared and filled with the wishlist of currently logged in user
                DataView wishlist = info.getWishlist(HttpContext.Current.User.Identity.Name.ToString());
                lnkbtnWishList.Text = wishlist.Count.ToString() + " Items in your Wishlist";
                lnkbtnWishList2.Text = wishlist.Count.ToString() + " Items in your Wishlist";
            }
            //If the user is not logged in
            else
            {
                //Set the name label to empty
                lblLoginStatus.Text = "";
                //Wishlist label to ask to login
                lnkbtnWishList.Text = "Please login to view your wishlist";
                lnkbtnWishList2.Text = "";
            }
            //Set cart link quantity
            //lnkbtnCart.Text =
            int i = Cart.basket.GetItemsInBasket();
            if (i > 0)
            {
                lnkbtnCart.Text = i.ToString() + " Items in your Basket";
                lnkbtnBasket.Text = i.ToString() + " Items in your Basket";
            }
            else
            {
                lnkbtnCart.Text = "Your basket is empty";
                lnkbtnBasket.Text = "Your basket is empty";
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string s = tbSearch.Text;
            s.Replace('\u0020', '\u0025');
            //s = Server.UrlEncode(s);
            Response.Redirect("/Home/Search.aspx?searchterm=" + s);
        }
    }
}