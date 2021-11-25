using System;
using System.Collections.Generic;

namespace FurnitureShop.Core.Services.DataAccess.Entities
{
    public class Review
    {
        public Review(string Text,double Rating)
        {
            this.Text = Text;
            this.Rating = Rating;
            this.CreatedDate = DateTime.Now;
        }
        public Guid Id {get;set;}
        public string Text {get;set;}
        public double Rating {get;set;}
        public DateTime CreatedDate {get;set;}
    }
}
