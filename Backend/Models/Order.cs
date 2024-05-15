using System;
using System.Collections.Generic;

namespace Backend.Models;

public partial class Order
{
    public int Id { get; set; }

    public int IdBasket { get; set; }

    public DateTime Date { get; set; }

    public virtual Basket? IdBasketNavigation { get; set; } 
}
