using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace EmployeeData.Models
{
    public class Designation
    {
        [Key]
        public int DesignationID { get; set; }

        [Required]
        public string Title { get; set; } = string.Empty;

        public string? Description { get; set; } // Optional property

        // Navigation property for related employees
        [JsonIgnore]
        public ICollection<Employee>? Employees { get; set; }
    }
}
