using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSchool.Controls.CommonTeacher
{
    public partial class TeacherHeaderNew : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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