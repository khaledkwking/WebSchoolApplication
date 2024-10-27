using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSchool.ADMIN.Controls.Common
{
    public partial class HeaderAdmin : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!ScriptManager1.IsInAsyncPostBack)
                Session["timeout"] = DateTime.Now.AddMinutes(60).ToString();

            if (Session["FullName"] != null)
            {
                FullNameLabel.Text = Session["FullName"].ToString();
            }

            //if (Session["ApplicantID"] != null)
            //{
            //    BOL.Applicants DA = new BOL.Applicants();
            //    DAL.Applicants.ApplicantsDataTable dt = new DAL.Applicants.ApplicantsDataTable();

            //    dt = DA.Read("2.0", int.Parse(Session["ApplicantID"].ToString()), "", "", "", "");

            //    if (dt.Rows.Count > 0)
            //    {
            //        DataRow UserRow = dt.Rows[0];
            //        FullNameLabel.Text = UserRow["FullName"].ToString();
            //        Session["ApplicantID"] = UserRow["ApplicantID"];
            //    }
            //    else
            //    {
            //        Response.Redirect("~/default.aspx");
            //    }
            //}

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

        protected void LogoutLinkButton_Click(object sender, EventArgs e)
        {
            Session["FullName"] = null;
            Session["UserID"] = null;
            Session["RoleID"] = null;
            Response.Redirect("~/Login.aspx");
        }
    }
}