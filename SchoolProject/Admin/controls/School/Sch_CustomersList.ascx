<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Sch_CustomersList.ascx.cs" Inherits="WebSchool.ADMIN.Controls.School.Sch_CustomersList" %>

<div class="row">
<div class="col-md-12 col-sm-12">
<!-- Lightbox Gallery Block -->

    <%--<div class="content-header">
    <div class="header-section">
        <h1>
            <i class="gi gi-user"></i><%= Resources.DefaultResource.Branches%> 
        </h1>
    </div>
</div>--%>   
<ul class="breadcrumb breadcrumb-top">
    <li><a href="Main.aspx"><%= Resources.DefaultResource.Main%> </a></li>
    <li> <%= Resources.DefaultResource.Customers%> </li>
</ul>
       

    <!-- Table Styles Title -->
    <div class="block-title">
        <h2><strong><%= Resources.DefaultResource.List%>  </strong> <%= Resources.DefaultResource.Customers%> </h2>
        <div class="block-options pull-right">
            <asp:LinkButton ID="NewRecord" runat="server" CssClass="btn btn-sm btn-success" data-toggle="tooltip" title="<%$ Resources:DefaultResource, NewRecord%>"  data-original-title="<%$ Resources:DefaultResource, NewRecord%>" OnClick="NewRecord_Click">
                <i class="fa fa-file"></i>
            </asp:LinkButton>
        </div>
    </div>
    <!-- END Table Styles Title -->
    <div class="block table-responsive">
    <div class="gallery gallery-widget" data-toggle="lightbox-gallery">
               
       <!-- General Data Block -->                             
        <div class="input-group">
            <asp:TextBox ID="SearchTextBox" runat="server" CssClass="form-control" placeholder="<%$ Resources:DefaultResource, PhoneNo%>" onkeypress="return EnterEvent(event)"></asp:TextBox>
            <span class="input-group-btn">
                
                <asp:LinkButton ID="ClearLinkButton" runat="server" CssClass="btn btn-danger" OnClick="ClearLinkButton_Click">
                    <i class="hi hi-remove"></i> <%= Resources.DefaultResource.ClearSearch%>
                </asp:LinkButton>
               
                <asp:LinkButton ID="SearchLinkButton" runat="server" CssClass="btn btn-primary" OnClick="SearchLinkButton_Click">
                    <i class="fa fa-search"></i><%= Resources.DefaultResource.SearchTitle%>
                </asp:LinkButton>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="SearchTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator Display = "Dynamic" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true" ControlToValidate = "SearchTextBox" ID="RegularExpressionValidator2" ValidationExpression = "^5[0-9].*|4[0-9].*|6[0-9].*|9[0-9].*" runat="server" ErrorMessage="<%$ Resources:DefaultResource, NumValidateTitle%>">
                </asp:RegularExpressionValidator>

                    <asp:RegularExpressionValidator Display = "Dynamic" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true" ControlToValidate = "SearchTextBox" ID="RegularExpressionValidator3" ValidationExpression = "^([0-9]{8,8})$" runat="server" ErrorMessage="<%$ Resources:DefaultResource, NumValidateLengthTitle%>">
                </asp:RegularExpressionValidator>
            </span>
        </div>
        <br />
            <div class="block table-responsive">
    <div id="ErrorDiv" runat="server"></div>
    <asp:ListView ID="lv" runat="server" DataKeyNames="Id" DataSourceID="CustomersDS" OnItemCommand="lv_ItemCommand" OnItemDataBound="lv_ItemDataBound" OnItemInserted="lv_ItemInserted" >
            <EditItemTemplate>
               <tr>
                    <td colspan="10">
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
                          
                                   <%--  <asp:TextBox ID="TextBoxOrgId" runat="server" CssClass="form-control" Text='<%# Bind("OrgId") %>'  Visible="false"/>--%>
                                    <div class="form-group">
                                        <label for="TitleArTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="TitleArLiteral1" runat="server" Text="<%$ Resources:DefaultResource, CardName%>" />
                                        </label>
                                        <div class="col-sm-4 col-xs-4 col-4">
                                            <asp:TextBox ID="CustNameTextBox" runat="server" CssClass="form-control" Text='<%# Bind("CustName") %>' />
                                            <asp:RequiredFieldValidator ID="TitleArTextBoxRFV" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="CustNameTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator></div>

                                          <label for="TitleArTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:DefaultResource, PhoneNo%>" />
                                        </label>
                                        <div class="col-sm-4col-xs-4 col-4">
                                            <asp:TextBox ID="TextBoxTel" runat="server" CssClass="form-control" Text='<%# Bind("Tel") %>' />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="TextBoxTel" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator>
                                              <asp:RegularExpressionValidator Display = "Dynamic" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true" ControlToValidate = "TextBoxTel" ID="RegularExpressionValidator2" ValidationExpression = "^5[0-9].*|4[0-9].*|6[0-9].*|9[0-9].*" runat="server" ErrorMessage="<%$ Resources:DefaultResource, NumValidateTitle%>">
                                            </asp:RegularExpressionValidator>

                                             <asp:RegularExpressionValidator Display = "Dynamic" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true" ControlToValidate = "TextBoxTel" ID="RegularExpressionValidator3" ValidationExpression = "^([0-9]{8,8})$" runat="server" ErrorMessage="<%$ Resources:DefaultResource, NumValidateLengthTitle%>">
                                            </asp:RegularExpressionValidator>

                                        </div>

                                    </div>
                                
                                    <div class="form-group">
                                        <label for="TitleArTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:DefaultResource, StageName%>" />
                                        </label>
                                        <div class="col-sm-4 col-xs-4 col-4">
                                            <asp:TextBox ID="TextBoxStageName" runat="server" CssClass="form-control" Text='<%# Bind("StageName") %>' />
                                           
                                            </div>
                                          <label for="TitleArTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:DefaultResource, StudentArea%>" />
                                        </label>
                                        <div class="col-sm-4col-xs-4 col-4">
                                            <asp:TextBox ID="TextBoxAreaDesc" runat="server" CssClass="form-control" Text='<%# Bind("AreaDesc") %>' />
                                           
                                            </div>
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
                    <td colspan="10">
                        <div class="col-md-12">
                            <!-- Basic Form Elements Block -->
                            <div class="block">
                                <!-- Basic Form Elements Title -->
                                <div class="block-title">
                                    <h2><strong><%= Resources.DefaultResource.List %></strong> <%= Resources.DefaultResource.CustomerCalls %></h2>
                                </div>
                                <!-- END Form Elements Title -->
                                <!-- Basic Form Elements Content -->
                                <div class="form-horizontal form-bordered">
                                    <%--<asp:Label ID="OrgIdLabel" runat="server" Text='<%# Eval("OrgId") %>' Visible="false" />--%>
            <%--                    <asp:Label ID="TrainingDateIDLabel" runat="server" Text='<%# Eval("TrainingDateID") %>' Visible="false" />
                                <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' Visible="false" />
                                <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' Visible="false" />--%>
                                     <div class="form-group">
                                        <label for="TitleArTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="TitleArLiteral1" runat="server" Text="<%$ Resources:DefaultResource, CardName%>" />
                                        </label>
                                        <div class="col-sm-4 col-xs-4 col-4">
                                            <asp:TextBox ID="CustNameTextBox" runat="server" CssClass="form-control" Text='<%# Bind("CustName") %>' />
                                            <asp:RequiredFieldValidator ID="TitleArTextBoxRFV" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="CustNameTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator></div>

                                          <label for="TitleArTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:DefaultResource, PhoneNo%>" />
                                        </label>
                                        <div class="col-sm-4col-xs-4 col-4">
                                            <asp:TextBox ID="TextBoxTel" runat="server" CssClass="form-control" Text='<%# Bind("Tel") %>' />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="TextBoxTel" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator>
                                              <asp:RegularExpressionValidator Display = "Dynamic" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true" ControlToValidate = "TextBoxTel" ID="RegularExpressionValidator2" ValidationExpression = "^5[0-9].*|4[0-9].*|6[0-9].*|9[0-9].*" runat="server" ErrorMessage="<%$ Resources:DefaultResource, NumValidateTitle%>">
                                            </asp:RegularExpressionValidator>

                                             <asp:RegularExpressionValidator Display = "Dynamic" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true" ControlToValidate = "TextBoxTel" ID="RegularExpressionValidator3" ValidationExpression = "^([0-9]{8,8})$" runat="server" ErrorMessage="<%$ Resources:DefaultResource, NumValidateLengthTitle%>">
                                            </asp:RegularExpressionValidator>

                                        </div>

                                    </div>
                                
                                    <div class="form-group">
                                        <label for="TitleArTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:DefaultResource, StageName%>" />
                                        </label>
                                        <div class="col-sm-4 col-xs-4 col-4">
                                            <asp:TextBox ID="TextBoxStageName" runat="server" CssClass="form-control" Text='<%# Bind("StageName") %>' />
                                           </div>

                                          <label for="TitleArTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:DefaultResource, StudentArea%>" />
                                        </label>
                                        <div class="col-sm-4col-xs-4 col-4">
                                            <asp:TextBox ID="TextBoxAreaDesc" runat="server" CssClass="form-control" Text='<%# Bind("AreaDesc") %>' />
                                           
                                        </div> 
                                    
                                           </div>                         
                              
                             
                                  
                       
                        
                         
                                    <div class="form-group form-actions">
                                        <div class="col-md-9 col-md-offset-3">
                                            <asp:Button ID="UpdateButton" runat="server" CommandName="Insert" Text="<%$ Resources:DefaultResource, Save%>" CssClass="btn btn-sm btn-primary" ValidationGroup="DML" />
                                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="<%$ Resources:DefaultResource, Cancel%>" CssClass="btn btn-sm btn-warning" />
                                        </div>
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
                        <asp:Label ID="Label6" runat="server" Text='<%# Container.DisplayIndex+1 %>' />
                    </td>
                   <%-- <td>
                        <asp:Label ID="GEIDLabel" runat="server" Text='<%# Eval("CustName") %>' />
                    </td>--%>
                    <td>
                        <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Tel") %>' />
                    </td>
                  
                  <%-- <td>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("StageName") %>' />
                    </td>
                     <td>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("AreaDesc") %>' />
                    </td>--%>
                     <td>
                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("LastCall") %>' />
                    </td>
                    <td>
                         <%# String.Format(new System.Globalization.CultureInfo("ar-KW"), "{0: dd/MMM/yyyy}", Eval("lastDay")) %>
                       
                    </td>
                       <td>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("DayTime") %>' />
                    </td>
                     <td>
                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("Name") %>' />
                    </td>
                     <td>
                        <asp:Label ID="Label10" runat="server" Text='<%# Eval("ReplyNotes") %>' />
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
                           <%-- <asp:LinkButton ID="DeleteLinkButton" runat="server" CommandName="Delete" Text="" data-toggle="tooltip" title="<%$ Resources:DefaultResource, Delete%>" CssClass="btn btn-sm btn-danger" data-original-title="<%$ Resources:DefaultResource, Delete%>"  OnClientClick="javascript:if(!confirm('هل انت متأكد من حذف هذا السجل؟')){return false;}">
                                    <i class="fa fa-times"></i>
                            </asp:LinkButton>--%>

                           <asp:LinkButton ID="CallsLinkButton" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="Calls" Text="" data-toggle="tooltip" title="<%$ Resources:DefaultResource, Replies%>" CssClass="btn btn-sm btn-success" data-original-title="<%$ Resources:DefaultResource, Replies%>"  >
                                    <i class="fa fa-users"></i>
                            </asp:LinkButton>

                       <%--  <a data-toggle="tooltip" title="<%= Resources.DefaultResource.SchoolPeriods%>"   class="btn btn-sm btn-success" data-original-title="<%= Resources.DefaultResource.SchoolPeriods%>" href="Periods.aspx?StageId=<%# Eval("Id")%>">
                            <i class="fa fa-users"></i>
                        </a>--%>
                   <%--     <%}%>--%>
                        

                    </td>
                     
                              
                </tr>

            </ItemTemplate>
        <LayoutTemplate>
                
                <table id="general-table" class="table table-striped table-vcenter table-bordered table-condensed">
                    <thead >
                        <tr>
                             <th class ="text-center">
                                <asp:LinkButton ID="LinkButton10" runat="server" CommandArgument="CardName" CommandName="Sort" Text="<%$ Resources:DefaultResource, RowSerial%>" />
                            </th>
                            
                         <%--   <th class ="text-center">
                                <asp:LinkButton ID="MagazineTitleLinkButton" runat="server" CommandArgument="CardName" CommandName="Sort" Text="<%$ Resources:DefaultResource, CardName%>" />
                            </th>--%>
                            <th class ="text-center">
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument="Tel" CommandName="Sort" Text="<%$ Resources:DefaultResource, PhoneNo%>" />
                            </th>
                            
                           <%-- <th class ="text-center">
                                <asp:LinkButton ID="TitleLinkButton" runat="server" CommandArgument="StageName" CommandName="Sort" Text="<%$ Resources:DefaultResource, StageName%>" />
                            </th>
                                                      
                             <th class ="text-center">
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument="StudentArea" CommandName="Sort" Text="<%$ Resources:DefaultResource, StudentArea%>" />
                            </th>--%>
                             <th class ="text-center">
                                <asp:LinkButton ID="LinkButton4" runat="server" CommandArgument="BRANCHNAME" CommandName="Sort" Text="<%$ Resources:DefaultResource, LastCall%>" />
                            </th>
                              <th class ="text-center">
                                <asp:LinkButton ID="LinkButton5" runat="server" CommandArgument="BRANCHNAME" CommandName="Sort" Text="<%$ Resources:DefaultResource, lastDay%>" />
                            </th>
                              <th class ="text-center">
                                <asp:LinkButton ID="LinkButton7" runat="server" CommandArgument="CardName" CommandName="Sort" Text="<%$ Resources:DefaultResource, TimeDay%>" />
                            </th>
                               <th class ="text-center">
                                <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument="Name" CommandName="Sort" Text="<%$ Resources:DefaultResource, EmpName%>" />
                            </th>
                              <th class ="text-center">
                                <asp:LinkButton ID="LinkButton9" runat="server" CommandArgument="Name" CommandName="Sort" Text="<%$ Resources:DefaultResource, CardNotes%>" />
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
                            <td colspan="13">
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

</div>
 

                           
        <asp:ObjectDataSource ID="CustomersDS" runat="server"  SelectMethod="Read" TypeName="BOL.Sch_Customer" DeleteMethod="DML" InsertMethod="DML" UpdateMethod="DML" OnInserted="CustomersDS_Inserted"><DeleteParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="3" />
            <asp:Parameter Name="Id" Type="Int64" />
            <asp:Parameter Name="CustName" Type="String" />
            <asp:Parameter Name="AreaId" Type="Int32" />
            <asp:Parameter Name="AreaDesc" Type="String" />
            <asp:Parameter Name="Tel" Type="String" />
            <asp:Parameter Name="Mobile" Type="String" />
            <asp:Parameter Name="UserId" Type="Int64" />
            <asp:Parameter Name="StageName" Type="String" />
            <asp:Parameter Name="Tel1" Type="String" />
            <asp:Parameter Name="Tel2" Type="String" />
            <asp:Parameter Name="Schoolname" Type="String" />
            <asp:Parameter Name="BranchId" Type="Int64" />
            <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
            <asp:Parameter Name="CreatedBy" Type="Int32" />
            <asp:Parameter Name="UpdateBy" Type="Int32" />
            <asp:SessionParameter DefaultValue="" Name="DeletedBy" SessionField="UserId" Type="Int32" />
            <asp:Parameter Direction="InputOutput" Name="InsertedId" Type="Object" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ActionCode" Type="String" DefaultValue="1" /><asp:Parameter Name="Id" Type="Int64" /><asp:Parameter Name="CustName" Type="String" />
                <asp:Parameter Name="AreaId" Type="Int32" />
                <asp:Parameter Name="AreaDesc" Type="String" />
                <asp:Parameter Name="Tel" Type="String" />
                <asp:Parameter Name="Mobile" Type="String" />
                <asp:SessionParameter DefaultValue="" Name="UserId" SessionField="UserId" Type="Int64" />
                <asp:Parameter Name="StageName" Type="String" /><asp:Parameter Name="Tel1" Type="String" />
                <asp:Parameter Name="Tel2" Type="String" />
                <asp:Parameter Name="Schoolname" Type="String" />
                <asp:Parameter Name="BranchId" Type="Int64" />
                <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:SessionParameter Name="CreatedBy" SessionField="UserId" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="UpdateBy" SessionField="UserId" Type="Int32" />
                <asp:Parameter Name="DeletedBy" Type="Int32" />
                <asp:Parameter Direction="InputOutput" Name="InsertedId" Type="Object" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="2" Name="ActionCode" Type="String" />
                <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:Parameter Name="CustId" Type="Int64" />
                <asp:Parameter Name="AreaId" Type="Int64" />
                <asp:Parameter Name="BranchId" Type="Int64" />
                <asp:SessionParameter DefaultValue="" Name="UserId" SessionField="UserId" Type="Int32" />
                <asp:ControlParameter ControlID="SearchTextBox" DefaultValue="" Name="SearchText" PropertyName="Text" Type="String" />
            </SelectParameters><UpdateParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="2" /><asp:Parameter Name="Id" Type="Int64" /><asp:Parameter Name="CustName" Type="String" />
                <asp:Parameter Name="AreaId" Type="Int32" />
                <asp:Parameter Name="AreaDesc" Type="String" />
                <asp:Parameter Name="Tel" Type="String" />
                <asp:Parameter Name="Mobile" Type="String" />
                <asp:Parameter DefaultValue="" Name="UserId" Type="Int64" />
                <asp:Parameter Name="StageName" Type="String" /><asp:Parameter Name="Tel1" Type="String" />
                <asp:Parameter Name="Tel2" Type="String" />
                <asp:Parameter Name="Schoolname" Type="String" />
                <asp:Parameter Name="BranchId" Type="Int64" /><asp:Parameter Name="OrgId" Type="Int64" /><asp:Parameter Name="CreatedBy" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="UpdateBy" SessionField="UserId" Type="Int32" />
                <asp:Parameter Name="DeletedBy" Type="Int32" />
                <asp:Parameter Direction="InputOutput" Name="InsertedId" Type="Object" />
            </UpdateParameters></asp:ObjectDataSource>

    <asp:TextBox ID="txtOrgId" runat="server" 
        Visible="False" ></asp:TextBox>

    <asp:TextBox ID="txtCustId" runat="server" 
        Visible="False" ></asp:TextBox>




                                
           </div> 
     </div>
 <div class="modal fade" id="myModal" tabindex="-1"  aria-labelledby="myLargeModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog modal-dialog-centered" style="max-width: 100%;" role="document"
                                <%--role="dialog"--%>  >
                                <div class="modal-content">
                             <div class="modal-header">
                                        <button id="CloseBtn" name="CloseBtn" type="button" class="close" data-bs-dismiss="modal" aria-label="Close" onclick="HidePopup();">
                                            <span class="fa fa-close"></span>
                                        </button>
 

                           
        <asp:ObjectDataSource ID="ObjectCustomersDS" runat="server"  SelectMethod="Read" TypeName="BOL.Sch_Customer" DeleteMethod="DML" InsertMethod="DML" UpdateMethod="DML" OnInserted="CustomersDS_Inserted" OldValuesParameterFormatString="original_{0}"><DeleteParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="3" />
            <asp:Parameter Name="Id" Type="Int64" />
            <asp:Parameter Name="CustName" Type="String" />
            <asp:Parameter Name="AreaId" Type="Int32" />
            <asp:Parameter Name="AreaDesc" Type="String" />
            <asp:Parameter Name="Tel" Type="String" />
            <asp:Parameter Name="Mobile" Type="String" />
            <asp:Parameter Name="UserId" Type="Int64" />
            <asp:Parameter Name="StageName" Type="String" />
            <asp:Parameter Name="Tel1" Type="String" />
            <asp:Parameter Name="Tel2" Type="String" />
            <asp:Parameter Name="Schoolname" Type="String" />
            <asp:Parameter Name="BranchId" Type="Int64" />
            <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
            <asp:Parameter Name="CreatedBy" Type="Int32" />
            <asp:Parameter Name="UpdateBy" Type="Int32" />
            <asp:SessionParameter DefaultValue="" Name="DeletedBy" SessionField="UserId" Type="Int32" />
            <asp:Parameter Direction="InputOutput" Name="InsertedId" Type="Object" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ActionCode" Type="String" DefaultValue="1" /><asp:Parameter Name="Id" Type="Int64" /><asp:Parameter Name="CustName" Type="String" />
                <asp:Parameter Name="AreaId" Type="Int32" />
                <asp:Parameter Name="AreaDesc" Type="String" />
                <asp:Parameter Name="Tel" Type="String" />
                <asp:Parameter Name="Mobile" Type="String" />
                <asp:SessionParameter DefaultValue="" Name="UserId" SessionField="UserId" Type="Int64" />
                <asp:Parameter Name="StageName" Type="String" /><asp:Parameter Name="Tel1" Type="String" />
                <asp:Parameter Name="Tel2" Type="String" />
                <asp:Parameter Name="Schoolname" Type="String" />
                <asp:Parameter Name="BranchId" Type="Int64" />
                <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:SessionParameter Name="CreatedBy" SessionField="UserId" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="UpdateBy" SessionField="UserId" Type="Int32" />
                <asp:Parameter Name="DeletedBy" Type="Int32" />
                <asp:Parameter Direction="InputOutput" Name="InsertedId" Type="Object" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="2" Name="ActionCode" Type="String" />
                <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:Parameter Name="CustId" Type="Int64" />
                <asp:Parameter Name="AreaId" Type="Int64" />
                <asp:Parameter Name="BranchId" Type="Int64" />
                <asp:Parameter DefaultValue="" Name="UserId" Type="Int32" />
                <asp:ControlParameter ControlID="SearchTextBox" DefaultValue="" Name="SearchText" PropertyName="Text" Type="String" />
            </SelectParameters><UpdateParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="2" /><asp:Parameter Name="Id" Type="Int64" /><asp:Parameter Name="CustName" Type="String" />
                <asp:Parameter Name="AreaId" Type="Int32" />
                <asp:Parameter Name="AreaDesc" Type="String" />
                <asp:Parameter Name="Tel" Type="String" />
                <asp:Parameter Name="Mobile" Type="String" />
                <asp:Parameter DefaultValue="" Name="UserId" Type="Int64" />
                <asp:Parameter Name="StageName" Type="String" /><asp:Parameter Name="Tel1" Type="String" />
                <asp:Parameter Name="Tel2" Type="String" />
                <asp:Parameter Name="Schoolname" Type="String" />
                <asp:Parameter Name="BranchId" Type="Int64" /><asp:Parameter Name="OrgId" Type="Int64" /><asp:Parameter Name="CreatedBy" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="UpdateBy" SessionField="UserId" Type="Int32" />
                <asp:Parameter Name="DeletedBy" Type="Int32" />
                <asp:Parameter Direction="InputOutput" Name="InsertedId" Type="Object" />
            </UpdateParameters></asp:ObjectDataSource>

                                    </div>

               
                 <div class="modal-body table-responsive" id ="myBodaydiv">
  
                     <div class="row">
<div class="col-md-12 col-sm-12">
<!-- Lightbox Gallery Block -->

   
      
<div class="block">
    <!-- Table Styles Title -->
    <div class="block-title">
        <h2><strong><%= Resources.DefaultResource.UpdateRecord %>  </strong> <%= Resources.DefaultResource.Data%> </h2>
        <div class="block-options pull-right">
            <asp:LinkButton ID="LinkButton3" runat="server" CssClass="btn btn-sm btn-success" data-toggle="tooltip" title="<%$ Resources:DefaultResource, NewRecord%>"  data-original-title="<%$ Resources:DefaultResource, NewRecord%>" OnClick="NewRecordCall_Click">
                <i class="fa fa-file"></i>
            </asp:LinkButton>
        </div>
    </div>
    <!-- END Table Styles Title -->

    <div class="gallery gallery-widget" data-toggle="lightbox-gallery">
               
       <!-- General Data Block -->                             
       
<%--  <asp:TextBox ID="TextBoxOrgId" runat="server" CssClass="form-control" Text='<%# Bind("OrgId") %>'  Visible="false"/>--%>
    <div id="Div1" runat="server"></div>
    <asp:ListView ID="ListViewCalls" runat="server" DataKeyNames="CallId" DataSourceID="ObjectDataSourceCustomerCalls" OnItemCommand="ListViewCalls_ItemCommand" OnItemDataBound="ListViewCalls_ItemDataBound" OnItemInserting="ListViewCalls_ItemInserting" OnPreRender="ListViewCalls_PreRender">
            <EditItemTemplate>
               <tr>
                    <td colspan="9">
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
                                    <asp:label ID="InvIdTextBox" runat="server" CssClass="form-control" Text='<%# Bind("CustId") %>' Visible="false"/>
                                   
                            <!--begin::Form-->
                          
                                   <%--  <asp:TextBox ID="TextBoxOrgId" runat="server" CssClass="form-control" Text='<%# Bind("OrgId") %>'  Visible="false"/>--%>
                                    <div class="form-group">
                                        <label for="TitleArTextBox" class="col-md-1 control-label">
                                            <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:DefaultResource, TimeDay%>" />
                                        </label>
                                        <div class="col-sm-2 col-xs-2 col-2">
                                        <%--   <asp:label ID="Label6" runat="server" CssClass="form-control" Text='<%# Bind("DayTime") %>'  />--%>
                                             <asp:TextBox ID="TextBoxDayTime" runat="server" Text='<%# Bind("DayTime") %>'   CssClass="form-control"  AutoComplete="Off" />
                                         </div>

                                        <label for="TitleArTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="TitleArLiteral1" runat="server" Text="<%$ Resources:DefaultResource, Date%>" />
                                        </label>
                                        <div class="col-sm-2 col-xs-2 col-2">
                                            <asp:TextBox ID="DayDateTextBox" runat="server" Text='<%# Bind("DayDate","{0: dd/MM/yyyy}") %>'   CssClass="form-control  input-datepicker" placeholder="<%$ Resources:DefaultResource, Date%>"  data-date-format="dd/mm/yyyy" AutoComplete="Off" />
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidatorDate" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="DayDateTextBox" ValidationGroup="DML" CssClass="label label-warning">
                                            </asp:RequiredFieldValidator>

                                            

                                         </div>

                                        <label for="TitleArTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:DefaultResource, Reply%>" />
                                        </label>

                                        <div class="col-sm-3 col-xs-3 col-3">
                                            <asp:DropDownList ID="DropDownListReplyId" Text='<%# Bind("ReplyId") %>' runat="server" CssClass="form-control select-chosen" AppendDataBoundItems="True" DataSourceID="ObjectDataSourceCustomerReply" DataTextField="ReplyDesc" DataValueField="ID">
                                                    <asp:ListItem Text="<%$ Resources:DefaultResource, Choose%>"  Value="0"></asp:ListItem>
                   
                                            </asp:DropDownList>
                                           <asp:RequiredFieldValidator ID="TitleArTextBoxRFV" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="DropDownListReplyId" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator>
                                            <asp:RangeValidator ID="RangeValidatorReply" runat="server"  MinimumValue="1" MaximumValue="5000"
                                                ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="DropDownListReplyId" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true" Type="Integer"></asp:RangeValidator>
                                        </div>

                                    </div>
                                <div class="form-group">
                                    <label for="TitleArTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:DefaultResource, CardNotes%>" />
                                        </label>
                                        <div class="col-sm-10 col-xs-10 col-10">
                                            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" Text='<%# Bind("ReplyNotes") %>' TextMode="MultiLine" />

                                         </div>
                                    <br />
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
                    <td colspan="9">
                        <div class="col-md-12">
                            <!-- Basic Form Elements Block -->
                            <div class="block">
                                <!-- Basic Form Elements Title -->
                                <div class="block-title">
                                    <h2><strong><%= Resources.DefaultResource.List %></strong> <%= Resources.DefaultResource.CustomerCalls %></h2>
                                </div>
                                <!-- END Form Elements Title -->
                                <!-- Basic Form Elements Content -->
                                <div class="form-horizontal form-bordered">
                                   
                                       <div class="form-group">
                                        <label for="TitleArTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="TitleArLiteral1" runat="server" Text="<%$ Resources:DefaultResource, Date%>" />
                                        </label>
                                        <div class="col-sm-4 col-xs-4 col-4">
                                           <asp:TextBox ID="DayDateTextBox" runat="server" Text='<%# Bind("DayDate","{0: dd/MM/yyyy}") %>'   CssClass="form-control  input-datepicker" placeholder="<%$ Resources:DefaultResource, Date%>"  data-date-format="dd/mm/yyyy" AutoComplete="Off" />
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidatorDate" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="DayDateTextBox" ValidationGroup="DML" CssClass="label label-warning">
                                            </asp:RequiredFieldValidator>

                                         </div>

                                        <label for="TitleArTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:DefaultResource, Reply%>" />
                                        </label>

                                        <div class="col-sm-4 col-xs-4 col-4">
                                            <asp:DropDownList ID="DropDownListReplyId" Text='<%# Bind("ReplyId") %>' runat="server" CssClass="form-control select-chosen" AppendDataBoundItems="True" DataSourceID="ObjectDataSourceCustomerReply" DataTextField="ReplyDesc" DataValueField="ID">
                                                    <asp:ListItem Text="<%$ Resources:DefaultResource, Choose%>"  Value="0"></asp:ListItem>
                   
                                            </asp:DropDownList>
                                           <asp:RequiredFieldValidator ID="TitleArTextBoxRFV" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="DropDownListReplyId" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator>
                                             <asp:RangeValidator ID="RangeValidatorReply" runat="server"  MinimumValue="1" MaximumValue="5000"
                                                ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="DropDownListReplyId" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true" Type="Integer"></asp:RangeValidator>
                                          
                                        </div>

                                    </div>
                                <div class="form-group">
                                    <label for="TitleArTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:DefaultResource, CardNotes%>" />
                                        </label>
                                        <div class="col-sm-10 col-xs-10 col-10">
                                            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" Text='<%# Bind("ReplyNotes") %>' TextMode="MultiLine" />
                                              <br />
                                         </div>
                                    </div>
                                                      
                              
                             
                                 
                         
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
                <tr >
                     <td>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("DayDate","{0: dd/MM/yyyy}") %>' />
                        <%-- <%# String.Format(new System.Globalization.CultureInfo("ar-KW"), "{0: dd/MMM/yyyy}", Eval("DayDate")) %>--%>
                    </td>
                     <td>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("DayTime") %>' />
                    </td>
                     <td>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("ReplyDesc") %>' />
                    </td>
                    <td>
                        <asp:Label ID="GEIDLabel" runat="server" Text='<%# Eval("CustName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Tel") %>' />
                    </td>
                  
                   <td>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("StageName") %>' />
                    </td>
                     <td>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("AreaDesc") %>' />
                    </td>
                       
                     <td>
                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("Name") %>' />
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

                       <%--  <a data-toggle="tooltip" title="<%= Resources.DefaultResource.SchoolPeriods%>"   class="btn btn-sm btn-success" data-original-title="<%= Resources.DefaultResource.SchoolPeriods%>" href="Periods.aspx?StageId=<%# Eval("Id")%>">
                            <i class="fa fa-users"></i>
                        </a>--%>
                   <%--     <%}%>--%>
                        

                    </td>
                     
                              
                </tr>

            </ItemTemplate>
        <LayoutTemplate>
                
                <table id="general-table" class="table table-striped table-vcenter table-bordered table-condensed">
                    <thead >
                        <tr>
                            <th class ="text-center">
                                <asp:LinkButton ID="LinkButton8" runat="server" CommandArgument="CardName" CommandName="Sort" Text="<%$ Resources:DefaultResource, Date%>" />
                            </th>
                            <th class ="text-center">
                                <asp:LinkButton ID="LinkButton7" runat="server" CommandArgument="CardName" CommandName="Sort" Text="<%$ Resources:DefaultResource, TimeDay%>" />
                            </th>
                            <th class ="text-center">
                                <asp:LinkButton ID="LinkButton6" runat="server" CommandArgument="CardName" CommandName="Sort" Text="<%$ Resources:DefaultResource, Reply%>" />
                            </th>
                            <th class ="text-center">
                                <asp:LinkButton ID="MagazineTitleLinkButton" runat="server" CommandArgument="CardName" CommandName="Sort" Text="<%$ Resources:DefaultResource, CardName%>" />
                            </th>
                            <th class ="text-center">
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument="CardName" CommandName="Sort" Text="<%$ Resources:DefaultResource, PhoneNo%>" />
                            </th>
                            
                            <th class ="text-center">
                                <asp:LinkButton ID="TitleLinkButton" runat="server" CommandArgument="BRANCHNAME" CommandName="Sort" Text="<%$ Resources:DefaultResource, StageName%>" />
                            </th>
                                                      
                             <th class ="text-center">
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument="BRANCHNAME" CommandName="Sort" Text="<%$ Resources:DefaultResource, StudentArea%>" />
                            </th>
                            <th class ="text-center">
                                <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument="Name" CommandName="Sort" Text="<%$ Resources:DefaultResource, EmpName%>" />
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
             
        
          
 

                           
        <asp:ObjectDataSource ID="ObjectDataSourceCustomerCalls" runat="server" SelectMethod="Read" TypeName="BOL.Sch_customersCalls" DeleteMethod="DML" InsertMethod="DML" UpdateMethod="DML" OnInserting="ObjectDataSourceCustomerCalls_Inserting" OnInserted="ObjectDataSourceCustomerCalls_Inserted">
            <DeleteParameters>
                <asp:Parameter Name="ActionCode" Type="String" DefaultValue="3" />
                <asp:Parameter Name="CallId" Type="Int64" />
                <asp:Parameter Name="CustId" Type="Int64" />
                <asp:Parameter Name="ReplyId" Type="Int32" />
                <asp:Parameter Name="DayDate" Type="String" />
                <asp:Parameter Name="DayTime" Type="String" />
                <asp:Parameter Name="ReplyNotes" Type="String" />
                <asp:Parameter Name="UserId" Type="Int64" />
                <asp:Parameter Name="Tel" Type="String" />
                <asp:Parameter Name="Notes" Type="String" />
                <asp:Parameter Name="BranchId" Type="Int64" />
                <asp:Parameter Name="OrgId" Type="Int64" />
                <asp:Parameter Name="CreatedBy" Type="Int32" />
                <asp:Parameter Name="UpdateBy" Type="Int32" />
                <asp:Parameter Name="DeletedBy" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ActionCode" Type="String" DefaultValue="1" />
                <asp:Parameter Name="CallId" Type="Int64" />
                <asp:Parameter Name="CustId" Type="Int64" />
                <asp:Parameter Name="ReplyId" Type="Int32" />
                <asp:Parameter Name="DayDate" Type="String" />
                <asp:Parameter Name="DayTime" Type="String" />
                <asp:Parameter Name="ReplyNotes" Type="String" />
                <asp:SessionParameter DefaultValue="" Name="UserId" SessionField="UserId" Type="Int64" />
                <asp:Parameter Name="Tel" Type="String" />
                <asp:Parameter Name="Notes" Type="String" />
                <asp:Parameter Name="BranchId" Type="Int64" />
                <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:SessionParameter Name="CreatedBy" SessionField="UserId" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="UpdateBy" SessionField="UserId" Type="Int32" />
                <asp:Parameter Name="DeletedBy" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="2" Name="ActionCode" Type="String" />
                <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:Parameter Name="CustId" Type="Int64" />
                <asp:Parameter Name="AreaId" Type="Int64" />
                <asp:Parameter Name="CallId" Type="Int64" />
                <asp:Parameter Name="RelpyId" Type="Int32" />
                <asp:Parameter Name="UserId" Type="Int64" />
                <asp:Parameter Name="StartDate" Type="String"></asp:Parameter>
                <asp:Parameter Name="EndDate" Type="String"></asp:Parameter>
                <asp:Parameter Name="BranchId" Type="Int64"></asp:Parameter>
                <asp:Parameter Name="SearchText" Type="String"></asp:Parameter>
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="ActionCode" Type="String" DefaultValue="2" />
                <asp:Parameter Name="CallId" Type="Int64" />
                <asp:Parameter Name="CustId" Type="Int64" />
                <asp:Parameter Name="ReplyId" Type="Int32" />
                <asp:Parameter Name="DayDate" Type="String" />
                <asp:Parameter Name="DayTime" Type="String" />
                <asp:Parameter Name="ReplyNotes" Type="String" />
                <asp:SessionParameter DefaultValue="" Name="UserId" SessionField="UserId" Type="Int64" />
                <asp:Parameter Name="Tel" Type="String" />
                <asp:Parameter Name="Notes" Type="String" />
                <asp:Parameter Name="BranchId" Type="Int64" />
                <asp:Parameter Name="OrgId" Type="Int64" />
                <asp:Parameter Name="CreatedBy" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="UpdateBy" SessionField="UserId" Type="Int32" />
                <asp:Parameter Name="DeletedBy" Type="Int32" /></UpdateParameters></asp:ObjectDataSource>

    <asp:TextBox ID="TextBox2" runat="server" 
        Visible="False" ></asp:TextBox>

        
          
 

                           
        <asp:ObjectDataSource ID="ObjectDataSourceCustomerReply" runat="server" SelectMethod="Read" TypeName="BOL.Sch_customerReply" OnInserted="ObjectDataSourceCustomerReply_Inserted">
            <SelectParameters>
                <asp:Parameter DefaultValue="2" Name="ActionCode" Type="String" />

                <asp:Parameter Name="Id" Type="Int64" />
                <asp:SessionParameter SessionField="OrgId" Name="OrgId" Type="Int64"></asp:SessionParameter>

                <asp:Parameter Name="BranchId" Type="Int64"></asp:Parameter>
                <asp:Parameter Name="SearchText" Type="String"></asp:Parameter>
            </SelectParameters></asp:ObjectDataSource>

    </div>

</div>


           </div> 
     </div>
                      
     
           </div> 
                                </div> 
            </div> 



       </div>
<script>

    $('#CloseBtn').click(function () {
        /*  $('.myFirst').hide();*/

        $('#myModal').modal('hide');
        return false;
    });

    function showPopup() {
        $('#myModal').modal('show');

    }
    function HidePopup() {
        $('#myModal').modal('hide');

    }

    function EnterEvent(e) {
        if (e.keyCode == 13) {
            __doPostBack('<%=SearchLinkButton.UniqueID%>', "");
        }
    }
</script>