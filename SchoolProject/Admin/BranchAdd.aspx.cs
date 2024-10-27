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

public partial class Admin_BranchAdd : System.Web.UI.Page
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
    private void GetData()
    {
        
        ObjectDataSourceBranch.Select();
        DataView v = (DataView)ObjectDataSourceBranch.Select();
        if (v.Count > 0)
        {
            txtid.Text = v.Table.Rows[0]["BRANCHCODE"].ToString();
            txBranchName.Text = v.Table.Rows[0]["BRANCHNAME"].ToString();
            txtCompanyEng.Text = v.Table.Rows[0]["CompanyNameEng"].ToString();
            txtCivilId.Text = v.Table.Rows[0]["CivilId"].ToString();
            txtUiqNum.Text = v.Table.Rows[0]["uinNum"].ToString();
            //txtCompanyName.Text = v.Table.Rows[0]["CommerName"].ToString();
            txtsCompanyName.Text = v.Table.Rows[0]["CommerName"].ToString();
            txtOwner.Text = v.Table.Rows[0]["OwnerName"].ToString();
            txtOwnerNat.Text = v.Table.Rows[0]["OwnerNat"].ToString();
            txtSignPerson.Text = v.Table.Rows[0]["SignatureOwner"].ToString();
            txtSignPersonEng.Text = v.Table.Rows[0]["SignatureOwnerEng"].ToString();
            txtApplyNo.Text = v.Table.Rows[0]["CommerRecord"].ToString();
            hintNameTextBox.Text = v.Table.Rows[0]["HintName"].ToString();
            txtActEng.Text = v.Table.Rows[0]["ActivityEng"].ToString();
            telPhoneTextBox.Text = v.Table.Rows[0]["TelPhone"].ToString();
            txtFileNo.Text = v.Table.Rows[0]["FileNo"].ToString();
            addressTextBox.Text = v.Table.Rows[0]["Address"].ToString();
            if (v.Table.Rows[0]["GovId"] != DBNull.Value)
            {
                cmbGov.SelectedValue = v.Table.Rows[0]["GovId"].ToString();
            }
            txtCompArea.Text = v.Table.Rows[0]["Area"].ToString();
            txtCompBlockNo.Text = v.Table.Rows[0]["BlockNo"].ToString();
            txtGada.Text = v.Table.Rows[0]["Gada"].ToString();
            txtFloor.Text = v.Table.Rows[0]["Floor"].ToString();
            txtFlat.Text = v.Table.Rows[0]["FlatNo"].ToString();
            txtmailNo.Text = v.Table.Rows[0]["MailSign"].ToString();
            txtMailBox.Text = v.Table.Rows[0]["MailBox"].ToString();
            txtLawNo.Text = v.Table.Rows[0]["LawNo"].ToString();
            txtstreet.Text = v.Table.Rows[0]["Street"].ToString();
            txtHouseType.Text = v.Table.Rows[0]["HouseType"].ToString();
            txtContract.Text = v.Table.Rows[0]["ContractNo"].ToString();
            txtAutoAddress.Text = v.Table.Rows[0]["OtherComaccid"].ToString();
            txtEmail.Text = v.Table.Rows[0]["Email"].ToString();
            txtOrgId.Text = v.Table.Rows[0]["OrgId"].ToString();
           
            DelCmd.Enabled = true;
            cmdsave.Enabled = true;
            //BtnPrint.Enabled = true;

        }

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
      
            HttpCookie cookieOrgId;
            cookieOrgId = HttpContext.Current.Request.Cookies.Get("OrgId");
            if (cookieOrgId != null)
            {
                txtOrgId.Text = cookieOrgId.Value.ToString();
            }

            //if (Request.QueryString["InsTypeId"] != null)
            //{
            //    //txtInTypeId.Text = Request.QueryString["InsTypeId"].ToString();
            //    DataView v = (DataView)ObjectDataSourceEmpView.Select();
            //    if (v.Count > 0)
            //    {
            //        //LblTitle.Text = v.Table.Rows[0]["TypeDesc"].ToString();

            //    }

            //    //this.Response.Redirect("CompLicAdd.aspx?InTypeId=" + txtInTypeId.Text);
            //}

            if (Request.QueryString["Id"] != null)
            {
                txtid.Text = Request.QueryString["Id"].ToString();
                GetData();
                txtEditFlag.Text = "1";
                //CmdAdd.Enabled = false;

            }

            else
            {
                txtEditFlag.Text = "";
            }


        }
    }
    protected void BtnSearch_Click(object sender, EventArgs e)
    {
        GetData();
    }
   
    
    protected void CloseBtn_Click(object sender, EventArgs e)
    {
        this.Response.Redirect("BranchList.aspx");
    }
    protected void cmdsave_Click(object sender, EventArgs e)
    {
        try
        {
            //     Dim v As Data.DataView = ObjectDataSourceGetLifeDocsByYearMonth.Select()
            //     If (v.Count <= 1) Then
            //         'If txtReqCompFireRemove_C_M_Amount.Text <> "" Then
            //         CalAppSum()
            if (txtEditFlag.Text == "1")
            {
                ObjectDataSourceBranch.Update();
                Globals.MessageBox("تم التعديل البيانات بنجاح", this.Page);
                // newdata()
                cmdsave.Enabled = true;
                DelCmd.Enabled = true;
                //BtnPrint.Enabled = true;
                //CmdAdd.Enabled = false;
            }
            else
            {
                ObjectDataSourceBranch.Insert();
                ObjectDataSourceBranch.DataBind();
                Globals.MessageBox("تم حفظ البيانات بنجاح", this.Page);
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
            ObjectDataSourceBranch.Delete();
            // GridView1.DataBind()
            cmdsave.Enabled = false;
            DelCmd.Enabled = false;
            //BtnPrint.Enabled = false;
            CmdAdd.Enabled = true;
            Globals.MessageBox("تم حذف البيانات بنجاح", this.Page);
            newdata();
        }
    }
    private void newdata()
    {
        txtEditFlag.Text = "0";
        txtid.Text ="";
        txBranchName.Text = "";
        txtCompanyEng.Text = "";
        txtCivilId.Text = "";
        txtUiqNum.Text = "";
        txtsCompanyName.Text = "";
        txtOwner.Text = "";
        txtOwnerNat.Text = "";
        txtSignPerson.Text = "";
        txtSignPersonEng.Text = "";
        txtApplyNo.Text = "";
        hintNameTextBox.Text = "";
        txtActEng.Text = "";
        telPhoneTextBox.Text = "";
        txtFileNo.Text = "";
        addressTextBox.Text = "";    
        cmbGov.SelectedValue="";
        txtCompArea.Text = "";
        txtCompBlockNo.Text = "";
        txtGada.Text = "";
        txtFloor.Text = "";
        txtFlat.Text = "";
        txtmailNo.Text = "";
        txtMailBox.Text = "";
        txtLawNo.Text = "";
        txtstreet.Text = "";
        txtHouseType.Text = "";
        txtContract.Text = "";
        txtAutoAddress.Text = "";
        txtEmail.Text = "";
        cmdsave.Enabled = false;
        DelCmd.Enabled = false;
        //BtnPrint.Enabled = false;
        CmdAdd.Enabled = true;
    }
    protected void CmdAdd_Click(object sender, EventArgs e)
    {
        try
        {
            newdata();
            //if (!_isRefresh)
            //{
            //    //DataView v = (DataView)ObjectDataSourceNats.Select();
            //    // ObjectDataSourceMonthAppComp.Select()
            //    //if ((v.Count == 0))
            //    //{
                              
            //    ObjectDataSourceBranch.Insert();
            //    ObjectDataSourceBranch.DataBind();
            //    Globals.MessageBox("تم حفظ البيانات بنجاح", this.Page);
            //    // newdata()
            //    //         '    'GridView1.DataBind()
            //    //         'End If
            //    cmdsave.Enabled = true;
            //    DelCmd.Enabled = true;
            //    //BtnPrint.Enabled = true;
            //    CmdAdd.Enabled = false;
            //    //}
            //    //else
            //    //{
            //    //    Globals.MessageBox(Globals.helpString, this.Page);
            //    //}
            //}
        }
        catch (Exception ex)
        {
        }
    }
}