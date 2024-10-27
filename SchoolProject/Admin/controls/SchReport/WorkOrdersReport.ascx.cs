using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace WebSchool.Admin.controls.SchReport
{
   
    public partial class WorkOrdersReport : System.Web.UI.UserControl
    {


        string Accessing, Adding, Updating, Deleting, Importing;
        protected void Page_Load(object sender, EventArgs e)
        {
            string previousUrl;
            if (Context.Request.UrlReferrer != null)
            {
                previousUrl = Context.Request.UrlReferrer.ToString();
            }
            else
            {
                previousUrl = "Main.aspx";
            }
            int USERID = 0;
            if (Session["UserId"] != null)
            {
                 USERID = int.Parse(Session["UserId"].ToString());// int.Parse(Session["UserID"].ToString());
            }
            BOL.UsersPages DA1 = new BOL.UsersPages();
            DAL.UsersPages.UsersPagesDataTable dt1 = new DAL.UsersPages.UsersPagesDataTable();

            dt1 = DA1.Read("1", USERID, 14, "");
            if (dt1.Rows.Count > 0)
            {
                DataRow UserRow = dt1.Rows[0];
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
            // to get the previus Link 
           
             
                //if (Session ["OrgId"]!= null)
                //{
                //    txtOrgId.Text = Session ["OrgId"].ToString();
                //}
                //BOL.UsersPages DA= new BOL.UsersPages();
                //DAL.NEWERPDataSet.UsersPagesDataTable dt = new DAL.NEWERPDataSet.UsersPagesDataTable();

                //dt = DA.Read("1", USERID, 5, "");
                //if (dt.Rows.Count > 0)
                //{
                //    DataRow UserRow = dt.Rows[0];
                //    Accessing = UserRow["Accessing"].ToString();
                //    Adding = UserRow["Adding"].ToString();
                //    Updating = UserRow["Updating"].ToString();
                //    Deleting = UserRow["Deleting"].ToString();
                //    Importing = UserRow["Importing"].ToString();

                //    // checking the access  
                //    if (Accessing != "True") { Response.Redirect("~/NoAccess.aspx?URL=" + previousUrl); }
                //    // checking the insert privlage 
                //    if (Adding != "True") { NewRecord.Visible = false; }
                //}
                //else
                //{
                //    Response.Redirect("~/NoAccess.aspx?URL=" + previousUrl);
                //}
                if (!Page.IsPostBack)
                {

                //lv.SelectedIndex = 0;
                StartDateTextBox.Text = DateTime.Today.ToShortDateString();
                EndDateTextBox.Text = DateTime.Today.ToShortDateString();

                              
                
                    //if (V.Count > 0)
                    //{
                    //    string QidID =  V[0]["qidid"].ToString ();
                    //    txtQidId.Value = QidID;
                    //    LoadDetData();
                    // }


                }
            
   
        }


        
        
        //[HttpPost]
        //public JsonResult SetItemCats(string type, int value)
        //{
        //    return Json("");
        //}
         

            protected void ClearLinkButton_Click(object sender, EventArgs e)
            {
                SearchTextBox.Text = "";
               

            }

           


        protected void PrintButton_Click(object sender, EventArgs e)
         {

         }

        protected void SearchLinkButton_Click(object sender, EventArgs e)
        {
            if (StudentDropDownList.SelectedValue != null)
            {
                Session["studentId"] = StudentDropDownList.SelectedValue.ToString();
           }
            if (TeacherDropDownList.SelectedValue != null)
            {
                Session["TeacherId"] = TeacherDropDownList.SelectedValue.ToString();
            }
            if (!String.IsNullOrEmpty(StartDateTextBox.Text))
            {
                Session["Sdate"] = StartDateTextBox.Text;
            }
            if (!String.IsNullOrEmpty(EndDateTextBox.Text))
            {
                Session["SEdate"] = EndDateTextBox.Text;
            }
            //Response.Redirect("~/Admin/SchoolShowRpt.aspx?Id=3");
            string url = "SchoolShowRpt.aspx?Id=3";
            if (Request.QueryString["Accflag"] != null)
            {
                string Accflag = Request.QueryString["Accflag"].ToString();
                Session["AttFlag"] = Accflag;
                 url = "SchoolShowRpt.aspx?Id=4";
            }
            
            StringBuilder sb = new StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.open('");
            sb.Append(url);
            sb.Append("','_blank');");
            sb.Append("</script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", sb.ToString());
        }
    }
    
}