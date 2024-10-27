<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMainPageMaster.Master" AutoEventWireup="true" CodeBehind="UsersList.aspx.cs" Inherits="ProjectsManagements.UsersList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <%--  <link href="assets/vendors/custom/datatables/datatables.bundle.css" rel="stylesheet" type="text/css" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="content-header">
    <%-- <div class="header-section">
        <h1>
            <i class="gi gi-user"></i> <%= Resources.DefaultResource.Main%>
        </h1>
    </div>--%>
</div>
<ul class="breadcrumb breadcrumb-top">
    <li><a href="Main.aspx"><%= Resources.DefaultResource.Main%> </a></li>
    <li> <%= Resources.DefaultResource.UsersList %> </li>
</ul>
    <div class="block table-responsive">
    <!-- Table Styles Title -->
    <div class="block-title">
        <h2><strong><%= Resources.DefaultResource.List%>  </strong> <%= Resources.DefaultResource.UsersList%> </h2>
        <div class="block-options pull-right">
            <asp:LinkButton ID="NewRecord" runat="server" CssClass="btn btn-sm btn-success" data-toggle="tooltip" title="<%$ Resources:DefaultResource, NewRecord%>"  data-original-title="<%$ Resources:DefaultResource, NewRecord%>" OnClick="NewRecord_Click"> <i class="fa fa-file"></i></asp:LinkButton>
        </div>
        <%--<button type="button" class="btn btn-sm btn-success" id="Addbtn" name="Addbtn">
            Add
         </button>--%>
    </div>
    <!-- END Table Styles Title -->
    
    <div class="gallery gallery-widget" data-toggle="lightbox-gallery">
               
       <!-- General Data Block -->  

        <div class="input-group">
            <asp:TextBox ID="SearchTextBox" runat="server" CssClass="form-control" placeholder="<%$ Resources:DefaultResource, Search%>"></asp:TextBox>

            <span class="input-group-btn">
                
                <asp:LinkButton ID="LinkButton3" runat="server" CssClass="btn btn-sm btn-danger" OnClick="ClearLinkButton_Click"> <i class="hi hi-remove"></i><%= Resources.DefaultResource.ClearSearch%></asp:LinkButton>
               
                <asp:LinkButton ID="LinkButton5" runat="server" CssClass="btn btn-sm btn-primary" OnClick="SearchLinkButton_Click"> <i class="fa fa-search"></i><%= Resources.DefaultResource.SearchTitle%></asp:LinkButton>

            </span>
        </div>

  
        <br />
       
                <div id="ErrorDiv" runat="server"></div> 
        
              <asp:ListView runat="server" ID="lv" DataKeyNames="ID" DataSourceID="ODS" InsertItemPosition="None" OnItemCommand="lv_ItemCommand" OnItemDataBound="lv_ItemDataBound">
                  
              <EditItemTemplate>
                <tr>
                    <td colspan="11">
                       
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
                                    <div class="form-group">
                                        <label for="ProjectNameTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="TitleArLiteral1" runat="server" Text="<%$ Resources:DefaultResource, FULLNAME%>" />
                                        </label>
                                         <div class="col-sm-10 col-xs-10 col-10">
                                            <asp:TextBox ID="NameTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Name") %>' />
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidatorContractName" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                        ControlToValidate="NameTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                    </asp:RequiredFieldValidator>

                                        </div>

                                     </div> 
                                    <div class="form-group">
                                        <label for="ContractNumberLiteral" class="col-md-2 control-label">
                                            <asp:Literal ID="ContractNumberLiteral" runat="server" Text="<%$ Resources:DefaultResource, UserName%>" />
                                        </label>
                                        <div class="col-sm-4 col-xs-4 col-4" >
                                            <asp:TextBox ID="UserNameTextBox" runat="server" CssClass="form-control" Text='<%# Bind("USER_NAME") %>' />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                        ControlToValidate="UserNameTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                    </asp:RequiredFieldValidator></div><label for="DataDateTextBox" class="col-md-2 control-label"><asp:Literal ID="Literal8" runat="server" Text="<%$ Resources:DefaultResource, Password%>" />
                                        </label>
                                       <div class="col-sm-4 col-xs-4 col-4">
                                            <asp:TextBox ID="PasswordTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Password") %>'  />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                        ControlToValidate="PasswordTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                    </asp:RequiredFieldValidator></div></div>
                                 <div class="form-group">
                     
                                       <label class="col-md-2 control-label" for="example-text-input"><%= Resources.DefaultResource.Active%></label>
                                          <div class="col-md-6">
                                            <label class="switch switch-success">

                                                <asp:CheckBox ID="AttFlagCheckBox" runat="server" Checked='<%# Bind("IsActive") %>' /><span></span>
                                            </label>
                                        </div>
                                      </div>
                                      <div class="form-group">
                                            <label for="RoledropDownList" class="col-md-2 control-label">
                                                <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:DefaultResource, UserRoles%>" />
                                            </label>
                                            <div class="col-sm-10 col-xs-10 col-10">
                                             <asp:DropDownList ID="RoledropDownList" runat="server" CssClass="form-control" Text='<%# Bind("USER_TYPE") %>'
                                     AppendDataBoundItems="true" DataSourceID="UsersRolesODS" DataTextField="RoleName" DataValueField="RoleID">
                                                <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0">

                                                </asp:ListItem></asp:DropDownList></div></div>

                              

                          
                              
                                   <div class="form-group form-actions">
                                        <div class="col-md-9 col-md-offset-3">
                                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="<%$ Resources:DefaultResource,Update%>" CssClass="btn btn-sm btn-primary" ValidationGroup="DML" />
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
                            <td><%= Resources.DefaultResource.DataNotFound %></td></tr></table>

                </EmptyDataTemplate>
                  <InsertItemTemplate>
                   
               <tr>
                    <td colspan="11">
                        <div class="col-md-12">
                            <!-- Basic Form Elements Block -->
                            <div class="block">
                                <!-- Basic Form Elements Title -->
                                <div class="block-title">
                                    <h2><strong><%= Resources.DefaultResource.List %></strong> <%= Resources.DefaultResource.SchoolStages %></h2>
                                </div>
                                <!-- END Form Elements Title -->
                                <!-- Basic Form Elements Content -->
                                <div class="form-horizontal form-bordered">
                                     <div class="form-group">
                                        <label for="ProjectNameTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="TitleArLiteral1" runat="server" Text="<%$ Resources:DefaultResource, FULLNAME%>" />
                                        </label>
                                         <div class="col-sm-10 col-xs-10 col-10">
                                            <asp:TextBox ID="NameTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Name") %>' />
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidatorContractName" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                        ControlToValidate="NameTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                    </asp:RequiredFieldValidator>

                                        </div>

                                     </div> 
                                    <div class="form-group">
                                        <label for="ContractNumberLiteral" class="col-md-2 control-label">
                                            <asp:Literal ID="ContractNumberLiteral" runat="server" Text="<%$ Resources:DefaultResource, UserName%>" />
                                        </label>
                                        <div class="col-sm-4 col-xs-4 col-4" >
                                            <asp:TextBox ID="UserNameTextBox" runat="server" CssClass="form-control" Text='<%# Bind("USER_NAME") %>' />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                        ControlToValidate="UserNameTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                    </asp:RequiredFieldValidator></div><label for="DataDateTextBox" class="col-md-2 control-label"><asp:Literal ID="Literal8" runat="server" Text="<%$ Resources:DefaultResource, Password%>" />
                                        </label>
                                       <div class="col-sm-4 col-xs-4 col-4">
                                            <asp:TextBox ID="PasswordTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Password") %>'  />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                        ControlToValidate="PasswordTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                    </asp:RequiredFieldValidator></div></div>
                                 <div class="form-group">
                     
                                       <label class="col-md-2 control-label" for="example-text-input"><%= Resources.DefaultResource.Active%></label>
                                          <div class="col-md-6">
                                            <label class="switch switch-success">

                                                <asp:CheckBox ID="AttFlagCheckBox" runat="server" Checked='<%# Bind("IsActive") %>' /><span></span>
                                            </label>
                                        </div>
                                      </div>
                                      <div class="form-group">
                                            <label for="RoledropDownList" class="col-md-2 control-label">
                                                <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:DefaultResource, UserRoles%>" />
                                            </label>
                                            <div class="col-sm-10 col-xs-10 col-10">
                                             <asp:DropDownList ID="RoledropDownList" runat="server" CssClass="form-control" Text='<%# Bind("USER_TYPE") %>'
                                     AppendDataBoundItems="true" DataSourceID="UsersRolesODS" DataTextField="RoleName" DataValueField="RoleID">
                                                <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0">

                                                </asp:ListItem></asp:DropDownList></div></div>

                                 <div class="form-group form-actions">
                                        <div class="col-md-9 col-md-offset-3">
                                            <asp:Button ID="UpdateButton" runat="server" CommandName="Insert" Text="<%$ Resources:DefaultResource, Save%>" CssClass="btn btn-sm btn-primary" ValidationGroup="DML" />
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
                    <tr>
                       
                          <td>
                        <asp:Label ID="GEIDLabel" runat="server" Text='<%# Eval("ID") %>' />
                             </td>
                           
                    
                        <td>
                             <asp:Label ID="LabelName" runat="server" Text='<%# Eval("Name") %>' />
                           
                        </td>
                      
                        <td>
                             <asp:Label ID="LabelUSER_NAME" runat="server" Text='<%# Eval("USER_NAME") %>' />
                           
                        </td>
                       <td>
                         
                            <asp:Label ID="Label3" runat="server" Text='<%# String.Format(new System.Globalization.CultureInfo("ar-KW"), "{0: dd/MMM/yyyy}", Eval("UpdateOn")) %>'/>
                       </td>

                        <td class="text-center block-options">
                            
                          
                             
                            
                      <%--      <asp:LinkButton ID="EditLinkButton" runat="server" CommandName="Edit" data-toggle="kt-tooltip"
                            title="<%$ Resources:DefaultResource, Edite%>" CssClass="btn btn-sm btn-pill btn-icon btn-outline-primary btn-icon-md"
                            data-original-title="<%$ Resources:DefaultResource, Edite%>">
                                <i class="fa fa-edit"></i>
                        </asp:LinkButton>--%>
                              <asp:LinkButton ID="EditLinkButton" runat="server" CommandName="Edit" Text="" data-toggle="tooltip" title="<%$ Resources:DefaultResource, Edite%>" CssClass="btn btn-sm btn-default" data-original-title="<%$ Resources:DefaultResource, Edite%>">
                          
                                <i class="fa fa-pencil"></i>
                        </asp:LinkButton>

                            <asp:LinkButton ID="DeleteLinkButton" runat="server" CommandName="Delete" Text="" data-toggle="tooltip" title="<%$ Resources:DefaultResource, Delete%>" CssClass="btn btn-sm btn-danger" data-original-title="<%$ Resources:DefaultResource, Delete%>"  OnClientClick="javascript:if(!confirm('هل انت متأكد من حذف هذا السجل؟')){return false;}">
                                    <i class="fa fa-times"></i>
                            </asp:LinkButton>
                              <a href="SystemPagesAssignment.aspx?ID=<%# Eval("ID") %>" data-toggle="tooltip"
                                title="<%= Resources.DefaultResource.SystemPagesAssignment%>" class="btn btn-sm btn-primary">
                                <i class="fa fa-calendar"></i>
                            </a>
                      <%--      <asp:LinkButton ID="LinkButton4" runat="server" CommandName="Delete" data-toggle="kt-tooltip"
                            title="<%$ Resources:DefaultResource, Delete%>" CssClass="btn btn-pill btn-outline-danger btn-sm btn-icon" data-original-title="<%$ Resources:DefaultResource, Delete%>"
                            OnClientClick="javascript:if(!confirm('This action will delete the record and all related Records!')){return false;}">
                                <i class="la la-close"></i>
                        </asp:LinkButton>--%>

                        </td></tr>

                </ItemTemplate>
                  <LayoutTemplate>
                    <table id="general-table" class="table table-striped table-vcenter table-bordered table-condensed">
                    <thead >
                        <tr>
                                <th>
                                    <asp:LinkButton ID="UserIDLinkButton" runat="server" CommandArgument="ID" CommandName="Sort" Text="<%$ Resources:DefaultResource, UserID%>" />
                                </th>
                                <th>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument="Name" CommandName="Sort" Text="<%$ Resources:DefaultResource, FULLNAME%>" />
                                </th>
                             
                                <th>
                                    <asp:LinkButton ID="UserNameLinkButton" runat="server" CommandArgument="USER_NAME" CommandName="Sort" Text="<%$ Resources:DefaultResource, UserName%>" />
                                </th>
                              
                                <th>
                                    <asp:LinkButton ID="UpdatedOnButton" runat="server" CommandArgument="UpdateOn" CommandName="Sort" Text="<%$ Resources:DefaultResource, UpdatedOn%>" />
                                </th>
                                <th>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument="ID" CommandName="Sort" Text="<%$ Resources:DefaultResource, Actions%>" />
                                </th>
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
            <!--end: Datatable -->
    </div>

    <asp:ObjectDataSource ID="ODS" runat="server" InsertMethod="DML" SelectMethod="Read" TypeName="BOL.Users" UpdateMethod="DML" DeleteMethod="DML"><DeleteParameters>
            <asp:Parameter Name="ActionCode" Type="String" DefaultValue="3" /><asp:Parameter Name="ID" Type="Int32" /><asp:Parameter Name="USER_NAME" Type="String" /><asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="STATUS" Type="Int32" /><asp:Parameter Name="USER_TYPE" Type="Int32" /><asp:Parameter Name="MEMBER_ID" Type="String" /><asp:Parameter Name="Branch" Type="Int64" /><asp:Parameter Name="Name" Type="String" /><asp:Parameter Name="BackGround" Type="String" /><asp:Parameter Name="OrgId" Type="Int64" /><asp:Parameter Name="ExpiredFlag" Type="Boolean" /><asp:Parameter Name="SubEndDate" Type="String" /><asp:Parameter Name="IsActive" Type="Boolean" /><asp:Parameter Name="IsDeleted" Type="Boolean" /><asp:Parameter Name="CreatedBy" Type="Int32" DefaultValue="" /><asp:SessionParameter Name="UpdateBy" SessionField="UserId" Type="Int32" /><asp:SessionParameter DefaultValue="" Name="DeletedBy" SessionField="UserId" Type="Int32" /></DeleteParameters><InsertParameters><asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" /><asp:Parameter Name="ID" Type="Int32" /><asp:Parameter Name="USER_NAME" Type="String" /><asp:Parameter Name="Password" Type="String" /><asp:Parameter Name="STATUS" Type="Int32" /><asp:Parameter Name="USER_TYPE" Type="Int32" /><asp:Parameter Name="MEMBER_ID" Type="String" /><asp:Parameter Name="Branch" Type="Int64" /><asp:Parameter Name="Name" Type="String" /><asp:Parameter Name="BackGround" Type="String" /><asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" /><asp:Parameter Name="ExpiredFlag" Type="Boolean" /><asp:Parameter Name="SubEndDate" Type="String" /><asp:Parameter Name="IsActive" Type="Boolean" /><asp:Parameter Name="IsDeleted" Type="Boolean" /><asp:SessionParameter DefaultValue="" Name="CreatedBy" SessionField="UserId" Type="Int32" /><asp:SessionParameter Name="UpdateBy" SessionField="UserId" Type="Int32" /><asp:Parameter Name="DeletedBy" Type="Int32" /></InsertParameters><SelectParameters><asp:Parameter DefaultValue="2" Name="ActionCode" Type="String" /><asp:Parameter Name="UserID" Type="Int32" /><asp:Parameter Name="UserName" Type="String" /><asp:Parameter Name="Password" Type="String" /><asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" /><asp:ControlParameter ControlID="SearchTextBox" DefaultValue="" Name="SearchText" PropertyName="Text" Type="String" /></SelectParameters><UpdateParameters><asp:Parameter DefaultValue="2" Name="ActionCode" Type="String" /><asp:Parameter Name="ID" Type="Int32" /><asp:Parameter Name="USER_NAME" Type="String" /><asp:Parameter Name="Password" Type="String" /><asp:Parameter Name="STATUS" Type="Int32" /><asp:Parameter Name="USER_TYPE" Type="Int32" /><asp:Parameter Name="MEMBER_ID" Type="String" /><asp:Parameter Name="Branch" Type="Int64" /><asp:Parameter Name="Name" Type="String" /><asp:Parameter Name="BackGround" Type="String" /><asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" /><asp:Parameter Name="ExpiredFlag" Type="Boolean" /><asp:Parameter Name="SubEndDate" Type="String" /><asp:Parameter Name="IsActive" Type="Boolean" /><asp:Parameter Name="IsDeleted" Type="Boolean" /><asp:Parameter Name="CreatedBy" Type="Int32" DefaultValue="" /><asp:SessionParameter Name="UpdateBy" SessionField="UserId" Type="Int32" /><asp:Parameter Name="DeletedBy" Type="Int32" DefaultValue="" /></UpdateParameters></asp:ObjectDataSource>
   <asp:ObjectDataSource ID="UsersRolesODS" runat="server" SelectMethod="Read" TypeName="BOL.UserRoles" OldValuesParameterFormatString="original_{0}" DeleteMethod="DML" InsertMethod="DML" UpdateMethod="DML"><DeleteParameters><asp:Parameter Name="ActionCode" Type="String" /><asp:Parameter Name="RoleID" Type="Int32" /><asp:Parameter Name="RoleName" Type="String" /><asp:Parameter Name="RoleNameAr" Type="String" /><asp:Parameter Name="Roledescription" Type="String" /></DeleteParameters><InsertParameters><asp:Parameter Name="ActionCode" Type="String" /><asp:Parameter Name="RoleID" Type="Int32" /><asp:Parameter Name="RoleName" Type="String" /><asp:Parameter Name="RoleNameAr" Type="String" /><asp:Parameter Name="Roledescription" Type="String" /></InsertParameters><SelectParameters><asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" /><asp:Parameter Name="RoleID" Type="Int32" DefaultValue="" /></SelectParameters><UpdateParameters><asp:Parameter Name="ActionCode" Type="String" /><asp:Parameter Name="RoleID" Type="Int32" /><asp:Parameter Name="RoleName" Type="String" /><asp:Parameter Name="RoleNameAr" Type="String" /><asp:Parameter Name="Roledescription" Type="String" /></UpdateParameters></asp:ObjectDataSource>
   
    
</asp:Content>

