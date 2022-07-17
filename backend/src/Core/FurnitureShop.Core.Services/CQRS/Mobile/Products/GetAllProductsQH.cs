using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Dtos;
using FurnitureShop.Core.Contracts;
using FurnitureShop.Core.Contracts.Mobile.Products;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Products
{
    public class GetAllProductsQH : IQueryHandler<GetAllProducts, PaginatedResult<ProductUDTO>>
    {
        private readonly CoreDbContext dbContext;

        public GetAllProductsQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<PaginatedResult<ProductUDTO>> ExecuteAsync(CoreContext context, GetAllProducts query)
        {
            if (query.CategoryId.HasValue)
            {
                return await GetProducts(dbContext.Products.Where(p => p.CategoryId == query.CategoryId), query, context);
            }
            else
            {
                return await GetProducts(dbContext.Products, query, context);
            }
        }

        private async Task<List<Guid>> GetProductsInShoppingCart(CoreContext context)
        {
            var shoppingCart = dbContext.ShoppingCarts.Where(sh => sh.UserId == context.UserId).FirstOrDefault();
            if (shoppingCart == null)
            {
                return new List<Guid>();
            }
            var shoppingCartId = shoppingCart.Id;
            return await dbContext.ShoppingCartProduct
                .Where(shp => shp.ShoppingCartId == shoppingCartId && shp.ProductId != null)
                .Select(shp => shp.ProductId!.Value.Value).ToListAsync();
        }
        private async Task<List<Guid>> GetProductsInFavourites(CoreContext context)
        {
            return await dbContext.Favourites
                .Where(f => f.UserId == context.UserId && f.ProductId != null)
                .Select(f => f.ProductId!.Value.Value).ToListAsync();
        }
        private async Task<PaginatedResult<ProductUDTO>> GetProducts(IQueryable<Product> queryable, GetAllProducts query, CoreContext context)
        {
            var productsInShoppingCart = await GetProductsInShoppingCart(context);
            var productsInFavourites = await GetProductsInFavourites(context);

            return await queryable.FilterBy(query)
                .Include(p => p.Reviews)
                .Select(p => new ProductUDTO
                {
                    Name = p.Name,
                    Price = p.Price,
                    PreviewPhotoURL = p.ModelUrl,
                    AverageRating = p.Reviews.Count > 0 ? p.Reviews.Average(r => r.Rating) : null,
                    CategoryId = p.CategoryId,
                    InFavourites = productsInFavourites.Contains(p.Id),
                    InShoppingCart = productsInShoppingCart.Contains(p.Id),
                    Id = p.Id,
                })
                .SortBy(query)
                .ToPaginatedResultAsync(query);
        }
    }

    internal static class ProductQHExtensions
    {
        public static IQueryable<Product> FilterBy(this IQueryable<Product> queryable, GetAllProducts query)
        {
            return query.FilterBy switch
            {
                string f => queryable.Where(c => c.Name.ToLower().Contains(f.ToLowerInvariant())),
                _ => queryable,
            };
        }

        public static IQueryable<ProductUDTO> SortBy(this IQueryable<ProductUDTO> queryable, GetAllProducts query)
        {
            if (!query.SortBy.HasValue)
            {
                return queryable;
            }

            return query.SortBy switch
            {
                ProductsSortFieldDTO.Name => queryable.OrderBy(s => s.Name, query.SortByDescending).ThenBy(s => s.Id),
                ProductsSortFieldDTO.Rating => queryable.OrderBy(s => s.AverageRating, query.SortByDescending).ThenBy(s => s.Id),
                ProductsSortFieldDTO.Price => queryable.OrderBy(s => s.Price, query.SortByDescending).ThenBy(s => s.Id),
                _ => queryable
            };
        }
    }
}
