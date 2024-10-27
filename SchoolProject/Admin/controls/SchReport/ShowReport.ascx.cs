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

    public partial class ShowReport : System.Web.UI.UserControl
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
                           
                            DataView v = (DataView)InvDetailsDs.Select();
                            DataView v1 = (DataView)InvPaymentDatesDs.Select();
                            DataView v2 = (DataView)SetupDs.Select();
                           

                            ReportViewer1.LocalReport.DataSources[0].DataSourceId = "InvDetailsDs";
                            ReportViewer1.LocalReport.DataSources[1].DataSourceId = "SetupDs";
                            ReportViewer1.LocalReport.DataSources[2].DataSourceId = "InvPaymentDatesDs";
                            if (Request.QueryString["InvType"] != null)
                            {
                                switch (Request.QueryString["InvType"].ToString())
                                {
                                    case "1": //invdual invoice

                                        ReportViewer1.LocalReport.ReportPath = @"Reports_Rdl\InvoiceRpt.rdlc";
                                        break;
                                    case "2": //group invoice 
                                        ReportViewer1.LocalReport.ReportPath = @"Reports_Rdl\InvoiceGroupRpt.rdlc";
                                        break;
                                }
                            }
                            break;
                        case "2":
                            long ReciteId = 0;
                            if  (Request.QueryString["ReciteId"] != null)
                             {
                                ReciteId = long.Parse(Request.QueryString["ReciteId"].ToString ());
                            }
                            InvPaymentsDs.SelectParameters["ReciteId"].DefaultValue = ReciteId.ToString ();
                           
                            DataView v11 = (DataView)InvPaymentsDs.Select();
                            DataView v222 = (DataView)SetupDs.Select();
                            string AmountDesc = "";
                            if (v11.Count > 0)
                            {
                                Double Amount = Double.Parse(v11[0]["PaymentValue"].ToString());
                                AmountDesc = GLibrary.FigureInWordsNumType(Amount, 1);
                                
                            }
                            ReportParameter[] parameters1 = new ReportParameter[1];
                            parameters1[0] = new ReportParameter("AmountDesc", AmountDesc);


                            ReportViewer1.LocalReport.DataSources[1].DataSourceId = "SetupDs";
                            ReportViewer1.LocalReport.DataSources[0].DataSourceId = "InvPaymentsDs";
                            ReportViewer1.LocalReport.ReportPath = @"Reports_Rdl\InvoiceRecRpt.rdlc";
                            ReportViewer1.LocalReport.SetParameters(parameters1);
                           
                            break;
                        case "3":
                            DataView v4 = (DataView)WorkOrdersDs.Select();
                            DataView v5 = (DataView)SetupDs.Select();
                        
                            ReportViewer1.LocalReport.DataSources[1].DataSourceId = "SetupDs";
                            ReportViewer1.LocalReport.DataSources[0].DataSourceId = "WorkOrdersDs";
                            ReportViewer1.LocalReport.ReportPath = @"Reports_Rdl\WorkOrderRpt.rdlc";
                        

                          
                            break;
                        case "4":
                            DataView v6 = (DataView)WorkOrdersDs.Select();
                            DataView v7 = (DataView)SetupDs.Select();

                            ReportViewer1.LocalReport.DataSources[1].DataSourceId = "SetupDs";
                            ReportViewer1.LocalReport.DataSources[0].DataSourceId = "WorkOrdersDs";
                            ReportViewer1.LocalReport.ReportPath = @"Reports_Rdl\TeacherWorkCalculateRpt.rdlc";

                            break;
                        case "5":


                            DataView v8 = (DataView)InvoicesDs.Select();
                            DataView v9 = (DataView)SetupDs.Select();

                            ReportViewer1.LocalReport.DataSources[1].DataSourceId = "SetupDs";
                            ReportViewer1.LocalReport.DataSources[0].DataSourceId = "InvoicesDs";
                            ReportViewer1.LocalReport.ReportPath = @"Reports_Rdl\InvoiceListRpt.rdlc";
                            ReportParameter[] parameters2 = new ReportParameter[2];
                            parameters2[0] = new ReportParameter("FromDate", Session["SDate"].ToString());
                            parameters2[1] = new ReportParameter("ToDate", Session["EDate"].ToString());
                            break;
                        

                    }

                }


                ReportViewer1.LocalReport.Refresh();
                ReportViewer1.DataBind();
            }
        }





    }
    
}