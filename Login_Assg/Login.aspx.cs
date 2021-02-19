
using DataAccess.DAL;
using DataAccess.Model;
using System;

namespace Login_Assg
{
    public partial class Login_ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                lblErr.Visible = false;
                User_DAL obj = new User_DAL();
                var usr = obj.GetUser(InputEmail.Text);
                if (usr != null)
                {
                    //Decrypting the alreday encrypted password
                    var password = Userdetail.Decrypt(usr.Password);

                    if (InputPassword.Text.Equals(password))
                    {
                        //Password match
                        Userdetail.Userdetails = usr;
                        Response.Redirect("UserDetailView.aspx");
                    }
                }
                else
                {
                    //Email does not exist
                    lblErr.Visible = true;
                    lblErr.Text = "Invalid Combination of Email and Password";
                }
            }
            catch (Exception ex)
            {
                lblErr.Visible = true;
                lblErr.Text = ex.Message;
            }
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignUp.aspx");
        }

       
    }
}