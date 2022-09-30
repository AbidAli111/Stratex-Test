namespace DomainModel.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("EmployeesShift")]
    public partial class EmployeesShift
    {
        [Key]
        public int ShiftId { get; set; }

        public int EmpId { get; set; }

        [Column(TypeName = "date")]
        public DateTime ShiftDate { get; set; }

        public TimeSpan ShiftFrom { get; set; }

        public TimeSpan ShiftTo { get; set; }

        [StringLength(50)]
        public string ShiftType { get; set; }

        public virtual Employee Employees { get; set; }
    }
    
}
