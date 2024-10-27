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
    public partial class Sch_PaymentRecite
    {
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private Sch_PaymentReciteTableAdapter _Sch_PaymentReciteTableAdapter = null;
        protected Sch_PaymentReciteTableAdapter Sch_PaymentReciteTableAdapter
        {
            get
            {
                if (_Sch_PaymentReciteTableAdapter == null)
                {
                    _Sch_PaymentReciteTableAdapter = new Sch_PaymentReciteTableAdapter();
                }
                return _Sch_PaymentReciteTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </>
        #region "Read Section"
        public DAL.School.Sch_PaymentReciteDataTable Read(string ActionCode, string StartDate, string EndDate, long ReciteId, long InvId, int InvType, int PayementTypeId, long OrgId, long BRANCHId, int UserId, long StudenId, string SearchText)
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
            return Sch_PaymentReciteTableAdapter.Read(ActionCode, StartDate, EndDate, ReciteId, InvId, InvType, PayementTypeId, OrgId, BRANCHId, UserId, StudenId, SearchText);
        }
        #endregion


        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>
        #region "DML Section"


        public long DML(string ActionCode, long ReciteId,
    string ReciteCode, string ReciteDate, long StudentId, string description, decimal PaymentValue,
    short PaymentType, long UserId, long InvId, long OrgId, decimal PaymentBefore, long RecSerial, int CreatedBy, int UpdateBy, int DeletedBy)

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
            Result = Convert.ToInt64((Sch_PaymentReciteTableAdapter.DML(ActionCode, ReciteId,
             ReciteCode, ReciteDate, StudentId, description, PaymentValue, PaymentType, UserId, InvId, OrgId, PaymentBefore, RecSerial, CreatedBy, UpdateBy, DeletedBy)));

            SetInvPaymentDates(PaymentValue, InvId, UpdateBy);  // update PaymentDates
            return Result;
        }

        private void SetInvPaymentDates(decimal RecPaymentValue, long InvId, int UpdateBy)
        {


            BOL.Sch_InvPaymentDates dtDet = new BOL.Sch_InvPaymentDates();
            DAL.InvPaymentDates.Sch_InvPaymentDatesDataTable det = dtDet.Read("1", "", "", 0, InvId, 0, 0, 0, 0, 0, 0, 0,false, "");

            BOL.Sch_Invoices DaInv = new BOL.Sch_Invoices();
            DAL.School.Sch_InvoicesDataTable dtInv = DaInv.Read("1", "", "",  InvId,0, 0, 0, 0, 0, 0, 0, 0, "","","",0);

            decimal PaymentValue = 0;
            if (dtInv.Count>0)
            {
                PaymentValue= dtInv[0].InvPayment;
            }
            if (PaymentValue > 0)
            {
                decimal InvRemainPayment = 0;
                for (int i = 0; i < det.Count; i++)
                {

                    bool FinishFlag = det[i].FinishFlag;
                    long PayId = det[i].PayId;
                    //dgcb.DataSource = productUnitsPricesBindingSource;
                    // Filter the BindingSource based upon the region selected

                    //if (!FinishFlag)
                    //{
                    decimal DebtPaymentValue = det[i].Amount;

                    InvRemainPayment = PaymentValue - DebtPaymentValue;
                    if (InvRemainPayment >= 0)
                    {
                        dtDet.DML("4", PayId, 0, 0, "", "", "", 0, 0, DebtPaymentValue, true, 0, UpdateBy, 0);
                        PaymentValue = InvRemainPayment;
                        if (InvRemainPayment == 0)
                        {
                            break; //exit
                        }
                    }
                    else if (InvRemainPayment < 0)
                    {
                        decimal Remain = PaymentValue;
                        dtDet.DML("4", PayId, 0, 0, "", "", "", 0, 0, Remain, false, 0, UpdateBy, 0);
                        break;
                    }

                    // }

                }
            }
        }





        #endregion
    }
}
