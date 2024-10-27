using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSchool.Admin.controls.School
{
    public partial class Sch_StudentsGroupAttendance : System.Web.UI.UserControl
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

            dt1 = DA1.Read("1", USERID, 17, "");
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

          

            //int USERID = int.Parse(cookieUserId.Value.ToString());// int.Parse(Session["UserID"].ToString());

            //if (cookieOrgId != null)
            //{
            //    txtOrgId.Text = cookieOrgId.Value.ToString();
            //}
            if (!Page.IsPostBack)
            {

                //lv.SelectedIndex = 0;
                StartDateTextBox.Text = DateTime.Today.ToShortDateString();
  
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
                           
                            lv.InsertItemPosition = InsertItemPosition.None;
                            break;

                        case "Insert":
                            //FileUpload ImageUploaderFileUploader = (FileUpload)lv.InsertItem.FindControl("ImageUploaderFileUploader");
                            CheckBox RepeatChkBox = (CheckBox)lv.InsertItem.FindControl("RepeatChkBox");
                            TextBox txtReaptedNumber = (TextBox)lv.InsertItem.FindControl("txtReaptedNumber");
                            int RepeatFlag = 0;
                            if (RepeatChkBox != null)
                            {
                                if (RepeatChkBox.Checked)
                                {
                                    RepeatFlag = 1;
                                }
                                //    string exten = Path.GetExtension(Server.MapPath(ImageUploaderFileUploader.FileName));
                                //    string Filename = DateTime.Now.ToOADate().ToString() + exten;
                                //    ODS.InsertParameters["PictureName"].DefaultValue = Filename;
                                //    string filepath = Path.Combine(Server.MapPath(ImagePath)) + Filename;
                                //    ImageUploaderFileUploader.SaveAs(filepath);
                                //}
                                //else
                            }
                            StudentsGroupAttendanceDS.InsertParameters["RepeatFlag"].DefaultValue = RepeatFlag.ToString();
                           
                            StudentsGroupAttendanceDS.InsertParameters["RepeatNumber"].DefaultValue = txtReaptedNumber.Text;

                            lv.InsertItemPosition = InsertItemPosition.None;
                            break;
                        case "ChangeCheck":


                            int Id = Int32.Parse(e.CommandArgument.ToString());

                            //txtInvId.Value = id.ToString();
                            if (lv.SelectedIndex >= 0)
                            {
                                //    Get the item object.
                                CheckBox CheckItem = (CheckBox)e.Item.FindControl("AttFlagCheckBox");
                                //if (dataItem.DisplayIndex == lv.SelectedIndex)
                                if (lv.SelectedIndex > -1)
                                {
                                    string QidID = lv.DataKeys[lv.SelectedIndex].Value.ToString();
                                }

                            }


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

            }



            

            protected void lv_ItemDataBound(object sender, ListViewItemEventArgs e)
            {
                TextBox txtTotRemainHours = (e.Item.FindControl("txtTotRemainHours") as TextBox);
            
            LinkButton EditLinkButton = (LinkButton)e.Item.FindControl("EditLinkButton");
            LinkButton DeleteLinkButton = (LinkButton)e.Item.FindControl("DeleteLinkButton");
            if (Updating != "True") { EditLinkButton.Visible = false; }
            if (Deleting != "True") { DeleteLinkButton.Visible = false; }
        }

            protected void StudentsIndvAttendanceDS_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
            {
                //StudentsIndvAttendanceDS.InsertParameters["RemainHours"].DefaultValue = txtActualRemainHours.Value;


                //StudentsGroupAttendanceDS.InsertParameters["RemainHours"].DefaultValue = txtActualRemainHours.Value;
                //ErrorDiv.Visible = false;
            }

            protected void StudentsIndvAttendanceDS_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
            {
                ////string t = e.OutputParameters["EMP_CODE"].ToString();
                //long ret = int.Parse(e.ReturnValue.ToString());
                //if (ret > 0)
                //{
                //    long OrgId = 0;
                //    if (Session["OrgId"] != null)
                //    {
                //        OrgId = long.Parse(Session["OrgId"].ToString());
                //    }
                //    BOL.Sch_StudentsIndvAttendance DA = new BOL.Sch_StudentsIndvAttendance();
                //    DAL.StudentsIndvAttendance.Sch_StudentsIndvAttendanceDataTable dt = new DAL.StudentsIndvAttendance.Sch_StudentsIndvAttendanceDataTable();
                //    dt = DA.Read("1", ret, "", "", 0, 0, 0, 0, 0, 0, OrgId, 0, 0, 0, false, "");
                //    string DayDate = "";
                //    string DayTime = "";
                //    string StudentName = "";
                //    if (dt.Count > 0)
                //    {
                //        if (dt.Rows[0]["DayDate"] != null)
                //        {
                //            DayDate = DateTime.Parse(dt.Rows[0]["DayDate"].ToString()).ToShortDateString();
                //        }
                //        if (dt.Rows[0]["DayDate"] != null)
                //        {
                //            DayTime = DateTime.Parse(dt.Rows[0]["DayTime"].ToString()).ToShortTimeString();
                //        }
                //        StudentName = dt.Rows[0]["StudentName"].ToString();

                //        ErrorDiv.Visible = true;
                //        ErrorDiv.InnerHtml = "<div class=\"alert alert-danger alert-dismissable\"> <i class=\"fa fa-times-circle\"></i>" +
                //            Resources.DefaultResource.MsgDuplicatedTime + " للطالب " + StudentName + "في تاريخ " + DayDate
                //            + " فى التوقيت " + DayTime + "</div>";
                //    }
                //}
                //InvoicesDetailsDS.Select();
                //InvoicesDetailsDS.DataBind();
                //InvoiceDetView.DataBind();


            }

            protected void StudentsIndvAttendanceDS_Updated(object sender, ObjectDataSourceStatusEventArgs e)
            {
                //long ret = int.Parse(e.ReturnValue.ToString());
                //if (ret > 0)
                //{
                //    long OrgId = 0;
                //    if (Session["OrgId"] != null)
                //    {
                //        OrgId = long.Parse(Session["OrgId"].ToString());
                //    }
                //    BOL.Sch_StudentsIndvAttendance DA = new BOL.Sch_StudentsIndvAttendance();
                //    DAL.StudentsIndvAttendance.Sch_StudentsIndvAttendanceDataTable dt = new DAL.StudentsIndvAttendance.Sch_StudentsIndvAttendanceDataTable();
                //    dt = DA.Read("1", ret, "", "", 0, 0, 0, 0, 0, 0, OrgId, 0, 0, 0, false, "");
                //    string DayDate = "";
                //    string DayTime = "";
                //    string StudentName = "";
                //    if (dt.Count > 0)
                //    {
                //        if (dt.Rows[0]["DayDate"] != null)
                //        {
                //            DayDate = DateTime.Parse(dt.Rows[0]["DayDate"].ToString()).ToShortDateString();
                //        }
                //        if (dt.Rows[0]["DayDate"] != null)
                //        {
                //            DayTime = DateTime.Parse(dt.Rows[0]["DayTime"].ToString()).ToShortTimeString();
                //        }
                //        StudentName = dt.Rows[0]["StudentName"].ToString();

                //        ErrorDiv.Visible = true;
                //        ErrorDiv.InnerHtml = "<div class=\"alert alert-danger alert-dismissable\"> <i class=\"fa fa-times-circle\"></i>" +
                //            Resources.DefaultResource.MsgDuplicatedTime + " للطالب " + StudentName + "في تاريخ " + DayDate
                //            + " فى التوقيت " + DayTime + "</div>";
                //    }
                //}
                //InvoicesDetailsDS.Select();
                //InvoicesDetailsDS.DataBind();
                //InvoiceDetView.DataBind();

            }

            protected void StudentsIndvAttendanceDS_Updating(object sender, ObjectDataSourceMethodEventArgs e)
            {

            }

        
            protected void CheckBox_CheckedChanged(object sender, EventArgs e)
            {
                CheckBox cb = (CheckBox)sender;
                ListViewItem item = (ListViewItem)cb.NamingContainer;

                string key = lv.DataKeys[item.DataItemIndex].Values[0].ToString();
                long Id = long.Parse(key);
              
            CheckBox AttFlagCheckBox = (CheckBox)item.FindControl("AttFlagCheckBox");
            CheckBox ExceptionFlagCheckBox = (CheckBox)item.FindControl("CheckBoxExceptionFlag");

            //TextBox txtId = (TextBox)item.FindControl("txtId");

                bool AttFlag = AttFlagCheckBox.Checked;
                bool ExceptionFlag = ExceptionFlagCheckBox.Checked;
                BOL.Sch_StudentsGroupAttendance DA = new BOL.Sch_StudentsGroupAttendance();

              
                long OrgId = 0;
                if (Session["OrgId"] != null)
                {
                    OrgId = long.Parse(Session["OrgId"].ToString());
                }
                int userId = 0;
                //long Id = 0;
                if (Session["UserId"] != null)
                {
                    userId = int.Parse(Session["UserId"].ToString());
                }
                //if (txtId != null)
                //{
                //    Id = long.Parse(txtId.Text);
                //}

                string DayDate = DateTime.Today.ToShortDateString();
                DA.DML("5", Id, 0,"", AttFlag, ExceptionFlag,"", 0, OrgId, 0,userId , userId, 0);
                //InvoicesDetailsDS.Select();
                //InvoicesDetailsDS.DataBind();
                //InvoiceDetView.DataBind();
            }

        protected void LinkButtonAddAtt_Click(object sender, EventArgs e)
        {
            BOL.Sch_Invoices DA = new BOL.Sch_Invoices();
            DAL.School.Sch_InvoicesDataTable dt = new DAL.School.Sch_InvoicesDataTable();

            long QrgId = long.Parse(Session["OrgId"].ToString());
            int UserId = int.Parse(Session["UserId"].ToString());

            string SDate = StartDateTextBox.Text;
            //string EDate = EndDateTextBox.Text;

            long StudentId = 0;
            long PeriodId = 0;
            int SexId = 0;

            if (DropDownListStudent.SelectedValue != null )
            {
                if (DropDownListStudent.SelectedValue.ToString() != "")
                {
                    StudentId = long.Parse(DropDownListStudent.SelectedValue.ToString());
                }
            }
            if (PeriodDropDownList.SelectedValue != null)
            {
                if (PeriodDropDownList.SelectedValue.ToString() != "")
                {
                    PeriodId = long.Parse(PeriodDropDownList.SelectedValue.ToString());
                }
            }

            if (SexDropDownList.SelectedValue != null)
            {
                if (SexDropDownList.SelectedValue.ToString() != "")
                {
                    SexId = int.Parse(SexDropDownList.SelectedValue.ToString());
                }
            }

            dt = DA.Read("3", "","" , 0, 2, 0, QrgId, 0, 0, StudentId, PeriodId, SexId, "", SDate, "",0);
            if (dt.Count > 0)
            {
                BOL.Sch_StudentsGroupAttendance  Adt = new BOL.Sch_StudentsGroupAttendance();
                for (int i = 0; i < dt.Count; i++)
                {
                    long InvId = dt[i].InvId;
                    long studentId = dt[i].StudentId ;
                    bool AttFlag = false;
                    bool ExceptionFlag = false;
                    Adt.DML("4", 0, studentId, SDate, AttFlag, ExceptionFlag, "", InvId, QrgId, 0, UserId, UserId, 0);
                }
                StudentsGroupAttendanceDS.Select();
                StudentsGroupAttendanceDS.DataBind();
                lv.DataBind();

            }

        }
    }
}