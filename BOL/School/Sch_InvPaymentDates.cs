using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.InvPaymentDatesTableAdapters;
namespace BOL
{
    [System.ComponentModel.DataObject()]
    public partial class Sch_InvPaymentDates
    {
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private Sch_InvPaymentDatesTableAdapter _Sch_InvPaymentDatesTableAdapter = null;
        protected Sch_InvPaymentDatesTableAdapter Sch_InvPaymentDatesTableAdapter
        {
            get
            {
                if (_Sch_InvPaymentDatesTableAdapter == null)
                {
                    _Sch_InvPaymentDatesTableAdapter = new Sch_InvPaymentDatesTableAdapter();
                }
                return _Sch_InvPaymentDatesTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </>
        #region "Read Section"
        public DAL.InvPaymentDates.Sch_InvPaymentDatesDataTable  Read(string ActionCode, string StartDate, string EndDate, long PayId, long InvId, int InvType, int PayementTypeId, long OrgId, long BRANCHId, int UserId, long StudenId,long PeriodId ,bool FinishFlag, string SearchText)
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
            return Sch_InvPaymentDatesTableAdapter.Read(ActionCode,  StartDate ,EndDate , PayId,  InvId , InvType , PayementTypeId , OrgId ,   BRANCHId , UserId,StudenId, PeriodId, FinishFlag, SearchText  );
        }
        #endregion

        public int ReadCount(string ActionCode, string StartDate, string EndDate, long OrgId,  int UserId, long StudenId, long PeriodId)
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
            var Count= Sch_InvPaymentDatesTableAdapter.ReadCount (ActionCode, StartDate, EndDate, OrgId, UserId, StudenId, PeriodId);
            if (Count !=null)
            {
                return int.Parse(Count.ToString ());
            }
            return 0;
        }
        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>
        #region "DML Section"


        public long DML(string ActionCode,long PayId, long InvId  , decimal Amount, string PayDate, string NotesDate, string Notes,short InvType, long OrgId , decimal AmountPay, bool FinishFlag, int CreatedBy,int UpdateBy,int DeletedBy)
            
        {
            long Result = 0;
            if (!String.IsNullOrEmpty(PayDate))
            {
                
                    DateTime CurDate = Convert.ToDateTime(PayDate);
                    PayDate = CurDate.ToString("MM/dd/yyyy");
                
            }
           
            
            Result = Convert.ToInt64((Sch_InvPaymentDatesTableAdapter.DML(ActionCode,PayId, InvId,  Amount,  PayDate,  Notes, InvType,OrgId, AmountPay, FinishFlag, CreatedBy,  UpdateBy,  DeletedBy)));
            return Result;
        }
        #endregion
    }
}
