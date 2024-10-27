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
    public partial class InvoicesProduct
    {
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private  InvoicesProductTableAdapter _InvoicesProductTableAdapter = null;
        protected InvoicesProductTableAdapter InvoicesProductAdapter
        {
            get
            {
                if (_InvoicesProductTableAdapter == null)
                {
                    _InvoicesProductTableAdapter = new InvoicesProductTableAdapter();
                }
                return _InvoicesProductTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </>
        #region "Read Section"
        public DAL.Invoices.InvoicesProductDataTable Read(string ActionCode, string StartDate, string EndDate, long InvId,int InvTypeId, int InvPaymentTypeId, int PayTypeId,long BRANCHId,int EmpId, long OrgId, string SearchText)
        {
            return InvoicesProductAdapter.Read(ActionCode, StartDate,EndDate, InvId,InvTypeId, InvPaymentTypeId, PayTypeId, OrgId, BRANCHId, EmpId, SearchText);
        }
        #endregion


        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>
        #region "DML Section"


        public long DML(string ActionCode,long Inv_Product_Id,long InvId ,long ProductId, long UnitId ,
    Double Qty , Double ReorderQty ,decimal Price , long StoreId , Double Discount ,string  VaildDate,decimal TotalPrice , bool ReoderFlag  ,decimal TotReOderPrice ,    string PRODUCTBRAND  ,
	Double ConFactor  ,	long ReoderId ,decimal ItemNo  ,string ReorderDate,	int InvType ,
    int CreatedBy,  int UpdateBy  , int DeletedBy ,ref int? OutId)
        {

            long Result = 0;
            //Nullable<long> tempInvId = null;
            //if (InvId > 0) { tempInvId = InvId; }
            if (!String.IsNullOrEmpty(VaildDate))
            {
                DateTime CurDate = DateTime.ParseExact(VaildDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                VaildDate = CurDate.ToString("MM/dd/yyyy");
            }
            Result = Convert.ToInt64((InvoicesProductAdapter.DML(ActionCode, Inv_Product_Id,  InvId,  ProductId,  UnitId,
             Qty,  ReorderQty,  Price,  StoreId,  Discount,   VaildDate,  TotalPrice,  ReoderFlag,  TotReOderPrice,  PRODUCTBRAND,
             ConFactor,  ReoderId,  ItemNo,  ReorderDate,  InvType, CreatedBy,  UpdateBy,  DeletedBy,    ref OutId)));
            return Result;
        }
        #endregion
    }
}
