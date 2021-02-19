
using System.Web.Http;
using DataAccess.DAL;
using DataAccess.Model;

namespace APIs.Controllers
{

    public class UserLoginController : ApiController
    {
        User_DAL obj = new User_DAL();
        public string Get(string FirstName, string FamilyName, string Email, string Password, string Address, string State, string Country, string PostalCode)
        {
            try
            {
                User usr = new User { Address = Address, FirstName = FirstName, FamilyName = FamilyName, Email = Email, Password = Password, State = State, Country = Country, PostalCode = PostalCode };                
                obj.AddUser(usr);
                return "Success";
            }
            catch (System.Exception ex)
            {

                return ex.Message;
            }
        }




        public string Get(string email)
        {            
            return obj.CheckUsername(email).ToString();
        }

        // DELETE api/values/5

    }
}
