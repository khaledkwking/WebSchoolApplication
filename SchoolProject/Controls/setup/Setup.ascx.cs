using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSchool.Controls.Setup
{
    public partial class Setup : System.Web.UI.UserControl
    {
        string ImagePath = System.Configuration.ConfigurationManager.AppSettings["FilesPath"];
        string Accessing, Adding, Updating, Deleting, Importing;

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            SaveData();
            LoadData();
        }
        void LoadData()
        {
            BOL.Setup DA = new BOL.Setup();
            DAL.Setup.SetupDataTable dt = new DAL.Setup.SetupDataTable();
            HttpCookie cookieOrgId = HttpContext.Current.Request.Cookies.Get("OrgId");
            long OrgId = long.Parse(cookieOrgId.Value);
           
           

            dt = DA.Read("1", OrgId, "", "","");
            if (dt.Count > 0)
            {
                if (dt[0]["Mainsalesaccid"] != DBNull.Value )
                {
                    long Mainsalesaccid = long.Parse(dt[0]["Mainsalesaccid"].ToString());
                    SalesAccountDropDownList.SelectedValue = Mainsalesaccid.ToString();
                }

                if (dt[0]["salesaccid"] != DBNull .Value )
                {
                    long salesaccid = long.Parse(dt[0]["salesaccid"].ToString());
                    SalesCashAccountDropDownList.SelectedValue = salesaccid.ToString();
                }
                if (dt[0]["salesAgalaccid"] != DBNull.Value )
                {
                    long salesAgalaccid = long.Parse(dt[0]["salesAgalaccid"].ToString());
                    SalesDebitAccountDropDownList.SelectedValue = salesAgalaccid.ToString();
                }
                if (dt[0]["SalReorderaccid"] != DBNull .Value )
                {
                    
                    long SalReorderaccid = long.Parse(dt[0]["SalReorderaccid"].ToString());
                    SalesReturnCashAccountDropDownList.SelectedValue = SalReorderaccid.ToString();
                }
                if (dt[0]["SalReorderAgalaccid"] != DBNull.Value )
                {
                    long SalReorderAgalaccid = long.Parse(dt[0]["SalReorderAgalaccid"].ToString());
                    SalesReturnDebitAccountDropDownList.SelectedValue = SalReorderAgalaccid.ToString();
                }
                if (dt[0]["MainPurchaseaccid"] != DBNull.Value )
                {
                    long MainPurchaseaccid = long.Parse(dt[0]["MainPurchaseaccid"].ToString());
                    PurchaseAccountDropDownList.SelectedValue = MainPurchaseaccid.ToString();
                }
                if (dt[0]["purchaseaccid"] != DBNull .Value )
                {
                    long purchaseaccid = long.Parse(dt[0]["purchaseaccid"].ToString());
                    PurchaseCashAccountDropDownList.SelectedValue = purchaseaccid.ToString();
                }
                if (dt[0]["purchaseAgalaccid"] != DBNull.Value )
                {
                    long purchaseAgalaccid = long.Parse(dt[0]["purchaseAgalaccid"].ToString());
                    PurchaseDebitAccountDropDownList.SelectedValue = purchaseAgalaccid.ToString();
                }
                if (dt[0]["PurReorderaccid"] != DBNull.Value )
                {
                    long PurReorderaccid = long.Parse(dt[0]["PurReorderaccid"].ToString());
                    PurchaseReturnCashAccountDropDownList.SelectedValue = PurReorderaccid.ToString();
                }

                if (dt[0]["PurReorderAgalaccid"] != DBNull.Value )
                {
                    long PurReorderAgalaccid = long.Parse(dt[0]["PurReorderAgalaccid"].ToString());
                    PurchaseReturnDebitAccountDropDownList.SelectedValue = PurReorderAgalaccid.ToString();
                }
                if (dt[0]["boxaccid"] != DBNull .Value )
                {
                    long boxaccid = long.Parse(dt[0]["boxaccid"].ToString());
                    CashBoxAccountDropDownList.SelectedValue = boxaccid.ToString();
                }
                if (dt[0]["bankaccid"] != DBNull .Value )
                {
                    long bankaccid = long.Parse(dt[0]["bankaccid"].ToString());
                    BanksAccountDropDownList.SelectedValue = bankaccid.ToString();
                }
                if (dt[0]["custaccid"] != DBNull .Value )
                {
                    long custaccid = long.Parse(dt[0]["custaccid"].ToString());
                    CustomersDropDownList.SelectedValue = custaccid.ToString();
                }
                if (dt[0]["suppaccid"] != DBNull .Value  )
                {
                    long suppaccid = long.Parse(dt[0]["suppaccid"].ToString());
                    suppliersDropDownList.SelectedValue = suppaccid.ToString();
                }
                if (dt[0]["Discountaccid"] != DBNull .Value )
                {
                    long Discountaccid = long.Parse(dt[0]["Discountaccid"].ToString());
                    DiscountAccountDropDownList.SelectedValue = Discountaccid.ToString();
                }
                if (dt[0]["Paymentsaccid"] != DBNull .Value )
                {

                    long Paymentsaccid = long.Parse(dt[0]["Paymentsaccid"].ToString());
                    PaymentAccountDropDownList.SelectedValue = Paymentsaccid.ToString();
                }
                if (dt[0]["Paymentsaccid"] != DBNull .Value )
                {
                    long MovmentProfitsAccid = long.Parse(dt[0]["Paymentsaccid"].ToString());
                    ProfitAccountDropDownList.SelectedValue = MovmentProfitsAccid.ToString();
                }
                if (dt[0]["OsalAccId"] != DBNull .Value )
                {
                    long OsalAccId = long.Parse(dt[0]["OsalAccId"].ToString());
                    AssetAccountDropDownList.SelectedValue = OsalAccId.ToString();
                }
                string  CompanyName = dt[0]["CompanyName"].ToString();
                CompanyArNameTextBox.Text = CompanyName;

                string CompanyNameEng = dt[0]["CompanyNameEng"].ToString();
                CompanyEngNameTextBox.Text = CompanyNameEng;

                string Address = dt[0]["Address"].ToString();
                CompanyArAddressTextBox.Text = Address;

                string AddressEng = dt[0]["AddressEng"].ToString();
                CompanyEngAddressTextBox.Text = AddressEng;

                string TelPhone = dt[0]["TelPhone"].ToString();
                CompanyTelTextBox.Text = TelPhone;

                string CompActivty = dt[0]["CompActivty"].ToString();
                CompanyArActivityTextBox.Text = CompActivty;

                string Fax = dt[0]["Fax"].ToString();
                ComapanyFaxTextBox.Text = Fax;

                string FaxEng = dt[0]["FaxEng"].ToString();
                CompanyEngActivityTextBox.Text = FaxEng;

                string Email = dt[0]["Email"].ToString();
                CompanyEmailTextBox.Text = Email;

                string ExpiredFlag = dt[0]["ExpiredFlag"].ToString();
                ExpiredFlagTextBox.Text = ExpiredFlag;
                string SubStartDate = "";
                if (dt[0]["SubStartDate"] != DBNull.Value)
                {
                     SubStartDate = DateTime.Parse (dt[0]["SubStartDate"].ToString()).ToShortDateString();
                    SubStartDateTextBox.Text = SubStartDate;
                }
                string SubEndDate = "";
                if (dt[0]["SubStartDate"] != DBNull.Value)
                {
                    SubEndDate = DateTime.Parse(dt[0]["SubEndDate"].ToString()).ToShortDateString();  //dt[0]["SubEndDate"].ToString();
                    SubEndDateTextBox.Text = SubEndDate;
                }
                
                txtCode.Text = dt[0]["Code"].ToString();
                if (dt[0]["ImageLogo"] != DBNull.Value)
                {
                    txtImageLogo.Text = dt[0]["ImageLogo"].ToString();
                    string filepath = Path.Combine(Server.MapPath(ImagePath)) + txtImageLogo.Text;
                    ImageLogo.ImageUrl = filepath;
                }
               
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            // to get the previus Link 
            string previousUrl;
            if (Context.Request.UrlReferrer != null )
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
          
           
           
            if (!Page.IsPostBack)
            {
                LoadData();
              
            }


        }
        void SaveData()
        {
            BOL.Setup DA = new BOL.Setup();
            DAL.Setup.SetupDataTable dt = new DAL.Setup.SetupDataTable();
            HttpCookie cookieOrgId = HttpContext.Current.Request.Cookies.Get("OrgId");
            long OrgId = long.Parse(cookieOrgId.Value);

            long Mainsalesaccid = 0;
            if (SalesAccountDropDownList.SelectedValue != null)
            {
                 Mainsalesaccid = long.Parse(SalesAccountDropDownList.SelectedValue.ToString());

            }
            short salesaccid = 0;
            if (SalesCashAccountDropDownList.SelectedValue != null)
            {
                salesaccid = short.Parse(SalesCashAccountDropDownList.SelectedValue.ToString());
            }
            long salesAgalaccid = 0;
            if (SalesDebitAccountDropDownList.SelectedValue != null)
            {
                 salesAgalaccid = long.Parse(SalesDebitAccountDropDownList.SelectedValue.ToString());
            }
            long SalReorderaccid = 0;
            if (SalesDebitAccountDropDownList.SelectedValue != null)
            {
                 SalReorderaccid = long.Parse(SalesReturnCashAccountDropDownList.SelectedValue.ToString());
            }
            long SalReorderAgalaccid = 0;
            if (SalesDebitAccountDropDownList.SelectedValue != null)
            {
                 SalReorderAgalaccid = long.Parse(SalesReturnDebitAccountDropDownList.SelectedValue.ToString());
            }
            long MainPurchaseaccid = 0;
            if (PurchaseAccountDropDownList.SelectedValue != null)
            {
                 MainPurchaseaccid = long.Parse(PurchaseAccountDropDownList.SelectedValue.ToString());
            }
            short purchaseaccid = 0;
            if (PurchaseCashAccountDropDownList.SelectedValue != null)
            {
                 purchaseaccid = short.Parse(PurchaseCashAccountDropDownList.SelectedValue.ToString());
            }
            long purchaseAgalaccid = 0;
            if (PurchaseDebitAccountDropDownList.SelectedValue != null)
            {
                 purchaseAgalaccid = long.Parse(PurchaseDebitAccountDropDownList.SelectedValue.ToString());
            }
            long PurReorderaccid = 0;
            if (PurchaseDebitAccountDropDownList.SelectedValue != null)
            {
                 PurReorderaccid = long.Parse(PurchaseReturnCashAccountDropDownList.SelectedValue.ToString());
            }
            long PurReorderAgalaccid = 0;
            if (PurchaseDebitAccountDropDownList.SelectedValue != null)
            {
                 PurReorderAgalaccid = long.Parse(PurchaseReturnDebitAccountDropDownList.SelectedValue.ToString());
            }
            long boxaccid = 0;
            if (PurchaseDebitAccountDropDownList.SelectedValue != null)
            {
                 boxaccid = long.Parse(CashBoxAccountDropDownList.SelectedValue.ToString());

            }
            long bankaccid = 0;
            if (PurchaseDebitAccountDropDownList.SelectedValue != null)
            {
                 bankaccid = long.Parse(BanksAccountDropDownList.SelectedValue.ToString());
            }
            short custaccid = 0;
            if (PurchaseDebitAccountDropDownList.SelectedValue != null)
            {
                 custaccid = short.Parse(CustomersDropDownList.SelectedValue.ToString());

            }
            short suppaccid = 0;
            if (PurchaseDebitAccountDropDownList.SelectedValue != null)
            {
                 suppaccid = short.Parse(suppliersDropDownList.SelectedValue.ToString());
            }

            long Discountaccid = 0;
            if (PurchaseDebitAccountDropDownList.SelectedValue != null)
            {

                 Discountaccid = long.Parse(DiscountAccountDropDownList.SelectedValue.ToString());
            }

            long Paymentsaccid = 0;
            if (PurchaseDebitAccountDropDownList.SelectedValue != null)
            {
                 Paymentsaccid = long.Parse(PaymentAccountDropDownList.SelectedValue.ToString());
            }
            long MovmentProfitsAccid = 0;
            if (PurchaseDebitAccountDropDownList.SelectedValue != null)
            {

                 MovmentProfitsAccid = long.Parse(ProfitAccountDropDownList.SelectedValue.ToString());
            }
            long OsalAccId = 0;
            if (PurchaseDebitAccountDropDownList.SelectedValue != null)
            {

                 OsalAccId = long.Parse(AssetAccountDropDownList.SelectedValue.ToString());
            }

                string CompanyName = "";
                CompanyName=CompanyArNameTextBox.Text ;

                string CompanyNameEng = "";
               CompanyNameEng=CompanyEngNameTextBox.Text ;

                string Address = "";
                Address=CompanyArAddressTextBox.Text  ;

                string AddressEng = "";
                AddressEng=CompanyEngAddressTextBox.Text ;

                string TelPhone = "";
                TelPhone=CompanyTelTextBox.Text ;

                string CompActivty = "";
                CompActivty=CompanyArActivityTextBox.Text ;

                string Fax = "";
                  Fax=ComapanyFaxTextBox.Text ;

                string CompanyEngActivity = "";
                CompanyEngActivity = CompanyEngActivityTextBox.Text;

                string Email = "";
                Email=CompanyEmailTextBox.Text ;

                bool ExpiredFlag ;
                    ExpiredFlag=bool.Parse (ExpiredFlagTextBox.Text) ;
                string SubStartDate ="";
                SubStartDate=SubStartDateTextBox.Text ;
                string SubEndDate = "";
                SubEndDate=SubEndDateTextBox.Text ;
                long Code = long.Parse(txtCode.Text);


            string ImageLogo="";
            if (ImageUploaderFileUploader.HasFile == true)
            {
     
                string exten = System.IO.Path.GetExtension(Server.MapPath(ImageUploaderFileUploader.FileName));
                string Filename = DateTime.Now.ToOADate().ToString() + exten;
                txtImageLogo.Text = Filename;
                string filepath = Path.Combine(Server.MapPath(ImagePath)) + Filename;
                ImageUploaderFileUploader.SaveAs(filepath);
                txtImageLogo.Text = Filename;
            }

            long ? OutId=0;
            DA.DML("2", Code,custaccid ,suppaccid ,salesaccid ,salesAgalaccid ,purchaseaccid ,purchaseAgalaccid ,boxaccid, bankaccid, PurReorderaccid,
                    SalReorderaccid,PurReorderAgalaccid,SalReorderAgalaccid ,Discountaccid,Paymentsaccid,0,Mainsalesaccid,MainPurchaseaccid,OsalAccId,
                    Discountaccid, CompanyName,CompanyNameEng,Address,AddressEng,TelPhone,"", CompActivty,Fax , CompanyEngActivity,Email ,0,
                    MovmentProfitsAccid,ExpiredFlag,SubStartDate,SubEndDate, ImageLogo,ref OutId);

            
            ErrorDiv.Visible = true;
            ErrorDiv.InnerHtml = "<div class=\"alert alert-warning alert-dismissable\"> <h6><i class=\"fa fa-times-circle\"></i> " + Resources.DefaultResource.Savesuccess + "</h6></div>";


        }





    }
}