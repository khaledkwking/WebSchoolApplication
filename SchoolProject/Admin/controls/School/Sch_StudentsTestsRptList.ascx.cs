using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSchool.Admin.controls.School
{
    public partial class Sch_StudentsTestsRptList : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["VendorID"] = 1;
            //HttpCookie cookieOrgId = HttpContext.Current.Request.Cookies.Get("OrgId");
            //HttpCookie cookieName = HttpContext.Current.Request.Cookies.Get("Name");
            //HttpCookie cookieUserId = HttpContext.Current.Request.Cookies.Get("UserId");

            //int USERID = int.Parse(cookieUserId.Value.ToString());// int.Parse(Session["UserID"].ToString());
            string Accessing, Adding, Updating, Deleting, Importing;
            string previousUrl;
            if (Context.Request.UrlReferrer != null)
            {
                previousUrl = Context.Request.UrlReferrer.ToString();
            }
            else
            {
                previousUrl = "Main.aspx";
            }
            int USERID = int.Parse(Session["UserId"].ToString());// int.Parse(Session["UserID"].ToString());
            BOL.UsersPages DA1 = new BOL.UsersPages();
            DAL.UsersPages.UsersPagesDataTable dt = new DAL.UsersPages.UsersPagesDataTable();

            dt = DA1.Read("1", USERID, 19, "");
            if (dt.Rows.Count > 0)
            {
                DataRow UserRow = dt.Rows[0];
                Accessing = UserRow["Accessing"].ToString();
                Adding = UserRow["Adding"].ToString();
                Updating = UserRow["Updating"].ToString();
                Deleting = UserRow["Deleting"].ToString();
                Importing = UserRow["Importing"].ToString();

                // checking the access  
                if (Accessing != "True") { Response.Redirect("~/NoAccess.aspx?URL=" + previousUrl); }
                // checking the insert privlage 
                //if (Adding != "True") { NewRecord.Visible = false; }
            }
            else
            {
                Response.Redirect("~/NoAccess.aspx?URL=" + previousUrl);
            }


            if (!Page.IsPostBack)
            {

                StartDateTextBox.Text = DateTime.Today.ToShortDateString();
                EndDateTextBox.Text = DateTime.Today.ToShortDateString();
                if (Request.QueryString["RFlag"] != null)
                {
                    if (Request.QueryString["RFlag"].ToString() == "1")
                    {
                        if (Session["RSDate"] != null)
                        {
                            StartDateTextBox.Text = Session["RSDate"].ToString();
                        }
                        if (Session["REDate"] != null)
                        {
                            EndDateTextBox.Text = Session["REDate"].ToString();

                        }
                    }
                }
               


            }

        }
      
        protected void ClearLinkButton_Click(object sender, EventArgs e)
        {
            SearchTextBox.Text = "";
           

        }

        protected void SearchLinkButton_Click(object sender, EventArgs e)
        {
          
            Session["RSDate"] = StartDateTextBox.Text;
            Session["REDate"] = EndDateTextBox.Text;
            
        }

       

        
        
        protected void PrintLinkButton_Click(object sender, EventArgs e)
        {
            Session["SDate"] = StartDateTextBox.Text;
            Session["EDate"] = EndDateTextBox.Text;
            Session["EmpId"] = DropDownListEmp.SelectedValue.ToString();
            //Session["StudentId"] = DropDownListStudent.SelectedValue.ToString();
            Session["SearchText"] = SearchTextBox.Text;
            string url = "InvoicesShowReport.aspx?Id=6";

            StringBuilder sb = new StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.open('");
            sb.Append(url);
            sb.Append("','_blank');");
            sb.Append("</script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", sb.ToString());





        }
        protected void lv_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    
}
    
}