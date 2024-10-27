using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSchool.Controls.Account
{
    public partial class QidsDetails : System.Web.UI.UserControl
    {
        string Accessing, Adding, Updating, Deleting, Importing;
        protected void Page_Load(object sender, EventArgs e)
        {
            // to get the previus Link 
            string previousUrl;
            if (Context.Request.UrlReferrer != null)
            {
                previousUrl = Context.Request.UrlReferrer.ToString();
            }
            else
            {
                previousUrl = "default.aspx";
            }

            // to get all user Prvlages on page 
            HttpCookie cookieOrgId = HttpContext.Current.Request.Cookies.Get("OrgId");
            HttpCookie cookieName = HttpContext.Current.Request.Cookies.Get("Name");
            HttpCookie cookieUserId = HttpContext.Current.Request.Cookies.Get("UserId");

            int USERID = int.Parse(cookieUserId.Value.ToString ());// int.Parse(Session["UserID"].ToString());
     
            if (cookieOrgId != null)
            {
                txtOrgId.Text = cookieOrgId.Value.ToString();
            }
            //BOL.UsersPages DA= new BOL.UsersPages();
            //DAL.NEWERPDataSet.UsersPagesDataTable dt = new DAL.NEWERPDataSet.UsersPagesDataTable();

            //dt = DA.Read("1", USERID, 5, "");
            //if (dt.Rows.Count > 0)
            //{
            //    DataRow UserRow = dt.Rows[0];
            //    Accessing = UserRow["Accessing"].ToString();
            //    Adding = UserRow["Adding"].ToString();
            //    Updating = UserRow["Updating"].ToString();
            //    Deleting = UserRow["Deleting"].ToString();
            //    Importing = UserRow["Importing"].ToString();

            //    // checking the access  
            //    if (Accessing != "True") { Response.Redirect("~/NoAccess.aspx?URL=" + previousUrl); }
            //    // checking the insert privlage 
            //    if (Adding != "True") { NewRecord.Visible = false; }
            //}
            //else
            //{
            //    Response.Redirect("~/NoAccess.aspx?URL=" + previousUrl);
            //}
            if (!Page.IsPostBack)
            {
                SetInitialRow(); 
                lv.SelectedIndex = 0;
                DataView V = (DataView) QidsDS.Select();
                if (V.Count > 0)
                {
                    string QidID =  V[0]["qidid"].ToString ();
                    txtQidId.Value = QidID;
                    LoadDetData();
                 }
                //if (lv.SelectedIndex > -1)
                //{
                //    string QidID = lv.DataKeys[lv.SelectedIndex].Value.ToString();

            }


        }
        private void SetInitialRow()
        {
           //DataView v= (DataView) QidsDetsDS.Select();
            DataTable dt = new DataTable();
            DataRow dr = null;
            dt.Columns.Add(new DataColumn("ID", typeof(long)));
            dt.Columns.Add(new DataColumn("qidid", typeof(long)));
            dt.Columns.Add(new DataColumn("ACCOUNTID", typeof(long))); 
            dt.Columns.Add(new DataColumn("FromValue", typeof(double)));
            dt.Columns.Add(new DataColumn("ToValue", typeof(double)));
            dt.Columns.Add(new DataColumn("type", typeof(int)));
            dt.Columns.Add(new DataColumn("Description", typeof(string)));
            dt.Columns.Add(new DataColumn("EnterDate", typeof(DateTime)));
            dt.Columns.Add(new DataColumn("Detcode", typeof(int)));
            dt.Columns.Add(new DataColumn("QidType", typeof(int)));
            dt.Columns.Add(new DataColumn("ActionType", typeof(int)));
            dt.Columns.Add(new DataColumn("CostId", typeof(long)));
            
            //dr = dt.NewRow();
            //dr["qidid"] = txtQidId.Value;
            ////dr["FromValue"] = string.Empty;
            ////dr["ToValue"] = string.Empty;
            ////dr["type"] = string.Empty;
            //dr["Description"] = string.Empty;
            //dr["EnterDate"] = DateTime.Today.ToShortDateString() ;
            ////dr["Detcode"] = string.Empty;
            ////dr["QidType"] = string.Empty;
            ////dr["ActionType"] = string.Empty;
            ////dr["CostId"] = string.Empty;
            //dt.Rows.Add(dr);
            ////dr = dt.NewRow();

            //Store the DataTable in ViewState
            ViewState["qidsDetails"] = dt;

            //Gridview1.DataSource = dt;
            //Gridview1.DataBind();

            ListViewQid.DataSource = dt;
            ListViewQid.DataBind();
        }
        private void LoadDetData()
        {
            DataView v= (DataView) QidsDetsDS.Select();
            
            DataTable dtCurrentTable = (DataTable)ViewState["qidsDetails"];
            dtCurrentTable.Rows.Clear();
            DataRow drCurrentRow = null;

            for (int i=0; i<v.Count; i++)
            {
                drCurrentRow = dtCurrentTable.NewRow();
                drCurrentRow["QidId"] = v[i]["qidid"];
                drCurrentRow["ACCOUNTID"] = v[i]["ACCOUNTID"];
                drCurrentRow["FromValue"] = v[i]["FromValue"];
                drCurrentRow["ToValue"] = v[i]["ToValue"];

                drCurrentRow["type"] = v[i]["type"];
                drCurrentRow["Description"] = v[i]["Description"];
                drCurrentRow["EnterDate"] = v[i]["EnterDate"];
                drCurrentRow["Detcode"] = v[i]["Detcode"];

                drCurrentRow["QidType"] = v[i]["QidType"];
                drCurrentRow["ActionType"] = v[i]["ActionType"];

                drCurrentRow["ID"] = v[i]["ID"];

                drCurrentRow["CostId"] = v[i]["CostId"];
              

                dtCurrentTable.Rows.Add(drCurrentRow);
            }
             ViewState["qidsDetails"] = dtCurrentTable;

            ListViewQid.DataSource = dtCurrentTable;
            ListViewQid.DataBind();
        }
        protected void Gridview1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)

            {

                DataTable dt = (DataTable)ViewState["qidsDetails"];
                LinkButton lb = (LinkButton)e.Row.FindControl("LinkButton1");
                if (lb != null)

                {

                    if (dt.Rows.Count > 1)

                    {

                        if (e.Row.RowIndex == dt.Rows.Count - 1)

                        {

                            lb.Visible = false;

                        }

                    }
                    else

                    {

                        lb.Visible = false;

                    }

                }

            }
        }
        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            //AddNewRowToGrid();
        }
        private void AddNewRowToList()
        {
            int rowIndex = 0;
            
            if (ViewState["qidsDetails"] != null)
            {
                DataTable dtCurrentTable = (DataTable)ViewState["qidsDetails"];
                DataRow drCurrentRow = null;
                if (dtCurrentTable.Rows.Count > 0)
                {
                    for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                    {
                        //extract the TextBox values
                        TextBox box1 = (TextBox)ListViewQid.Items[rowIndex].FindControl("txtFromValue");
                        TextBox box2 = (TextBox)ListViewQid.Items[rowIndex].FindControl("txtToValue");
                        DropDownList ACCOUNTIDbox = (DropDownList)ListViewQid.Items[rowIndex].FindControl("ddlACCOUNTID");
                        TextBox box3 = (TextBox)ListViewQid.Items[rowIndex].FindControl("txtDescription");
                        DropDownList CostIdbox = (DropDownList)ListViewQid.Items[rowIndex].FindControl("ddlCostId");

                        drCurrentRow = dtCurrentTable.NewRow();

                        drCurrentRow["QidId"] = i + 1;
                        if (box1.Text != "")
                        {
                            drCurrentRow["FromValue"] = box1.Text;
                        }
                        if (box2.Text != "")
                        {
                            drCurrentRow["ToValue"] = box2.Text;
                        }
                        drCurrentRow["ACCOUNTID"] = ACCOUNTIDbox.SelectedValue;
                        if (box3.Text != "")
                        {
                            drCurrentRow["Description"] = box3.Text;
                        }
                        if (CostIdbox.SelectedValue != null)
                        {
                            drCurrentRow["CostId"] = CostIdbox.SelectedValue;
                        }

                        rowIndex++;
                    }
                    dtCurrentTable.Rows.Add(drCurrentRow);
                    ViewState["qidsDetails"] = dtCurrentTable;

                    ListViewQid.DataSource = dtCurrentTable;
                    ListViewQid.DataBind();
                }
            }
            else
            {
                Response.Write("ViewState is null");
            }

            //Set Previous Data on Postbacks
            SetPreviousDataNew();
        }
       
        private void SetPreviousDataNew()
        {
            int rowIndex = 0;
            if (ViewState["qidsDetails"] != null)
            {
                DataTable dt = (DataTable)ViewState["qidsDetails"];
                if (dt.Rows.Count > 0)
                {
                    for (int i = 1; i < dt.Rows.Count; i++)
                    {
                        TextBox box1 = (TextBox)ListViewQid.Items[rowIndex].FindControl("txtFromValue");
                        TextBox box2 = (TextBox)ListViewQid.Items[rowIndex].FindControl("txtToValue");
                        DropDownList ACCOUNTIDbox = (DropDownList)ListViewQid.Items[rowIndex].FindControl("ddlACCOUNTID");
                        TextBox box3 = (TextBox)ListViewQid.Items[rowIndex].FindControl("txtDescription");
                        DropDownList CostIdbox = (DropDownList)ListViewQid.Items[rowIndex].FindControl("ddlCostId");

                        if (dt.Rows[i]["FromValue"] != DBNull.Value)
                        {
                            box1.Text = dt.Rows[i]["FromValue"].ToString();
                        }
                        if (dt.Rows[i]["ToValue"] != DBNull.Value)
                        {
                            box2.Text = dt.Rows[i]["ToValue"].ToString();
                        }
                        if (dt.Rows[i]["Description"] != DBNull.Value)
                        {
                            box3.Text = dt.Rows[i]["Description"].ToString();
                        }
                        ACCOUNTIDbox.SelectedValue = dt.Rows[i]["ACCOUNTID"].ToString();
                        if (dt.Rows[i]["CostId"] != DBNull.Value)
                        {
                            CostIdbox.SelectedValue = dt.Rows[i]["CostId"].ToString();
                        }
                        rowIndex++;

                    }
                }
                // ViewState["CurrentTable"] = dt;

            }
        }
       
        private void SaveData()
        {
            int rowIndex = 0;

            if (ViewState["qidsDetails"] != null)
            {
                double TotalToValue = 0;
                double TotalFromValue = 0;
                DataTable dtCurrentTable = (DataTable)ViewState["qidsDetails"];
                DataRow drCurrentRow = null;
                if (dtCurrentTable.Rows.Count > 0)
                {
                    for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                    {
                        //extract the TextBox values
                        TextBox box1 = (TextBox)ListViewQid.Items[rowIndex].FindControl("txtFromValue");
                        TextBox box2 = (TextBox)ListViewQid.Items[rowIndex].FindControl("txtToValue");
                        DropDownList ACCOUNTIDbox = (DropDownList)ListViewQid.Items[rowIndex].FindControl("ddlACCOUNTID");
                        TextBox box3 = (TextBox)ListViewQid.Items[rowIndex].FindControl("txtDescription");
                        DropDownList CostIdbox = (DropDownList)ListViewQid.Items[rowIndex].FindControl("ddlCostId");
                        TextBox boxQidId = (TextBox)ListViewQid.Items[rowIndex].FindControl("txtqidid");
                        TextBox boxId = (TextBox)ListViewQid.Items[rowIndex].FindControl("txtID");

                        drCurrentRow = dtCurrentTable.NewRow();

                        if (boxQidId.Text != "")
                        {
                            drCurrentRow["QidId"] = boxQidId.Text;
                        }
                        if (boxId.Text != "")
                        {
                            drCurrentRow["Id"] = boxId.Text;
                        }

                        if (box1.Text != "")
                        {
                            drCurrentRow["FromValue"] = box1.Text;
                            TotalFromValue = TotalFromValue + Double.Parse(box1.Text);
                        }
                        if (box2.Text != "")
                        {
                            drCurrentRow["ToValue"] = box2.Text;
                            TotalToValue = TotalToValue + Double.Parse(box2.Text);
                        }
                        drCurrentRow["ACCOUNTID"] = ACCOUNTIDbox.SelectedValue;
                        if (box3.Text != "")
                        {
                            drCurrentRow["Description"] = box3.Text;
                        }
                        if (CostIdbox.SelectedValue != "")
                        {
                            drCurrentRow["CostId"] = CostIdbox.SelectedValue;
                        }

                        txtEnterDate.Text = DateTime.Today.ToString ();
                        rowIndex++;

                          
                          
                            
                            

                        }

                    }

            
                    Boolean Flag = true;
                    if (dtCurrentTable.Rows.Count > 0)
                    {
                     rowIndex = 0;
                    if (TotalToValue != TotalFromValue)
                        {
                            Flag = false;
                        }
                        else
                        {
                            Flag = true;
                        }

                        if (Flag) // check Equal Side
                        {
                            for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                            {
                                //extract the TextBox values

                                TextBox box1 = (TextBox)ListViewQid.Items[rowIndex].FindControl("txtFromValue");
                                TextBox box2 = (TextBox)ListViewQid.Items[rowIndex].FindControl("txtToValue");
                                TextBox boxId = (TextBox)ListViewQid.Items[rowIndex].FindControl("txtID");

                                DropDownList ACCOUNTIDbox = (DropDownList)ListViewQid.Items[rowIndex].FindControl("ddlACCOUNTID");
                                TextBox box3 = (TextBox)ListViewQid.Items[rowIndex].FindControl("txtDescription");
                                DropDownList CostIdbox = (DropDownList)ListViewQid.Items[rowIndex].FindControl("ddlCostId");

                            if (box1.Text != "")
                            {
                                txtFromValue.Text = box1.Text;

                            }
                            else
                            {
                                txtFromValue.Text = "";
                            }

                            if (box2.Text != "")
                            {
                                txtToValue.Text = box2.Text;

                            }
                            else
                            {
                                txtToValue.Text = "";
                            }

                            if (ACCOUNTIDbox.SelectedValue != "")
                            {
                                txtAccountId.Text = ACCOUNTIDbox.SelectedValue;

                            }
                            else
                            {
                                txtAccountId.Text = "";
                            }
                            if (box3.Text != "")
                            {
                                txtDesc.Text = box3.Text;

                            }
                            else
                            {
                                txtDesc.Text = "";
                            }
                            if (CostIdbox.SelectedValue != "")
                            {
                                txtCostId.Text = CostIdbox.Text;

                            }
                            else
                            {
                                txtCostId.Text = "";
                            }
                            if (boxId.Text != "")
                            {
                                txtId.Text = boxId.Text;
                                QidsDetsDS.Update ();
                            }
                            else
                            {

                                QidsDetsDS.Insert();
                            }

                                //get the values from the TextBoxes
                                //then add it to the collections with a comma "," as the delimited values

                                rowIndex++;
                            }
                        }
                        else
                        {
                            ErrorDiv.InnerHtml = "<div class=\"alert alert-danger alert-dismissable\"> <button type=\"button\" class=\"close\" data-bs-dismiss=\"alert\" aria-hidden=\"true\">×</button><h4><i class=\"fa fa-times-circle\"></i> Error</h4>" + Resources.DefaultResource.QidMessageSave + "</div>";
                        }
                        //Call the method for executing inserts
                        //InsertRecords(sc);
                    }
                
            }
        }
   

        protected void ListViewQid_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            try
            {
                switch (e.CommandName)
                {
                    case "NewRecord":
                        ListViewQid.InsertItemPosition = InsertItemPosition.FirstItem;
                        break;
                    case "Cancel":
                        //Hide code
                        ListViewQid.InsertItemPosition = InsertItemPosition.None;
                        break;
                    case "UnSelect":
                        ListViewQid.SelectedIndex = -1;
                        break;
                    case "Select":
                        ListViewQid.InsertItemPosition = InsertItemPosition.None;
                        
                        break;
                    case "Update":


                        ListViewQid.InsertItemPosition = InsertItemPosition.None;
                        break;

                    case "Insert":

                        ListViewQid.InsertItemPosition = InsertItemPosition.None;
                        break;
                }
            }
            catch (Exception ex)
            {
                ErrorDiv.InnerHtml = "<div class=\"alert alert-danger alert-dismissable\"> <button type=\"button\" class=\"close\" data-bs-dismiss=\"alert\" aria-hidden=\"true\">×</button><h4><i class=\"fa fa-times-circle\"></i> Error</h4>" + ex.Message.ToString() + "</div>";

            }
        }

        protected void AddQidDetLinkButton_Click(object sender, EventArgs e)
        {
            //if (ListViewQid.InsertItemPosition != InsertItemPosition.FirstItem)
            //{
            //    ListViewQid.InsertItemPosition = InsertItemPosition.FirstItem;

            //}
            AddNewRowToList();
        }

        protected void SaveDataBtn_Click(object sender, EventArgs e)
        {
            SaveData();
        }

        protected void lv_SelectedIndexChanged(object sender, EventArgs e)
        {
            

            //ListView ListView1 = (ListView)lv.Items[lv.SelectedIndex].TemplateControl.FindControl("ListView1");
            ////Int64 requestId = Int64.Parse(lv.SelectedDataKey.Value.ToString());
            ////ListView ListView1 = (ListView)dataItem.FindControl("ListView1");

            //DataTable dt = (DataTable)ViewState["qidsDetails"];
            //ListView1.DataSource = dt;
            //ListView1.DataBind();

        }

       

        protected void lv_SelectedIndexChanging1(object sender, ListViewSelectEventArgs e)
        {
            //ListView ListViewtt = (ListView)lv.Items[e.NewSelectedIndex].FindControl("lv1");
            //DataTable dt = (DataTable)ViewState["qidsDetails"];
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {

        }

        protected void QidsDetsDS_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
        {

        }

        protected void lv_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            // Hidding Action buttons in case not assigend  
            LinkButton EditLinkButton = (LinkButton)e.Item.FindControl("EditLinkButton");
            LinkButton DeleteLinkButton = (LinkButton)e.Item.FindControl("DeleteLinkButton");
            //if (Updating != "True") { EditLinkButton.Visible = false; }
            //if (Deleting != "True") { DeleteLinkButton.Visible = false; }
            if (lv.InsertItem != null)
            {
                TextBox tb = (TextBox)lv.InsertItem.FindControl("qidDateTextBox");
                tb.Text = DateTime.Today.ToShortDateString();
            }
           

        }
        protected void NewRecord_Click(object sender, EventArgs e)
        {
            if (lv.InsertItemPosition != InsertItemPosition.FirstItem)
            {
                lv.InsertItemPosition = InsertItemPosition.FirstItem;
                
                //Label ImageNameLabel = (Label)lv.EditItem.FindControl("ImageNameLabel");
            }
        }

        protected void ClearLinkButton_Click(object sender, EventArgs e)
        {
            //SearchTextBox.Text = "";
            lv.DataBind();

        }

        protected void lv_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            try
            {
                switch (e.CommandName)
                {
                    case "NewRecord":
                        lv.InsertItemPosition = InsertItemPosition.FirstItem;
                        break;
                    case "Cancel":
                        //Hide code
                        lv.InsertItemPosition = InsertItemPosition.None;
                        break;
                    case "UnSelect":
                        lv.SelectedIndex = -1;
                        break;
                    case "select":
                        //lv.InsertItemPosition = InsertItemPosition.None;

                        //if (lv.SelectedIndex >= 0)
                        //{
                            //Get the item object.
                        ListViewDataItem dataItem = (ListViewDataItem)e.Item;

                        //if (dataItem.DisplayIndex == lv.SelectedIndex)
                        //{
                        string QidID = e.CommandArgument.ToString();
                        txtQidId.Value = QidID;
                        LoadDetData();
                        //if (lv.SelectedIndex > -1)
                        //{
                        //    string QidID = lv.DataKeys[lv.SelectedIndex].Value.ToString();
                        //}



                        break;
                    case "Update":


                        lv.InsertItemPosition = InsertItemPosition.None;
                        break;

                    case "Insert":

                        lv.InsertItemPosition = InsertItemPosition.None;
                        break;
                }
            }
            catch (Exception ex)
            {
                ErrorDiv.InnerHtml = "<div class=\"alert alert-danger alert-dismissable\"> <button type=\"button\" class=\"close\" data-bs-dismiss=\"alert\" aria-hidden=\"true\">×</button><h4><i class=\"fa fa-times-circle\"></i> Error</h4>" + ex.Message.ToString() + "</div>";

            }
        }
    }
}