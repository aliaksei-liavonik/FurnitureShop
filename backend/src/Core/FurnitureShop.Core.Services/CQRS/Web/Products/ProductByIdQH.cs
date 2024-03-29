using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Web.Products;
using FurnitureShop.Core.Services.DataAccess;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Web.Products
{
    public class ProductByIdQH
        : IQueryHandler<FurnitureShop.Core.Contracts.Web.Products.ProductById, ProductDetailsDTO?>
    {
        private readonly CoreDbContext dbContext;

        public ProductByIdQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<ProductDetailsDTO?> ExecuteAsync(
            CoreContext context,
            FurnitureShop.Core.Contracts.Web.Products.ProductById query
        )
        {
            var shoppingCart = dbContext.ShoppingCarts
                .Where(sh => sh.UserId == context.UserId)
                .FirstOrDefault();
            var shoppingCartExists = shoppingCart != null;
            shoppingCartExists = false;
            return await dbContext.Products
                .Where(p => p.Id == query.Id)
                .Include(p => p.Reviews)
                .Select(
                    p =>
                        new ProductDetailsDTO
                        {
                            Name = p.Name,
                            Price = p.Price,
                            CategoryId = p.CategoryId,
                            PreviewPhotoId = p.PreviewPhotoId,
                            AverageRating =
                                p.Reviews.Count > 0 ? p.Reviews.Average(r => r.Rating) : null,
                            Description = p.Description,
                            ModelId = p.ModelId,
                            PhotosIds = dbContext.Photos
                                .Where(p => p.ProductId == query.Id)
                                .Select(p => p.Id.Value)
                                .ToList(),
                            Id = p.Id,
                        }
                )
                .FirstOrDefaultAsync();
        }
    }
}
