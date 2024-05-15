using System;
using System.Collections.Generic;

namespace Backend.Models;

public partial class Product
{
    public int Id { get; set; }

    public string ProductName { get; set; } = null!;

    public string Description { get; set; } = null!;

    public decimal Price { get; set; }

    public int Count { get; set; }

    public string Article { get; set; } = null!;

    public int IdCategory { get; set; }

    public int IdSupplier { get; set; }

    public byte[]? Image { get; set; }

    public virtual ICollection<Basket> Baskets { get; set; } = new List<Basket>();

    public virtual ICollection<Comment> Comments { get; set; } = new List<Comment>();

    public virtual CategoryProduct? IdCategoryNavigation { get; set; } 

    public virtual Supplier? IdSupplierNavigation { get; set; } 
}
