using System;
using System.Collections.Generic;

namespace Backend.Models;

public partial class Basket
{
    public int Id { get; set; }

    public int IdUser { get; set; }

    public int IdProduct { get; set; }

    public int Count { get; set; }

    public virtual Product? IdProductNavigation { get; set; } 

    public virtual User? IdUserNavigation { get; set; } 

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();
}
