<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Inventory.ascx.cs" Inherits="WebSchool.Controls.Account.Inventory" %>

<%--<div class="content-header">
    <div class="header-section">
        <h1>
            <i class="gi gi-user"></i><%= Resources.DefaultResource.Inventory%> 
        </h1>
    </div>
</div>--%>
<ul class="breadcrumb breadcrumb-top">
    <li><a href="default.aspx"><%= Resources.DefaultResource.Main%> </a></li>
    <li> <%= Resources.DefaultResource.Inventory%> </li>
</ul>


<div class="block table-responsive-lg">
    <!-- Table Styles Title -->
    <div class="block-title">
        <h2><strong><%= Resources.DefaultResource.List%>  </strong> <%= Resources.DefaultResource.Inventory%> </h2>
        <div class="block-options pull-right">
            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-sm btn-success" data-toggle="tooltip" title="<%$ Resources:DefaultResource, NewRecord%>"  data-original-title="<%$ Resources:DefaultResource, NewRecord%>" OnClick="NewRecord_Click">
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
         
                    
        <asp:ListView ID="lv" runat="server" DataKeyNames="STOREID" DataSourceID="GEODS" InsertItemPosition="none" OnItemCommand="lv_ItemCommand" OnItemDataBound="lv_ItemDataBound">
            <EditItemTemplate>
                <tr style="">
                    <td colspan="8">
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
                          
                               
                                   
                                     <div class="form-group">
                                        <label for="TitleArTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="TitleArLiteral1" runat="server" Text="<%$ Resources:DefaultResource, code%>" />
                                        </label>
                                         <div class="col-sm-10 col-xs-10 col-10">
                                            <asp:TextBox ID="TitleArTextBox" runat="server"  CssClass="form-control" Text='<%# Bind("STORECODE") %>' />
                                            <asp:RequiredFieldValidator ID="TitleArTextBoxRFV" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="TitleArTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator>

                                         </div>

                                     </div>
                                    <div class="form-group row">
                                        <label for="TitleArTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:DefaultResource, InventoryName%>" />
                                        </label>
                                         <div class="col-sm-10 col-xs-10 col-10">
                                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text='<%# Bind("STORNAME") %>' />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="TitleArTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator>

                                         </div>


                                    </div>
                                    
                                    <div class="form-group row">
                                     <label for="ProjectIDDropDownList" class="col-md-2 control-label">
                                            <asp:Literal ID="ProjectIDLiteral1" runat="server" Text="<%$ Resources:DefaultResource, BranchName%>" />
                                        </label>
                                        <div class="col-sm-10 col-xs-10 col-10">
                                            <asp:DropDownList ID="BranchIdDropDownList" runat="server" CssClass="form-control"
                                                AppendDataBoundItems="True" DataSourceID="Branches" DataTextField="BRANCHNAME" DataValueField="BRANCHCODE" Text='<%# Bind("BRANCHCODE") %>'>
                                                <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0" />
                                            </asp:DropDownList>
                                            
                                        </div>
                                       </div>

                                     
                                   
                             


                                 <div class="form-group form-actions">
                                        <div class="col-md-9 col-md-offset-3">
                                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="<%$ Resources:DefaultResource, Save%>" CssClass="btn btn-sm btn-primary" ValidationGroup="DML" />
                                            <asp:Button ID="Button1" runat="server" CommandName="Cancel" Text="<%$ Resources:DefaultResource, Cancel%>" CssClass="btn btn-sm btn-warning" />
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
                <tr style="">
                    <td colspan="8">
                        

                            <!--begin::Form-->
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
                                    
                                    <div class="form-group row">
                                        <label for="TitleArTextBox" class="col-md-2 col-form-label">
                                            <asp:Literal ID="TitleArLiteral1" runat="server" Text="<%$ Resources:DefaultResource, code%>" />
                                        </label>
                                         <div class="col-sm-10 col-xs-10 col-10">
                                            <asp:TextBox ID="TitleArTextBox" runat="server" CssClass="form-control" Text='<%# Bind("STORECODE") %>' />
                                            <asp:RequiredFieldValidator ID="TitleArTextBoxRFV" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="TitleArTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator>

                                         </div>

                                    </div>
                                    <div class="form-group row">
                                        <label for="TitleArTextBox" class="col-md-2 col-form-label">
                                            <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:DefaultResource, InventoryName%>" />
                                        </label>
                                         <div class="col-sm-10 col-xs-10 col-10">
                                            <asp:TextBox ID="STORNAMETextBox" runat="server" CssClass="form-control" Text='<%# Bind("STORNAME") %>' />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="STORNAMETextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator></div></div>
                                    <div class="form-group row">
                                     <label for="ProjectIDDropDownList" class="col-md-2 col-form-label">
                                            <asp:Literal ID="ProjectIDLiteral1" runat="server" Text="<%$ Resources:DefaultResource, BranchName%>" />
                                        </label>
                                        <div class="col-sm-10 col-xs-10 col-10">
                                            <asp:DropDownList ID="BranchIdDropDownList" runat="server" CssClass="form-control"
                                                AppendDataBoundItems="True" DataSourceID="Branches" DataTextField="BRANCHNAME" DataValueField="BRANCHCODE" Text='<%# Bind("BRANCHCODE") %>'>
                                                <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0" />
                                            </asp:DropDownList>
                                            </label>
                                        </div>
                                       </div>

                                    
                                    
                  <div class="form-group form-actions">
                                        <div class="col-md-12 col-md-offset-3">
                                            <asp:Button ID="UpdateButton" runat="server" CommandName="Insert" Text="<%$ Resources:DefaultResource, Update%>" CssClass="btn btn-sm btn-primary" ValidationGroup="DML" />
                                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="<%$ Resources:DefaultResource, Cancel%>" CssClass="btn btn-sm btn-warning" />
                                        </div>
                                    </div>
                                </div>
                        </div>
                        </div>
                       
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="GEIDLabel" runat="server" Text='<%# Eval("STOREID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("STORECODE") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TitleArLabel" runat="server" Text='<%# Eval("STORNAME") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TotalContractsLabel" runat="server" Text='<%# Eval("BRANCHCODE") %>' />
                    </td>
                  
                  <%--  <td>
                        <asp:Label ID="CreatorLabel" runat="server" Text='<%# Eval("Creator") %>' />
                    </td>
                    <td>
                        <asp:Label ID="UpdaterLabel" runat="server" Text='<%# Eval("Updater") %>' />
                    </td>--%>
                   <%--       <td class="text-center block-options">
                           <asp:LinkButton ID="EditLinkButton" runat="server" CommandName="Edit" data-toggle="kt-tooltip"
                            title="<%$ Resources:DefaultResource, Edite%>" CssClass="btn btn-sm btn-pill btn-icon btn-outline-primary btn-icon-md"
                            data-original-title="<%$ Resources:DefaultResource, Edite%>">
                                <i class="fa fa-edit"></i>
                        </asp:LinkButton>&nbsp <asp:LinkButton ID="DeleteLinkButton" runat="server" CommandName="Delete" data-toggle="kt-tooltip"
                            title="<%$ Resources:DefaultResource, Delete%>" CssClass="btn btn-pill btn-outline-danger btn-sm btn-icon" data-original-title="<%$ Resources:DefaultResource, Delete%>"
                            OnClientClick="javascript:if(!confirm('This action will delete the record and all related Records!')){return false;}">
                                <i class="la la-close"></i>
                        </asp:LinkButton>&nbsp--%>

                      <td class="text-center block-options">
                                <asp:LinkButton ID="EditLinkButton" runat="server" CommandName="Edit" Text="" data-toggle="tooltip" title="<%$ Resources:DefaultResource, Edite%>" CssClass="btn btn-sm btn-default" data-original-title="<%$ Resources:DefaultResource, Edite%>">
                          
                                <i class="fa fa-pencil"></i>
                        </asp:LinkButton>
                         &nbsp 
                     
                            <asp:LinkButton ID="Delete" runat="server" CommandName="Delete" Text="" data-toggle="tooltip" title="<%$ Resources:DefaultResource, Delete%>" CssClass="btn btn-sm btn-danger" data-original-title="<%$ Resources:DefaultResource, Delete%>"  OnClientClick="javascript:if(!confirm('هل انت متأكد من حذف هذا السجل؟')){return false;}">
                                    <i class="fa fa-times"></i>
                            </asp:LinkButton>

              
                        


                          </td></tr>

            </ItemTemplate><LayoutTemplate>
                <table class="table table-striped table-bordered table-hover table-checkable">
                    <thead class="thead-dark">
                        <tr>
                            <th>
                                <asp:LinkButton ID="MagazineTitleLinkButton" runat="server" CommandArgument="STOREID" CommandName="Sort" Text="<%$ Resources:DefaultResource, No%>" />
                            </th>
                            <th>
                                <asp:LinkButton ID="TitleLinkButton" runat="server" CommandArgument="STORECODE" CommandName="Sort" Text="<%$ Resources:DefaultResource, Code%>" />
                            </th>
                            <th>
                                <asp:LinkButton ID="TitleArLinkButton" runat="server" CommandArgument="STORNAME" CommandName="Sort" Text="<%$ Resources:DefaultResource, InventoryName%>" />
                            </th>
                            <th>
                                <asp:LinkButton ID="TotalContractsLinkButton" runat="server" CommandArgument="BRANCHCODE" CommandName="Sort" Text="<%$ Resources:DefaultResource, BranchName%>" />
                            </th>
                            

                        <%--    <th>
                                <asp:LinkButton ID="CreatorLinkButton" runat="server" CommandArgument="Creator" CommandName="Sort" Text="<%$ Resources:DefaultResource, Creator%>" />
                            </th>
                            <th>
                                <asp:LinkButton ID="UpdaterLinkButton" runat="server" CommandArgument="Creator" CommandName="Sort" Text="<%$ Resources:DefaultResource, Updater%>" />
                            </th>--%>
                            <th class="text-center">
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
                                
                                 </div>
                            </div>
             
        <asp:ObjectDataSource ID="GEODS" runat="server"  SelectMethod="GetData" TypeName="NEWERPDataSetTableAdapters.STORESTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update"><DeleteParameters><asp:Parameter Name="STOREID" Type="Int64" /></DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="STORECODE" Type="String" /><asp:Parameter Name="STORNAME" Type="String" /><asp:Parameter Name="BRANCHCODE" Type="Int64" /><asp:Parameter Name="Notes" Type="String" /></InsertParameters>
            <UpdateParameters><asp:Parameter Name="STORECODE" Type="String" /><asp:Parameter Name="STORNAME" Type="String" /><asp:Parameter Name="BRANCHCODE" Type="Int64" /><asp:Parameter Name="Notes" Type="String" /><asp:Parameter Name="Original_STOREID" Type="Int64" /></UpdateParameters></asp:ObjectDataSource>

    <asp:TextBox ID="txtOrgId" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1"></asp:TextBox><asp:ObjectDataSource ID="Branches" runat="server" OldValuesParameterFormatString="original_{0}"  SelectMethod="GetData" TypeName="NEWERPDataSetTableAdapters.BRANCHESTableAdapter"></asp:ObjectDataSource>

