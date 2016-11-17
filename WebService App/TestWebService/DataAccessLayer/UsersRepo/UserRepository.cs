using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using Model;

namespace DataAccessLayer.UsersRepo
{
    public class UserRepository : IUserRepository
    {

        MyHealthManagerEntities Context;

        public UserRepository()
        {
            Context = new MyHealthManagerEntities();
        }

        public IEnumerable<object> get_UserInfoCatalog()
        {
                var users = from tUser in Context.Users
                            select new
                            {
                                tUserId = tUser.UserId,
                                tUserName = tUser.UserName,
                            };

                return users.AsEnumerable();
        }

        public Users get_UserInfo()
        {
            return (from tUser in Context.Users select tUser).FirstOrDefault();
        }
    }
}
