using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_logoutTeacher : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string urlstr  = "~/login.aspx";
    
       
        Session["Name"] = null;
        Session["OrgId"] = null;
        Session["TeacherId"] = null;
       
        urlstr = "~/login.aspx";
           

        Response.Redirect(urlstr);

    }
}