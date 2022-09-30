using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace DomainModel.Models
{
    public partial class Employee
    {
        [Key]
        public int EmpId { get; set; }

        [Required]
        [StringLength(50)]
        public string LastName { get; set; }

        [Required]
        [StringLength(50)]
        public string FirstName { get; set; }

        [StringLength(50)]
        public string PhoneNumber { get; set; }

        [StringLength(50)]
        public string Address { get; set; }

        public Employee()
        {
            this.EmployeesShift = new List<EmployeesShift>();
        }

        public virtual ICollection<EmployeesShift> EmployeesShift { get; set; }
    }
}
