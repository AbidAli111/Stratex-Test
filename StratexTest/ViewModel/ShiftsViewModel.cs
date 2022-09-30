using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace StratexTest.ViewModel
{
    public partial class ShiftsViewModel
    {
        public int EmployeeId { get; set; }
        public string EmployeeName { get; set; }
        public DateTime ShiftDate { get; set; }
        public string ShiftName { get; set; }
        public TimeSpan? ShiftFrom { get; set; }
        public TimeSpan? ShiftTo { get; set; }
    }
}