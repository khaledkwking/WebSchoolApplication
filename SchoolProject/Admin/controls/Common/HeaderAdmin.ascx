<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HeaderAdmin.ascx.cs" Inherits="WebSchool.ADMIN.Controls.Common.HeaderAdmin" %>

<div id="kt_header" class="kt-header kt-grid kt-grid--ver  d-print-none headerBackGround" >
    

    <!-- begin:: Aside -->
 <div class ="row">
     

    <div class="kt-header__brand kt-grid__item" id="kt_header_brand">

     
       
        <div class="kt-header__brand-logo mt-3" >
            
            <a href="Default.aspx">
                <img alt="Logo" src="../assets/media/logos/Toplogo.png" />
                <%-- <h3 class="kt-header__title kt-grid__item" style ="text-align :center; font-size :90%" >
                    
                    <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, HeaderTitle%>"  />
                     
                </h3>    --%>
            
                 <h3 class="kt-header__title kt-grid__item" style =" text-align :center; font-size :100%">
                    <%--<asp:Literal runat="server" Text="<%$ Globals.CompanyName%>" />--%>
                     <%=Globals.CompanyName%>
                </h3>    
                 
            </a>
      
        </div>
       
    </div>
      </div>
    <!-- end:: Aside -->
    
    <!-- begin:: Title -->
    

    <!-- end:: Title -->

    <!-- begin: Header Menu -->
    <button class="kt-header-menu-wrapper-close" id="kt_header_menu_mobile_close_btn"><i class="la la-close"></i></button>

    
    <div class="kt-header-menu-wrapper kt-grid__item kt-grid__item--fluid" id="kt_header_menu_wrapper" >
        <div id="kt_header_menu" class="kt-header-menu kt-header-menu-mobile  kt-header-menu--layout-default " >
          
               <img alt="Logo" src="../assets/media/logos/header-logo.png" class ="LoginheaderMidLogo" />
        </div>
      
    </div>
   
        

    <!-- end: Header Menu -->

    <!-- begin:: Header Topbar -->
    <div class="kt-header__topbar">

        <!--begin: Search -->
       

        <!--end: Search -->

        <!--begin: Notifications -->
  
        <!--end: Notifications -->

        <!--begin: Quick actions -->
       

        <!--end: Quick actions -->

        <!--begin: Language bar -->
        <div class="kt-header__topbar-item kt-header__topbar-item--langs">
            <div class="kt-header__topbar-wrapper"   data-bs-toggle="dropdown" aria-expanded="false"  data-offset="10px,0px">
                 <%-- <ul >
                    <!-- Main Sidebar Toggle Button -->
                    <li>--%>
                <span class="kt-header__topbar-icon kt-header__topbar-icon--brand">
                   <%-- <% if (Session["SiteLanguage"].ToString() == "ArabicTheme")
                        { %>
                    <img src="../../assets/media/flags/021-Kuwait.svg" alt="" />
                    <%}
                    else
                    { %>
                    <img src="../../assets/media/flags/020-flag.svg" alt="" />
                    <%}; %>--%>
                    
                        
                        <a href="javascript:void(0)" onclick="App.sidebar('toggle-sidebar');">
                            <i class="fa fa-bars fa-fw"></i>
                        </a>
                        
                   
                </span>

<%-- </li>
                            </ul>--%>
                          

            </div>
            <%--<div class="dropdown-menu dropdown-menu-fit dropdown-menu-left dropdown-menu-anim">
                <ul class="kt-nav kt-margin-t-10 kt-margin-b-10">
                    <li class="kt-nav__item kt-nav__item--active">
                        <asp:LinkButton ID="EnglishLang" runat="server" CssClass="kt-nav__link" OnClick="EnglishLang_Click">
                            <span class="kt-nav__link-icon">
                                <img src="../../assets/media/flags/020-flag.svg" alt="" /></span>
                            <span class="kt-nav__link-text">English</span>
                        </asp:LinkButton>
                    </li>
                    <li class="kt-nav__item">
                        <asp:LinkButton ID="ArabicLang" runat="server" CssClass="kt-nav__link" OnClick="ArabicLang_Click">
                               <span class="kt-nav__link-icon">
                                <img src="../../assets/media/flags/021-Kuwait.svg" alt="" /></span>
                            <span class="kt-nav__link-text">عربي</span>
                        </asp:LinkButton>
                    </li>
                </ul>
            </div>--%>
        </div>

        <!--end: Language bar -->

        <!--begin: User bar -->
        <div class="kt-header__topbar-item kt-header__topbar-item--user">
            <div class="kt-header__topbar-wrapper" data-bs-toggle="dropdown" aria-expanded="false"  data-offset="10px,0px">
                <span class="kt-hidden kt-header__topbar-welcome">Hi,</span>
                <span class="kt-hidden kt-header__topbar-username"></span>
                <img class="kt-hidden" alt="Pic" src="../../assets/media/users/300_21.jpg" />
                <span class="kt-header__topbar-icon kt-hidden-"><i class="flaticon2-user-outline-symbol"></i></span>
            </div>
            <div class="dropdown-menu dropdown-menu-fit dropdown-menu-right dropdown-menu-anim dropdown-menu-xl">

                <!--begin: Head -->
                <div class="kt-user-card kt-user-card--skin-dark kt-notification-item-padding-x" style="background-image: url(../../assets/media/misc/bg-1.jpg)">
                    <div class="kt-user-card__avatar">
                        <img class="kt-hidden" alt="Pic" src="../../assets/media/users/300_25.jpg" />

                        <!--use below badge element instead the user avatar to display username's first letter(remove kt-hidden class to display it) -->
                    </div>
                    <div class="kt-user-card__name">
                        <asp:Label ID="FullNameLabel" runat="server" Text =""></asp:Label>
                    </div>
                </div>

                <!--end: Head -->

                <!--begin: Navigation -->
                <div class="kt-notification">
                    <%--<a href="#" class="kt-notification__item">
                        <div class="kt-notification__item-icon">
                            <i class="flaticon2-calendar-3 kt-font-success"></i>
                        </div>
                        <div class="kt-notification__item-details">
                            <div class="kt-notification__item-title kt-font-bold">
                               <asp:Literal runat="server" Text="<%$ Resources:DefaultResource,  MyProjects%>" />
                            </div>
                            <div class="kt-notification__item-time">
                                <asp:Literal runat="server" Text="<%$ Resources:DefaultResource,  MyProfileNote%>" />
                            </div>
                        </div>
                    </a>--%>
                    <div class="kt-notification__custom">
                        <asp:LinkButton ID="LogoutLinkButton" runat="server" CssClass="btn btn-label-brand btn-sm btn-bold" OnClick="LogoutLinkButton_Click">
                           <%-- <asp:Literal runat="server" Text="<%$ Resources:DefaultResource,  SignOut%>" />--%>
                             <%= Globals.CompanyName%> 
                        </asp:LinkButton>

                    </div>
                     

                </div>
                
                <!--end: Navigation -->

            </div>

      
        </div>

        
        
        <!--end: User bar --><!--begin: Quick panel toggler --><%-- <div class="kt-header__topbar-item kt-header__topbar-item--quickpanel" data-toggle="kt-tooltip" title="Quick panel" data-placement="top">
            <div class="kt-header__topbar-wrapper">
                <span class="kt-header__topbar-icon" id="kt_quick_panel_toggler_btn"><i class="flaticon2-cube-1"></i></span>
            </div>
        </div>--%><!--end: Quick panel toggler -->

 
    </div>
    
    
    <!-- end:: Header Topbar -->
       
</div>

