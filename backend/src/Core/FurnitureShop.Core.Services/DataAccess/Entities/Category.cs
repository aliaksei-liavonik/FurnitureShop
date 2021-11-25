using System;
using System.Collections.Generic;

namespace FurnitureShop.Core.Services.DataAccess.Entities
{
    public class Category
    {
        public Category(string name)
        {
            this.Name  = name;
        }
        public Guid Id {get;set;}
        public string Name {get;set;}

    }
}
