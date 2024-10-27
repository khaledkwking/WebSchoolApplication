using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace WebSchool.Admin.controls.School
{
    [System.Web.Script.Services.ScriptService]
    public partial class Sch_InvoicesList : System.Web.UI.UserControl
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
                previousUrl = "Main.aspx";
            }

           
            int USERID = int.Parse(Session["UserId"].ToString());// int.Parse(Session["UserID"].ToString());

            if (Session["OrgId"] != null)
            {
                txtOrgId.Text = Session["OrgId"].ToString();
            }

            BOL.UsersPages DA = new BOL.UsersPages();
            DAL.UsersPages.UsersPagesDataTable dt = new DAL.UsersPages.UsersPagesDataTable();

            dt = DA.Read("1", USERID, 5, "");
            if (dt.Rows.Count > 0)
            {
                DataRow UserRow = dt.Rows[0];
                Accessing = UserRow["Accessing"].ToString();
                Adding = UserRow["Adding"].ToString();
                Updating = UserRow["Updating"].ToString();
                Deleting = UserRow["Deleting"].ToString();
                Importing = UserRow["Importing"].ToString();

                // checking the access  
                if (Accessing != "True") { Response.Redirect("~/NoAccess.aspx?URL=" + previousUrl); }
                // checking the insert privlage 
                if (Adding != "True") { NewRecord.Visible = false; }
            }
            else
            {
                Response.Redirect("~/NoAccess.aspx?URL=" + previousUrl);
            }

            if (!Page.IsPostBack)
            {

                //lv.SelectedIndex = 0;
                StartDateTextBox.Text = DateTime.Today.ToShortDateString();
                EndDateTextBox.Text = DateTime.Today.ToShortDateString();

                FromDateTextBox.Text = DateTime.Today.ToShortDateString();
                ToDateTextBox.Text = DateTime.Today.ToShortDateString();
               
                if (Request.QueryString["StudentId"] != null)
                {
                    // V = (DataView)StudentsDS.Select();
                    //DropDownListStudent.DataBind();
                    DropDownListStudent.SelectedValue = Request.QueryString["StudentId"].ToString();
                }

                if (Request.QueryString["InvId"] != null)
                {
                    // V = (DataView)StudentsDS.Select();
                    InvoicesDS.SelectParameters["InvId"].DefaultValue = Request.QueryString["InvId"].ToString();
                    StartDateTextBox.Text = "";
                    EndDateTextBox.Text = "";
                }

                PeriodIdTextBox.Text = "-1";
               
                GetAllSum();
                //if (V.Count > 0)
                //{
                //    string QidID =  V[0]["qidid"].ToString ();
                //    txtQidId.Value = QidID;
                //    LoadDetData();
                // }


            }
            else
            {
                InvoicesDS.SelectParameters["InvId"].DefaultValue ="";
            }





        }

     private void GetAllSum()
      {
            DataView V;
            V = (DataView) InvoicesDS.Select();
        decimal total = 0;
        decimal Payment = 0;
        decimal Remain = 0;
                for (int i = 0; i<V.Count; i++)
                {
                    string strtotal = V[i]["InvTotalNet"].ToString();
        string strPayment = V[i]["InvPayment"].ToString();
        string strRemain = V[i]["InvRemain"].ToString();
                    if (!string.IsNullOrEmpty(strtotal))
                    {
                        total = total + decimal.Parse(strtotal);
    }
                    if (!string.IsNullOrEmpty(strPayment))
                    {
                        Payment = Payment + decimal.Parse(strPayment);
}
if (!string.IsNullOrEmpty(strRemain))
{
    Remain = Remain + decimal.Parse(strRemain);
}

                }
                lblPayment.Text = decimal.Round(Payment, 3).ToString();
                lblRemain.Text = decimal.Round(Remain, 3).ToString();
                lblTotal.Text = decimal.Round(total, 3).ToString();
            }

            protected void lv_ItemDataBound(object sender, ListViewItemEventArgs e)
            {
                // Hidding Action buttons in case not assigend  
                LinkButton EditLinkButton = (LinkButton)e.Item.FindControl("EditLinkButton");
                LinkButton DeleteLinkButton = (LinkButton)e.Item.FindControl("DeleteLinkButton");

                if (Updating != "True") { EditLinkButton.Visible = false; }
                if (Deleting != "True") { DeleteLinkButton.Visible = false; }

            LinkButton PaymentButton = (LinkButton)e.Item.FindControl("PaymentButton");
            LinkButton ReturnButton = (LinkButton)e.Item.FindControl("ReturnButton");

            BOL.UsersPages DA = new BOL.UsersPages();
            DAL.UsersPages.UsersPagesDataTable dt = new DAL.UsersPages.UsersPagesDataTable();
            int USERID = int.Parse(Session["UserId"].ToString());

            dt = DA.Read("1", USERID, 7, ""); // صلاحية التحصيل
            if (dt.Rows.Count > 0)
            {
                DataRow UserRow = dt.Rows[0];
                Accessing = UserRow["Accessing"].ToString();
                if (Accessing != "True") 
                {
                    PaymentButton.Visible = false;
                }
                else
                {
                    PaymentButton.Visible = true;
                }
            }
           

            dt = DA.Read("1", USERID, 8, ""); // صلاحية الاستراجاع
            if (dt.Rows.Count > 0)
            {
                DataRow UserRow = dt.Rows[0];
                Accessing = UserRow["Accessing"].ToString();
                if (Accessing != "True")
                {
                    ReturnButton.Visible = false;
                }
                else
                {
                    ReturnButton.Visible = true;
                }
               
            }
           


            if (lv.InsertItem != null)
                {
                    TextBox tb = (TextBox)lv.InsertItem.FindControl("qidDateTextBox");
                    tb.Text = DateTime.Today.ToShortDateString();
                }



            }
       
        [WebMethod]
        public static void GetReport()
        {
           
            DAL.School.Sch_InvoicesDetailsDataTable dtCurrentTable = new DAL.School.Sch_InvoicesDetailsDataTable();
            //dtCurrentTable = (DAL.School.Sch_InvoicesDetailsDataTable)ViewState["Sch_InvDetails"];
            if (dtCurrentTable != null)
            {
                dtCurrentTable.Rows.Clear();

            }
            // Your code here
        }
        [System.Web.Services.WebMethod]
        
        //[HttpPost]
        //public JsonResult SetItemCats(string type, int value)
        //{
        //    return Json("");
        //}
            protected void NewRecord_Click(object sender, EventArgs e)
            {
            //if (lv.InsertItemPosition != InsertItemPosition.FirstItem)
            //{
            //    lv.InsertItemPosition = InsertItemPosition.FirstItem;

            //    //Label ImageNameLabel = (Label)lv.EditItem.FindControl("ImageNameLabel");
            //}


            txtInvNetTotal.Text = "";
            txtTotalDebet.Text = "";
            if (Session["UserId"]!=null)
             {
                DropDownListUser.SelectedValue = Session["UserId"].ToString();
            }
           //Do the database lookup using the ID...
           //gvDetails.DataSource = new List<string> { "Customer Surname", "Customer Phone", "Customer Address" };
           //gvDetails.DataBind();
           ErrorDiv.Visible = true;
                DAL.School.Sch_InvoicesDetailsDataTable dtCurrentTable = new DAL.School.Sch_InvoicesDetailsDataTable();
                dtCurrentTable = (DAL.School.Sch_InvoicesDetailsDataTable)ViewState["Sch_InvDetails"];
                if (dtCurrentTable != null)
                {
                    dtCurrentTable.Rows.Clear();

                }
                ListViewInvDet.DataSource = dtCurrentTable;
                ListViewInvDet.DataBind();
            

          

            DataTable dtCurrentTable1 = (DataTable)ViewState["Sch_InvPaymentDates"];
            if (dtCurrentTable != null)
            {
                dtCurrentTable1.Rows.Clear();

            }
            ListViewDates.DataSource = dtCurrentTable;
            ListViewDates.DataBind();

            BOL.Sch_Invoices DA = new BOL.Sch_Invoices();
                DAL.School.Sch_InvoicesDataTable dt = new DAL.School.Sch_InvoicesDataTable ();
                long InvId = long.Parse(txtInvId.Value);
                long OrgId = long.Parse(txtOrgId.Text);
             
                dt = DA.Read("4", "", "",0, 0, 0,OrgId, 0, 0,0,0,0,"", "", "",0);
                if (dt.Count > 0)
                {
                    int Serial = int.Parse(dt[0]["InvSerial"].ToString()) + 1;
                    InvCodeTextBox.Text = Serial.ToString();
                    txtInvSerial.Value = Serial.ToString();
            }
                else
                {
                    InvCodeTextBox.Text = "1";
                    txtInvSerial.Value = "1";
                }
                TextBoxNotes.Text = "";
              
               
                //BranchIdDropDownList.SelectedValue = 0;
                InvDateTextBox.Text = DateTime.Today.ToShortDateString();

                txtInvId.Value = "0";
                AddNewRowToList();
                //AddDateRowToList();
                TotalSum();
                TotalDebetSum();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "showPopup();", true);

            GetAllSum();

        }

            protected void ClearLinkButton_Click(object sender, EventArgs e)
            {
                
                SearchTextBox.Text = "";
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
                            //Get the item object.
                            //ListViewDataItem dataItem = (ListViewDataItem)e.Item;
                            ////if (dataItem.DisplayIndex == lv.SelectedIndex)
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

                            DivMsg.Visible = false;
                            int id = Int32.Parse(e.CommandArgument.ToString());
                            txtInvId.Value = id.ToString();

                            BOL.Sch_Invoices DA = new BOL.Sch_Invoices();

                            DAL.School.Sch_InvoicesDataTable dt = new DAL.School.Sch_InvoicesDataTable();
                            long InvId = long.Parse(txtInvId.Value);
 
                            long QrgId = long.Parse(Session["OrgId"].ToString());
                            dt = DA.Read("1", "", "", InvId, 0, 0, QrgId, 0, 0, 0,0,0, "", "", "",0);
                            if (dt.Count > 0)
                            {
                            if (dt[0].InvType == 2)
                            {
                                Response.Redirect("~/admin/SchInvoicesGroupAdd.aspx?AddFlag=2&InvId="+ InvId.ToString());
                            }
                            else
                            {
                                LoadDetData();

                                TotalSum();
                                TotalDebetSum();
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "showPopup();", true);
                                GetAllSum();
                            }

                            }
                            break;
                    }
                }
                catch (Exception ex)
                {
                    ErrorDiv.InnerHtml = "<div class=\"alert alert-warning alert-dismissable\"> <h4><i class=\"fa fa-times-circle\"></i> </h4>" + ex.Message.ToString() + "</div>";

                }
            }

      
          protected void AddDateLinkButton_Click(object sender, EventArgs e)
        {
            //if (ListViewQid.InsertItemPosition != InsertItemPosition.FirstItem)
            //{
            //    ListViewQid.InsertItemPosition = InsertItemPosition.FirstItem;
            //}
            AddDateRowToList();
        }
        // add new invoice detials
        private void AddDateRowToList()
        {
           
            int rowIndex = 0;
            DataRow drCurrentRow = null;
            
            ErrorDetDiv.Visible = false;
            DAL.InvPaymentDates.Sch_InvPaymentDatesDataTable dtCurrentTable = new DAL.InvPaymentDates.Sch_InvPaymentDatesDataTable();
            Boolean ReqFlag = true;

            if (ViewState["Sch_InvPaymentDates"] != null)
            {

                dtCurrentTable = (DAL.InvPaymentDates.Sch_InvPaymentDatesDataTable)ViewState["Sch_InvPaymentDates"];
                dtCurrentTable.Rows.Clear();


                if (ListViewDates.Items.Count > 0)
                {
                    for (int i = 0; i < ListViewDates.Items.Count; i++)
                    {
                        //extract the TextBox values
                        TextBox txtAmount = (TextBox)ListViewDates.Items[rowIndex].FindControl("txtAmount");
                        TextBox PayDateTextBox = (TextBox)ListViewDates.Items[rowIndex].FindControl("PayDateTextBox");
                        
                        TextBox txtPayId = (TextBox)ListViewDates.Items[rowIndex].FindControl("txtPayId");
                        TextBox txtInvId = (TextBox)ListViewDates.Items[rowIndex].FindControl("txtInvId");
                        TextBox txtInvType = (TextBox)ListViewDates.Items[rowIndex].FindControl("txtInvType");
                        drCurrentRow = dtCurrentTable.NewRow();

                       
                        if (txtAmount.Text != "")
                        {
                            drCurrentRow["Amount"] = txtAmount.Text;
                        }
                        if (PayDateTextBox.Text != "")
                        {
                            drCurrentRow["PayDate"] = PayDateTextBox.Text;
                        }
                        if (txtInvType.Text != "")
                        {
                            drCurrentRow["InvType"] = txtInvType.Text;
                        }

                        drCurrentRow["PayId"] = txtPayId.Text;
                        if (txtInvId.Text != "")
                        {
                            drCurrentRow["InvId"] = txtInvId.Text;
                        }

                        //if (CostIdbox.SelectedValue != null)
                        //{
                        //    if (CostIdbox.SelectedValue.ToString() != "")
                        //    {
                        //        drCurrentRow["CostId"] = CostIdbox.SelectedValue;
                        //    }
                        //}

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
                BOL.Sch_InvPaymentDates  DA = new BOL.Sch_InvPaymentDates();
                drCurrentRow = dtCurrentTable.NewRow();
                drCurrentRow["InvId"] = txtInvId.Value;
                drCurrentRow["Invtype"] = -1;
                int index = 0;

             

                //drCurrentRow["QidType"] = txtTypeId.Value;

                Random rad = new Random();
                int Id = rad.Next();
                drCurrentRow["PayId"] = Id;
                drCurrentRow["PayDate"] = DateTime.Today.ToShortDateString();
                dtCurrentTable.Rows.Add(drCurrentRow);
                ViewState["Sch_InvPaymentDates"] = dtCurrentTable;

                ListViewDates.DataSource = dtCurrentTable;



                ListViewDates.DataBind();
                if (dtCurrentTable.Rows.Count >= 1)
                {
                    index = dtCurrentTable.Rows.Count - 1;
                }
                TextBox txtInvId1 = (TextBox)ListViewDates.Items[index].FindControl("txtInvId");
                txtInvId1.Text = "-1";
            }
            else
            {
                ErrorDetDiv.Visible = true;
                ErrorDetDiv.InnerHtml = "<div class=\"alert alert-warning alert-dismissable\"> <h4><i class=\"fa fa-times-circle\"></i> </h4>" + Resources.DefaultResource.QidInvalidMesssage + "</div>";
            }
            TotalSum();
            TotalDebetSum();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "showPopup();", true);

            GetAllSum();
            //Set Previous Data on Postbacks

            // SetPreviousDataNew();

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
                ErrorDiv.Visible = false;
                BOL.Sch_Invoices DA = new BOL.Sch_Invoices ();

                DAL.School.Sch_InvoicesDataTable dt = new DAL.School.Sch_InvoicesDataTable ();
                long InvId = long.Parse(txtInvId.Value);
               

            //HttpCookie Session ["OrgId"]= HttpContext.Current.Request.Cookies.Get("OrgId");
          
            long QrgId = long.Parse(Session ["OrgId"].ToString());
            dt = DA.Read("1", "", "", InvId,0, 0, QrgId, 0, 0,0,0,0, "", "", "",0);


            // Load invoice data
            if (dt.Count > 0)
            {
                InvCodeTextBox.Text = dt[0]["InvCode"].ToString();
                TextBoxNotes.Text = dt[0]["Notes"].ToString();
                txtInvSerial.Value = dt[0]["InvSerial"].ToString();
                if (dt[0]["InvDate"] != DBNull.Value)
                {
                    InvDateTextBox.Text = DateTime.Parse(dt[0]["InvDate"].ToString()).ToShortDateString();
                }
                if (dt[0]["StudyStartDate"] != DBNull.Value)
                {
                    FromDateTextBox.Text = DateTime.Parse(dt[0]["StudyStartDate"].ToString()).ToShortDateString();
                }
                if (dt[0]["StudyEndDate"] != DBNull.Value)
                {
                    ToDateTextBox.Text = DateTime.Parse(dt[0]["StudyEndDate"].ToString()).ToShortDateString();
                }
                txtInvTotal.Text = dt[0]["invTotal"].ToString();
                txtInvNetTotal.Text = dt[0]["InvTotalNet"].ToString();

                DropDownListPaymentType.SelectedValue = dt[0]["PaymentType"].ToString();
                StudentsDropDownList.SelectedValue = dt[0]["StudentId"].ToString();
                PeriodIdTextBox.Text = dt[0]["PeriodId"].ToString();
                PeriodNameTextBox.Text = dt[0]["PeriodName"].ToString();

                if (dt[0]["UserId"] != DBNull.Value)
                {
                    DropDownListUser.SelectedValue = dt[0]["UserId"].ToString();
                 }
                //txtSalesMan.Text = dt[0]["PervInfoNotes"].ToString();

                if (dt[0]["CourseFlag"] != DBNull.Value)
                {
                    bool NotifcationFlag = bool.Parse(dt[0]["CourseFlag"].ToString());
                    NotifcationCheckBox.Checked = NotifcationFlag;
                }
                else
                {
                    NotifcationCheckBox.Checked = false;
                }
                BOL.Sch_InvoicesDetails DA2 = new BOL.Sch_InvoicesDetails();
                DAL.School.Sch_InvoicesDetailsDataTable dt2 = new DAL.School.Sch_InvoicesDetailsDataTable();

                BOL.Sch_InvPaymentDates DA3 = new BOL.Sch_InvPaymentDates();
                DAL.InvPaymentDates.Sch_InvPaymentDatesDataTable dt3= new DAL.InvPaymentDates.Sch_InvPaymentDatesDataTable ();


                dt2 = DA2.Read("1", "", "", 0, InvId, 1, 0, 0, 0, 0, 0,0,0,0, "");
                dt3 = DA3.Read("1", "", "", 0, InvId, 0, 0, 0, 0, 0, 0,0,false, "");

                if (dt2.Count > 0)
                {
                    ViewState["Sch_InvDetails"] = (DataTable)dt2;
                    DataTable dtCurrentTable = (DataTable)ViewState["Sch_InvDetails"];

                    SubjectsDS.DataBind();
                    ListViewInvDet.DataSource = dtCurrentTable;
                    ListViewInvDet.DataBind();
                }

                if (dt3.Count > 0)
                {
                    ViewState["Sch_InvPaymentDates"] = (DataTable)dt3;
                    DataTable dtCurrentTable = (DataTable)ViewState["Sch_InvPaymentDates"];


                    ListViewDates.DataSource = dtCurrentTable;
                    ListViewDates.DataBind();
                }

            }
        }
            protected void SaveDataBtn_Click(object sender, EventArgs e)
            {
                SaveData();
            GetAllSum();
        }

            protected void AddLinkButton_Command(object sender, CommandEventArgs e)
            {

            }

        
            protected void ListViewQid_ItemDataBound(object sender, ListViewItemEventArgs e)
            {
                HtmlControl td = (HtmlControl)e.Item.FindControl("ThSubjectName");

            //DropDownList dropDownList = (e.Item.FindControl("ddlSubjectId") as DropDownList);

            //if (dropDownList != null)
            //{
            //    dropDownList.DataBind();
            //}
            //td.Visible = false;

                //DropDownList dropDownList = (e.Item.FindControl("DeaprtmentsDropDownList") as DropDownList);

                //if (dropDownList != null)
                //{
                //if (dropDownList.SelectedValue != null)
                //{
                //    DeptIdHiddenField.Value = dropDownList.SelectedValue.ToString();
                //    DeptSectionODS.SelectParameters["DeptId"].DefaultValue = dropDownList.SelectedValue.ToString();
                //    DeptSectionODS.DataBind();
                //    DropDownList SectionDropDownList = (e.Item.FindControl("SectionDropDownList") as DropDownList); //(DropDownList)UsersListView.FindControl("SectionDropDownList");
                //    TextBox txtSectionId = (TextBox)e.Item.FindControl("SectionIdHiddenField");
                //    HtmlGenericControl Sectionlabel = (HtmlGenericControl)e.Item.FindControl("Sectionlabel");
                //    SectionDropDownList.DataBind();

                //    if (SectionDropDownList != null && txtSectionId != null)
                //    {
                //        if (txtSectionId.Text != "" && txtSectionId.Text != "0")
                //        {
                //            SectionDropDownList.SelectedValue = txtSectionId.Text;
                //        }

                //        if (SectionDropDownList.Items.Count == 0)
                //        {
                //            SectionDropDownList.Visible = false;
                //            Sectionlabel.Visible = false;
                //        }
                //        else
                //        {
                //            SectionDropDownList.Visible = true;
                //            Sectionlabel.Visible = true;
                //        }
                //    }

        }

        protected void ListViewQid_DataBound(object sender, EventArgs e)
        {
            int i = 0;
            i = +1;
                //ListViewQid.FindControl("ThFormvalue").Visible = false;
        }

           

        private void SaveData()
            {
            if (ViewState["Sch_InvDetails"] != null)
            {
                int rowIndex = 0;
                DropDownList ddlSubjectId = (DropDownList)ListViewInvDet.Items[rowIndex].FindControl("ddlSubjectId");
                if (ddlSubjectId.Text != "")
                {
                    ErrorDetDiv.Visible = false;

                    BOL.Sch_Invoices dt = new BOL.Sch_Invoices();
                    DAL.School.Sch_InvoicesDataTable dtQid = new DAL.School.Sch_InvoicesDataTable();

                    string InvDate = "";
                    string StartInvDate = "";
                    string EndInvDate = "";
                    if (InvDateTextBox.Text != "")
                    {
                        InvDate = DateTime.Parse(InvDateTextBox.Text).ToShortDateString();
                    }
                    string InvCode = InvCodeTextBox.Text;
                    long InvId = long.Parse(txtInvId.Value);

                    short PayTypeId = 0;
                    //HttpCookie Session ["OrgId"]= HttpContext.Current.Request.Cookies.Get("OrgId");
                    //HttpCookie Session ["UserId"] = HttpContext.Current.Request.Cookies.Get("UserId");
                    int USERID = int.Parse(Session["UserId"].ToString());
                    long QrgId = long.Parse(Session["OrgId"].ToString());
                    long StudentId = 0;
                    TotalSum();
                    TotalDebetSum();
                    decimal InvTotal = decimal.Parse(txtInvTotal.Text);
                    decimal InvNetTotal = decimal.Parse(txtInvNetTotal.Text);
                    decimal TotalDebet = 0;
                    string SalesMan = "";
                    if (txtTotalDebet.Text != "")
                    {
                        TotalDebet = decimal.Parse(txtTotalDebet.Text);
                    }
                    long userId=0;
                    if (DropDownListUser.SelectedValue != null)
                    {
                        userId=long.Parse (DropDownListUser.SelectedValue.ToString ()) ;
                        
                    }
                    decimal TotalNet = 0;
                    decimal Total = 0;
                    if (txtInvTotal.Text != "")
                    {
                        Total = decimal.Parse(txtInvTotal.Text);
                        TotalNet = decimal.Parse(txtInvNetTotal.Text);
                    }
                    if (txtdiscount.Text != "" && txtInvTotal.Text != "")
                    {
                        TotalNet = decimal.Parse(txtInvTotal.Text) - decimal.Parse(txtdiscount.Text);
                    }
                    if (TotalDebet == TotalNet) // || TotalDebet==0)
                    {
                        if (StudentsDropDownList.SelectedValue != null)
                        {
                            StudentId = long.Parse(StudentsDropDownList.SelectedValue.ToString());
                        }

                        if (FromDateTextBox.Text != "")
                        {
                            StartInvDate = DateTime.Parse(FromDateTextBox.Text).ToShortDateString();
                        }
                        if (ToDateTextBox.Text != "")
                        {
                            EndInvDate = DateTime.Parse(ToDateTextBox.Text).ToShortDateString();
                        }
                        string Notes = TextBoxNotes.Text;

                        //string ChequeNo = ChequeNoTextBox.Text;

                        if (DropDownListPaymentType.SelectedValue != null)
                        {
                            PayTypeId = short.Parse(DropDownListPaymentType.SelectedValue.ToString());
                        }
                        bool NotifcationFlag = false;
                        if (NotifcationCheckBox.Checked )
                        {
                            NotifcationFlag = true;
                        }
                        int InvSerial = int.Parse(txtInvSerial.Value);
                        long? CurInvId = 0;
                        short InvType = 1; // indvaul type

                        if (txtInvId.Value != "0") // update invoice
                        {
                            dt.DML("2", InvId, InvCode, InvDate, StudentId, 0, PayTypeId, 0, InvType, 0, InvDate, Notes, Total, TotalNet, 0, 0, false, 0, StartInvDate, EndInvDate, 0, false, 0, StartInvDate, EndInvDate, 0, 0, 0, userId, "", SalesMan, InvSerial, NotifcationFlag, 0, 0, false, false, false, false, QrgId, 0, USERID, USERID, USERID, ref CurInvId);
                            CurInvId = InvId;
                        }
                        else // Add new Invocie
                        {
                            dt.DML("1", InvId, InvCode, InvDate, StudentId, 0, PayTypeId, 0, InvType, 0, InvDate, Notes, Total, TotalNet, 0, 0, false, 0, StartInvDate, EndInvDate, 0, false, 0, StartInvDate, EndInvDate, 0, 0, 0, userId, "", SalesMan, InvSerial, NotifcationFlag, 0, 0, false, false, false, false, QrgId, 0, USERID, USERID, USERID, ref CurInvId);
                            txtInvId.Value = CurInvId.ToString();

                        }
                        SaveInvocieDetails(CurInvId);
                        SaveDebetDates(CurInvId);

                        ErrorDiv.Visible = true;
                        ErrorDiv.InnerHtml = "<div class=\"alert alert-success\" role=\"alert\">" + Resources.DefaultResource.Savesuccess.ToString() + "</div>";
                        lv.DataBind();
                      
                    }
                    else
                    {
                        DivMsg.Visible = true;
                        DivMsg.InnerHtml = "<div class=\"alert alert-danger\" role=\"alert\">" + Resources.DefaultResource.TotalEqualMsg.ToString() + "</div>";
                        //DivMsg.InnerHtml = "<div class=\"alert alert-danger alert-dismissable\"> <h5><i class=\"fa fa-times-circle\"></i> </h5>" + Resources.DefaultResource.TotalEqualMsg + "</div>";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "showPopup();", true);
                        GetAllSum();
                        //TotalSum();
                    }
                }
                    else
                    {
                        ErrorDiv.Visible = true;
                        ErrorDiv.InnerHtml = "<div class=\"alert alert-warning alert-dismissable\"> <h5><i class=\"fa fa-times-circle\"></i> </h5>" + Resources.DefaultResource.EmptyQidMsg + "</div>";
                        //TotalSum();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "showPopup();", true);
                    GetAllSum();
                }
                
            }
            }
        private void SaveInvocieDetails(long ? CurInvId)
        {
            int USERID = int.Parse(Session["UserId"].ToString());
            long QrgId = long.Parse(Session["OrgId"].ToString());
            DataRow drCurrentRow = null;
            DataTable dtCurrentTable = new DataTable();
            dtCurrentTable = (DataTable)ViewState["Sch_InvDetails"];
            dtCurrentTable.Rows.Clear();
            int rowIndex = 0;
            if (ListViewInvDet.Items.Count > 0)
            {
                for (int i = 0; i < ListViewInvDet.Items.Count; i++)
                {
                    //extract the TextBox values
                    decimal HourNumPerMonth = 0;
                    decimal HourPrice = 0;
                    decimal MonthNum = 0;
                    decimal TotalPrice = 0;
                    long SubjectId = 0;
                    long InvDetId = 0;
                    long InvTypeId = 0;
                    TextBox txtHourNumPerMonth = (TextBox)ListViewInvDet.Items[rowIndex].FindControl("txtHourNumPerMonth");
                    TextBox txtHourPrice = (TextBox)ListViewInvDet.Items[rowIndex].FindControl("txtHourPrice");
                    TextBox txtMonthNum = (TextBox)ListViewInvDet.Items[rowIndex].FindControl("txtMonthNum");
                    TextBox txtTotalPrice = (TextBox)ListViewInvDet.Items[rowIndex].FindControl("txtTotalPrice");
                    DropDownList CurddlSubjectId = (DropDownList)ListViewInvDet.Items[rowIndex].FindControl("ddlSubjectId");


                    TextBox txtInvDetId = (TextBox)ListViewInvDet.Items[rowIndex].FindControl("txtInvDetId");
                    TextBox txtInvId = (TextBox)ListViewInvDet.Items[rowIndex].FindControl("txtInvId");
                    TextBox txtInvType = (TextBox)ListViewInvDet.Items[rowIndex].FindControl("txtInvType");

                    drCurrentRow = dtCurrentTable.NewRow();

                    if (txtInvId.Text != "")
                    {
                        drCurrentRow["InvId"] = txtInvId.Text;
                    }
                    if (txtInvDetId.Text != "")
                    {
                        drCurrentRow["InvDetId"] = txtInvDetId.Text;
                        InvDetId = long.Parse(txtInvDetId.Text);
                    }
                    if (txtHourNumPerMonth.Text != "")
                    {
                        drCurrentRow["HourNumPerMonth"] = txtHourNumPerMonth.Text;
                        HourNumPerMonth = decimal.Parse(txtHourNumPerMonth.Text);
                    }

                    if (txtHourPrice.Text != "")
                    {
                        drCurrentRow["HourPrice"] = txtHourPrice.Text;
                        HourPrice = decimal.Parse(txtHourPrice.Text);

                    }
                    if (txtMonthNum.Text != "")
                    {
                        drCurrentRow["MonthNum"] = txtMonthNum.Text;
                        MonthNum = decimal.Parse(txtMonthNum.Text);

                    }
                    if (txtTotalPrice.Text != "")
                    {
                        drCurrentRow["TotalPrice"] = txtTotalPrice.Text;
                        TotalPrice = decimal.Parse(txtTotalPrice.Text);

                    }
                    if (txtInvType.Text != "")
                    {
                        drCurrentRow["InvType"] = txtInvType.Text;
                        InvTypeId = long.Parse(txtInvType.Text);
                    }
                   
                    if (CurddlSubjectId.SelectedValue != null)
                    {
                        if (CurddlSubjectId.SelectedValue.ToString() != "")
                        {
                            drCurrentRow["SubjectId"] = CurddlSubjectId.SelectedValue.ToString();
                        }
                        else
                        {
                            drCurrentRow["SubjectId"] = DBNull.Value;
                        }
                        SubjectId = long.Parse(CurddlSubjectId.SelectedValue.ToString());
                    }


                    dtCurrentTable.Rows.Add(drCurrentRow);

                    BOL.Sch_InvoicesDetails dtDet = new BOL.Sch_InvoicesDetails();

                    if (txtInvType.Text != "-1")
                    {
                        txtId.Text = txtInvDetId.Text;
                        long Id = long.Parse(txtId.Text);

                        dtDet.DML("2", Id, CurInvId.Value, SubjectId, MonthNum, HourNumPerMonth, HourPrice, TotalPrice, 1, 0, 0, USERID, USERID, USERID);
                    }
                    else
                    {
                        dtDet.DML("1", 0, CurInvId.Value, SubjectId, MonthNum, HourNumPerMonth, HourPrice, TotalPrice, 1, 0, 0, USERID, USERID, USERID);
                    }

                    rowIndex++;
                }

            }
        }
        private void SaveDebetDates(long? CurInvId)
        {
            int USERID = int.Parse(Session["UserId"].ToString());
            long QrgId = long.Parse(Session["OrgId"].ToString());
            int rowIndex = 0;
            DataRow drCurrentRow = null;
            DataTable dtCurrentTable = new DataTable();
            dtCurrentTable = (DataTable)ViewState["Sch_InvPaymentDates"];
            dtCurrentTable.Rows.Clear();

            if (ListViewDates.Items.Count > 0)
            {
                for (int i = 0; i < ListViewDates.Items.Count; i++)
                {
                    //extract the TextBox values
                    string PayDate = "";
                    decimal Amount = 0;
                    long PayId = 0;
                    long InvTypeId = 0;
                    // fill details item table
                    TextBox txtAmount = (TextBox)ListViewDates.Items[rowIndex].FindControl("txtAmount");
                    TextBox PayDateTextBox = (TextBox)ListViewDates.Items[rowIndex].FindControl("PayDateTextBox");
                    TextBox txtPayId = (TextBox)ListViewDates.Items[rowIndex].FindControl("txtPayId");
                    TextBox txtInvType = (TextBox)ListViewDates.Items[rowIndex].FindControl("txtInvType");

                    drCurrentRow = dtCurrentTable.NewRow();
                    drCurrentRow["InvId"] = CurInvId;

                    if (txtPayId.Text != "")
                    {
                        drCurrentRow["PayId"] = txtPayId.Text;
                        PayId = long.Parse(txtPayId.Text);
                    }
                    if (txtAmount.Text != "")
                    {
                        drCurrentRow["Amount"] = txtAmount.Text;
                        Amount = decimal.Parse(txtAmount.Text);
                    }
                    
               
                    if (PayDateTextBox.Text != "")
                    {
                        drCurrentRow["PayDate"] = PayDateTextBox.Text;
                        PayDate = PayDateTextBox.Text;

                    }
                    if (txtInvType.Text != "")
                    {
                        drCurrentRow["InvType"] = txtInvType.Text;
                        InvTypeId = long.Parse(txtInvType.Text);
                    }
                    //if (txtInvType.Text != "")
                    //{
                    //    InvTypeId = long.Parse(txtInvType.Text);
                    //}

                    dtCurrentTable.Rows.Add(drCurrentRow);

                    BOL.Sch_InvPaymentDates dtDet = new BOL.Sch_InvPaymentDates();

                    if (txtInvType.Text != "-1")
                    {
                        
                        txtId.Text = txtPayId.Text;
                        long Id = long.Parse(txtId.Text);

                        dtDet.DML("2", Id, CurInvId.Value,Amount, PayDate, "","",1, QrgId, 0, false, USERID, USERID, USERID);
                    }
                    else
                    {
                        dtDet.DML("1", 0, CurInvId.Value, Amount, PayDate, "","",1, QrgId, 0, false, USERID, USERID, USERID);
                    }

                    rowIndex++;
                }

            }
        }
        protected void StudentsDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (StudentsDropDownList.SelectedValue !=null)
            {
                long StudentId = long.Parse (StudentsDropDownList.SelectedValue.ToString());
                DAL.School.StudentDataTable dt = new DAL.School.StudentDataTable();
                BOL.Sch_Student DA2 = new BOL.Sch_Student();
                long OrgId = long.Parse(txtOrgId.Text);
                 dt = DA2.Read("1", OrgId, StudentId, 0, 0,"");
                if (dt.Count > 0)
                {
                    PeriodIdTextBox.Text  = dt[0].PeriodId.ToString();
                    PeriodNameTextBox.Text = dt[0].PeriodName.ToString();
                   
                    
                    DataTable dtCurrentTable = (DataTable)ViewState["Sch_InvDetails"];
                    long NewStudentId = 0;
                    if (dtCurrentTable !=null)
                    {
                        if (dtCurrentTable.Rows.Count > 0)
                        {
                            if (dtCurrentTable.Rows[0]["StudentId"] != DBNull.Value)
                            {
                                NewStudentId = long.Parse(dtCurrentTable.Rows[0]["StudentId"].ToString());
                            }
                           
                        }
                    }
                   
                        if (StudentId == NewStudentId || NewStudentId==0)
                        {
                            SubjectsDS.DataBind();
                            ListViewInvDet.DataSource = dtCurrentTable;
                            ListViewInvDet.DataBind();
                        }
                        else
                        {
                        StudentsDropDownList.SelectedValue = NewStudentId.ToString();
                        dt = DA2.Read("1", OrgId, NewStudentId, 0, 0, "");
                        if (dt.Count > 0)
                        {
                            PeriodIdTextBox.Text = dt[0].PeriodId.ToString();
                            PeriodNameTextBox.Text = dt[0].PeriodName.ToString();
                        }
                            SubjectsDS.DataBind();
                            ListViewInvDet.DataSource = dtCurrentTable;
                            ListViewInvDet.DataBind();
                            DivMsg.Visible = true;
                            DivMsg.InnerHtml = "<div class=\"alert alert-danger\" role=\"alert\">" + Resources.DefaultResource.MsgChangeStudent.ToString() + "</div>";

                        
                        }
                    
                    
                }
            }
            
            TotalSum();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "showPopup();", true);
        }

        protected void SearchLinkButton_Click(object sender, EventArgs e)
        {
            if (CheckBoxFinish.Checked)
            {
                InvoicesDS.SelectParameters["FinishFlag"].DefaultValue = "1";
            }
            else
            {
                InvoicesDS.SelectParameters["FinishFlag"].DefaultValue = "0";
            }
            GetAllSum();
            lv.DataBind();
            
        }

        protected void ListViewDates_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            try
            {
                switch (e.CommandName)
                {
                    case "NewRecord":
                        ListViewDates.InsertItemPosition = InsertItemPosition.FirstItem;
                        break;
                    case "Cancel":
                        //Hide code
                        ListViewDates.InsertItemPosition = InsertItemPosition.None;
                        break;
                    case "UnSelect":
                        ListViewDates.SelectedIndex = -1;
                        break;
                    case "Select":
                        ListViewDates.InsertItemPosition = InsertItemPosition.None;

                        break;
                    case "Update":


                        ListViewDates.InsertItemPosition = InsertItemPosition.None;
                        break;

                    case "Insert":

                        ListViewDates.InsertItemPosition = InsertItemPosition.None;
                        break;
                    case "ItemDelete":
                        ErrorDetDiv.Visible = false;
                        if (ViewState["Sch_InvPaymentDates"] != null)
                        {

                            DataTable dt = (DataTable)ViewState["Sch_InvPaymentDates"];
                            if (dt.Rows.Count > 0)
                            {
                                int index = e.Item.DataItemIndex;
                                if (dt.Rows[index]["InvId"].ToString() != "-1")
                                {
                                    //HttpCookie Session ["UserId"] = HttpContext.Current.Request.Cookies.Get("UserId");
                                    int USERID = int.Parse(Session["UserId"].ToString());
                                    int Id = int.Parse(dt.Rows[index]["PayId"].ToString());
                                    BOL.Sch_InvPaymentDates dtDet = new BOL.Sch_InvPaymentDates();
                                    dtDet.DML("3", Id, 0, 0, "", "","", 1,0, 0, false, USERID, USERID, USERID);

                                }

                                dt.Rows.RemoveAt(index);
                                ListViewDates.DataSource = dt;
                                ListViewDates.DataBind();

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

        protected void ListViewDates_ItemDataBound(object sender, ListViewItemEventArgs e)
        {

        }

        protected void PrintButton_Click(object sender, EventArgs e)
         {

         }

        protected void StudentsDS_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {

        }

        protected void PrintLinkButton_Click(object sender, EventArgs e)
        {
            Session["SDate"] = StartDateTextBox.Text;
            Session["EDate"] = EndDateTextBox.Text;
            Session["EmpId"] = DropDownListEmp.SelectedValue.ToString();
            Session["StudentId"] = DropDownListStudent.SelectedValue.ToString();
            Session["InvTypeId"] = DropDownListGroupType.SelectedValue.ToString();
            Session["SearchText"] = SearchTextBox.Text ;
            Session["Title"] = "  ";
            if (CheckBoxFinish.Checked)
            {
                Session["FinishFlag"] = "1";
            }
            else
            {
                Session["FinishFlag"] = "0";
            }
            string url = "InvoicesShowReport.aspx?Id=5";

            StringBuilder sb = new StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.open('");
            sb.Append(url);
            sb.Append("','_blank');");
            sb.Append("</script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", sb.ToString());

          

            
                              
        }

        protected void LinkButtonAddGroup_Click(object sender, EventArgs e)
        {
            Response.Redirect("SchInvoicesGroupAdd.aspx?AddFlag=1");
        }

        //protected void txtTotalPrice_TextChanged(object sender, EventArgs e)
        //{
        //    ErrorDetDiv.Visible = false;
        //    if (ViewState["Sch_InvPaymentDates"] != null)
        //    {

        //        DataTable dt = (DataTable)ViewState["Sch_InvPaymentDates"];
        //        if (dt.Rows.Count > 0)
        //        {


        //            ListViewDates.DataSource = dt;
        //            ListViewDates.DataBind();

        //        }
        //    }
        //    TotalSum();
        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "showPopup();", true);
        //}

        private void AddNewRowToList()
            {
           
                int rowIndex = 0;
                DataRow drCurrentRow = null;
                //DataTable dtCurrentTable = new DataTable() ;
                ErrorDetDiv.Visible = false;
                DAL.School.Sch_InvoicesDetailsDataTable dtCurrentTable = new DAL.School.Sch_InvoicesDetailsDataTable();
                Boolean ReqFlag = true;

                if (ViewState["Sch_InvDetails"] != null)
                {

                    dtCurrentTable = (DAL.School.Sch_InvoicesDetailsDataTable)ViewState["Sch_InvDetails"];
                    dtCurrentTable.Rows.Clear();


                    if (ListViewInvDet.Items.Count > 0)
                    {
                        for (int i = 0; i < ListViewInvDet.Items.Count; i++)
                        {
                            //extract the TextBox values
                            TextBox txtHourNumPerMonth = (TextBox)ListViewInvDet.Items[rowIndex].FindControl("txtHourNumPerMonth");
                            TextBox HourPriceTextbox = (TextBox)ListViewInvDet.Items[rowIndex].FindControl("txtHourPrice");
                            TextBox MonthNumTextbox = (TextBox)ListViewInvDet.Items[rowIndex].FindControl("txtMonthNum");
                            TextBox TotalPriceTextbox = (TextBox)ListViewInvDet.Items[rowIndex].FindControl("txtTotalPrice");
                            DropDownList SubjectList = (DropDownList)ListViewInvDet.Items[rowIndex].FindControl("ddlSubjectId");
                            //TextBox box3 = (TextBox)ListViewQid.Items[rowIndex].FindControl("txtDescription");
                    
                            TextBox txtInvDetId = (TextBox)ListViewInvDet.Items[rowIndex].FindControl("txtInvDetId");
                            TextBox txtInvId = (TextBox)ListViewInvDet.Items[rowIndex].FindControl("txtInvId");
                            TextBox txtInvType = (TextBox)ListViewInvDet.Items[rowIndex].FindControl("txtInvType");

                        drCurrentRow = dtCurrentTable.NewRow();

                            drCurrentRow["InvId"] = txtInvId.Text; //'i + 1;
                            if (txtHourNumPerMonth.Text != "")
                            {
                                drCurrentRow["HourNumPerMonth"] = txtHourNumPerMonth.Text;
                            }
                            if (HourPriceTextbox.Text != "")
                            {
                                drCurrentRow["HourPrice"] = HourPriceTextbox.Text;
                            }
                            if (MonthNumTextbox.Text != "")
                            {
                                drCurrentRow["MonthNum"] = MonthNumTextbox.Text;
                            }
                            if (TotalPriceTextbox.Text != "")
                            {
                                drCurrentRow["TotalPrice"] = TotalPriceTextbox.Text;
                            }
                            if (txtInvType.Text != "")
                            {
                                drCurrentRow["InvType"] = txtInvType.Text;
                            }

                        if (SubjectList.SelectedValue != "")
                            {
                                drCurrentRow["SubjectId"] = SubjectList.SelectedValue;

                            }
                            else
                            {
                                ReqFlag = false;
                            }

                            drCurrentRow["InvDetId"] = txtInvDetId.Text;
                            if (txtInvId.Text != "")
                            {
                                drCurrentRow["InvId"] = txtInvId.Text;
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
                    BOL.Sch_InvoicesDetails DA = new BOL.Sch_InvoicesDetails();
                    drCurrentRow = dtCurrentTable.NewRow();
                    drCurrentRow["InvId"] = txtInvId.Value;
                    drCurrentRow["Invtype"] = -1;
                    int index = 0;
                   
                    drCurrentRow["SubjectId"] = 0;
                    Random rad = new Random();
                    int Id = rad.Next();
                    drCurrentRow["InvDetId"] = Id;
                    dtCurrentTable.Rows.Add(drCurrentRow);
                    ViewState["Sch_InvDetails"] = dtCurrentTable;
                    ListViewInvDet.DataSource = dtCurrentTable;
                    //DropDownList SubjectList = (DropDownList)ListViewInvDet.Items[rowIndex].FindControl("ddlSubjectId");
                    //    if (SubjectList.SelectedValue != "")
                    //    {
                    //        drCurrentRow["SubjectId"] = SubjectList.SelectedValue;
                    //    }
                    ListViewInvDet.DataBind();
                    if (dtCurrentTable.Rows.Count >= 1)
                    {
                        index = dtCurrentTable.Rows.Count - 1;
                    }
                    TextBox txtInvId1 = (TextBox)ListViewInvDet.Items[index].FindControl("txtInvId");
                    txtInvId1.Text = "-1";
                }
                else
                {
                    ErrorDetDiv.Visible = true;
                    ErrorDetDiv.InnerHtml = "<div class=\"alert alert-warning alert-dismissable\"> <h4><i class=\"fa fa-times-circle\"></i> </h4>" + Resources.DefaultResource.QidInvalidMesssage + "</div>";
                }
                TotalSum();
                TotalDebetSum();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "showPopup();", true);
         
            // SetPreviousDataNew();

        }

            protected void ListViewQid_ItemCommand(object sender, ListViewCommandEventArgs e)
            {
                try
                {
                    switch (e.CommandName)
                    {
                        case "NewRecord":
                            ListViewInvDet.InsertItemPosition = InsertItemPosition.FirstItem;
                            break;
                        case "Cancel":
                            //Hide code
                            ListViewInvDet.InsertItemPosition = InsertItemPosition.None;
                            break;
                        case "UnSelect":
                            ListViewInvDet.SelectedIndex = -1;
                            break;
                        case "Select":
                            ListViewInvDet.InsertItemPosition = InsertItemPosition.None;

                            break;
                        case "Update":


                            ListViewInvDet.InsertItemPosition = InsertItemPosition.None;
                            break;

                        case "Insert":

                            ListViewInvDet.InsertItemPosition = InsertItemPosition.None;
                            break;
                        case "ItemDelete":
                            ErrorDetDiv.Visible = false;
                            if (ViewState["Sch_InvDetails"] != null)
                            {

                                DataTable dt = (DataTable)ViewState["Sch_InvDetails"];
                                if (dt.Rows.Count > 0)
                                {
                                    int index = e.Item.DataItemIndex;
                                    if (dt.Rows[index]["InvId"].ToString() != "-1")
                                    {
                                        //HttpCookie Session ["UserId"] = HttpContext.Current.Request.Cookies.Get("UserId");
                                        int USERID = int.Parse(Session ["UserId"].ToString());
                                        int Id = int.Parse(dt.Rows[index]["InvDetId"].ToString());
                                        BOL.Sch_InvoicesDetails  dtDet = new BOL.Sch_InvoicesDetails();
                                     
                                    dtDet.DML("3", Id,0, 0, 0, 0, 0, 0, 0,0,0, USERID, USERID, USERID);

                                }

                                    dt.Rows.RemoveAt(index);
                                    ListViewInvDet.DataSource = dt;
                                    ListViewInvDet.DataBind();

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

                decimal TotalValue = 0;
                decimal TotalSum = 0;
                decimal RealSum = 0;
                if (ListViewInvDet.Items.Count > 0)
                {
                    for (int i = 0; i < ListViewInvDet.Items.Count; i++)
                    {
                        //extract the TextBox values
                        TextBox txtTotalPrice = (TextBox)ListViewInvDet.Items[i].FindControl("txtTotalPrice");
                        //TextBox box2 = (TextBox)ListViewInvDet.Items[i].FindControl("txtToValue");


                        if (txtTotalPrice.Text != "")
                        {

                            TotalValue = decimal.Parse(txtTotalPrice.Text);

                                TotalSum = TotalSum+ TotalValue;
                         }
                       
                    }
                RealSum = TotalSum;
                decimal CurTotal = 0;
                if (! String.IsNullOrEmpty(txtInvNetTotal.Text))
                {
                    CurTotal = decimal.Round( decimal.Parse (txtInvNetTotal.Text),3);
                }
                if (CurTotal>0 && CurTotal!=TotalSum)
                {
                    TotalSum = CurTotal;
                }

                txtInvTotal.Text =decimal.Round(RealSum, 3).ToString();
                txtInvNetTotal.Text = decimal.Round(TotalSum, 3).ToString();

                if (txtdiscount.Text != "" && txtInvTotal.Text != "")
                {
                    txtInvNetTotal.Text  = (decimal.Parse(txtInvTotal.Text) - decimal.Parse(txtdiscount.Text)).ToString ();
                }
                

            }
            }
        void TotalDebetSum()
        {

            decimal TotalValue = 0;
            decimal TotalSum = 0;
            if (ListViewDates.Items.Count > 0)
            {
                for (int i = 0; i < ListViewDates.Items.Count; i++)
                {
                    //extract the TextBox values
                    TextBox txtTotalPrice = (TextBox)ListViewDates.Items[i].FindControl("txtAmount");
                   
                    if (txtTotalPrice.Text != "")
                    {

                        TotalValue = decimal.Parse(txtTotalPrice.Text);

                        TotalSum = TotalSum + TotalValue;
                    }

                }

                txtTotalDebet.Text = decimal.Round (TotalSum,3).ToString();


            }
        }
    }
    
}