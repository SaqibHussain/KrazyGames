using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//To allow interaction with web config file
using System.Configuration;
//To allow Sql interaction
using System.Data.SqlClient;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }




    //protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    GridView1.PageSize = Convert.ToInt32(DropDownList1.SelectedValue);
    //    GridView1.DataBind();
    //}

    //protected void SortByList_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DataView dv = new DataView(dt);
    //    dv.Sort = SortByList.SelectedValue + " " + SortDirectionList.SelectedValue;
    //    GridView1.DataSource = dv;
    //    GridView1.DataBind();
    //}

    //protected void SortDirectionList_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DataSet ds = GridView1.DataSource as DataSet;
    //    DataView dv = new DataView(ds.Tables[0]);
    //    dv.Sort = SortByList.SelectedValue + " " + SortDirectionList.SelectedValue;
    //    GridView1.DataSource = dv;
    //    GridView1.DataBind();
    //}
}