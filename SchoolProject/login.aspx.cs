using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;
using System.Data;
using System.Globalization;

namespace WebSchool
{
    public partial class login : WebSchool.Utilities.BaseClass2
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Form.DefaultButton = "LoginLinkButton";
        }

        protected void LoginLinkButton_Click(object sender, EventArgs e)
        {
            try
            {
                BOL.Sch_Teachers UserLoginDa = new BOL.Sch_Teachers();

                BOL.Sch_Teachers UserAdminDa = new BOL.Sch_Teachers();
                DataTable UserAdminDt = default(DAL.Teachers.Sch_TeachersDataTable);

                //DataRow UserRow = null;
                string UserName, Password;
                UserName = UserNameTextBox.Text;
                Password = PasswordTextBox.Text;

                UserAdminDt = UserAdminDa.Read("1",0,0,0,0, 0,0,0, UserName, Password,0, null);
                if (UserAdminDt.Rows.Count > 0)
                {
                    DataRow UserRow = UserAdminDt.Rows[0];

                    Session["FullName"] = UserRow["Name"].ToString();
                    Session["TeacherId"] = UserRow["TeacherId"];
                    Session["OrgId"] = UserRow["OrgId"];
                    //UserLoginDa.DML("1", 0, int.Parse(UserRow["UserID"].ToString()), UserName, "Success");
                    long OrgId = long.Parse(Session["OrgId"].ToString());
                    BOL.Setup SetupDa = new BOL.Setup();
                    DAL.Setup.SetupDataTable Dt;
                     Dt = SetupDa.Read("1", OrgId,"","","");
                    if (Dt.Rows.Count > 0)
                    {
                       string  CompanyName= Dt.Rows[0]["CompanyName"].ToString ();
                        Globals.CompanyName = CompanyName;
                    }
                      Response.Redirect("~/Admin/MainTeacher.aspx");
                }
                else
                {
                    Session["FullName"] = null;
                    Session["TeacherId"] = null;
                    Session["OrgId"] = null;
                    //UserLoginDa.DML("1", 0, 0, UserName, "Fail");

                    ErrorDiv.Visible = true;
                    //lblMsg.InnerText = "خطا فى كلمة المرور";
                    ErrorDiv.InnerHtml = "<div class=\"alert alert-warning alert-dismissable\"> بيانات غير صحيحة  يرجي ادخال أسم المستخدم و كلمة المرور بطريقة صحيحة</div>";

                    //ErrorDiv.InnerHtml = "<div class=\"alert alert-warning alert-dismissable\"> <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×</button><h4><i class=\"fa fa-times-circle\"></i> Error</h4>" + Resources.DefaultResource.LoginError + "</div>";
                }
            }
            catch (Exception ex)
            {
                ErrorDiv.InnerHtml = "<div class=\"alert alert-warning alert-dismissable\"> <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×</button><h4><i class=\"fa fa-times-circle\"></i> Error</h4> " + ex.Message.ToString() + " </div>";
            }
            //BOL.Users DA = new BOL.Users();
            //DAL.Users.UsersDataTable dt = default(DAL.Users.UsersDataTable);

            //dt = DA.Read("2", 0, UserNameTextBox.Text, PasswordTextBox.Text, "");

            //if (dt.Rows.Count > 0)
            //{
            //    Session["UserName"] = dt.Rows[0]["UserName"].ToString();
            //    Session["RoleID"] = dt.Rows[0]["RoleID"].ToString();
            //    Session["FullName"] = dt.Rows[0]["FullName"].ToString();
            //}
            //else 
            //{
            //    ErrorDiv.InnerHtml = "<div class=\"alert alert-danger alert-dismissable\"> <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×</button><h4><i class=\"fa fa-times-circle\"></i> Error</h4>Wrong user name / Password</div>";
            //}
        }
    }
}