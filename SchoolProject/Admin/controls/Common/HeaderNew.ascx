﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HeaderNew.ascx.cs" Inherits="WebSchool.ADMIN.Controls.Common.HeaderNew" %>
 <header class="navbar navbar-default">
                        <!-- Left Header Navigation -->
                        <ul class="nav navbar-nav-custom" >
                            <!-- Main Sidebar Toggle Button -->
                            <li>
                                <a href="javascript:void(0)" onclick="App.sidebar('toggle-sidebar');this.blur();">
                                    <i class="fa fa-bars fa-fw"></i>
                                </a>
                            </li>
                            <!-- END Main Sidebar Toggle Button -->

                            <!-- Template Options -->
                            <!-- Change Options functionality can be found in js/app.js - templateOptions() -->
                            <li class="dropdown">
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
                                </ul>
                            </li>
                            <!-- END Template Options -->
                        </ul>
                        <!-- END Left Header Navigation -->

                        <!-- Search Form -->
                       <%-- <form action="index.html" method="post" class="navbar-form-custom">
                            <div class="form-group">
                                <input type="text" id="top-search" name="top-search" class="form-control" placeholder="Search..">
                            </div>
                        </form>--%>
                        <!-- END Search Form -->

                        <!-- Right Header Navigation -->
     <div class="custom-right">
                        <ul class="nav navbar-nav-custom " >
                            <!-- Alternative Sidebar Toggle Button -->
                            <li >
                                <!-- If you do not want the main sidebar to open when the alternative sidebar is closed, just remove the second parameter: App.sidebar('toggle-sidebar-alt'); -->
                                <a href="javascript:void(0)" onclick="App.sidebar('toggle-sidebar-alt', 'toggle-other');this.blur();">
                                    <i class="gi gi-share_alt"></i>
                                    <span class="label label-primary label-indicator animation-floating">4</span>
                                </a>
                            </li>
                            <!-- END Alternative Sidebar Toggle Button -->
                        
                            <!-- User Dropdown -->
                            <li class="dropdown" >
                                <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown">
                                    <img src="../../../assets/img/placeholders/avatars/avatar.jpg" alt="avatar"> <i class="fa fa-angle-down"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-custom dropdown-menu-right">
                                    <li class="dropdown-header text-center">Header</li>
                                    <li>
                                        <a href="javascript:void(0)">
                                            <i class="fa fa-clock-o fa-fw pull-right"></i>
                                            <span class="badge pull-right">10</span>
                                            Link #1
                                        </a>
                                        <a href="javascript:void(0)">
                                            <i class="fa fa-envelope-o fa-fw pull-right"></i>
                                            <span class="badge pull-right">5</span>
                                            Link #2
                                        </a>
                                        <a href="javascript:void(0)">
                                            <i class="fa fa-magnet fa-fw pull-right"></i>
                                            <span class="badge pull-right">3</span>
                                            Link #3
                                        </a>
                                        <a href="javascript:void(0)">
                                            <i class="fa fa-question fa-fw pull-right"></i>
                                            <span class="badge pull-right">11</span>
                                            Link #4
                                        </a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a href="javascript:void(0)">
                                            <i class="fa fa-user fa-fw pull-right"></i>
                                            Link #1
                                        </a>
                                        <a href="javascript:void(0)">
                                            <i class="fa fa-cog fa-fw pull-right"></i>
                                            Link #2
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <!-- END User Dropdown -->
                        </ul>
                        <!-- END Right Header Navigation -->
         </div>
                    </header>