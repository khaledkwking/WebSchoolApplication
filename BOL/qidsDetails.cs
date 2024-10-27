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
    public partial class qidsDetails
    {
      
         public static int QidInValue=7;
         public static int QidOutValue = 6;
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private QidDetailsTableAdapter _QidDetailsTableAdapter = null;
        protected QidDetailsTableAdapter QidDetailsAdapter
        {
            get
            {
                if (_QidDetailsTableAdapter == null)
                {
                    _QidDetailsTableAdapter = new QidDetailsTableAdapter();
                }
                return _QidDetailsTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </>
        #region "Read Section"
        public DAL.ERPAssetDataSet.QidDetailsDataTable Read(string ActionCode, string StartDate, string EndDate, int recitetype, long QidId,long Id, long OrgId, long BRANCHId, int EmpId,int Detcode,long AccountId, long ParentAccountId, long CostId, string SearchText)
        {
            if (!String.IsNullOrEmpty(StartDate))
            {
                DateTime CurDate = DateTime.ParseExact(StartDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                StartDate = CurDate.ToString("MM/dd/yyyy");
            }

            if (!String.IsNullOrEmpty(EndDate))
            {
                DateTime CurDate = DateTime.ParseExact(EndDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                EndDate = CurDate.ToString("MM/dd/yyyy");
            }

            return QidDetailsAdapter.Read(ActionCode, StartDate, EndDate, recitetype, QidId, Id, OrgId, BRANCHId, EmpId, Detcode, AccountId, ParentAccountId,CostId, SearchText); 
        }
        #endregion


        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>
        #region "DML Section"
       

        public long DML(string ActionCode, long ID ,    long qidid ,decimal FromValue ,decimal ToValue ,long ACCOUNTID ,    short Type,
    string Description ,    string EnterDate ,    int Detcode  ,int QidType  ,decimal TotalPrice , int ActionType  ,long CostId , int CreatedBy  ,  int UpdateBy  , int DeletedBy   )
        {
            long Result = 0;
            Nullable<decimal> tempFromValue = null;
            Nullable<decimal> tempToValue = null;
            Nullable<long> tempCostId = null;
            if (FromValue > 0) { tempFromValue= FromValue; }
            if (ToValue > 0) { tempToValue = ToValue; }
            if (CostId > 0) { tempCostId = CostId; }

            if (!String.IsNullOrEmpty(EnterDate))
            {
                DateTime CurDate = DateTime.ParseExact(EnterDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                EnterDate = CurDate.ToString("MM/dd/yyyy");
            }
          
            Result = Convert.ToInt64((QidDetailsAdapter.DML( ActionCode,  ID, qidid, tempFromValue, tempToValue, ACCOUNTID, Type,   Description,  EnterDate,  Detcode,  QidType,  TotalPrice,  ActionType, tempCostId,  CreatedBy,  UpdateBy,  DeletedBy)));
            return Result;
        }
        #endregion
    }
}