using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSchool.ADMIN.Controls.Common
{
    public partial class LeftSideBar : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if(Session["FullName"] != null)
            //{ 
            //FullNameLabel.Text = Session["FullName"].ToString();
            //}
        }

        protected void LogoutLinkButton_Click(object sender, EventArgs e)
        {
            //Session["FullName"] = null;
            //Session["UserID"] = null;
            //Session["RoleID"] = null;
            //Response.Redirect("~/Login.aspx");
        }
    }
}