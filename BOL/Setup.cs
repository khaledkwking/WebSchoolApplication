using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.SetupTableAdapters;
namespace BOL
{
    [System.ComponentModel.DataObject()]
    public partial class Setup
    {
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private SetupTableAdapter _SetupTableAdapter = null;
        protected SetupTableAdapter SetupAdapter
        {
            get
            {
                if (_SetupTableAdapter == null)
                {
                    _SetupTableAdapter = new SetupTableAdapter();
                }
                return _SetupTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </>
        #region "Read Section"
        public DAL.Setup.SetupDataTable Read(string ActionCode, long OrgId,string StartDate, string EndDate, string SearchText)
        {
          

            return SetupAdapter.Read(ActionCode, OrgId,StartDate, EndDate, SearchText);
        }
        #endregion


        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>
        #region "DML Section"


        public long DML(string ActionCode, long Code, short custaccid, short suppaccid, short salesaccid, long salesAgalaccid,
       short purchaseaccid, long purchaseAgalaccid, long boxaccid, long bankaccid, long PurReorderaccid, long SalReorderaccid, long PurReorderAgalaccid,
        long SalReorderAgalaccid, long Discountaccid, long Paymentsaccid, long purchasePayaccid, long Mainsalesaccid, long MainPurchaseaccid,
        long OsalAccId, long DeductAccId, string CompanyName, string CompanyNameEng, string Address, string AddressEng, string TelPhone,
        string TelPhoneEng, string CompActivty, string Fax, string FaxEng, string Email, long SalesTakastaccid,
       long MovmentProfitsAccid, bool ExpiredFlag, string SubStartDate, string SubEndDate,string ImageLogo,ref long? OutId)
        {
            long Result = 0;
          
            if (!String.IsNullOrEmpty(SubStartDate))
            {
                DateTime CurDate = DateTime.ParseExact(SubStartDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                SubStartDate = CurDate.ToString("MM/dd/yyyy");
            }
            if (!String.IsNullOrEmpty(SubEndDate))
            {
                DateTime CurDate = DateTime.ParseExact(SubEndDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                SubEndDate = CurDate.ToString("MM/dd/yyyy");
            }
            Result = Convert.ToInt64((SetupAdapter.DML( ActionCode,  Code,  custaccid,  suppaccid,  salesaccid,  salesAgalaccid,
        purchaseaccid,  purchaseAgalaccid,  boxaccid,  bankaccid,  PurReorderaccid,  SalReorderaccid,  PurReorderAgalaccid,
         SalReorderAgalaccid,  Discountaccid,  Paymentsaccid,  purchasePayaccid,  Mainsalesaccid,  MainPurchaseaccid,
         OsalAccId,  DeductAccId,  CompanyName,  CompanyNameEng,  Address,  AddressEng,  TelPhone,
         TelPhoneEng,  CompActivty,  Fax,  FaxEng,  Email,  SalesTakastaccid,
        MovmentProfitsAccid,  ExpiredFlag,  SubStartDate,  SubEndDate, ImageLogo, ref OutId)));
            return Result;
        }
        #endregion
    }
}
