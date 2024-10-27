using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSchool.Controls.ContentPages
{
    public partial class Main : System.Web.UI.UserControl
    {
        private void GetNotifacations()
        {
            BOL.Sch_InvPaymentDates DA3 = new BOL.Sch_InvPaymentDates();
            DAL.InvPaymentDates.Sch_InvPaymentDatesDataTable dt3 = new DAL.InvPaymentDates.Sch_InvPaymentDatesDataTable();
            DateTime DayDate = DateTime.Today.AddDays(3);
            int USERID = int.Parse(Session["UserId"].ToString());
            long QrgId = long.Parse(Session["OrgId"].ToString());
            int RoleId = 0;
            if (Session["RoleID"] != null)
            {
                if (Session["RoleID"].ToString() != "")
                {
                    RoleId = int.Parse(Session["RoleID"].ToString());
                }
                if (RoleId == 1 || RoleId == 5)
                {
                    USERID = 0;
                }
            }



            int Count = DA3.ReadCount("1", "", DayDate.ToShortDateString(), QrgId, USERID, 0, 0);
            Globals.TotalNotPayDate = Count.ToString();

            BOL.Sch_Invoices DAInv = new BOL.Sch_Invoices();
            DAL.School.Sch_InvoicesDataTable dtInv = new DAL.School.Sch_InvoicesDataTable();

            int InvCount = DAInv.ReadCount("1", 2, QrgId, USERID, 0, "", DayDate.ToShortDateString());
            Globals.TotalNotGroup = InvCount.ToString();

            int InvIndCount = DAInv.ReadIndividualCount("1", 1, QrgId, USERID, 0, "", "");
            Globals.TotalNotInv = InvIndCount.ToString();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            GetNotifacations();
            HttpCookie cookieUserType;
            if (Globals.CompanyName != "")
            {
                lblCompanyname.Text = Globals.CompanyName;
            }
            cookieUserType = HttpContext.Current.Request.Cookies.Get("UserType");
            if (cookieUserType != null)
            {
                if (cookieUserType.Value != "1")
                {
                    SetPermission();
                }

            }
        }
        private void SetPermission()
        {
            if (!Globals.SubscriptionsPrim[0])
            {
                Subs.Attributes["class"] = "disabled";
            }
            if (!Globals.UsersPrim[0])
            {
                Users.Attributes["class"] = "disabled";
            }
            if (!Globals.RenewSubscriptionPrim[0])
            {
                RenewSub.Attributes["class"] = "disabled";
            }
            if (!Globals.SubscribersPrim[0])
            {
                Subscribers.Attributes["class"] = "disabled";
            }
            if (!Globals.ExpiredSubscriptionsPrim[0])
            {
                ExpiredSub.Attributes["class"] = "disabled";
            }
            if (!Globals.setupPrim[0])
            {
                Setup.Attributes["class"] = "disabled";
            }
            if (!Globals.PriceListPrim[0])
            {
                PriceList.Attributes["class"] = "disabled";
            }

        }
    }
}