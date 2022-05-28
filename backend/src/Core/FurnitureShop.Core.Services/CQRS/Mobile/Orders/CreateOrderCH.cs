using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FluentValidation;
using FurnitureShop.Core.Contracts.Mobile.Orders;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using FurnitureShop.Core.Services.Services;
using LeanCode.DomainModels.Model;
using LeanCode.CQRS.Validation.Fluent;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Orders
{
    public class CreateOrderCV : ContextualValidator<CreateOrder>
    {
        public CreateOrderCV()
        {
            RuleFor(p => p.OrderInfo.OrderProducts)
                .NotEmpty()
                    .WithCode(CreateOrder.ErrorCodes.NoProducts)
                    .WithMessage("No products to order");
            RuleFor(p => p.OrderInfo.Street)
                .NotEmpty()
                    .WithCode(CreateOrder.ErrorCodes.IncorrectAddress)
                    .WithMessage("Street should not be empty");
            RuleFor(p => p.OrderInfo.City)
                .NotEmpty()
                    .WithCode(CreateOrder.ErrorCodes.IncorrectAddress)
                    .WithMessage("City should not be empty");
            RuleFor(p => p.OrderInfo.State)
                .NotEmpty()
                    .WithCode(CreateOrder.ErrorCodes.IncorrectAddress)
                    .WithMessage("State should not be empty");
            RuleFor(p => p.OrderInfo.Country)
                .NotEmpty()
                    .WithCode(CreateOrder.ErrorCodes.IncorrectAddress)
                    .WithMessage("Country should not be empty");
            RuleFor(p => p.OrderInfo.PostalCode)
                .NotEmpty()
                    .WithCode(CreateOrder.ErrorCodes.IncorrectAddress)
                    .WithMessage("Postal should not be empty");
             RuleForAsync(p => p.OrderInfo.Price, DoesUserHaveEnoughMoney)
                .Equal(false)
                    .WithMessage("Not enough funds to pay for the order.")
                    .WithCode(CreateOrder.ErrorCodes.NotEnoughFunds);
        }
        private static async Task<bool> DoesUserHaveEnoughMoney(IValidationContext ctx, double price)
        {
            var uid = ctx.AppContext<CoreContext>().UserId;
            var dbContext = ctx.GetService<CoreDbContext>();
            var user = await dbContext.Users
                .Where(u => u.Id == uid).FirstOrDefaultAsync();
            if (user == null)
            {
                return false;
            }

            return user.Funds >= (int)price;
        }
    }
    public class CreateOrderQH : ICommandHandler<CreateOrder>
    {
        private readonly CoreDbContext dbContext;
        public CreateOrderQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task ExecuteAsync(CoreContext context, CreateOrder command)
        {
            var result = await dbContext.Orders.AddAsync(// mapper.Map<Order>(command.NewOrder));
                new Order(command.OrderInfo.Street, command.OrderInfo.City, command.OrderInfo.State,
                    command.OrderInfo.PostalCode, command.OrderInfo.Country)
                {
                    UserId = Id<User>.From(context.UserId),
                    Price = command.OrderInfo.Price,
                    OrderedDate = DateTime.Now,
                    OrderState = OrderState.Pending,
                    OrdersProducts = command.OrderInfo.OrderProducts.Select(op => new OrderProduct
                    {
                        ProductId = Id<Product>.From(op.Product.Id),
                        Amount = op.Amount,
                    }).ToList(),
                });
            await dbContext.SaveChangesAsync();
        }
    }
}
