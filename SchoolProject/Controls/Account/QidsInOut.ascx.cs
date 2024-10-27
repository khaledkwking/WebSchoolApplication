using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace WebSchool.Controls.Account
{
    public partial class QidsInOut : System.Web.UI.UserControl
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
            int TypeId = 0;
            if (Request.QueryString["TypeId"] != null)
            {
                TypeId = int.Parse(Request.QueryString["TypeId"].ToString());
            }
            txtTypeId.Value = TypeId.ToString();
            int USERID = int.Parse(cookieUserId.Value.ToString());// int.Parse(Session["UserID"].ToString());

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

                //lv.SelectedIndex = 0;
                DataView V = (DataView)QidsDS.Select();
                ChangePaymentType();
                //if (V.Count > 0)
                //{
                //    string QidID =  V[0]["qidid"].ToString ();
                //    txtQidId.Value = QidID;
                //    LoadDetData();
                // }


            }


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
            //if (lv.InsertItemPosition != InsertItemPosition.FirstItem)
            //{
            //    lv.InsertItemPosition = InsertItemPosition.FirstItem;

            //    //Label ImageNameLabel = (Label)lv.EditItem.FindControl("ImageNameLabel");
            //}



            //Do the database lookup using the ID...
            //gvDetails.DataSource = new List<string> { "Customer Surname", "Customer Phone", "Customer Address" };
            //gvDetails.DataBind();
            ErrorDetDiv.Visible = true;
            DAL.ERPAssetDataSet.QidDetailsDataTable dtCurrentTable = new DAL.ERPAssetDataSet.QidDetailsDataTable();
            dtCurrentTable = (DAL.ERPAssetDataSet.QidDetailsDataTable)ViewState["qidsDetails"];
            if (dtCurrentTable != null)
            {
                dtCurrentTable.Rows.Clear();

            }
            ListViewQid.DataSource = dtCurrentTable;
            ListViewQid.DataBind();
            int TypeId = 0;
            if (Request.QueryString["TypeId"] != null)
            {
                TypeId = int.Parse(Request.QueryString["TypeId"].ToString());
            }
            BOL.Qids DA = new BOL.Qids();
            DAL.ERPAssetDataSet.QidsDataTable dt = new DAL.ERPAssetDataSet.QidsDataTable();
            long QidId = long.Parse(txtQidId.Value);
            long OrgId = long.Parse(txtOrgId.Text);
            int repeated = 3;
           
            dt = DA.Read("2", "", "", TypeId, 0, OrgId, 0, 0, repeated, "");
            if (dt.Count > 0)
            {
                int Serial = int.Parse(dt[0]["QidSerial"].ToString()) + 1;
                QidCodeTextBox.Text = Serial.ToString();
                txtQidSerial.Value = Serial.ToString();
            }
            else
            {
                QidCodeTextBox.Text = "1";
                txtQidSerial.Value ="1";
            }
            TextBoxNotes.Text = "";
            EmpNoTextBox.Text = "";
            txtTypeId.Value = TypeId.ToString();
            //BranchIdDropDownList.SelectedValue = 0;
            EnterqidDateTextBox.Text = DateTime.Today.ToShortDateString();

            txtQidId.Value = "0";
            AddNewRowToList();
            TotalSum();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "showPopup();", true);
            
           

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
                        //ListViewDataItem dataItem = (ListViewDataItem)e.Item;

                        ////if (dataItem.DisplayIndex == lv.SelectedIndex)
                        ////{
                        //string QidID = e.CommandArgument.ToString();
                        //txtQidId.Value = QidID;

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
                    case "ViewDetails":

                        int id = Int32.Parse(e.CommandArgument.ToString());

                        txtQidId.Value = id.ToString();
                    
                        LoadDetData();

                        //Do the database lookup using the ID...
                        //gvDetails.DataSource = new List<string> { "Customer Surname", "Customer Phone", "Customer Address" };
                        //gvDetails.DataBind();
                        TotalSum();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "showPopup();", true);
                        break;
                }
            }
            catch (Exception ex)
            {
                ErrorDiv.InnerHtml = "<div class=\"alert alert-warning alert-dismissable\"> <h4><i class=\"fa fa-times-circle\"></i> </h4>" + ex.Message.ToString() + "</div>";

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
        private void LoadDetData()
        {
            ErrorDetDiv.Visible = false;
            BOL.Qids DA = new BOL.Qids();

            DAL.ERPAssetDataSet.QidsDataTable dt = new DAL.ERPAssetDataSet.QidsDataTable();
            long QidId = long.Parse(txtQidId.Value);
            int TypeId = 0;
            if (Request.QueryString["TypeId"] != null)
            {
                 TypeId = int.Parse(Request.QueryString["TypeId"].ToString());
            }
            int repeated = 3;
            
            dt = DA.Read("1", "", "", TypeId, QidId, 0, 0, 0, repeated, "");


            //DataView QV = (DataView)QidsDsParam.Select();
            if (dt.Count > 0)
            {
                QidCodeTextBox.Text = dt[0]["qidcode"].ToString();
                TextBoxNotes.Text = dt[0]["Notes"].ToString();
                txtQidSerial.Value = dt[0]["QidSerial"].ToString();
                if (dt[0]["qidDate"] != DBNull.Value)
                {
                    EnterqidDateTextBox.Text = DateTime.Parse(dt[0]["qidDate"].ToString()).ToString("dd/MM/yyyy");
                }
                BranchIdDropDownList.SelectedValue = dt[0]["BranchId"].ToString();
                EmpNoTextBox.Text = dt[0]["EmpName"].ToString();
            }

            //DataView v = (DataView)QidsDetsDS.Select();

            BOL.qidsDetails DA2 = new BOL.qidsDetails();

            DAL.ERPAssetDataSet.QidDetailsDataTable dt2 = new DAL.ERPAssetDataSet.QidDetailsDataTable();

            dt2 = DA2.Read("1", "", "", TypeId, QidId, 0, 0, 0, 0,1,0,0,0, "");


            if (dt2.Count > 0)
            {
                ViewState["qidsDetails"] = (DataTable)dt2;
                DataTable dtCurrentTable = (DataTable)ViewState["qidsDetails"];
               

                ListViewQid.DataSource = dtCurrentTable;
                ListViewQid.DataBind();
            }
        }
        protected void SaveDataBtn_Click(object sender, EventArgs e)
        {
            SaveData();
        }

        protected void AddLinkButton_Command(object sender, CommandEventArgs e)
        {

        }

        protected void DropDownListPaymentType_SelectedIndexChanged(object sender, EventArgs e)
        {
            ChangePaymentType();
            TotalSum();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "showPopup();", true);
        }
       void  ChangePaymentType()
        {
            if (DropDownListPaymentType.SelectedValue.ToString() == Messages.BoxValue.ToString())
            {
                txtBoxAccountId.Text = Messages.boxAccid.ToString();
                ChequeNoTextBox.Visible = false;
                lblChequeNo.Visible = false;
                lblBank.Text = Resources.DefaultResource.BoxTitle;

            }
            else if (DropDownListPaymentType.SelectedValue.ToString() == Messages.BankValue.ToString())
            {
                txtBoxAccountId.Text = Messages.bankaccid.ToString();
                ChequeNoTextBox.Visible = true;
                lblChequeNo.Visible =true;
                lblBank.Text = Resources.DefaultResource.BankTitle;
            }
            else if (DropDownListPaymentType.SelectedValue.ToString() == Messages.KeyNetValue.ToString())
            {
                txtBoxAccountId.Text = Messages.KeyNetaccid.ToString();
                ChequeNoTextBox.Visible = true;
                lblChequeNo.Visible = true;
                lblBank.Text = Resources.DefaultResource.BankTitle;
            }
            AccountDSBankOrBox.Select();
            DropDownListBankOrBox.DataBind();
            //DropDownListBankOrBox.DataBind();
           
        }
        protected void ListViewQid_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            //HtmlControl td = (HtmlControl)e.Item.FindControl("ThFormvalue");
            //td.Visible = false;
        }

        protected void ListViewQid_DataBound(object sender, EventArgs e)
        {
            //ListViewQid.FindControl("ThFormvalue").Visible = false;
        }

        protected void ListViewQid_LayoutCreated(object sender, EventArgs e)
        {
            if (Request.QueryString["TypeId"].ToString() == GLibrary.strarrQidTypes[5, 0].ToString()) // out qid سند صرف
            {
                this.ListViewQid.FindControl("ThFormvalue").Visible = false;
            }
            if (Request.QueryString["TypeId"].ToString() == GLibrary.strarrQidTypes[6, 0].ToString()) // in qid  سند قبض
            {
                this.ListViewQid.FindControl("ThTovalue").Visible = false;
            }
            
        }

        private void SaveData()
        {
            if (ViewState["qidsDetails"] != null)
            { 
                int rowIndex = 0;
                DropDownList txtAccountId = (DropDownList)ListViewQid.Items[rowIndex].FindControl("ddlACCOUNTID");
                if (txtAccountId.Text != "")
                {
                    ErrorDetDiv.Visible = false;

                    BOL.Qids dt = new BOL.Qids();
                    DAL.ERPAssetDataSet.QidsDataTable dtQid = new DAL.ERPAssetDataSet.QidsDataTable();
                    int TypeId = 0;
                    if (Request.QueryString["TypeId"] != null)
                    {
                        TypeId = int.Parse(Request.QueryString["TypeId"].ToString());
                    }

                    string QidDate = "";
                    if (EnterqidDateTextBox.Text != "")
                    {
                        QidDate = DateTime.Parse(EnterqidDateTextBox.Text).ToShortDateString();
                    }
                    string QidCode = QidCodeTextBox.Text;
                    long QidId = long.Parse(txtQidId.Value);
                    long BranchId = 0;
                    HttpCookie cookieOrgId = HttpContext.Current.Request.Cookies.Get("OrgId");
                    HttpCookie cookieUserId = HttpContext.Current.Request.Cookies.Get("UserId");
                    int USERID = int.Parse(cookieUserId.Value.ToString());
                    long QrgId = long.Parse(cookieOrgId.Value.ToString());
                    long BankAccId = long.Parse(DropDownListBankOrBox.SelectedValue.ToString());
                    string ChequeNo = ChequeNoTextBox.Text;
                    int PaymentType = 0;
                    if (BranchIdDropDownList.SelectedValue != null)
                    {
                        BranchId = long.Parse(BranchIdDropDownList.SelectedValue.ToString());
                    }
                    if (DropDownListPaymentType.SelectedValue != null)
                    {
                        PaymentType = int.Parse(DropDownListPaymentType.SelectedValue.ToString());
                    }

                    int? CurQidId = 0;



                    if (txtQidId.Value != "0")
                    {
                        dt.DML("2", QidId, QidCode, QidDate, TextBoxNotes.Text, TypeId, BranchId, QrgId, 0, false, BankAccId, ChequeNo, 0, 0, PaymentType, "", USERID, USERID, USERID, "", ref CurQidId);
                    }
                    else
                    {
                        dt.DML("1", QidId, QidCode, QidDate, TextBoxNotes.Text, TypeId, BranchId, QrgId, 0, false, BankAccId, ChequeNo, 0, 0, PaymentType, "", USERID, USERID, USERID, "", ref CurQidId);
                        txtQidId.Value = CurQidId.ToString();
                    }


                    decimal TotalToValue = 0;
                    decimal TotalFromValue = 0;
                    DataRow drCurrentRow = null;
                    DataTable dtCurrentTable = new DataTable();

                    dtCurrentTable = (DataTable)ViewState["qidsDetails"];
                    dtCurrentTable.Rows.Clear();

                    int QidType = 0;
                    if (Request.QueryString["TypeId"] != null)
                    {
                        QidType = int.Parse(Request.QueryString["TypeId"].ToString());
                    }
                    if (ListViewQid.Items.Count > 0)
                    {
                        for (int i = 0; i < ListViewQid.Items.Count; i++)
                        {
                            //extract the TextBox values
                            TextBox box1 = (TextBox)ListViewQid.Items[rowIndex].FindControl("txtFromValue");
                            TextBox box2 = (TextBox)ListViewQid.Items[rowIndex].FindControl("txtToValue");
                            DropDownList ACCOUNTIDbox = (DropDownList)ListViewQid.Items[rowIndex].FindControl("ddlACCOUNTID");
                            //TextBox box3 = (TextBox)ListViewQid.Items[rowIndex].FindControl("txtDescription");
                            DropDownList CostIdbox = (DropDownList)ListViewQid.Items[rowIndex].FindControl("ddlCostId");
                            TextBox boxQidId = (TextBox)ListViewQid.Items[rowIndex].FindControl("txtqidid");
                            TextBox boxId = (TextBox)ListViewQid.Items[rowIndex].FindControl("txtID");
                            TextBox txtInvId = (TextBox)ListViewQid.Items[rowIndex].FindControl("txtInvId");
                            TextBox txtTypeId = (TextBox)ListViewQid.Items[rowIndex].FindControl("txtTypeId");

                            drCurrentRow = dtCurrentTable.NewRow();

                            if (boxQidId.Text != "")
                            {
                                drCurrentRow["QidId"] = txtQidId.Value;
                            }
                            if (boxId.Text != "")
                            {
                                drCurrentRow["Id"] = boxId.Text;
                            }
                            if (txtInvId.Text != "")
                            {
                                drCurrentRow["InvId"] = txtInvId.Text;
                            }

                            if (txtTypeId.Text != "")
                            {
                                drCurrentRow["QidType"] = txtTypeId.Text;
                            }

                            if (box1.Text != "")
                            {
                                drCurrentRow["FromValue"] = box1.Text;
                                TotalFromValue = TotalFromValue + decimal.Parse(box1.Text);
                            }
                            if (box2.Text != "")
                            {
                                drCurrentRow["ToValue"] = box2.Text;
                                TotalToValue = TotalToValue + decimal.Parse(box2.Text);
                            }
                            if (ACCOUNTIDbox.SelectedValue != null)
                            {
                                if (ACCOUNTIDbox.SelectedValue.ToString() != "")
                                {
                                    drCurrentRow["ACCOUNTID"] = ACCOUNTIDbox.SelectedValue.ToString();
                                }
                                else
                                {
                                    drCurrentRow["ACCOUNTID"] = DBNull.Value;
                                }
                            }

                            drCurrentRow["Notes"] = TextBoxNotes.Text;

                            if (CostIdbox.SelectedValue != null)
                            {
                                if (CostIdbox.SelectedValue.ToString() != "")
                                {
                                    drCurrentRow["CostId"] = CostIdbox.SelectedValue.ToString();
                                }
                            }

                            txtEnterDate.Text = DateTime.Today.ToString();
                            dtCurrentTable.Rows.Add(drCurrentRow);
                            rowIndex++;
                        }

                    }


                    Boolean Flag = true;
                    long CostId = 0;
                    if (dtCurrentTable.Rows.Count > 0)
                    {
                        rowIndex = 0;
                        //if (TotalToValue != TotalFromValue)
                        //{
                        //    Flag = false;
                        //}
                        //else
                        //{
                        //    Flag = true;
                        //}

                        if (Flag) // check Equal Side
                        {
                            BOL.qidsDetails dtDet = new BOL.qidsDetails();
                            for (int i = 0; i < dtCurrentTable.Rows.Count; i++)
                            {
                                //extract the TextBox values

                                decimal FromValue = 0;
                                decimal ToValue = 0;

                                long AccountId = 0;

                                TextBox box1 = (TextBox)ListViewQid.Items[rowIndex].FindControl("txtFromValue");
                                TextBox box2 = (TextBox)ListViewQid.Items[rowIndex].FindControl("txtToValue");
                                TextBox boxId = (TextBox)ListViewQid.Items[rowIndex].FindControl("txtID");
                                TextBox txtIdInv = (TextBox)ListViewQid.Items[rowIndex].FindControl("txtInvId");
                                TextBox txtTypeId = (TextBox)ListViewQid.Items[rowIndex].FindControl("txtTypeId");

                                DropDownList ACCOUNTIDbox = (DropDownList)ListViewQid.Items[rowIndex].FindControl("ddlACCOUNTID");
                                //TextBox box3 = (TextBox)ListViewQid.Items[rowIndex].FindControl("txtDescription");
                                DropDownList CostIdbox = (DropDownList)ListViewQid.Items[rowIndex].FindControl("ddlCostId");


                                if (box1.Text != "")
                                {
                                    txtFromValue.Text = box1.Text;
                                    FromValue = decimal.Parse(txtFromValue.Text);
                                    //TotalFromValue = TotalFromValue + FromValue;
                                }
                                else
                                {
                                    txtFromValue.Text = "";
                                }

                                if (box2.Text != "")
                                {
                                    txtToValue.Text = box2.Text;
                                    ToValue = decimal.Parse(txtToValue.Text);
                                    //TotalFromValue = TotalFromValue + FromValue;
                                }
                                else
                                {
                                    txtToValue.Text = "";
                                }

                                if (ACCOUNTIDbox.SelectedValue != "")
                                {
                                    txtAccountId.Text = ACCOUNTIDbox.SelectedValue;
                                    AccountId = long.Parse(txtAccountId.Text);
                                }
                                else
                                {
                                    txtAccountId.Text = "";
                                }

                                txtDesc.Text = TextBoxNotes.Text;


                                if (CostIdbox.SelectedValue != "")
                                {
                                    txtCostId.Text = CostIdbox.Text;
                                    CostId = long.Parse(txtCostId.Text);
                                }
                                else
                                {
                                    txtCostId.Text = "";
                                }

                                QidId = long.Parse(txtQidId.Value);
                                //int QidType = int.Parse(GLibrary.strarrQidTypes[0, 0]);



                                if (txtIdInv.Text != "-1")
                                {
                                    txtId.Text = boxId.Text;
                                    long Id = long.Parse(txtId.Text);

                                    dtDet.DML("2", Id, QidId, FromValue, ToValue, AccountId, 1, TextBoxNotes.Text, QidDate, 1, QidType, 0, 0, CostId, USERID, USERID, USERID);

                                    //QidsDetsDS.Update();
                                    txtIdInv.Text = "";
                                }
                                else
                                {
                                    dtDet.DML("1", 0, QidId, FromValue, ToValue, AccountId, 1, TextBoxNotes.Text, QidDate, 1, QidType, 0, 0, CostId, USERID, USERID, USERID);

                                }

                                //get the values from the TextBoxes
                                //then add it to the collections with a comma "," as the delimited values

                                rowIndex++;
                            }
                            DAL.ERPAssetDataSet.QidDetailsDataTable Tbl = dtDet.Read("", "", "", QidType, QidId, 0, 0, 0, 0, 2,0,0,0, "");
                            if (Tbl.Count > 0)
                            {
                                DataRow UserRow = Tbl.Rows[0];
                                long CurId = long.Parse(UserRow["Id"].ToString());
                                dtDet.DML("2", CurId, QidId, TotalToValue, TotalFromValue, BankAccId, 1, TextBoxNotes.Text, QidDate, 2, QidType, 0, 0, CostId, USERID, USERID, USERID);
                            }
                            else
                            {
                                dtDet.DML("1", 0, QidId, TotalToValue, TotalFromValue, BankAccId, 1, TextBoxNotes.Text, QidDate, 2, QidType, 0, 0, CostId, USERID, USERID, USERID);
                            }
                        }

                        else
                        {
                            ErrorDetDiv.Visible = true;
                            ErrorDetDiv.InnerHtml = "<div class=\"alert alert-warning alert-dismissable\"> <h5><i class=\"fa fa-times-circle\"></i> </h5>" + Resources.DefaultResource.QidMessageSave + "</div>";
                            TotalSum();
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "showPopup();", true);
                        }
                        //Call the method for executing inserts
                        //InsertRecords(sc);
                        lv.DataBind();
                    }
                }
                else
                {
                    ErrorDetDiv.Visible = true;
                    ErrorDetDiv.InnerHtml = "<div class=\"alert alert-warning alert-dismissable\"> <h5><i class=\"fa fa-times-circle\"></i> </h5>" + Resources.DefaultResource.EmptyQidMsg + "</div>";
                    //TotalSum();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "showPopup();", true);
                }
            }
        }

        protected void PrintButton_Click(object sender, EventArgs e)
        {

        }

        private void AddNewRowToList()
        {
            int rowIndex = 0;
            DataRow drCurrentRow = null;
            //DataTable dtCurrentTable = new DataTable() ;
            ErrorDetDiv.Visible = false;
            DAL.ERPAssetDataSet.QidDetailsDataTable dtCurrentTable = new DAL.ERPAssetDataSet.QidDetailsDataTable();
            Boolean ReqFlag = true;
            
            if (ViewState["qidsDetails"] != null)
            {

                dtCurrentTable = (DAL.ERPAssetDataSet.QidDetailsDataTable)ViewState["qidsDetails"];
                dtCurrentTable.Rows.Clear();


                if (ListViewQid.Items.Count > 0)
                {
                    for (int i = 0; i < ListViewQid.Items.Count; i++)
                    {
                        //extract the TextBox values
                        TextBox box1 = (TextBox)ListViewQid.Items[rowIndex].FindControl("txtFromValue");
                        TextBox box2 = (TextBox)ListViewQid.Items[rowIndex].FindControl("txtToValue");
                        DropDownList ACCOUNTIDbox = (DropDownList)ListViewQid.Items[rowIndex].FindControl("ddlACCOUNTID");
                        //TextBox box3 = (TextBox)ListViewQid.Items[rowIndex].FindControl("txtDescription");
                        DropDownList CostIdbox = (DropDownList)ListViewQid.Items[rowIndex].FindControl("ddlCostId");
                        TextBox txtID = (TextBox)ListViewQid.Items[rowIndex].FindControl("txtID");
                        TextBox txtInvId = (TextBox)ListViewQid.Items[rowIndex].FindControl("txtInvId");

                        drCurrentRow = dtCurrentTable.NewRow();

                        drCurrentRow["QidId"] = txtQidId.Value; //'i + 1;
                        if (box1.Text != "")
                        {
                            drCurrentRow["FromValue"] = box1.Text;
                        }
                        if (box2.Text != "")
                        {
                            drCurrentRow["ToValue"] = box2.Text;
                        }
                        if (!GLibrary.IsNumeric(box1.Text) && !GLibrary.IsNumeric(box2.Text))
                        {
                            ReqFlag = false;
                        }

                        if (GLibrary.IsNumeric(box1.Text) && GLibrary.IsNumeric(box2.Text))
                        {
                            ReqFlag = false;
                        }

                        if (ACCOUNTIDbox.SelectedValue != "")
                        {
                            drCurrentRow["ACCOUNTID"] = ACCOUNTIDbox.SelectedValue;

                        }
                        else
                        {
                            ReqFlag = false;
                        }

                        drCurrentRow["Description"] = TextBoxNotes.Text;
                        drCurrentRow["Description"] = txtTypeId.Value;
                        drCurrentRow["ID"] = txtID.Text;
                        if (txtInvId.Text != "")
                        {
                            drCurrentRow["InvId"] = txtInvId.Text;
                        }

                        if (CostIdbox.SelectedValue != null)
                        {
                            if (CostIdbox.SelectedValue.ToString() != "")
                            {
                                drCurrentRow["CostId"] = CostIdbox.SelectedValue;
                            }
                        }

                        rowIndex++;
                        dtCurrentTable.Rows.Add(drCurrentRow);
                    }
                }




            }
            else
            {
                Response.Write("ViewState is null");
            }
            if (ReqFlag)
            {
                BOL.qidsDetails DA = new BOL.qidsDetails();
                drCurrentRow = dtCurrentTable.NewRow();
                drCurrentRow["qidid"] = txtQidId.Value;
                int index = 0;

                drCurrentRow["InvId"] = -1;
                drCurrentRow["QidType"] = txtTypeId.Value;

                Random rad = new Random();
                int Id = rad.Next();
                drCurrentRow["ID"] = Id;
                dtCurrentTable.Rows.Add(drCurrentRow);


                ViewState["qidsDetails"] = dtCurrentTable;

                ListViewQid.DataSource = dtCurrentTable;
                ListViewQid.DataBind();
                if (dtCurrentTable.Rows.Count >= 1)
                {
                    index = dtCurrentTable.Rows.Count - 1;
                }
                TextBox txtInvId1 = (TextBox)ListViewQid.Items[index].FindControl("txtInvId");
                txtInvId1.Text = "-1";
            }
            else
            {
                ErrorDetDiv.Visible = true;
                ErrorDetDiv.InnerHtml = "<div class=\"alert alert-warning alert-dismissable\"> <h4><i class=\"fa fa-times-circle\"></i> </h4>" + Resources.DefaultResource.QidInvalidMesssage + "</div>";
            }
            TotalSum();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "showPopup();", true);

            //Set Previous Data on Postbacks

            // SetPreviousDataNew();

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
                    case "ItemDelete":
                        ErrorDetDiv.Visible = false;
                        if (ViewState["qidsDetails"] != null)
                        {

                            DataTable dt = (DataTable)ViewState["qidsDetails"];
                            if (dt.Rows.Count > 0)
                            {
                                int index = e.Item.DataItemIndex;
                                if (dt.Rows[index]["InvId"].ToString() != "-1")
                                {
                                    HttpCookie cookieUserId = HttpContext.Current.Request.Cookies.Get("UserId");
                                    int USERID = int.Parse(cookieUserId.Value.ToString());
                                    int Id = int.Parse(dt.Rows[index]["Id"].ToString());
                                    BOL.qidsDetails dtDet = new BOL.qidsDetails();
                                    dtDet.DML("3", Id, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, USERID, USERID, USERID);

                                }

                                dt.Rows.RemoveAt(index);
                                ListViewQid.DataSource = dt;
                                ListViewQid.DataBind();

                            }
                        }
                        TotalSum();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "showPopup();", true);
                        //ListViewQid.InsertItemPosition = InsertItemPosition.None;
                        break;
                   


                }
            }
            catch (Exception ex)
            {
                ErrorDiv.InnerHtml = "<div class=\"alert alert-warning alert-dismissable\"> <h4><i class=\"fa fa-times-circle\"></i> </h4>" + ex.Message.ToString() + "</div>";

            }
        }
        void TotalSum()
        {
            double TotalFromValue = 0;
            double TotalToValue = 0;

            if (ListViewQid.Items.Count > 0)
            {
                for (int i = 0; i < ListViewQid.Items.Count; i++)
                {
                    //extract the TextBox values
                    TextBox box1 = (TextBox)ListViewQid.Items[i].FindControl("txtFromValue");
                    TextBox box2 = (TextBox)ListViewQid.Items[i].FindControl("txtToValue");


                    if (box1.Text != "")
                    {

                        TotalFromValue = TotalFromValue + Double.Parse(box1.Text);
                    }
                    if (box2.Text != "")
                    {

                        TotalToValue = TotalToValue + Double.Parse(box2.Text);
                    }
                }
                if (Request.QueryString["TypeId"].ToString() == GLibrary.strarrQidTypes[5, 0].ToString()) // out qid سند صرف
                {
                    Total.Text = TotalToValue.ToString();
                   
                }
                if (Request.QueryString["TypeId"].ToString() == GLibrary.strarrQidTypes[6, 0].ToString()) // in qid  سند قبض
                {
                    Total.Text = TotalFromValue.ToString();
                }
               
            }
        }
    }
}