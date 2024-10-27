using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.ComponentModel;
using System.Data;
using System.Drawing;

using System.Threading.Tasks;
using System.Xml;
using System.Net;
using System.IO;
using System.Security.Cryptography.X509Certificates;
using System.Text;

using System.Threading;
public partial class Admin_EmpList : System.Web.UI.Page
{
    private Boolean _refreshState;
    private Boolean _isRefresh;

    public static void OverrideCertificateValidation()
    {
        //ServicePointManager.ServerCertificateValidationCallback = new RemoteCertificateValidationCallback(RemoteCertValidate);
    }

    private static bool RemoteCertValidate(object sender, X509Certificate cert, X509Chain chain, System.Net.Security.SslPolicyErrors error)
    {
        return true;
    }

    //protected override void LoadViewState(object savedState)
    //{
    //    object[] AllStates = (object[])savedState;
    //    base.LoadViewState(AllStates[0]);
    //    _refreshState = bool.Parse(AllStates[1].ToString());
    //    _isRefresh = _refreshState == bool.Parse(Session["__ISREFRESH"].ToString());
    //}

    //protected override object SaveViewState()
    //{
    //    Session["__ISREFRESH"] = _refreshState;
    //    object[] AllStates = new object[2];
    //    AllStates[0] = base.SaveViewState();
    //    AllStates[1] = !(_refreshState);
    //    return AllStates;
    //}
    private void GetData()
    {
        //txtCommLicDesc.Text = "";
        //if (txtCommNo.Text != "" && txtCommYear.Text != "")
        //{
        //    string CurNo = GetCompleteNo(txtCommNo.Text);
        //    string CurYear = txtCommYear.Text;
        //    string CurType = ddlComType.SelectedValue.ToString();
        //    txtCommLicDesc.Text = txtCommYear.Text + "/" + txtCommNo.Text + "/" + ddlComType.Text;
        //    //int SearchType = 0;
        //    //if (ddlComSearchType.SelectedValue != null) // نوع الشركة (اشخاص - مساهمة - فردي)
        //    //{
        //    //    SearchType = int.Parse(ddlComSearchType.SelectedValue.ToString()); //نوع التراخيص
        //    //}
        //    string AllNo = "";
        //    AllNo = CurYear + CurNo + CurType; // تكوين الرقم
        //}
        ObjectDataSourceEmpView.Select();
        DataView v = (DataView)ObjectDataSourceEmpView.Select();
        if (v.Count > 0)
        {

            //cmdsave.Enabled = true;
            //BtnPrint.Enabled = true;
            //DelCmd.Enabled = true ;
        }

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        

        if (!this.IsPostBack)
        {
            cmbBranches.DataBind();
            cmbDepts.DataBind();
            cmbEmpStatus.DataBind();
            cmbBranches.DataBind();
            cmbJob.DataBind();
            CmbEmpDept.DataBind();
            cmbBranches.Items.Insert(0, new ListItem("  ", ""));
            cmbDepts.Items.Insert(0, new ListItem("  ", ""));
            cmbEmpStatus.Items.Insert(0, new ListItem("  ", ""));
            cmbBranches.Items.Insert(0, new ListItem("  ", ""));
            cmbJob.Items.Insert(0, new ListItem("  ", ""));
            CmbEmpDept.Items.Insert(0, new ListItem("  ", ""));

            HttpCookie cookieOrgId;
            cookieOrgId = HttpContext.Current.Request.Cookies.Get("OrgId");
            if (cookieOrgId != null)
            {
                txtOrgId.Text = cookieOrgId.Value.ToString();
            }

            if (Request.QueryString["InsTypeId"] != null)
            {
                //txtInTypeId.Text = Request.QueryString["InsTypeId"].ToString();
                DataView v = (DataView)ObjectDataSourceEmpView.Select();
                if (v.Count > 0)
                {
                    //LblTitle.Text = v.Table.Rows[0]["TypeDesc"].ToString();

                }

                //this.Response.Redirect("CompLicAdd.aspx?InTypeId=" + txtInTypeId.Text);
            }

            if (Request.QueryString["AppId"] != null)
            {
                //txtCommId.Text = Request.QueryString["AppId"].ToString();
                GetData();
                //CmdAdd.Enabled = false;

            }

            else
            {
                //RadPickerInsIssueDate.SelectedDate = DateTime.Today;
                //RadPickerInsEndDate.SelectedDate= DateTime.Today;
            }

            

        }
    }
    protected void BtnSearch_Click(object sender, EventArgs e)
    {
        GetData();
    }
   
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        HttpCookie ActionIdIddata = new HttpCookie("ActionId");

        ActionIdIddata.Expires = DateTime.Now.AddHours(1);
        Response.Cookies.Add(ActionIdIddata);

        if ((e.CommandName == "SEdit"))
        {
            //ActionIdIddata.Value = "Update";
            int index = Convert.ToInt32(e.CommandArgument);
            // Retrieve the row that contains the button clicked 
            // by the user from the Rows collection.
            GridViewRow row = GridView1.Rows[index];
            string Id = row.Cells[0].Text;

            Response.Redirect("~/admin/EmpAddData.Aspx?" + "Id=" + System.Web.HttpUtility.UrlEncode(Id)); 

            //System.Web.HttpUtility.UrlEncode(tbPar2.Text));
            //this.Response.Redirect("EmpAddData.aspx?Id=" + Id,true);
            //window.location=testapp://site.com?param1=value


            //string url = "EmpAddData.aspx?Id="+Id ;
            //StringBuilder sb = new StringBuilder();
            //sb.Append("<script type = 'text/javascript'>");
            //sb.Append("window.open('");
            //sb.Append(url);
            //sb.Append("','_self');");
            //sb.Append("</script>");
            //ClientScript.RegisterStartupScript(this.GetType(),"script", sb.ToString());

            //Label lbl = new Label();
            //lbl.Text = sb.ToString();
            //this.Controls.Add(lbl);
        }
        //if ((e.CommandName == "Renew"))
        //{
        //    ActionIdIddata.Value = "Renew";
        //    int index = Convert.ToInt32(e.CommandArgument);
        //    // Retrieve the row that contains the button clicked 
        //    // by the user from the Rows collection.
        //    GridViewRow row = GridView1.Rows[index];
        //    string Id = row.Cells[0].Text;
        //    this.Response.Redirect("CompLicAdd.aspx?CommId=" + Id + "&InsTypeId=" + txtInTypeId.Text);

        //}
    
        if ((e.CommandName == "Print"))
        {
            ActionIdIddata.Value = "Print";
            int index = Convert.ToInt32(e.CommandArgument);
            // Retrieve the row that contains the button clicked 
            // by the user from the Rows collection.
            GridViewRow row = GridView1.Rows[index];
            string Id = row.Cells[0].Text;
            this.Response.Redirect("CompLicAdd.aspx?CommId=" + Id + "&InsTypeId=" + txtInTypeId.Text);

        }
        
    }

    protected void CmdAdd_Click(object sender, EventArgs e)
    {
        try
        {


            if ((!_isRefresh))
            {
                this.Response.Redirect("~/admin/EmpAddData.aspx");
                //If (Not Me.IsPostBack) Then
                //txtAdaraId.Text = "1";
                //HttpCookie cookieadminuser;
                //cookieadminuser = HttpContext.Current.Request.Cookies.Get("ID");
                //if (cookieadminuser != null)
                //{

                //    txtid.Text = cookieadminuser.Value.ToString();
                //}
                //txtEnterDate.Text = DateTime.Today.ToShortDateString();


                // Me.Response.Redirect("~/admin/CompaniesOfferApplicationsList.aspx")
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);

        }
    }
    protected void SearchCmd_Click(object sender, EventArgs e)
    {
        int i;
        i = 0;
    }
    protected void btnPrint_Click(object sender, EventArgs e)
    {

        //CrystalDecisions.Web.CrystalReportSource RptSource= new CrystalDecisions.Web.CrystalReportSource();
        //RptSource.Report.FileName = "~/Reports/PerEmpDataRpt.rpt";
        //CrystalDecisions.Web.DataSourceRef DataRef =new CrystalDecisions.Web.DataSourceRef ();
        //DataRef.DataSourceID = "ObjectDataSourceEmpView";
      
        //DataRef.ReportName = "PerEmpDataRpt";
        //DataRef.TableName = "EmpView";

        //RptSource.Report.DataSources.Add(DataRef);

        //CrystalReportSourceEmp.ReportDocument.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "HRReport");
       // Response.End();

        //MemoryStream oStream = (MemoryStream)CrystalReportSourceEmp.ReportDocument.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);

       // ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('files/11Report.pdf');popup.focus();", true);
        //try
        //{
            //CrystalReportSourceEmp.ReportDocument.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("files/12Report.pdf"));
    
            //MemoryStream oStream = (MemoryStream)CrystalReportSourceEmp.ReportDocument.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
            //Response.Clear();
            //Response.Buffer = true;
            //Response.ContentType = "application/PDF";
            //Response.BinaryWrite(oStream.ToArray());
            //Response.End();
            //var t = Task.Run(() => CrystalReportSourceEmp.ReportDocument.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("files/12Report.pdf")));
            ////for (int i = 0; i < 200; i++) { }
            //t.Wait();

            //string Curl = "https://docs.google.com/gview?embedded=true&url=" + Request.Url.GetLeftPart(UriPartial.Authority) + VirtualPathUtility.ToAbsolute("~/") + "admin/files/12Report.pdf";
           
            //// "http://62.150.104.8/HR/admin/files/11Report.pdf";


            //string FileName = Server.MapPath("files/12Report.pdf");
           
            ////CrystalReportSourceEmp.ReportDocument.Close();
            //ScriptManager.RegisterStartupScript(Page, this.GetType(), "clientScript", "<script language=javascript> refresh(); </script>", false);

            //while (!System.IO.File.Exists(FileName))
            //{
            //    System.Threading.Thread.Sleep(500);
            //} 

            //if (t.IsCompleted)
            //{
            //    this.Response.Redirect("test.aspx");
            //}
                   
            //Response.End();

          
            //this.Response.Redirect(Curl);
            //Curl = "window.location.replace('" + Curl + "');";
            //Response.Flush();
            //Response.End();
           

            //ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", Curl, true);

            //ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener11", Curl, true);
            //ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener11", "window.location.replace('files/11Report.pdf');", true);

            //this.Response.Redirect("~/Reports/ShowRpt.aspx?AppId=" + txtid.Text);
        //}
        //catch (Exception ex)
        //{

        //}
        //finally
        //{
        //   // HttpContext.Current.ApplicationInstance.CompleteRequest();
           
        //}
        
    }

  async Task MainAsync()
  {
    try
    {
      // Asynchronous implementation.
        
       
      await Task.Delay(50);
     
    }
    catch (Exception ex)
    {
      // Handle exceptions.
    }
  }

  //async void MyAsyncTest()
  //{
  //    var task = new Task(GiveMeTheResult);
  //    task.Start();
  //    "Wurde gestartet".Dump();
  //    var something = await task;
  //    something.Dump();
  //}
  //  string GiveMeTheResult()
  //  {
     
  //      Thread.Sleep(2000);
  //      return "Work Done";
  //  }
  
}