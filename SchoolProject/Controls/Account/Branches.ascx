<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Branches.ascx.cs" Inherits="WebSchool.Controls.Account.Branches" %>
<%--<div class="content-header">
    <div class="header-section">
        <h1>
            <i class="gi gi-user"></i><%= Resources.DefaultResource.Branches%> 
        </h1>
    </div>
</div>--%>
<ul class="breadcrumb breadcrumb-top">
    <li><a href="default.aspx"><%= Resources.DefaultResource.Main%> </a></li>
    <li> <%= Resources.DefaultResource.Branches%> </li>
</ul>


<div class="block table-responsive-lg">
    <!-- Table Styles Title -->
    <div class="block-title">
        <h2><strong><%= Resources.DefaultResource.List%>  </strong> <%= Resources.DefaultResource.Branches%> </h2>
        <div class="block-options pull-right">
            <asp:LinkButton ID="NewRecord" runat="server" CssClass="btn btn-sm btn-success" data-toggle="tooltip" title="<%$ Resources:DefaultResource, NewRecord%>"  data-original-title="<%$ Resources:DefaultResource, NewRecord%>" OnClick="NewRecord_Click">
                <i class="fa fa-file"></i>
            </asp:LinkButton>
        </div>
    </div>
    <!-- END Table Styles Title -->

    <div class="gallery gallery-widget" data-toggle="lightbox-gallery">
        <!--
        Available Table Classes:
            'table'             - basic table
            'table-bordered'    - table with full borders
            'table-borderless'  - table with no borders
            'table-striped'     - striped table
            'table-condensed'   - table with smaller top and bottom cell padding
            'table-hover'       - rows highlighted on mouse hover
            'table-vcenter'     - middle align content vertically
        -->
        <div class="input-group">

            <asp:TextBox ID="SearchTextBox" runat="server" CssClass="form-control" placeholder="<%$ Resources:DefaultResource, Search%>"></asp:TextBox>
            <span class="input-group-btn">

                <asp:LinkButton ID="ClearLinkButton" runat="server" CssClass="btn btn-danger" OnClick="ClearLinkButton_Click">
                    <i class="hi hi-remove"></i> <%= Resources.DefaultResource.ClearSearch%>
                </asp:LinkButton>

                <asp:LinkButton ID="SearchLinkButton" runat="server" CssClass="btn btn-primary">
                    <i class="fa fa-search"></i><%= Resources.DefaultResource.SearchTitle%>
                </asp:LinkButton>

            </span>
        </div>
        <br />
        <div id="ErrorDiv" runat="server"></div>
        <asp:ListView ID="lv" runat="server" DataKeyNames="BRANCHCODE" DataSourceID="BranchesDS" OnItemCommand="lv_ItemCommand" OnItemDataBound="lv_ItemDataBound">
            <EditItemTemplate>
               <tr>
                    <td colspan="5">
                        <div class="col-md-12 col-xs-12">
                            <!-- Basic Form Elements Block -->
                            <div class="block">
                                <!-- Basic Form Elements Title -->
                                <div class="block-title">
                                    <h2><strong><%= Resources.DefaultResource.UpdateRecord %></strong> <%= Resources.DefaultResource.Data%></h2>
                                </div>
                                <!-- END Form Elements Title -->
                                <!-- Basic Form Elements Content -->
                                <div class="form-horizontal form-bordered">

                            <!--begin::Form-->
                          
                                     <asp:TextBox ID="TextBoxOrgId" runat="server" CssClass="form-control" Text='<%# Bind("OrgId") %>'  Visible="false"/>
                                    <div class="form-group">
                                        <label for="TitleArTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="TitleArLiteral1" runat="server" Text="<%$ Resources:DefaultResource, code%>" />
                                        </label>
                                        <div class="col-sm-10 col-xs-10 col-10">
                                            <asp:TextBox ID="TitleArTextBox" runat="server" CssClass="form-control" Text='<%# Bind("BRANCHCODE") %>' />
                                            <asp:RequiredFieldValidator ID="TitleArTextBoxRFV" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="TitleArTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator></div>

                                    </div>
                                    <div class="form-group">

                                        <label for="TitleArTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:DefaultResource, BranchName%>" />
                                        </label>
                                        <div class="col-sm-10 col-xs-10 col-10">
                                            <asp:TextBox ID="TextBoxBranchName" runat="server" CssClass="form-control" Text='<%# Bind("BRANCHNAME") %>' />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="TitleArTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator></div>

                                    </div>
                                    <div class="form-group">
                                        <label for="TitleArTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:DefaultResource, CardPhone%>" />
                                        </label>
                                        <div class="col-sm-10 col-xs-10 col-10">
                                            <asp:TextBox ID="PhoneTextBox" runat="server" CssClass="form-control" Text='<%# Bind("TelPhone") %>' />
                                           

                                        </div>

                                    </div>
                                       <div class="form-group">
                                        <label for="CompanyNameTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:DefaultResource, BranchTitle%>" />
                                        </label>
                                        <div class="col-sm-10 col-xs-10 col-10">
                                            <asp:TextBox ID="CompanyNameTextBox" runat="server" CssClass="form-control" Text='<%# Bind("CompanyName") %>' />
                                        </div>

                                    </div>
                                       
                                    <div class="form-group">
                                        <label for="AddressTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="LiteralAddress" runat="server" Text="<%$ Resources:DefaultResource, BranchAddress%>" />
                                        </label>
                                        <div class="col-sm-10 col-xs-10 col-10">
                                            <asp:TextBox ID="TextBox" runat="server" CssClass="form-control" Text='<%# Bind("Address") %>' />
                                        </div>

                                    </div>

                                
                              
                                <div class="form-group form-actions">
                                        <div class="col-md-9 col-md-offset-3">
                                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="<%$ Resources:DefaultResource, Save%>" CssClass="btn btn-sm btn-primary" ValidationGroup="DML" />
                                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="<%$ Resources:DefaultResource, Cancel%>" CssClass="btn btn-sm btn-warning" />
                                        </div>
                                    </div>
                                        </div>
                       
                            </div>
                        </div>
                    </td>
                </tr>
            </EditItemTemplate>
            
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td><%= Resources.DefaultResource.DataNotFound %></td></tr></table></EmptyDataTemplate>
            <InsertItemTemplate>
              
                    <tr>
                    <td colspan="5">
                        <div class="col-md-12">
                            <!-- Basic Form Elements Block -->
                            <div class="block">
                                <!-- Basic Form Elements Title -->
                                <div class="block-title">
                                    <h2><strong><%= Resources.DefaultResource.List %></strong> <%= Resources.DefaultResource.Branches %></h2>
                                </div>
                                <!-- END Form Elements Title -->
                                <!-- Basic Form Elements Content -->
                                <div class="form-horizontal form-bordered">

                                  <%--  <asp:TextBox ID="TextBoxOrgId" runat="server" CssClass="form-control" Text='<%# Bind("OrgId") %>'  Visible="false"/>--%>
                                    <div class="form-group">
                                         <label class="col-md-2 control-label">
                                            <%= Resources.DefaultResource.Code%>
                                            
                                        </label>
                                       
                                        <div class="col-sm-10 col-xs-10 col-10">
                                            <asp:TextBox ID="TitleArTextBox" runat="server" CssClass="form-control" Text='<%# Bind("BRANCHCODE") %>' />
                                            <asp:RequiredFieldValidator ID="TitleArTextBoxRFV" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="TitleArTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator></div>

                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="TitleArTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:DefaultResource, BranchName%>" />
                                        </label>
                                        <div class="col-sm-10 col-xs-10 col-10">
                                            <asp:TextBox ID="TextBoxBranchName" runat="server" CssClass="form-control" Text='<%# Bind("BRANCHNAME") %>' />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="TitleArTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator></div></div><div class="form-group">
                                        <label for="TitleArTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:DefaultResource, CardPhone%>" />
                                        </label>
                                        <div class="col-sm-10 col-xs-10 col-10">
                                            <asp:TextBox ID="PhoneTextBox" runat="server" CssClass="form-control" Text='<%# Bind("TelPhone") %>' />
                                           

                                        </div>

                                    </div>
                                       <div class="form-group">
                                        <label for="CompanyNameTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:DefaultResource, BranchTitle%>" />
                                        </label>
                                        <div class="col-sm-10 col-xs-10 col-10">
                                            <asp:TextBox ID="CompanyNameTextBox" runat="server" CssClass="form-control" Text='<%# Bind("CompanyName") %>' />
                                        </div>

                                    </div>
                                       
                                    <div class="form-group">
                                        <label for="AddressTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="LiteralAddress" runat="server" Text="<%$ Resources:DefaultResource, BranchAddress%>" />
                                        </label>
                                        <div class="col-sm-10 col-xs-10 col-10">
                                            <asp:TextBox ID="TextBox" runat="server" CssClass="form-control" Text='<%# Bind("Address") %>' />
                                        </div>

                                    </div>

                                    
                                
                                    <div class="form-group form-actions">
                                        <div class="col-md-9 col-md-offset-3">
                                            <asp:Button ID="UpdateButton" runat="server" CommandName="Insert" Text="<%$ Resources:DefaultResource, Update%>" CssClass="btn btn-sm btn-primary" ValidationGroup="DML" />
                                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="<%$ Resources:DefaultResource, Cancel%>" CssClass="btn btn-sm btn-warning" />
                                        </div>
                                    </div>
                                    </div>
                               <%-- <div class="kt-portlet__foot">
                                    <div class="kt-form__actions">
                                        <div class="row">
                                            <div class="col-2">
                                            </div>
                                            <div class="col-10">
                                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="<%$ Resources:DefaultResource, Insert%>" CssClass="btn btn-success" />
                                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="<%$ Resources:DefaultResource, Cancel%>" CssClass="btn btn-secondary" />
                                            </div>
                                        </div>
                                    </div>
                                </div>--%>
                                </div>
                        </div>
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr >
                    <td>
                        <asp:Label ID="GEIDLabel" runat="server" Text='<%# Eval("BRANCHCODE") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("BRANCHNAME") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TitleArLabel" runat="server" Text='<%# Eval("TelPhone") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TotalContractsLabel" runat="server" Text='<%# Eval("Address") %>' />
                    </td>
                  
                  <%--  <td>
                        <asp:Label ID="CreatorLabel" runat="server" Text='<%# Eval("Creator") %>' />
                    </td>
                    <td>
                        <asp:Label ID="UpdaterLabel" runat="server" Text='<%# Eval("Updater") %>' />
                    </td>--%>
                   <td class="text-center block-options">
                       <%-- <a href="ApplicantsDocs.aspx?ApplicantID=<%# Eval("ApplicantID") %>" class="btn btn-sm btn-info" data-original-title=""  data-toggle="tooltip" title="">--%>
                            <%-- <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, UserDocuments%>" /> --%>
                         
                               <%-- <a href="ApplicantsDocs.aspx?ApplicantID=<%# Eval("ApplicantID")%>" id="A5" runat="server" class="btn btn-sm btn-info" data-toggle="tooltip"
                                aria-haspopup="true" aria-expanded="true" data-original-title="<%$ Resources:DefaultResource, UserDocuments%>"  title="<%$ Resources:DefaultResource, UserDocuments%>">--%>
                            
                         
                     

                     
                         <asp:LinkButton ID="EditLinkButton" runat="server" CommandName="Edit" Text="" data-toggle="tooltip" title="<%$ Resources:DefaultResource, Edite%>" CssClass="btn btn-sm btn-default" data-original-title="<%$ Resources:DefaultResource, Edite%>">
                          
                                <i class="fa fa-pencil"></i>
                        </asp:LinkButton>
                         &nbsp 
                      <%--  <% if (Session["RoleID"].ToString() != "7")
                        { %>--%>
                            <asp:LinkButton ID="DeleteLinkButton" runat="server" CommandName="Delete" Text="" data-toggle="tooltip" title="<%$ Resources:DefaultResource, Delete%>" CssClass="btn btn-sm btn-danger" data-original-title="<%$ Resources:DefaultResource, Delete%>"  OnClientClick="javascript:if(!confirm('هل انت متأكد من حذف هذا السجل؟')){return false;}">
                                    <i class="fa fa-times"></i>
                            </asp:LinkButton>

                   <%--     <%}%>--%>
                        

                    </td>
                     
                              
                </tr>

            </ItemTemplate><LayoutTemplate>
                <table id="general-table" class="table table-striped table-vcenter table-bordered table-condensed">
                    <thead >
                        <tr>
                            <th>
                                <asp:LinkButton ID="MagazineTitleLinkButton" runat="server" CommandArgument="BRANCHCODE" CommandName="Sort" Text="<%$ Resources:DefaultResource, code%>" />
                            </th>
                            <th>
                                <asp:LinkButton ID="TitleLinkButton" runat="server" CommandArgument="BRANCHNAME" CommandName="Sort" Text="<%$ Resources:DefaultResource, BranchName%>" />
                            </th>
                            <th>
                                <asp:LinkButton ID="TitleArLinkButton" runat="server" CommandArgument="TelPhone" CommandName="Sort" Text="<%$ Resources:DefaultResource, CardPhone%>" />
                            </th>
                            <th>
                                <asp:LinkButton ID="TotalContractsLinkButton" runat="server" CommandArgument="Address" CommandName="Sort" Text="<%$ Resources:DefaultResource, BranchAddress%>" />
                            </th>
                            

                        <%--    <th>
                                <asp:LinkButton ID="CreatorLinkButton" runat="server" CommandArgument="Creator" CommandName="Sort" Text="<%$ Resources:DefaultResource, Creator%>" />
                            </th>
                            <th>
                                <asp:LinkButton ID="UpdaterLinkButton" runat="server" CommandArgument="Creator" CommandName="Sort" Text="<%$ Resources:DefaultResource, Updater%>" />
                            </th>--%>
                            <th>
                                <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, Actions%>" /></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr id="itemPlaceholder" runat="server">
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="11">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="50">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" NextPageText="<%$ Resources:DefaultResource, Next%>" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" PreviousPageText="<%$ Resources:DefaultResource, Pervious%>" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </LayoutTemplate>
        </asp:ListView>
                            
        <asp:ObjectDataSource ID="BranchesDS" runat="server"  SelectMethod="GetDataByOrgId" TypeName="NEWERPDataSetTableAdapters.BRANCHESTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update"><DeleteParameters><asp:Parameter Name="Original_BRANCHCODE" Type="Int64" /></DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="BRANCHNAME" Type="String" /><asp:Parameter Name="CompanyName" Type="String" /><asp:Parameter Name="Address" Type="String" /><asp:Parameter Name="TelPhone" Type="String" /><asp:Parameter Name="HintName" Type="String" /><asp:Parameter Name="SalInvSerial" Type="Int64" /><asp:Parameter Name="PurchInvSerial" Type="Int64" /><asp:Parameter Name="InvOrderSerial" Type="Int64" /><asp:Parameter Name="OrderSerial" Type="Int64" /><asp:Parameter Name="MovementSerial" Type="Int64" /><asp:Parameter Name="salesaccid" Type="Int16" /><asp:Parameter Name="purchaseaccid" Type="Int16" /><asp:Parameter Name="boxaccid" Type="Int64" /><asp:Parameter Name="bankaccid" Type="Int64" /><asp:Parameter Name="Visaaccid" Type="Int64" /><asp:Parameter Name="Masteraccid" Type="Int64" /><asp:Parameter Name="KeyNetaccid" Type="Int64" /><asp:Parameter Name="Otheraccid" Type="Int64" /><asp:Parameter Name="VisaComaccid" Type="Int64" /><asp:Parameter Name="MasterComaccid" Type="Int64" /><asp:Parameter Name="KeyNetComaccid" Type="Int64" /><asp:Parameter Name="OtherComaccid" Type="Int64" /><asp:Parameter Name="salesAgalaccid" Type="Int64" /><asp:Parameter Name="purchaseAgalaaccid" Type="Int64" /><asp:Parameter Name="OwnerName" Type="String" /><asp:Parameter Name="OwnerNat" Type="String" /><asp:Parameter Name="BlockNo" Type="String" /><asp:Parameter Name="Area" Type="String" /><asp:Parameter Name="GovId" Type="Int32" /><asp:Parameter Name="Gada" Type="String" /><asp:Parameter Name="HouseType" Type="String" /><asp:Parameter Name="Floor" Type="String" /><asp:Parameter Name="FlatNo" Type="String" /><asp:Parameter Name="Street" Type="String" /><asp:Parameter Name="MailSign" Type="String" /><asp:Parameter Name="MailBox" Type="String" /><asp:Parameter Name="SignatureOwner" Type="String" /><asp:Parameter Name="FileNo" Type="String" /><asp:Parameter Name="CommerName" Type="String" /><asp:Parameter Name="CommerRecord" Type="String" /><asp:Parameter Name="CivilId" Type="String" /><asp:Parameter Name="uinNum" Type="String" /><asp:Parameter Name="ActivityEng" Type="String" /><asp:Parameter Name="CompanyNameEng" Type="String" /><asp:Parameter Name="SignatureOwnerEng" Type="String" /><asp:Parameter Name="ContractNo" Type="String" /><asp:Parameter Name="LawNo" Type="String" /><asp:Parameter Name="Email" Type="String" /><asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" /><asp:Parameter Name="DiscountValue" Type="Decimal" /></InsertParameters>
            <SelectParameters><asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" /></SelectParameters><UpdateParameters><asp:Parameter Name="BRANCHNAME" Type="String" /><asp:Parameter Name="CompanyName" Type="String" /><asp:Parameter Name="Address" Type="String" /><asp:Parameter Name="TelPhone" Type="String" /><asp:Parameter Name="HintName" Type="String" /><asp:Parameter Name="SalInvSerial" Type="Int64" /><asp:Parameter Name="PurchInvSerial" Type="Int64" /><asp:Parameter Name="InvOrderSerial" Type="Int64" /><asp:Parameter Name="OrderSerial" Type="Int64" /><asp:Parameter Name="MovementSerial" Type="Int64" /><asp:Parameter Name="salesaccid" Type="Int16" /><asp:Parameter Name="purchaseaccid" Type="Int16" /><asp:Parameter Name="boxaccid" Type="Int64" /><asp:Parameter Name="bankaccid" Type="Int64" /><asp:Parameter Name="Visaaccid" Type="Int64" /><asp:Parameter Name="Masteraccid" Type="Int64" /><asp:Parameter Name="KeyNetaccid" Type="Int64" /><asp:Parameter Name="Otheraccid" Type="Int64" /><asp:Parameter Name="VisaComaccid" Type="Int64" /><asp:Parameter Name="MasterComaccid" Type="Int64" /><asp:Parameter Name="KeyNetComaccid" Type="Int64" /><asp:Parameter Name="OtherComaccid" Type="Int64" /><asp:Parameter Name="salesAgalaccid" Type="Int64" /><asp:Parameter Name="purchaseAgalaaccid" Type="Int64" /><asp:Parameter Name="OwnerName" Type="String" /><asp:Parameter Name="OwnerNat" Type="String" /><asp:Parameter Name="BlockNo" Type="String" /><asp:Parameter Name="Area" Type="String" /><asp:Parameter Name="GovId" Type="Int32" /><asp:Parameter Name="Gada" Type="String" /><asp:Parameter Name="HouseType" Type="String" /><asp:Parameter Name="Floor" Type="String" /><asp:Parameter Name="FlatNo" Type="String" /><asp:Parameter Name="Street" Type="String" /><asp:Parameter Name="MailSign" Type="String" /><asp:Parameter Name="MailBox" Type="String" /><asp:Parameter Name="SignatureOwner" Type="String" /><asp:Parameter Name="FileNo" Type="String" /><asp:Parameter Name="CommerName" Type="String" /><asp:Parameter Name="CommerRecord" Type="String" /><asp:Parameter Name="CivilId" Type="String" /><asp:Parameter Name="uinNum" Type="String" /><asp:Parameter Name="ActivityEng" Type="String" /><asp:Parameter Name="CompanyNameEng" Type="String" /><asp:Parameter Name="SignatureOwnerEng" Type="String" /><asp:Parameter Name="ContractNo" Type="String" /><asp:Parameter Name="LawNo" Type="String" /><asp:Parameter Name="Email" Type="String" />
            <asp:SessionParameter Name="OrgId" SessionField="orgId" Type="Int64" />
            <asp:Parameter Name="DiscountValue" Type="Decimal" /><asp:Parameter Name="Original_BRANCHCODE" Type="Int64" /></UpdateParameters></asp:ObjectDataSource>

    <asp:TextBox ID="txtOrgId" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1"></asp:TextBox>

    </div>

</div>