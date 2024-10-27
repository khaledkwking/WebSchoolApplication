using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace WebSchool.Admin.controls.SchReport
{

    public partial class InvoicesShowReport : System.Web.UI.UserControl
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

             

                //Double TotalAmount = 0;
                //string TotDesc = "";
                ReportParameter[] parameters = new ReportParameter[1];
                //if (v.Count > 0)
                //{
                //    TotalAmount = Double.Parse(v[0]["TotalFromValue"].ToString());
                //    TotDesc = GLibrary.FigureInWordsNumType(TotalAmount, 1);

                //    parameters[0] = new ReportParameter("TotDesc", TotDesc);
                //    //parameters[1] = new ReportParameter("ToDate", EndDateTextBox.Text);

                //}
               

                if (Request.QueryString["Id"] != null)
                {
                    switch (Request.QueryString["Id"].ToString())
                    {
                        case "1":
                            DataView v10 = (DataView)InvDetailsDs.Select();
                            DataView v11 = (DataView)SetupDs.Select();

                            ReportViewer1.LocalReport.DataSources[1].DataSourceId = "SetupDs";
                            ReportViewer1.LocalReport.DataSources[0].DataSourceId = "InvDetailsDs";
                            ReportViewer1.LocalReport.ReportPath = @"Reports_Rdl\WorkOrdersAllRpt.rdlc";
                            ReportParameter[] parameters5 = new ReportParameter[2];
                            parameters5[0] = new ReportParameter("FromDate", Session["SDate"].ToString());
                            parameters5[1] = new ReportParameter("ToDate", Session["EDate"].ToString());
                            ReportViewer1.LocalReport.SetParameters(parameters5);
                            break;
                        case "2":
                            if (Request.QueryString["Flag"] !=null)
                            {
                                CustomersCallsDs.SelectParameters["ActionCode"].DefaultValue = Request.QueryString["Flag"].ToString ();
                            }
                           

                            DataView v111 = (DataView)CustomersCallsDs.Select();
                            DataView v112 = (DataView)SetupDs.Select();

                            ReportViewer1.LocalReport.DataSources[1].DataSourceId = "SetupDs";
                            ReportViewer1.LocalReport.DataSources[0].DataSourceId = "CustomersCallsDs";
                            ReportViewer1.LocalReport.ReportPath = @"Reports_Rdl\CustomerCallsListRpt.rdlc";
                            ReportParameter[] parameters7 = new ReportParameter[2];
                            parameters7[0] = new ReportParameter("FromDate", Session["SDate"].ToString());
                            parameters7[1] = new ReportParameter("ToDate", Session["EDate"].ToString());
                            ReportViewer1.LocalReport.SetParameters(parameters7);
                            break;
                            
                          

                           
                        case "3":
                            DataView v8 = (DataView)InvoicesDs.Select();
                            DataView v9 = (DataView)SetupDs.Select();

                            ReportViewer1.LocalReport.DataSources[1].DataSourceId = "SetupDs";
                            ReportViewer1.LocalReport.DataSources[0].DataSourceId = "InvoicesDs";
                            ReportViewer1.LocalReport.ReportPath = @"Reports_Rdl\InvoiceCustomerListRpt.rdlc";
                            ReportParameter[] parameters2 = new ReportParameter[3];
                            parameters2[0] = new ReportParameter("FromDate", Session["SDate"].ToString());
                            parameters2[1] = new ReportParameter("ToDate", Session["EDate"].ToString());
                            parameters2[2] = new ReportParameter("Title", Session["Title"].ToString());


                            ReportViewer1.LocalReport.SetParameters(parameters2);
                            break;



                           
                        case "4":
                            //DataView v6 = (DataView)WorkOrdersDs.Select();
                            //DataView v7 = (DataView)SetupDs.Select();

                            //ReportViewer1.LocalReport.DataSources[1].DataSourceId = "SetupDs";
                            //ReportViewer1.LocalReport.DataSources[0].DataSourceId = "WorkOrdersDs";
                            //ReportViewer1.LocalReport.ReportPath = @"Reports_Rdl\TeacherWorkCalculateRpt.rdlc";

                            break;
                        case "5":


                            //DataView v18 = (DataView)InvoicesDs.Select();
                            //DataView v19 = (DataView)SetupDs.Select();

                            ReportViewer1.LocalReport.DataSources[1].DataSourceId = "SetupDs";
                            ReportViewer1.LocalReport.DataSources[0].DataSourceId = "InvoicesDs";
                            ReportViewer1.LocalReport.ReportPath = @"Reports_Rdl\InvoiceListRpt.rdlc";
                            ReportParameter[] parameters12 = new ReportParameter[3];
                            parameters12[0] = new ReportParameter("FromDate", Session["SDate"].ToString());
                            parameters12[1] = new ReportParameter("ToDate", Session["EDate"].ToString());
                            parameters12[2] = new ReportParameter("Title", Session["Title"].ToString());

                           
                            ReportViewer1.LocalReport.SetParameters(parameters12);
                            break;
                        case "6":


                            DataView v1 = (DataView)InvoicesDs.Select();
                            DataView v2 = (DataView)SetupDs.Select();
                            DataView v3 = (DataView)PaymentsDs.Select();
                            
                            ReportViewer1.LocalReport.DataSources[1].DataSourceId = "SetupDs";
                            ReportViewer1.LocalReport.DataSources[0].DataSourceId = "PaymentsDs";
                            ReportViewer1.LocalReport.ReportPath = @"Reports_Rdl\PaymentReciteListRpt.rdlc";
                            ReportParameter[] parameters3 = new ReportParameter[2];
                            parameters3[0] = new ReportParameter("FromDate", Session["SDate"].ToString());
                            parameters3[1] = new ReportParameter("ToDate", Session["EDate"].ToString());
                            ReportViewer1.LocalReport.SetParameters(parameters3);
                            break;

                        case "7":
                            if (Session["Action"] != null)
                            {

                                if (Session["Action"].ToString () == "4")
                                {

                                    InvPaymentsDateDs.SelectParameters["ActionCode"].DefaultValue = "4";
                                    //InvoicesPaymentDatesDS.SelectParameters["FinishFlag"].DefaultValue = "0";

                                }
                                else if (Session["Action"].ToString () == "1")
                                {

                                    InvPaymentsDateDs.SelectParameters["ActionCode"].DefaultValue = "1";
                                }
                            }
                            DataView v21 = (DataView)InvPaymentsDateDs.Select();
                            DataView v22= (DataView)SetupDs.Select();

                            ReportViewer1.LocalReport.DataSources[1].DataSourceId = "SetupDs";
                            ReportViewer1.LocalReport.DataSources[0].DataSourceId = "InvPaymentsDateDs";
                            ReportViewer1.LocalReport.ReportPath = @"Reports_Rdl\InvoicePaymentDatestRpt.rdlc";
                            ReportParameter[] parameters21 = new ReportParameter[2];
                            parameters21[0] = new ReportParameter("FromDate", Session["SDate"].ToString());
                            parameters21[1] = new ReportParameter("ToDate", Session["EDate"].ToString());
                            ReportViewer1.LocalReport.SetParameters(parameters21);
                            break;


                        case "13":

                            //txtMainPurchaseaccid.Text = Messages.MainPurchaseaccid.ToString();
                            //txtPaymentsaccid.Text = Messages.Paymentsaccid.ToString();
                            //txtMainSalesAccid.Text = Messages.MainSalesAccid.ToString();

                            //AccountsDs.SelectParameters["BranchId"].DefaultValue = Request.QueryString["BranchId"].ToString();
                            //AccountsDs.SelectParameters["CostId"].DefaultValue = Request.QueryString["CostId"].ToString();
                            //AccountsDs.SelectParameters["ParentAccountId"].DefaultValue = Request.QueryString["AcounntId"].ToString();

                            //AccountsDs.SelectParameters["StartDate"].DefaultValue = Request.QueryString["SDate"].ToString();
                            //AccountsDs.SelectParameters["EndDate"].DefaultValue = Request.QueryString["EDate"].ToString();

                            ////Response.Redirect("QidShow.aspx?Id=10&SDate=" + curDate.ToString("MM/dd/yyyy") + "&EDate=" + curDate1.ToString("MM/dd/yyyy") + "&BranchId" + BranchId.ToString() + "&CostId=" + CostId.ToString());

                            ////DataView v2 = (DataView)AccountsDs.Select();
                            //ReportViewer1.LocalReport.DataSources[0].DataSourceId = "AccountsIncomeStatementDs";

                            //ReportParameter[] parameters4 = new ReportParameter[2];
                            //ReportViewer1.LocalReport.ReportPath = @"Reports_Rdl\BudgetAccounts.rdlc";
                            //parameters4[0] = new ReportParameter("SDate", Request.QueryString["SDate"].ToString());
                            //parameters4[1] = new ReportParameter("EDate", Request.QueryString["EDate"].ToString());

                            //ReportViewer1.LocalReport.SetParameters(parameters4);
                            break;

                    }

                }


                ReportViewer1.LocalReport.Refresh();
                ReportViewer1.DataBind();
            }
        }





    }
    
}