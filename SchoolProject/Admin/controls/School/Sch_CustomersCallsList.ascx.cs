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
    public partial class Sch_CustomersCallsList : System.Web.UI.UserControl
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
            int USERID = int.Parse(Session["UserId"].ToString());// int.Parse(Session["UserID"].ToString());
            BOL.UsersPages DA1 = new BOL.UsersPages();
            DAL.UsersPages.UsersPagesDataTable dt1 = new DAL.UsersPages.UsersPagesDataTable();

            dt1 = DA1.Read("1", USERID, 15, "");
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

                if (Updating != "True") {
                    DropDownListEmp.SelectedValue = USERID.ToString ();
                    DropDownListEmp.Enabled = false;


                    }

                // checking the insert privlage 
                //if (Adding != "True") { NewRecord.Visible = false; }
            }
            else
            {
                Response.Redirect("~/NoAccess.aspx?URL=" + previousUrl);
            }
            //Session["VendorID"] = 1;
            //HttpCookie cookieOrgId = HttpContext.Current.Request.Cookies.Get("OrgId");
            //HttpCookie cookieName = HttpContext.Current.Request.Cookies.Get("Name");
            //HttpCookie cookieUserId = HttpContext.Current.Request.Cookies.Get("UserId");

            //int USERID = int.Parse(cookieUserId.Value.ToString());// int.Parse(Session["UserID"].ToString());
            if (!Page.IsPostBack)
                {

                    //lv.SelectedIndex = 0;
                    StartDateTextBox.Text = DateTime.Today.ToShortDateString();
                    EndDateTextBox.Text = DateTime.Today.ToShortDateString();


                if (Session["UserId"] != null)
                {
                    // V = (DataView)StudentsDS.Select();
                    //DropDownListStudent.DataBind();
                   
                    DropDownListEmp.SelectedValue = USERID.ToString();
                }

            }
          

                

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
                            //TextBox RealPasswordTextBox = (TextBox)lv.EditItem.FindControl("RealPasswordTextBox");

                            //TextBox PasswordTextBox = (TextBox)lv.EditItem.FindControl("PasswordTextBox");
                            //if (!string.IsNullOrEmpty(PasswordTextBox.Text))
                            //{
                            //    RealPasswordTextBox.Text = PasswordTextBox.Text;
                            //}
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


                }

            }

            protected void ClearLinkButton_Click(object sender, EventArgs e)
            {
                SearchTextBox.Text = "";
                lv.DataBind();

            }

            protected void SearchLinkButton_Click(object sender, EventArgs e)
            {
            if (AllCheckBox.Checked)
            {
                ObjectDataSourceCustomerCalls.SelectParameters["ActionCode"].DefaultValue ="2";
                
            }
            else
            {
                ObjectDataSourceCustomerCalls.SelectParameters["ActionCode"].DefaultValue = "3";
            }
                lv.DataBind();
            }
        protected void TextboxDate_DataBinding(object sender, EventArgs e)
        {
            object control = lv.InsertItem.FindControl("DayDateTextBox");
            if (control != null)
            {
                TextBox tbox = (TextBox)control;
                tbox.Text = DateTime.Today.ToShortDateString();
            }

        }
        protected void lv_ItemDataBound(object sender, ListViewItemEventArgs e)
            {
                //if (lv.InsertItem != null)
                //{
                //    TextBox txtInvRemain = (TextBox)lv.InsertItem.FindControl("txtInvRemain");
                //    txtInvRemain.Text = txtRemain.Text;
                //}
                //TextBox txtInvRemain = (TextBox)lv.FindControl("txtInvRemain");
                //txtInvRemain.Text = txtRemain.Text;
            }

            protected void InvoiceView_ItemDataBound(object sender, ListViewItemEventArgs e)
            {
                Label lblInvRemain = (Label)e.Item.FindControl("lblInvRemain");
                if (lblInvRemain != null)
                {
                    txtRemain.Text = lblInvRemain.Text;
                }
                //LinkButton DeleteLinkButton = (LinkButton)e.Item.FindControl("DeleteLinkButton");
                //if (Updating != "True") { EditLinkButton.Visible = false; }
                //if (Deleting != "True") { DeleteLinkButton.Visible = false; }
                //if (lv.InsertItem != null)
                //{
                //    TextBox tb = (TextBox)lv.InsertItem.FindControl("qidDateTextBox");
                //    tb.Text = DateTime.Today.ToShortDateString();
                //}
            }

            protected void lv_PreRender(object sender, EventArgs e)
            {
                if (lv.InsertItem != null)
                {
                    ((TextBox)lv.InsertItem.FindControl("txtInvRemain")).Text = txtRemain.Text;
                }
            }
            protected void PrintLinkButton_Click(object sender, EventArgs e)
            {
                Session["SDate"] = StartDateTextBox.Text;
                Session["EDate"] = EndDateTextBox.Text;
                Session["EmpId"] = DropDownListEmp.SelectedValue.ToString();
                Session["RelpyId"] = DropDownListReplyId.SelectedValue.ToString();
                Session["SearchText"] = SearchTextBox.Text;
                string Flag = "3";
                if (AllCheckBox.Checked)
                {
                   Flag= "2";
                }
           
            string url = "InvoicesShowReport.aspx?Id=2&Flag="+ Flag;

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