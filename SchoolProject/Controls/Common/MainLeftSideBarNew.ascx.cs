using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSchool.controls.Common
{
    public partial class MainLeftSideBarNew : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //HttpCookie cookieName = Session["Name"]
            if (Session["Name"] != null)
            {
                CultureInfo myCI = new CultureInfo("ar-Kw");
                string cur = Session["Name"].ToString();// cookieName.Value.ToString ();
                if (Session["SiteLanguage"].ToString() == "ArabicTheme")
                {

                    LoggedInUserLabel.Text = "مرحبا "+cur;// Session["FullName"].ToString();
                    
                }
                else
                {
                    LoggedInUserLabel.Text = "Welcome "+cur;  //Session["FullNameEn"].ToString();
                }
               
            }
        }
    }
}