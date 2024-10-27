﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SideMenu.ascx.cs" Inherits="WebGymAPP.Controls.Common.SideMenu" %>

<!-- begin:: Aside -->
<button class="kt-aside-close " id="kt_aside_close_btn"><i class="la la-close"></i></button>
<div class="kt-aside  kt-aside--fixed  kt-grid__item kt-grid kt-grid--desktop kt-grid--hor-desktop" id="kt_aside">
    <!-- begin:: Aside Menu -->
    <div class="kt-aside-menu-wrapper kt-grid__item kt-grid__item--fluid" id="kt_aside_menu_wrapper">
        <div id="kt_aside_menu" class="kt-aside-menu " data-ktmenu-vertical="1" data-ktmenu-scroll="1" data-ktmenu-dropdown-timeout="500">
            <ul class="kt-menu__nav ">
                <li class="kt-menu__item  kt-menu__item--active" aria-haspopup="true">
                    <a href="default.aspx" class="kt-menu__link "><i class="kt-menu__link-icon flaticon2-protection"></i>
                        <span class="kt-menu__link-text">
                            <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, Dashboard%>" /></span></a></li>
                <li class="kt-menu__item  kt-menu__item--submenu" aria-haspopup="true" data-ktmenu-submenu-toggle="hover">
                    <a href="javascript:;" class="kt-menu__link kt-menu__toggle"><i class="kt-menu__link-icon flaticon2-list-3"></i>
                        <span class="kt-menu__link-text">
                            <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, AccountInQid%>" /></span>

                        <i class="kt-menu__ver-arrow la la-angle-right"></i></a>
                    <div class="kt-menu__submenu ">
                        <span class="kt-menu__arrow"></span>
                        <ul class="kt-menu__subnav">
                            <li class="kt-menu__item " aria-haspopup="true"><a href="ProjectsList.aspx" class="kt-menu__link "><i class="kt-menu__link-bullet kt-menu__link-bullet--line"><span></span></i><span class="kt-menu__link-text">
                                <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, Advanced%>" /></span></a></li>
                            <li class="kt-menu__item " aria-haspopup="true"><a href="ContractsList.aspx" class="kt-menu__link "><i class="kt-menu__link-bullet kt-menu__link-bullet--line"><span></span></i><span class="kt-menu__link-text">
                                <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, BranchName%>" /></span></a></li>
                        </ul>
                    </div>
                </li>
                 <li class="kt-menu__item " aria-haspopup="true">
                    <a href="GOVEntitiesList.aspx" class="kt-menu__link ">
                        <i class="kt-menu__link-icon flaticon2-medical-records-1"></i>
                        <span class="kt-menu__link-text"><asp:Literal runat="server" Text="<%$ Resources:DefaultResource, Advanced%>" /> </span>
                    </a>
                </li>
                <li class="kt-menu__item " aria-haspopup="true"><a href="#" class="kt-menu__link "><i class="kt-menu__link-icon flaticon2-calendar-6"></i><span class="kt-menu__link-text">Reports</span></a></li>
                <li class="kt-menu__item " aria-haspopup="true"><a href="#" class="kt-menu__link "><i class="kt-menu__link-icon flaticon2-hourglass-1"></i><span class="kt-menu__link-text">Backup</span></a></li>
                <li class="kt-menu__item  kt-menu__item--submenu" aria-haspopup="true" data-ktmenu-submenu-toggle="hover"><a href="javascript:;" class="kt-menu__link kt-menu__toggle"><i class="kt-menu__link-icon flaticon2-analytics-2"></i><span class="kt-menu__link-text">Config</span><i class="kt-menu__ver-arrow la la-angle-right"></i></a>
                    <div class="kt-menu__submenu ">
                        <span class="kt-menu__arrow"></span>
                        <ul class="kt-menu__subnav">
                            <li class="kt-menu__item  kt-menu__item--parent" aria-haspopup="true"><span class="kt-menu__link"><span class="kt-menu__link-text">Config</span></span></li>
                            <li class="kt-menu__item " aria-haspopup="true"><a href="#" class="kt-menu__link "><i class="kt-menu__link-bullet kt-menu__link-bullet--dot"><span></span></i><span class="kt-menu__link-text">Import</span></a></li>
                            <li class="kt-menu__item " aria-haspopup="true"><a href="#" class="kt-menu__link "><i class="kt-menu__link-bullet kt-menu__link-bullet--dot"><span></span></i><span class="kt-menu__link-text">Backup</span></a></li>
                        </ul>
                    </div>
                </li>
               
                <li class="kt-menu__item " aria-haspopup="true"><a href="#" class="kt-menu__link "><i class="kt-menu__link-icon flaticon2-gear"></i><span class="kt-menu__link-text">System</span></a></li>
                <li class="kt-menu__item " aria-haspopup="true"><a href="#" class="kt-menu__link "><i class="kt-menu__link-icon flaticon2-attention"></i><span class="kt-menu__link-text">Logs</span></a></li>
            </ul>
        </div>
    </div>
    <!-- end:: Aside Menu -->
</div>
<!-- end:: Aside -->
