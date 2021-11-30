using System;
using System.Collections.Generic;

namespace FurnitureShop.Core.Services.DataAccess.Entities
{
    public class Review
    {
        public Review(string text, double rating)
        {
            this.Text = text;
            this.Rating = rating;
            this.CreatedDate = DateTime.Now;
        }

        public Guid Id { get; set; }
        public string Text { get; set; }
        public double Rating { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}
