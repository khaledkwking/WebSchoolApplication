<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMainPageMaster.Master" AutoEventWireup="true" CodeBehind="SystemPagesAssignment.aspx.cs" Inherits="ProjectsManagements.SystemPagesAssignment" %>

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
    <li> <%= Resources.DefaultResource.SystemPagesAssignment %> </li>
</ul>
  <div class="block table-responsive">
    <!-- Table Styles Title -->
    <div class="block-title">
        <h2><strong><%= Resources.DefaultResource.List%>  </strong> <%= Resources.DefaultResource.SystemPagesAssignment%> </h2>
        <div class="block-options pull-right">
            <%--<asp:LinkButton ID="NewRecord" runat="server" CssClass="btn btn-sm btn-success" data-toggle="tooltip" title="<%$ Resources:DefaultResource, NewRecord%>"  data-original-title="<%$ Resources:DefaultResource, NewRecord%>" OnClick="SaveRecords_Click"> 
                <i class="fa fa-file"></i>--%>

            <%--</asp:LinkButton>--%>
            <%--   <asp:Button ID="UpdateButton" runat="server" Text="<%$ Resources:DefaultResource, Save%>" CssClass="btn btn-sm btn-primary"
                   title="<%$ Resources:DefaultResource, Save%>"  data-original-title="<%$ Resources:DefaultResource, Save%>" OnClick="SaveRecords_Click"
                   ValidationGroup="DML" />--%>
        </div>
        <%--<button type="button" class="btn btn-sm btn-success" id="Addbtn" name="Addbtn">
            Add
         </button>--%>
    </div>


 <div class="gallery gallery-widget" data-toggle="lightbox-gallery">
               
       <!-- General Data Block -->  

        <div class="input-group">
            <asp:TextBox ID="SearchTextBox" runat="server" CssClass="form-control" placeholder="<%$ Resources:DefaultResource, Search%>"></asp:TextBox>

            <span class="input-group-btn">
                
                <asp:LinkButton ID="LinkButton3" runat="server" CssClass="btn btn-sm btn-danger" OnClick="ClearLinkButton_Click"> <i class="hi hi-remove"></i><%= Resources.DefaultResource.ClearSearch%></asp:LinkButton>
               
                <asp:LinkButton ID="SaveRecordsLinkButton" runat="server" CssClass="btn btn-sm btn-primary" OnClick="SearchLinkButton_Click"> <i class="fa fa-search"></i><%= Resources.DefaultResource.SearchTitle%></asp:LinkButton>

                 <asp:LinkButton ID="LinkButtonSave" runat="server" CssClass="btn btn-sm btn-success" data-toggle="tooltip"
                            title="<%$ Resources:DefaultResource, SaveChanges%>" data-original-title="<%$ Resources:DefaultResource, SaveChanges%>" OnClick="SaveRecords_Click">
                        <i class="fa fa-save"></i>
                        <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, SaveChanges%>" />
                        </asp:LinkButton></span></div><br />
     <div id="ErrorDiv" runat="server"></div> 
            <!--begin: Datatable -->
            <asp:ListView runat="server" ID="lv" DataKeyNames="UserID,PageID" DataSourceID="ODS" InsertItemPosition="None" OnItemCommand="lv_ItemCommand">
                <EmptyDataTemplate>
                        <table runat="server" style="">
                        <tr>
                            <td><%= Resources.DefaultResource.DataNotFound %></td></tr>

                        </table>
                </EmptyDataTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:Label ID="PageIDLabel" runat="server" Text='<%# Eval("PageID") %>'></asp:Label></td><td>
                            <%# Session["SiteLanguage"].ToString() == "EnglishTheme" ? Eval("PageName") : Eval("PageNameAr") %>
                        </td>
                        <td>
                            <%# Eval("PageLink") %>
                        </td>
                        <td>
                            
                            <div class="col-md-6">
                            <label class="switch switch-success">

                                <asp:CheckBox ID="AccessingCheckBox" runat="server" Checked='<%# Bind("Accessing") %>' /><span></span>
                            </label>
                            </div>
                       
                        </td>
                        <td>
                            <div class="col-md-6">
                            <label class="switch switch-success">

                                <asp:CheckBox ID="AddingCheckBox" runat="server" Checked='<%# Bind("Adding") %>' /><span></span>
                            </label>
                            </div>
                     
                        </td>
                        <td>
                             <div class="col-md-6">
                            <label class="switch switch-success">

                                <asp:CheckBox ID="UpdatingCheckBox" runat="server" Checked='<%# Bind("Updating") %>' /><span></span>
                            </label>
                            </div>
                         
                        </td>
                         <td>
                              <div class="col-md-6">
                            <label class="switch switch-success">

                                <asp:CheckBox ID="DeletingCheckBox" runat="server" Checked='<%# Bind("Deleting") %>' /><span></span>
                            </label>
                            </div>
                           
                        </td>
                        <td>
                                <div class="col-md-6">
                            <label class="switch switch-success">

                                <asp:CheckBox ID="ImportingCheckBox" runat="server" Checked='<%# Bind("Importing") %>' /><span></span>
                            </label>
                            </div>
                           
                        </td>
                        <td><%# Eval("UpdateOn","{0:dd/MMM/yyy}") %></td>

                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table class="table table-striped table-bordered table-hover table-checkable">
                        <thead class="thead-dark">
                            <tr>
                                <th>
                                    <asp:LinkButton ID="PageIDLinkButton" runat="server" CommandArgument="PageID" CommandName="Sort" Text="<%$ Resources:DefaultResource, PageID%>" />
                                </th>
                                <th>
                                    <asp:LinkButton ID="PageNameLinkButton" runat="server" CommandArgument="PageName" CommandName="Sort" Text="<%$ Resources:DefaultResource, PageName%>" />
                                </th>
                                <th>
                                    <asp:LinkButton ID="PageLinkLinkButton" runat="server" CommandArgument="PageLink" CommandName="Sort" Text="<%$ Resources:DefaultResource, PageLink%>" />
                                </th>
                            
                                <th>
                                    <asp:LinkButton ID="AccessingLinkButton" runat="server" CommandName="AccessBtn"  Text="<%$ Resources:DefaultResource, Accessing%>" />
                                </th>
                                <th>
                                    <asp:LinkButton ID="AddingLinkButton" runat="server" CommandName="AddingBtn"  Text="<%$ Resources:DefaultResource, Adding%>" />
                                </th>
                                <th>
                                    <asp:LinkButton ID="UpdatingLinkButton" runat="server" CommandName="UpdatingBtn"  Text="<%$ Resources:DefaultResource, Updating%>" />
                                </th>
                                <th>
                                    <asp:LinkButton ID="DeletingLinkButton" runat="server" CommandName="DeletingBtn" Text="<%$ Resources:DefaultResource, Deleting%>" />
                                </th>
                                <th>
                                    <asp:LinkButton ID="ImportingLinkButton" runat="server" CommandName="ImportingBtn"  Text="<%$ Resources:DefaultResource, Importing%>" />
                                </th>
                                <th>
                                    <asp:LinkButton ID="UpdatedOnButton" runat="server" CommandArgument="UpdateOn" CommandName="Sort" Text="<%$ Resources:DefaultResource, UpdatedOn%>" />
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </tbody>
                    </table>
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="ODS" runat="server"
                OldValuesParameterFormatString="{0}" SelectMethod="Read" TypeName="BOL.UsersPages">
                <SelectParameters>
                    <asp:Parameter Name="ActionCode" Type="String" />
                    <asp:QueryStringParameter Name="UserID" QueryStringField="ID" Type="Int32" />
                    <asp:Parameter Name="PageID" Type="Int32" />
                    <asp:Parameter Name="SearchText" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <!--end: Datatable -->
        </div>
    </div>


</asp:Content>

