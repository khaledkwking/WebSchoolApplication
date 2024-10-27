<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Sch_Statistics.ascx.cs" Inherits="WebSchool.ADMIN.Controls.School.Sch_Statistics" %>

<div class="row">
<div class="col-md-12 col-sm-12">
<!-- Lightbox Gallery Block -->
<div class="block">
<%--<div class="content-header">
    <div class="header-section">
        <h1>
            <i class="gi gi-user"></i><%= Resources.DefaultResource.Branches%> 
        </h1>
    </div>
</div>--%>   
<ul class="breadcrumb breadcrumb-top">
    <li><a href="Main.aspx"><%= Resources.DefaultResource.Main%> </a></li>
    <li> <%= Resources.DefaultResource.Performance%> </li>
</ul>
       
<div class="block">
    <!-- Table Styles Title -->
    
    <!-- END Table Styles Title -->

    <div class="gallery gallery-widget" data-toggle="lightbox-gallery" style ="min-height:1300px">
               
       <!-- General Data Block -->                             
        <div class="input-group">
            <asp:TextBox ID="StartDateTextBox" runat="server"  CssClass="form-control input-datepicker" placeholder="<%$ Resources:DefaultResource, FromDate%>" data-date-format="dd/mm/yyyy" autocomplete ="off"/>
            <span class="input-group-btn">
                
                <asp:LinkButton ID="ClearLinkButton" runat="server" CssClass="btn btn-danger" OnClick="ClearLinkButton_Click"> <i class="hi hi-remove"></i><%= Resources.DefaultResource.ClearSearch%></asp:LinkButton>
               
                <asp:LinkButton ID="SearchLinkButton" runat="server" CssClass="btn btn-primary" OnClick="SearchLinkButton_Click"> <i class="fa fa-search"></i><%= Resources.DefaultResource.SearchTitle%></asp:LinkButton>

            </span>
        </div>
        <br />
    <div id="ErrorDiv" runat="server"></div>
                           
           <div class="col-md-12 col-xs-12">
                            <!-- Basic Form Elements Block -->
                            <div class="block" style ="min-height:1300px">
                                <!-- Basic Form Elements Title -->
                                <div class="block-title">
                                    <h2><strong><%= Resources.DefaultResource.UpdateRecord %></strong> <%= Resources.DefaultResource.Performance%></h2>
                                </div>
                                <!-- END Form Elements Title -->
                                <!-- Basic Form Elements Content -->
                                <div class="form-horizontal form-bordered">

                            <!--begin::Form-->
                          
                                     <%--<asp:TextBox ID="TextBoxOrgId" runat="server" CssClass="form-control" Text='<%# Bind("OrgId") %>'  Visible="false"/>--%>
                                  
                                  <br />

                                        <div class="row">
               
                 <div class="col-sm-6 col-lg-4">
                                <!-- Widget -->
                                <a  class="widget widget-hover-effect1">
                                    <div class="widget-simple">
                                        <div class="widget-icon pull-left themed-background-spring animation-fadeIn">
                                            <i class="fa fa-file-pdf-o"></i>
                                        </div>
                                        <h3 class="widget-content text-right animation-pullDown">
                                             <strong><asp:Label ID="lblPayDayLink" runat="server" Text="Label"></asp:Label></strong><br>
                                            <small><asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:DefaultResource, PayDayLink%>" /></small>
                                        </h3>
                                    </div>
                                </a>
                                <!-- END Widget -->
                            </div>
                            <div class="col-sm-6 col-lg-4">
                                <!-- Widget -->
                                <a href="SchPaymentReciteAll.aspx?SFlag=1" class="widget widget-hover-effect1">
                                    <div class="widget-simple">
                                        <div class="widget-icon pull-left themed-background-fire animation-fadeIn">
                                            <i class="gi gi-envelope"></i>
                                        </div>
                                        <h3 class="widget-content text-right animation-pullDown">
                                             <strong><asp:Label ID="lblDayPayments" runat="server" Text="Label"></asp:Label></strong>
                                            <small><asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:DefaultResource, DayPayments%>" /></small>
                                        </h3>
                                    </div>
                                </a>
                                <!-- END Widget -->
                            </div>
                              
                               <div class="col-sm-6 col-lg-4">
                                <!-- Widget -->
                                <a  href="SchInvoices.aspx?SFlag=1" class="widget widget-hover-effect1">
                                    <div class="widget-simple">
                                        <div class="widget-icon pull-left themed-background-autumn animation-fadeIn">
                                            <i class="fa fa-file-text"></i>
                                        </div>
                                        <h3 class="widget-content text-right animation-pullDown">
                                             <strong>  <asp:Label ID="lblDayInvoicess" runat="server" Text="Label"></asp:Label>   </strong><br>
                                            <small>
                                                 <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:DefaultResource, DayInvoices%>" />
                                                

                                            </small>
                                        </h3>
                                    </div>
                                </a>
                                <!-- END Widget -->
                            </div>
                                            


                                    </div>
                                    <br />
                                     <div class="row">
                                             <div class="col-sm-6 col-lg-6">
                                <!-- Widget -->
                                <a  class="widget widget-hover-effect1">
                                    <div class="widget-simple">
                                        <div class="widget-icon pull-left themed-background-autumn animation-fadeIn">
                                            <i class="fa fa-area-chart"></i>
                                        </div>
                                        <h3 class="widget-content text-right animation-pullDown">
                                             <strong>  <asp:Label ID="lblPayDayCash" runat="server" Text="Label"></asp:Label>   </strong><br>
                                            <small>
                                                 <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:DefaultResource, PayDayCash%>" />
                                                

                                            </small>
                                        </h3>
                                    </div>
                                </a>
                                <!-- END Widget -->
                            </div>
                             <div class="col-sm-6 col-lg-6">
                                <!-- Widget -->
                                <a  class="widget widget-hover-effect1">
                                    <div class="widget-simple">
                                        <div class="widget-icon pull-left themed-background-fire animation-fadeIn">
                                            <i class="gi gi-envelope"></i>
                                        </div>
                                        <h3 class="widget-content text-right animation-pullDown">
                                             <strong><asp:Label ID="lblPayDayKeyNet" runat="server" Text="Label"></asp:Label></strong>
                                            <small><asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:DefaultResource, PayDayKeyNet%>" /></small>
                                        </h3>
                                    </div>
                                </a>
                                <!-- END Widget -->
                            </div>      
                          
                     


                                    </div>
                                             <br />
                            <div class="row">
                                <div class="col-sm-6 col-lg-4">
                                <!-- Widget -->
                                <a  class="widget widget-hover-effect1">
                                    <div class="widget-simple">
                                        <div class="widget-icon pull-left themed-background-autumn animation-fadeIn">
                                            <i class="fa fa-file-text"></i>
                                        </div>
                                        <h3 class="widget-content text-right animation-pullDown">
                                             <strong>  <asp:Label ID="lblPayAllCash" runat="server" Text="Label"></asp:Label>   </strong><br>
                                            <small>
                                                 <asp:Literal ID="Literal9" runat="server" Text="<%$ Resources:DefaultResource, PayAllCash%>" />
                                                

                                            </small>
                                        </h3>
                                    </div>
                                </a>
                                <!-- END Widget -->
                            </div>
                                     <div class="col-sm-6 col-lg-4">
                                <!-- Widget -->
                                <a  class="widget widget-hover-effect1">
                                    <div class="widget-simple">
                                        <div class="widget-icon pull-left themed-background-amethyst animation-fadeIn">
                                            <i class="gi gi-picture"></i>
                                        </div>
                                        <h3 class="widget-content text-right animation-pullDown">
                                             <strong><asp:Label ID="lblDayPaymentsAll" runat="server" Text="Label"></asp:Label></strong>
                                            <small><asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:DefaultResource, DayPaymentsAll%>" /></small>
                                        </h3>
                                    </div>
                                </a>
                                <!-- END Widget -->
                            </div>
                            <div class="col-sm-6 col-lg-4">
                                <!-- Widget -->
                                <a  class="widget widget-hover-effect1">
                                    <div class="widget-simple">
                                        <div class="widget-icon pull-left themed-background-spring animation-fadeIn">
                                            <i class="gi gi-usd"></i>
                                        </div>
                                        <h3 class="widget-content text-right animation-pullDown">
                                             <strong><asp:Label ID="lblAllInvoices" runat="server" Text="Label"></asp:Label></strong><br>
                                            <small><asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:DefaultResource, AllInvoices%>" /></small>
                                        </h3>
                                    </div>
                                </a>
                                <!-- END Widget -->
                            </div>

                            </div>
                                    <br />
                            <div class="row">
                            
                            <div class="col-sm-6 col-lg-6">
                                <!-- Widget -->
                                <a  class="widget widget-hover-effect1">
                                    <div class="widget-simple">
                                        <div class="widget-icon pull-left themed-background-spring animation-fadeIn">
                                            <i class="gi gi-usd"></i>
                                        </div>
                                        <h3 class="widget-content text-right animation-pullDown">
                                             <strong><asp:Label ID="lblPayAllLink" runat="server" Text="Label"></asp:Label></strong><br>
                                            <small><asp:Literal ID="Literal10" runat="server" Text="<%$ Resources:DefaultResource, PayAllLink%>" /></small>
                                        </h3>
                                    </div>
                                </a>
                                <!-- END Widget -->
                            </div>
                            <div class="col-sm-6 col-lg-6">
                                <!-- Widget -->
                                <a  class="widget widget-hover-effect1">
                                    <div class="widget-simple">
                                        <div class="widget-icon pull-left themed-background-fire animation-fadeIn">
                                            <i class="gi gi-envelope"></i>
                                        </div>
                                        <h3 class="widget-content text-right animation-pullDown">
                                             <strong><asp:Label ID="lblPayAllKeyNet" runat="server" Text="Label"></asp:Label></strong>
                                            <small><asp:Literal ID="Literal11" runat="server" Text="<%$ Resources:DefaultResource, PayAllKeyNet%>" /></small>
                                        </h3>
                                    </div>
                                </a>
                                <!-- END Widget -->
                            </div>
                           


                             </div>
                                    <br />
                                </div>
               </div>


    <asp:TextBox ID="txtOrgId" runat="server" 
        Visible="False" ></asp:TextBox>

    </div>

</div>
                                </div> 
           </div> 
     </div>