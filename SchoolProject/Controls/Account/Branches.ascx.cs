using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSchool.Controls.Account
{
    public partial class Branches : System.Web.UI.UserControl
    {
        string Accessing, Adding, Updating, Deleting, Importing;
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
            HttpCookie cookieOrgId = HttpContext.Current.Request.Cookies.Get("OrgId");
            HttpCookie cookieName = HttpContext.Current.Request.Cookies.Get("Name");
            HttpCookie cookieUserId = HttpContext.Current.Request.Cookies.Get("UserId");

            int USERID = int.Parse(cookieUserId.Value.ToString ());// int.Parse(Session["UserID"].ToString());
     
            if (cookieOrgId != null)
            {
                txtOrgId.Text = cookieOrgId.Value.ToString();
            }
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


        }
        protected void lv_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            // Hidding Action buttons in case not assigend  
            LinkButton EditLinkButton = (LinkButton)e.Item.FindControl("EditLinkButton");
            LinkButton DeleteLinkButton = (LinkButton)e.Item.FindControl("DeleteLinkButton");
            //if (Updating != "True") { EditLinkButton.Visible = false; }
            //if (Deleting != "True") { DeleteLinkButton.Visible = false; }
        }
        protected void NewRecord_Click(object sender, EventArgs e)
        {
            if (lv.InsertItemPosition != InsertItemPosition.FirstItem)
            {
                lv.InsertItemPosition = InsertItemPosition.FirstItem;

            }
        }

        protected void ClearLinkButton_Click(object sender, EventArgs e)
        {
            //SearchTextBox.Text = "";
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
    }
}