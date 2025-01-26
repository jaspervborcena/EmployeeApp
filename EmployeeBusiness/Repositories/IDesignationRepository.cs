using System;
using System.Collections.Generic;
using EmployeeData.Models;

namespace EmployeeBusiness.Repositories
{
    public interface IDesignationRepository
    {
        Task<IEnumerable<Designation>> GetAllAsync();
        Task<Designation?> GetByIdAsync(int id);
        Task AddAsync(Designation employee);
        Task UpdateAsync(Designation employee);
        Task DeleteAsync(int id);
    }
}
