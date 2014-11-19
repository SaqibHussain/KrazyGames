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
    public partial class EditAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataAccess info = new DataAccess();

                DataView dv = new DataView();
                dv = info.getUserInfo(HttpContext.Current.User.Identity.Name.ToString());

                tbFirstName.Text = dv[0][1].ToString();
                tbSurname.Text = dv[0][2].ToString();
                ddlTitle.Items.Add("Mr");
                ddlTitle.Items.Add("Mrs");
                ddlTitle.Items.Add("Miss");
                ddlTitle.SelectedValue = dv[0][0].ToString();
                tbEmail.Text = dv[0][3].ToString();
                tbPhone.Text = dv[0][4].ToString();
                tbMobile.Text = dv[0][5].ToString();
                tbDateOfBirth.Text = dv[0][6].ToString();
                ddlCountry.Items.AddRange(info.getCountries().ToArray());
                ddlCountry.SelectedValue = dv[0][7].ToString();
            }
        }

        protected void btnEditAccount_Click(object sender, EventArgs e)
        {
            DataAccess info = new DataAccess();

            info.updateUser(HttpContext.Current.User.Identity.Name.ToString(), ddlTitle.SelectedValue,
                tbFirstName.Text, tbSurname.Text, tbEmail.Text, tbPhone.Text, tbMobile.Text, tbDateOfBirth.Text, Convert.ToInt32(ddlCountry.SelectedItem.Value));
            Response.Redirect("/MyAccount/MyAccount.aspx");
        }
    }
}