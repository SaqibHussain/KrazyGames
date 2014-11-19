using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using DataAccessLayer;

namespace KrazyGames.Login
{
    public partial class Login : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            DataAccess login = new DataAccess();
            if (login.login(txtEmail.Text, txtPass.Text))
            {
                //Successful login

                //Auth with the email
                FormsAuthentication.RedirectFromLoginPage(login.getID(txtEmail.Text), true);
            }
            else
            {
                //Wrong credentials
                lblLoginCheck.Text = "Wrong username or password, please try again";
            }

        }
    }
}

