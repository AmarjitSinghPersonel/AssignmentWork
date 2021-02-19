using DataAccess.DAL;
using DataAccess.Model;
using System;


namespace Login_Assg
{
    public partial class UserDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Load user data from static object
                User usr = Userdetail.Userdetails;
                if (usr != null)
                {
                    //Populate data
                    InputFirstName.Text = usr.FirstName;
                    InputFamilyName.Text = usr.FamilyName;
                    InputAddress.Text = usr.Address;
                    InputCountry.Text = usr.Country;
                    InputPostal.Text = usr.PostalCode;
                    InputState.Text = usr.State;
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                User_DAL obj = new User_DAL();
                User usrOld = Userdetail.Userdetails;
                User usr = new User();
                usr.Id = usrOld.Id;
                usr.Password = usrOld.Password;
                usr.Email = usrOld.Email;

                usr.FirstName = InputFirstName.Text;
                usr.FamilyName = InputFamilyName.Text;
                usr.Address = InputAddress.Text;
                usr.Country = InputCountry.Text;
                usr.PostalCode = InputPostal.Text;
                usr.State = InputState.Text;
                if (usr.FirstName != usrOld.FirstName || usr.FamilyName != usrOld.FamilyName || usr.Address != usrOld.Address || usr.Country != usrOld.Country || usr.PostalCode!=usrOld.PostalCode || usr.State != usrOld.State)
                {
                    var result = obj.UpdateUser(usr);
                    if (result)
                    {
                        lblErr.Visible = true;
                        lblErr.Text = "Updated Successfully";
                        Userdetail.Userdetails = usr;
                    }
                }
                else
                {
                    lblErr.Visible = true;
                    lblErr.Text = "No value has been changed";
                }
            }
            catch (Exception ex)
            {

                lblErr.Visible = true;
                lblErr.Text = ex.Message;
            }

        }

        protected void Signout_Click(object sender, EventArgs e)
        {
            Userdetail.Userdetails = null;
            Response.Redirect("Login.aspx");
        }
    }
}