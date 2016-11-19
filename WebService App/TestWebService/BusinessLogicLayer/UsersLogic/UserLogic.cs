using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer.UsersRepo;
using Model;

namespace BusinessLogicLayer.UsersLogic
{
    public class UserLogic
    {
        IUserRepository _userRepository = new UserRepository();

        public List<object> get_UserInfoCatalog()
        {
            return _userRepository.get_UserInfoCatalog().ToList();
        }

        public Users get_UserInfo()
        {
            return _userRepository.get_UserInfo();
        }

        public object get_UserHealthInfo(int userId)
        {
            return _userRepository.get_UserHealthInfo(userId);
        }
    }
}
