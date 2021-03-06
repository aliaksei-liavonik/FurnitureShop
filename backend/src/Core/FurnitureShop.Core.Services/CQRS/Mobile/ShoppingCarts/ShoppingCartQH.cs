using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FluentValidation;
using FurnitureShop.Core.Contracts.Mobile.Products;
using FurnitureShop.Core.Contracts.Mobile.ShoppingCart;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using Microsoft.EntityFrameworkCore;
using LeanCode.DomainModels.DataAccess;
using LeanCode.CQRS.Validation.Fluent;

namespace FurnitureShop.Core.Services.CQRS.Mobile.ShoppingCart
{
    public class ShoppingCartQH : IQueryHandler<Contracts.Mobile.ShoppingCart.ShoppingCart, ShoppingCartDTO?>
    {
        private readonly CoreDbContext dbContext;

        public ShoppingCartQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<ShoppingCartDTO?> ExecuteAsync(CoreContext context, Contracts.Mobile.ShoppingCart.ShoppingCart query)
        {
            var ret = await dbContext.ShoppingCarts
                .Where(p => p.UserId == context.UserId)
                .Select(p => new ShoppingCartDTO
                {
                    ShoppingCartProducts = dbContext.Products
                        .Join(

                            dbContext.ShoppingCartProduct.Where(s => s.ShoppingCartId == p.Id),

                            prod => prod.Id,
                            shp => shp.ProductId,
                            (prod, shp) => new ShoppingCartProductDTO
                            {
                                Amount = shp.Amount,
                                Product = new ProductDTO
                                {
                                    Id = prod.Id,
                                    Name = prod.Name,
                                    Price = prod.Price,
                                    PreviewPhotoURL = prod.PreviewPhotoUrl,
                                    CategoryId = prod.CategoryId,
                                }
                            }
                        ).ToList(),
                    UserId = p.UserId,
                })
                .FirstOrDefaultAsync();
            if (ret == null) { return null; }
            ret.Price = ret.ShoppingCartProducts.Sum(shp => shp.Product.Price * shp.Amount);
            return ret;
        }
    }
}
