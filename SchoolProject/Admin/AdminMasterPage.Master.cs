using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSchool.Admin
{
    public partial class AdminMasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["FullName"] == null || Session["UserID"] == null || Session["RoleID"] == null)
            //{
            //    Session["FullName"] = null;
            //    Session["UserID"] = null;
            //    Session["RoleID"] = null;
            //    Response.Redirect("~/Login.aspx");
            //}
        }
       
    }
}