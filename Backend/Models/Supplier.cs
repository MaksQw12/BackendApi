using System;
using System.Collections.Generic;

namespace Backend.Models;

public partial class Supplier
{
    public int Id { get; set; }

    public string SupplaierName { get; set; } = null!;

    public string Country { get; set; } = null!;

    public string City { get; set; } = null!;

    public virtual ICollection<Product> Products { get; set; } = new List<Product>();
}
