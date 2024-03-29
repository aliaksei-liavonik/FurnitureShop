using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Mobile.Reviews;
using FurnitureShop.Core.Services.DataAccess;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Reviews
{
    public class ReviewByIdQH : IQueryHandler<ReviewById, ReviewDTO?>
    {
        private readonly CoreDbContext dbContext;

        public ReviewByIdQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<ReviewDTO?> ExecuteAsync(CoreContext context, ReviewById query)
        {
            return await dbContext.Reviews
                .Where(p => p.Id == query.Id)
                .Select(
                    p =>
                        new ReviewDTO
                        {
                            Text = p.Text == null ? "" : p.Text,
                            UserName = dbContext.Users
                                .Where(u => u.Id == p.UserId)
                                .First()
                                .Username,
                            Rating = p.Rating,
                            UserId = p.UserId,
                            ProductId = p.ProductId,
                            CreatedDate = p.CreatedDate,
                            Id = p.Id,
                        }
                )
                .FirstOrDefaultAsync();
        }
    }
}
