using DomainModel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;

namespace StratexTest.ViewModel
{
    public class EmployeeViewModel
    {
        public int ShiftId { get; set; }
        public int EmployeeId { get; set; }
        public string EmployeeName { get; set; }
        public DateTime ShiftDate { get; set; }
        public TimeSpan ShiftFrom { get; set; }
        public TimeSpan ShiftTo { get; set; }
        public string ShiftType { get; set; }

        public static List<EmployeeViewModel> LoadEmployeeShifts()
        {
            try
            {
                var ctx = new DbContext();
                return ctx.EmployeesShifts.Select(x => new EmployeeViewModel()
                {
                    EmployeeName = x.Employees.LastName + ", " + x.Employees.FirstName,
                    ShiftId = x.ShiftId,
                    EmployeeId = x.Employees.EmpId,
                    ShiftDate = x.ShiftDate,
                    ShiftFrom = x.ShiftFrom,
                    ShiftTo = x.ShiftTo,
                    ShiftType = x.ShiftType,
                }).ToList();
            }
            catch (Exception)
            {
                return new List<EmployeeViewModel>();
            }
        }

        public static List<EmployeeViewModel> LoadPlanShifts()
        {
            var shifts = LoadEmployeeShifts();
            foreach (var empShift in shifts.GroupBy(x => x.EmployeeId))
            {
                var shift = empShift.Where(x => x.ShiftType == "Chat Shift" || x.ShiftType == "Call Shift").FirstOrDefault();

                foreach (var item in shifts)
                {
                    if (item.ShiftTo > shift.ShiftTo)
                    {
                        item.ShiftTo = shift.ShiftTo;
                    }
                    if (item.ShiftFrom < shift.ShiftFrom)
                    {
                        item.ShiftFrom = shift.ShiftFrom;
                    }
                }
            }
            return shifts;
        }
        public static List<ShiftsViewModel> LoadEmployeesSchedule()
        {
            try
            {
                int count = 0;
                var shiftSlots = new List<ShiftsViewModel>();
                TimeSpan? lastTo = new TimeSpan();
                var shifts = LoadPlanShifts();

                foreach (var employeeShift in shifts.GroupBy(x => x.EmployeeId))
                {
                    count = 0;
                    var shift = employeeShift.Where(x => x.ShiftType == "Chat Shift" || x.ShiftType == "Call Shift").FirstOrDefault();


                    foreach (var item in employeeShift.Where(x => x.ShiftType != "Chat Shift" && x.ShiftType != "Call Shift").OrderBy(x => x.ShiftFrom))
                    {
                        var empCount = (employeeShift.Count() - 2);
                        if (count == 0)
                        {
                            var slot = new ShiftsViewModel()
                            {
                                EmployeeId = item.EmployeeId,
                                EmployeeName = item.EmployeeName,
                                ShiftName = shift.ShiftType,
                                ShiftFrom = shift.ShiftFrom,
                                ShiftTo = item.ShiftFrom,
                                ShiftDate = item.ShiftDate,
                            };
                            if (slot.ShiftFrom != slot.ShiftTo)
                            {
                                shiftSlots.Add(slot);
                            }


                            slot = new ShiftsViewModel()
                            {
                                EmployeeId = item.EmployeeId,
                                EmployeeName = item.EmployeeName,
                                ShiftName = item.ShiftType,
                                ShiftFrom = item.ShiftFrom,
                                ShiftTo = item.ShiftTo,
                                ShiftDate = item.ShiftDate,
                            };

                            if (slot.ShiftFrom != slot.ShiftTo)
                            {
                                shiftSlots.Add(slot);
                            }
                            lastTo = slot.ShiftTo;

                            if (lastTo < shift.ShiftTo && count == empCount)
                            {
                                slot = new ShiftsViewModel()
                                {
                                    EmployeeId = item.EmployeeId,
                                    EmployeeName = item.EmployeeName,
                                    ShiftName = shift.ShiftType,
                                    ShiftFrom = lastTo,
                                    ShiftTo = shift.ShiftTo,
                                    ShiftDate = item.ShiftDate,
                                };
                                shiftSlots.Add(slot);
                                lastTo = slot.ShiftTo;
                            }
                        }
                        else
                        {
                            var slot = new ShiftsViewModel()
                            {
                                EmployeeId = item.EmployeeId,
                                EmployeeName = item.EmployeeName,
                                ShiftName = shift.ShiftType,
                                ShiftFrom = lastTo,
                                ShiftTo = item.ShiftFrom,
                                ShiftDate = item.ShiftDate,
                            };

                            if (slot.ShiftFrom != slot.ShiftTo)
                            {
                                shiftSlots.Add(slot);
                            }


                            slot = new ShiftsViewModel()
                            {
                                EmployeeId = item.EmployeeId,
                                EmployeeName = item.EmployeeName,
                                ShiftName = item.ShiftType,
                                ShiftFrom = item.ShiftFrom,
                                ShiftTo = item.ShiftTo,
                                ShiftDate = item.ShiftDate,
                            };

                            if (slot.ShiftFrom != slot.ShiftTo)
                            {
                                shiftSlots.Add(slot);
                            }

                            lastTo = slot.ShiftTo;

                            if (lastTo < shift.ShiftTo && count == empCount)
                            {
                                slot = new ShiftsViewModel()
                                {
                                    EmployeeId = item.EmployeeId,
                                    EmployeeName = item.EmployeeName,
                                    ShiftName = shift.ShiftType,
                                    ShiftFrom = lastTo,
                                    ShiftTo = shift.ShiftTo,
                                    ShiftDate = item.ShiftDate,

                                };

                                if (slot.ShiftFrom != slot.ShiftTo)
                                {
                                    shiftSlots.Add(slot);
                                }
                                lastTo = slot.ShiftTo;
                            }
                        }
                        count++;
                    }
                }
                return shiftSlots;
            }
            catch (Exception)
            {
                return new List<ShiftsViewModel>();
            }
        }

    }
}