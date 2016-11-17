using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using Model;

namespace DataAccessLayer.UsersRepo
{
    public interface IUserRepository
    {
        IEnumerable<object> get_UserInfoCatalog();

        Users get_UserInfo();
    }
}
