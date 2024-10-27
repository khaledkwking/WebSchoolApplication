<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebSchool.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" class="no-js">
<!--<![endif]-->
<head runat="server">
    <meta charset="utf-8" />

    <title><%= Resources.DefaultResource.HeaderTitle%> </title>
    
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0" />

    <!-- Icons -->
    <!-- The following icons can be replaced with your own, they are used by desktop and mobile browsers -->
    <link rel="shortcut icon" href="assets/img/favicon.ico" />
    <link rel="apple-touch-icon" href="assets/img/icon57.png" sizes="57x57" />
    <link rel="apple-touch-icon" href="assets/img/icon72.png" sizes="72x72" />
    <link rel="apple-touch-icon" href="assets/img/icon76.png" sizes="76x76" />
    <link rel="apple-touch-icon" href="assets/img/icon114.png" sizes="114x114" />
    <link rel="apple-touch-icon" href="assets/img/icon120.png" sizes="120x120" />
    <link rel="apple-touch-icon" href="assets/img/icon144.png" sizes="144x144" />
    <link rel="apple-touch-icon" href="assets/img/icon152.png" sizes="152x152" />
    <!-- END Icons -->
    <!-- Stylesheets -->
    <!-- Bootstrap is included in its original form, unaltered -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />

    <link rel="stylesheet" href="assets/css/CustomApp.css" />

    <!-- Related styles of various icon packs and plugins -->
    <link rel="stylesheet" href="assets/css/plugins.css" />

    <!-- The main stylesheet of this template. All Bootstrap overwrites are defined in here -->
    <link rel="stylesheet" href="assets/css/main.css" />

    <!-- Include a specific file here from css/themes/ folder to alter the default theme of the template -->
    <!-- The themes stylesheet of this template (for using specific theme color in individual elements - must included last) -->
    <link rel="stylesheet" href="~/assets/css/themes.css" />
    <!-- END Stylesheets -->
    <!-- Modernizr (browser feature detection library) & Respond.js (Enable responsive CSS code on browsers that don't support it, eg IE8) -->
   <%-- <script src="Admin/js/vendor/modernizr-2.7.1-respond-1.4.2.min.js"></script>--%>
     <script src="assets/js/vendor/modernizr-3.6.0.min"></script>
</head>
<body>

    <form id="form2" runat="server">
        <!-- Login Full Background -->
        <!-- For best results use an image with a resolution of 1280x1280 pixels (prefer a blurred image for smaller file size) -->
        <img src="assets/img/placeholders/backgrounds/login_full_bg.jpg" alt="Login Full Background" class="full-bg animation-pulseSlow" />
        <!-- END Login Full Background -->
        <!-- Login Container -->
        <div id="login-container" class="animation-fadeIn">
            <!-- Login Title -->
            <div class="login-title text-center">
                <h1><i class="gi gi-keys"></i><strong> <%= Resources.DefaultResource.HeaderTitle%>  </strong>
                    <br>
                    <small>
                        <strong>
                            <% if (Session["SiteLanguage"].ToString() == "EnglishTheme") {%>
                                    <%= Resources.DefaultResource.TeacherLoginTitleEng %> 
                            
                             <% } else{%> 
                              <%= Resources.DefaultResource.TeacherLoginTitle%>                                                                                         
                                                            
                            
                            <% };%> 
                            </strong>
                        </small></h1>
            </div>
            <!-- END Login Title -->
            <!-- Login Block -->
            <div class="block push-bit">
                <!-- Login Form -->
                <div id="form-login" class="form-horizontal form-bordered form-control-borderless">
                    <div class="form-group">
                        <div class="col-xs-12">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="gi gi-user"></i></span>
                                <%--<input type="text" id="login-email" name="login-email" class="form-control input-lg" placeholder="Email">--%>
                                <asp:TextBox ID="UserNameTextBox" runat="server" name="login-email" class="form-control input-lg" placeholder="<%$ Resources:DefaultResource, UserName%>" autocomplete="off"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="gi gi-lock"></i></span>
                                <asp:TextBox ID="PasswordTextBox" runat="server" name="login-password" class="form-control input-lg" placeholder="<%$ Resources:DefaultResource, Password%>" TextMode="Password" autocomplete="off" AutoCompleteType="Disabled"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="form-group form-actions">
                         <div class="col-xs-12 text-left">
                            <div id="ErrorDiv" runat="server"></div>
                        </div>
                        <div class="col-xs-12 text-right">
                            <asp:LinkButton ID="LoginLinkButton" runat="server" CssClass="btn btn-sm btn-primary" OnClick="LoginLinkButton_Click">
                            <i class="fa fa-angle-right"> </i> <%= Resources.DefaultResource.signin%>  
                            </asp:LinkButton>

                        </div>
                       
                    </div>
                </div>
                <!-- END Login Form -->
                
                <!-- END Reminder Form -->
            </div>
            <!-- END Login Block -->
        </div>
        <!-- END Login Container -->
        <!-- Modal Terms -->

    </form>
    <!-- END Modal Terms -->
    <!-- Include Jquery library from Google's CDN but if something goes wrong get Jquery from local file (Remove 'http:' if you have SSL) -->
  <%--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>--%>

    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>--%>

 <%--   <script src="ADMIN/js/vendor/bootstrap.min.js"></script>--%>
    <script>!window.jQuery && document.write(decodeURI('%3Cscript src="js/vendor/jquery.min.js"%3E%3C/script%3E'));</script>

    <!-- Bootstrap.js, Jquery plugins and Custom JS code -->
   <%-- <script src="Admin/js/vendor/bootstrap.min.js"></script>--%>
        <script src="assets/js/vendor/bootstrap.min.js"></script>
    <script src="assets/js/plugins.js"></script>
    <script src="assets/js/app.js"></script>

    <!-- Load and execute javascript code used only in this page -->
    <script src="assets/js/pages/login.js"></script>
    <script>$(function () { Login.init(); });</script>
</body>
</html>
