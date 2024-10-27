using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSchool.Controls.Account
{
    public partial class StatementSheet : System.Web.UI.UserControl
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

                DataView V = (DataView)QidsDS.Select();
                //if (V.Count > 0)
                //{
                //    string QidID =  V[0]["qidid"].ToString ();
                //    txtQidId.Value = QidID;
                //    LoadDetData();
                // }

                TotalSum();
            }
           

        }


        protected void lv_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            // Hidding Action buttons in case not assigend  
            LinkButton EditLinkButton = (LinkButton)e.Item.FindControl("EditLinkButton");
            LinkButton DeleteLinkButton = (LinkButton)e.Item.FindControl("DeleteLinkButton");
            //if (Updating != "True") { EditLinkButton.Visible = false; }
            //if (Deleting != "True") { DeleteLinkButton.Visible = false; }
            if (lv.InsertItem != null)
            {
                TextBox tb = (TextBox)lv.InsertItem.FindControl("qidDateTextBox");
                tb.Text = DateTime.Today.ToShortDateString();
            }


        }
        protected void NewRecord_Click(object sender, EventArgs e)
        {
            //if (lv.InsertItemPosition != InsertItemPosition.FirstItem)
            //{
            //    lv.InsertItemPosition = InsertItemPosition.FirstItem;

            //    //Label ImageNameLabel = (Label)lv.EditItem.FindControl("ImageNameLabel");
            //}



            //Do the database lookup using the ID...
            //gvDetails.DataSource = new List<string> { "Customer Surname", "Customer Phone", "Customer Address" };
            //gvDetails.DataBind();
            
           

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
                    case "select":
                        //lv.InsertItemPosition = InsertItemPosition.None;

                        //if (lv.SelectedIndex >= 0)
                        //{
                        //Get the item object.
                        //ListViewDataItem dataItem = (ListViewDataItem)e.Item;

                        ////if (dataItem.DisplayIndex == lv.SelectedIndex)
                        ////{
                        //string QidID = e.CommandArgument.ToString();
                        //txtQidId.Value = QidID;

                        //if (lv.SelectedIndex > -1)
                        //{
                        //    string QidID = lv.DataKeys[lv.SelectedIndex].Value.ToString();
                        //}



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
                ErrorDiv.InnerHtml = "<div class=\"alert alert-warning alert-dismissable\"> <h4><i class=\"fa fa-times-circle\"></i> </h4>" + ex.Message.ToString() + "</div>";

            }
        }

        protected void SearchLinkButton_Click(object sender, EventArgs e)
        {
            //ReportParameter[] parameters = new ReportParameter[2];
            //parameters[0] = new ReportParameter("FromDate", StartDateTextBox.Text);
            //parameters[1] = new ReportParameter("ToDate", EndDateTextBox.Text);
            //ReportViewer1.LocalReport.SetParameters(parameters);

            //QidsDS.Select();
            lv.DataBind();
            //ReportViewer1.LocalReport.Refresh();
            // ReportViewer1.DataBind();
            TotalSum();
        }

        protected void PrintBtn_Click(object sender, EventArgs e)
        {
            if (AccountDropDownList.SelectedValue.ToString() != "0")
            {
                  //QidsDS.Select();
                long AcounntId = 0;
                long BranchId = 0;
                long CostId = 0;
                string AccountName = "";
                string Accountcode = "";
                AcounntId = long.Parse(AccountDropDownList.SelectedValue.ToString());
                long OrgId = long.Parse(txtOrgId.Text);
                BOL.Accounts dt = new BOL.Accounts();
                DAL.ERPAssetDataSet.AccountsDataTable Tbl= dt.Read("1", AcounntId, OrgId, 0, 0, 0, "", "","","", "");
                if (Tbl.Rows .Count >0)
                {
                    DataRow UserRow = Tbl.Rows[0];
                    AccountName = UserRow["AccountName"].ToString();
                    Accountcode = UserRow["Accountcode"].ToString();
                }

               

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

                    //string Url = "~/Admin/QidShowRpt.aspx?Id=10&SDate=" + curDate.ToString("dd/MM/yyyy") + "&EDate=" + curDate1.ToString("dd/MM/yyyy") + "&BranchId=" + BranchId.ToString() + "&CostId=" + CostId.ToString() + "&AcounntId=" + AcounntId.ToString()+"&Paccountname="+ AccountName+"&paccountcode="+Accountcode;

                    string Url = "QidShowRpt.aspx?Id=10&SDate=" + curDate.ToString("dd/MM/yyyy") + "&EDate=" + curDate1.ToString("dd/MM/yyyy") + "&BranchId=" + BranchId.ToString() + "&CostId=" + CostId.ToString() + "&AcounntId=" + AcounntId.ToString() + "&Paccountname=" + AccountName + "&paccountcode=" + Accountcode;


                    // string Ulr = "~/Admin/QidShowRpt.aspx?Id=10&SDate=" + curDate.ToString("MM/dd/yyyy") + "&EDate=" + curDate1.ToString("MM/dd/yyyy") + "&BranchId=" + BranchId.ToString() + "&CostId=" + CostId.ToString() + "&AcounntId=" + AcounntId.ToString();
                    string link = "window.open('"+Url+"','_blank');";
                    ScriptManager.RegisterStartupScript(this, typeof(string), "openModal", link, true);
                    //Response.Redirect(Url);
                }
            }
        }

        protected void AddQidDetLinkButton_Click(object sender, EventArgs e)
        {
            //if (ListViewQid.InsertItemPosition != InsertItemPosition.FirstItem)
            //{
            //    ListViewQid.InsertItemPosition = InsertItemPosition.FirstItem;

            //}
            
        }
       
      
        protected void AddLinkButton_Command(object sender, CommandEventArgs e)
        {

        }

       
        void TotalSum()
        {
            double TotalFromValue = 0;
            double TotalToValue = 0;

            if (lv.Items.Count > 0)
            {
                for (int i = 0; i < lv.Items.Count; i++)
                {
                    //extract the TextBox values
                    Label box1 = (Label)lv.Items[i].FindControl("FromValueLabel");
                    Label box2 = (Label)lv.Items[i].FindControl("ToValueLabel");


                    if (box1.Text != "")
                    {

                        TotalFromValue = TotalFromValue + Double.Parse(box1.Text);
                    }
                    if (box2.Text != "")
                    {

                        TotalToValue = TotalToValue + Double.Parse(box2.Text);
                    }
                }
                TotalCredit.InnerText = TotalFromValue.ToString();
                TotalDebit.InnerText = TotalToValue.ToString();
            }
            BOL.Accounts DA = new BOL.Accounts();
            DAL.ERPAssetDataSet.AccountsDataTable dt = new DAL.ERPAssetDataSet.AccountsDataTable();
            long AcounntId = 0;
            long  OrgId = 0;
            long BranchId = 0;
            long CostId = 0;
            if (AccountDropDownList.SelectedValue.ToString() != "0")
            {
                AcounntId = long.Parse(AccountDropDownList.SelectedValue.ToString());

                if (txtOrgId.Text != "")
                {
                    OrgId = long.Parse(txtOrgId.Text);
                }
                if (BranchDropDownList.SelectedValue != null)
                {
                    BranchId = long.Parse(BranchDropDownList.SelectedValue.ToString());
                }
                if (CostDropDownList.SelectedValue != null)
                {
                    CostId = long.Parse(CostDropDownList.SelectedValue.ToString());
                }
                string StartDate = StartDateTextBox.Text;
                string EndDate = EndDateTextBox.Text;

                dt = DA.Read("1", AcounntId, OrgId, BranchId, 0, CostId, StartDate, EndDate,"", "","");
                if (dt.Rows.Count > 0)
                {
                    DataRow UserRow = dt.Rows[0];

                    double TotalBeforefromvalue = double.Parse(UserRow["TotalBeforefromvalue"].ToString());
                    double TotalBeforetovalue = double.Parse(UserRow["TotalBeforetovalue"].ToString());
                    double TotalBalanceBefore = TotalBeforefromvalue-TotalBeforetovalue ;
                    double TotalBalance = (TotalFromValue-TotalToValue  ) + TotalBalanceBefore;

                    txtTotalBalanceBefore.InnerText = TotalBalanceBefore.ToString();
                    txtTotalBalance.InnerText = TotalBalance.ToString();
                }
            }
        }


        protected void PrintButton_Click(object sender, EventArgs e)
        {

        }

       

        
        //protected void btnDetails_Command(object sender, CommandEventArgs e)
        //{
          

        //}
    }
}