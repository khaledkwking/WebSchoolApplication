<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HeaderMain.ascx.cs" Inherits="WebGymAPP.Controls.Common.HeaderMain" %>
<div id="kt_header" class="kt-header kt-grid kt-grid--ver  kt-header--fixed d-print-none">

    <!-- begin:: Aside -->
    <div class="kt-header__brand kt-grid__item  " id="kt_header_brand">
        <div class="kt-header__brand-logo">
            <a href="../../Admin/MainNew.aspx">
                <img alt="Logo" src="../../images/logo.png" />
            </a>
        </div>
    </div>
   
    <!-- end:: Aside -->

    <!-- begin:: Title -->
   <%-- <h3 class="kt-header__title kt-grid__item">
        <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, HeaderTitle%>" />
    </h3>--%>

    <!-- end:: Title -->

    <!-- begin: Header Menu -->
        <div class="row" style="margin-top:20px; text-align:center ">
      <div>
              <h3 class="col-12" style="color:white; font-weight:bold;" >
                  <%--<asp:Literal runat="server" Text="<%$ Resources:DefaultResource, HeaderTitle%>" />--%>
                   <%= Globals.CompanyName%> 
             </h3>
           
           </div>
    </div>

    <!-- end: Header Menu -->

    <!-- begin:: Header Topbar -->
    <div class="kt-header__topbar">

       

        <!--end: Search -->

  

        <!--end: Quick actions -->

        <!--begin: Language bar -->
        <div class="kt-header__topbar-item kt-header__topbar-item--langs">
            <div class="kt-header__topbar-wrapper" data-toggle="dropdown" data-offset="10px,0px">
                <span class="kt-header__topbar-icon kt-header__topbar-icon--brand">
                    <% if (Session["SiteLanguage"].ToString() == "ArabicTheme")
                        { %>
                    <img src="../../assets/media/flags/021-Kuwait.svg" alt="" />
                    <%}
                    else
                    { %>
                    <img src="../../assets/media/flags/020-flag.svg" alt="" />
                    <%}; %>
                </span>
            </div>
            <div class="dropdown-menu dropdown-menu-fit dropdown-menu-right dropdown-menu-anim">
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
            </div>
        </div>

        <!--end: Language bar -->

        <!--begin: User bar -->

        <!--end: User bar --><!--begin: Quick panel toggler --><%-- <div class="kt-header__topbar-item kt-header__topbar-item--quickpanel" data-toggle="kt-tooltip" title="Quick panel" data-placement="top">
            <div class="kt-header__topbar-wrapper">
                <span class="kt-header__topbar-icon" id="kt_quick_panel_toggler_btn"><i class="flaticon2-cube-1"></i></span>
            </div>



        </div>--%><!--end: Quick panel toggler --></div><!-- end:: Header Topbar --></div>