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

    public partial class Sch_InvPaymentDatesList : System.Web.UI.UserControl
    {
    
            string Accessing, Adding, Updating, Deleting, Importing;
            protected void Page_Load(object sender, EventArgs e)
            {
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
            BOL.UsersPages DA1 = new BOL.UsersPages();
            DAL.UsersPages.UsersPagesDataTable dt = new DAL.UsersPages.UsersPagesDataTable();

            dt = DA1.Read("1", USERID, 11, "");
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
                //if (Adding != "True") { NewRecord.Visible = false; }
            }
            else
            {
                Response.Redirect("~/NoAccess.aspx?URL=" + previousUrl);
            }

               
                if (Session ["OrgId"]!= null)
                {
                    txtOrgId.Text = Session ["OrgId"].ToString();
                }

            if (!Page.IsPostBack)
            {

                //lv.SelectedIndex = 0;
                StartDateTextBox.Text = DateTime.Today.ToShortDateString();
                EndDateTextBox.Text = DateTime.Today.ToShortDateString();

                if (Request.QueryString["Id"] != null)
                {
                    DateTime DayDate = DateTime.Today.AddDays(3);
                    int CurUserId = int.Parse(Session["UserId"].ToString());
                  
                    int RoleId = 0;
                    if (Session["RoleID"] != null)
                    {
                        if (Session["RoleID"].ToString() != "")
                        {
                            RoleId = int.Parse(Session["RoleID"].ToString());
                        }
                        if (RoleId == 1 || RoleId == 5)
                        {
                            CurUserId = 0;
                        }
                    }
                    // V = (DataView)StudentsDS.Select();

                    InvoicesPaymentDatesDS.SelectParameters["ActionCode"].DefaultValue = "4";
                  
                    InvoicesPaymentDatesDS.SelectParameters["UserId"].DefaultValue = CurUserId.ToString();
                    if (CurUserId > 0)
                    {
                        DropDownListEmp.SelectedValue = CurUserId.ToString();
                    }

                    StartDateTextBox.Text = "";
                    EndDateTextBox.Text = DateTime.Today.ToShortDateString();
                    //InvoicesPaymentDatesDS.DataBind();
                    lv.DataBind();
                }
                else
                {
                    InvoicesPaymentDatesDS.SelectParameters["ActionCode"].DefaultValue = "1";
                }
                GetSum();

            }
            

        }


            protected void lv_ItemDataBound(object sender, ListViewItemEventArgs e)
            {
                // Hidding Action buttons in case not assigend  
                LinkButton EditLinkButton = (LinkButton)e.Item.FindControl("EditLinkButton");
                LinkButton DeleteLinkButton = (LinkButton)e.Item.FindControl("DeleteLinkButton");
            if (Updating != "True") { EditLinkButton.Visible = false; }
            if (Deleting != "True") { DeleteLinkButton.Visible = false; }
            //if (lv.InsertItem != null)
            //{
            //    TextBox tb = (TextBox)lv.InsertItem.FindControl("qidDateTextBox");
            //    tb.Text = DateTime.Today.ToShortDateString();
            //}



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
                ErrorDiv.Visible = true;
                DAL.School.Sch_InvoicesDetailsDataTable dtCurrentTable = new DAL.School.Sch_InvoicesDetailsDataTable();
                dtCurrentTable = (DAL.School.Sch_InvoicesDetailsDataTable)ViewState["Sch_InvDetails"];
                if (dtCurrentTable != null)
                {
                    dtCurrentTable.Rows.Clear();

                }
             
             
                
                BOL.Sch_Invoices DA = new BOL.Sch_Invoices();
                DAL.School.Sch_InvoicesDataTable dt = new DAL.School.Sch_InvoicesDataTable ();
                long InvId = long.Parse(txtInvId.Value);
                long OrgId = long.Parse(txtOrgId.Text);
                           
               
                txtInvId.Value = "0";
                
                //AddDateRowToList();
               
                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "showPopup();", true);



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

                            int id = Int32.Parse(e.CommandArgument.ToString());

                            txtInvId.Value = id.ToString();

                            LoadDetData();
                           
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "showPopup();", true);
                            break;
                    }
                }
                catch (Exception ex)
                {
                    ErrorDiv.InnerHtml = "<div class=\"alert alert-warning alert-dismissable\"> <h4><i class=\"fa fa-times-circle\"></i> </h4>" + ex.Message.ToString() + "</div>";

                }
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
                
                



                BOL.Sch_InvoicesDetails DA2 = new BOL.Sch_InvoicesDetails();
                DAL.School.Sch_InvoicesDetailsDataTable dt2 = new DAL.School.Sch_InvoicesDetailsDataTable();

                BOL.Sch_InvPaymentDates DA3 = new BOL.Sch_InvPaymentDates();
                DAL.InvPaymentDates.Sch_InvPaymentDatesDataTable dt3= new DAL.InvPaymentDates.Sch_InvPaymentDatesDataTable ();


                //dt2 = DA2.Read("1", "", "", 0, InvId, 2, 0, 0, 0, 0, 0, "");
                //dt3 = DA3.Read("1", "", "", 0, InvId, 0, 0, 0, 0, 0, 0, "");

               

              

            }
        }
            protected void SaveDataBtn_Click(object sender, EventArgs e)
            {
               
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

        protected void PrintLinkButton_Click(object sender, EventArgs e)
        {
            Session["SDate"] = StartDateTextBox.Text;
            Session["EDate"] = EndDateTextBox.Text;
            Session["EmpId"] = DropDownListEmp.SelectedValue.ToString();
            Session["StudentId"] = DropDownListStudent.SelectedValue.ToString();
            Session["PeriodId"] = PeriodDropDownList.SelectedValue.ToString();
            Session["SearchText"] = SearchTextBox.Text;
            if (FinishCheckBox.Checked)
            {
                Session["Action"] = "4";
                //InvoicesPaymentDatesDS.SelectParameters["ActionCode"].DefaultValue = "4";
                //InvoicesPaymentDatesDS.SelectParameters["FinishFlag"].DefaultValue = "0";

            }
            else
            {
                Session["Action"] = "1";
               // InvoicesPaymentDatesDS.SelectParameters["ActionCode"].DefaultValue = "1";
            }
            string url = "InvoicesShowReport.aspx?Id=7";

            StringBuilder sb = new StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.open('");
            sb.Append(url);
            sb.Append("','_blank');");
            sb.Append("</script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", sb.ToString());
        }

        protected void ListViewQid_DataBound(object sender, EventArgs e)
        {
            int i = 0;
            i = +1;
            //ListViewQid.FindControl("ThFormvalue").Visible = false;
        }

           

       
        
        protected void SearchLinkButton_Click(object sender, EventArgs e)
        {
            if (FinishCheckBox.Checked)
            {
                InvoicesPaymentDatesDS.SelectParameters["ActionCode"].DefaultValue = "4";
                //InvoicesPaymentDatesDS.SelectParameters["FinishFlag"].DefaultValue = "0";

            }
            else
            {
                InvoicesPaymentDatesDS.SelectParameters["ActionCode"].DefaultValue = "1";
            }
            lv.DataBind();
            GetSum();

        }
        private void GetSum()
        {

            DataView v = (DataView)InvoicesPaymentDatesDS.Select();
            lv.DataBind();
            decimal Remain = 0;
            decimal Total = 0;
            decimal Payment = 0;
            if ((v.Count > 0))
            {
                for (int i = 0; i < v.Count; i++)
                {
                    if (v[i]["InvRemain"] != null)
                    {
                        Remain = Remain + decimal.Parse(v[i]["InvRemain"].ToString());
                    }
                    if (v[i]["Amount"] != null)
                    {
                        Total = Total + decimal.Parse(v[i]["Amount"].ToString());
                    }
                    if (v[i]["InvPayment"] != null)
                    {
                        Payment = Payment + decimal.Parse(v[i]["InvPayment"].ToString());
                    }
                }
            }
            //lblPayment.Text = Payment.ToString();
            lblltotal.Text = Total.ToString();
            //lblRemain.Text = Remain.ToString();
        }
       
       
        protected void PrintButton_Click(object sender, EventArgs e)
         {

         }
              
    }
    
}