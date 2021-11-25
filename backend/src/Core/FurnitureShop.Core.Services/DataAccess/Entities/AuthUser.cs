using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Identity;

namespace FurnitureShop.Core.Services.DataAccess.Entities
{
    public class AuthUser : IdentityUser<Guid>
    {
        // public AuthUser(string Name, string Surname, string Email, Address Address)
        // {
        //     this.Name = Name;
        //     this.Surname = Surname;
        //     this.Email = Email;
        //     this.Address = Address;
        // }
        public virtual List<IdentityUserClaim<Guid>> Claims { get; } = new List<IdentityUserClaim<Guid>>();
        // public string Name {get;set;}
        // public string Surname {get;set;}
        // public Address Address {get;set;}
    }
}
