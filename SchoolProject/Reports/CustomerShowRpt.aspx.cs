using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Reports_CustomerShowRpt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            if (Request.QueryString["Id"] != null)
            {


                txtId.Text = Request.QueryString["Id"].ToString();
                DataView v1 = (DataView)ObjectDataSourceCustomerView.Select();

                ObjectDataSourceCustomerView.Select();


                //CrystalDecisions.Web.CrystalReportSource RptSource = new CrystalDecisions.Web.CrystalReportSource();
                //RptSource.Report.FileName = "~/Reports/PerEmpDataRpt.rpt";
                //CrystalDecisions.Web.DataSourceRef DataRef = new CrystalDecisions.Web.DataSourceRef();
                //DataRef.DataSourceID = "ObjectDataSourceEmpView";

                //DataRef.ReportName = "PerEmpDataRpt";
                //DataRef.TableName = "EmpView";

                //RptSource.Report.DataSources.Add(DataRef);

                ////CrystalReportSourceEmp.ReportDocument.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "HRReport");
                ////Response.End();
                //RptSource.ReportDocument .ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("files/VisitReport.pdf"));
                //MemoryStream oStream = (MemoryStream)CrystalReportSourceEmp.ReportDocument.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
                //CrystalReportSourceEmp.ReportDocument.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("files/VisitReport.pdf"));

            }

           
        }
    }
}