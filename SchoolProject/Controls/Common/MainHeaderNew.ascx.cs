using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSchool.Controls.Common
{
    public partial class MainHeaderNew : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //BOL.Sch_InvPaymentDates DA3 = new BOL.Sch_InvPaymentDates();
            //DAL.InvPaymentDates.Sch_InvPaymentDatesDataTable dt3 = new DAL.InvPaymentDates.Sch_InvPaymentDatesDataTable();
            //DateTime DayDate = DateTime.Today.AddDays(3);
            //int USERID = int.Parse(Session["UserId"].ToString());
            //long QrgId = long.Parse(Session["OrgId"].ToString());
            //int RoleId = 0;
            //if (Session["RoleID"]!=null)
            //{
            //    if (Session["RoleID"].ToString () != "")
            //    {
            //        RoleId = int.Parse(Session["RoleID"].ToString());
            //    }
            //    if (RoleId == 1 || RoleId == 5)
            //    {
            //        USERID = 0;
            //    }
            //}
            

            //int Count = DA3.ReadCount("1", "", DayDate.ToShortDateString(), QrgId, USERID, 0, 0);
            lblcount.Text = Globals.TotalNotPayDate;

            //BOL.Sch_Invoices  DAInv = new BOL.Sch_Invoices();
            //DAL.School.Sch_InvoicesDataTable  dtInv = new DAL.School.Sch_InvoicesDataTable();

            //int InvCount = DAInv.ReadCount("1",2, QrgId, USERID,0,"",DayDate.ToShortDateString());
            lblcountInvGroup.Text = Globals.TotalNotGroup;// InvCount.ToString();

            //int InvIndCount = DAInv.ReadIndividualCount("1", 1, QrgId, USERID, 0, "", "");
            lblcountInvInd.Text = Globals.TotalNotInv;// InvIndCount.ToString();
        }
        protected void ArabicLang_Click(object sender, EventArgs e)
        {
            Session["SiteLanguage"] = "ArabicTheme";
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture("ar-KW");
            Thread.CurrentThread.CurrentUICulture = new CultureInfo("ar-KW");
            Response.Redirect(Request.RawUrl);
        }

        protected void EnglishLang_Click(object sender, EventArgs e)
        {
            Session["SiteLanguage"] = "EnglishTheme";
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture("en-US");
            Thread.CurrentThread.CurrentUICulture = new CultureInfo("en-US");
            Response.Redirect(Request.RawUrl);
        }

    }
}