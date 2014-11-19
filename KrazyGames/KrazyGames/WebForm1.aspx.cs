using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccessLayer;
using System.Data;

namespace KrazyGames
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataAccess pInfo = new DataAccess();
            DataView dv = pInfo.pGetGameRating("51");
            //string s = dv.Table.Rows[0]["Image"].ToString();
            string s = dv.Table.Rows[1]["Image"].ToString();
        

            ListView1.DataSource = dv;
            ListView1.DataBind();

            lvImageRating.DataSource = dv;
                lvImageRating.DataBind();

        }
    }
}