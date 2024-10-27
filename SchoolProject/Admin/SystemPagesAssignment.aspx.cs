using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectsManagements
{
    public partial class SystemPagesAssignment : WebSchool.Utilities.BaseClass
    {
        int EmployeeUserID;
        string Accessing, Adding, Updating, Deleting, Importing;
        static Boolean AccessFlag = true;
        static Boolean AddingFlag = true;
        static Boolean UpdatingFlag = true;
        static Boolean DeletingFlag = true;
        static Boolean ImportingFlag = true;
        protected void CancelButtonBack_Click(object sender, EventArgs e)
        {
            object refUrl = ViewState["RefUrl"];
            if (refUrl != null)
                Response.Redirect((string)refUrl);
        }

        protected void SearchLinkButton_Click(object sender, EventArgs e)
        {

        }

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
                previousUrl = "default.aspx";
            }

            // to get all user Prvlages on page 
            int USERID = int.Parse(Session["UserID"].ToString());
            BOL.UsersPages DA = new BOL.UsersPages();
            DAL.UsersPages.UsersPagesDataTable dt = new DAL.UsersPages.UsersPagesDataTable();

            dt = DA.Read("1", USERID, 6, "");
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
                if (Updating != "True") { SaveRecordsLinkButton.Visible = false; }
            }
            else
            {
                //Response.Redirect("~/NoAccess.aspx?URL=" + previousUrl);
            }

            if (Request.QueryString["ID"] != null)
            {
                bool success = Int32.TryParse(Request.QueryString["ID"].ToString(), out EmployeeUserID);
                if (success)
                {
                    EmployeeUserID = int.Parse(Request.QueryString["ID"].ToString());
                    ODS.SelectParameters["ActionCode"].DefaultValue = "2";
                }
                else
                {
                    ODS.SelectParameters["ActionCode"].DefaultValue = "0";
                }
            }
            if (!this.IsPostBack)
            {
                ViewState["RefUrl"] = Request.UrlReferrer.ToString(); // save call page
            }

        }



        protected void SaveRecords_Click(object sender, EventArgs e)
        {
            BOL.UsersPages DA = new BOL.UsersPages();
            //Reset all privileges
            DA.DML("30", 0, EmployeeUserID, 0, 0, 0, 0, 0, 0, 0, 0);

            //assign new privileges
            foreach (var item in lv.Items)
            {
                // find the CheckBoxs inside the list view
                Label PageIDLabel = (Label)item.FindControl("PageIDLabel");
                CheckBox AccessingCheckBox = (CheckBox)item.FindControl("AccessingCheckBox");
                CheckBox AddingCheckBox = (CheckBox)item.FindControl("AddingCheckBox");
                CheckBox ImportingCheckBox = (CheckBox)item.FindControl("ImportingCheckBox");
                CheckBox UpdatingCheckBox = (CheckBox)item.FindControl("UpdatingCheckBox");
                CheckBox DeletingCheckBox = (CheckBox)item.FindControl("DeletingCheckBox");

                int PageID, Accessing, Adding, Importing, Updating, Deleting;
                PageID = int.Parse(PageIDLabel.Text);

                if (AccessingCheckBox.Checked == true) { Accessing = 1; } else { Accessing = 0; }
                if (AddingCheckBox.Checked == true) { Adding = 1; } else { Adding = 0; }
                //if (ImportingCheckBox.Checked == true) { Importing = 1; } else { Importing = 0; }
                if (ImportingCheckBox.Checked == true) { Importing = 1; } else { Importing = 0; }
                if (UpdatingCheckBox.Checked == true) { Updating = 1; } else { Updating = 0; }
                if (DeletingCheckBox.Checked == true) { Deleting = 1; } else { Deleting = 0; }
                // save the checked privileges
                DA.DML("1", PageID, EmployeeUserID, Accessing, Adding, Updating, Deleting, Importing, 0, 0, 0);
            }

            ODS.SelectParameters["ActionCode"].DefaultValue = "2";
            lv.DataBind();
        }




        protected void ClearLinkButton_Click(object sender, EventArgs e)
        {
            SearchTextBox.Text = "";
            lv.DataBind();

        }

        protected void lv_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            try
            {
                switch (e.CommandName)
                {
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
                    case "Insert":
                        lv.InsertItemPosition = InsertItemPosition.None;
                        break;
                    case "AccessBtn":
                        checkAllButtons(1);
                        break;
                    case "AddingBtn":
                        checkAllButtons(2);
                        break;
                    case "UpdatingBtn":
                        checkAllButtons(3);
                        break;
                    case "DeletingBtn":
                        checkAllButtons(4);
                        break;
                    case "ImportingBtn":
                        checkAllButtons(5);
                        break;
                }
            }
            catch (Exception ex)
            {
                ErrorDiv.InnerHtml = "<div class=\"alert alert-danger alert-dismissable\"> <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×</button><h4><i class=\"fa fa-times-circle\"></i> Error</h4>" + ex.Message.ToString() + "</div>";

            }
        }

        private void checkAllButtons(int ParamFlag)
        {

            foreach (var item in lv.Items)
            {

                // find the CheckBoxs inside the list view
                //Label PageIDLabel = (Label)item.FindControl("PageIDLabel");
                switch (ParamFlag)
                {
                    case 1:
                        CheckBox AccessingCheckBox = (CheckBox)item.FindControl("AccessingCheckBox");
                        AccessingCheckBox.Checked = AccessFlag;
                        break;
                    case 2:
                        CheckBox AddingCheckBox = (CheckBox)item.FindControl("AddingCheckBox");
                        AddingCheckBox.Checked = AddingFlag;
                        break;
                    case 3:
                        CheckBox UpdatingCheckBox = (CheckBox)item.FindControl("UpdatingCheckBox");
                        UpdatingCheckBox.Checked = UpdatingFlag;
                        break;
                    case 4:
                        CheckBox DeletingCheckBox = (CheckBox)item.FindControl("DeletingCheckBox");
                        DeletingCheckBox.Checked = DeletingFlag;
                        break;
                    case 5:
                        CheckBox ImportingCheckBox = (CheckBox)item.FindControl("ImportingCheckBox");
                        ImportingCheckBox.Checked = ImportingFlag;
                        break;
                }

                //CheckBox AddingCheckBox = (CheckBox)item.FindControl("AddingCheckBox");
                //CheckBox ImportingCheckBox = (CheckBox)item.FindControl("ImportingCheckBox");
                //CheckBox UpdatingCheckBox = (CheckBox)item.FindControl("UpdatingCheckBox");
                //CheckBox DeletingCheckBox = (CheckBox)item.FindControl("DeletingCheckBox");
                //CheckBox DeleteAllCheckBox = (CheckBox)item.FindControl("DeleteAllCheckBox");

            }
            switch (ParamFlag)
            {
                case 1:
                    if (AccessFlag) { AccessFlag = false; } else { AccessFlag = true; }
                    break;
                case 2:
                    if (AddingFlag) { AddingFlag = false; } else { AddingFlag = true; }
                    break;
                case 3:
                    if (UpdatingFlag) { UpdatingFlag = false; } else { UpdatingFlag = true; }
                    break;
                case 4:
                    if (DeletingFlag) { DeletingFlag = false; } else { DeletingFlag = true; }
                    break;
                case 5:
                    if (ImportingFlag) { ImportingFlag = false; } else { ImportingFlag = true; }
                    break;
            }




        }
    }
}