﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RightSidebar.ascx.cs" Inherits="WebSchool.ADMIN.Controls.Common.RightSidebar" %>
<!-- Alternative Sidebar -->
<div id="sidebar-alt">
    <!-- Wrapper for scrolling functionality -->
    <div class="sidebar-scroll">
        <!-- Sidebar Content -->
        <div class="sidebar-content">
            <!-- Chat -->
            <!-- Chat demo functionality initialized in js/app.js -> chatUi() -->
            <a href="page_ready_chat.html" class="sidebar-title">
                <i class="gi gi-comments pull-right"></i><strong>Chat</strong>UI
            </a>
            <!-- Chat Users -->
            <ul class="chat-users clearfix">
                <li>
                    <a href="javascript:void(0)" class="chat-user-online">
                        <span></span>
                        <img src="img/placeholders/avatars/avatar12.jpg" alt="avatar" class="img-circle">
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)" class="chat-user-online">
                        <span></span>
                        <img src="img/placeholders/avatars/avatar15.jpg" alt="avatar" class="img-circle">
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)" class="chat-user-online">
                        <span></span>
                        <img src="img/placeholders/avatars/avatar10.jpg" alt="avatar" class="img-circle">
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)" class="chat-user-online">
                        <span></span>
                        <img src="img/placeholders/avatars/avatar4.jpg" alt="avatar" class="img-circle">
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)" class="chat-user-away">
                        <span></span>
                        <img src="img/placeholders/avatars/avatar7.jpg" alt="avatar" class="img-circle">
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)" class="chat-user-away">
                        <span></span>
                        <img src="img/placeholders/avatars/avatar9.jpg" alt="avatar" class="img-circle">
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)" class="chat-user-busy">
                        <span></span>
                        <img src="img/placeholders/avatars/avatar16.jpg" alt="avatar" class="img-circle">
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <span></span>
                        <img src="img/placeholders/avatars/avatar1.jpg" alt="avatar" class="img-circle">
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <span></span>
                        <img src="img/placeholders/avatars/avatar4.jpg" alt="avatar" class="img-circle">
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <span></span>
                        <img src="img/placeholders/avatars/avatar3.jpg" alt="avatar" class="img-circle">
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <span></span>
                        <img src="img/placeholders/avatars/avatar13.jpg" alt="avatar" class="img-circle">
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <span></span>
                        <img src="img/placeholders/avatars/avatar5.jpg" alt="avatar" class="img-circle">
                    </a>
                </li>
            </ul>
            <!-- END Chat Users -->
            <!-- Chat Talk -->
            <div class="chat-talk display-none">
                <!-- Chat Info -->
                <div class="chat-talk-info sidebar-section">
                    <img src="img/placeholders/avatars/avatar5.jpg" alt="avatar" class="img-circle pull-left">
                    <strong>John</strong> Doe
                            <button id="chat-talk-close-btn" class="btn btn-xs btn-default pull-right">
                                <i class="fa fa-times"></i>
                            </button>
                </div>
                <!-- END Chat Info -->
                <!-- Chat Messages -->
                <ul class="chat-talk-messages">
                    <li class="text-center"><small>Yesterday, 18:35</small></li>
                    <li class="chat-talk-msg animation-slideRight">Hey admin?</li>
                    <li class="chat-talk-msg animation-slideRight">How are you?</li>
                    <li class="text-center"><small>Today, 7:10</small></li>
                    <li class="chat-talk-msg chat-talk-msg-highlight themed-border animation-slideLeft">I'm fine, thanks!</li>
                </ul>
                <!-- END Chat Messages -->
                <!-- Chat Input -->
                <form action="index.html" method="post" id="sidebar-chat-form" class="chat-form">
                    <input type="text" id="sidebar-chat-message" name="sidebar-chat-message" class="form-control form-control-borderless" placeholder="Type a message..">
                </form>
                <!-- END Chat Input -->
            </div>
            <!--  END Chat Talk -->
            <!-- END Chat -->
            <!-- Activity -->
            <a href="javascript:void(0)" class="sidebar-title">
                <i class="fa fa-globe pull-right"></i><strong>Activity</strong>UI
            </a>
            <div class="sidebar-section">
                <div class="alert alert-danger alert-alt">
                    <small>just now</small><br>
                    <i class="fa fa-thumbs-up fa-fw"></i>Upgraded to Pro plan
                </div>
                <div class="alert alert-info alert-alt">
                    <small>2 hours ago</small><br>
                    <i class="gi gi-coins fa-fw"></i>You had a new sale!
                </div>
                <div class="alert alert-success alert-alt">
                    <small>3 hours ago</small><br>
                    <i class="fa fa-plus fa-fw"></i><a href="#"><strong>John Doe</strong></a> would like to become friends!<br>
                    <a href="javascript:void(0)" class="btn btn-xs btn-primary"><i class="fa fa-check"></i>Accept</a>
                    <a href="javascript:void(0)" class="btn btn-xs btn-default"><i class="fa fa-times"></i>Ignore</a>
                </div>
                <div class="alert alert-warning alert-alt">
                    <small>2 days ago</small><br>
                    Running low on space<br>
                    <strong>18GB in use</strong> 2GB left<br>
                    <a href="page_ready_pricing_tables.html" class="btn btn-xs btn-primary"><i class="fa fa-arrow-up"></i>Upgrade Plan</a>
                </div>
            </div>
            <!-- END Activity -->
            <!-- Messages -->
            <a href="page_ready_inbox.html" class="sidebar-title">
                <i class="fa fa-envelope pull-right"></i><strong>Messages</strong>UI (5)
            </a>
            <div class="sidebar-section">
                <div class="alert alert-alt">
                    Debra Stanley<small class="pull-right">just now</small><br>
                    <a href="page_ready_inbox_message.html"><strong>New Follower</strong></a>
                </div>
                <div class="alert alert-alt">
                    Sarah Cole<small class="pull-right">2 min ago</small><br>
                    <a href="page_ready_inbox_message.html"><strong>Your subscription was updated</strong></a>
                </div>
                <div class="alert alert-alt">
                    Bryan Porter<small class="pull-right">10 min ago</small><br>
                    <a href="page_ready_inbox_message.html"><strong>A great opportunity</strong></a>
                </div>
                <div class="alert alert-alt">
                    Jose Duncan<small class="pull-right">30 min ago</small><br>
                    <a href="page_ready_inbox_message.html"><strong>Account Activation</strong></a>
                </div>
                <div class="alert alert-alt">
                    Henry Ellis<small class="pull-right">40 min ago</small><br>
                    <a href="page_ready_inbox_message.html"><strong>You reached 10.000 Followers!</strong></a>
                </div>
            </div>
            <!-- END Messages -->
        </div>
        <!-- END Sidebar Content -->
    </div>
    <!-- END Wrapper for scrolling functionality -->
</div>
<!-- END Alternative Sidebar -->
