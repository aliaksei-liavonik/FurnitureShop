using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using FurnitureShop.Core.Services.DataAccess.Entities;
namespace FurnitureShop.Core.Services.DataAccess
{
    public class DbConfiguration:
        IEntityTypeConfiguration<Order>,
        IEntityTypeConfiguration<Address>,
        IEntityTypeConfiguration<Category>,
        IEntityTypeConfiguration<Review>,
        IEntityTypeConfiguration<Complaint>,
        IEntityTypeConfiguration<Product>
    {
        public void Configure(EntityTypeBuilder<Order> builder)
        {
            // do zobaczenia jak jest w mindy
            
        }
        public void Configure(EntityTypeBuilder<Address> builder)
        {
            
        }
        public void Configure(EntityTypeBuilder<Category> builder)
        {
            
        }
        public void Configure(EntityTypeBuilder<Review> builder)
        {
            
        }
        public void Configure(EntityTypeBuilder<Complaint> builder)
        {
            
        }
        public void Configure(EntityTypeBuilder<Product> builder)
        {
            
        }
    }
}