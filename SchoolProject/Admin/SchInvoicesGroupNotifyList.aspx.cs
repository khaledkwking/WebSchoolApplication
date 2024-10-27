using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SchInvoicesGroupNotifyList : WebSchool.Utilities.BaseClass
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //HttpCookie cookieUserType;

        //cookieUserType = HttpContext.Current.Request.Cookies.Get("UserType");
        //if (cookieUserType != null)
        //{
        //    if (cookieUserType.Value != "1")
        //    {
        //        //SetPermission();
        //    }

        //}
        //SetInvPaymentDates(0,0, 0);


    }
    private void SetInvPaymentDates(decimal RecPaymentValue, long InvId, int UpdateBy)
    {


      

        BOL.Sch_Invoices DaInv = new BOL.Sch_Invoices();
        DAL.School.Sch_InvoicesDataTable dtInv = DaInv.Read("1", "", "", InvId, 0, 0, 0, 0, 0, 0, 0, 0, "", "", "", 0);
        for (int j=0; j< dtInv.Count;j++)
        {
            InvId = dtInv[j].InvId;
            BOL.Sch_InvPaymentDates dtDet = new BOL.Sch_InvPaymentDates();
            DAL.InvPaymentDates.Sch_InvPaymentDatesDataTable det = dtDet.Read("1", "", "", 0, InvId, 0, 0, 0, 0, 0, 0, 0,false, "");

        decimal PaymentValue = 0;
        if (dtInv.Count > 0)
        {
            PaymentValue = dtInv[j].InvPayment;
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
                }
                // }
            }

        }

    }


    //private void SetPermission()
    //{
    //    if (!Globals.SubscriptionsPrim[0])
    //    {
    //        Subs.Attributes["class"] = "disabled";
    //    }
    //    if (!Globals.UsersPrim[0])
    //    {
    //        Users.Attributes["class"] = "disabled";
    //    }
    //    if (!Globals.RenewSubscriptionPrim[0])
    //    {
    //        RenewSub.Attributes["class"] = "disabled";
    //    }
    //    if (!Globals.SubscribersPrim[0])
    //    {
    //        Subscribers.Attributes["class"] = "disabled";
    //    }
    //    if (!Globals.ExpiredSubscriptionsPrim[0])
    //    {
    //        ExpiredSub.Attributes["class"] = "disabled";
    //    }
    //    if (!Globals.setupPrim[0])
    //    {
    //        Setup.Attributes["class"] = "disabled";
    //    }
    //    if (!Globals.PriceListPrim[0])
    //    {
    //        PriceList.Attributes["class"] = "disabled";
    //    }
    //}
}