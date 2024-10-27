using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;


namespace WebSchool.Utilities

{
    public class BaseClass2 : System.Web.UI.Page
    {
        private void Page_PreInit(object sender, System.EventArgs e)
        {
            if (Request.QueryString["Lang"] != null)
            {
                if (Request.QueryString["Lang"] == "en")
                {
                    Session["SiteLanguage"] = "EnglishLoginTheme";
                }
                else if (Request.QueryString["Lang"] == "ar")
                {
                    Session["SiteLanguage"] = "ArabicLoginTheme";
                }
            }
            if (Request.QueryString["Lang"] != null)
            {
                if (Request.QueryString["Lang"] == "en")
                {
                    Session["SiteLanguage"] = "EnglishLoginTheme";
                }
                else if (Request.QueryString["Lang"] == "ar")
                {
                    Session["SiteLanguage"] = "ArabicLoginTheme";
                }
            }
            if (Session["SiteLanguage"] == null)
            {
                Session["SiteLanguage"] = "ArabicLoginTheme";
                Page.Theme = "ArabicLoginTheme";
                Page.Title = "اي تى رايت | نظام خدمات تعليمة .";
                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture("ar-KW");
                Thread.CurrentThread.CurrentUICulture = new CultureInfo("ar-KW");

            }
            else if (Session["SiteLanguage"].ToString() == "ArabicLoginTheme")
            {
                Page.Theme = "ArabicLoginTheme";
                Page.Title = "اي تى رايت | نظام خدمات تعليمة  .";
                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture("ar-KW");
                Thread.CurrentThread.CurrentUICulture = new CultureInfo("ar-KW");
            }
            else if (Session["SiteLanguage"].ToString() == "EnglishLoginTheme")
            {
                Page.Theme = "EnglishLoginTheme";
                Page.Title = "ITRight | Education system.";
                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture("en-US");
                Thread.CurrentThread.CurrentUICulture = new CultureInfo("en-US");
            }
            else
            {
                Page.Theme = "ArabicLoginTheme";
                Page.Title = "اي تى رايت |نظام خدمات تعليمة  .";
                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture("ar-KW");
                Thread.CurrentThread.CurrentUICulture = new CultureInfo("ar-KW");
            }

        }


    }
}