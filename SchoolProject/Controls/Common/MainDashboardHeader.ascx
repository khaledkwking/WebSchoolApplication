<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MainDashboardHeader.ascx.cs" Inherits="WebSchool.Controls.Common.MainDashboardHeader" %>

 <!-- Dashboard Header -->
    <!-- For an image header add the class 'content-header-media' and an image as in the following example -->
                        <div class="content-header content-header-media">
                            <div class="header-section">
                                <div class="row">
                                    <!-- Main Title (hidden on small devices for the statistics to fit) -->
                                    <div class="col-md-4 col-lg-6 hidden-xs hidden-sm">
                                        <h1> <strong><%=Globals.CompanyName%></strong><br><small>
                                            <%=Resources.DefaultResource.HeaderSubTitle%></small></h1>
                                    </div>
                                    <!-- END Main Title -->

                                    <!-- Top Stats -->
                                    <div class="col-md-8 col-lg-6">
                                        <div class="row text-center">
                                            <div class="col-xs-4 col-sm-3">
                                                <h2 class="animation-hatch">
                                                   <small> <%=Resources.DefaultResource.SchoolStudentsAffairs %></small><br>
                                                    <small><i class="fa fa-thumbs-o-up"></i> <%--Great--%></small>
                                                </h2>
                                            </div>
                                            <div class="col-xs-4 col-sm-3">
                                                <h2 class="animation-hatch">
                                                    <small><%=Resources.DefaultResource.Sales%></small><br>
                                                    <small><i class="fa fa-heart-o"></i> <%--Likes--%></small>
                                                </h2>
                                            </div>
                                            <div class="col-xs-4 col-sm-3">
                                                <h2 class="animation-hatch">
                                                    <small><%=Resources.DefaultResource.Accounting%></small><br>
                                                    <small><i class="fa fa-calendar-o"></i> <%--Events--%></small>
                                                </h2>
                                            </div>
                                            <!-- We hide the last stat to fit the other 3 on small devices -->
                                           <%-- <div class="col-sm-3 hidden-xs">
                                                <h2 class="animation-hatch">
                                                    <strong>27&deg; C</strong><br>
                                                    <small><i class="fa fa-map-marker"></i> Sydney</small>
                                                </h2>
                                            </div>--%>
                                        </div>
                                    </div>
                                    <!-- END Top Stats -->
                                </div>
                            </div>
                            
                            <!-- For best results use an image with a resolution of 2560x248 pixels (You can also use a blurred image with ratio 10:1 - eg: 1000x100 pixels - it will adjust and look great!) -->
                            <%--<img src="../assets/img/placeholders/headers/GymHeader.jpg" alt="header image" class="animation-pulseSlow">--%>
                            <ContentPages:CarouselHeaderWithInfo ID="CarouselHeaderWithInfoUC" runat="server" />
                        </div>
                        <!-- END Dashboard Header -->