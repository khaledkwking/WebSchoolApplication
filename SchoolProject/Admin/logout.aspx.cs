using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string urlstr  = "~/default.aspx";
    
        Session["USER_NAME"] = null;
        Session["Name"] = null;
        Session["OrgId"] = null;
        Session["UserId"] = null;
        Session["USER_TYPE"] = null;
        urlstr = "~/Default.aspx";
           
               

        Response.Redirect(urlstr);

    }
}