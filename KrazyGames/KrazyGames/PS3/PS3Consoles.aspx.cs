using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

//To allow interaction with the data access layer
using DataAccessLayer;

using System.Data;

namespace KrazyGames.PS3
{
    public partial class PS3Consoles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //New instance of DataAccess object to get products
            DataAccess search = new DataAccess();
            if (!IsPostBack)
            {
                //Setting up the grid view
                GridView1.PageSize = 25;
                GridView1.AutoGenerateColumns = false;
                GridView1.AllowPaging = true;

                //Setting up rice range
                tbPriceMax.Text = "10000";
                tbPriceMin.Text = "0";
            }

            //Declaring a regex object to check against for valid search entries
            Regex r = new Regex("^[a-zA-Z0-9]*$");
            //If the search entry is alpha numeric and not equal to the placeholder text
            if (r.IsMatch(SearchTextBox.Text) && SearchTextBox.Text != "Search within results")
            {
                //Set the search term for the search object
                search.searchTerm = SearchTextBox.Text;
            }
            else
            {
                //otherwise the search term is empty
                search.searchTerm = "";
            }

            string minPrice = tbPriceMin.Text;
            string maxPrice = tbPriceMax.Text;

            //Call the method to search for the products from the database now that the search parameters have been set
            DataView dv = search.getPS3("consoles", minPrice, maxPrice);

            //Sort the DataView on the values of the Sort By and Sort Direction drop down boxes
            dv.Sort = SortByList.SelectedValue + " " + SortDirectionList.SelectedValue;
            //Set the Page Size to the currently selected page size
            GridView1.PageSize = Convert.ToInt32(DropDownList1.SelectedValue);

            //Connecting gridview to the sorted dataview
            GridView1.DataSource = dv;
            GridView1.DataBind();

            //Set the results label to the number of rows in the data view
            lblResults.Text = dv.Count.ToString();
        }

        //Method to take to details page
        protected void lnkbtnDetails_Command(object sender, CommandEventArgs e)
        {
            //Redriect to the details page with the product ID as the query string parameter
            if (e.CommandName == "Details")
            {
                Response.Redirect("/Home/Details.aspx?ID=" + e.CommandArgument);
            }
        }
        //Method to add to wishlist
        protected void lnkbtnWishlist_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Wishlist")
            {
                //If the user is authenticated
                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    //Create a new instance of the DataAccess object and call the addwishlist method to add the item to the user's wishlist
                    DataAccess wishlist = new DataAccess();
                    wishlist.addWishlist(e.CommandArgument.ToString(), HttpContext.Current.User.Identity.Name.ToString());
                }
                //If the user is not logged in then redriect to the login page with this page as the return URL
                else
                {
                    var returnUrl = Request.RawUrl;
                    Response.Redirect(String.Concat("/Login/Logon.aspx", "?ReturnUrl=", returnUrl));
                }
            }
        }
        //Method to add to shopping cart
        protected void lnkbtnShoppingCart_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "ShoppingCart")
            {
                KrazyGames.Cart.basket.AddItem(Convert.ToInt32(e.CommandArgument));
            }
        }
        //Method to handle page index change
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //Set the page of the grid view to the one selected
            GridView1.PageIndex = e.NewPageIndex;
            //Bind to show changes
            GridView1.DataBind();
        }
    }
}