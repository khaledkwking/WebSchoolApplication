using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SchWorkOrderRpt : WebSchool.Utilities.BaseClass
{
    string Accessing, Adding, Updating, Deleting, Importing;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        int USERID = int.Parse(Session["UserId"].ToString());// int.Parse(Session["UserID"].ToString());

        //if (Session["OrgId"] != null)
        //{
        //    txtOrgId.Text = Session["OrgId"].ToString();
        //}
        string previousUrl;
        if (Context.Request.UrlReferrer != null)
        {
            previousUrl = Context.Request.UrlReferrer.ToString();
        }
        else
        {
            previousUrl = "Main.aspx";
        }
        BOL.UsersPages DA = new BOL.UsersPages();
        DAL.UsersPages.UsersPagesDataTable dt = new DAL.UsersPages.UsersPagesDataTable();

        dt = DA.Read("1", USERID, 18, "");
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
    }
    //private void SetPermission()
    //{
    //    if (!Globals.SubscriptionsPrim[0])
    //    {
    //        Subs.Attributes["class"] = "disabled";
    //    }
    //    if (!Globals.UsersPrim[0])
    //    {
    //        Users.Attributes["class"] = "disabled";
    //    }
    //    if (!Globals.RenewSubscriptionPrim[0])
    //    {
    //        RenewSub.Attributes["class"] = "disabled";
    //    }
    //    if (!Globals.SubscribersPrim[0])
    //    {
    //        Subscribers.Attributes["class"] = "disabled";
    //    }
    //    if (!Globals.ExpiredSubscriptionsPrim[0])
    //    {
    //        ExpiredSub.Attributes["class"] = "disabled";
    //    }
    //    if (!Globals.setupPrim[0])
    //    {
    //        Setup.Attributes["class"] = "disabled";
    //    }
    //    if (!Globals.PriceListPrim[0])
    //    {
    //        PriceList.Attributes["class"] = "disabled";
    //    }
    //}
}