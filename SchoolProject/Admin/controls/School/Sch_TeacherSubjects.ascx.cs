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
    public partial class Sch_TeacherSubjects : System.Web.UI.UserControl
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

                        DropDownList PeriodDropDownList = (DropDownList)lv.EditItem.FindControl("ddlPeriod");
                        DropDownList SubjectDropDownList = (DropDownList)lv.EditItem.FindControl("ddlSubject");
                        TextBox txtPeriodId = (TextBox)lv.EditItem.FindControl("PeriodIdHiddenField");
                        TextBox txtSubjectId = (TextBox)lv.EditItem.FindControl("SubjectIdHiddenField");

                        // get value of department section and update dbase to sectionId
                        if (PeriodDropDownList != null)
                        {
                            if (PeriodDropDownList.SelectedValue != null)
                            {
                                if (PeriodDropDownList.SelectedValue.ToString() != "")
                                {
                                    TeacherSubjectsDS.UpdateParameters["PeriodId"].DefaultValue = PeriodDropDownList.SelectedValue.ToString();
                                    txtPeriodId.Text = PeriodDropDownList.SelectedValue.ToString();
                                }
                            }
                        }
                        if (SubjectDropDownList != null)
                        {
                            if (SubjectDropDownList.SelectedValue != null)
                            {
                                if (SubjectDropDownList.SelectedValue.ToString() != "")
                                {
                                    TeacherSubjectsDS.UpdateParameters["SubjectId"].DefaultValue = SubjectDropDownList.SelectedValue.ToString();
                                    txtSubjectId.Text = SubjectDropDownList.SelectedValue.ToString();
                                }
                            }
                        }
                        break;

                    case "Insert":


                        DropDownList PeriodDropDownListInserted = (DropDownList)lv.InsertItem.FindControl("ddlPeriod");
                        DropDownList SubjectDropDownListInserted = (DropDownList)lv.InsertItem.FindControl("ddlSubject");
                        TextBox txtPeriodIdInserted = (TextBox)lv.InsertItem.FindControl("PeriodIdHiddenField");
                        TextBox txtSubjectIdInserted = (TextBox)lv.InsertItem.FindControl("SubjectIdHiddenField");

                        // get value of department section and update dbase to sectionId
                        if (PeriodDropDownListInserted != null)
                        {
                            if (PeriodDropDownListInserted.SelectedValue != null)
                            {
                                if (PeriodDropDownListInserted.SelectedValue.ToString() != "")
                                {
                                    TeacherSubjectsDS.InsertParameters["PeriodId"].DefaultValue = PeriodDropDownListInserted.SelectedValue.ToString();
                                    txtPeriodIdInserted.Text = PeriodDropDownListInserted.SelectedValue.ToString();
                                }
                            }
                        }
                        if (SubjectDropDownListInserted != null)
                        {
                            if (SubjectDropDownListInserted.SelectedValue != null)
                            {
                                if (SubjectDropDownListInserted.SelectedValue.ToString() != "")
                                {
                                    TeacherSubjectsDS.InsertParameters["SubjectId"].DefaultValue = SubjectDropDownListInserted.SelectedValue.ToString();
                                    txtSubjectIdInserted.Text = SubjectDropDownListInserted.SelectedValue.ToString();
                                }
                            }
                        }
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
                DataView v1 = (DataView)StageDS.Select();
                if (v1.Count > 0)
                {
                    if (v1[0]["StageId"] != null)
                    {
                        string StageId = v1[0]["StageId"].ToString();
                        PeriodsDS.SelectParameters["StageId"].DefaultValue = "1";
                    }
                }

               DataView v=  (DataView)PeriodsDS.Select();
                if (v.Count >0)
                {
                    if (v[0]["PeriodId"] != null)
                    {
                        string PeriodId = v[0]["PeriodId"].ToString();
                        SubjectsDS.SelectParameters["PeriodId"].DefaultValue = PeriodId;
                    }
                }
                SubjectsDS.DataBind();

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
        protected void ddlStage_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList dropDownList = (DropDownList)sender;
            if (dropDownList != null)
            {
                ListViewItem listView = (ListViewItem)dropDownList.NamingContainer;

                if (dropDownList.SelectedValue != null)
                {
                    //DropDownList lst_Anlage = (DropDownList)snd;
                    DropDownList ddlPeriodDropDownList = (DropDownList)dropDownList.Parent.FindControl("ddlPeriod");
                    //TextBox HiddenField1 = (TextBox)dropDownList.Parent.FindControl("SectionIdHiddenField");
                    //HtmlGenericControl Sectionlabel = (HtmlGenericControl)dropDownList.Parent.FindControl("Sectionlabel");

                    var idx_Anlage = (dropDownList.SelectedValue);
                    PeriodsDS.SelectParameters["StageId"].DefaultValue = dropDownList.SelectedValue.ToString();
                    StageIdHiddenField.Value = dropDownList.SelectedValue.ToString();
                    PeriodsDS.DataBind();
                    ddlPeriodDropDownList.DataBind();

                    //src_Schluessel.SelectParameters[0].DefaultValue = idx_Anlage;
                    //lst_Schluessel.SelectedValue = HiddenField1.Value;
                    if (ddlPeriodDropDownList.SelectedValue != null)
                    {
                        ((TextBox)dropDownList.Parent.FindControl("PeriodIdHiddenField")).Text = ddlPeriodDropDownList.SelectedValue.ToString();
                    }

                    DropDownList ddlSubjectDropDownList = (DropDownList)dropDownList.Parent.FindControl("ddlSubject");
                    //TextBox HiddenField1 = (TextBox)dropDownList.Parent.FindControl("SectionIdHiddenField");
                    //HtmlGenericControl Sectionlabel = (HtmlGenericControl)dropDownList.Parent.FindControl("Sectionlabel");

                   
                    SubjectsDS.SelectParameters["PeriodId"].DefaultValue = ddlPeriodDropDownList.SelectedValue.ToString();
                    //StageIdHiddenField.Value = dropDownList.SelectedValue.ToString();
                    SubjectsDS.DataBind();
                    ddlSubjectDropDownList.DataBind();

                    //src_Schluessel.SelectParameters[0].DefaultValue = idx_Anlage;
                    //lst_Schluessel.SelectedValue = HiddenField1.Value;
                    if (ddlSubjectDropDownList.SelectedValue != null)
                    {
                        ((TextBox)dropDownList.Parent.FindControl("SubjectIdHiddenField")).Text = ddlSubjectDropDownList.SelectedValue.ToString();
                    }


                }
            }


        }
        protected void ddlPeriod_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList dropDownList = (DropDownList)sender;
            if (dropDownList != null)
            {
                ListViewItem listView = (ListViewItem)dropDownList.NamingContainer;

                if (dropDownList.SelectedValue != null)
                {
                    //DropDownList lst_Anlage = (DropDownList)snd;
                    DropDownList ddlSubjectDropDownList = (DropDownList)dropDownList.Parent.FindControl("ddlSubject");
                    //TextBox HiddenField1 = (TextBox)dropDownList.Parent.FindControl("SectionIdHiddenField");
                    //HtmlGenericControl Sectionlabel = (HtmlGenericControl)dropDownList.Parent.FindControl("Sectionlabel");

                    var idx_Anlage = (dropDownList.SelectedValue);
                    SubjectsDS.SelectParameters["PeriodId"].DefaultValue = dropDownList.SelectedValue.ToString();
                    //StageIdHiddenField.Value = dropDownList.SelectedValue.ToString();
                    SubjectsDS.DataBind();
                    ddlSubjectDropDownList.DataBind();

                    //src_Schluessel.SelectParameters[0].DefaultValue = idx_Anlage;
                    //lst_Schluessel.SelectedValue = HiddenField1.Value;
                    if (ddlSubjectDropDownList.SelectedValue != null)
                    {
                        ((TextBox)dropDownList.Parent.FindControl("SubjectIdHiddenField")).Text = ddlSubjectDropDownList.SelectedValue.ToString();
                    }



                }
            }


        }
        
        protected void lv_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            DropDownList dropDownList = (e.Item.FindControl("ddlStageId") as DropDownList);

            if (dropDownList != null)
            {
                if (dropDownList.SelectedValue != null)
                {
                    StageIdHiddenField.Value = dropDownList.SelectedValue.ToString();

                    DropDownList PeriodDropDownList = (e.Item.FindControl("ddlPeriod") as DropDownList); //(DropDownList)lv.FindControl("SectionDropDownList");

                    TextBox txtPeriodId = (TextBox)e.Item.FindControl("PeriodIdHiddenField");
                    PeriodsDS.SelectParameters["StageId"].DefaultValue = dropDownList.SelectedValue.ToString();
                    PeriodsDS.DataBind();
                    //HtmlGenericControl Sectionlabel = (HtmlGenericControl)e.Item.FindControl("Sectionlabel");
                    PeriodDropDownList.DataBind();

                    if (PeriodDropDownList != null && txtPeriodId != null)
                    {
                        if (txtPeriodId.Text != "" && txtPeriodId.Text != "0")
                        {
                            PeriodDropDownList.SelectedValue = txtPeriodId.Text;

                            DropDownList SubjectDropDownList = (e.Item.FindControl("ddlSubject") as DropDownList);

                            SubjectsDS.SelectParameters["PeriodId"].DefaultValue = PeriodDropDownList.SelectedValue.ToString();
                            SubjectsDS.DataBind();
                            //HtmlGenericControl Sectionlabel = (HtmlGenericControl)e.Item.FindControl("Sectionlabel");
                            SubjectDropDownList.DataBind();

                            TextBox txtSubjectId = (TextBox)e.Item.FindControl("SubjectIdHiddenField");
                            if (SubjectDropDownList != null && txtSubjectId != null)
                            {
                                if (txtSubjectId.Text != "" && txtSubjectId.Text != "0")
                                {
                                    SubjectDropDownList.SelectedValue = txtSubjectId.Text;
                                }
                            }
                        }

                    }
                }
            }
        }

       
            
    }
}