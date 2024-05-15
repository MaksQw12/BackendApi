using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Backend.Models;

public partial class MaksdiplomContext : DbContext
{
    public MaksdiplomContext()
    {
    }

    public MaksdiplomContext(DbContextOptions<MaksdiplomContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Basket> Baskets { get; set; }

    public virtual DbSet<CategoryProduct> CategoryProducts { get; set; }

    public virtual DbSet<Comment> Comments { get; set; }

    public virtual DbSet<Order> Orders { get; set; }

    public virtual DbSet<Product> Products { get; set; }

    public virtual DbSet<Supplier> Suppliers { get; set; }

    public virtual DbSet<User> Users { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=sql.bsite.net\\MSSQL2016;Database=maksdiplom_;User Id=maksdiplom_;Password=123;  trustServerCertificate=true");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Basket>(entity =>
        {
            entity.ToTable("Basket");

            entity.HasOne(d => d.IdProductNavigation).WithMany(p => p.Baskets)
                .HasForeignKey(d => d.IdProduct)
                .HasConstraintName("FK_Basket_Product");

            entity.HasOne(d => d.IdUserNavigation).WithMany(p => p.Baskets)
                .HasForeignKey(d => d.IdUser)
                .HasConstraintName("FK_Basket_User");
        });

        modelBuilder.Entity<CategoryProduct>(entity =>
        {
            entity.ToTable("CategoryProduct");
        });

        modelBuilder.Entity<Comment>(entity =>
        {
            entity.HasOne(d => d.IdUserNavigation).WithMany(p => p.Comments)
                .HasForeignKey(d => d.IdUser)
                .HasConstraintName("FK_Comments_User");

            entity.HasOne(d => d.IsProductNavigation).WithMany(p => p.Comments)
                .HasForeignKey(d => d.IsProduct)
                .HasConstraintName("FK_Comments_Product");
        });

        modelBuilder.Entity<Order>(entity =>
        {
            entity.ToTable("Order");

            entity.Property(e => e.Date).HasColumnType("date");

            entity.HasOne(d => d.IdBasketNavigation).WithMany(p => p.Orders)
                .HasForeignKey(d => d.IdBasket)
                .HasConstraintName("FK_Order_Basket");
        });

        modelBuilder.Entity<Product>(entity =>
        {
            entity.ToTable("Product");

            entity.Property(e => e.Image).HasColumnType("image");
            entity.Property(e => e.Price).HasColumnType("decimal(18, 0)");

            entity.HasOne(d => d.IdCategoryNavigation).WithMany(p => p.Products)
                .HasForeignKey(d => d.IdCategory)
                .HasConstraintName("FK_Product_CategoryProduct");

            entity.HasOne(d => d.IdSupplierNavigation).WithMany(p => p.Products)
                .HasForeignKey(d => d.IdSupplier)
                .HasConstraintName("FK_Product_Suppliers");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.ToTable("User");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
