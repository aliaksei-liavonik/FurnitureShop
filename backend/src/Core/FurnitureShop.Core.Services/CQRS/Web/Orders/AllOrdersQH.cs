using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Shared;
using FurnitureShop.Core.Contracts.Web.Complaints;
using FurnitureShop.Core.Contracts.Web.Orders;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Web.Orders
{
    public class AllOrdersQH : IQueryHandler<AllOrders, PaginatedResult<OrderDTO>>
    {
        private readonly CoreDbContext dbContext;

        public AllOrdersQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<PaginatedResult<OrderDTO>> ExecuteAsync(
            CoreContext context,
            AllOrders query
        )
        {
            var products = await dbContext.Products.ToListAsync();
            var orders = await dbContext.Orders
                .FilterBy(query)
                .Select(
                    p =>
                        new OrderDTO
                        {
                            Id = p.Id,
                            Price = p.Price,
                            UserId = p.UserId,
                            Adress = p.Address,
                            OrderState = Enum.Parse<OrderStateDTO>(p.OrderState.ToString()),
                            OrderedDate = p.OrderedDate,
                            DeliveredDate = p.DeliveredDate,
                            Complaint = dbContext.Complaints
                                .Where(c => c.OrderId == p.Id)
                                .Select(
                                    x =>
                                        new ComplaintDTO
                                        {
                                            Id = x.Id,
                                            UserId = x.UserId,
                                            Resolved = x.Resolved,
                                            Response = x.Response,
                                            Text = x.Text,
                                            CreatedDate = x.CreatedDate
                                        }
                                )
                                .FirstOrDefault(),
                        }
                )
                .SortBy(query)
                .ToPaginatedResultAsync(query);

            foreach (var ord in orders.Items)
            {
                ord.Products = await GetProductsInOrder(ord, products);
            }

            return orders;
        }

        private async Task<List<ProductInOrderDTO>> GetProductsInOrder(
            OrderDTO order,
            List<Product> products
        )
        {
            var orderProducts = await dbContext.OrderProduct
                .Where(o => o.OrderId == order.Id)
                .ToListAsync();

            if (orderProducts != null && products != null)
            {
                return orderProducts
                    .Join(
                        products,
                        ord => ord.ProductId,
                        prod => prod.Id,
                        (ord, prod) =>
                            new ProductInOrderDTO()
                            {
                                Amount = ord.Amount,
                                Id = prod.Id,
                                Name = prod.Name,
                                Price = prod.Price,
                                Description = prod.Description,
                                PreviewPhotoId = prod.PreviewPhotoId,
                                CategoryId = prod.CategoryId,
                            }
                    )
                    .ToList();
            }
            return new List<ProductInOrderDTO>();
        }
    }

    internal static class OrderQHExtensions
    {
        public static IQueryable<Order> FilterBy(this IQueryable<Order> queryable, AllOrders query)
        {
            foreach (var filter in query.FilterBy)
            {
                switch (filter.Key)
                {
                    case OrdersFilterFieldDTO.Address:
                        queryable = queryable.Where(
                            c => c.Address.ToLower().Contains(filter.Value.ToLowerInvariant())
                        );
                        break;
                    case OrdersFilterFieldDTO.OrderState:
                        queryable = queryable.Where(
                            c =>
                                c.OrderState.ToString().ToLower() == filter.Value.ToLowerInvariant()
                        );
                        break;
                    case OrdersFilterFieldDTO.UserId:
                        queryable = queryable.Where(c => c.UserId.ToString() == filter.Value);
                        break;
                    default:
                        break;
                }
            }
            return queryable;
        }

        public static IQueryable<OrderDTO> SortBy(
            this IQueryable<OrderDTO> queryable,
            AllOrders query
        )
        {
            if (!query.SortBy.HasValue)
            {
                return queryable;
            }

            return query.SortBy switch
            {
                OrdersSortFieldDTO.OrderedDate
                    => queryable
                        .OrderBy(s => s.OrderedDate, query.SortByDescending)
                        .ThenBy(s => s.Id),
                OrdersSortFieldDTO.DeliveredDate
                    => queryable
                        .OrderBy(s => s.DeliveredDate, query.SortByDescending)
                        .ThenBy(s => s.Id),
                _ => queryable,
            };
        }
    }
}
