using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSchool.Controls.CommonTeacher
{
    public partial class MainTeacher : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //HttpCookie cookieUserType;
            if (Session["FullName"]!=null)
            {
                lblCompanyname.Text = Session["FullName"].ToString();
            }
            //cookieUserType = HttpContext.Current.Request.Cookies.Get("UserType");
            //if (cookieUserType != null)
            //{
            //    if (cookieUserType.Value != "1")
            //    {
            //        SetPermission();
            //    }

            //}
        }
        private void SetPermission()
        {
           

        }
    }
}