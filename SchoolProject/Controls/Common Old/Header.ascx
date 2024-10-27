<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="WebGymAPP.Controls.Common.Header" %>
<div id="kt_header" class="kt-header kt-grid kt-grid--ver  kt-header--fixed d-print-none" >

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
    <button class="kt-header-menu-wrapper-close" id="kt_header_menu_mobile_close_btn"><i class="la la-close"></i></button>
    <div class="kt-header-menu-wrapper kt-grid__item kt-grid__item--fluid" id="kt_header_menu_wrapper">
        <div id="kt_header_menu" class="kt-header-menu kt-header-menu-mobile  kt-header-menu--layout-default ">
            <ul class="kt-menu__nav ">
                <li class="kt-menu__item  kt-menu__item--active " aria-haspopup="true">
                    <a href="../../Admin/Main.aspx" class="kt-menu__link ">
                        <span class="kt-menu__link-text">
                            <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, Dashboard%>" />
                        </span>
                    </a>
                </li>
               
               
          
                    <li class="kt-menu__item  kt-menu__item--submenu kt-menu__item--rel" data-ktmenu-submenu-toggle="click" aria-haspopup="true">
                    <a href="javascript:;" class="kt-menu__link kt-menu__toggle">
                        <span class="kt-menu__link-text">
                            <asp:Literal ID="Literal9" runat="server" Text="<%$ Resources:DefaultResource, SystemCodes%>" />
                        </span>
                        <i class="kt-menu__hor-arrow la la-angle-down"></i>
                    </a>
                    <div class="kt-menu__submenu kt-menu__submenu--classic kt-menu__submenu--left">
                        <ul class="kt-menu__subnav">
                            <li class="kt-menu__item " aria-haspopup="true">
                                <a href="../../Admin/Branches.aspx" class="kt-menu__link ">
                                    <i class="kt-menu__link-icon fa fa-building"></i>
                                    <span class="kt-menu__link-text">
                                        <asp:Literal ID="Literal10" runat="server" Text="<%$ Resources:DefaultResource, BranchCodes%>" />
                                    </span>
                                </a>
                            </li>
                          <%--  <li class="kt-menu__item " aria-haspopup="true">
                                <a href="../../Admin/SubAddData.aspx?Flag=1" class="kt-menu__link ">
                                    <i class="kt-menu__link-icon flaticon-profile"></i>
                                    <span class="kt-menu__link-text">
                                        <asp:Literal ID="Literal11" runat="server" Text="<%$ Resources:DefaultResource, CurrencyCodes%>" />
                                    </span>
                                </a>
                            </li>--%>
                            <li class="kt-menu__item " aria-haspopup="true">
                                <a href="../../Admin/Inventory.aspx" class="kt-menu__link ">
                                    <i class="kt-menu__link-icon flaticon-notes"></i>
                                    <span class="kt-menu__link-text">
                                        <asp:Literal ID="Literal12" runat="server" Text="<%$ Resources:DefaultResource, InventoryCodes%>" />
                                    </span>
                                </a>
                            </li>
                            <li class="kt-menu__item " aria-haspopup="true">
                                <a href="../../Admin/Accountlist.aspx" class="kt-menu__link ">
                                    <i class="kt-menu__link-icon flaticon-users"></i>
                                    <span class="kt-menu__link-text">
                                        <asp:Literal ID="Literal13" runat="server" Text="<%$ Resources:DefaultResource, AccountCodes%>" />
                                    </span>
                                </a>
                            </li>
                              <li class="kt-menu__item " aria-haspopup="true">
                                <a href="../../Admin/Itemslist.aspx" class="kt-menu__link ">
                                    <i class="kt-menu__link-icon flaticon-bell"></i>
                                    <span class="kt-menu__link-text">
                                        <asp:Literal ID="Literal14" runat="server" Text="<%$ Resources:DefaultResource, ItemCodes%>" />
                                    </span>
                                </a>
                            </li>
                        <li class="kt-menu__item " aria-haspopup="true">
                                <a href="../../Admin/InvoicesListExp.aspx" class="kt-menu__link ">
                                    <i class="kt-menu__link-icon flaticon-bell"></i>
                                    <span class="kt-menu__link-text">
                                        <asp:Literal ID="Literal15" runat="server" Text="<%$ Resources:DefaultResource, CostCenterCodes%>" />
                                    </span>
                                </a>
                            </li>
                        </ul>
                    </div>
                   </li>
                
                
                 <li class="kt-menu__item  kt-menu__item--submenu kt-menu__item--rel" data-ktmenu-submenu-toggle="click" aria-haspopup="true">
                    <a href="javascript:;" class="kt-menu__link kt-menu__toggle">
                        <span class="kt-menu__link-text">
                            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:DefaultResource, Accounting%>" />
                        </span>
                        <i class="kt-menu__hor-arrow la la-angle-down"></i>
                    </a>
                    <div class="kt-menu__submenu kt-menu__submenu--classic kt-menu__submenu--left">
                        <ul class="kt-menu__subnav">
                            <li class="kt-menu__item " aria-haspopup="true">
                                <a href="../../Admin/QidList.aspx?TypeId=1&repeated=0" class="kt-menu__link ">
                                    <i class="kt-menu__link-icon fa fa-building"></i>
                                    <span class="kt-menu__link-text">
                                        <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:DefaultResource, AccountQid%>" />
                                    </span>
                                </a>
                            </li>
                            <li class="kt-menu__item " aria-haspopup="true">
                                <a href="../../Admin/QidList.aspx?TypeId=1&repeated=1" class="kt-menu__link ">
                                    <i class="kt-menu__link-icon flaticon-map"></i>
                                    <span class="kt-menu__link-text">
                                        <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:DefaultResource, AccountQidOpen%>" />
                                    </span>
                                </a>
                            </li>
                            <li class="kt-menu__item " aria-haspopup="true">
                                <a href="../../Admin/QidInOutList.aspx?TypeId=7" class="kt-menu__link ">
                                    <i class="kt-menu__link-icon flaticon2-chart"></i>
                                    <span class="kt-menu__link-text">
                                        <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:DefaultResource, AccountInQid%>" />
                                    </span>
                                </a>
                            </li>
                              <li class="kt-menu__item " aria-haspopup="true">
                                <a href="../../Admin/QidInOutList.aspx?TypeId=6" class="kt-menu__link ">
                                    <i class="kt-menu__link-icon flaticon2-chart"></i>
                                    <span class="kt-menu__link-text">
                                        <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:DefaultResource, AccountOutQid%>" />
                                    </span>
                                </a>
                            </li>
                    <li class="kt-menu__item  kt-menu__item--submenu kt-menu__item--rel" data-ktmenu-submenu-toggle="click" aria-haspopup="true">
                    <a href="javascript:;" class="kt-menu__link kt-menu__toggle">
                            <i class="kt-menu__link-icon flaticon2-graph-1 text-warning"></i>
                        <span class="kt-menu__link-text">
                            <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, AccountingReports%>" />
                        </span>
                        <i class="kt-menu__hor-arrow la la-angle-right"></i>
                    </a>
                    <div class="kt-menu__submenu kt-menu__submenu--classic kt-menu__submenu--right">
                        <ul class="kt-menu__subnav">
                            <li class="kt-menu__item " aria-haspopup="true">
                                <a href="../../Admin/StatementSheet.aspx" class="kt-menu__link ">
                                    <i class="kt-menu__link-icon flaticon-settings-1"></i>
                                    <span class="kt-menu__link-text">
                                        <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, AccountStatementSheet%>" />
                                    </span>
                                </a>
                            </li>
                            <li class="kt-menu__item " aria-haspopup="true">
                                <a href="../../Admin/TrialBalance.aspx" class="kt-menu__link ">
                                    <i class="kt-menu__link-icon flaticon-users"></i>
                                    <span class="kt-menu__link-text">
                                        <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, AccountTriBalance%>" />
                                    </span>
                                </a>
                            </li>
                               <li class="kt-menu__item " aria-haspopup="true">
                                <a href="../../Admin/IncomeList.aspx" class="kt-menu__link ">
                                    <i class="kt-menu__link-icon flaticon-users"></i>
                                    <span class="kt-menu__link-text">
                                        <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, IncomeStatment%>" />
                                    </span>
                                </a>
                            </li>
                                   <li class="kt-menu__item " aria-haspopup="true">
                                <a href="../../Admin/BudgetList.aspx" class="kt-menu__link ">
                                    <i class="kt-menu__link-icon flaticon-users"></i>
                                    <span class="kt-menu__link-text">
                                        <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, Budget%>" />
                                    </span>
                                </a>
                            </li>
                            
                        </ul>
                    </div>
                </li>

                        
                        </ul>
                    </div>
                </li>
                <li class="kt-menu__item  kt-menu__item--submenu kt-menu__item--rel" data-ktmenu-submenu-toggle="click" aria-haspopup="true">
                    <a href="javascript:;" class="kt-menu__link kt-menu__toggle">
                        <span class="kt-menu__link-text">
                            <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, Sales%>" />
                        </span>
                        <i class="kt-menu__hor-arrow la la-angle-down"></i>
                    </a>
                    <div class="kt-menu__submenu kt-menu__submenu--classic kt-menu__submenu--left">
                        <ul class="kt-menu__subnav">
                            <li class="kt-menu__item " aria-haspopup="true">
                                <a href="../../Admin/Invoiceslist.aspx" class="kt-menu__link ">
                                    <i class="kt-menu__link-icon flaticon-settings-1"></i>
                                    <span class="kt-menu__link-text">
                                        <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, SalesInvoice%>" />
                                    </span>
                                </a>
                            </li>
                            <li class="kt-menu__item " aria-haspopup="true">
                                <a href="../../Admin/UsersList.aspx" class="kt-menu__link ">
                                    <i class="kt-menu__link-icon flaticon-users"></i>
                                    <span class="kt-menu__link-text">
                                        <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, Customers%>" />
                                    </span>
                                </a>
                            </li>
                          
                        </ul>
                    </div>
                </li>
                <li class="kt-menu__item  kt-menu__item--submenu kt-menu__item--rel" data-ktmenu-submenu-toggle="click" aria-haspopup="true">
                    <a href="javascript:;" class="kt-menu__link kt-menu__toggle">
                        <span class="kt-menu__link-text">
                            <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, Purchasing%>" />
                        </span>
                        <i class="kt-menu__hor-arrow la la-angle-down"></i>
                    </a>
                    <div class="kt-menu__submenu kt-menu__submenu--classic kt-menu__submenu--left">
                        <ul class="kt-menu__subnav">
                            <li class="kt-menu__item " aria-haspopup="true">
                                <a href="../../Admin/Main.aspx" class="kt-menu__link ">
                                    <i class="kt-menu__link-icon flaticon-settings-1"></i>
                                    <span class="kt-menu__link-text">
                                        <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, PurchasingInvoice%>" />
                                    </span>
                                </a>
                            </li>
                            <li class="kt-menu__item " aria-haspopup="true">
                                <a href="../../Admin/UsersList.aspx" class="kt-menu__link ">
                                    <i class="kt-menu__link-icon flaticon-users"></i>
                                    <span class="kt-menu__link-text">
                                        <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, suppliers%>" />
                                    </span>
                                </a>
                            </li>
                            
                        </ul>
                    </div>
                </li>
                      <li class="kt-menu__item  kt-menu__item--submenu kt-menu__item--rel" data-ktmenu-submenu-toggle="click" aria-haspopup="true">
                    <a href="javascript:;" class="kt-menu__link kt-menu__toggle">
                        <span class="kt-menu__link-text">
                            <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, Inventory%>" />
                        </span>
                        <i class="kt-menu__hor-arrow la la-angle-down"></i>
                    </a>
                    <div class="kt-menu__submenu kt-menu__submenu--classic kt-menu__submenu--left">
                        <ul class="kt-menu__subnav">
                            <li class="kt-menu__item " aria-haspopup="true">
                                <a href="../../Admin/Itemslist.aspx" class="kt-menu__link ">
                                    <i class="kt-menu__link-icon flaticon-settings-1"></i>
                                    <span class="kt-menu__link-text">
                                        <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, ItemCodes%>" />
                                    </span>
                                </a>
                            </li>
                            <li class="kt-menu__item " aria-haspopup="true">
                                <a href="../../Admin/StockList.aspx" class="kt-menu__link ">
                                    <i class="kt-menu__link-icon flaticon-users"></i>
                                    <span class="kt-menu__link-text">
                                        <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, ItemsStock%>" />
                                    </span>
                                </a>
                            </li>
                             <li class="kt-menu__item " aria-haspopup="true">
                                <a href="../../Admin/UsersList.aspx" class="kt-menu__link ">
                                    <i class="kt-menu__link-icon flaticon-users"></i>
                                    <span class="kt-menu__link-text">
                                        <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, ItemInventoryTrans%>" />
                                    </span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                    <li class="kt-menu__item  kt-menu__item--submenu kt-menu__item--rel" data-ktmenu-submenu-toggle="click" aria-haspopup="true">
                    <a href="../../Admin/MainHR.aspx" class="kt-menu__link kt-menu__toggle">
                        <span class="kt-menu__link-text">
                            <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, HR %>" />
                        </span>
                        <i class="kt-menu__hor-arrow la la-angle-down"></i>
                    </a>
                 <div class="kt-menu__submenu kt-menu__submenu--classic kt-menu__submenu--left">
                        <ul class="kt-menu__subnav">
                            <li class="kt-menu__item " aria-haspopup="true">
                                <a href="../../Admin/MainHR.aspx" class="kt-menu__link ">
                                    <i class="kt-menu__link-icon flaticon-settings-1"></i>
                                    <span class="kt-menu__link-text">
                                        <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, HRDashboard%>" />
                                    </span>
                                </a>
                            </li>
                                                       
                        </ul>
                    </div>
                </li>
                <li class="kt-menu__item  kt-menu__item--submenu kt-menu__item--rel" data-ktmenu-submenu-toggle="click" aria-haspopup="true">
                    <a href="javascript:;" class="kt-menu__link kt-menu__toggle">
                        <span class="kt-menu__link-text">
                            <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, ItemsReports%>" />
                        </span>
                        <i class="kt-menu__hor-arrow la la-angle-down"></i>
                    </a>
                    <div class="kt-menu__submenu kt-menu__submenu--classic kt-menu__submenu--left">
                        <ul class="kt-menu__subnav">
                            <li class="kt-menu__item " aria-haspopup="true">
                                <a href="../../Admin/Main.aspx" class="kt-menu__link ">
                                    <i class="kt-menu__link-icon flaticon-settings-1"></i>
                                    <span class="kt-menu__link-text">
                                        <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, InventoryAnalysis%>" />
                                    </span>
                                </a>
                            </li>
                            <li class="kt-menu__item " aria-haspopup="true">
                                <a href="../../Admin/UsersList.aspx" class="kt-menu__link ">
                                    <i class="kt-menu__link-icon flaticon-users"></i>
                                    <span class="kt-menu__link-text">
                                        <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, InventoryBalance%>" />
                                    </span>
                                </a>
                            </li>
                            
                        </ul>
                    </div>
                </li>
                   
                    <li class="kt-menu__item  kt-menu__item--submenu kt-menu__item--rel" data-ktmenu-submenu-toggle="click" aria-haspopup="true">
                    <a href="javascript:;" class="kt-menu__link kt-menu__toggle">
                        <span class="kt-menu__link-text">
                            <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, Setup%>" />
                        </span>
                        <i class="kt-menu__hor-arrow la la-angle-down"></i>
                    </a>
                    <div class="kt-menu__submenu kt-menu__submenu--classic kt-menu__submenu--left">
                        <ul class="kt-menu__subnav">
                            <li class="kt-menu__item " aria-haspopup="true">
                                <a href="../../Admin/Setup.aspx" class="kt-menu__link ">
                                    <i class="kt-menu__link-icon flaticon-settings-1"></i>
                                    <span class="kt-menu__link-text">
                                        <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, Settings%>" />
                                    </span>
                                </a>
                            </li>
                            <li class="kt-menu__item " aria-haspopup="true">
                                <a href="../../Admin/UsersList.aspx" class="kt-menu__link ">
                                    <i class="kt-menu__link-icon flaticon-users"></i>
                                    <span class="kt-menu__link-text">
                                        <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, ActiveUsers%>" />
                                    </span>
                                </a>
                            </li>
                            
                        </ul>
                    </div>
                </li>


            </ul>
        </div>
    </div>

    <!-- end: Header Menu -->

    <!-- begin:: Header Topbar -->
    <div class="kt-header__topbar">

        <!--begin: Search -->
        <%--<div class="kt-header__topbar-item kt-header__topbar-item--search dropdown" id="kt_quick_search_toggle">
            <div class="kt-header__topbar-wrapper"  data-bs-toggle="dropdown" data-offset="10px,0px">
                <span class="kt-header__topbar-icon"><i class="flaticon2-search-1"></i></span>
            </div>
            <div class="dropdown-menu dropdown-menu-fit dropdown-menu-right dropdown-menu-anim dropdown-menu-lg">
                <div class="kt-quick-search kt-quick-search--inline" id="kt_quick_search_inline">
                    <form method="get" class="kt-quick-search__form">
                        <div class="input-group">
                            <div class="input-group-prepend"><span class="input-group-text"><i class="flaticon2-search-1"></i></span></div>
                            <input type="text" class="form-control kt-quick-search__input" placeholder="Search...">
                            <div class="input-group-append"><span class="input-group-text"><i class="la la-close kt-quick-search__close"></i></span></div>
                        </div>
                    </form>
                    <div class="kt-quick-search__wrapper kt-scroll" data-scroll="true" data-height="300" data-mobile-height="200">
                    </div>
                </div>
            </div>
        </div>--%>

        <!--end: Search -->

        <!--begin: Notifications -->
 

        <!--end: Notifications -->

        <!--begin: Quick actions -->
    

        <!--end: Quick actions -->

        <!--begin: Language bar -->
        <div class="kt-header__topbar-item kt-header__topbar-item--langs">
            <div class="kt-header__topbar-wrapper" data-bs-toggle="dropdown" data-offset="10px,0px">
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
        <div class="kt-header__topbar-item kt-header__topbar-item--user">
            <div class="kt-header__topbar-wrapper" data-bs-toggle="dropdown" data-offset="10px,0px">
                <span class="kt-hidden kt-header__topbar-welcome">Hi,</span>
                <span class="kt-hidden kt-header__topbar-username">Eng. Khaled</span>
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
                        <asp:Label ID="LoggedInUserLabel" runat="server">
                            <%--<% HttpContext.Current.Request.Cookies.Get("Name").ToString(); %>--%>
                        </asp:Label>
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
                            <asp:Literal runat="server" Text="<%$ Resources:DefaultResource,  SignOut%>" />
                        </asp:LinkButton></div></div><!--end: Navigation --></div></div><!--end: User bar --><!--begin: Quick panel toggler --><%-- <div class="kt-header__topbar-item kt-header__topbar-item--quickpanel"  data-bs-toggle="kt-tooltip" title="Quick panel" data-placement="top">
            <div class="kt-header__topbar-wrapper">
                <span class="kt-header__topbar-icon" id="kt_quick_panel_toggler_btn"><i class="flaticon2-cube-1"></i></span>
            </div>



        </div>--%><!--end: Quick panel toggler -->
 

    </div><!-- end:: Header Topbar --></div>