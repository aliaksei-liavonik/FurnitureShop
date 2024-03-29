using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Web.Complaints;
using FurnitureShop.Core.Contracts.Web.Orders;
using FurnitureShop.Core.Services.DataAccess;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Web.Orders
{
    public class OrderByIdQH : IQueryHandler<OrderById, OrderDTO?>
    {
        private readonly CoreDbContext dbContext;

        public OrderByIdQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<OrderDTO?> ExecuteAsync(CoreContext context, OrderById query)
        {
            var order = await dbContext.Orders
                .Include(o => o.OrdersProducts)
                .Where(p => p.Id == query.Id)
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
                                            Text = x.Text,
                                            CreatedDate = x.CreatedDate
                                        }
                                )
                                .FirstOrDefault(),
                        }
                )
                .FirstOrDefaultAsync();
            if (order != null)
            {
                var orderProducts = await dbContext.OrderProduct
                    .Where(o => o.OrderId == order.Id)
                    .ToListAsync();
                var products = await dbContext.Products.ToListAsync();
                if (orderProducts != null && products != null)
                    order.Products = orderProducts
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
            return order;
        }
    }
}
