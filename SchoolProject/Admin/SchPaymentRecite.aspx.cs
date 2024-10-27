using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SchPaymentRecite : WebSchool.Utilities.BaseClass
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //HttpCookie cookieUserType;
       
        //cookieUserType = HttpContext.Current.Request.Cookies.Get("UserType");
        //if (cookieUserType != null)
        //{
        //    if (cookieUserType.Value != "1")
        //    {
        //        //SetPermission();
        //    }

        //}
        
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