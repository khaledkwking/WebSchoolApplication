using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CrystalDecisions.Shared;
using System.Threading.Tasks;
using System.IO;
public partial class Admin_CustomerAddData : System.Web.UI.Page
{
    private Boolean _refreshState;
    private Boolean _isRefresh;

   
    
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!this.IsPostBack)
        {
            CmbEmpGender.DataBind();
            cmbRelgion.DataBind();
            cmbEducation.DataBind();
            CmbEngJob.DataBind();
            CmbJob.DataBind();
            DropDownListApplicationTypes.DataBind();

            CmbEmpNat.DataBind();
            //CmbEmpBranch.DataBind();
            //cmbDeptsNew.DataBind();

            CmbEmpGender.Items.Insert(0, new ListItem("  ", ""));
            cmbRelgion.Items.Insert(0, new ListItem("  ", ""));
            cmbEducation.Items.Insert(0, new ListItem("  ", ""));
            CmbEngJob.Items.Insert(0, new ListItem("  ", ""));
            CmbJob.Items.Insert(0, new ListItem("  ", ""));
            DropDownListApplicationTypes.Items.Insert(0, new ListItem("  ", ""));

            CmbEmpNat.Items.Insert(0, new ListItem("  ", ""));
            //CmbEmpBranch.Items.Insert(0, new ListItem("  ", ""));
            //cmbDeptsNew.Items.Insert(0, new ListItem("  ", ""));

            HttpCookie cookieOrgId;
            cookieOrgId = HttpContext.Current.Request.Cookies.Get("OrgId");
            if (cookieOrgId != null)
            {
                txtOrgId.Text = cookieOrgId.Value.ToString();
            }
            if (Request.QueryString["Id"] != null)
            {
                

                txtid.Text = Request.QueryString["Id"].ToString();
                GetData();
                CmdAdd.Enabled = true;
                //EmpSaveBtn.Enabled = true;
                //cmdsave.Enabled = true;
                //DelCmd.Enabled = true;
                txtEditFlag.Text = "1";
                //DataView v = (DataView)ObjectDataSourceEmps.Select();
                //try
                //{
                //    //If Not (IsNothing(v)) Then Ali Hint this code to check if the object in null or noo
                //    if (v.Count > 0)
                //    {
                //        lblName.Text = v.Table.Rows[0]["EmpName"].ToString();
                //        string t = v.Table.Rows[0]["EmpID"].ToString();
                //        DateTime curEnterDate = DateTime.Parse(v.Table.Rows[0]["EnterDate"].ToString());
                //        //EmpDInSchool.Text = "Emp" + t + curEnterDate.Day.ToString() + curEnterDate.Month.ToString() + curEnterDate.Year.ToString();
                //        //lblEnterDate.Text = curEnterDate.ToShortDateString();

                //        //if (v.Table.Rows[0]["EmpPic"] != DBNull.Value)
                //        //{
                //        //    EmpPhoto.ImageUrl = v.Table.Rows[0]["EmpPic"].ToString();
                //        //}
                //    }
                //}
                //catch (Exception ex)
                //{
                //    Response.Write(ex.Message);
                //    //MsgBox(ex.Message);
                //}
            }
            else
            {
                newdata();
                //lblEnterDate.Text = DateTime.Today.ToShortDateString();
                CmdAdd.Enabled = true;
                //EmpSaveBtn.Enabled = true;
                //cmdsave.Enabled = true;
                //DelCmd.Enabled = false;
                //RadioBtnAgreeFlag.Items[0].Selected = true;
                //showtabs();
                //ChkOfferFlag.Checked = false;
            }
            //DelCmd.Attributes["onclick"] = "javascript:return " + "confirm(' هل تريد حقا  الغاء  ') ";
        }
    }
    private void UpdateNames()
    {
        string FullName = "";
        string EngFullName = "";
        if (txtEmpFulName.Text != "")
        {
            string[] words = txtEmpFulName.Text.Split(' ');
            if (words.Length >= 1)
            {
                txtEmpName1.Text = words[0].ToString();
            }
            if (words.Length >= 2)
            {
                txtEmpName2.Text = words[1].ToString();
            }
            if (words.Length >= 3)
            {
                txtEmpName3.Text = words[2].ToString();
            }
            if (words.Length >= 4)
            {
                txtEmpName4.Text = words[3].ToString();
            }
            if (words.Length >= 5)
            {
                txtEmpName5.Text = words[4].ToString();
            }
        }

        if (txtEmpFulEngName.Text != "")
        {
            string[] words = txtEmpFulEngName.Text.Split(' ');
            if (words.Length >= 1)
            {
                txtNameEng1.Text = words[0].ToString();
            }
            if (words.Length >= 2)
            {
                txtNameEng2.Text = words[1].ToString();
            }
            if (words.Length >= 3)
            {
                txtNameEng3.Text = words[2].ToString();
            }
            if (words.Length >= 4)
            {
                txtNameEng4.Text = words[3].ToString();
            }
            if (words.Length >= 5)
            {
                txtNameEng5.Text = words[4].ToString();
            }
        }
        //if (txtEmpName1.Text != "")
        //{
        //    FullName = txtEmpName1.Text;
        //}
        //if (txtEmpName2.Text != "")
        //{
        //    FullName = FullName + " " + txtEmpName2.Text;
        //}
        //if (txtEmpName3.Text != "")
        //{
        //    FullName = FullName + " " + txtEmpName3.Text;
        //}
        //if (txtEmpName4.Text != "")
        //{
        //    FullName = FullName + " " + txtEmpName4.Text;
        //}
        //if (txtEmpName5.Text != "")
        //{
        //    FullName = FullName + " " + txtEmpName5.Text;
        //}

        //if (txtNameEng1.Text != "")
        //{
        //    EngFullName = txtNameEng1.Text;
        //}
        //if (txtNameEng2.Text != "")
        //{
        //    EngFullName = EngFullName + " " + txtNameEng2.Text;
        //}
        //if (txtNameEng3.Text != "")
        //{
        //    EngFullName = EngFullName + " " + txtNameEng3.Text;
        //}
        //if (txtNameEng4.Text != "")
        //{
        //    EngFullName = EngFullName + " " + txtNameEng4.Text;
        //}
        //if (txtNameEng5.Text != "")
        //{
        //    EngFullName = EngFullName + " " + txtNameEng5.Text;
        //}
        //txtEmpFulName.Text = FullName;
        //txtEmpFulEngName.Text = EngFullName;
    }
    protected void CmdAdd_Click(object sender, EventArgs e)
    {
        try
        {

            if (!_isRefresh)
            {
                //DataView v = (DataView)ObjectDataSourceNats.Select();
                // ObjectDataSourceMonthAppComp.Select()
                //if ((v.Count == 0))
                //{
                newdata();
                    //UpdateNames();
                    //ObjectDataSourceEmps.Insert();
                    //ObjectDataSourceEmps.DataBind();
                    //Globals.MessageBox("تم حفظ البيانات بنجاح", this.Page);
                    //// newdata()
                    ////         '    'GridView1.DataBind()
                    ////         'End If
                    //cmdsave.Enabled = true;
                    //DelCmd.Enabled = true;
                    //BtnPrint.Enabled = true;
                    //CmdAdd.Enabled = false;
                //}
                //else
                //{
                //    Globals.MessageBox(Globals.helpString, this.Page);
                //}
            }
        }
        catch (Exception ex)
        {
        }
 
}
    
    protected void cmdsave_Click(object sender, EventArgs e)
    {
        SaveCustomer();
    }
    private void SaveCustomer()
    {
        try
        {
            //     Dim v As Data.DataView = ObjectDataSourceGetLifeDocsByYearMonth.Select()
            //     If (v.Count <= 1) Then
            //         'If txtReqCompFireRemove_C_M_Amount.Text <> "" Then
            //         CalAppSum()
            UpdateNames();
            if (txtEditFlag.Text == "1")
            {
                ObjectDataSourceEmps.Update();
                Globals.MessageBox("تم التعديل البيانات بنجاح", this.Page);
                // newdata()
                //cmdsave.Enabled = true;
                //DelCmd.Enabled = true;
                //BtnPrint.Enabled = true;
                //CmdAdd.Enabled = false;
            }
            else
            {
                UpdateNames();
                ObjectDataSourceEmps.Insert();
                ObjectDataSourceEmps.DataBind();
                //Globals.MessageBox("تم حفظ البيانات بنجاح", this.Page);
                // newdata()
                //         '    'GridView1.DataBind()
                //         'End If
                //cmdsave.Enabled = true;
                //DelCmd.Enabled = true;
                //BtnPrint.Enabled = true;
                CmdAdd.Enabled = false;
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
    protected void DelCmd_Click(object sender, EventArgs e)
    {
        if ((txtid.Text != ""))
        {
            ObjectDataSourceEmps.Delete();
            // GridView1.DataBind()
            //cmdsave.Enabled = true ;
            //DelCmd.Enabled = false;
            //BtnPrint.Enabled = false;
            CmdAdd.Enabled = true;
            Globals.MessageBox("تم حذف البيانات بنجاح", this.Page);
            newdata();
        }

    }
    private void newdata()
    {
        txtid.Text = "";
        txtEmpName1.Text = "";
        txtEmpName2.Text = "";
        txtEmpName3.Text = "";
        txtEmpName4.Text = "";
        txtEmpName5.Text = "";

        txtNameEng1.Text = "";
        txtNameEng2.Text = "";
        txtNameEng3.Text = "";
        txtNameEng4.Text = "";
        txtNameEng5.Text = "";

          
       
            txtCivilId.Text = "";
        
         

            CmbEmpGender.DataBind();
            cmbRelgion.DataBind();
            cmbEducation.DataBind();
            CmbEngJob.DataBind();
            CmbJob.DataBind();
            CmbEmpDept.DataBind();

            CmbEmpNat.DataBind();
            DropDownListGov.DataBind();
            DropDownListResidenceTypes.DataBind();
            DropDownListAppReasons.DataBind();
            DropDownListAppProcedures.DataBind();
            DropDownListResidenceItems.DataBind();
            CmbEmpMatStatus.DataBind();
            CmbLicenseType.DataBind();

            CmbEmpGender.Items.Insert(0, new ListItem("  ", ""));
            cmbRelgion.Items.Insert(0, new ListItem("  ", ""));
            cmbEducation.Items.Insert(0, new ListItem("  ", ""));
            CmbEngJob.Items.Insert(0, new ListItem("  ", ""));
            CmbJob.Items.Insert(0, new ListItem("  ", ""));
            CmbEmpDept.Items.Insert(0, new ListItem("  ", ""));

            CmbEmpNat.Items.Insert(0, new ListItem("  ", ""));
            DropDownListGov.Items.Insert(0, new ListItem("  ", ""));
            DropDownListResidenceTypes.Items.Insert(0, new ListItem("  ", ""));
            DropDownListAppReasons.Items.Insert(0, new ListItem("  ", ""));
            DropDownListAppProcedures.Items.Insert(0, new ListItem("  ", ""));
            DropDownListResidenceItems.Items.Insert(0, new ListItem("  ", ""));
            CmbEmpMatStatus.Items.Insert(0, new ListItem("  ", ""));
            CmbLicenseType.Items.Insert(0, new ListItem("  ", ""));

            txtEmpBirthDate.Text = "";
       
            txtHireDate.Text = "";
       
            txtEnterDate.Text = "";
      
            txtEmpVisaNo.Text = "";
            txtContractNo.Text = "";
            txtBirthPlace.Text = "";
            txtPassportNo.Text = "";
            txtPassType.Text = "";
      
            txtPassDate.Text = "";
          
            txtPassEndDate.Text = "";
       
        txtPassplace.Text = "";
        txtBSalary.Text = "";
       
        txtEducationDate.Text = "";
        
        //cmbDeptsNew.SelectedValue = "";
         txtVisaEndDate.Text = "";
        txtLicenceNo.Text = "";
        txtLicenseEndDate.Text = "";
         txtEmpHealthInsDate.Text = "";
        txtEmpHealthInsNo.Text = "";
        txtVisatype.Text = "";
        txtEmpFulName.Text = "";
        //txtAcualSal.Text = "";
        //txtLastInc.Text = "";

        //txtLastInc.Text = "";
        txtEmpCommanNo.Text = "";

        txtBirthPlace.Text = "";
        txtPlaceNat.Text = "";
        //txtLastIncDate.Text = "";  
        txtEmpFulEngName.Text = "";
        txtEditFlag.Text = "0";

    }
    protected void BtnPrint_Click(object sender, EventArgs e)
    {
        if ( txtid.Text != "") 
        {
             //this.Response.Redirect("~/Reports/CompaniesDisOfferDistribApplicationsShowRpt.aspx?AppId=" + txtid.Text);
        }
    }
    protected void CloseBtn_Click(object sender, EventArgs e)
    {
        this.Response.Redirect("~/admin/Main.aspx");
    }

    protected void ObjectDataSourceEmps_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        string t = e.OutputParameters["EMP_CODE"].ToString();
        txtid.Text = t;
        //lblAppNo.Text = t;
        //lblStudentFileNumber.Text = "Stu" + t + DateTime.Today.Day.ToString() + DateTime.Today.Month.ToString() + DateTime.Today.Year.ToString();
        //lblEnterDate.Text = DateTime.Today.ToShortDateString();
        //lblName.Text = EmpNameTxtBox.Text;
    }

    private void GetData()
    {
        DataSourceSelectArguments arg = new DataSourceSelectArguments();
        DataView v = (DataView)ObjectDataSourceEmps.Select();
        try
        {
            //If Not (IsNothing(v)) Then Ali Hint this code to check if the object in null or noo
            if (v.Count > 0)
            {
                txtEmpName1.Text = v.Table.Rows[0]["FName"].ToString();
                txtEmpName2.Text = v.Table.Rows[0]["SName"].ToString();
                txtEmpName3.Text = v.Table.Rows[0]["TName"].ToString();
                txtEmpName4.Text = v.Table.Rows[0]["FoName"].ToString();
                txtEmpName5.Text = v.Table.Rows[0]["FiName"].ToString();

                txtNameEng1.Text = v.Table.Rows[0]["FEngName"].ToString();
                txtNameEng2.Text = v.Table.Rows[0]["SEngName"].ToString();
                txtNameEng3.Text = v.Table.Rows[0]["TEngName"].ToString();
                txtNameEng4.Text = v.Table.Rows[0]["FoEngName"].ToString();
                txtNameEng5.Text = v.Table.Rows[0]["FiEngName"].ToString();

                //if (v.Table.Rows[0]["EMP_CODE"] != DBNull.Value)
                //{
                //    lblAppNo.Text = v.Table.Rows[0]["EMP_CODE"].ToString();
                //}
                if (v.Table.Rows[0]["CIVILID"] != DBNull.Value)
                {
                    txtCivilId.Text = v.Table.Rows[0]["CIVILID"].ToString();
                }
                //if (v.Table.Rows[0]["EmpNum"] != DBNull.Value)
                //{
                //    txtEmpCode.Text = v.Table.Rows[0]["EmpNum"].ToString();
                //}
                if (v.Table.Rows[0]["JOB_CLS_CODE"] != DBNull.Value)
                {
                    CmbEngJob.SelectedValue = v.Table.Rows[0]["JOB_CLS_CODE"].ToString();
                    CmbJob.SelectedValue = v.Table.Rows[0]["JOB_CLS_CODE"].ToString();
                }
                if (v.Table.Rows[0]["EMP_BIRTH_DATE"] != DBNull.Value)
                {
                    DateTime curBIRTH_DATE = DateTime.Parse(v.Table.Rows[0]["EMP_BIRTH_DATE"].ToString());
                    txtEmpBirthDate.Text = curBIRTH_DATE.ToShortDateString();
                }

                if (v.Table.Rows[0]["EducationId"] != DBNull.Value)
                {
                    cmbEducation.SelectedValue = v.Table.Rows[0]["EducationId"].ToString();
                }

                if (v.Table.Rows[0]["EMP_GENDER"] != DBNull.Value)
                {
                    CmbEmpGender.SelectedValue = v.Table.Rows[0]["EMP_GENDER"].ToString();
                }
                if (v.Table.Rows[0]["NATIONALITY_CODE"] != DBNull.Value)
                {
                    CmbEmpNat.SelectedValue = v.Table.Rows[0]["NATIONALITY_CODE"].ToString();
                }
                if (v.Table.Rows[0]["ReligionId"] != DBNull.Value)
                {
                    cmbRelgion.SelectedValue = v.Table.Rows[0]["ReligionId"].ToString();
                }
             
                if (v.Table.Rows[0]["EMP_BIRTH_DATE"] != DBNull.Value)
                {
                    txtEmpBirthDate.Text = DateTime.Parse(v.Table.Rows[0]["EMP_BIRTH_DATE"].ToString()).ToShortDateString();
                }
                 if (v.Table.Rows[0]["DEPTCODE"] != DBNull.Value)
                {
                    CmbEmpDept.SelectedValue = v.Table.Rows[0]["DEPTCODE"].ToString();
                }
                if (v.Table.Rows[0]["EMP_HIREDATE"] != DBNull.Value)
                {
                    txtHireDate.Text = DateTime.Parse(v.Table.Rows[0]["EMP_HIREDATE"].ToString()).ToShortDateString();
                }
                if (v.Table.Rows[0]["entrydate"] != DBNull.Value)
                {
                    txtEnterDate.Text = DateTime.Parse(v.Table.Rows[0]["entrydate"].ToString()).ToShortDateString();
                }
                if (v.Table.Rows[0]["MARITAL_STATUS_CODE"] != DBNull.Value)
                {
                    CmbEmpMatStatus.SelectedValue = v.Table.Rows[0]["MARITAL_STATUS_CODE"].ToString();
                }
                txtEmpVisaNo.Text = v.Table.Rows[0]["ResidenceNo"].ToString();
                txtContractNo.Text = v.Table.Rows[0]["ContractNo"].ToString();
                txtBirthPlace.Text = v.Table.Rows[0]["EMP_BIRTH_PLACE"].ToString();
                txtPassportNo.Text = v.Table.Rows[0]["PassportNo"].ToString();
                txtPassType.Text = v.Table.Rows[0]["PassType"].ToString();
                if (v.Table.Rows[0]["PassDate"] != DBNull.Value)
                {
                    txtPassDate.Text = DateTime.Parse(v.Table.Rows[0]["PassDate"].ToString()).ToShortDateString();
                }
                 if (v.Table.Rows[0]["PassEndDate"] != DBNull.Value)
                {
                    txtPassEndDate.Text = DateTime.Parse(v.Table.Rows[0]["PassEndDate"].ToString()).ToShortDateString();
                }
                txtPassplace.Text = v.Table.Rows[0]["Passplace"].ToString();
                txtBSalary.Text = v.Table.Rows[0]["SALARY"].ToString();
                //if (v.Table.Rows[0]["Status"] != DBNull.Value)
                //{
                //    CmbStatus.SelectedValue = v.Table.Rows[0]["Status"].ToString();
                //}
                //txtBankAcc1.Text = v.Table.Rows[0]["bankacc"].ToString();
                //if (v.Table.Rows[0]["BRANCH_CODE"] != DBNull.Value)
                //{
                //    CmbEmpBranch.SelectedValue = v.Table.Rows[0]["BRANCH_CODE"].ToString();
                //}
                if (v.Table.Rows[0]["EducationMajoredDate"] != DBNull.Value)
                {
                    txtEducationDate.Text = DateTime.Parse(v.Table.Rows[0]["EducationMajoredDate"].ToString()).ToShortDateString();
                }
                //if (v.Table.Rows[0]["LocationId"] != DBNull.Value)
                //{
                //    cmbDeptsNew.SelectedValue = v.Table.Rows[0]["LocationId"].ToString();
                //}
                if (v.Table.Rows[0]["ResidenceEndDate"] != DBNull.Value)
                {
                    txtVisaEndDate.Text = DateTime.Parse(v.Table.Rows[0]["ResidenceEndDate"].ToString()).ToShortDateString();
                }
                txtLicenceNo.Text = v.Table.Rows[0]["LicenseNo"].ToString();
                if (v.Table.Rows[0]["LicenseEndDate"] != DBNull.Value)
                {
                    txtLicenseEndDate.Text = DateTime.Parse(v.Table.Rows[0]["LicenseEndDate"].ToString()).ToShortDateString();
                }
                if (v.Table.Rows[0]["EMP_HEALTH_INS_DATE"] != DBNull.Value)
                {
                    txtEmpHealthInsDate.Text = DateTime.Parse(v.Table.Rows[0]["EMP_HEALTH_INS_DATE"].ToString()).ToShortDateString();
                }
              
                txtEmpHealthInsNo.Text = v.Table.Rows[0]["EMP_HEALTH_INS_NUM"].ToString();
                txtVisatype.Text = v.Table.Rows[0]["ContractType"].ToString();
                 txtEmpFulName.Text = v.Table.Rows[0]["FullName"].ToString();
                 //txtAcualSal.Text = v.Table.Rows[0]["PhoneAllow"].ToString();
                 //txtLastInc.Text = v.Table.Rows[0]["TransAllow"].ToString();
         
                 //txtLastInc.Text = v.Table.Rows[0]["TransAllow"].ToString();
                 txtEmpCommanNo.Text = v.Table.Rows[0]["VisaNo"].ToString();
                    
                txtBirthPlace.Text = v.Table.Rows[0]["BirthPlace"].ToString();
                txtPlaceNat.Text = v.Table.Rows[0]["PassNat"].ToString();
          
                //if (v.Table.Rows[0]["LastIncreasedDate"] != DBNull.Value)
                //{
                //    txtLastIncDate.Text = DateTime.Parse(v.Table.Rows[0]["LastIncreasedDate"].ToString()).ToShortDateString();
                //}
           
                       
                txtOrgId.Text = v.Table.Rows[0]["OrgId"].ToString();
                txtEmpFulEngName.Text = v.Table.Rows[0]["EngFullName"].ToString();
       
         
               
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
            //MsgBox(ex.Message);
        }
    }

    protected void BtnPrintVisitor_Click(object sender, EventArgs e)
    {
        SaveCustomer();


        if (txtid.Text != "")
        {         
           // this.Response.Redirect("~/Reports/CustomerShowRpt.aspx?Id=" + txtid.Text);
            PrintForm();
        }
    }
    
    protected void PrintForm()
 
    {
        

        // ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('files/11Report.pdf');popup.focus();", true);
        try
        {
            //CrystalReportSourceEmp.ReportDocument.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("files/12Report.pdf"));

            //MemoryStream oStream = (MemoryStream)CrystalReportSourceEmp.ReportDocument.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
            //Response.Clear();
            //Response.Buffer = true;
            //Response.ContentType = "application/PDF";
            //Response.BinaryWrite(oStream.ToArray());
            //Response.End();



           

            //CrystalDecisions.Web.CrystalReportSource RptSource = new CrystalDecisions.Web.CrystalReportSource();

            //CrystalReportSourceEmp.Report.FileName = "~/Reports/VisitorBookRpt.rpt";
            //CrystalDecisions.Web.DataSourceRef DataRef = new CrystalDecisions.Web.DataSourceRef();
            //DataRef.DataSourceID = "ObjectDataSourceCustomerView";
          
            //DataRef.ReportName = "VisitorBookRpt";
            //DataRef.TableName = "CustomerView";



            //CrystalReportSourceEmp.Report.DataSources.Add(DataRef);
   

            //CrystalReportSourceEmp.ReportDocument.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "HRReport");
            //Response.End();

            //MemoryStream oStream = (MemoryStream)CrystalReportSourceEmp.ReportDocument.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
            //CrystalReportSourceEmp.ReportDocument.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("files/VisitReport.pdf"));

            DataView T = (DataView)ObjectDataSourceCustomerView.Select();
            CrystalReportSourceEmp.ReportDocument.SetDataSource(T);
            
            //string Curl = "https://docs.google.com/gview?embedded=true&url=" + Request.Url.GetLeftPart(UriPartial.Authority) + VirtualPathUtility.ToAbsolute("~/") + "admin/files/VisitReport.pdf";
            //ScriptManager.RegisterStartupScript(Page, typeof(Page), "OpenWindow", "window.open('" + Curl + "','mywindow','menubar=1,resizable=1,width=900,height=600');", true);


            var t = Task.Run(() => CrystalReportSourceEmp.ReportDocument.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("files/VisitReport.pdf")));
            //for (int i = 0; i < 200; i++) { }
            t.Wait();

            string Curl = "https://docs.google.com/gview?embedded=true&url=" + Request.Url.GetLeftPart(UriPartial.Authority) + VirtualPathUtility.ToAbsolute("~/") + "admin/files/VisitReport.pdf";

            // "http://62.150.104.8/HR/admin/files/11Report.pdf";


            string FileName = Server.MapPath("files/VisitReport.pdf");

            //CrystalReportSourceEmp.ReportDocument.Close();
            ScriptManager.RegisterStartupScript(Page, this.GetType(), "clientScript", "<script language=javascript> refresh(); </script>", false);

            while (!System.IO.File.Exists(FileName))
            {
                System.Threading.Thread.Sleep(500);
            }

            if (t.IsCompleted)
            {
                // this.Response.Redirect("test.aspx");
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "OpenWindow", "window.open('" + Curl + "','mywindow','menubar=1,resizable=1,width=900,height=600');", true);
                //Response.End();

            }

           

            //this.Response.Redirect(Curl);
            //Curl = "window.location.replace('" + Curl + "');";
            //Response.Flush();
            //Response.End();


            //ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", Curl, true);

            //ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener11", Curl, true);
            //ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener11", "window.location.replace('files/11Report.pdf');", true);

            //this.Response.Redirect("~/Reports/ShowRpt.aspx?AppId=" + txtid.Text);
        }
        catch (Exception ex)
        {

        }
        finally
        {
            // HttpContext.Current.ApplicationInstance.CompleteRequest();

        }

    }
}