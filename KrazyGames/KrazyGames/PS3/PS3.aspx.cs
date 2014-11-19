using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//To allow interaction with the data access layer
using DataAccessLayer;
using System.Text.RegularExpressions;
using System.Text;
using System.Data;

public partial class PS3 : System.Web.UI.Page
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

            //Setting up ratings check box list
            cblRating.DataSource = search.getRatings();
            cblRating.DataValueField = "RatingID";
            cblRating.DataTextField = "RatingName";
            cblRating.DataBind();
            //Check all the items by default
            foreach (ListItem li in cblRating.Items)
            {
                //li.Selected = true;
                li.Enabled = true;
            }

            //Setting up genre check box list
            cblGenre.DataSource = search.getGenres();
            cblGenre.DataValueField = "GenreID";
            cblGenre.DataTextField = "GenreName";
            cblGenre.DataBind();
            //Check all the items by default
            foreach (ListItem li in cblGenre.Items)
            {
                //li.Selected = true;
                li.Enabled = true;
            }

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

        //declare bool for whether or not we will refine by genre and initialise to false;
        bool checkGenres = false;
        //Create a new empty list that will hold the genres that will be checked by the user
        List<string> genresChecked = new List<string>();
        //For every item in the genre check list
        foreach (ListItem item in cblGenre.Items)
        {
            //If it is checked, add it to the string builder
            if (item.Selected == true)
            {
                //We will be refining by genre to set to true
                checkGenres = true;
                //Add the value of the checkbox to the list to compare with the products genres
                genresChecked.Add(item.Value.ToString());
            }
        }

        //declare bool for whether or not we will refine by ratings and initialise to false;
        bool checkRatings = false;
        //Create a new empty list to hold the ratings that will be checked by the user
        List<string> ratingsChecked = new List<string>();
        //For every item in the rating check list
        foreach (ListItem item in cblRating.Items)
        {
            //If the item is selected
            if (item.Selected == true)
            {
                //We will be refining by rating to set to true
                checkRatings = true;
                //Add the value of the checkbox to the list to compare with the products ratings
                ratingsChecked.Add(item.Value.ToString());
            }
        }

        //Strings to hold values of price search range
        string minPrice = tbPriceMin.Text;
        string maxPrice = tbPriceMax.Text;

        //Call the method to search for the products from the database now that the search parameters have been set
        DataView dv = search.getPS3("all", minPrice, maxPrice);

        //Sort the DataView on the values of the Sort By and Sort Direction drop down boxes
        dv.Sort = SortByList.SelectedValue + " " + SortDirectionList.SelectedValue;
        //Set the Page Size to the currently selected page size
        GridView1.PageSize = Convert.ToInt32(DropDownList1.SelectedValue);

        //Create a new data table with the same schema as the dataview that the products will be added to if they match the search criteria
        DataTable dt = dv.ToTable().Clone();

        //Loop through data view
        foreach (DataRowView rowView in dv)
        {
            //Create a row for every row
            DataRow row = rowView.Row;
            //Get all the genres for this product
            List<string> genres = search.getGenres(row["ProductID"].ToString());
            //Get all the ratings for this product
            List<string> ratings = search.getRatings(row["ProductID"].ToString());
            //Check if any genres match the search criteria
            var genreResults = genresChecked.Intersect(genres);
            //Check if any ratings match the search criteria
            var ratingResults = ratingsChecked.Intersect(ratings);
            //If the user is searching by both genre and rating
            if (checkGenres && checkRatings)
            {
                //If there was a match add the row
                if (genreResults.Count() > 0 && ratingResults.Count() > 0)
                {
                    dt.ImportRow(row);
                }
            }
            //If the user is only searching by genre
            else if (checkGenres)
            {
                //If there was a match add the row
                if (genreResults.Count() > 0)
                {
                    dt.ImportRow(row);
                }
            }
            //If the user is only searching by Rating
            else if (checkRatings)
            {
                //If there was a match add the row
                if (ratingResults.Count() > 0)
                {
                    dt.ImportRow(row);
                }
            }
            //The user is not searching by either so add the row to the data table 
            else
            {
                dt.ImportRow(row);
            }
        }

        //Connecting gridview to the sorted dataview
        GridView1.DataSource = dt;
        //Bind to show changes
        GridView1.DataBind();

        //Set the results label to the number of rows in the data table
        lblResults.Text = dt.Rows.Count.ToString();
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