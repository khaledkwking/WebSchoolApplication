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
    public partial class Sch_PayRecitesListAll : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["VendorID"] = 1;
            //HttpCookie cookieOrgId = HttpContext.Current.Request.Cookies.Get("OrgId");
            //HttpCookie cookieName = HttpContext.Current.Request.Cookies.Get("Name");
            //HttpCookie cookieUserId = HttpContext.Current.Request.Cookies.Get("UserId");

            //int USERID = int.Parse(cookieUserId.Value.ToString());// int.Parse(Session["UserID"].ToString());
            string Accessing, Adding, Updating, Deleting, Importing;
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

            dt = DA1.Read("1", USERID, 7, "");
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
                //if (Adding != "True") { NewRecord.Visible = false; }
            }
            else
            {
                Response.Redirect("~/NoAccess.aspx?URL=" + previousUrl);
            }


            if (!Page.IsPostBack)
            {

                //lv.SelectedIndex = 0;
                StartDateTextBox.Text = DateTime.Today.ToShortDateString();
                EndDateTextBox.Text = DateTime.Today.ToShortDateString();
                if (Request.QueryString["RFlag"] != null)
                {
                    if (Request.QueryString["RFlag"].ToString() == "1")
                    {
                        if (Session["RSDate"] != null)
                        {
                            StartDateTextBox.Text = Session["RSDate"].ToString();
                        }
                        if (Session["REDate"] != null)
                        {
                            EndDateTextBox.Text = Session["REDate"].ToString();

                        }
                    }
                }
                GetAllSum();


            }

        }
        private void GetAllSum()
        {
            DataView V;
            V = (DataView)PaymentReciteDS.Select();
            decimal KeyNetPayment = 0;
            decimal LinkPayment = 0;
            decimal Payment = 0;
            decimal CashPayment = 0;
            for (int i = 0; i < V.Count; i++)
            {
                //string strtotal = V[i]["InvTotalNet"].ToString();
                string strPayment = V[i]["PaymentValue"].ToString();
                // string strRemain = V[i]["InvRemain"].ToString();
                string PaymentType = V[i]["PaymentType"].ToString();

                if (!string.IsNullOrEmpty(strPayment) && !string.IsNullOrEmpty(PaymentType))
                {
                    if (PaymentType == "4")
                    {
                        LinkPayment = LinkPayment + decimal.Parse(strPayment);
                    }
                }
                if (!string.IsNullOrEmpty(strPayment))
                {
                    Payment = Payment + decimal.Parse(strPayment);
                }

                if (!string.IsNullOrEmpty(strPayment) && !string.IsNullOrEmpty(PaymentType))
                {
                    if (PaymentType == "1")
                    {
                        CashPayment = CashPayment + decimal.Parse(strPayment);
                    }
                }

                if (!string.IsNullOrEmpty(strPayment) && !string.IsNullOrEmpty(PaymentType))
                {
                    if (PaymentType == "3")
                    {
                        KeyNetPayment = KeyNetPayment + decimal.Parse(strPayment);
                    }
                }

            }
            lblTotalCash.Text = decimal.Round(CashPayment, 3).ToString();
            lblTotalLinkPayment.Text = decimal.Round(LinkPayment, 3).ToString();
            lblTotalPayment.Text = decimal.Round(Payment, 3).ToString();
            lblTotalKeyNetPayment.Text = decimal.Round(KeyNetPayment, 3).ToString();
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
            GetAllSum();
            Session["RSDate"] = StartDateTextBox.Text;
            Session["REDate"] = EndDateTextBox.Text;
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
            //Session["StudentId"] = DropDownListStudent.SelectedValue.ToString();
            Session["SearchText"] = SearchTextBox.Text;
            string url = "InvoicesShowReport.aspx?Id=6";

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