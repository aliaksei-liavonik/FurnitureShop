using System;
using System.Collections.Generic;

namespace FurnitureShop.Core.Services.DataAccess.Entities
{
    public class Complaint
    {
        public Complaint(string text, AuthUser user)
        {
            this.User = user;
            this.Text = text;
            this.State = ReviewState.Pending;
            this.CreatedDate = DateTime.Now;
        }

        public Guid Id { get; set; }
        public AuthUser User { get; set; }
        public string Text { get; set; }
        public ReviewState State { get; set; }
        public DateTime CreatedDate { get; set; }
    }

    public enum ReviewState
    {
        Pending,
        Resolved,
        Closed,
    }
}
