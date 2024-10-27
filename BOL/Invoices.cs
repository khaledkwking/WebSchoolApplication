using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.InvoicesTableAdapters;
namespace BOL
{
    [System.ComponentModel.DataObject()]
    public partial class Invoices
    {
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private  InvoicesTableAdapter _InvoicesTableAdapter = null;
        protected InvoicesTableAdapter InvoicesAdapter
        {
            get
            {
                if (_InvoicesTableAdapter == null)
                {
                    _InvoicesTableAdapter = new InvoicesTableAdapter();
                }
                return _InvoicesTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </>
        #region "Read Section"
        public DAL.Invoices.InvoicesDataTable Read(string ActionCode, string StartDate, string EndDate, long InvId,int InvtypeId, int InvPaymentTypeId,int PayTypeId,long OrgId,long BRANCHId,int EmpId, long CostId, string SearchText)
        {
            return InvoicesAdapter.Read(ActionCode, StartDate,EndDate, InvId, InvtypeId,InvPaymentTypeId, PayTypeId, OrgId,  BRANCHId, EmpId,CostId, SearchText);
        }
        #endregion


        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>
        #region "DML Section"


        public long DML(string ActionCode,long InvId , string InvCode  , string RecoderCode ,string InvDate ,
                long Cust_Sup_Accid  ,long InvAccid ,short PaymentType,long PaymentAccid ,long BranchId ,int InvType  ,   long EmpId  , decimal  PaymentValue  , string PaymentDate ,
                    string Notes,decimal invTotal,double Discount,decimal InvTotalNet,decimal InvPayment,decimal InvRemain,long ReferID,
                decimal PaymentCost,string ChequeNo,bool ChequeFlag,decimal TotalAddCost,decimal TotalReoder,decimal TotalReoderNet,long CostId,long SUP_CUST_ID,bool PayFinish,decimal CollectValue,decimal KeyNetValue,
                decimal VisaValue,decimal MasterValue,decimal ChequeValue,decimal OtherValue  ,long CustId  ,long Serial  ,
                long OrgId  ,int PayeTypeId, int CreatedBy  ,int UpdateBy  ,int DeletedBy ,  ref int? OutId)
        {
            long Result = 0;
            //Nullable<long> tempInvId = null;
            //if (InvId > 0) { tempInvId = InvId; }
            if (!String.IsNullOrEmpty(InvDate))
            {
                DateTime CurDate = DateTime.ParseExact(InvDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                InvDate = CurDate.ToString("MM/dd/yyyy");
            }
            if (ActionCode == "1")
            {
                DAL.Invoices.InvoicesDataTable dt = new DAL.Invoices.InvoicesDataTable();

                dt = Read("4", "", "", 0, 0, 0,0, OrgId, 0, 0, 0, "");

                if (dt.Count > 0)
                {
                    Serial = int.Parse(dt[0]["InvSerial"].ToString()) + 1;
                    InvCode = Serial.ToString();
                }
            }
            Result = Convert.ToInt64((InvoicesAdapter.DML(ActionCode,  InvId,  InvCode,  RecoderCode,  InvDate,
                 Cust_Sup_Accid,  InvAccid,  PaymentType,  PaymentAccid,  BranchId,  InvType,  EmpId,   PaymentValue,  PaymentDate,
                     Notes,  invTotal,  Discount,  InvTotalNet,  InvPayment,  InvRemain,  ReferID,
                 PaymentCost,  ChequeNo,  ChequeFlag,  TotalAddCost,  TotalReoder,  TotalReoderNet,  CostId,  SUP_CUST_ID,  PayFinish,  CollectValue,  KeyNetValue,
                 VisaValue,  MasterValue,  ChequeValue,  OtherValue,  CustId,  Serial,
                 OrgId,PayeTypeId,  CreatedBy,  UpdateBy,  DeletedBy, ref OutId)));
            return Result;
        }
        #endregion
        
    }
}
