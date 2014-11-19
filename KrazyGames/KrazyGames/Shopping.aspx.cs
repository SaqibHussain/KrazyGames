// April 04

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Collections;

namespace KrazyGames
{
    public partial class ShoppingCart : System.Web.UI.Page
    {
        public class CartRow
        {
            public string id;
            public string name;
            public string price;
            public string items;
        }

        public class Cart
        {
            public System.Collections.ArrayList list = new ArrayList(20);
        }

        public Cart myCart = new Cart();
        public Cart GetCart() { return myCart; }

        public void Page_Load(object sender, System.EventArgs e)
        {
        }
    }
}