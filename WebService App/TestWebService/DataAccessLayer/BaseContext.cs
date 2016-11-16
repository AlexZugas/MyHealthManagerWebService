using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using Model;

namespace DataAccessLayer
{
    public partial class MyHealthManagerEntities : DbContext
    {
        public MyHealthManagerEntities() : base("name=MYHEALTHMANAGEREntities")
        {
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }

        public virtual DbSet<Container> Containers { get; set; }
        public virtual DbSet<Diet> Diets { get; set; }
        public virtual DbSet<Product> Products{ get; set; }
        public virtual DbSet<ProductType> ProductTypes{ get; set; }
        public virtual DbSet<User> Users{ get; set; }
        public virtual DbSet<UserDiets> UserDiets{ get; set; }
        public virtual DbSet<UserProducts> UserProducts{ get; set; }
    }
}
