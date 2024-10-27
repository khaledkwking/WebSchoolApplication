using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class Admin_EmpDataNew : System.Web.UI.Page
{
    private Boolean _refreshState;
    private Boolean _isRefresh;

   protected override void LoadViewState(object savedState)
   {
       object[] AllStates = (object[])savedState;
       base.LoadViewState(AllStates[0]);
       _refreshState = bool.Parse(AllStates[1].ToString());
       _isRefresh = _refreshState == bool.Parse(Session["__ISREFRESH"].ToString());
   }

   protected override object SaveViewState()
   {
       Session["__ISREFRESH"] = _refreshState;
       object[] AllStates = new object[2];
       AllStates[0] = base.SaveViewState();
       AllStates[1] = !(_refreshState);
       return AllStates;
   }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            if (Request.QueryString["Id"] != null)
            {
                txtid.Text = Request.QueryString["Id"].ToString();
                GetData();
                CmdAdd.Enabled = false;
                //EmpSaveBtn.Enabled = true;
                cmdsave.Enabled = true;
                DelCmd.Enabled = true;

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
                //lblEnterDate.Text = DateTime.Today.ToShortDateString();
                CmdAdd.Enabled = true;
                //EmpSaveBtn.Enabled = true;
                cmdsave.Enabled = false;
                DelCmd.Enabled = false;
                //RadioBtnAgreeFlag.Items[0].Selected = true;
                //showtabs();
                //ChkOfferFlag.Checked = false;
            }
            DelCmd.Attributes["onclick"] = "javascript:return " + "confirm(' هل تريد حقا  الغاء  ') ";
        }
    }
    private void UpdateNames()
    {
        string FullName = "";
        string EngFullName = "";

        if (txtEmpName1.Text != "")
        {
            FullName = txtEmpName1.Text;
        }
        if (txtEmpName2.Text != "")
        {
            FullName = FullName + " " + txtEmpName2.Text;
        }
        if (txtEmpName3.Text != "")
        {
            FullName = FullName + " " + txtEmpName3.Text;
        }
        if (txtEmpName4.Text != "")
        {
            FullName = FullName + " " + txtEmpName4.Text;
        }
        if (txtEmpName5.Text != "")
        {
            FullName = FullName + " " + txtEmpName5.Text;
        }

        if (txtNameEng1.Text != "")
        {
            EngFullName = txtNameEng1.Text;
        }
        if (txtNameEng2.Text != "")
        {
            EngFullName = EngFullName + " " + txtNameEng2.Text;
        }
        if (txtNameEng3.Text != "")
        {
            EngFullName = EngFullName + " " + txtNameEng3.Text;
        }
        if (txtNameEng4.Text != "")
        {
            EngFullName = EngFullName + " " + txtNameEng4.Text;
        }
        if (txtNameEng5.Text != "")
        {
            EngFullName = EngFullName + " " + txtNameEng5.Text;
        }
        txtEmpFulName.Text = FullName;
        txtEmpFulEngName.Text = EngFullName;
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
                    txtAdaraId.Text = "1";

                    UpdateNames();
                    ObjectDataSourceEmps.Insert();
                    ObjectDataSourceEmps.DataBind();
                    Globals.MessageBox("تم حفظ البيانات بنجاح", this.Page);
                    // newdata()
                    //         '    'GridView1.DataBind()
                    //         'End If
                    cmdsave.Enabled = true;
                    DelCmd.Enabled = true;
                    BtnPrint.Enabled = true;
                    CmdAdd.Enabled = false;
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
        try
        {
            //     Dim v As Data.DataView = ObjectDataSourceGetLifeDocsByYearMonth.Select()
            //     If (v.Count <= 1) Then
            //         'If txtReqCompFireRemove_C_M_Amount.Text <> "" Then
            //         CalAppSum()
            UpdateNames();
            ObjectDataSourceEmps.Update();
            Globals.MessageBox("تم التعديل البيانات بنجاح", this.Page);
            // newdata()
            cmdsave.Enabled = true;
            DelCmd.Enabled = true;
            BtnPrint.Enabled = true;
            CmdAdd.Enabled = false;
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
            cmdsave.Enabled = false;
            DelCmd.Enabled = false;
            BtnPrint.Enabled = false;
            CmdAdd.Enabled = true;
            Globals.MessageBox("تم حذف البيانات بنجاح", this.Page);
            newdata();
        }

    }
    private void newdata()
    {

    }
    protected void BtnPrint_Click(object sender, EventArgs e)
    {
        if ( txtid.Text != "") 
        {
             this.Response.Redirect("~/Reports/CompaniesDisOfferDistribApplicationsShowRpt.aspx?AppId=" + txtid.Text);
        }
    }
    protected void CloseBtn_Click(object sender, EventArgs e)
    {
        this.Response.Redirect("~/admin/EmpList.aspx");
    }

    protected void ObjectDataSourceEmps_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        string t = e.OutputParameters["EMP_CODE"].ToString();
        txtid.Text = t;
        lblAppNo.Text = t;
        //  lblStudentFileNumber.Text = "Stu" + t + DateTime.Today.Day.ToString() + DateTime.Today.Month.ToString() + DateTime.Today.Year.ToString();
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

                if (v.Table.Rows[0]["EMP_CODE"] != DBNull.Value)
                {
                    lblAppNo.Text = v.Table.Rows[0]["EMP_CODE"].ToString();
                }
                if (v.Table.Rows[0]["EmpNum"] != DBNull.Value)
                {
                    txtEmpCode.Text = v.Table.Rows[0]["EmpNum"].ToString();
                }
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
                if (v.Table.Rows[0]["RegionId"] != DBNull.Value)
                {
                    cmbRelgion.SelectedValue = v.Table.Rows[0]["RegionId"].ToString();
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
                if (v.Table.Rows[0]["Status"] != DBNull.Value)
                {
                    CmbStatus.SelectedValue = v.Table.Rows[0]["Status"].ToString();
                }
                txtBankAcc1.Text = v.Table.Rows[0]["bankacc"].ToString();
                if (v.Table.Rows[0]["BRANCH_CODE"] != DBNull.Value)
                {
                    CmbEmpBranch.SelectedValue = v.Table.Rows[0]["BRANCH_CODE"].ToString();
                }
                if (v.Table.Rows[0]["EducationMajoredDate"] != DBNull.Value)
                {
                    txtEducationDate.Text = DateTime.Parse(v.Table.Rows[0]["EducationMajoredDate"].ToString()).ToShortDateString();
                }
                if (v.Table.Rows[0]["LocationId"] != DBNull.Value)
                {
                    cmbDeptsNew.SelectedValue = v.Table.Rows[0]["LocationId"].ToString();
                }
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
                 txtAcualSal.Text = v.Table.Rows[0]["PhoneAllow"].ToString();
                 txtLastInc.Text = v.Table.Rows[0]["TransAllow"].ToString();
         
                 txtLastInc.Text = v.Table.Rows[0]["TransAllow"].ToString();
                 txtEmpCommanNo.Text = v.Table.Rows[0]["VisaNo"].ToString();
                    
                txtBirthPlace.Text = v.Table.Rows[0]["BirthPlace"].ToString();
                txtPlaceNat.Text = v.Table.Rows[0]["PassNat"].ToString();
          
                if (v.Table.Rows[0]["LastIncreasedDate"] != DBNull.Value)
                {
                    txtLastIncDate.Text = DateTime.Parse(v.Table.Rows[0]["LastIncreasedDate"].ToString()).ToShortDateString();
                }
           
                       
                txtOrgId.Text = v.Table.Rows[0]["OrgId"].ToString();
                txtEmpFulEngName.Text = v.Table.Rows[0]["EnFullName"].ToString();
       
         
               
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
            //MsgBox(ex.Message);
        }
    }
}