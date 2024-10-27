using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSchool.Controls.Account
{
    public partial class QidShow : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                //if (Request.QueryString["SDate"] != null)
                //{
                //    txtSDate.Text = Request.QueryString["SDate"].ToString();
                //}
                //if (Request.QueryString["EDate"] != null)
                //{
                //    txtEDate.Text = Request.QueryString["EDate"].ToString();
                //}
                ReportViewer1.Visible = true;
                SetupDs.Select();
                DataView v = (DataView)QidDs.Select();
                Double TotalAmount = 0;
                string TotDesc = "";
                ReportParameter[] parameters = new ReportParameter[1];
                if (v.Count > 0)
                {
                    TotalAmount = Double.Parse(v[0]["TotalFromValue"].ToString());
                    TotDesc = GLibrary.FigureInWordsNumType(TotalAmount, 1);
                   
                    parameters[0] = new ReportParameter("TotDesc", TotDesc);
                    //parameters[1] = new ReportParameter("ToDate", EndDateTextBox.Text);
                   
                }
                if (Request.QueryString["Id"] != null)
                {
                    switch (Request.QueryString["Id"].ToString())
                    {
                        case "1":
                            ReportViewer1.LocalReport.ReportPath = @"Reports_Rdl\QidRpt.rdlc";
                            break;
                        case "6":
                            QidDs.SelectParameters["Detcode"].DefaultValue = "1";
                            QidDs.Select();
                            ReportViewer1.LocalReport.ReportPath = @"Reports_Rdl\QidOutRpt.rdlc";
                            ReportViewer1.LocalReport.SetParameters(parameters);
                            break;
                        case "7":
                            QidDs.SelectParameters["Detcode"].DefaultValue = "1";
                            QidDs.Select();
                            ReportViewer1.LocalReport.ReportPath = @"Reports_Rdl\QidInRpt.rdlc";
                            ReportViewer1.LocalReport.SetParameters(parameters);
                            break;
                        case "10":
                            

                            QidStatmentDs.SelectParameters["BranchId"].DefaultValue = Request.QueryString["BranchId"].ToString ();
                            QidStatmentDs.SelectParameters["CostId"].DefaultValue = Request.QueryString["CostId"].ToString();
                            QidStatmentDs.SelectParameters["ParentAccountId"].DefaultValue = Request.QueryString["AcounntId"].ToString();

                            QidStatmentDs.SelectParameters["StartDate"].DefaultValue = Request.QueryString["SDate"].ToString();
                            QidStatmentDs.SelectParameters["EndDate"].DefaultValue = Request.QueryString["EDate"].ToString();

                            //Response.Redirect("QidShow.aspx?Id=10&SDate=" + curDate.ToString("MM/dd/yyyy") + "&EDate=" + curDate1.ToString("MM/dd/yyyy") + "&BranchId" + BranchId.ToString() + "&CostId=" + CostId.ToString());

                            //DataView v1 = (DataView) QidStatmentDs.Select();
                            //v1.Sort = "qidDate";
                            
                            ReportViewer1.LocalReport.DataSources[0].DataSourceId = "QidStatmentDs";
                            ReportViewer1.LocalReport.EnableExternalImages = true;

                            ReportParameter[] parameters1 = new ReportParameter[4];
                            ReportViewer1.LocalReport.ReportPath = @"Reports_Rdl\StatementSheet.rdlc";
                            parameters1[0] = new ReportParameter("SDate", Request.QueryString["SDate"].ToString());
                            parameters1[1] = new ReportParameter("EDate", Request.QueryString["EDate"].ToString());
                            parameters1[2] = new ReportParameter("Paccountname", Request.QueryString["Paccountname"].ToString());
                            parameters1[3] = new ReportParameter("Paccountcode", Request.QueryString["paccountcode"].ToString());
                            ReportViewer1.LocalReport.SetParameters(parameters1);
                            break;
                        case "11":

                            //if (Request.QueryString["AcounntId"].ToString() == "0")
                            //{

                            //}
                            AccountsDs.SelectParameters["BranchId"].DefaultValue = Request.QueryString["BranchId"].ToString();
                            AccountsDs.SelectParameters["CostId"].DefaultValue = Request.QueryString["CostId"].ToString();
                            AccountsDs.SelectParameters["ParentAccountId"].DefaultValue = Request.QueryString["AcounntId"].ToString();

                            AccountsDs.SelectParameters["StartDate"].DefaultValue = Request.QueryString["SDate"].ToString();
                            AccountsDs.SelectParameters["EndDate"].DefaultValue = Request.QueryString["EDate"].ToString();

                            //Response.Redirect("QidShow.aspx?Id=10&SDate=" + curDate.ToString("MM/dd/yyyy") + "&EDate=" + curDate1.ToString("MM/dd/yyyy") + "&BranchId" + BranchId.ToString() + "&CostId=" + CostId.ToString());

                            //DataView v2 = (DataView)AccountsDs.Select();
                            ReportViewer1.LocalReport.DataSources[0].DataSourceId = "AccountsDs";

                            ReportParameter[] parameters2 = new ReportParameter[2];
                            ReportViewer1.LocalReport.ReportPath = @"Reports_Rdl\trialbalance.rdlc";
                            parameters2[0] = new ReportParameter("SDate", Request.QueryString["SDate"].ToString());
                            parameters2[1] = new ReportParameter("EDate", Request.QueryString["EDate"].ToString());
                 
                            ReportViewer1.LocalReport.SetParameters(parameters2);
                            break;
                        case "12":
                           
                            txtMainPurchaseaccid.Text = Messages.MainPurchaseaccid.ToString();
                            txtPaymentsaccid.Text = Messages.Paymentsaccid.ToString();
                            txtMainSalesAccid.Text = Messages.MainSalesAccid.ToString();

                            AccountsDs.SelectParameters["BranchId"].DefaultValue = Request.QueryString["BranchId"].ToString();
                            AccountsDs.SelectParameters["CostId"].DefaultValue = Request.QueryString["CostId"].ToString();
                            AccountsDs.SelectParameters["ParentAccountId"].DefaultValue = Request.QueryString["AcounntId"].ToString();

                            AccountsDs.SelectParameters["StartDate"].DefaultValue = Request.QueryString["SDate"].ToString();
                            AccountsDs.SelectParameters["EndDate"].DefaultValue = Request.QueryString["EDate"].ToString();

                            //Response.Redirect("QidShow.aspx?Id=10&SDate=" + curDate.ToString("MM/dd/yyyy") + "&EDate=" + curDate1.ToString("MM/dd/yyyy") + "&BranchId" + BranchId.ToString() + "&CostId=" + CostId.ToString());

                            //DataView v2 = (DataView)AccountsDs.Select();
                            ReportViewer1.LocalReport.DataSources[0].DataSourceId = "AccountsIncomeStatementDs";

                            ReportParameter[] parameters3 = new ReportParameter[2];
                            ReportViewer1.LocalReport.ReportPath = @"Reports_Rdl\IncomeStatment.rdlc";
                            parameters3[0] = new ReportParameter("SDate", Request.QueryString["SDate"].ToString());
                            parameters3[1] = new ReportParameter("EDate", Request.QueryString["EDate"].ToString());

                            ReportViewer1.LocalReport.SetParameters(parameters3);
                            break;
                        case "13":

                            txtMainPurchaseaccid.Text = Messages.MainPurchaseaccid.ToString();
                            txtPaymentsaccid.Text = Messages.Paymentsaccid.ToString();
                            txtMainSalesAccid.Text = Messages.MainSalesAccid.ToString();

                            AccountsDs.SelectParameters["BranchId"].DefaultValue = Request.QueryString["BranchId"].ToString();
                            AccountsDs.SelectParameters["CostId"].DefaultValue = Request.QueryString["CostId"].ToString();
                            AccountsDs.SelectParameters["ParentAccountId"].DefaultValue = Request.QueryString["AcounntId"].ToString();

                            AccountsDs.SelectParameters["StartDate"].DefaultValue = Request.QueryString["SDate"].ToString();
                            AccountsDs.SelectParameters["EndDate"].DefaultValue = Request.QueryString["EDate"].ToString();

                            //Response.Redirect("QidShow.aspx?Id=10&SDate=" + curDate.ToString("MM/dd/yyyy") + "&EDate=" + curDate1.ToString("MM/dd/yyyy") + "&BranchId" + BranchId.ToString() + "&CostId=" + CostId.ToString());

                            //DataView v2 = (DataView)AccountsDs.Select();
                            ReportViewer1.LocalReport.DataSources[0].DataSourceId = "AccountsIncomeStatementDs";

                            ReportParameter[] parameters4 = new ReportParameter[2];
                            ReportViewer1.LocalReport.ReportPath = @"Reports_Rdl\BudgetAccounts.rdlc";
                            parameters4[0] = new ReportParameter("SDate", Request.QueryString["SDate"].ToString());
                            parameters4[1] = new ReportParameter("EDate", Request.QueryString["EDate"].ToString());

                            ReportViewer1.LocalReport.SetParameters(parameters4);
                            break;

                    }

                }
             
               
                ReportViewer1.LocalReport.Refresh();
                ReportViewer1.DataBind();
            }
        }
    }
}