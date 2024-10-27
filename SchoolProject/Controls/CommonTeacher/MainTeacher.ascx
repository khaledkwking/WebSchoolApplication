<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MainTeacher.ascx.cs" Inherits="WebSchool.Controls.CommonTeacher.MainTeacher" %>

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
            
            <div class="w3-container w3-padding-64 w3-white w3-center" style="min-height:400px">
             
               
              
                <div class="w3-row" >
                  <%--  --%>
   
                    
                     <div class="w3-col s3">
                          <p class="inputTxt"> 
                              &nbsp;
                              </p>
                         </div>
                      <div class="w3-col s3">
                         </div>
                  <div class="w3-col s3">
                        <a href="" runat ="server" id="Setup">
                            <i class="fa fa-calendar-o w3-text-red w3-xxxlarge">

                            </i>

                        </a>
                        <p class="inputTxt"> 
                                      <asp:Literal ID="Literal7" runat="server" Text= "<%$ Resources:DefaultResource, TeacherData%>" /> 
                        </p>
                    </div>
                     <div class="w3-col s3">
                        <a href="../../Admin/SchTeachersWorkOrders.aspx" runat ="server" id="A5"><i class="fa fa-cubes  w3-text-cyan w3-xxxlarge"></i></a>
                        <p class="inputTxt">
                            <asp:Literal ID="Literal1" runat="server" Text= "<%$ Resources:DefaultResource, TeacherClass%>" /> 
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