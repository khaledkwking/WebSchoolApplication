﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="WebSchool.ADMIN.Controls.Common.Header" %>
<!-- Header -->
<header class="navbar navbar-default">
    <!-- Left Header Navigation -->
   
    <ul class="nav navbar-nav-custom">
        <!-- Main Sidebar Toggle Button -->
       
        <li>
            <a href="javascript:void(0)" onclick="App.sidebar('toggle-sidebar');">
                <i class="fa fa-bars fa-fw"></i>
            </a>
        </li>
        <!-- END Main Sidebar Toggle Button -->
        <!-- Template Options -->
        <!-- Change Options functionality can be found in js/app.js - templateOptions() -->
        <%--<li class="dropdown">
            <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown">
                <i class="gi gi-settings"></i>
            </a>
            <ul class="dropdown-menu dropdown-custom dropdown-options">
                <li class="dropdown-header text-center">Header Style</li>
                <li>
                    <div class="btn-group btn-group-justified btn-group-sm">
                        <a href="javascript:void(0)" class="btn btn-primary" id="options-header-default">Light</a>
                        <a href="javascript:void(0)" class="btn btn-primary" id="options-header-inverse">Dark</a>
                    </div>
                </li>
                <li class="dropdown-header text-center">Page Style</li>
                <li>
                    <div class="btn-group btn-group-justified btn-group-sm">
                        <a href="javascript:void(0)" class="btn btn-primary" id="options-main-style">Default</a>
                        <a href="javascript:void(0)" class="btn btn-primary" id="options-main-style-alt">Alternative</a>
                    </div>
                </li>
                <li class="dropdown-header text-center">Main Layout</li>
                <li>
                    <button class="btn btn-sm btn-block btn-primary" id="options-header-top">Fixed Side/Header (Top)</button>
                    <button class="btn btn-sm btn-block btn-primary" id="options-header-bottom">Fixed Side/Header (Bottom)</button>
                </li>
                <li class="dropdown-header text-center">Footer</li>
                <li>
                    <div class="btn-group btn-group-justified btn-group-sm">
                        <a href="javascript:void(0)" class="btn btn-primary" id="options-footer-static">Default</a>
                        <a href="javascript:void(0)" class="btn btn-primary" id="options-footer-fixed">Fixed</a>
                    </div>
                </li>
            </ul>
        </li>--%>
        <!-- END Template Options -->
    </ul>
    <!-- END Left Header Navigation -->

    <!-- Right Header Navigation -->
    <ul class="nav navbar-nav-custom pull-right">
        <!-- Alternative Sidebar Toggle Button -->
        <%--<li>
            <!-- If you do not want the main sidebar to open when the alternative sidebar is closed, just remove the second parameter: App.sidebar('toggle-sidebar-alt'); -->
            <a href="javascript:void(0)" onclick="App.sidebar('toggle-sidebar-alt', 'toggle-other');">
                <i class="gi gi-share_alt"></i>
                <span class="label label-primary label-indicator animation-floating">4</span>
            </a>
        </li>--%>
        <!-- END Alternative Sidebar Toggle Button -->
        <!-- User Dropdown -->
        <%--<li class="dropdown">
            <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown">
                <img src="img/placeholders/avatars/avatar2.jpg" alt="avatar">
                <i class="fa fa-angle-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-custom dropdown-menu-right">
                <li class="dropdown-header text-center">Account</li>
                <li>
                    <a href="page_ready_timeline.html">
                        <i class="fa fa-clock-o fa-fw pull-right"></i>
                        <span class="badge pull-right">10</span>
                        Updates
                    </a>
                    <a href="page_ready_inbox.html">
                        <i class="fa fa-envelope-o fa-fw pull-right"></i>
                        <span class="badge pull-right">5</span>
                        Messages
                    </a>
                    <a href="page_ready_pricing_tables.html">
                        <i class="fa fa-magnet fa-fw pull-right"></i>
                        <span class="badge pull-right">3</span>
                        Subscriptions
                    </a>
                    <a href="page_ready_faq.html">
                        <i class="fa fa-question fa-fw pull-right"></i>
                        <span class="badge pull-right">11</span>
                        FAQ
                    </a>
                </li>
                <li class="divider"></li>
                <li>
                    <a href="page_ready_user_profile.html">
                        <i class="fa fa-user fa-fw pull-right"></i>
                        Profile
                    </a>
                    <!-- Opens the user settings modal that can be found at the bottom of each page (page_footer.html in PHP version) -->
                    <a href="#modal-user-settings" data-toggle="modal">
                        <i class="fa fa-cog fa-fw pull-right"></i>
                        Settings
                    </a>
                </li>
                <li class="divider"></li>
                <li>
                    <a href="page_ready_lock_screen.html"><i class="fa fa-lock fa-fw pull-right"></i>Lock Account</a>
                    <a href="login.html"><i class="fa fa-ban fa-fw pull-right"></i>Logout</a>
                </li>
            </ul>
        </li>--%>
        <!-- END User Dropdown -->
    </ul>
    <!-- END Right Header Navigation -->
</header>

<!-- END Header -->
