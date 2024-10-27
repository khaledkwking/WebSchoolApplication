using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using DAL.StudentsGroupAttendanceTableAdapters;

namespace BOL
{
    [System.ComponentModel.DataObject()]
    public partial class Sch_StudentsGroupAttendance
    {
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private Sch_StudentsGroupAttendanceTableAdapter _Sch_StudentsGroupAttendanceTableAdapter = null;
        protected Sch_StudentsGroupAttendanceTableAdapter Sch_StudentsGroupAttendanceTableAdapter
        {
            get
            {
                if (_Sch_StudentsGroupAttendanceTableAdapter == null)
                {
                    _Sch_StudentsGroupAttendanceTableAdapter = new Sch_StudentsGroupAttendanceTableAdapter();
                }
                return _Sch_StudentsGroupAttendanceTableAdapter;
            }
        }
        private LastInvoicesGroupAttendanceTableAdapter _LastInvoicesGroupAttendanceTableAdapter = null;
        protected LastInvoicesGroupAttendanceTableAdapter LastInvoicesGroupAttendanceTableAdapter
        {
            get
            {
                if (_LastInvoicesGroupAttendanceTableAdapter == null)
                {
                    _LastInvoicesGroupAttendanceTableAdapter = new LastInvoicesGroupAttendanceTableAdapter();
                }
                return _LastInvoicesGroupAttendanceTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </>
        #region "Read Section"
        public DAL.StudentsGroupAttendance.Sch_StudentsGroupAttendanceDataTable Read(string ActionCode, long Id,
        string StartDate, string EndDate, long InvId, long periodId, int InvType, long OrgId, long BRANCHId,
        int UserId, long StudentId, bool AttFlag,int sex, string SearchText)
        {
            if (!String.IsNullOrEmpty(StartDate))
            {

                DateTime CurStartDate = DateTime.ParseExact(StartDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                StartDate = CurStartDate.ToString("MM/dd/yyyy");
            }
            if (!String.IsNullOrEmpty(EndDate))
            {
                DateTime CurEndDate = DateTime.ParseExact(EndDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                EndDate = CurEndDate.ToString("MM/dd/yyyy");
            }
            return Sch_StudentsGroupAttendanceTableAdapter.Read(ActionCode, Id,
         StartDate, EndDate, InvId, periodId, InvType, OrgId, BRANCHId,
         UserId, StudentId, AttFlag, sex, SearchText);
        }

        public DAL.StudentsGroupAttendance.LastInvoicesGroupAttendanceDataTable ReadAttendance(string ActionCode,  long InvId, int InvType, long OrgId, long BRANCHId, int UserId, long StudenId, long PeriodId, int SexId
       , string StudyStartDate, string StudyEndDate,
       string SearchText,int LastDayOfMonth)
        {
           
            if (!String.IsNullOrEmpty(StudyStartDate))
            {

                DateTime CurStartDate = DateTime.ParseExact(StudyStartDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                StudyStartDate = CurStartDate.ToString("MM/dd/yyyy");
            }
            if (!String.IsNullOrEmpty(StudyEndDate))
            {
                DateTime CurEndDate = DateTime.ParseExact(StudyEndDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                StudyEndDate = CurEndDate.ToString("MM/dd/yyyy");
            }
            return LastInvoicesGroupAttendanceTableAdapter.Read(ActionCode, InvId, InvType, OrgId, BRANCHId, UserId, StudenId, PeriodId, SexId, StudyStartDate, StudyEndDate, SearchText, LastDayOfMonth);
        }


        #endregion
        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>

        public long DML(string ActionCode, long Id, long StudentId, string DayDate, bool AttFlag,
    bool ExceptionFlag, string Notes, long InvId, long OrgId, long BranchId, int CreatedBy, int UpdateBy, int DeletedBy)

        {
            if (!String.IsNullOrEmpty(DayDate))
            {
                DateTime CurDate = DateTime.ParseExact(DayDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                DayDate = CurDate.ToString("MM/dd/yyyy");
            }

            long Result = 0;

            Result = Convert.ToInt64((Sch_StudentsGroupAttendanceTableAdapter.DML(ActionCode, Id, StudentId, DayDate, AttFlag,
     ExceptionFlag, Notes, InvId, BranchId, OrgId, CreatedBy, UpdateBy, DeletedBy)));
            return Result;
        }
    }
    
}
