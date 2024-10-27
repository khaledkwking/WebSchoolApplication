<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BranchesList.ascx.cs" Inherits="WebSchool.Controls.ContentPages.BranchesList" %>

  <!-- Galleries Row -->
                        <div class="row">
                            <div class="col-md-12">
                                <!-- Lightbox Gallery Block -->
                                <div class="block">
                                    <!-- Lightbox Gallery Title -->
                                    <div class="block-title">
                                        <h2><strong> <%=Resources.DefaultResource.Branches %></strong></h2>
                                    </div>
                                     <div class="form-horizontal form-bordered">
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">
                                            <%= Resources.DefaultResource.Branches%> 
                                        </label>
                                        <div class="col-md-10">
                                            
                                            <asp:DropDownList ID="DropDownListBranches" runat="server" DataSourceID="BranchesODS" DataTextField="BranchName" 
                                                CssClass="form-control" DataValueField="BranchId"></asp:DropDownList>
                                        </div>
                                       
                                    </div>

                                    </div>
                                    <!-- END Lightbox Gallery Title -->

                                    <!-- Lightbox Gallery Content -->
                                    <!--
                                    Just create a div with the class .gallery and put the images any way you like in grid.
                                    If you would like to enable the lightbox gallery, just add the attribute data-toggle="lightbox-image" to the div. If you do that
                                    make sure that you put your images inside links with the class .gallery-link and the source of your large image as the value of each href attribute!
                                    -->

                                   <%-- <div class="gallery" data-toggle="lightbox-gallery">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <a href="../../Uploades/Offers/Offer2.jpg" class="gallery-link" title="Image Info">
                                                    <img src="../../Uploades/Offers/Offer2.jpg" alt="image">
                                                </a>
                                            </div>
                                            <div class="col-sm-4">
                                                <a href="../../Uploades/Offers/Offer2.jpg" class="gallery-link" title="Image Info">
                                                    <img src="../../Uploades/Offers/Offer2.jpg" alt="image">
                                                </a>
                                            </div>
                                            <div class="col-sm-4">
                                                <a href="../../Uploades/Offers/Offer2.jpg" class="gallery-link" title="Image Info">
                                                    <img src="../../Uploades/Offers/Offer2.jpg" alt="image">
                                                </a>
                                            </div>
                                            <div class="col-sm-4">
                                                <a href="i../../Uploades/Offers/Offer2.jpg" class="gallery-link" title="Image Info">
                                                    <img src="../../Uploades/Offers/Offer2.jpg" alt="image">
                                                </a>
                                            </div>
                                            <div class="col-sm-4">
                                                <a href="../../Uploades/Offers/Offer2.jpg" class="gallery-link" title="Image Info">
                                                    <img src="../../Uploades/Offers/Offer2.jpg" alt="image">
                                                </a>
                                            </div>
                                            <div class="col-sm-4">
                                                <a href="../../Uploades/Offers/Offer2.jpg" class="gallery-link" title="Image Info">
                                                    <img src="../../Uploades/Offers/Offer2.jpg" alt="image">
                                                </a>
                                            </div>
                                            <div class="col-sm-4">
                                                <a href="../../Uploades/Offers/Offer2.jpg" class="gallery-link" title="Image Info">
                                                    <img src="../../Uploades/Offers/Offer2.jpg" alt="image">
                                                </a>
                                            </div>
                                            <div class="col-sm-4">
                                                <a href="../../Uploades/Offers/Offer2.jpg" class="gallery-link" title="Image Info">
                                                    <img src="../../Uploades/Offers/Offer2.jpg" alt="image">
                                                </a>
                                            </div>
                                            <div class="col-sm-4">
                                                <a href="../../Uploades/Offers/Offer2.jpg" class="gallery-link" title="Image Info">
                                                    <img src="../../Uploades/Offers/Offer2.jpg" alt="image">
                                                </a>
                                            </div>
                                        </div>
                                    </div>--%>
                                    <!-- END Lightbox Gallery Content -->
                                </div>
                                <!-- END Lightbox Gallery Block -->
                            </div>
                           
                        </div>
                        <!-- END Galleries Row -->
<asp:ObjectDataSource ID="BranchesODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Read" TypeName="BOL.Branches">
    <SelectParameters>
        
    <asp:Parameter DefaultValue="1.1" Name="ActionCode" Type="String" />
        <asp:SessionParameter DefaultValue="" Name="OrgId" SessionField="VendorID" Type="Int64" />
    <asp:Parameter Name="BranchId" Type="Int64" />
        <asp:Parameter Name="SearchText" Type="String" />
    </SelectParameters>
</asp:ObjectDataSource>