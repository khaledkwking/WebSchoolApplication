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
    public partial class Sch_PaymentReciteBack
    {
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private Sch_PaymentReciteBackTableAdapter _Sch_PaymentReciteBackTableAdapter = null;
        protected Sch_PaymentReciteBackTableAdapter Sch_PaymentReciteBackTableAdapter
        {
            get
            {
                if (_Sch_PaymentReciteBackTableAdapter == null)
                {
                    _Sch_PaymentReciteBackTableAdapter = new Sch_PaymentReciteBackTableAdapter();
                }
                return _Sch_PaymentReciteBackTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </>
        #region "Read Section"
        public DAL.School.Sch_PaymentReciteBackDataTable  Read(string ActionCode, string StartDate, string EndDate, long ReciteId, long InvId, int InvType, int PayementTypeId, long OrgId, long BRANCHId, int UserId, long StudenId, string SearchText)
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
            return Sch_PaymentReciteBackTableAdapter.Read(ActionCode, StartDate, EndDate, ReciteId, InvId,  InvType, PayementTypeId, OrgId, BRANCHId, UserId, StudenId, SearchText);
        }
        #endregion


        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>
        #region "DML Section"


        public long DML(string ActionCode, long ReciteId ,
    string ReciteCode ,string ReciteDate ,long StudentId ,string description,decimal PaymentValue,
	short PaymentType,long UserId ,long InvId ,long OrgId,decimal PaymentBefore ,long RecSerial , bool CloseFlag, int CreatedBy,int UpdateBy,int DeletedBy)
            
        {
            long Result = 0;
            if (!String.IsNullOrEmpty(ReciteDate))
            {
                if (!String.IsNullOrEmpty(ReciteDate))
                {
                    DateTime CurStartDate = Convert.ToDateTime(ReciteDate);
                    ReciteDate = CurStartDate.ToString("MM/dd/yyyy");

                }

            }
            
            //BOL.Sch_Invoices DA = new BOL.Sch_Invoices();
            //DAL.School.Sch_InvoicesDataTable dt = new DAL.School.Sch_InvoicesDataTable();
            //dt=DA.Read("1", "", "", InvId, 0, 0, OrgId, 0, 0, 0, "");
            //if (dt.Count > 0)
            //{
            //    decimal InvPayment = 0;
            //    decimal InvRemain = 0;
            //    decimal InvTotalNet = 0;
              
            //    if (dt[0]["InvTotalNet"] != DBNull.Value)
            //    {
            //        InvTotalNet = decimal.Parse(dt[0]["InvTotalNet"].ToString());
            //        if (dt[0]["InvRemain"] != DBNull.Value)
            //        {
            //            InvPayment = decimal.Parse(dt[0]["InvPayment"].ToString());
            //            InvRemain= decimal.Parse(dt[0]["InvRemain"].ToString());
            //            if (PaymentValue> InvRemain )
            //            {
            //                Result = -1;
            //            }
                       
            //        }
            //        if (PaymentValue > InvTotalNet)
            //        {
            //            Result = -1;
            //        }

            //    }
            //}
            //if (Result >= 0)
            //{
               Result = Convert.ToInt64((Sch_PaymentReciteBackTableAdapter.DML(ActionCode, ReciteId,
                ReciteCode, ReciteDate, StudentId, description, PaymentValue, PaymentType, UserId, InvId, OrgId, PaymentBefore, RecSerial,  CloseFlag , CreatedBy, UpdateBy, DeletedBy)));
            
            return Result;
        }
        #endregion
    }
}
