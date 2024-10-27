using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;
using System.Data;
using System.Globalization;
public partial class _Default : WebSchool.Utilities.BaseClass2
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        ChangeTilte();
    }
    protected void ChangeTilte()
    {
        if (Session["SiteLanguage"].ToString() == "EnglishTheme")
        {
            txtUserName.Attributes["placeholder"] = "UserName" ;
            txtPassword.Attributes["placeholder"] = "Password";
            txtRem.Text = "Remember Me";
            BtnLogin.Text = "Login";
            lblNote.Text = "Default  UserName: test   and  Password: test";
        }
        else
        {
            txtUserName.Attributes["placeholder"] = "أسم المستخدم" ;
            txtPassword.Attributes["placeholder"] = "كلمة المرور";
            txtRem.Text = "تذكرني";
            BtnLogin.Text = "دخول";
            lblNote.Text = "أسم المستخدم الافتراضى: test     كلمة المرور : test";
        }
    }
   
    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        {
           
            var arg = new DataSourceSelectArguments();
            // sqlgetdata.SelectCommand = "select *  from payment where paymentid='" & Val(txtpaymentid.Text) & "'"
            string s = txtPassword.Text;
            DataView v = (DataView)ObjectDataSource1.Select();
            if ((!(v == null)))
            {
                if (v.Table.Rows.Count > 0)
                {
                    

                    Session["USER_NAME"] = v.Table.Rows[0]["USER_NAME"].ToString();
                    Session["Name"] = v.Table.Rows[0]["Name"].ToString();
                    Session["OrgId"] = v.Table.Rows[0]["OrgId"].ToString();
                    Session["UserId"] = v.Table.Rows[0]["Id"].ToString();
                    Session["USER_TYPE"] = v.Table.Rows[0]["USER_TYPE"].ToString();
                    Session["RoleID"] = v.Table.Rows[0]["USER_TYPE"].ToString();

                    txtUserId.Text = v.Table.Rows[0]["Id"].ToString();
                   
                    //userdata.Value = v.Table.Rows[0]["USER_NAME"].ToString();
                    //userIddata.Value = v.Table.Rows[0]["Id"].ToString();
                   
                    //Namedata.Value = v.Table.Rows[0]["Name"].ToString();
                    //OrgIddata.Value = v.Table.Rows[0]["OrgId"].ToString();
                    txtUserId.Text = v.Table.Rows[0]["Id"].ToString();


                    //UserSignIddata.Value = v.Table.Rows[0]["UserSign"].ToString();
                    //UserTypeIddata.Value = v.Table.Rows[0]["USER_TYPE"].ToString();

                    //UserTypeIddata.Expires = DateTime.Now.AddHours(1);
                    //Response.Cookies.Add(UserTypeIddata);

                    //userdata.Expires = DateTime.Now.AddHours(1);
                    //Response.Cookies.Add(userdata);

                    //userIddata.Expires = DateTime.Now.AddHours(1);
                    //Response.Cookies.Add(userIddata);

                    //Namedata.Expires = DateTime.Now.AddHours(1);
                    //Response.Cookies.Add(Namedata);

                    //UserSignIddata.Expires = DateTime.Now.AddHours(1);
                    //Response.Cookies.Add(UserSignIddata);

                    //OrgIddata.Expires = DateTime.Now.AddHours(1);
                    //Response.Cookies.Add(OrgIddata);

                    GetNotifacations();
                    
                    DataView v1 = (DataView)ObjectDataSourceUserView.Select();
                    if ((!(v1 == null)))
                    {
                        if (v1.Table.Rows.Count > 0)
                        {


                            if (v1.Table.Rows[0]["ExpiredFlag"] != null)
                            {
                                if (Boolean.Parse(v1.Table.Rows[0]["ExpiredFlag"].ToString()))
                                {

                                    lblMsg.Visible = true;
                                    lblMsg.InnerHtml = "<div class=\"alert alert-warning alert-dismissable\"> انتهى الاشتراك الخاص بكم يرجى تجديد الاشتراك</div>";
                                    //lblMsg.InnerText = "انتهى الاشتراك الخاص بكم يرجى تجديد الاشتراك";
                                }
                                else
                                {
                                    if (DateTime.Parse(v1.Table.Rows[0]["SubEndDate"].ToString()) < DateTime.Today)
                                    {
                                        lblMsg.Visible = true;
                                        lblMsg.InnerText = "انتهى الاشتراك الخاص بكم يرجى تجديد الاشتراك";
                                    }
                                    else
                                    {
                                        if (v1.Table.Rows[0]["CompanyName"].ToString() != "")
                                        {
                                            Globals.CompanyName = v1.Table.Rows[0]["CompanyName"].ToString();
                                        }

                                        //if (v1.Table.Rows[0]["boxaccid"].ToString() != "")
                                        //{
                                        //    Messages.boxAccid = int.Parse(v1.Table.Rows[0]["boxaccid"].ToString());
                                        //}
                                        //if (v1.Table.Rows[0]["bankaccid"].ToString() != "")
                                        //{
                                        //    Messages.bankaccid = int.Parse(v1.Table.Rows[0]["bankaccid"].ToString());
                                        //}
                                        //if (v1.Table.Rows[0]["custaccid"].ToString() != "")
                                        //{
                                        //    Messages.custaccid = int.Parse(v1.Table.Rows[0]["custaccid"].ToString());
                                        //}
                                        //if (v1.Table.Rows[0]["suppaccid"].ToString() != "")
                                        //{
                                        //    Messages.suppaccid = int.Parse(v1.Table.Rows[0]["suppaccid"].ToString());
                                        //}
                                        //if (v1.Table.Rows[0]["salesaccid"].ToString() != "")
                                        //{
                                        //    Messages.salesaccid = int.Parse(v1.Table.Rows[0]["salesaccid"].ToString());
                                        //}
                                        //if (v1.Table.Rows[0]["salesAgalaccid"].ToString() != "")
                                        //{
                                        //    Messages.salesAgalaccid = int.Parse(v1.Table.Rows[0]["salesAgalaccid"].ToString());
                                        //}
                                        //if (v1.Table.Rows[0]["purchaseAgalaccid"].ToString() != "")
                                        //{
                                        //    Messages.purchaseAgalaccid = int.Parse(v1.Table.Rows[0]["purchaseAgalaccid"].ToString());
                                        //}

                                        //if (v1.Table.Rows[0]["Discountaccid"].ToString() != "")
                                        //{
                                        //    Messages.Discountaccid = int.Parse(v1.Table.Rows[0]["Discountaccid"].ToString());
                                        //}
                                        //if (v1.Table.Rows[0]["purchaseaccid"].ToString() != "")
                                        //{
                                        //    Messages.purchaseaccid = int.Parse(v1.Table.Rows[0]["purchaseaccid"].ToString());
                                        //}
                                        //if (v1.Table.Rows[0]["PurReorderaccid"].ToString() != "")
                                        //{
                                        //    Messages.PurReorderaccid = int.Parse(v1.Table.Rows[0]["PurReorderaccid"].ToString());
                                        //}
                                        //if (v1.Table.Rows[0]["SalReorderaccid"].ToString() != "")
                                        //{
                                        //    Messages.SalReorderaccid = int.Parse(v1.Table.Rows[0]["SalReorderaccid"].ToString());
                                        //}

                                        //if (v1.Table.Rows[0]["PurReorderAgalaccid"].ToString() != "")
                                        //{
                                        //    Messages.PurReorderAgalaccid = int.Parse(v1.Table.Rows[0]["PurReorderAgalaccid"].ToString());
                                        //}
                                        //if (v1.Table.Rows[0]["SalReorderAgalaccid"].ToString() != "")
                                        //{
                                        //    Messages.SalReorderAgalaccid = int.Parse(v1.Table.Rows[0]["SalReorderAgalaccid"].ToString());
                                        //}


                                        //if (v1.Table.Rows[0]["Mainsalesaccid"].ToString() != "")
                                        //{
                                        //    Messages.MainSalesAccid = int.Parse(v1.Table.Rows[0]["Mainsalesaccid"].ToString());
                                        //}

                                        //if (v1.Table.Rows[0]["MainPurchaseaccid"].ToString() != "")
                                        //{
                                        //    Messages.MainPurchaseaccid = int.Parse(v1.Table.Rows[0]["MainPurchaseaccid"].ToString());
                                        //}


                                        //if (v1.Table.Rows[0]["Paymentsaccid"].ToString() != "")
                                        //{
                                        //    Messages.Paymentsaccid = int.Parse(v1.Table.Rows[0]["Paymentsaccid"].ToString());
                                        //}


                                        //if (v1.Table.Rows[0]["OsalAccId"].ToString() != "")
                                        //{
                                        //    Messages.OsalAccId = int.Parse(v1.Table.Rows[0]["OsalAccId"].ToString());
                                        //}


                                        //if (v1.Table.Rows[0]["InsuranceSalesAccid"].ToString() != "")
                                        //{
                                        //    Messages.InsuranceSalesaccid = int.Parse(v1.Table.Rows[0]["InsuranceSalesAccid"].ToString());
                                        //}

                                        //if (v1.Table.Rows[0]["InsuranceBoxAccid"].ToString() != "")
                                        //{
                                        //    Messages.InsuranceBoxaccid = int.Parse(v1.Table.Rows[0]["InsuranceBoxAccid"].ToString());
                                        //}



                                        //if (v1.Table.Rows[0]["DeductAccId"].ToString() != "")
                                        //{
                                        //    Messages.DeductAccId = int.Parse(v1.Table.Rows[0]["DeductAccId"].ToString());
                                        //}
                                        //if (v1.Table.Rows[0]["SalesTakastaccid"].ToString() != "")
                                        //{
                                        //    Messages.SalesTakastaccid = int.Parse(v1.Table.Rows[0]["SalesTakastaccid"].ToString());
                                        //}

                                        //if (v1.Table.Rows[0]["MovmentProfitsAccid"].ToString() != "")
                                        //{
                                        //    Messages.MovmentProfitsAccid = int.Parse(v1.Table.Rows[0]["MovmentProfitsAccid"].ToString());
                                        //}

                                        Response.Redirect("~/admin/main.aspx");

                                    }
                                }
                            }


                           

                        }
                    }
                }
                else
                {
                    lblMsg.Visible = true;
                    //lblMsg.InnerText = "خطا فى كلمة المرور";
                    lblMsg.InnerHtml = "<div class=\"alert alert-warning alert-dismissable\"> بيانات غير صحيحة  يرجي ادخال أسم المستخدم و كلمة المرور بطريقة صحيحة</div>";
                }
            }
        }

    }
    private void GetNotifacations()
    {
        BOL.Sch_InvPaymentDates DA3 = new BOL.Sch_InvPaymentDates();
        DAL.InvPaymentDates.Sch_InvPaymentDatesDataTable dt3 = new DAL.InvPaymentDates.Sch_InvPaymentDatesDataTable();
        DateTime DayDate = DateTime.Today.AddDays(3);
        int USERID = int.Parse(Session["UserId"].ToString());
        long QrgId = long.Parse(Session["OrgId"].ToString());
        int RoleId = 0;
        if (Session["RoleID"] != null)
        {
            if (Session["RoleID"].ToString() != "")
            {
                RoleId = int.Parse(Session["RoleID"].ToString());
            }
            if (RoleId == 1 || RoleId == 5)
            {
                USERID = 0;
            }
        }



        int Count = DA3.ReadCount("1", "", DayDate.ToShortDateString(), QrgId, USERID, 0, 0);
        Globals.TotalNotPayDate = Count.ToString();

        BOL.Sch_Invoices DAInv = new BOL.Sch_Invoices();
        DAL.School.Sch_InvoicesDataTable dtInv = new DAL.School.Sch_InvoicesDataTable();

        int InvCount = DAInv.ReadCount("1", 2, QrgId, USERID, 0, "", DayDate.ToShortDateString());
        Globals.TotalNotGroup = InvCount.ToString();

        int InvIndCount = DAInv.ReadIndividualCount("1", 1, QrgId, USERID, 0, "", "");
        Globals.TotalNotInv = InvIndCount.ToString();
    }
    private void GetUserPermission()
    {

        DataView v = (DataView)ObjectDataSourceuserFunctions.Select();
        if ((!(v == null)))
        {
            if (v.Table.Rows.Count > 0)
            {
                int i=0;
                for (i = 0; i < v.Count; i++)
                {
                    v.Table.Rows[i]["FUNCTION_ID"].ToString();
                    int FunId = int.Parse(v.Table.Rows[i]["FUNCTION_ID"].ToString());
                    string FunName = v.Table.Rows[i]["FNAME"].ToString();
                    //switch (FunName)
                    //{
                        //case "Subs":
                        //        Globals.SubscriptionsPrim[0] = Boolean.Parse(v.Table.Rows[i]["FOpen"].ToString());
                        //        Globals.SubscriptionsPrim[1] = Boolean.Parse(v.Table.Rows[i]["FUpdate"].ToString());
                        //        Globals.SubscriptionsPrim[2] = Boolean.Parse(v.Table.Rows[i]["FDel"].ToString());
                        //    break;
                        //case "Users":
                        //        Globals.UsersPrim[0] = Boolean.Parse(v.Table.Rows[i]["FOpen"].ToString());
                        //        Globals.UsersPrim[1] = Boolean.Parse(v.Table.Rows[i]["FUpdate"].ToString());
                        //        Globals.UsersPrim[2] = Boolean.Parse(v.Table.Rows[i]["FDel"].ToString());
                        //    break ;
                        //case "RenewSubscription":
                        //    Globals.RenewSubscriptionPrim [0] = Boolean.Parse(v.Table.Rows[i]["FOpen"].ToString());
                        //    Globals.RenewSubscriptionPrim[1] = Boolean.Parse(v.Table.Rows[i]["FUpdate"].ToString());
                        //    Globals.RenewSubscriptionPrim[2] = Boolean.Parse(v.Table.Rows[i]["FDel"].ToString());
                        //    break;
                        //case "SuberData":
                        //    Globals.SubscribersPrim[0] = Boolean.Parse(v.Table.Rows[i]["FOpen"].ToString());
                        //    Globals.SubscribersPrim[1] = Boolean.Parse(v.Table.Rows[i]["FUpdate"].ToString());
                        //    Globals.SubscribersPrim[2] = Boolean.Parse(v.Table.Rows[i]["FDel"].ToString());
                        //    break;
                        //case "ExpiredSub":
                        //    Globals.ExpiredSubscriptionsPrim[0] = Boolean.Parse(v.Table.Rows[i]["FOpen"].ToString());
                        //    Globals.ExpiredSubscriptionsPrim[1] = Boolean.Parse(v.Table.Rows[i]["FUpdate"].ToString());
                        //    Globals.ExpiredSubscriptionsPrim[2] = Boolean.Parse(v.Table.Rows[i]["FDel"].ToString());
                        //    break;
                        //case "setup":
                        //    Globals.setupPrim[0] = Boolean.Parse(v.Table.Rows[i]["FOpen"].ToString());
                        //    Globals.setupPrim[1] = Boolean.Parse(v.Table.Rows[i]["FUpdate"].ToString());
                        //    Globals.setupPrim[2] = Boolean.Parse(v.Table.Rows[i]["FDel"].ToString());
                        //    break;
                        //case "Pricelist":
                        //    Globals.PriceListPrim[0] = Boolean.Parse(v.Table.Rows[i]["FOpen"].ToString());
                        //    Globals.PriceListPrim[1] = Boolean.Parse(v.Table.Rows[i]["FUpdate"].ToString());
                        //    Globals.PriceListPrim[2] = Boolean.Parse(v.Table.Rows[i]["FDel"].ToString());
                        //    break;
                    //}
                   
                }
            }
        }
        
    }
    protected void txtUserName_TextChanged(object sender, EventArgs e)
    {
        DataView v = (DataView)ObjectDataSourceUserView.Select();
        if ((!(v == null)))
        {
            if (v.Table.Rows.Count > 0)
            {
                LblCompany.Visible = true;
                LblCompany.Text = v.Table.Rows[0]["CompanyName"].ToString();
                HttpCookie OrgDescdata = new HttpCookie("OrgDesc");
                OrgDescdata.Value = LblCompany.Text;
                OrgDescdata.Expires = DateTime.Now.AddHours(1);
                Response.Cookies.Add(OrgDescdata);
            }
            else
            {
                LblCompany.Visible = false;
            }
       }
    }

    protected void EnglishLang_Click(object sender, EventArgs e)
    {
        Session["SiteLanguage"] = "EnglishTheme";
        Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture("en-US");
        Thread.CurrentThread.CurrentUICulture = new CultureInfo("en-US");
        Response.Redirect(Request.RawUrl);
    }

    protected void ArabicLang_Click(object sender, EventArgs e)
    {
        Session["SiteLanguage"] = "ArabicTheme";
        Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture("ar-KW");
        Thread.CurrentThread.CurrentUICulture = new CultureInfo("ar-KW");
        Response.Redirect(Request.RawUrl);
    }
}