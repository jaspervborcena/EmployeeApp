using EmployeeData;
using EmployeeData.Models;
using Microsoft.EntityFrameworkCore;
using EmployeeBusiness.Repositories;

namespace EmployeeBusiness.Services
{
    public class DesignationRepository : IDesignationRepository
    {
        private readonly AppDbContext _context;

        public DesignationRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<Designation>> GetAllAsync()
        {
            return await _context.Designations.ToListAsync();
        }

        public async Task<Designation?> GetByIdAsync(int id)
        {
            return await _context.Designations.FindAsync(id);
        }

        public async Task AddAsync(Designation designation)
        {
            _context.Designations.Add(designation);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateAsync(Designation designation)
        {
            _context.Designations.Update(designation);
            await _context.SaveChangesAsync();
        }

        public async Task DeleteAsync(int id)
        {
            var designation = await _context.Designations.FindAsync(id);
            if (designation != null)
            {
                _context.Designations.Remove(designation);
                await _context.SaveChangesAsync();
            }
        }
    }
}
