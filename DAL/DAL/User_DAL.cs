
using DAL.DB;
using DataAccess.Model;
using System;
using System.Linq;


namespace DataAccess.DAL
{
    public class User_DAL
    {
        DataClassesAssDataContext dbContext = new DataClassesAssDataContext();
        public User GetUser(string email)
        {
            try
            {
                User obj;
                var usr = dbContext.tbl_users.Where(a => a.email == email).FirstOrDefault();
                if (usr != null)
                {
                    obj = new User
                    {
                        Id = usr.Id,
                        Address = usr.address,
                        FirstName = usr.first_name,
                        FamilyName = usr.family_name,
                        Country = usr.country,
                        Email = usr.email,
                        Password = usr.password,
                        PostalCode = usr.postal_code,
                        State = usr.state
                    };
                    return obj;
                }
                return null;
            }
            catch (Exception)
            {

                throw;
            }
        }
        public bool AddUser(User usr)
        {
            try
            {
                var obj = new tbl_user();
                obj.first_name = usr.FirstName;
                obj.family_name = usr.FamilyName;
                obj.email = usr.Email;
                obj.country = usr.Country;
                obj.address = usr.Address;
                obj.password = usr.Password;
                obj.postal_code = usr.PostalCode;
                obj.state = usr.State;
                dbContext.tbl_users.InsertOnSubmit(obj);
                dbContext.SubmitChanges();
                return true;
            }
            catch (Exception)
            {

                throw;
            }
        }

        public bool UpdateUser(User usr)
        {
            try
            {
                var obj = dbContext.tbl_users.Where(a => a.Id == usr.Id).FirstOrDefault();
                obj.first_name = usr.FirstName;
                obj.family_name = usr.FamilyName;
                obj.country = usr.Country;
                obj.address = usr.Address;
                obj.postal_code = usr.PostalCode;
                dbContext.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public bool CheckUsername(string email)
        {
            var obj = dbContext.tbl_users.Where(a => a.email == email).FirstOrDefault();
            if (obj != null)
            {
                return true;
            }
            else
            {
                return false;
            }

        }
    }
}