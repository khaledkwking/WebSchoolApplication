using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.SchoolTableAdapters;
namespace BOL
{
    [System.ComponentModel.DataObject()]
    public partial class Sch_InvoicesDetails
    {
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private Sch_InvoicesDetailsTableAdapter _Sch_InvoicesDetailsTableAdapter = null;
        protected Sch_InvoicesDetailsTableAdapter Sch_InvoicesDetailsTableAdapter
        {
            get
            {
                if (_Sch_InvoicesDetailsTableAdapter == null)
                {
                    _Sch_InvoicesDetailsTableAdapter = new Sch_InvoicesDetailsTableAdapter();
                }
                return _Sch_InvoicesDetailsTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </>
        #region "Read Section"
        public DAL.School.Sch_InvoicesDetailsDataTable  Read(string ActionCode, string StartDate, string EndDate, long InvDetId,long InvId, int InvType, int PayementTypeId, long OrgId, long BRANCHId, int UserId,long StudenId,long GroupId,long PeriodId,long SubjectId, string SearchText)
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

            return Sch_InvoicesDetailsTableAdapter.Read(ActionCode, StartDate, EndDate, InvDetId ,InvId,  InvType, PayementTypeId, OrgId, BRANCHId, UserId, StudenId,  GroupId,  PeriodId, SubjectId, SearchText);
        }
        #endregion


        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>
        #region "DML Section"


        public long DML(string ActionCode, long InvDetId,   long InvId,  long SubjectId,
    decimal MonthNum,    decimal HourNumPerMonth,    decimal HourPrice,    decimal TotalPrice,    short InvType,    decimal RemainHours,
    long TeacherId, int CreatedBy,int UpdateBy,int DeletedBy)
            
        {
            long Result = 0;
          
            Result = Convert.ToInt64((Sch_InvoicesDetailsTableAdapter.DML(ActionCode,InvDetId , InvId  , SubjectId ,  MonthNum  , HourNumPerMonth , HourPrice ,TotalPrice ,     InvType  ,
     RemainHours ,     TeacherId,CreatedBy,  UpdateBy,  DeletedBy)));
            return Result;
        }
        #endregion
    }
}
