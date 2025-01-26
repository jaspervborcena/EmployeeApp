using System.ComponentModel.DataAnnotations.Schema;

namespace EmployeeData.Models
{
    public class Employee
    {
        public int EmployeeID { get; set; }
        public string FirstName { get; set; } = string.Empty;
        public string LastName { get; set; } = string.Empty;
        //public string Title { get; set; } = string.Empty;
        public int? ManagerId { get; set; }

        // Foreign key for Designation
        public int DesignationID { get; set; }

        // Navigation property for Designation
        [ForeignKey("DesignationID")]
        public Designation? Designation { get; set; }
    }
}
