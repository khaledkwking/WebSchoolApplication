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

public partial class Admin_VacationsAdd : System.Web.UI.Page
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
        
        ObjectDataSourceVacations.Select();
        DataView v = (DataView)ObjectDataSourceVacations.Select();
        if (v.Count > 0)
        {
            txtid.Text = v.Table.Rows[0]["VAC_TYPE_CODE"].ToString();


            txVACTypeDESC.Text = v.Table.Rows[0]["VAC_TYPE_DESC"].ToString();
            txtMAXNUM.Text = v.Table.Rows[0]["MAX_NUM"].ToString();
            if (v.Table.Rows[0]["PERIOD_FLAG"] != DBNull.Value)
            {
                ChkPERIOD_FLAG.Checked = Boolean.Parse(v.Table.Rows[0]["PERIOD_FLAG"].ToString());
            }
            if (v.Table.Rows[0]["DEC_FLAG"] != DBNull.Value)
            {
                ChkDEC_FLAG.Checked = Boolean.Parse(v.Table.Rows[0]["DEC_FLAG"].ToString());
            }
            txtSAL_DED_PERCENT.Text = v.Table.Rows[0]["SAL_DED_PERCENT"].ToString(); 

            //txtOrgId.Text = v.Table.Rows[0]["OrgId"].ToString();
           
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
                ObjectDataSourceVacations.Update();
                Globals.MessageBox("تم التعديل البيانات بنجاح", this.Page);
                // newdata()
                cmdsave.Enabled = true;
                DelCmd.Enabled = true;
                //BtnPrint.Enabled = true;
                //CmdAdd.Enabled = false;
            }
            else
            {
                ObjectDataSourceVacations.Insert();
                ObjectDataSourceVacations.DataBind();
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
            ObjectDataSourceVacations.Delete();
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
        txVACTypeDESC.Text = "";
        txtMAXNUM.Text = "";
        ChkPERIOD_FLAG.Checked  = false;
        ChkDEC_FLAG.Checked = false;
        txtSAL_DED_PERCENT.Text = "";
       
       
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