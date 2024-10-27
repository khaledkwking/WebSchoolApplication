using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;

namespace WebSchool.Utilities
{
    public class BaseClass : System.Web.UI.Page
    {
        private void Page_PreInit(object sender, System.EventArgs e)
        {
            HttpCookie cookieOrgId = HttpContext.Current.Request.Cookies.Get("OrgId");
            HttpCookie cookieName = HttpContext.Current.Request.Cookies.Get("Name");
            HttpCookie cookieUserId = HttpContext.Current.Request.Cookies.Get("UserId");
            HttpCookie cookieUserType = HttpContext.Current.Request.Cookies.Get("UserType");

            if (Session["username"] == null && Session["OrgId"]==null)
            {
                //Response.Redirect("~/Default.aspx");
            }


            if (Request.QueryString["Lang"] != null)
            {
                if (Request.QueryString["Lang"] == "en")
                {
                    Session["SiteLanguage"] = "EnglishTheme";
                }
                else if (Request.QueryString["Lang"] == "ar")
                {
                    Session["SiteLanguage"] = "ArabicTheme";
                }
            }
            if (Session["SiteLanguage"] == null)
            {
                Session["SiteLanguage"] = "ArabicTheme";
                Page.Theme = "ArabicTheme";
                Page.Title = Globals.CompanyName + "اي تى رايت | .";
                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture("ar-KW");
                Thread.CurrentThread.CurrentUICulture = new CultureInfo("ar-KW");

            }
            else if (Session["SiteLanguage"].ToString() == "ArabicTheme")
            {
                Page.Theme = "ArabicTheme";
                Page.Title = Globals.CompanyName+ "اي تى رايت | .";
                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture("ar-KW");
                Thread.CurrentThread.CurrentUICulture = new CultureInfo("ar-KW");
            }
            else if (Session["SiteLanguage"].ToString() == "EnglishTheme")
            {
                Page.Theme = "EnglishTheme";
                Page.Title = Globals.CompanyName + "اي تى رايت | .";
                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture("en-US");
                Thread.CurrentThread.CurrentUICulture = new CultureInfo("en-US");
            }
            else
            {
                Page.Theme = "ArabicTheme";
                Session["SiteLanguage"] = "ArabicTheme";
                Page.Title = Globals.CompanyName + "اي تى رايت | .";
                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture("ar-KW");
                Thread.CurrentThread.CurrentUICulture = new CultureInfo("ar-KW");
            }
        }
        //private void Page_PreInit(object sender, System.EventArgs e)
        //{
        //    //if (Session["FullName"] == null || Session["UserID"] == null || Session["FullNameEn"] == null)
        //    //{
        //    //    Session["Url"] = Server.UrlEncode(Request.Url.AbsoluteUri).ToString();
        //    //    Response.Redirect("new/Login.aspx");
        //    //    //Response.Redirect("New/Login.aspx?url=" + Server.UrlEncode(Request.Url.AbsoluteUri));
        //    //}



        //    if (Request.QueryString["Lang"] != null)
        //    {
        //        if (Request.QueryString["Lang"] == "en")
        //        {
        //            Session["SiteLanguage"] = "EnglishTheme";
        //        }
        //        else if (Request.QueryString["Lang"] == "ar")
        //        {
        //            Session["SiteLanguage"] = "ArabicTheme";
        //        }
        //    }
        //    if (Session["SiteLanguage"] == null)
        //    {
        //        Session["SiteLanguage"] = "ArabicTheme";
        //        Page.Theme = "ArabicTheme";
        //        Page.Title = Resources.DefaultResource.HeaderTitleArab;
        //        Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture("ar-KW");
        //        Thread.CurrentThread.CurrentUICulture = new CultureInfo("ar-KW");

        //    }
        //    else if (Session["SiteLanguage"].ToString() == "ArabicTheme")
        //    {
        //        Page.Theme = "ArabicTheme";
        //        Page.Title = Resources.DefaultResource.HeaderTitleArab ;
        //        Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture("ar-KW");
        //        Thread.CurrentThread.CurrentUICulture = new CultureInfo("ar-KW");
        //    }
        //    else if (Session["SiteLanguage"].ToString() == "EnglishTheme")
        //    {
        //        Page.Theme = "EnglishTheme";
        //        Page.Title = Resources.DefaultResource.HeaderTitleEng;
        //        Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture("en-US");
        //        Thread.CurrentThread.CurrentUICulture = new CultureInfo("en-US");
        //    }
        //    else
        //    {
        //        Page.Theme = "ArabicTheme";
        //        Page.Title = Resources.DefaultResource.HeaderTitleArab;
        //        Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture("ar-KW");
        //        Thread.CurrentThread.CurrentUICulture = new CultureInfo("ar-KW");
        //    }
        //}


    }
}