using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using Model;

namespace DataAccessLayer
{
    public class ProductRepository
    {
        MyHealthManagerEntities Context;

        public ProductRepository()
        {
            Context = new MyHealthManagerEntities();
        }

        public Product get_Product(string Code)
        {
            var product = (from tproduct in Context.Products
                          where tproduct.Code == Code
                          select tproduct).FirstOrDefault();

            return product;
        }
    }
}
