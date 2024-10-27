using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebGymAPP.Controls.Common
{
    public partial class HeaderMain : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["FullName"] == null || Session["UserID"] == null || Session["FullNameEn"] == null)
            //{
            //    Response.Redirect("Login.aspx");
            //}
           
            //HttpCookie cookieName = HttpContext.Current.Request.Cookies.Get("Name");
            //if (Session["SiteLanguage"].ToString() == "ArabicTheme")
            //{

            //    LoggedInUserLabel.Text = cookieName.Value.ToString();// Session["FullName"].ToString();
            //}
            //else
            //{
            //    LoggedInUserLabel.Text = cookieName.Value.ToString();  //Session["FullNameEn"].ToString();
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
            Session["FullNameEn"] = null;
            Response.Redirect("~/Admin/logout.aspx");
        }
    }
}