using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace WebSchool.ADMIN.Controls.School
{
    public partial class Sch_TeacherGovs : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!this.IsPostBack)
            {
                string TeacherId ="";
                if (Request.QueryString["TeacherId"] != null)
                {
                    BOL.Sch_Teachers  DA = new BOL.Sch_Teachers();

                    TeacherId = Request.QueryString["TeacherId"].ToString();
                    DAL.Teachers.Sch_TeachersDataTable dt = new DAL.Teachers.Sch_TeachersDataTable();
                    //HttpCookie Session ["OrgId"]= HttpContext.Current.Request.Cookies.Get("OrgId");
                    long Id = long.Parse(TeacherId);
                    long QrgId = long.Parse(Session["OrgId"].ToString());
                    dt = DA.Read("1", Id, 0, 0, QrgId, 0, 0, 0,"","",0, "");
                    if (dt.Count >0)
                    {
                        labName.Text = dt.Rows[0]["Name"].ToString();
                    }
                }
            }
            //HttpCookie cookieOrgId = HttpContext.Current.Request.Cookies.Get("OrgId");
            //HttpCookie cookieName = HttpContext.Current.Request.Cookies.Get("Name");
            //HttpCookie cookieUserId = HttpContext.Current.Request.Cookies.Get("UserId");

            //int USERID = int.Parse(cookieUserId.Value.ToString());// int.Parse(Session["UserID"].ToString());


            //if (cookieOrgId != null)
            //{
            //    txtOrgId.Text = cookieOrgId.Value.ToString();

            //}
        }
        protected void lv_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            try
            {
                switch (e.CommandName)
                {
                    case "Edit":

                        lv.InsertItemPosition = InsertItemPosition.None;
                        break;
                    case "NewRecord":
                        lv.InsertItemPosition = InsertItemPosition.FirstItem;
                        break;
                    case "Cancel":
                        //Hide code
                        lv.InsertItemPosition = InsertItemPosition.None;
                        break;
                    case "UnSelect":
                        lv.SelectedIndex = -1;
                        break;
                    case "Select":
                        lv.InsertItemPosition = InsertItemPosition.None;
                        break;
                    case "Update":
                        lv.InsertItemPosition = InsertItemPosition.None;

                                             
                        break;

                    case "Insert":


                        
                        lv.InsertItemPosition = InsertItemPosition.None;
                        break;
                      
                }
            }
            catch (Exception ex)
            {
                ErrorDiv.InnerHtml = "<div class=\"alert alert-danger alert-dismissable\"> <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×</button><h4><i class=\"fa fa-times-circle\"></i> Error</h4>" + ex.Message.ToString() + "</div>";
            }
        }

        protected void NewRecord_Click(object sender, EventArgs e)
        {
            if (lv.InsertItemPosition != InsertItemPosition.FirstItem)
            {
                lv.InsertItemPosition = InsertItemPosition.None;
                lv.EditIndex = -1;

                lv.InsertItemPosition = InsertItemPosition.FirstItem;
               
             
                //DropDownList ddlPeriodDropDownList = (DropDownList)lv.InsertItem.FindControl("ddlPeriod");
                //CKEditor.NET.CKEditorControl DescriptionCKEditor = (CKEditor.NET.CKEditorControl)lv.FindControl("DescriptionCKEditor");

            }
        }

        protected void ClearLinkButton_Click(object sender, EventArgs e)
        {
            SearchTextBox.Text = "";
            lv.DataBind();

        }

        protected void SearchLinkButton_Click(object sender, EventArgs e)
        {

        }
  
        protected void lv_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            
        }

       
            
    }
}