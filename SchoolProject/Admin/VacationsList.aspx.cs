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


public partial class Admin_VacationsList : System.Web.UI.Page
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
        ObjectDataSourceVacations.Select();
        DataView v = (DataView)ObjectDataSourceVacations.Select();
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
          

            HttpCookie cookieOrgId;
            cookieOrgId = HttpContext.Current.Request.Cookies.Get("OrgId");
            if (cookieOrgId != null)
            {
                txtOrgId.Text = cookieOrgId.Value.ToString();
            }

           

           


        }
    }
   
  
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        
        if ((e.CommandName == "Update"))
        {
           
            int index = Convert.ToInt32(e.CommandArgument);
            // Retrieve the row that contains the button clicked 
            // by the user from the Rows collection.
            GridViewRow row = GridView1.Rows[index];
            string Id = row.Cells[0].Text;

            this.Response.Redirect("VacationsAdd.aspx?Id=" + Id);

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
           
        //    int index = Convert.ToInt32(e.CommandArgument);
        //    // Retrieve the row that contains the button clicked 
        //    // by the user from the Rows collection.
        //    GridViewRow row = GridView1.Rows[index];
        //    string Id = row.Cells[0].Text;
        //    this.Response.Redirect("CompLicAdd.aspx?CommId=" + Id + "&InsTypeId=" + txtInTypeId.Text);

        //}
        
    }

    protected void CmdAdd_Click(object sender, EventArgs e)
    {
        this.Response.Redirect("VacationsAdd.aspx");
    }
    protected void CloseBtn_Click(object sender, EventArgs e)
    {
        this.Response.Redirect("Main.aspx");
    }
}