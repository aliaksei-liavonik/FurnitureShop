using FurnitureShop.Core.Services.DataAccess.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace FurnitureShop.Core.Services.DataAccess
{
    public class DbConfiguration :
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
            return;
        }

        public void Configure(EntityTypeBuilder<Address> builder)
        {
            return;
        }

        public void Configure(EntityTypeBuilder<Category> builder)
        {
            return;
        }

        public void Configure(EntityTypeBuilder<Review> builder)
        {
            return;
        }

        public void Configure(EntityTypeBuilder<Complaint> builder)
        {
            return;
        }

        public void Configure(EntityTypeBuilder<Product> builder)
        {
            return;
        }
    }
}
