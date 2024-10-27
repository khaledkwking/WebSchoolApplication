using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSchool.ADMIN.Controls.School
{
    public partial class Sch_PayRecitesBackList : System.Web.UI.UserControl
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
            DAL.UsersPages.UsersPagesDataTable dt = new DAL.UsersPages.UsersPagesDataTable();

            dt = DA1.Read("1", USERID, 10, "");
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

            if (Request.QueryString["InvId"] == null)
            {
                NewRecord.Visible = false;
            }
            else
            {
                InvoiceView.Visible = true;
            }

            if (Request.QueryString["BackFlag"] != null)
            {

                InvoiceView.Visible = false;
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
                InvoiceDS.Select();
                InvoiceView.DataBind();

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
            lv.DataBind();
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
            InvoiceDS.Select();
            InvoiceView.DataBind();
        }

        protected void InvoiceView_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            Label lblInvRemain = (Label)e.Item.FindControl("lblInvRemain");
            Label lblInvPayment = (Label)e.Item.FindControl("lblInvPayment");
            if (lblInvRemain != null)
            {
                txtRemain.Text = lblInvRemain.Text;
            }
            if (lblInvPayment != null)
            {
                txtInvPayement.Text = lblInvPayment.Text;
            }
            LinkButton EditLinkButton = (LinkButton)e.Item.FindControl("EditLinkButton");
            LinkButton DeleteLinkButton = (LinkButton)e.Item.FindControl("DeleteLinkButton");
            if (Updating != "True") { EditLinkButton.Visible = false; }
            if (Deleting != "True") { DeleteLinkButton.Visible = false; }

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
                ((TextBox)lv.InsertItem.FindControl("txtInvRemain")).Text = txtInvPayement.Text;
            }
            if (lv.InsertItem != null)
            {
                TextBox DateAssignedTextBox = (TextBox)lv.InsertItem.FindControl("ReciteDateTextBox");
                DateAssignedTextBox.Text = DateTime.Now.ToString("dd/MM/yyyy");
            }
                InvoiceDS.Select();
            InvoiceView.DataBind();
        }

        protected void lv_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
 }