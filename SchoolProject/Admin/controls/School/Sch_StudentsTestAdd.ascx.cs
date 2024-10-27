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
    public partial class Sch_StudentsTestAdd : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //HttpCookie cookieOrgId = HttpContext.Current.Request.Cookies.Get("OrgId");
            //HttpCookie cookieName = HttpContext.Current.Request.Cookies.Get("Name");
            //HttpCookie cookieUserId = HttpContext.Current.Request.Cookies.Get("UserId");

            //int USERID = int.Parse(cookieUserId.Value.ToString());// int.Parse(Session["UserID"].ToString());

            //if (cookieOrgId != null)
            //{
            //    txtOrgId.Text = cookieOrgId.Value.ToString();
            //}
            //if (!IsPostBack)
            //{
                DataView v= (DataView) InvoicesDetailsDS.Select();
                if (v.Count  > 0)
                {
                   string studentname=  v[0]["StudentName"].ToString();
                    SName.Text = studentname;
                    Session["StudentId"] = v[0]["StudentId"].ToString();
                }
            //    InvoiceDetView.DataBind();
            //    //lv.DataBind();
            //    if (InvoiceDetView.Items.Count > 0)
            //    {
            //        Label lblRemainHours = (Label)InvoiceDetView.Items[0].FindControl("lblRemainHours");
            //        Label lblActualReseved = (Label)InvoiceDetView.Items[0].FindControl("lblActualReseved");

                    //        decimal RemainHours = 0;
                    //        decimal ActualReseved = 0;
                    //        if (lblRemainHours != null)
                    //        {
                    //            if (!string.IsNullOrEmpty(lblRemainHours.Text))
                    //            {
                    //                RemainHours = decimal.Parse(lblRemainHours.Text);
                    //            }
                    //            txtRemainHours.Text = RemainHours.ToString();

                    //        }
                    //        if (lblActualReseved != null)
                    //        {
                    //            if (!string.IsNullOrEmpty(lblActualReseved.Text))
                    //            {
                    //                ActualReseved = decimal.Parse(lblActualReseved.Text);
                    //            }
                    //            txtResevedHours.Text = ActualReseved.ToString();

                    //        }
                    //        txtActualRemainHours.Value = (RemainHours - ActualReseved).ToString();
                    //    }
           // }
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
                        //FileUpload ImageUploaderFileUploader = (FileUpload)lv.InsertItem.FindControl("ImageUploaderFileUploader");
                           

                        lv.InsertItemPosition = InsertItemPosition.None;
                        break;
                    //case "ChangeCheck":

                       
                    //    int Id = Int32.Parse(e.CommandArgument.ToString());

                    //    //txtInvId.Value = id.ToString();
                    //    if (lv.SelectedIndex >= 0)
                    //    {
                    //        //    Get the item object.
                    //        CheckBox CheckItem = (CheckBox)e.Item.FindControl("AttFlagCheckBox");
                    //        //if (dataItem.DisplayIndex == lv.SelectedIndex)
                    //        if (lv.SelectedIndex > -1)
                    //        {
                    //            string QidID = lv.DataKeys[lv.SelectedIndex].Value.ToString();
                    //        }

                    //    }


                    //    break;

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

        }

      

        protected void InvoiceDetView_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            
            
           
           
        }

        protected void lv_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            //TextBox txtTotRemainHours = (e.Item.FindControl("txtTotRemainHours") as TextBox);

            //if (txtTotRemainHours != null)
            //{
            //    txtTotRemainHours.Text = txtActualRemainHours.Value;
            //}
        }

        protected void StudentsIndvAttendanceDS_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
        {
            //StudentsIndvAttendanceDS.InsertParameters["RemainHours"].DefaultValue = txtActualRemainHours.Value;

         
           
            ErrorDiv.Visible = false;
        }

      
       
       

        protected void StudentsIndvAttendanceDS_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
        {
            InvoicesDetailsDS.Select();
            InvoicesDetailsDS.DataBind();
            InvoiceDetView.DataBind();
        }
       
        }
}