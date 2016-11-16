using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer.Users;
using Model;

namespace BusinessLogicLayer.Users
{
    public class UserLogic
    {
        IUserRepository _userRepository = new UserRepository();

        public List<object> get_UserInfoCatalog()
        {
            return _userRepository.get_UserInfoCatalog().ToList();
        }

        public User get_UserInfo()
        {
            return _userRepository.get_UserInfo();
        }
    }
}
