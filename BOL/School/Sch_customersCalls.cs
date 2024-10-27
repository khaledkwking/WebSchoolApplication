using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.CustomersTableAdapters;
namespace BOL
{
    [System.ComponentModel.DataObject()]
    public partial class Sch_customersCalls
    {
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private Sch_customersCallsTableAdapter _Sch_customersCallsTableAdapter = null;
        protected Sch_customersCallsTableAdapter Sch_customersCallsTableAdapter
        {
            get
            {
                if (_Sch_customersCallsTableAdapter == null)
                {
                    _Sch_customersCallsTableAdapter = new Sch_customersCallsTableAdapter();
                }
                return _Sch_customersCallsTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </>
        #region "Read Section"
        public DAL.Customers.Sch_customersCallsDataTable  Read(string ActionCode, long OrgId, long CustId,long AreaId, long CallId,int RelpyId, long UserId, string StartDate, string EndDate,long BranchId, string SearchText)
        {
            if (!String.IsNullOrEmpty(StartDate))
            {

                DateTime CurDate = Convert.ToDateTime(StartDate);
                StartDate = CurDate.ToString("MM/dd/yyyy");

            }
            if (!String.IsNullOrEmpty(EndDate))
            {

                DateTime CurStudyEndDate = Convert.ToDateTime(EndDate);
                EndDate = CurStudyEndDate.ToString("MM/dd/yyyy");
            }
            return Sch_customersCallsTableAdapter.Read(ActionCode, CustId, CallId,AreaId, RelpyId,UserId,StartDate ,EndDate, OrgId, BranchId,SearchText);
        }
        #endregion


        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>
        #region "DML Section"

 
        public long DML(string ActionCode,long CallId, long CustId,int ReplyId,string DayDate,string DayTime,string ReplyNotes,long userId,string Tel,string Notes
   ,long BranchId,long OrgId,int CreatedBy,int UpdateBy,int DeletedBy)

        {
            string CurDateDate = DayDate;
            Boolean CommitFlag = true;
            long Result = 0;
            if (!String.IsNullOrEmpty(DayDate))
            {

                DateTime CurDate = Convert.ToDateTime(DayDate);
                DayDate = CurDate.ToString("MM/dd/yyyy");

            }
            if (!String.IsNullOrEmpty(DayTime))
            {

                DateTime CurStudyEndDate = Convert.ToDateTime(DayTime);
                DayTime = CurStudyEndDate.ToString("MM/dd/yyyy");
            }
            if (ActionCode == "1")
            {
                DAL.Customers.Sch_customersCallsDataTable dt = Read("1", OrgId, CustId, 0, 0, ReplyId, userId, CurDateDate, CurDateDate, 0, "");
                if (dt.Count >=1)
                {
                    CommitFlag = false;
                }
            }
            if (CommitFlag)
            {
                Result = Convert.ToInt64((Sch_customersCallsTableAdapter.DML(ActionCode, CallId, CustId, ReplyId, DayDate, DayTime, ReplyNotes, userId, Tel, Notes,
                 BranchId, OrgId, CreatedBy, UpdateBy, DeletedBy)));
            }
            return Result;
        }
        #endregion
    }
}
