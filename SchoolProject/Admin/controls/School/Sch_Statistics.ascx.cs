using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSchool.ADMIN.Controls.School
{
    public partial class Sch_Statistics : System.Web.UI.UserControl
    {
        string Accessing, Adding, Updating, Deleting, Importing;
        protected void Page_Load(object sender, EventArgs e)
        {
            string previousUrl;
            if (Context.Request.UrlReferrer != null)
            {
                previousUrl = Context.Request.UrlReferrer.ToString();
            }
            else
            {
                previousUrl = "Main.aspx";
            }
            int USERID = int.Parse(Session["UserId"].ToString());// int.Parse(Session["UserID"].ToString());
            BOL.UsersPages DA1 = new BOL.UsersPages();
            DAL.UsersPages.UsersPagesDataTable dt = new DAL.UsersPages.UsersPagesDataTable();

            dt = DA1.Read("1", USERID, 13, "");
            if (dt.Rows.Count > 0)
            {
                DataRow UserRow = dt.Rows[0];
                Accessing = UserRow["Accessing"].ToString();
                Adding = UserRow["Adding"].ToString();
                Updating = UserRow["Updating"].ToString();
                Deleting = UserRow["Deleting"].ToString();
                Importing = UserRow["Importing"].ToString();

                // checking the access  
                if (Accessing != "True") { Response.Redirect("~/NoAccess.aspx?URL=" + previousUrl); }
                // checking the insert privlage 
                //if (Adding != "True") { NewRecord.Visible = false; }
            }
            else
            {
                Response.Redirect("~/NoAccess.aspx?URL=" + previousUrl);
            }

            if (!this.IsPostBack)
            {
                StartDateTextBox.Text = DateTime.Today.ToShortDateString();
            }
            Session["VendorID"] = 1;
            Search();


        }
    private void Search()
    {
            Nullable<DateTime> ToDate = null;
            Nullable<DateTime> FromDate = null;

            ToDate = null;
            FromDate = null;

            FromDate = DateTime.Parse(StartDateTextBox.Text);
            ToDate = DateTime.Parse(StartDateTextBox.Text + " 23:59");

            BOL.Sch_Invoices DA = new BOL.Sch_Invoices();
            DAL.School.Sch_InvoicesDataTable dt = new DAL.School.Sch_InvoicesDataTable();
            if (Session["OrgId"] != null)
            {
                string strOrgId = Session["OrgId"].ToString();

                long OrgId = long.Parse(strOrgId);
                decimal TotalInvDay = 0;
                decimal TotalInvAll = 0;
                decimal TotalPayCashDay = 0;
                decimal TotalPayKeyNetDay = 0;
                decimal TotalPayCheckday = 0;
                decimal TotalPayLinkday = 0;

                TotalInvDay = DA.InvoicesVIEWGetSumAll(null, null, FromDate, ToDate, null, OrgId);
                TotalInvAll = DA.InvoicesVIEWGetSumAll(null, null, null, ToDate, null, OrgId);

                lblDayInvoicess.Text = TotalInvDay.ToString();
                lblAllInvoices.Text = TotalInvAll.ToString();



                TotalPayCashDay = DA.PaymentReciteGetTotalPay(null, null, FromDate, ToDate, null, 1, OrgId);
                TotalPayKeyNetDay = DA.PaymentReciteGetTotalPay(null, null, FromDate, ToDate, null, 3, OrgId);
                TotalPayCheckday = DA.PaymentReciteGetTotalPay(null, null, FromDate, ToDate, null, 2, OrgId);
                TotalPayLinkday = DA.PaymentReciteGetTotalPay(null, null, FromDate, ToDate, null, 4, OrgId);

                lblPayDayCash.Text = TotalPayCashDay.ToString();
                lblPayDayKeyNet.Text = TotalPayKeyNetDay.ToString();
                //lblPayDayCheque.Text = TotalPayCheckday.ToString();
                lblPayDayLink.Text = TotalPayLinkday.ToString();

                lblDayPayments.Text = (TotalPayCashDay + TotalPayKeyNetDay + TotalPayCheckday + TotalPayLinkday).ToString();

                decimal TotalPayCash = DA.PaymentReciteGetTotalPay(null, null, null, ToDate, null, 1, OrgId);
                decimal TotalPayKeyNet = DA.PaymentReciteGetTotalPay(null, null, null, ToDate, null, 3, OrgId);
                decimal TotalPayCheck = DA.PaymentReciteGetTotalPay(null, null, null, ToDate, null, 2, OrgId);
                decimal TotalPayLink = DA.PaymentReciteGetTotalPay(null, null, null, ToDate, null, 4, OrgId);

                lblPayAllKeyNet.Text = TotalPayKeyNet.ToString();
                lblPayAllCash.Text = TotalPayCash.ToString();
                //lblPayAllCheque.Text = TotalPayCheck.ToString();
                lblPayAllLink.Text = TotalPayLink.ToString();

                lblDayPaymentsAll.Text = (TotalPayCash + TotalPayKeyNet + TotalPayCheck + TotalPayLink).ToString();
            }
            }
        protected void ClearLinkButton_Click(object sender, EventArgs e)
        {

        }

        protected void SearchLinkButton_Click(object sender, EventArgs e)
        {
            Search();
        }
    }
}