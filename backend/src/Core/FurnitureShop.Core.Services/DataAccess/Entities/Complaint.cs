using System;
using System.Collections.Generic;

namespace FurnitureShop.Core.Services.DataAccess.Entities
{
    public class Complaint
    {
        public Complaint(string Text,double Rating)
        {
            this.Text = Text;
            this.State = ReviewState.pending;
            this.CreatedDate = DateTime.Now;
        }
        public Guid Id {get;set;}
        public string Text {get;set;}
        public ReviewState State {get;set;}
        public DateTime CreatedDate {get;set;}
    }
    public enum ReviewState
    {
        pending,
        resolved,
        closed
    }
}
