using System;
using System.Collections.Generic;

namespace Backend.Models;

public partial class Comment
{
    public int Id { get; set; }

    public int IdUser { get; set; }

    public int IsProduct { get; set; }

    public string Text { get; set; } = null!;

    public int Estimation { get; set; }

    public virtual User? IdUserNavigation { get; set; } 

    public virtual Product? IsProductNavigation { get; set; } 
}
