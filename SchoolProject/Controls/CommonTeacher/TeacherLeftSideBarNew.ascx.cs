using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSchool.controls.CommonTeacher
{
    public partial class TeacherLeftSideBarNew : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

            if (Session["TeacherName"] != null)
            {
                CultureInfo myCI = new CultureInfo("ar-Kw");
                string cur = Session["TeacherName"].ToString();// cookieName.Value.ToString ();
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