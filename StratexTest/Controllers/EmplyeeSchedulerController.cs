using StratexTest.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StratexTest.Controllers
{
    public class EmplyeeSchedulerController : Controller
    {
        // GET: EmplyeeScheduler
        public ActionResult Index()
        {
            var obj = EmployeeViewModel.LoadEmployeesSchedule();
            return View(obj);
        }
    }
}