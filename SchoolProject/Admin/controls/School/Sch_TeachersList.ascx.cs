using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSchool.ADMIN.Controls.School
{
    public partial class Sch_TeachersList : System.Web.UI.UserControl
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

            dt1 = DA1.Read("1", USERID, 3, "");
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
                if (Adding != "True") { NewRecord.Visible = false; }
            }
            else
            {
                Response.Redirect("~/NoAccess.aspx?URL=" + previousUrl);
            }
            if (!IsPostBack)
            {
                SubjectsDS.SelectParameters["PeriodId"].DefaultValue = "-1";
                SubjectsDS.DataBind();
                SubjectsDropDownList.DataBind();
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

                    case "Send":
                        long TeacherId = long.Parse(e.CommandArgument.ToString());
                       

                        BOL.Sch_Teachers DA = new BOL.Sch_Teachers ();

                        DAL.Teachers.Sch_TeachersDataTable dt = new DAL.Teachers.Sch_TeachersDataTable();

                        long QrgId = long.Parse(Session["OrgId"].ToString());
                        dt = DA.Read("1",TeacherId,0,0, QrgId,0, 0, 0, "","",0,"");
                        if (dt.Count > 0)
                        {
                           string ContractDesc = dt[0].ContractDesc;
                            string Telphone = dt[0].Tel;
                            if (!String.IsNullOrEmpty(Telphone))
                            {
                                MemoryStream stream = new MemoryStream();
                                //SubImageBox.Image.Save(stream, System.Drawing.Imaging.ImageFormat.Jpeg);
                                //to the pic which is also of kind byte[]
                                byte[] pic = stream.ToArray();
                                Telphone = "+965" + Telphone;
                                BOL.EmailSender.SendWahts(Telphone, ContractDesc, "", null, QrgId);
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

        protected void PeriodDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (PeriodDropDownList.SelectedValue != null)
            {
                //SubjectsDS.DataBind();
                //SubjectsDropDownList.Items.Clear();
                //SubjectsDropDownList.Items.Add(Resources.DefaultResource.ChooseSubject);
                SubjectsDS.DataBind();
                SubjectsDropDownList.DataBind();
            }
        }

        protected void SubjectsDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void NewRecord_Click(object sender, EventArgs e)
        {
            if (lv.InsertItemPosition != InsertItemPosition.FirstItem)
            {
                lv.InsertItemPosition = InsertItemPosition.None;
                lv.EditIndex = -1;

                lv.InsertItemPosition = InsertItemPosition.FirstItem;


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
            lv.DataBind();
        }

        protected void lv_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            LinkButton EditLinkButton = (LinkButton)e.Item.FindControl("EditLinkButton");
            LinkButton DeleteLinkButton = (LinkButton)e.Item.FindControl("DeleteLinkButton");
            if (Updating != "True") { EditLinkButton.Visible = false; }
            if (Deleting != "True") { DeleteLinkButton.Visible = false; }

            if (lv.InsertItem != null)
            {
                //TextBox tb = (TextBox)lv.InsertItem.FindControl("qidDateTextBox");
                //tb.Text = DateTime.Today.ToShortDateString();
            }

        }


    }
}