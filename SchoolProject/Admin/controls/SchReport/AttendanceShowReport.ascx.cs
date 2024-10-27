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

    public partial class AttendanceShowReport : System.Web.UI.UserControl
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
                            DataView v10 = (DataView)LastInvoicesGroupAttendanceDs.Select();
                            DataView v11 = (DataView)SetupDs.Select();

                            ReportViewer1.LocalReport.DataSources[1].DataSourceId = "SetupDs";
                            ReportViewer1.LocalReport.DataSources[0].DataSourceId = "LastInvoicesGroupAttendanceDs";
                            ReportViewer1.LocalReport.ReportPath = @"Reports_Rdl\SchStudentsGroupAttendanceRpt.rdlc";
                            ReportParameter[] parameters5 = new ReportParameter[3];
                            parameters5[0] = new ReportParameter("FromDate", Session["SDate"].ToString());
                            parameters5[1] = new ReportParameter("ToDate", Session["EDate"].ToString());
                            parameters5[2] = new ReportParameter("PeriodName", Session["PeriodName"].ToString());
                            
                            ReportViewer1.LocalReport.SetParameters(parameters5);
                            break;
                       
                        case "5":
                            break;



                       

                    }

                }


                ReportViewer1.LocalReport.Refresh();
                ReportViewer1.DataBind();
            }
        }





    }
    
}