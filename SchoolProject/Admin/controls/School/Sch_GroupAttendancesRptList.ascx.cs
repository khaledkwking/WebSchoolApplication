using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace WebSchool.Admin.controls.School
{

    public partial class Sch_GroupAttendancesRptList : System.Web.UI.UserControl
    {

        string Accessing, Adding, Updating, Deleting, Importing;
        protected void Page_Load(object sender, EventArgs e)
            {
            // to get the previus Link 

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
                    
                }
                else
                {
                    Response.Redirect("~/NoAccess.aspx?URL=" + previousUrl);
                }


                if (Session ["OrgId"]!= null)
                {
                    txtOrgId.Text = Session ["OrgId"].ToString();
                }
                
                if (!Page.IsPostBack)
                {
               
               
                StartDateTextBox.Text = DateTime.Today.ToShortDateString();
                EndDateTextBox.Text = DateTime.Today.ToShortDateString();
                if (Request.QueryString ["RFlag"]!=null)
                {
                    if (Request.QueryString["RFlag"].ToString ()=="1")
                    {
                        if (Session["SDate"] != null)
                        {
                            StartDateTextBox.Text = Session["SDate"].ToString();
                        }
                        if (Session["EDate"] != null)
                        {
                            EndDateTextBox.Text = Session["EDate"].ToString();

                        }
                    }
                    if (Request.QueryString["StudentId"] != null)
                    {
                        DropDownListStudent.SelectedValue = Request.QueryString["StudentId"].ToString();
                    }
                }
                
               
               

            }
            

        }

        protected void PrintLinkButton_Click(object sender, EventArgs e)
        {
            if (StartDateTextBox.Text != "")
            {
                string PeriodName = " ";
                DateTime dt = DateTime.Parse(StartDateTextBox.Text);
                int NumOfDays = DateTime.DaysInMonth(dt.Year, dt.Month);
                Session["LastDayOfMonth"] = NumOfDays.ToString();


                Session["SDate"] = StartDateTextBox.Text;
                Session["EDate"] = EndDateTextBox.Text;
                Session["EmpId"] = DropDownListEmp.SelectedValue.ToString();
                Session["StudentId"] = DropDownListStudent.SelectedValue.ToString();
                Session["PeriodId"] = PeriodDropDownList.SelectedValue.ToString();
                if (PeriodDropDownList.SelectedValue != "")
                {

                    Session["PeriodName"] = PeriodDropDownList.Text;
                }
                else
                {
                    Session["PeriodName"] = PeriodName;
                }
                Session["Sex"] = SexDropDownList.SelectedValue.ToString();
                
                Session["SearchText"] = "";
                string userId = Session["UserId"].ToString();
                Session["InvTypeId"] = "2";

                string url = "GroupAttendanceShowReport.aspx?Id=1";

                StringBuilder sb = new StringBuilder();
                sb.Append("<script type = 'text/javascript'>");
                sb.Append("window.open('");
                sb.Append(url);
                sb.Append("','_blank');");
                sb.Append("</script>");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", sb.ToString());

                //Session["UserId"] = userId.ToString();
            }


        }
       
            protected void ClearLinkButton_Click(object sender, EventArgs e)
            {
                              

            }

          
               
        
        protected void SearchLinkButton_Click(object sender, EventArgs e)
        {
           
            Session["SDate"] = StartDateTextBox.Text;
            Session["EDate"] = EndDateTextBox.Text;
        }

       
       
              
    }
    
}