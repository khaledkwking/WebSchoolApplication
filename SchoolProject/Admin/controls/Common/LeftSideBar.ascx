<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeftSideBar.ascx.cs" Inherits="WebSchool.ADMIN.Controls.Common.LeftSideBar" %>
<!-- Main Sidebar -->
<div id="sidebar">
    <!-- Wrapper for scrolling functionality -->
    <div class="sidebar-scroll">
        <!-- Sidebar Content -->
        <div class="sidebar-content">
            <!-- Brand -->
       <%--     <a href="Default.aspx" class="sidebar-brand">
                <i class="gi gi-user"></i><strong><%= Resources.DefaultResource.Training%></strong> <%= Resources.DefaultResource.Devlopement%>
            </a>--%>
            <!-- END Brand -->
            <!-- User Info -->
  <%--          <div class="sidebar-section sidebar-user clearfix">
                <div class="sidebar-user-avatar">
                    <a href="#">
                        <img src="img/placeholders/avatars/avatar.png" alt="avatar" />
                    </a>
                </div>
                <div class="sidebar-user-name"><asp:Label ID="FullNameLabel" runat="server"></asp:Label> </div>
                <div class="sidebar-user-links">
                 
                    
                    <asp:LinkButton ID="LogoutLinkButton" runat="server" data-bs-toggle="tooltip" data-placement="bottom" title="<%$ Resources:DefaultResource, Logout%>"  OnClick="LogoutLinkButton_Click">
                        <i class="gi gi-exit"></i>
                    </asp:LinkButton>
                        
                </div>
            </div>--%>
            <!-- END User Info -->
            <!-- Theme Colors -->
            <!-- Change Color Theme functionality can be found in js/app.js - templateOptions() -->
            <%--<ul class="sidebar-section sidebar-themes clearfix">
                <li class="active">
                    <a href="javascript:void(0)" class="themed-background-dark-default themed-border-default" data-theme="default" data-toggle="tooltip" title="Default Blue"></a>
                </li>
                <li>
                    <a href="javascript:void(0)" class="themed-background-dark-night themed-border-night" data-theme="css/themes/night.css" data-toggle="tooltip" title="Night"></a>
                </li>
                <li>
                    <a href="javascript:void(0)" class="themed-background-dark-amethyst themed-border-amethyst" data-theme="css/themes/amethyst.css" data-toggle="tooltip" title="Amethyst"></a>
                </li>
                <li>
                    <a href="javascript:void(0)" class="themed-background-dark-modern themed-border-modern" data-theme="css/themes/modern.css" data-toggle="tooltip" title="Modern"></a>
                </li>
                <li>
                    <a href="javascript:void(0)" class="themed-background-dark-autumn themed-border-autumn" data-theme="css/themes/autumn.css" data-toggle="tooltip" title="Autumn"></a>
                </li>
                <li>
                    <a href="javascript:void(0)" class="themed-background-dark-flatie themed-border-flatie" data-theme="css/themes/flatie.css" data-toggle="tooltip" title="Flatie"></a>
                </li>
                <li>
                    <a href="javascript:void(0)" class="themed-background-dark-spring themed-border-spring" data-theme="css/themes/spring.css" data-toggle="tooltip" title="Spring"></a>
                </li>
                <li>
                    <a href="javascript:void(0)" class="themed-background-dark-fancy themed-border-fancy" data-theme="css/themes/fancy.css" data-toggle="tooltip" title="Fancy"></a>
                </li>
                <li>
                    <a href="javascript:void(0)" class="themed-background-dark-fire themed-border-fire" data-theme="css/themes/fire.css" data-toggle="tooltip" title="Fire"></a>
                </li>
            </ul>--%>
            <!-- END Theme Colors -->
            <!-- Sidebar Navigation -->
            <ul class="sidebar-nav mt-5 ml-3">
                <li>
                    <a href="Default.aspx">
                        <i class="gi gi-stopwatch sidebar-nav-icon"></i>
                        <%--<%= Resources.DefaultResource.Main%>--%>
                        Main
                        
                    </a>
                </li>
               <li class="sidebar-header">
                    <span class="sidebar-header-options clearfix">
                        <a href="javascript:void(0)" data-toggle="tooltip"  title="Hadling the main section of the website">
                            <i class="gi gi-settings"></i>
                        </a>
                    </span>
                    <span class="sidebar-header-title"> النطوير و التدريب </span>
                </li>

             
                <li>
                    <a href="TotalOpeningTraining.aspx">
                        <i class="gi gi-list sidebar-nav-icon"></i>
                        الدورات المتاحة
                        
                       
                    </a>
                </li>
                 <li>
                    <a href="TrainingOnProgressTotal.aspx">
                        <i class="gi gi-list sidebar-nav-icon"></i>
                        الدورارات المسجلة
                     
                    </a>
                </li>
                

                <li>
                    <a href="TotalClosedTraining.aspx">
                        <i class="gi gi-list sidebar-nav-icon"></i>
                                               
                          الدورات المنتهية
                    </a>
                </li>

                <li>
                    <a href="TrainingOpening.aspx">
                        <i class="gi gi-list sidebar-nav-icon"></i>
                        جميع الدورات
                     
                    </a>
                </li>

                  <li>
                    <a href="OLDArchive.aspx">
                        <i class="fa fa-archive sidebar-nav-icon"></i>
                      الراشيف
                      
                    </a>
                </li>
                
                <li class="sidebar-header">
                    <span class="sidebar-header-options clearfix"><a href="javascript:void(0)" data-toggle="tooltip" title="" data-original-title="Administrator Aria"><i class="gi gi-keys"></i></a></span>
                    <span class="sidebar-header-title">التسجيل  </span>
                </li>
                 
                 <li>
                    <a href="AllRegistrars.aspx">
                        <i class="fa fa-list-alt sidebar-nav-icon"></i>
                      
                         التسجيلات الجديد
                    </a>
                </li>
                 <li>
                    <a href="AllRegistrarsFinalApproval.aspx">
                        <i class="fa fa-list-alt sidebar-nav-icon"></i>
                        
                       التسجلات الموافقة
                    </a>
                </li>
                <li>
                    <a href="AllRegistrarsApproved.aspx">
                        <i class="fa fa-list-alt sidebar-nav-icon"></i>
                       
                       التسجيل النهائية
                    </a>
                </li>
                <li>
                    <a href="TrainingRegistrarsCancellation.aspx">
                        <i class="fa fa-list-alt sidebar-nav-icon"></i>
                    
                        الدورات المرفوضة
                    </a>
                </li>
                

                 <li class="sidebar-header">
                    <span class="sidebar-header-options clearfix"><a href="javascript:void(0)" data-toggle="tooltip" title="" data-original-title="Administrator Aria"><i class="gi gi-keys"></i></a></span>
                    <span class="sidebar-header-title"> الادارة  </span>
                </li>
                <li>
                    <a href="Employees.aspx">
                        <i class="gi gi-user sidebar-nav-icon"></i>
                      الموظفين
                       
                    </a>
                </li>
                <li>
                    <a href="AllRatings.aspx">
                        <i class="fa fa-star sidebar-nav-icon"></i>
                          
                        التقييم
                    </a>
                </li>

               <%-- <% if (Session["RoleID"].ToString() == "1")
                    { %>--%>
                        <li class="sidebar-header">
                            <span class="sidebar-header-options clearfix"><a href="javascript:void(0)" data-toggle="tooltip" title="" data-original-title="Administrator Aria"><i class="gi gi-keys"></i></a></span>
                            <span class="sidebar-header-title"> الادارة العليا  </span>
                        </li>

                        <li>
                            <a href="TrainingSections.aspx">
                                <i class="gi gi-list sidebar-nav-icon"></i>
                              
                                الاقسام
                            </a>
                        </li>

                       <li>
                            <a href="LogsPage.aspx">
                                <i class="gi gi-list sidebar-nav-icon"></i>
                              
                               تسجيل الخروج
                            </a>
                        </li>

                        <li>
                            <a href="EmailTemplates.aspx">
                                <i class="gi gi-mail sidebar-nav-icon"></i>
                             
                                البريد
                            </a>
                        </li>
                        <li>
                            <a href="#" class="sidebar-nav-menu"><i class="fa fa-angle-left sidebar-nav-indicator"></i><i class="gi gi-group sidebar-nav-icon"></i>ادارة المستخدمين</a>
                            <ul>
                                <li>
                                    <a href="Users.aspx">  المستخدمين</a>
                                </li>
                                <li>
                                    <a href="Employees.aspx">الموظفين </a>
                                </li>
                            </ul>
                        </li>
              <%--  <%}%>--%>
               
                
            </ul>
            <!-- END Sidebar Navigation -->
        </div>
        <!-- END Sidebar Content -->
    </div>
    <!-- END Wrapper for scrolling functionality -->
</div>
<!-- END Main Sidebar -->
