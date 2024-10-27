<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Sch_PeriodsList.ascx.cs" Inherits="WebSchool.ADMIN.Controls.School.Sch_PeriodsList" %>

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
    <li> <%= Resources.DefaultResource.SchoolStages%> </li>
</ul>
       
<div class="block">
    <!-- Table Styles Title -->
    <div class="block-title">
        <h2><strong><%= Resources.DefaultResource.List%>  </strong> <%= Resources.DefaultResource.SchoolStages%> </h2>
        <div class="block-options pull-right">
            <asp:LinkButton ID="NewRecord" runat="server" CssClass="btn btn-sm btn-success" data-toggle="tooltip" title="<%$ Resources:DefaultResource, NewRecord%>"  data-original-title="<%$ Resources:DefaultResource, NewRecord%>" OnClick="NewRecord_Click">
                <i class="fa fa-file"></i>
            </asp:LinkButton>
        </div>
    </div>
    <!-- END Table Styles Title -->

    <div class="gallery gallery-widget" data-toggle="lightbox-gallery">
               
       <!-- General Data Block -->                             
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
    <asp:ListView ID="lv" runat="server" DataKeyNames="PeriodId" DataSourceID="PeroidsDS" OnItemCommand="lv_ItemCommand" OnItemDataBound="lv_ItemDataBound">
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
                          
                                     <%--<asp:TextBox ID="TextBoxOrgId" runat="server" CssClass="form-control" Text='<%# Bind("OrgId") %>'  Visible="false"/>--%>
                                    <div class="form-group">
                                        <label for="TitleArTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="TitleArLiteral1" runat="server" Text="<%$ Resources:DefaultResource, code%>" />
                                        </label>
                                        <div class="col-sm-10 col-xs-10 col-10">
                                            <asp:TextBox ID="TitleArTextBox" runat="server" CssClass="form-control" Text='<%# Bind("PeriodName") %>' />
                                            <asp:RequiredFieldValidator ID="TitleArTextBoxRFV" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="TitleArTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator></div>

                                    </div>
                                
                                                                    
                              
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
                        <td><%= Resources.DefaultResource.DataNotFound %></td></tr></table></EmptyDataTemplate>
            <InsertItemTemplate>
                 <tr>
                    <td colspan="5">
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
                                    <%--<asp:TextBox ID="TextBoxOrgId" runat="server" CssClass="form-control" Text='<%# Bind("OrgId") %>'  Visible="false"/>--%>
                                    <div class="form-group">
                                         <label class="col-md-2 control-label">
                                            <%= Resources.DefaultResource.Code%>
                                        </label>
                                       
                                        <div class="col-sm-10 col-xs-10 col-10">
                                            <asp:TextBox ID="TitleArTextBox" runat="server" CssClass="form-control" Text='<%# Bind("PeriodName") %>' />
                                            <asp:RequiredFieldValidator ID="TitleArTextBoxRFV" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="TitleArTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator></div>

                                    </div>
                         
                                    <div class="form-group form-actions">
                                        <div class="col-md-9 col-md-offset-3">
                                            <asp:Button ID="UpdateButton" runat="server" CommandName="Insert" Text="<%$ Resources:DefaultResource, Save%>" CssClass="btn btn-sm btn-primary" ValidationGroup="DML" />
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
                        <asp:Label ID="GEIDLabel" runat="server" Text='<%# Eval("PeriodId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("PeriodName") %>' />
                    </td>
                  
                  
                   <td class="text-center block-options">
                       <%-- <a href="ApplicantsDocs.aspx?ApplicantID=<%# Eval("ApplicantID") %>" class="btn btn-sm btn-info" data-original-title=""  data-toggle="tooltip" title="">--%>
                            <%-- <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, UserDocuments%>" /> --%>
                         
                               <%-- <a href="ApplicantsDocs.aspx?ApplicantID=<%# Eval("ApplicantID")%>" id="A5" runat="server" class="btn btn-sm btn-info" data-toggle="tooltip"
                                aria-haspopup="true" aria-expanded="true" data-original-title="<%$ Resources:DefaultResource, UserDocuments%>"  title="<%$ Resources:DefaultResource, UserDocuments%>">--%>
                                
                         <asp:LinkButton ID="EditLinkButton" runat="server" CommandName="Edit" Text="" data-toggle="tooltip" title="<%$ Resources:DefaultResource, Edite%>" CssClass="btn btn-sm btn-default" data-original-title="<%$ Resources:DefaultResource, Edite%>">
                          
                                <i class="fa fa-pencil"></i>
                        </asp:LinkButton>
                       
                      <%--  <% if (Session["RoleID"].ToString() != "7")
                        { %>--%>
                            <asp:LinkButton ID="DeleteLinkButton" runat="server" CommandName="Delete" Text="" data-toggle="tooltip" title="<%$ Resources:DefaultResource, Delete%>" CssClass="btn btn-sm btn-danger" data-original-title="<%$ Resources:DefaultResource, Delete%>"  OnClientClick="javascript:if(!confirm('هل انت متأكد من حذف هذا السجل؟')){return false;}">
                                    <i class="fa fa-times"></i>
                            </asp:LinkButton>


                         <a data-toggle="tooltip" title="<%= Resources.DefaultResource.SchoolSujects%>"   class="btn btn-sm btn-warning" data-original-title="<%= Resources.DefaultResource.SchoolSujects%>" href="SchoolSujects.aspx?PeriodId=<%# Eval("PeriodId")%>">
                            <i class="fa fa-minus-circle"></i>
                        </a>
                   <%--     <%}%>--%>
                        

                    </td>
                     
                              
                </tr>

            </ItemTemplate>
        <LayoutTemplate>
                
                <table id="general-table" class="table table-striped table-vcenter table-bordered table-condensed">
                    <thead >
                        <tr>
                            <th class ="text-center">
                                <asp:LinkButton ID="MagazineTitleLinkButton" runat="server" CommandArgument="PeriodId" CommandName="Sort" Text="<%$ Resources:DefaultResource, code%>" />
                            </th>
                            <th class ="text-center">
                                <asp:LinkButton ID="TitleLinkButton" runat="server" CommandArgument="PeriodName" CommandName="Sort" Text="<%$ Resources:DefaultResource, StudentPeriod%>" />
                            </th>
                                                      

                        <%--    <th>
                                <asp:LinkButton ID="CreatorLinkButton" runat="server" CommandArgument="Creator" CommandName="Sort" Text="<%$ Resources:DefaultResource, Creator%>" />
                            </th>
                            <th>
                                <asp:LinkButton ID="UpdaterLinkButton" runat="server" CommandArgument="Creator" CommandName="Sort" Text="<%$ Resources:DefaultResource, Updater%>" />
                            </th>--%>
                            <th class ="text-center" style="width :10%">
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
                           
                           
        <asp:ObjectDataSource ID="PeroidsDS" runat="server"  SelectMethod="Read" TypeName="BOL.Sch_Periods" DeleteMethod="DML" InsertMethod="DML" UpdateMethod="DML"><DeleteParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="3" />
            <asp:Parameter Name="PeriodId" Type="Int64" />
            <asp:Parameter Name="PeriodName" Type="String" />
            <asp:Parameter Name="Notes" Type="String" />
            <asp:Parameter Name="StageId" Type="Int32" />
            <asp:Parameter Name="OrgId" Type="Int64" />
            <asp:Parameter Name="BranchId" Type="Int64" />
            <asp:Parameter Name="CreatedBy" Type="Int32" />
            <asp:Parameter Name="UpdateBy" Type="Int32" />
            <asp:SessionParameter DefaultValue="" Name="DeletedBy" SessionField="UserId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ActionCode" Type="String" DefaultValue="1" /><asp:Parameter Name="PeriodId" Type="Int64" /><asp:Parameter Name="PeriodName" Type="String" /><asp:Parameter Name="Notes" Type="String" />
                <asp:QueryStringParameter DefaultValue="" Name="StageId" QueryStringField="StageId" Type="Int32" />
                <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:Parameter Name="BranchId" Type="Int64" />
                <asp:SessionParameter Name="CreatedBy" SessionField="UserId" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="UpdateBy" SessionField="UserId" Type="Int32" />
                <asp:Parameter Name="DeletedBy" Type="Int32" /></InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="3" Name="ActionCode" Type="String" />
                <asp:Parameter Name="PeriodId" Type="Int64" DefaultValue="" />
                <asp:QueryStringParameter Name="StageId" QueryStringField="StageId" Type="Int64" />
                <asp:SessionParameter DefaultValue="" Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:Parameter Name="BranchId" Type="Int64" />
            </SelectParameters><UpdateParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="2" /><asp:Parameter Name="PeriodId" Type="Int64" /><asp:Parameter Name="PeriodName" Type="String" /><asp:Parameter Name="Notes" Type="String" /><asp:Parameter Name="StageId" Type="Int32" /><asp:Parameter Name="OrgId" Type="Int64" /><asp:Parameter Name="BranchId" Type="Int64" /><asp:Parameter Name="CreatedBy" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="UpdateBy" SessionField="UserId" Type="Int32" />
                <asp:Parameter Name="DeletedBy" Type="Int32" /></UpdateParameters></asp:ObjectDataSource>

    <asp:TextBox ID="txtOrgId" runat="server" 
        Visible="False" ></asp:TextBox>

    </div>

</div>
                                </div> 
           </div> 
     </div>