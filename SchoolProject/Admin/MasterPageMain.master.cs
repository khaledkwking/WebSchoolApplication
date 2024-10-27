using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using  System.Globalization;
public partial class MasterPageMain : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblCurDate.Text = DateTime.Today.ToShortDateString();
        CultureInfo myCI   = new CultureInfo("ar-EG");
        string cur = myCI.DateTimeFormat.GetDayName(DateTime.Today.DayOfWeek);

         lbldayweek.Text= cur;

        HttpCookie cookieadminuser;
        HttpCookie cookieadminUserName;
        HttpCookie cookieOrgId;
        cookieadminuser = HttpContext.Current.Request.Cookies.Get("UserId");
        cookieOrgId = HttpContext.Current.Request.Cookies.Get("OrgId");
        if (cookieadminuser == null && cookieOrgId==null)
        {
            Response.Redirect(@"~\Default.aspx");
        }
        else
        {

            cookieadminUserName = HttpContext.Current.Request.Cookies.Get("username");
            //LblUserName.Text = cookieadminUserName.Value.ToString();
            //txtUserId.Text = cookieadminuser.Value.ToString();


        }
    }
}
