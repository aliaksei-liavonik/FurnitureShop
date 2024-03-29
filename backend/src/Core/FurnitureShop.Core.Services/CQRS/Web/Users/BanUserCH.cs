using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FluentValidation;
using FurnitureShop.Core.Contracts;
using FurnitureShop.Core.Contracts.Web.Users;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using FurnitureShop.Core.Services.DataAccess.Entities;
using LeanCode.CQRS.Execution;
using LeanCode.CQRS.Validation.Fluent;
using Microsoft.AspNetCore.Identity;

namespace FurnitureShop.Core.Services.CQRS.Web.Users
{
    public class BanUserCV : ContextualValidator<BanUser>
    {
        public BanUserCV()
        {
            RuleFor(c => c.UserId, IsUserunbanned)
                .NotEmpty()
                .WithCode(BanUser.ErrorCodes.UserAlreadyBanned)
                .WithMessage("User is already banned");
        }

        private static bool IsUserunbanned(IValidationContext ctx, Guid userId)
        {
            var dbContext = ctx.GetService<CoreDbContext>();
            return dbContext.UserClaims
                .Where(u => u.UserId == userId && u.ClaimValue == Auth.Roles.User)
                .Any();
        }
    }

    public class BanUserCH : ICommandHandler<CoreContext, BanUser>
    {
        private readonly Serilog.ILogger logger = Serilog.Log.ForContext<BanUserCH>();

        private readonly UserManager<AuthUser> userManager;
        private readonly CoreDbContext dbContext;

        public BanUserCH(UserManager<AuthUser> userManager, CoreDbContext dbContext)
        {
            this.userManager = userManager;
            this.dbContext = dbContext;
        }

        public async Task ExecuteAsync(CoreContext context, BanUser command)
        {
            var user = await userManager.FindByIdAsync(command.UserId.ToString());
            var claims = await userManager.GetClaimsAsync(user);
            await userManager.RemoveClaimsAsync(
                user,
                claims.Where(c => c.Value == Auth.Roles.User)
            );
            if (!claims.Where(c => c.Value == Auth.Roles.BannedUser).Any())
            {
                await userManager.AddClaimAsync(
                    user,
                    new IdentityUserClaim<Guid>()
                    {
                        ClaimType = Auth.KnownClaims.Role,
                        ClaimValue = Auth.Roles.BannedUser,
                    }.ToClaim()
                );
            }
            await userManager.UpdateAsync(user);
        }
    }
}
