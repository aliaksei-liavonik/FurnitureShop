using System;
using System.Collections.Generic;

namespace FurnitureShop.Core.Services.DataAccess.Entities
{
    public class Category
    {
        public Category(string Name)
        {
            this.Name  = Name;
        }
        public Guid Id {get;set;}
        public string Name {get;set;}

    }
}
