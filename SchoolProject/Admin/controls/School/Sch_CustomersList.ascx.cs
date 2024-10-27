using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSchool.ADMIN.Controls.School
{
    public partial class Sch_CustomersList : System.Web.UI.UserControl
    {
        string Accessing, Adding, Updating, Deleting, Importing;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["VendorID"] = 1;

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

            dt = DA1.Read("1", USERID, 12, "");
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
                if (Adding != "True") { NewRecord.Visible = false; }
            }
            else
            {
                Response.Redirect("~/NoAccess.aspx?URL=" + previousUrl);
            }


        }
        protected void lv_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            try
            {
                switch (e.CommandName)
                {
                    case "Calls":
                    
                        int id = Int32.Parse(e.CommandArgument.ToString());

                        txtCustId.Text  = id.ToString();
                        ObjectDataSourceCustomerCalls.SelectParameters["CustId"].DefaultValue = txtCustId.Text;
                        ObjectDataSourceCustomerCalls.Select();
                        ListViewCalls.DataBind();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "showPopup();", true);
                        break;
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
            AddNewCustomer();
        }
        private void AddNewCustomer()
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
            if (SearchTextBox.Text != "")
            {
                int? CustId = 0;
                //ObjectCustomersDS.SelectParameters["userId"].DefaultValue = "0";
                DataView dt = (DataView)ObjectCustomersDS.Select();
                if (dt.Count > 0)
                {

                    txtCustId.Text = dt[0]["Id"].ToString();
                    //lblCustName.Text = dt[0]["Tel"].ToString();
                }
                else
                {

                    BOL.Sch_Customer Cust = new BOL.Sch_Customer();
                    DAL.Customers.Sch_CustomerDataTable dtQid = new DAL.Customers.Sch_CustomerDataTable();

                    int USERID = int.Parse(Session["UserId"].ToString());
                    long QrgId = long.Parse(Session["OrgId"].ToString());
                    Cust.DML("1", 0, SearchTextBox.Text, 0, "", SearchTextBox.Text, SearchTextBox.Text, USERID, "", "", "", "", 0, QrgId, USERID, USERID, 0, ref CustId);
                    txtCustId.Text = CustId.ToString();
                }

                ObjectDataSourceCustomerCalls.SelectParameters["CustId"].DefaultValue = txtCustId.Text;
                ObjectDataSourceCustomerCalls.Select();
                ListViewCalls.DataBind();
                AddCustCalls();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "showPopup();", true);
            }
        }

        protected void lv_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            LinkButton EditLinkButton = (LinkButton)e.Item.FindControl("EditLinkButton");
            LinkButton DeleteLinkButton = (LinkButton)e.Item.FindControl("DeleteLinkButton");
            if (Updating != "True") { EditLinkButton.Visible = false; }
            if (Deleting != "True") { DeleteLinkButton.Visible = false; }
        }

        protected void ListViewCalls_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            try
            {
                switch (e.CommandName)
                {
                   
                    case "Edit":


                        ListViewCalls.InsertItemPosition = InsertItemPosition.None;
                       
                        break;
                    case "NewRecord":
                        ListViewCalls.InsertItemPosition = InsertItemPosition.FirstItem;
                        break;
                    case "Cancel":
                        //Hide code
                        lv.InsertItemPosition = InsertItemPosition.None;
                        break;
                    case "UnSelect":
                        ListViewCalls.SelectedIndex = -1;
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
                        ListViewCalls.InsertItemPosition = InsertItemPosition.None;
                        break;

                    case "Insert":
                        //TextBox txtdate = (TextBox)ListViewCalls.InsertItem.FindControl("DayDateTextBox");
                        //txtdate.Text = DateTime.Today.ToShortDateString();
                        TextBox txtdate = (TextBox)ListViewCalls.InsertItem.FindControl("DayDateTextBox");
                        txtdate.Text = DateTime.Today.ToShortDateString();

                        ObjectDataSourceCustomerCalls.InsertParameters["CustId"].DefaultValue = txtCustId.Text;
                        ObjectDataSourceCustomerCalls.InsertParameters["DayTime"].DefaultValue = DateTime.Now.ToString();

                        ListViewCalls.InsertItemPosition = InsertItemPosition.None;
                        break;


                }
            }
            catch (Exception ex)
            {
                ErrorDiv.InnerHtml = "<div class=\"alert alert-danger alert-dismissable\"> <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×</button><h4><i class=\"fa fa-times-circle\"></i> Error</h4>" + ex.Message.ToString() + "</div>";
            }
        }

        protected void ListViewCalls_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            //if (ListViewCalls.InsertItem != null)
            //{
            //    TextBox tb = (TextBox)ListViewCalls.InsertItem.FindControl("DayDateTextBox");
            //    if (tb != null)
            //    {
            //        tb.Text = DateTime.Now.ToShortDateString();

            //    }
            //}
        }
        protected void NewRecordCall_Click(object sender, EventArgs e)
        {
            AddCustCalls();
        }
        private void AddCustCalls()
        {
            if (ListViewCalls.InsertItemPosition != InsertItemPosition.FirstItem)
            {
                ListViewCalls.InsertItemPosition = InsertItemPosition.None;
                ListViewCalls.EditIndex = -1;

                ListViewCalls.InsertItemPosition = InsertItemPosition.FirstItem;


                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "showPopup();", true);
                //CKEditor.NET.CKEditorControl DescriptionCKEditor = (CKEditor.NET.CKEditorControl)lv.FindControl("DescriptionCKEditor");

            }
        }

        protected void ObjectDataSourceCustomerReply_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
        {
           
        }

        protected void lv_ItemInserted(object sender, ListViewInsertedEventArgs e)
        {

        }

        protected void ObjectDataSourceCustomerCalls_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
        {
            CustomersDS.Select();
            CustomersDS.DataBind();
            lv.DataBind();
        }

        protected void ObjectDataSourceCustomerCalls_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
        {
            //ObjectDataSourceCustomerCalls.InsertParameters["CustId"].DefaultValue = txtCustId.Text;
           // ObjectDataSourceCustomerCalls.InsertParameters["DayTime"].DefaultValue = DateTime.Now.ToString ();
        }

        protected void CustomersDS_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
        {
            long ret = int.Parse(e.ReturnValue.ToString());
            if (ret == -1)
            {
                ErrorDiv.Visible = true;
                ErrorDiv.InnerHtml = "<div class=\"alert alert-danger alert-dismissable\"> <i class=\"fa fa-times-circle\"></i>" +
                       Resources.DefaultResource.DuplicateNumber + "</div>";

            }
            else
            {
                ErrorDiv.Visible = true;
                ErrorDiv.InnerHtml = "<div class=\"alert alert-success\" role=\"alert\">" + Resources.DefaultResource.Savesuccess.ToString() + "</div>";
            }
          
        }

        protected void ListViewCalls_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            //TextBox DateAssignedTextBox = (TextBox)e.Item.FindControl("DateAssignedTextBox");
            //DateAssignedTextBox.Text = DateTime.Now.ToShortDateString();
        }

        protected void ListViewCalls_PreRender(object sender, EventArgs e)
        {
            if (ListViewCalls.InsertItem != null)
            {
                TextBox DateAssignedTextBox = (TextBox)ListViewCalls.InsertItem.FindControl("DayDateTextBox");
                DateAssignedTextBox.Text = DateTime.Now.ToString("dd/MM/yyyy");

                //DropDownList dropDownList = (ListViewCalls.InsertItem.FindControl("DeaprtmentsDropDownList") as DropDownList);

                //if (dropDownList != null)
                //{
                //    //if (dropDownList.SelectedValue != null)

                //}

                //((TextBox)ListViewCalls.InsertItem.FindControl("DateAssignedTextBox")).Text = 
                }
        }
    }
}