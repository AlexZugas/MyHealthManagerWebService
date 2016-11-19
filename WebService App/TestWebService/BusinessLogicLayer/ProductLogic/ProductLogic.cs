using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;
using Model;

namespace BusinessLogicLayer
{
    public class ProductLogic
    {
        ProductRepository productBLL = new ProductRepository();

        public Product get_ProductByCode(string Code)
        {
            Product product = new Product();
            product = productBLL.get_Product(Code);
            return product;
        }
    }
}
