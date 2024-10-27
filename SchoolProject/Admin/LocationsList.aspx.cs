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

public partial class Admin_LocationsList : System.Web.UI.Page
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

        DataView v = (DataView)ObjectDataSourceLocationParam.Select();
        if (v.Count > 0)
        {
            txtDeptCode.Text = v.Table.Rows[0]["LocId"].ToString();
            txtDeptName.Text = v.Table.Rows[0]["LocName"].ToString();
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
                txtEditFlag.Text = "1";
                txtid.Text = Request.QueryString["Id"].ToString();
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
      //

        if ((e.CommandName == "Update"))
        {
            //ActionIdIddata.Value = "Update";
            int index = Convert.ToInt32(e.CommandArgument);
            // Retrieve the row that contains the button clicked 
            // by the user from the Rows collection.
            GridViewRow row = GridView1.Rows[index];
            string Id = row.Cells[0].Text;
            txtid.Text = Id.ToString();
            this.Response.Redirect("LocationsList.aspx?Id=" + Id);

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
    
        //if ((e.CommandName == "Print"))
        //{
        //    ActionIdIddata.Value = "Print";
        //    int index = Convert.ToInt32(e.CommandArgument);
        //    // Retrieve the row that contains the button clicked 
        //    // by the user from the Rows collection.
        //    GridViewRow row = GridView1.Rows[index];
        //    string Id = row.Cells[0].Text;
        //    this.Response.Redirect("CompLicAdd.aspx?CommId=" + Id + "&InsTypeId=" + txtInTypeId.Text);

        //}
        
    }
    protected void CloseBtn_Click(object sender, EventArgs e)
    {
        this.Response.Redirect("Main.aspx");
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
            ObjectDataSourceLocation.Update();
            Globals.MessageBox("تم التعديل البيانات بنجاح", this.Page);
            // newdata()
            cmdsave.Enabled = true;
            DelCmd.Enabled = true;
            //BtnPrint.Enabled = true;
            CmdAdd.Enabled = true;
           }
           else
            {
                ObjectDataSourceLocation.Insert();
                ObjectDataSourceLocation.DataBind();
                Globals.MessageBox("تم حفظ البيانات بنجاح", this.Page);
                // newdata()
                //         '    'GridView1.DataBind()
                //         'End If
                cmdsave.Enabled = true;
                DelCmd.Enabled = true;
                //BtnPrint.Enabled = true;
                CmdAdd.Enabled = true;
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
            ObjectDataSourceLocation.Delete();
            // GridView1.DataBind()
            cmdsave.Enabled = true;
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
        txtDeptCode.Text = "";
        txtDeptName.Text = "";
        cmdsave.Enabled = true;
        DelCmd.Enabled = false;
        //BtnPrint.Enabled = false;
        CmdAdd.Enabled = true;
    }
    protected void CmdAdd_Click(object sender, EventArgs e)
    {
        try
        {

            if (!_isRefresh)
            {
                newdata();
                //DataView v = (DataView)ObjectDataSourceNats.Select();
                // ObjectDataSourceMonthAppComp.Select()
                //if ((v.Count == 0))
                //{
                              
                //ObjectDataSourceDept.Insert();
                //ObjectDataSourceDept.DataBind();
                //Globals.MessageBox("تم حفظ البيانات بنجاح", this.Page);
                //// newdata()
                ////         '    'GridView1.DataBind()
                ////         'End If
                //cmdsave.Enabled = true;
                //DelCmd.Enabled = true;
                ////BtnPrint.Enabled = true;
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
}