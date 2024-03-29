using System.Linq;
using System.Threading.Tasks;
using FluentValidation;
using FurnitureShop.Core.Contracts.Mobile.Complaints;
using FurnitureShop.Core.Services.DataAccess;
using LeanCode.CQRS.Validation.Fluent;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Complaints
{
    public class UpdateComplaintCV : ContextualValidator<UpdateComplaint>
    {
        public UpdateComplaintCV()
        {
            RuleFor(p => p.UpdatedComplaint.Text)
                .NotEmpty()
                .WithCode(UpdateComplaint.ErrorCodes.EmptyComplaintText)
                .WithMessage("Complaint text should not be empty");
        }
    }

    public class UpdateComplaintCH : ICommandHandler<UpdateComplaint>
    {
        private readonly CoreDbContext dbContext;

        public UpdateComplaintCH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task ExecuteAsync(CoreContext context, UpdateComplaint command)
        {
            var toUpdate = await dbContext.Complaints
                .Where(p => p.Id == command.UpdatedComplaint.Id)
                .FirstOrDefaultAsync();
            if (toUpdate == null)
            {
                return;
            }

            toUpdate.Text = command.UpdatedComplaint.Text;
            dbContext.Complaints.Update(toUpdate);
            await dbContext.SaveChangesAsync();
        }
    }
}
