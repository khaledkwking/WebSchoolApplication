using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSchool.Controls.Account
{
    public partial class TrialBalance : System.Web.UI.UserControl
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
            int TypeId = 0;
            if (Request.QueryString["TypeId"] != null)
            {
                TypeId = int.Parse(Request.QueryString["TypeId"].ToString());
            }
            txtTypeId.Value = TypeId.ToString();
            int USERID = int.Parse(cookieUserId.Value.ToString());// int.Parse(Session["UserID"].ToString());

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
            if (!Page.IsPostBack)
            {

                //lv.SelectedIndex = 0;
                StartDateTextBox.Text = DateTime.Today.ToShortDateString();
                EndDateTextBox.Text = DateTime.Today.ToShortDateString();

                //DataView V = (DataView)QidsDS.Select();
                //if (V.Count > 0)
                //{
                //    string QidID =  V[0]["qidid"].ToString ();
                //    txtQidId.Value = QidID;
                //    LoadDetData();
                // }

                //TotalSum();
            }
           

        }



      

        protected void ClearLinkButton_Click(object sender, EventArgs e)
        {
            //SearchTextBox.Text = "";
           // lv.DataBind();

        }

     
        protected void SearchLinkButton_Click(object sender, EventArgs e)
        {
            //ReportParameter[] parameters = new ReportParameter[2];
            //parameters[0] = new ReportParameter("FromDate", StartDateTextBox.Text);
            //parameters[1] = new ReportParameter("ToDate", EndDateTextBox.Text);
            //ReportViewer1.LocalReport.SetParameters(parameters);

            //QidsDS.Select();
           // lv.DataBind();
            //ReportViewer1.LocalReport.Refresh();
            // ReportViewer1.DataBind();
            //TotalSum();
        }

        protected void PrintBtn_Click(object sender, EventArgs e)
        {
            long AcounntId = 0;
            long BranchId = 0;
            long CostId = 0;
            if (AccountDropDownList.SelectedValue.ToString() == "0")
            {
                //QidsDS.Select();
                AcounntId = 1;
            }
            else
            {
                AcounntId = long.Parse(AccountDropDownList.SelectedValue.ToString());
            }
            string AccountName = "";
                string Accountcode = "";
                
                long OrgId = long.Parse(txtOrgId.Text);
                //BOL.Accounts dt = new BOL.Accounts();
                //DAL.ERPAssetDataSet.AccountsDataTable Tbl= dt.Read("1", AcounntId, OrgId, 0, 0, 0, "", "", "");
                //if (Tbl.Rows .Count >0)
                //{
                //    DataRow UserRow = Tbl.Rows[0];
                //    AccountName = UserRow["AccountName"].ToString();
                //    Accountcode = UserRow["Accountcode"].ToString();
                //}

               

                if (StartDateTextBox.Text != "" && EndDateTextBox.Text !="")
                {
                    DateTime curDate = Convert.ToDateTime(StartDateTextBox.Text);
                    DateTime curDate1 = Convert.ToDateTime(EndDateTextBox.Text);

                    if (BranchDropDownList.SelectedValue != null)
                    {
                        BranchId = long.Parse(BranchDropDownList.SelectedValue.ToString());
                    }
                    if (CostDropDownList.SelectedValue != null)
                    {
                        CostId = long.Parse(CostDropDownList.SelectedValue.ToString());
                    }

                    string Url = "QidShowRpt.aspx?Id=11&SDate=" + curDate.ToString("dd/MM/yyyy") + "&EDate=" + curDate1.ToString("dd/MM/yyyy") + "&BranchId=" + BranchId.ToString() + "&CostId=" + CostId.ToString() + "&AcounntId=" + AcounntId.ToString();

                   // string Ulr = "~/Admin/QidShowRpt.aspx?Id=10&SDate=" + curDate.ToString("MM/dd/yyyy") + "&EDate=" + curDate1.ToString("MM/dd/yyyy") + "&BranchId=" + BranchId.ToString() + "&CostId=" + CostId.ToString() + "&AcounntId=" + AcounntId.ToString();
                    //Response.Redirect(Ulr);
                string link = "window.open('" + Url + "','_blank');";
                ScriptManager.RegisterStartupScript(this, typeof(string), "openModal", link, true);
            }
            
        }

        
    }
}