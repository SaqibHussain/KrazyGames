using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Text;

using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace DataAccessLayer
{
    public class DataAccess
    {
        #region Declarations
        private string _searchTerm = "";

        public string searchTerm
        {
            get { return _searchTerm; }
            set { _searchTerm = value; }
        }

        //Delare empty command
        private string cmd = "";
        //Setting up connection string
        private string cs = ConfigurationManager.ConnectionStrings["KrazyGames"].ConnectionString;
        #endregion

        #region Methods to pull products from the database
        public DataView search(string s, string minPrice, string maxPrice)
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                string term = "%";
                string[] words = s.Split(' ');
                foreach (string word in words)
                {
                    term += word + "%";
                }
                SqlCommand spcmd = new SqlCommand("spSearch", conn);
                spcmd.CommandType = System.Data.CommandType.StoredProcedure;
                spcmd.Parameters.AddWithValue("@name", term);
                spcmd.Parameters.AddWithValue("@minprice", minPrice);
                spcmd.Parameters.AddWithValue("@maxprice", maxPrice);
                //Adapters are connecitonless. Doesn't keep a connection alive with the database.
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = spcmd;
                //Once we connect to the database we want to pull everything into a datatable
                DataTable dt = new DataTable();
                //Use the data adapter to suck up everything from the database and fill the datatable
                //Filling the DataTable with values
                da.Fill(dt);
                //Create a DataView from the DataTable to allow sorting
                DataView dv = new DataView(dt);
                //Return the dataview
                return dv;
            }
        }

        public DataView getXbox(string s, string minPrice, string maxPrice)
        {
            //Use the word "using" for opening up database automatically without worrying about having to close the connection
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand spcmd = new SqlCommand();
                spcmd.Connection = conn;
                spcmd.CommandType = System.Data.CommandType.StoredProcedure;
                spcmd.Parameters.AddWithValue("@searchterm", "%" + searchTerm + "%");
                spcmd.Parameters.AddWithValue("@minprice", minPrice);
                spcmd.Parameters.AddWithValue("@maxprice", maxPrice);
                switch (s)
                {
                    case "all":
                        spcmd.CommandText = "spGetXboxAll";
                        break;
                    case "accessories":
                        spcmd.CommandText = "spGetXboxAccessories";
                        break;
                    case "consoles":
                        spcmd.CommandText = "spGetXboxConsoles";
                        break;
                    case "games":
                        spcmd.CommandText = "spGetXboxGames";
                        break;
                }
                //Adapters are connecitonless. Doesn't keep a connection alive with the database.
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = spcmd;
                //Once we connect to the database we want to pull everything into a datatable
                DataTable dt = new DataTable();
                //Use the data adapter to suck up everything from the database and fill the datatable
                //Filling the DataTable with values
                da.Fill(dt);
                //Create a DataView from the DataTable to allow sorting
                DataView dv = new DataView(dt);
                //Return the dataview
                return dv;
            }
        }

        public DataView getPS3(string s, string minPrice, string maxPrice)
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand spcmd = new SqlCommand();
                spcmd.Connection = conn;
                spcmd.CommandType = System.Data.CommandType.StoredProcedure;
                spcmd.Parameters.AddWithValue("@searchterm", "%" + searchTerm + "%");
                spcmd.Parameters.AddWithValue("@minprice", minPrice);
                spcmd.Parameters.AddWithValue("@maxprice", maxPrice);
                switch (s)
                {
                    case "all":
                        spcmd.CommandText = "spGetPS3All";
                        break;
                    case "accessories":
                        spcmd.CommandText = "spGetPS3Accessories";
                        break;
                    case "consoles":
                        spcmd.CommandText = "spGetPS3Consoles";
                        break;
                    case "games":
                        spcmd.CommandText = "spGetPS3Games";
                        break;
                }
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = spcmd;
                DataTable dt = new DataTable();
                da.Fill(dt);
                DataView dv = new DataView(dt);
                return dv;
            }
        }

        public DataView getWii(string s, string minPrice, string maxPrice)
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand spcmd = new SqlCommand();
                spcmd.Connection = conn;
                spcmd.CommandType = System.Data.CommandType.StoredProcedure;
                spcmd.Parameters.AddWithValue("@searchterm", "%" + searchTerm + "%");
                spcmd.Parameters.AddWithValue("@minprice", minPrice);
                spcmd.Parameters.AddWithValue("@maxprice", maxPrice);
                switch (s)
                {
                    case "all":
                        spcmd.CommandText = "spGetPS3All";
                        break;
                    case "accessories":
                        spcmd.CommandText = "spGetPS3All";
                        break;
                    case "consoles":
                        spcmd.CommandText = "spGetPS3All";
                        break;
                    case "games":
                        spcmd.CommandText = "spGetPS3All";
                        break;
                }
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = spcmd;
                DataTable dt = new DataTable(); 
                da.Fill(dt);
                DataView dv = new DataView(dt);
                return dv;
            }
        }

        public DataView getHandheld(string s, string minPrice, string maxPrice)
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand spcmd = new SqlCommand();
                spcmd.Connection = conn;
                spcmd.CommandType = System.Data.CommandType.StoredProcedure;
                spcmd.Parameters.AddWithValue("@searchterm", "%" + searchTerm + "%");
                spcmd.Parameters.AddWithValue("@minprice", minPrice);
                spcmd.Parameters.AddWithValue("@maxprice", maxPrice);
                switch (s)
                {
                    case "all":
                        spcmd.CommandText = "spGetHandheldAll";
                        break;
                    case "PSPaccessories":
                        spcmd.CommandText = "spGetPSPAccessories";
                        break;
                    case "PSPconsoles":
                        spcmd.CommandText = "spGetPSPConsoles";
                        break;
                    case "PSPgames":
                        spcmd.CommandText = "spGetPSPGames";
                        break;
                    case "DSaccessories":
                        spcmd.CommandText = "spGetDSAccessories";
                        break;
                    case "DSconsoles":
                        spcmd.CommandText = "spGetDSConsoles";
                        break;
                    case "DSgames":
                        spcmd.CommandText = "spGetDSGames";
                        break;
                }
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = spcmd;
                DataTable dt = new DataTable(); 
                da.Fill(dt);
                DataView dv = new DataView(dt);
                return dv;
            }
        }

        public DataTable getGenres()
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand spcmd = new SqlCommand();
                spcmd.Connection = conn;
                spcmd.CommandType = System.Data.CommandType.StoredProcedure;
                spcmd.CommandText = "spGetGenres";
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = spcmd;
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }

        public List<string> getGenres(string s)
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand spcmd = new SqlCommand();
                spcmd.Connection = conn;
                spcmd.CommandType = System.Data.CommandType.StoredProcedure;
                spcmd.CommandText = "spGetGenresForProduct";
                spcmd.Parameters.AddWithValue("@searchterm", s);
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = spcmd;
                DataTable dt = new DataTable();
                da.Fill(dt);
                DataView dv = dt.AsDataView();
                List<string> genres = new List<string>();
                foreach (DataRowView rowView in dv)
                {
                    DataRow row = rowView.Row;
                    genres.Add(row["GenreID"].ToString());
                }
                return genres;
            }
        }

        public DataTable getRatings()
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand spcmd = new SqlCommand();
                spcmd.Connection = conn;
                spcmd.CommandType = System.Data.CommandType.StoredProcedure;
                spcmd.CommandText = "spGetRatings";
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = spcmd;
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }

        public List<string> getRatings(string s)
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand spcmd = new SqlCommand();
                spcmd.Connection = conn;
                spcmd.CommandType = System.Data.CommandType.StoredProcedure;
                spcmd.CommandText = "spGetRatingsForProduct";
                spcmd.Parameters.AddWithValue("@searchterm", s);
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = spcmd;
                DataTable dt = new DataTable();
                da.Fill(dt);
                DataView dv = dt.AsDataView();
                List<string> ratings = new List<string>();
                foreach (DataRowView rowView in dv)
                {
                    DataRow row = rowView.Row;
                    ratings.Add(row["RatingID"].ToString());
                }
                return ratings;
            }
        }
        #endregion

        #region Login and Create User
        //Method to check if a user's submitted login details are valid
        public bool login(string email, string password)
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand spcmd = new SqlCommand();
                spcmd.Connection = conn;
                spcmd.CommandType = System.Data.CommandType.StoredProcedure;
                spcmd.CommandText = "spLogin";
                spcmd.Parameters.AddWithValue("@email", email);
                spcmd.Parameters.AddWithValue("@password", password);
                conn.Open();
                int i = Convert.ToInt32(spcmd.ExecuteScalar());
                conn.Close();
                if (i > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }
        //method to return the ID of a user for a given email
        public string getID(string email)
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand spcmd = new SqlCommand();
                spcmd.Connection = conn;
                spcmd.CommandType = System.Data.CommandType.StoredProcedure;
                spcmd.CommandText = "spGetID";
                spcmd.Parameters.AddWithValue("@email", email);
                conn.Open();
                string s = spcmd.ExecuteScalar().ToString();
                conn.Close();
                return s;
            }
        }
        //Method to check if email already exists in database
        public bool emailExists(string email)
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand spcmd = new SqlCommand();
                spcmd.Connection = conn;
                spcmd.CommandType = System.Data.CommandType.StoredProcedure;
                spcmd.CommandText = "spEmailExists";
                spcmd.Parameters.AddWithValue("@email", email);
                conn.Open();
                int i = Convert.ToInt32(spcmd.ExecuteScalar());
                conn.Close();
                if (i > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }
        //Sign up with all details
        public bool signUp(string title, string fname, string sname, string email, string phone, string mobile, string dob, string country, string password)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(cs))
                {
                    SqlCommand spcmd = new SqlCommand();
                    spcmd.Connection = conn;
                    spcmd.CommandType = System.Data.CommandType.StoredProcedure;
                    spcmd.CommandText = "spSignUp";
                    spcmd.Parameters.AddWithValue("@title", title);
                    spcmd.Parameters.AddWithValue("@fname", fname);
                    spcmd.Parameters.AddWithValue("@sname", sname);
                    spcmd.Parameters.AddWithValue("@email", email);
                    spcmd.Parameters.AddWithValue("@phone", phone);
                    spcmd.Parameters.AddWithValue("@mobile", mobile);
                    spcmd.Parameters.AddWithValue("@dob", dob);
                    spcmd.Parameters.AddWithValue("@country", country);
                    spcmd.Parameters.AddWithValue("@password", password);
                    conn.Open();
                    spcmd.ExecuteNonQuery();
                    conn.Close();
                }
                return true;
            }
            catch
            {
                return false;
            }
        }
  
        #endregion

        #region Methods related to Customer info 
        //Pull all the details for a given user
        public DataView getUserInfo(string ID)
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand spcmd = new SqlCommand();
                spcmd.Connection = conn;
                spcmd.CommandType = System.Data.CommandType.StoredProcedure;
                spcmd.CommandText = "spGetUserInfo";
                spcmd.Parameters.AddWithValue("@ID", ID);
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = spcmd;
                DataTable dt = new DataTable();
                da.Fill(dt);
                DataView dv = new DataView(dt);
                return dv;
            }
        }
        //Get the country for a given user
        public string getUserCountry(string CountryID)
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand spcmd = new SqlCommand();
                spcmd.Connection = conn;
                spcmd.CommandType = System.Data.CommandType.StoredProcedure;
                spcmd.CommandText = "spGetUserCountry";
                spcmd.Parameters.AddWithValue("@CountryID", CountryID);
                conn.Open();
                string s = spcmd.ExecuteScalar().ToString();
                conn.Close();
                return s;
            }
        }
        //Return a list of countries
        public List<ListItem> getCountries()
        {
            List<ListItem> list = new List<ListItem>();
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand spcmd = new SqlCommand();
                spcmd.Connection = conn;
                spcmd.CommandType = System.Data.CommandType.StoredProcedure;
                spcmd.CommandText = "spGetCountries";
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = spcmd;
                DataTable dt = new DataTable();
                da.Fill(dt);
                DataView dv = new DataView(dt);
                foreach (DataRowView rowView in dt.AsDataView())
                {
                    DataRow row = rowView.Row;
                    ListItem Item = new ListItem();
                    Item.Value = row[0].ToString();
                    Item.Text = row[1].ToString();
                    string s = row[0].ToString();
                    list.Add(Item);
                }
                return list;
            }
        }
        //Get the reviews written by a given user
        public DataView getReviews(string ID)
        {
           using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand spcmd = new SqlCommand();
                spcmd.Connection = conn;
                spcmd.CommandType = System.Data.CommandType.StoredProcedure;
                spcmd.CommandText = "spGetReviews";
                spcmd.Parameters.AddWithValue("@ID", ID);
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = spcmd;
                DataTable dt = new DataTable();
                da.Fill(dt);
                DataView dv = new DataView(dt);
                return dv;
            }
        }
        //Method to delete a review by reviewID
        public void deleteReview(string ID)
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand spcmd = new SqlCommand();
                spcmd.Connection = conn;
                spcmd.CommandType = System.Data.CommandType.StoredProcedure;
                spcmd.CommandText = "spDeleteReview";
                spcmd.Parameters.AddWithValue("@ID", ID);
                conn.Open();
                spcmd.ExecuteNonQuery();
                conn.Close();
            }
        }
        //Method to update the user details for a given user
        public void updateUser(string ID, string title, string fname, string sname, string email, string phone, string mobile, string DOB, int CountryID)
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand spcmd = new SqlCommand();
                spcmd.Connection = conn;
                spcmd.CommandType = System.Data.CommandType.StoredProcedure;
                spcmd.CommandText = "spUpdateUser";
                spcmd.Parameters.AddWithValue("@ID", ID);
                spcmd.Parameters.AddWithValue("@title", title);
                spcmd.Parameters.AddWithValue("@fname", fname);
                spcmd.Parameters.AddWithValue("@sname", sname);
                spcmd.Parameters.AddWithValue("@email", email);
                spcmd.Parameters.AddWithValue("@phone", phone);
                spcmd.Parameters.AddWithValue("@mobile", mobile);
                spcmd.Parameters.AddWithValue("@dob", DOB);
                spcmd.Parameters.AddWithValue("@country", CountryID);
                conn.Open();
                spcmd.ExecuteNonQuery();
                conn.Close();
            }
        }
        //Method to return the wishlist of a given user
        public DataView getWishlist(string ID)
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand spcmd = new SqlCommand();
                spcmd.Connection = conn;
                spcmd.CommandType = System.Data.CommandType.StoredProcedure;
                spcmd.CommandText = "spGetWishList";
                spcmd.Parameters.AddWithValue("@ID", ID);
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = spcmd;
                DataTable dt = new DataTable();
                da.Fill(dt);
                DataView dv = new DataView(dt);
                return dv;
            }
        }
        //Method to remove an item from a wishlist for a given wishlist ID
        public void removeWishlist(string  ID)
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand spcmd = new SqlCommand();
                spcmd.Connection = conn;
                spcmd.CommandType = System.Data.CommandType.StoredProcedure;
                spcmd.CommandText = "spRemoveWishList";
                spcmd.Parameters.AddWithValue("@ID", ID);
                conn.Open();
                spcmd.ExecuteNonQuery();
                conn.Close();
            }
        }
        //Method to add a product to a users' wishlist
        public void addWishlist(string productID, string userID)
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand spcmd = new SqlCommand();
                spcmd.Connection = conn;
                spcmd.CommandType = System.Data.CommandType.StoredProcedure;
                spcmd.CommandText = "spCountWishList";
                spcmd.Parameters.AddWithValue("@ProductID", productID);
                spcmd.Parameters.AddWithValue("@UserID", userID);
                //cmd = "select count(*) from tblWishlist where ProductID = " + productID + " AND CustomerID = " + userID + ";";
                conn.Open();
                int i = Convert.ToInt32(spcmd.ExecuteScalar());
                conn.Close();
                //If not already in wishlist
                if (i == 0)
                {
                    spcmd = new SqlCommand();
                    spcmd.Connection = conn;
                    spcmd.CommandType = System.Data.CommandType.StoredProcedure;
                    spcmd.CommandText = "spInsertWishList";
                    spcmd.Parameters.AddWithValue("@ProductID", productID);
                    spcmd.Parameters.AddWithValue("@UserID", userID);
                    conn.Open();
                    spcmd.ExecuteNonQuery();
                    conn.Close();
                }
            }
        }
        //public 
        #endregion

        #region Methods for details page

        public DataView pGetInfo(string productID)
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand spcmd = new SqlCommand();
                spcmd.Connection = conn;
                spcmd.CommandType = System.Data.CommandType.StoredProcedure;
                spcmd.CommandText = "spGetProductInfo";
                spcmd.Parameters.AddWithValue("@ProductID", productID);
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = spcmd;
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt.AsDataView();
            }
        }

        public DataView getProductReviews(string productID)
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand spcmd = new SqlCommand();
                spcmd.Connection = conn;
                spcmd.CommandType = System.Data.CommandType.StoredProcedure;
                spcmd.CommandText = "spGetProductReviews";
                spcmd.Parameters.AddWithValue("@ProductID", productID);
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = spcmd;
                DataTable dt = new DataTable();
                da.Fill(dt);
                DataView dv = dt.AsDataView();
                return dv;
            }
        }

        public void submitReview(string productID, string userID, string rating, string review)
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand spcmd = new SqlCommand();
                spcmd.Connection = conn;
                spcmd.CommandType = System.Data.CommandType.StoredProcedure;
                spcmd.CommandText = "spSubmitReview";
                spcmd.Parameters.AddWithValue("@ProductID", productID);
                spcmd.Parameters.AddWithValue("@UserID", userID);
                spcmd.Parameters.AddWithValue("@Rating", rating);
                spcmd.Parameters.AddWithValue("@Review", review);
                conn.Open();
                spcmd.ExecuteNonQuery();
                conn.Close();
            }

        }


        public DataView pGetGameRating(string ID)
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand spcmd = new SqlCommand();
                spcmd.Connection = conn;
                spcmd.CommandType = System.Data.CommandType.StoredProcedure;
                spcmd.CommandText = "spGetGameRating";
                spcmd.Parameters.AddWithValue("@ProductID", ID);
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = spcmd;
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt.AsDataView();
            }
        }

        public string pGetGameGenre(string ID)
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand spcmd = new SqlCommand();
                spcmd.Connection = conn;
                spcmd.CommandType = System.Data.CommandType.StoredProcedure;
                spcmd.CommandText = "spGetGameGenre";
                spcmd.Parameters.AddWithValue("@ProductID", ID);
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = spcmd;
                DataTable dt = new DataTable();
                da.Fill(dt);
                StringBuilder sb = new StringBuilder();
                foreach (DataRowView rowView in dt.AsDataView())
                {
                    DataRow row = rowView.Row;
                    sb.Append(row["GenreName"]);
                    sb.Append(", ");
                }
                return sb.ToString().TrimEnd(' ').TrimEnd(',');
            }
        }

   
    
        #endregion

    }
}