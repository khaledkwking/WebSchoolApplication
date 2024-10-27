using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;
using System.Data;
using System.Globalization;
public partial class CompanyRegister : WebSchool.Utilities.BaseClass2
{
    protected void Page_Load(object sender, EventArgs e)
    {
       

    }
    protected void EnglishLang_Click(object sender, EventArgs e)
    {
        Session["SiteLanguage"] = "EnglishTheme";
        Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture("en-US");
        Thread.CurrentThread.CurrentUICulture = new CultureInfo("en-US");
        Response.Redirect(Request.RawUrl);
    }

    protected void ArabicLang_Click(object sender, EventArgs e)
    {
        Session["SiteLanguage"] = "ArabicTheme";
        Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture("ar-KW");
        Thread.CurrentThread.CurrentUICulture = new CultureInfo("ar-KW");
        Response.Redirect(Request.RawUrl);
    }
}