using EmployeeData.Models;
using Microsoft.EntityFrameworkCore;

namespace EmployeeData
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

        public DbSet<Employee> Employees { get; set; }
        public DbSet<Designation> Designations { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // Configure Employee table
            modelBuilder.Entity<Employee>()
                .ToTable("Employee")
                .HasKey(e => e.EmployeeID);

            modelBuilder.Entity<Employee>()
                .Property(e => e.FirstName)
                .IsRequired()
                .HasMaxLength(50);

            // Configure Designation table
            modelBuilder.Entity<Designation>()
                .ToTable("Designation")
                .HasKey(d => d.DesignationID);

            modelBuilder.Entity<Designation>()
                .Property(d => d.Title)
                .IsRequired()
                .HasMaxLength(100);

            // Configure the relationship between Employee and Designation
            modelBuilder.Entity<Employee>()
                .HasOne(e => e.Designation) // Employee has one Designation
                .WithMany(d => d.Employees) // Designation has many Employees
                .HasForeignKey(e => e.DesignationID) // Foreign key in Employee table
                .OnDelete(DeleteBehavior.Cascade); // Cascade delete if a Designation is deleted
        }
    }
}
