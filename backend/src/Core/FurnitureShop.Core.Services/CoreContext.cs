using System;
using System.Security.Claims;
using System.Threading;
using FurnitureShop.Core.Contracts;
using FurnitureShop.Core.Domain;
using LeanCode.CQRS.Security;
using LeanCode.DomainModels.Model;
using LeanCode.Pipelines;
using Microsoft.AspNetCore.Http;

namespace FurnitureShop.Core.Services
{
    public class CoreContext : ISecurityContext
    {
        IPipelineScope IPipelineContext.Scope { get; set; } = null!;

        public ClaimsPrincipal User { get; }
        public Id<User> UserId { get; }

        public CancellationToken CancellationToken { get; }

        private CoreContext(ClaimsPrincipal user, CancellationToken cancellationToken)
        {
            User = user;
            CancellationToken = cancellationToken;
            UserId = Id<User>.From(ParseUserClaim(Auth.KnownClaims.UserId));
        }

        public static CoreContext FromHttp(HttpContext httpContext)
        {
            return new CoreContext(httpContext.User, httpContext.RequestAborted);
        }

        public static CoreContext ForTests(Guid userId, string role)
        {
            var claims = new[]
            {
                new Claim(Auth.KnownClaims.UserId, userId.ToString()),
                new Claim(Auth.KnownClaims.Role, role),
            };

            var user = new ClaimsPrincipal(
                new ClaimsIdentity(
                    claims: claims,
                    authenticationType: "internal",
                    nameType: Auth.KnownClaims.UserId,
                    roleType: Auth.KnownClaims.Role
                )
            );

            return new CoreContext(user, default);
        }

        private Guid ParseUserClaim(string claimType)
        {
            if (User?.Identity?.IsAuthenticated ?? false)
            {
                var str = User.FindFirstValue(claimType);
                Guid.TryParse(str, out var res);
                return res;
            }
            else
            {
                return Guid.Empty;
            }
        }
    }
}
