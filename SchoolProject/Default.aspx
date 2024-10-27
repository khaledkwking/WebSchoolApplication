﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="_Default" Codebehind="Default.aspx.cs" %>

<!DOCTYPE html>

<head id="Head1" runat="server">
      <title>
         
        <%-- <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, Site_title%>" />--%>
           <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, HeaderTitle%>" />
          
      </title>
     <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="shortcut icon" href="~/assets/media/logos/CompLogo-512x512.png" />
    <link rel="apple-touch-icon" sizes="180x180" href="~/assets/media/logos/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="~/assets/media/logos/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="~/assets/media/logos/favicon-16x16.png">


        <!--begin::Fonts -->
  <%--  <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.16/webfont.js"></script>--%>
    <script src="js/webfont1.6.16.js"></script>
    <script>
        WebFont.load({
            google: {
                "families": ["Poppins:300,400,500,600,700", "Roboto:300,400,500,600,700"]
            },
            active: function () {
                sessionStorage.fonts = true;
            }
        });
    </script>

    <!--end::Fonts -->

    <!--begin::Page Custom Styles(used by this page) -->
    <link href="assets/app/custom/login/login-v6.default.css" rel="stylesheet" type="text/css" />

    <!--end::Page Custom Styles -->

    <!--begin:: Global Mandatory Vendors -->
    <link href="assets/vendors/general/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" type="text/css" />

    <!--end:: Global Mandatory Vendors -->

    <!--begin:: Global Optional Vendors -->
    <link href="assets/vendors/general/tether/dist/css/tether.css" rel="stylesheet" type="text/css" />
    <link href="assets/vendors/general/bootstrap-datepicker/dist/css/bootstrap-datepicker3.css" rel="stylesheet" type="text/css" />
    <link href="assets/vendors/general/bootstrap-datetime-picker/css/bootstrap-datetimepicker.css" rel="stylesheet" type="text/css" />
    <link href="assets/vendors/general/bootstrap-timepicker/css/bootstrap-timepicker.css" rel="stylesheet" type="text/css" />
    <link href="assets/vendors/general/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet" type="text/css" />
    <link href="assets/vendors/general/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.css" rel="stylesheet" type="text/css" />
    <link href="assets/vendors/general/bootstrap-select/dist/css/bootstrap-select.css" rel="stylesheet" type="text/css" />
    <link href="assets/vendors/general/bootstrap-switch/dist/css/bootstrap3/bootstrap-switch.css" rel="stylesheet" type="text/css" />
    <link href="assets/vendors/general/select2/dist/css/select2.css" rel="stylesheet" type="text/css" />
    <link href="assets/vendors/general/ion-rangeslider/css/ion.rangeSlider.css" rel="stylesheet" type="text/css" />
    <link href="assets/vendors/general/nouislider/distribute/nouislider.css" rel="stylesheet" type="text/css" />
    <link href="assets/vendors/general/owl.carousel/dist/assets/owl.carousel.css" rel="stylesheet" type="text/css" />
    <link href="assets/vendors/general/owl.carousel/dist/assets/owl.theme.default.css" rel="stylesheet" type="text/css" />
    <link href="assets/vendors/general/dropzone/dist/dropzone.css" rel="stylesheet" type="text/css" />
    <link href="assets/vendors/general/summernote/dist/summernote.css" rel="stylesheet" type="text/css" />
    <link href="assets/vendors/general/bootstrap-markdown/css/bootstrap-markdown.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/vendors/general/animate.css/animate.css" rel="stylesheet" type="text/css" />
    <link href="assets/vendors/general/toastr/build/toastr.css" rel="stylesheet" type="text/css" />
    <link href="assets/vendors/general/morris.js/morris.css" rel="stylesheet" type="text/css" />
    <link href="assets/vendors/general/sweetalert2/dist/sweetalert2.css" rel="stylesheet" type="text/css" />
    <link href="assets/vendors/general/socicon/css/socicon.css" rel="stylesheet" type="text/css" />
    <link href="assets/vendors/custom/vendors/line-awesome/css/line-awesome.css" rel="stylesheet" type="text/css" />
    <link href="assets/vendors/custom/vendors/flaticon/flaticon.css" rel="stylesheet" type="text/css" />
    <link href="assets/vendors/custom/vendors/flaticon2/flaticon.css" rel="stylesheet" type="text/css" />
    <link href="assets/vendors/custom/vendors/fontawesome5/css/all.min.css" rel="stylesheet" type="text/css" />

    <!--end:: Global Optional Vendors -->

    <!--begin::Global Theme Styles(used by all pages) -->
    <link href="assets/demo/default/base/style.bundle.css" rel="stylesheet" type="text/css" />

    <!--end::Global Theme Styles -->

    <!--begin::Layout Skins(used by all pages) -->
    <link href="assets/demo/default/skins/header/base/light.css" rel="stylesheet" type="text/css" />
    <link href="assets/demo/default/skins/header/menu/light.css" rel="stylesheet" type="text/css" />
    <link href="assets/demo/default/skins/brand/dark.css" rel="stylesheet" type="text/css" />
    <link href="assets/demo/default/skins/aside/dark.css" rel="stylesheet" type="text/css" />


   <%-- old login--%>
   <%-- <link href="cssNew/datepicker.css" rel="stylesheet" />
    <link href="cssNew/dateAndTime.css" rel="stylesheet" />
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="cssNew/bootstrap.css" rel="stylesheet">
    <link href="cssNew/font_icon.css" rel="stylesheet">
    <link href="cssNew/fonts.css" rel="stylesheet">
    <link href="cssNew/style.css" rel="stylesheet">
    <link href="cssNew/swiper.min.css" rel="stylesheet">--%>
    
     
   
</head>

<body class="kt-header--fixed kt-header-mobile--fixed kt-subheader--fixed kt-subheader--enabled kt-subheader--solid kt-aside--enabled kt-aside--fixed kt-page--loading">
    <!-- begin:: Page -->
    <!-- end:: Page -->
     <form id="form1" runat="server" defaultbutton="BtnLogin">
    <div class="kt-grid kt-grid--ver kt-grid--root"  style="min-height:900px">
        <div class="kt-grid kt-grid--hor kt-grid--root  kt-login kt-login--v6 kt-login--signin" id="kt_login">
            <div class="kt-grid__item kt-grid__item--fluid kt-grid kt-grid--desktop kt-grid--ver-desktop kt-grid--hor-tablet-and-mobile">
                <div class="kt-grid__item  kt-grid__item--order-tablet-and-mobile-2  kt-grid kt-grid--hor kt-login__aside">
                    <div class="kt-login__wrapper">
                        <div class="kt-login__container" >
                            <div class="kt-login__body" >
                                  <div class="form-group">
                                     
                              
                                <asp:LinkButton ID="ArabicLang" runat="server" CssClass="kt-nav__link loginMargin" OnClick="ArabicLang_Click">
                               <span class="kt-nav__link-icon">
                                <img src="assets/media/flags/021-Kuwait.svg" alt="" style="height: 20px;"/></span>
                                 <span class="kt-nav__link-text">عربي</span>
                                 </asp:LinkButton>

                                       <asp:LinkButton ID="EnglishLang" runat="server" CssClass="kt-nav__link loginMargin" OnClick="EnglishLang_Click">
                                <span class="kt-nav__link-icon loginMargin">
                                    <img src="assets/media/flags/020-flag.svg" alt="" style="height: 20px; " /></span>
                                <span class="kt-nav__link-text">English</span>
                                </asp:LinkButton>
                                   </div>
                         <%--           <div style="text-align: center">
                                     <asp:LinkButton ID="SignUpLinkButton" runat="server" PostBackUrl="~/Admin/CompanyRegistration.aspx" CssClass="kt-login__title font-weight-bold">
                                         
                                         <% if (Session["SiteLanguage"].ToString() == "EnglishTheme") { %>  Press here to Signup New Company <% } else{ %> اضغط هنا لتسجيل شركة جديدة <% };%> 
                                        
                                     </asp:LinkButton>
                                 </div>--%>
                             
                                <div class="kt-login__logo" >
                                    <a href="#">
                                        <img src="Images/LogoNew.png" style="height: 200px" />
                                    </a>
                                </div>
                             
                                <div style="text-align: center">
                                  <asp:Label ID="lblNote" runat="server"  Text=""  ForeColor="Red" Font-Bold="True"></asp:Label>
                                 </div>
                               <%-- <form id="form2" runat="server">--%>
                                    <div class="kt-login__signin">
                                        <div class="kt-login__head">
                                            <h3 class="kt-login__title">
                                                <% if (Session["SiteLanguage"].ToString() == "EnglishTheme") { %>  Login to System <% } else{ %> تسجيل الدخول الى النظام <% };%> 
                                            </h3>
                                        </div>

                                        <div class="">
                                            <div class="kt-form form-group">
                                                
                                                <div>
                                                  <asp:Label ID="LblCompany" runat="server"  Text="" Visible="False" ForeColor="Red" Font-Bold="True"></asp:Label>
                                                </div>
                                                <div class="form-group">
                                                  <%--  <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="اسم المستخدم" OnTextChanged="txtUserName_TextChanged"></asp:TextBox>--%>
                                                     <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control rounded" placeholder="<%$ Resources:DefaultResource, UserName%>" required="required" AutoPostBack="True" OnTextChanged="txtUserName_TextChanged"  ></asp:TextBox>
                                                </div>
                                             
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control rounded" placeholder="<%$ Resources:DefaultResource, Password%>" TextMode="Password"></asp:TextBox>
                                                </div>

                                                <div class="kt-login__extra">
                                                    <label class="kt-checkbox">
                                                        <input id="RememberMeCheckBox" runat="server" type="checkbox" name="remember" />
                                                        <asp:Literal runat="server" ID ="txtRem" Text="<%$ Resources:DefaultResource, RememberMe%>"  />

                                                        <span></span>
                                                    </label>
                                                </div>
                                                
                                               <div class="kt-login__actions">
                                                    <asp:Button ID="BtnLogin" runat="server" CssClass="btn btn-brand btn-pill btn-elevate" Text="<%$ Resources:DefaultResource, signin%>" OnClick="BtnLogin_Click" />
                                                </div>
                                                    <div class="form-row">
                                                        <div class="form-group col-lg-12">
                                                            <div id="lblMsg" runat="server"></div>

                                                        </div>
                                                    </div>
                                                <%--<div id="lblMsg" runat="server"></div>--%>
                                            </div>
                                        </div>
                                    </div>
                                <%--</form>--%>

                            </div>
                        </div>
                    </div>
                </div>
                <% if (Session["SiteLanguage"].ToString() == "EnglishTheme") { %>  
                <div class="kt-grid__item kt-grid__item--fluid kt-grid__item--center kt-grid kt-grid--ver kt-login__content" style="background: #dedede url(assets/media/bg/edu3.jpg) center center no-repeat; background-size:cover;">
                    <div class="kt-login__section">
                    </div>
                </div>
               <% } else{ %> 
                <div class="kt-grid__item kt-grid__item--fluid kt-grid__item--center kt-grid kt-grid--ver kt-login__content" style="background: #dedede url(assets/media/bg/edu3.jpg) center center no-repeat; background-size:cover;">
                    <div class="kt-login__section">
                    </div>
                </div>
                <% };%> 
                
            </div>
        </div>
    </div>
         </form>
    <!-- end:: Page -->
   
    <!-- begin::Global Config(global config for global JS sciprts) -->
    <script>
        var KTAppOptions = {
            "colors": {
                "state": {
                    "brand": "#5d78ff",
                    "dark": "#282a3c",
                    "light": "#ffffff",
                    "primary": "#5867dd",
                    "success": "#34bfa3",
                    "info": "#36a3f7",
                    "warning": "#ffb822",
                    "danger": "#fd3995"
                },
                "base": {
                    "label": ["#c5cbe3", "#a1a8c3", "#3d4465", "#3e4466"],
                    "shape": ["#f0f3ff", "#d9dffa", "#afb4d4", "#646c9a"]
                }
            }
        };
    </script>

    <!-- end::Global Config -->

    <!--begin:: Global Mandatory Vendors -->
    <script src="assets/vendors/general/jquery/dist/jquery.js" type="text/javascript"></script>
    <script src="assets/vendors/general/popper.js/dist/umd/popper.js" type="text/javascript"></script>
    <script src="assets/vendors/general/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="assets/vendors/general/js-cookie/src/js.cookie.js" type="text/javascript"></script>
    <script src="assets/vendors/general/moment/min/moment.min.js" type="text/javascript"></script>
    <script src="assets/vendors/general/tooltip.js/dist/umd/tooltip.min.js" type="text/javascript"></script>
    <script src="assets/vendors/general/perfect-scrollbar/dist/perfect-scrollbar.js" type="text/javascript"></script>
    <script src="assets/vendors/general/sticky-js/dist/sticky.min.js" type="text/javascript"></script>
    <script src="assets/vendors/general/wnumb/wNumb.js" type="text/javascript"></script>
    
    <!--end:: Global Mandatory Vendors -->

    <!--begin:: Global Optional Vendors -->
    <%--<script src="assets/vendors/general/jquery-form/dist/jquery.form.min.js" type="text/javascript"></script>
    <script src="assets/vendors/general/block-ui/jquery.blockUI.js" type="text/javascript"></script>
    <script src="assets/vendors/general/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
    <script src="assets/vendors/custom/components/vendors/bootstrap-datepicker/init.js" type="text/javascript"></script>
    <script src="assets/vendors/general/bootstrap-datetime-picker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
    <script src="assets/vendors/general/bootstrap-timepicker/js/bootstrap-timepicker.min.js" type="text/javascript"></script>
    <script src="assets/vendors/custom/components/vendors/bootstrap-timepicker/init.js" type="text/javascript"></script>
    <script src="assets/vendors/general/bootstrap-daterangepicker/daterangepicker.js" type="text/javascript"></script>
    <script src="assets/vendors/general/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.js" type="text/javascript"></script>
    <script src="assets/vendors/general/bootstrap-maxlength/src/bootstrap-maxlength.js" type="text/javascript"></script>
    <script src="assets/vendors/custom/vendors/bootstrap-multiselectsplitter/bootstrap-multiselectsplitter.min.js" type="text/javascript"></script>
    <script src="assets/vendors/general/bootstrap-select/dist/js/bootstrap-select.js" type="text/javascript"></script>
    <script src="assets/vendors/general/bootstrap-switch/dist/js/bootstrap-switch.js" type="text/javascript"></script>
    <script src="assets/vendors/custom/components/vendors/bootstrap-switch/init.js" type="text/javascript"></script>
    <script src="assets/vendors/general/select2/dist/js/select2.full.js" type="text/javascript"></script>
    <script src="assets/vendors/general/ion-rangeslider/js/ion.rangeSlider.js" type="text/javascript"></script>
    <script src="assets/vendors/general/typeahead.js/dist/typeahead.bundle.js" type="text/javascript"></script>
    <script src="assets/vendors/general/handlebars/dist/handlebars.js" type="text/javascript"></script>
    <script src="assets/vendors/general/inputmask/dist/jquery.inputmask.bundle.js" type="text/javascript"></script>
    <script src="assets/vendors/general/inputmask/dist/inputmask/inputmask.date.extensions.js" type="text/javascript"></script>
    <script src="assets/vendors/general/inputmask/dist/inputmask/inputmask.numeric.extensions.js" type="text/javascript"></script>
    <script src="assets/vendors/general/nouislider/distribute/nouislider.js" type="text/javascript"></script>
    <script src="assets/vendors/general/owl.carousel/dist/owl.carousel.js" type="text/javascript"></script>
    <script src="assets/vendors/general/autosize/dist/autosize.js" type="text/javascript"></script>
    <script src="assets/vendors/general/clipboard/dist/clipboard.min.js" type="text/javascript"></script>
    <script src="assets/vendors/general/dropzone/dist/dropzone.js" type="text/javascript"></script>
    <script src="assets/vendors/general/summernote/dist/summernote.js" type="text/javascript"></script>
    <script src="assets/vendors/general/markdown/lib/markdown.js" type="text/javascript"></script>
    <script src="assets/vendors/general/bootstrap-markdown/js/bootstrap-markdown.js" type="text/javascript"></script>
    <script src="assets/vendors/custom/components/vendors/bootstrap-markdown/init.js" type="text/javascript"></script>
    <script src="assets/vendors/general/bootstrap-notify/bootstrap-notify.min.js" type="text/javascript"></script>
    <script src="assets/vendors/custom/components/vendors/bootstrap-notify/init.js" type="text/javascript"></script>
    <script src="assets/vendors/general/jquery-validation/dist/jquery.validate.js" type="text/javascript"></script>
    <script src="assets/vendors/general/jquery-validation/dist/additional-methods.js" type="text/javascript"></script>
    <script src="assets/vendors/custom/components/vendors/jquery-validation/init.js" type="text/javascript"></script>
    <script src="assets/vendors/general/toastr/build/toastr.min.js" type="text/javascript"></script>
    <script src="assets/vendors/general/raphael/raphael.js" type="text/javascript"></script>
    <script src="assets/vendors/general/morris.js/morris.js" type="text/javascript"></script>
    <script src="assets/vendors/general/chart.js/dist/Chart.bundle.js" type="text/javascript"></script>
    <script src="assets/vendors/custom/vendors/bootstrap-session-timeout/dist/bootstrap-session-timeout.min.js" type="text/javascript"></script>
    <script src="assets/vendors/custom/vendors/jquery-idletimer/idle-timer.min.js" type="text/javascript"></script>
    <script src="assets/vendors/general/waypoints/lib/jquery.waypoints.js" type="text/javascript"></script>
    <script src="assets/vendors/general/counterup/jquery.counterup.js" type="text/javascript"></script>
    <script src="assets/vendors/general/es6-promise-polyfill/promise.min.js" type="text/javascript"></script>
    <script src="assets/vendors/general/sweetalert2/dist/sweetalert2.min.js" type="text/javascript"></script>
    <script src="assets/vendors/custom/components/vendors/sweetalert2/init.js" type="text/javascript"></script>
    <script src="assets/vendors/general/jquery.repeater/src/lib.js" type="text/javascript"></script>
    <script src="assets/vendors/general/jquery.repeater/src/jquery.input.js" type="text/javascript"></script>
    <script src="assets/vendors/general/jquery.repeater/src/repeater.js" type="text/javascript"></script>
    <script src="assets/vendors/general/dompurify/dist/purify.js" type="text/javascript"></script>--%>

    <!--end:: Global Optional Vendors -->

   <%-- <!--begin::Global Theme Bundle(used by all pages) -->
    <script src="assets/demo/default/base/scripts.bundle.js" type="text/javascript"></script>

    <!--end::Global Theme Bundle -->

    <!--begin::Page Scripts(used by this page) -->
    <script src="assets/app/custom/login/login-general.js" type="text/javascript"></script>

    <!--end::Page Scripts -->

    <!--begin::Global App Bundle(used by all pages) -->
    <script src="assets/app/bundle/app.bundle.js" type="text/javascript"></script>--%>
              
    
    <asp:ObjectDataSource ID="ObjectDataSourceuserFunctions" runat="server" SelectMethod="GetDataByUserId" TypeName="NEWERPDataSetTableAdapters.UserFunctionsViewTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtUserId" Name="UserId" PropertyName="Text" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
    
                <asp:ObjectDataSource ID="ObjectDataSourceUserView" runat="server" SelectMethod="GetDataByUser" TypeName="PersonalDataSetTableAdapters.UserViewTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtUserName" Name="userName" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
    
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByUserName" TypeName="WebSchool.NEWERPDataSetTableAdapters.USERTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_ID" Type="Int32" />
                        <asp:Parameter Name="Original_USER_NAME" Type="String" />
                        <asp:Parameter Name="Original_PASSWORD" Type="String" />
                        <asp:Parameter Name="Original_STATUS" Type="Int32" />
                        <asp:Parameter Name="Original_USER_TYPE" Type="Int32" />
                        <asp:Parameter Name="Original_MEMBER_ID" Type="String" />
                        <asp:Parameter Name="Original_Branch" Type="Int64" />
                        <asp:Parameter Name="Original_Name" Type="String" />
                        <asp:Parameter Name="Original_BackGround" Type="String" />
                        <asp:Parameter Name="Original_OrgId" Type="Int64" />
                        <asp:Parameter Name="Original_ExpiredFlag" Type="Boolean" />
                        <asp:Parameter Name="Original_SubEndDate" Type="DateTime" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="USER_NAME" Type="String" />
                        <asp:Parameter Name="PASSWORD" Type="String" />
                        <asp:Parameter Name="STATUS" Type="Int32" />
                        <asp:Parameter Name="USER_TYPE" Type="Int32" />
                        <asp:Parameter Name="MEMBER_ID" Type="String" />
                        <asp:Parameter Name="Branch" Type="Int64" />
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="BackGround" Type="String" />
                        <asp:Parameter Name="OrgId" Type="Int64" />
                        <asp:Parameter Name="ExpiredFlag" Type="Boolean" />
                        <asp:Parameter Name="SubEndDate" Type="DateTime" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtUserName" Name="userName" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtPassword" Name="pw" PropertyName="Text" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="USER_NAME" Type="String" />
                        <asp:Parameter Name="PASSWORD" Type="String" />
                        <asp:Parameter Name="STATUS" Type="Int32" />
                        <asp:Parameter Name="USER_TYPE" Type="Int32" />
                        <asp:Parameter Name="MEMBER_ID" Type="String" />
                        <asp:Parameter Name="Branch" Type="Int64" />
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="BackGround" Type="String" />
                        <asp:Parameter Name="OrgId" Type="Int64" />
                        <asp:Parameter Name="ExpiredFlag" Type="Boolean" />
                        <asp:Parameter Name="SubEndDate" Type="DateTime" />
                        <asp:Parameter Name="Original_ID" Type="Int32" />
                        <asp:Parameter Name="Original_USER_NAME" Type="String" />
                        <asp:Parameter Name="Original_PASSWORD" Type="String" />
                        <asp:Parameter Name="Original_STATUS" Type="Int32" />
                        <asp:Parameter Name="Original_USER_TYPE" Type="Int32" />
                        <asp:Parameter Name="Original_MEMBER_ID" Type="String" />
                        <asp:Parameter Name="Original_Branch" Type="Int64" />
                        <asp:Parameter Name="Original_Name" Type="String" />
                        <asp:Parameter Name="Original_BackGround" Type="String" />
                        <asp:Parameter Name="Original_OrgId" Type="Int64" />
                        <asp:Parameter Name="Original_ExpiredFlag" Type="Boolean" />
                        <asp:Parameter Name="Original_SubEndDate" Type="DateTime" />
                    </UpdateParameters>
                </asp:ObjectDataSource>
                <p>
    
    <asp:TextBox ID="txtUserId" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1"></asp:TextBox>
    
                </p>
    
                </body>


