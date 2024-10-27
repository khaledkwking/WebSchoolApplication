using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectsManagements.Controls.Budget
{
    public partial class ReceiptsBoxRpt : System.Web.UI.UserControl
    {
        string ImagePath = System.Configuration.ConfigurationManager.AppSettings["ProjectsPath"];
        string Accessing, Adding, Updating, Deleting, Importing;

        protected void SearchLinkButton_Click(object sender, EventArgs e)
        {
            QidDs.Select();
            QidDs.DataBind();
            ReportViewer1.LocalReport.Refresh();
            ReportViewer1.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack )
            {
                //if (Request.QueryString["SDate"] != null)
                //{
                //    txtSDate.Text = Request.QueryString["SDate"].ToString();
                //}
                //if (Request.QueryString["EDate"] != null)
                //{
                //    txtEDate.Text = Request.QueryString["EDate"].ToString();
                //}
                //QidDs.Select();

                if (Request.QueryString["Id"] != null)
                {
                    switch (Request.QueryString["Id"].ToString())
                    {
                        case "1":
                            ReportViewer1.LocalReport.ReportPath = @"Reports_Rdl\QidRpt.rdlc";
                            break;
                        case "2":
                            ReportViewer1.LocalReport.ReportPath = @"Reports_Rdl\QidOutRpt.rdlc";
                            break;
                        case "3":
                            ReportViewer1.LocalReport.ReportPath = @"Reports_Rdl\QidInRpt.rdlc";
                            break;
                    }
                }
                SetupDs.Select();
                QidDs.Select();
                ReportViewer1.LocalReport.Refresh();
                ReportViewer1.DataBind();
            }
            // to get the previus Link 
            string previousUrl;

            if (Context.Request.UrlReferrer != null)
            {
                previousUrl = Context.Request.UrlReferrer.ToString();
            }
            else
            {
                previousUrl = "Main.aspx";
            }

            // to get all user Prvlages on page 
            //int USERID = int.Parse(Session["UserID"].ToString());


            //BOL.UsersPages DA = new BOL.UsersPages();
            //DAL.UsersPages.UsersPagesDataTable dt = new DAL.UsersPages.UsersPagesDataTable();

            //dt = DA.Read("1", USERID, 8, "");
            //if (dt.Rows.Count > 0)
            //{
            //    DataRow UserRow = dt.Rows[0];
            //    Accessing = UserRow["Accessing"].ToString();
            //    Adding = UserRow["Adding"].ToString();
            //    Updating = UserRow["Updating"].ToString();
            //    Deleting = UserRow["Deleting"].ToString();
            //    Importing = UserRow["Importing"].ToString();

            //    if (Accessing != "True") { Response.Redirect("~/NoAccess.aspx?URL=" + previousUrl); }
            //    // checking the insert privlage 
            //    //if (Adding != "True") { NewRecord.Visible = false; }
            //}

            //// to get all user Prvlages on Contracts based
            //int ContractID = 0;
            //if (Request.QueryString["CID"] != null)
            //{
            //    //ContractID = int.Parse(Request.QueryString["CID"].ToString());
            //    //CustomersDownList.SelectedValue = ContractID.ToString ();
              
            //}


           

            // checking the access  
            //if (Accessing != "True") { Response.Redirect("~/NoAccess.aspx?URL=" + previousUrl); }

            //if (Importing != "True") { ImportDataLink.Visible = false; ImportLinkButton.Visible = false; }
            //if (!IsPostBack)
            //{
            //    BOL.ProjectsContracts PDA = new BOL.ProjectsContracts();
            //    DAL.ProjectsContracts.ProjectsContractsDataTable Pdt = new DAL.ProjectsContracts.ProjectsContractsDataTable();

            //    Pdt = PDA.Read("1", ContractID, 0, 0, 0, 0, 0, "", "", 0, 0, "");
            //    if (Pdt.Rows.Count > 0)
            //    {
            //        //Overwriting the Main Permissions 
            //        DataRow UserRowP = Pdt.Rows[0];
            //        string ContractName = "";

            //        if (Session["SiteLanguage"].ToString() == "EnglishTheme")
            //        {
            //            ContractName = UserRowP["ContractNameEn"].ToString();
            //        }
            //        else
            //        {
            //            ContractName = UserRowP["ContractName"].ToString();
            //        }

            //        lblContractTitle.Text = ContractName;
            //    }

                ViewState["RefUrl"] = Request.UrlReferrer.ToString(); // save call page

           // }

        }

            
     
        protected void CancelButtonBack_Click(object sender, EventArgs e)
        {
            object refUrl = ViewState["RefUrl"];
            if (refUrl != null)
                Response.Redirect((string)refUrl);
        }
    }
}