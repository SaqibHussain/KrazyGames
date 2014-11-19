using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccessLayer;
using System.Data;
using System.Text.RegularExpressions;
using System.Web.Security;

namespace KrazyGames.Login
{
    public partial class CreateUser : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataAccess info = new DataAccess();

                ddlTitle.Items.Add("Mr");
                ddlTitle.Items.Add("Mrs");
                ddlTitle.Items.Add("Miss");
                ddlCountry.Items.AddRange(info.getCountries().ToArray());

                DatePicker1.SelectedDate = DateTime.MaxValue;
            }
            lblCreateUser.Text = "";
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            //If a valid date has been selected, continue with sign up
            if (DatePicker1.SelectedDate != DateTime.MaxValue)
            {
                //If the mobile number is valid
                if (validNumber(tbMobile.Text.ToString()))
                {
                    //if the phone number is valid
                    if (validNumber(tbPhone.Text.ToString()))
                    {
                        //Check the email doesn't already exist in the database
                        DataAccess signup = new DataAccess();
                        //if the email already exists
                        if (signup.emailExists(tbEmail.Text)) { lblCreateUser.Text = "This email already exists"; }
                        //If the email doesn't already exist then continue with the sign up
                        else
                        {

                            //Sign up with all details
                            if (signup.signUp(ddlTitle.SelectedValue, tbFirstName.Text, tbSurname.Text, tbEmail.Text, tbPhone.Text, tbMobile.Text, DatePicker1.SelectedDate.Date.ToString("dd/MM/yyyy"), ddlCountry.SelectedValue, tbPassword.Text))
                            {
                                FormsAuthentication.RedirectFromLoginPage(signup.getID(tbEmail.Text), true);
                            }
                        }

                    }
                    else { lblCreateUser.Text = "Must enter a valid phone number equal to 11 digits"; }
                }
                //Invalid mobile number
                else { lblCreateUser.Text = "Must Enter a valid mobile number euqal to 11 digits"; }
            }
            //No date enetered so output label
            else { lblCreateUser.Text = "Must Enter a valid date"; }
        }

        //Check if a given number is valid
        protected bool validNumber(string number)
        {
            //Check if they have entered anything
            if (number != string.Empty)
            {
                //Check that it is a numerical value
                number = removeWhiteSpace(number);
                double d;
                bool isNum = double.TryParse(number, out d);
                //Check that it was able to parse into a number and is longer than or equal to 11 characters
                if (isNum && number.Length == 11) { return true; }
                else { return false; }
            }
            //They haven't entered a number so continue
            else { return true; }
        }

        //Method to remove white space from a string
        public string removeWhiteSpace(string s)
        {
            string pattern = "\\s+";
            string replacement = " ";
            Regex rgx = new Regex(pattern);
            string result = rgx.Replace(s, replacement);
            return result;
        }
    }
}