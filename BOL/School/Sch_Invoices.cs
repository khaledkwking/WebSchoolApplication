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
    public partial class Sch_Invoices
    {
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private Sch_InvoicesTableAdapter _Sch_InvoicesTableAdapter = null;
        protected Sch_InvoicesTableAdapter Sch_InvoicesTableAdapter
        {
            get
            {
                if (_Sch_InvoicesTableAdapter == null)
                {
                    _Sch_InvoicesTableAdapter = new Sch_InvoicesTableAdapter();
                }
                return _Sch_InvoicesTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </>
        #region "Read Section"
        public DAL.School.Sch_InvoicesDataTable  Read(string ActionCode, string StartDate, string EndDate, long InvId, int InvType, int PayementTypeId, long OrgId, long BRANCHId, int UserId, long StudenId ,long PeriodId ,int SexId
            , string StudyStartDate, string StudyEndDate,
            string SearchText, int FinishFlag)
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
            return Sch_InvoicesTableAdapter.Read(ActionCode,  StartDate ,EndDate,  InvId , InvType , PayementTypeId , OrgId ,   BRANCHId , UserId,StudenId, PeriodId, SexId, StudyStartDate, StudyEndDate, SearchText, FinishFlag);
        }
        public int ReadCount(string ActionCode, int InvType, long OrgId,  int UserId, long StudenId,  string StudyStartDate, string StudyEndDate)
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
           
            var Count = Sch_InvoicesTableAdapter.GroupInvoicesCount(ActionCode, StudyStartDate, StudyEndDate, OrgId, UserId, InvType, StudenId);
            if (Count != null)
            {
                return int.Parse(Count.ToString());
            }
            return 0;
        }

        public int ReadIndividualCount(string ActionCode, int InvType, long OrgId, int UserId, long StudenId, string StudyStartDate, string StudyEndDate)
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

            var Count = Sch_InvoicesTableAdapter.InvoicesIndividualCount(ActionCode, StudyStartDate, StudyEndDate, OrgId, UserId, InvType, StudenId);
            if (Count != null)
            {
                return int.Parse(Count.ToString());
            }
            return 0;
        }

        #endregion


        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>
        #region "DML Section"


        public long DML(string ActionCode,
            long InvId , string InvCode ,	string InvDate,	long StudentId,
	long GroupId,short PaymentType,	long PaymentAccid,	short InvType,	decimal PaymentValue,	string PaymentDate,	string Notes,decimal invTotal,	decimal InvTotalNet,	decimal InvPayment,	decimal InvRemain ,	bool PayFinish,
	long CostId ,string StudyStartDate,	string StudyEndDate ,decimal MonthSubPrice,
	bool BusFlag,long BusId,string BusStartDate,string BusEndDate,
decimal BusPrice,int BusMonthNum,decimal BusTotalPrice,long UserId,string BusNotes ,string PervInfoNotes,long InvSerial,bool CourseFlag,decimal InvBackSale ,
decimal OldVaule,bool CancelFlag,bool StopFlag,bool MonthFlag,	bool DayFlag  ,long OrgId, long BranchId ,  int CreatedBy,int UpdateBy,int DeletedBy, ref long? InsertedId)
            
        {
            if (ActionCode == "1")
            {
                DAL.School.Sch_InvoicesDataTable dt = new DAL.School.Sch_InvoicesDataTable();

                dt = Read("4", "", "", 0, 0, 0, OrgId,0, 0, 0,0,0, "", "", "",0);

                if (dt.Count > 0)
                {
                    InvSerial = int.Parse(dt[0]["InvSerial"].ToString()) + 1;
                    InvCode = InvSerial.ToString();
                }
            }
            long Result = 0;
            if (!String.IsNullOrEmpty(InvDate))
            {
                
                    DateTime CurDate = Convert.ToDateTime(InvDate);
                    InvDate = CurDate.ToString("MM/dd/yyyy");
                
            }
            if (!String.IsNullOrEmpty(StudyEndDate))
            {
                
                DateTime CurStudyEndDate = Convert.ToDateTime(StudyEndDate);
                StudyEndDate = CurStudyEndDate.ToString("MM/dd/yyyy");
            }

            if (!String.IsNullOrEmpty(StudyStartDate))
            {
                DateTime CurStudyStartDate = Convert.ToDateTime(StudyStartDate);
                //DateTime CurStudyStartDate = DateTime.ParseExact(StudyStartDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                StudyStartDate = CurStudyStartDate.ToString("MM/dd/yyyy");
            }
            if (!String.IsNullOrEmpty(BusStartDate))
            {
                DateTime CurBusStartDate = DateTime.ParseExact(BusStartDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                BusStartDate = CurBusStartDate.ToString("MM/dd/yyyy");
            }
            if (!String.IsNullOrEmpty(BusEndDate))
            {
                DateTime CurBusEndDate = Convert.ToDateTime(BusEndDate);
                //DateTime CurBusEndDate = DateTime.ParseExact(BusEndDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                BusEndDate = CurBusEndDate.ToString("MM/dd/yyyy");
            }
            if (!String.IsNullOrEmpty(PaymentDate))
            {
                DateTime CurPaymentDate = Convert.ToDateTime(PaymentDate);
                //DateTime CurPaymentDate = DateTime.ParseExact(PaymentDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                PaymentDate = CurPaymentDate.ToString("MM/dd/yyyy");
            }
            Result = Convert.ToInt64((Sch_InvoicesTableAdapter.DML(ActionCode,
             InvId,  InvCode,  InvDate,  StudentId, GroupId,  PaymentType,  PaymentAccid,  InvType,  PaymentValue,  PaymentDate,  Notes,  invTotal,  InvTotalNet,  InvPayment,  InvRemain,  PayFinish,
             CostId,  StudyStartDate,  StudyEndDate,  MonthSubPrice, BusFlag,  BusId,  BusStartDate,  BusEndDate,
             BusPrice,  BusMonthNum,  BusTotalPrice,  UserId,  BusNotes,  PervInfoNotes,  InvSerial,  CourseFlag,  InvBackSale,
             OldVaule,  CancelFlag,  StopFlag,  MonthFlag,  DayFlag,BranchId,OrgId , CreatedBy,  UpdateBy,  DeletedBy, ref InsertedId)));
            return Result;
        }
        public decimal InvoicesVIEWGetSumAll(long? userId, long? StudentId, DateTime? FromDate, DateTime? ToDate, long? PeriodId, long OrgId)
        {
            decimal Result = 0;
             Result = decimal.Parse(Sch_InvoicesTableAdapter.InvoicesVIEWGetSumAll(userId, StudentId, FromDate, ToDate, PeriodId, OrgId).ToString ());

            return Result;
        }
        public decimal PaymentReciteGetTotalPay(long? userId, long? StudentId, DateTime? FromDate, DateTime? ToDate, long? PeriodId ,int PayementType, long OrgId)
        {
            decimal Result = 0;
             Result = decimal.Parse(Sch_InvoicesTableAdapter.PaymentReciteGetTotalPay(userId, StudentId, FromDate, ToDate, PeriodId,PayementType,OrgId).ToString());

            return Result;
        }
       
        #endregion
    }
}
