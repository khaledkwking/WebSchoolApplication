<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Main.ascx.cs" Inherits="WebSchool.Controls.ContentPages.Main" %>

  <!-- Galleries Row -->
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-12 col-xs-12">
                                <!-- Lightbox Gallery Block -->
                                <div class="block">
                                    <!-- Lightbox Gallery Title -->
                                    <div class="block-title">
                                        <h2><strong>
                                            <%--<asp:Literal ID="Literal14" runat="server" Text="<%$ Resources:DefaultResource, HeaderTitle%>" />--%>

                                             <%= Globals.CompanyName%> 
                                            </strong></h2>
                                    </div>
                                    <!-- END Lightbox Gallery Title -->

                                    <!-- Lightbox Gallery Content -->
                                    <!--
                                    Just create a div with the class .gallery and put the images any way you like in grid.
                                    If you would like to enable the lightbox gallery, just add the attribute data-toggle="lightbox-image" to the div. If you do that
                                    make sure that you put your images inside links with the class .gallery-link and the source of your large image as the value of each href attribute!
                                    -->
                                    <%--<div class="gallery" data-toggle="lightbox-gallery">
                                      
                                    </div>--%>
                                     <div class="row text-center">
           
            <%-- <h3 class="Titlepage col-12" style="margin-bottom: 10px">
                      <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:DefaultResource, HeaderTitle%>" /> 
                 </h3>--%>
                        <label class=" col-md-12 col-sm-12 col-form-label CompanyNameTitle">
                            <asp:Literal ID="lblCompanyname" runat="server" Text="---" />
                        </label>
                                           
        </div>
            
            <div class="w3-container w3-padding-64 w3-white w3-center" style="min-height:480px">
             
               
              
                <div class="w3-row" >
                  <%--  --%>
   
                    
                    
                     
                  <div class="w3-col s3">
                        <a href="../../Admin/SchTeachers.aspx" runat ="server" id="Setup"><i class="fa fa-calendar-o w3-text-red w3-xxxlarge"></i></a>
                        <p class="inputTxt"> 
                                      <asp:Literal ID="Literal7" runat="server" Text= "<%$ Resources:DefaultResource, SchoolTeachers%>" /> 
                        </p>
                    </div>

                  <div class="w3-col s3">
                        <a href="../../Admin/SchStages.aspx" runat ="server" id="PriceList"><i class="fa fa-users w3-text-cyan w3-xxxlarge fa"></i></a>
                        <p class="inputTxt"> 
                            <asp:Literal ID="Literal9" runat="server" Text= "<%$ Resources:DefaultResource, SchoolStages%>" />
                        </p>
                    </div>
                    
                      <div class="w3-col s3">
                        <a href="../../Admin/SchStages.aspx" runat ="server" id="RenewSub"><i class="fa fa-edit w3-text-orange w3-xxxlarge"></i></a>
                        <p class="inputTxt">
                            
                        <asp:Literal ID="Literal8" runat="server" Text= "<%$ Resources:DefaultResource, SchoolPeriods%>" />
                        </p>
                    </div>
                    <div class="w3-col s3">
                       
                        <a href="../../Admin/SchStudents.aspx" runat ="server"><i class="fa fa-male w3-text-cyan w3-xxxlarge"></i></a>
                        <p class="inputTxt">
                             <asp:Literal ID="Literal5" runat="server" Text= "<%$ Resources:DefaultResource, SchoolStudents%>" /> 
                        </p>

                    </div>

                 
                </div>
                     <div class="w3-row" style="margin-top: 20px">
                  
                                 
                   
                

                           <div class="w3-col s3">
                        <a href="../../Admin/SchInvoicesGroupAdd.aspx?AddFlag=1" id="A4" runat ="server">
                            <i class="fa fa-clipboard  w3-text-blue w3-xxxlarge"></i></a>
                        <p class="inputTxt"> 
                            <asp:Literal ID="Literal13" runat="server" Text= "<%$ Resources:DefaultResource, AddGroupInvoice%>" /> 
                        </p>
                    </div>
                  <div class="w3-col s3">
                        <a href="../../Admin/SchInvoicesDetials.aspx" runat ="server" id="Users">
                          
                             <i class="fa fa-columns w3-text-green w3-xxxlarge" ></i>
                       </a>
                        <p class="inputTxt">
                            <asp:Literal ID="Literal6" runat="server" Text= "<%$ Resources:DefaultResource, SchoolWorkOrders%>" /> 
                        </p>
                    </div>
                           <div class="w3-col s3 ">
                        <a href="../../Admin/SchPaymentReciteAll.aspx" runat ="server" id="ExpiredSub">
                            <i class="fa fa-money w3-text-green w3-xxxlarge" ></i></a>
                        <p class="inputTxt">  
                            <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:DefaultResource, SchoolPayments%>" /> 
                            </p>
                    </div>
                         <div class="w3-col s3">
                        <a href="../../Admin/SchInvoices.aspx" runat ="server" id="Subscribers"><i class="fa fa-usd w3-text-blue w3-xxxlarge"></i></a>
                        <p class="inputTxt">
                             <asp:Literal ID="Literal3" runat="server" Text= "<%$ Resources:DefaultResource, SalesInvoiceInv%>" /> 
                        </p>
                    </div>
                </div>
                  <div class="w3-row" style="margin-top: 20px">
                   
                    
                    <div class="w3-col s3">
                        <a href="../../Admin/SchWorkOrderRpt.aspx" runat ="server" id="A3">
                            <i class="fa fa-cubes  w3-text-cyan w3-xxxlarge"></i></a>
                        <p class="inputTxt">
                            <asp:Literal ID="Literal12" runat="server" Text= "<%$ Resources:DefaultResource, SchoolWorkordersReport%>" /> 
                        </p>
                    </div>
                
                        <div class="w3-col s3">
                        <a href="../../admin/SchStatistics.aspx" id="Subs" runat ="server">
                            <i class="fa fa-bar-chart w3-text-blue w3-xxxlarge"></i></a>
                        <p class="inputTxt"> 
                            <asp:Literal ID="Literal4" runat="server" Text= "<%$ Resources:DefaultResource, Performance%>" /> 
                        </p>
                    </div>

                       <div class="w3-col s3 ">
                        <a href="../../Admin/SchInvoicesPaymentDebt.aspx" runat ="server" id="A1">
                            <i class="fa fa-book w3-text-green w3-xxxlarge" ></i></a>
                        <p class="inputTxt">  
                            <asp:Literal ID="Literal10" runat="server" Text="<%$ Resources:DefaultResource, InvoicesDebts%>" /> 
                            </p>


                    </div>
                       <div class="w3-col s3">
                        <a href="../../Admin/Sch_CustomersList.aspx" runat ="server" id="A2">
                            <i class="fa fa-file-o w3-text-blue w3-xxxlarge"></i></a>
                        <p class="inputTxt">
                             <asp:Literal ID="Literal11" runat="server" Text= "<%$ Resources:DefaultResource, CustomerCalls%>" /> 
                        </p>
                    </div>
                </div>

           
           <div class="w3-row" style="margin-top: 20px">
                   
                    
                    <div class="w3-col s3">
                        <a href="../../Admin/Sch_CustomersCallsList.aspx" runat ="server" id="A5">
                            <i class="fa fa-table  w3-text-black w3-xxxlarge"></i></a>
                        <p class="inputTxt">
                            <asp:Literal ID="Literal1" runat="server" Text= "<%$ Resources:DefaultResource, CustomerCallRpt%>" /> 
                        </p>
                    </div>
                
                        <div class="w3-col s3">
                        <a href="../../admin/SchPaymentReciteBack.aspx?BackFlag=1" id="A6" runat ="server">
                            <i class="fa fa-line-chart w3-text-orange w3-xxxlarge"></i></a>
                        <p class="inputTxt"> 
                            <asp:Literal ID="Literal14" runat="server" Text= "<%$ Resources:DefaultResource, SchoolInvoiceReturns%>" /> 
                        </p>
                    </div>

                      
                       <div class="w3-col s3">
                        <a href="../../Admin/SchWorkOrderRpt.aspx?AccFlag=True" runat ="server" id="A8">
                            <i class="fa fa-files-o w3-text-red w3-xxxlarge"></i></a>
                        <p class="inputTxt">
                             <asp:Literal ID="Literal16" runat="server" Text= "<%$ Resources:DefaultResource, TeacherAccount%>" /> 
                        </p>
                    </div>
                <div class="w3-col s3 ">
                         <a href="../../Admin/SchStudentsGroupAttendance.aspx" runat ="server" id="A7">
                            <i class="fa fa-book w3-text-brown w3-xxxlarge" ></i></a>
                        <p class="inputTxt">  
                            <asp:Literal ID="Literal15" runat="server" Text="<%$ Resources:DefaultResource, GroupAttandences%>" /> 
                            </p>
                    </div>
                </div>



            </div>
                                    <!-- END Lightbox Gallery Content -->
                                </div>
                                <!-- END Lightbox Gallery Block -->
                            </div>
                           
                        </div>
                        <!-- END Galleries Row -->