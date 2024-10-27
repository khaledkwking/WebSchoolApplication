using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.ERPAssetDataSetTableAdapters;
namespace BOL
{
    [System.ComponentModel.DataObject()]
    public partial class Qids
    {
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private QidsTableAdapter _QidsTableAdapter = null;
        protected QidsTableAdapter QidsAdapter
        {
            get
            {
                if (_QidsTableAdapter == null)
                {
                    _QidsTableAdapter = new QidsTableAdapter();
                }
                return _QidsTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </>
        #region "Read Section"
        public DAL.ERPAssetDataSet.QidsDataTable Read(string ActionCode, string StartDate, string EndDate,int recitetype, long QidId,long OrgId,long BRANCHId,long EmpId,int repeated, string SearchText)
        {
            return QidsAdapter.Read(ActionCode, StartDate,EndDate, recitetype,  QidId,  OrgId,  BRANCHId, EmpId, repeated, SearchText);
        }
        #endregion


        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>
        #region "DML Section"


        public long DML(string ActionCode, long qidid,    string qidcode  ,string qidDate , string Notes  ,int recitetype ,long BranchId ,
                long OrgId  ,	long EmpId   ,	bool repeated ,    long BankAccId  ,string ChequeNo ,long 	InvId ,long  ReorderInvId  ,
	            int PaymentType , string PaymentTo , int CreatedBy  ,int UpdateBy  ,int DeletedBy, string TotalDesc,  ref int? OutId)
        {
            long Result = 0;
            Nullable<long> tempInvId = null;
            if (InvId > 0) { tempInvId = InvId; }
            if (!String.IsNullOrEmpty(qidDate))
            {
                DateTime CurDate = DateTime.ParseExact(qidDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                qidDate = CurDate.ToString("MM/dd/yyyy");
            }
            Result = Convert.ToInt64((QidsAdapter.DML(ActionCode,  qidid,  qidcode,  qidDate,  Notes,  recitetype,  BranchId,
                 OrgId,  EmpId,  repeated,  BankAccId,  ChequeNo, tempInvId,   ReorderInvId,  PaymentType,  PaymentTo,  CreatedBy,  UpdateBy,  DeletedBy, TotalDesc, ref OutId)));
            return Result;
        }
        #endregion
    }
}
