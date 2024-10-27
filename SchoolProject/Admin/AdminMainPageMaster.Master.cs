using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


    public partial class AdminMainPageMaster : System.Web.UI.MasterPage
    {
    protected void Page_Load(object sender, EventArgs e)
    {
        //lblCurDate.Text = DateTime.Today.ToShortDateString();
        CultureInfo myCI = new CultureInfo("ar-EG");
        string cur = myCI.DateTimeFormat.GetDayName(DateTime.Today.DayOfWeek);

        //lbldayweek.Text = cur;

     
        if (Session["OrgId"] == null && Session["userId"] == null)
        {
            Response.Redirect(@"~\Default.aspx");
        }
        else
        {


            //cookieadminUserName =  HttpContext.Current.Request.Cookies.Get("username");
            //LblUserName.Text = cookieadminUserName.Value.ToString();
            //txtUserId.Text = cookieadminuser.Value.ToString();


        }
    }

    }
