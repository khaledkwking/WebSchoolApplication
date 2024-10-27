<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Sch_CustomersCallsList.ascx.cs" Inherits="WebSchool.Admin.controls.School.Sch_CustomersCallsList" %>


<div class="content-header">
    <%-- <div class="header-section">
        <h1>
            <i class="gi gi-user"></i> <%= Resources.DefaultResource.Main%>
        </h1>
    </div>--%>
</div>
<ul class="breadcrumb breadcrumb-top">
    <li><a href="Main.aspx"><%= Resources.DefaultResource.Main%> </a></li>
    <li> <%= Resources.DefaultResource.CustomerCallRpt %> </li>
</ul>


       

    <!-- Table Styles Title -->
    <div class="block-title">
        <h2><strong><%= Resources.DefaultResource.List%>  </strong> <%= Resources.DefaultResource.CustomerCallRpt%> </h2>
        <%--  <div class="block-options pull-right">
            <asp:LinkButton ID="NewRecord" runat="server" CssClass="btn btn-sm btn-success" data-toggle="tooltip" title="<%$ Resources:DefaultResource, NewRecord%>"  data-original-title="<%$ Resources:DefaultResource, NewRecord%>" OnClick="NewRecord_Click"> <i class="fa fa-file"></i></asp:LinkButton>
        </div>--%>
    </div>
    <!-- END Table Styles Title -->
    <div class="block table-responsive">
    <div class="gallery gallery-widget" data-toggle="lightbox-gallery" style ="min-height :600px">
               
     <!-- General Data Block -->  
        <div class="row">
             <div class=" col-md-3">
                 <asp:TextBox ID="StartDateTextBox" runat="server"  CssClass="form-control input-datepicker" placeholder="<%$ Resources:DefaultResource, FromDate%>" data-date-format="dd/mm/yyyy" autocomplete ="off"/>
            </div>
             <div class=" col-md-3">
                 <asp:TextBox ID="EndDateTextBox" runat="server"  CssClass="form-control input-datepicker" placeholder="<%$ Resources:DefaultResource, ToDate%>" data-date-format="dd/mm/yyyy" autocomplete ="off" />
            </div>
           
             <div class="col-md-3">
                <asp:DropDownList ID="DropDownListEmp" runat="server" CssClass="form-control select-chosen" AppendDataBoundItems="True" DataSourceID="UsersDS" DataTextField="Name" DataValueField="ID"  >
                        <asp:ListItem Text="<%$ Resources:DefaultResource, ChooseEmp%>"  Value="0"></asp:ListItem>
                   
                </asp:DropDownList>

                </div>
               <div class="col-md-3">
             <asp:DropDownList ID="DropDownListReplyId"  runat="server" CssClass="form-control select-chosen" AppendDataBoundItems="True" DataSourceID="ObjectDataSourceCustomerReply" DataTextField="ReplyDesc" DataValueField="Id">
                                                    <asp:ListItem Text="<%$ Resources:DefaultResource, Choose%>"  Value="0"></asp:ListItem>
                   
                                            </asp:DropDownList>
                 </div>
          
          </div>
           <div class="row">
            
                
            <div class="col-md-12">
               
                            <label class="switch switch-success">
                                  عرض جميع الردود
                                <asp:CheckBox ID="AllCheckBox" runat="server"  /><span></span>
                            </label>
                 
                            </div>
                 </div>
        <div class="input-group">
            <asp:TextBox ID="SearchTextBox" runat="server" CssClass="form-control" placeholder="<%$ Resources:DefaultResource, Search%>"></asp:TextBox>

            <span class="input-group-btn">
                
                <asp:LinkButton ID="ClearLinkButton" runat="server" CssClass="btn btn-sm btn-danger" OnClick="ClearLinkButton_Click"> <i class="hi hi-remove"></i><%= Resources.DefaultResource.ClearSearch%></asp:LinkButton>
               
                <asp:LinkButton ID="SearchLinkButton" runat="server" CssClass="btn btn-sm btn-primary" OnClick="SearchLinkButton_Click"> <i class="fa fa-search"></i><%= Resources.DefaultResource.SearchTitle%></asp:LinkButton>
                 &nbsp; &nbsp;
                  <asp:LinkButton ID="PrintLinkButton" runat="server" CssClass="btn btn-sm btn-info" OnClick="PrintLinkButton_Click" > <i class="fa fa-Print"></i><%= Resources.DefaultResource.Print%></asp:LinkButton>
            </span>
        </div>
        <br />
      
        <br />
    <div id="ErrorDiv" runat="server"></div>
                           
          <div class="col-md-12 col-xs-12 col-12">
              <div class="block table-responsive">
    <asp:ListView ID="lv" runat="server" DataKeyNames="CallId" DataSourceID="ObjectDataSourceCustomerCalls" OnItemCommand="lv_ItemCommand" OnItemDataBound="InvoiceView_ItemDataBound">
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
                                           <asp:label ID="Label6" runat="server" CssClass="form-control" Text='<%# Bind("DayTime") %>'  />

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
                                            <asp:Literal ID="TitleArLiteral2" runat="server" Text="<%$ Resources:DefaultResource, Date%>" />
                                        </label>
                                        <div class="col-sm-4 col-xs-4 col-4">
                                           <asp:TextBox ID="DayDateTextBox0" runat="server" Text='<%# Bind("DayDate","{0: dd/MM/yyyy}") %>'   CssClass="form-control  input-datepicker" placeholder="<%$ Resources:DefaultResource, Date%>"  data-date-format="dd/mm/yyyy" AutoComplete="Off" OnDataBinding="TextboxDate_DataBinding"/>
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidatorDate0" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="DayDateTextBox" ValidationGroup="DML" CssClass="label label-warning">
                                            </asp:RequiredFieldValidator>

                                         </div>

                                        <label for="TitleArTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal12" runat="server" Text="<%$ Resources:DefaultResource, Reply%>" />
                                        </label>

                                        <div class="col-sm-4 col-xs-4 col-4">
                                            <asp:DropDownList ID="DropDownListReplyId0" Text='<%# Bind("ReplyId") %>' runat="server" CssClass="form-control select-chosen" AppendDataBoundItems="True" DataSourceID="ObjectDataSourceCustomerReply" DataTextField="ReplyDesc" DataValueField="ID">
                                                    <asp:ListItem Text="<%$ Resources:DefaultResource, Choose%>"  Value="0"></asp:ListItem>
                   
                                            </asp:DropDownList>
                                           <asp:RequiredFieldValidator ID="TitleArTextBoxRFV0" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="DropDownListReplyId" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator>

                                        </div>

                                    </div>
                                <div class="form-group">
                                    <label for="TitleArTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal13" runat="server" Text="<%$ Resources:DefaultResource, CardNotes%>" />
                                        </label>
                                        <div class="col-sm-10 col-xs-10 col-10">
                                            <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" Text='<%# Bind("ReplyNotes") %>' TextMode="MultiLine" />
                                              <br />
                                         </div>
                                    </div>
                                                      
                              
                             
                                 
                         
                                    <div class="form-group form-actions">
                                        <div class="col-md-9 col-md-offset-3">
                                            <asp:Button ID="UpdateButton0" runat="server" CommandName="Insert" Text="<%$ Resources:DefaultResource, Save%>" CssClass="btn btn-sm btn-primary" ValidationGroup="DML" />
                                            <asp:Button ID="CancelButton0" runat="server" CommandName="Cancel" Text="<%$ Resources:DefaultResource, Cancel%>" CssClass="btn btn-sm btn-warning" />
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
                        <asp:Label ID="Label6" runat="server" Text='<%# Container.DisplayIndex+1 %>' />
                    </td>
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
                    <%--<td>
                        <asp:Label ID="GEIDLabel" runat="server" Text='<%# Eval("CustName") %>' />
                    </td>--%>
                    <td>
                        <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("CustTel") %>' />
                    </td>
                  
                 
                     <%--<td>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("AreaDesc") %>' />
                    </td>--%>
                     <td>
                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("Name") %>' />
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
                                <asp:LinkButton ID="LinkButton10" runat="server" CommandArgument="CardName" CommandName="Sort" Text="<%$ Resources:DefaultResource, RowSerial%>" />
                            </th>
                            <th class ="text-center">
                                <asp:LinkButton ID="LinkButton8" runat="server" CommandArgument="CardName" CommandName="Sort" Text="<%$ Resources:DefaultResource, Date%>" />
                            </th>
                            <th class ="text-center">
                                <asp:LinkButton ID="LinkButton7" runat="server" CommandArgument="CardName" CommandName="Sort" Text="<%$ Resources:DefaultResource, TimeDay%>" />
                            </th>
                            <th class ="text-center">
                                <asp:LinkButton ID="LinkButton6" runat="server" CommandArgument="CardName" CommandName="Sort" Text="<%$ Resources:DefaultResource, Reply%>" />
                            </th>
                           <%-- <th class ="text-center">
                                <asp:LinkButton ID="MagazineTitleLinkButton" runat="server" CommandArgument="CardName" CommandName="Sort" Text="<%$ Resources:DefaultResource, CardName%>" />
                            </th>--%>
                            <th class ="text-center">
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument="CardName" CommandName="Sort" Text="<%$ Resources:DefaultResource, PhoneNo%>" />
                            </th>
                            
                           
                                                      
                            <%-- <th class ="text-center">
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument="BRANCHNAME" CommandName="Sort" Text="<%$ Resources:DefaultResource, StudentArea%>" />
                            </th>--%>
                            
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
                            <td colspan="8">
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
          
 

                           
                            <!-- Basic Form Elements Block -->
            
        </div>                  

                           
          
 

                           
        <asp:ObjectDataSource ID="ObjectDataSourceCustomerCalls" runat="server" SelectMethod="Read" TypeName="BOL.Sch_customersCalls" DeleteMethod="DML" InsertMethod="DML" UpdateMethod="DML">
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
                <asp:Parameter DefaultValue="3" Name="ActionCode" Type="String" />
                <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:Parameter Name="CustId" Type="Int64" DefaultValue="" />
                <asp:Parameter Name="AreaId" Type="Int64" />
                <asp:Parameter Name="CallId" Type="Int64" />
                <asp:ControlParameter ControlID="DropDownListReplyId" DefaultValue="" Name="RelpyId" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="DropDownListEmp" Name="UserId" PropertyName="SelectedValue" Type="Int64" />
                <asp:ControlParameter ControlID="StartDateTextBox" Name="StartDate" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="EndDateTextBox" Name="EndDate" PropertyName="Text" Type="String" />
                <asp:Parameter Name="BranchId" Type="Int64" />
                <asp:ControlParameter ControlID="SearchTextBox" Name="SearchText" PropertyName="Text" Type="String" />
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

        
          
 

                           
        <asp:ObjectDataSource ID="ObjectDataSourceCustomerReply" runat="server" SelectMethod="Read" TypeName="BOL.Sch_customerReply" OldValuesParameterFormatString="original_{0}" UpdateMethod="Read">
            <SelectParameters>
                <asp:Parameter DefaultValue="2" Name="ActionCode" Type="String" />

                <asp:Parameter Name="Id" Type="Int64" />
                <asp:SessionParameter SessionField="OrgId" Name="OrgId" Type="Int64"></asp:SessionParameter>

                <asp:Parameter Name="BranchId" Type="Int64"></asp:Parameter>
                <asp:Parameter Name="SearchText" Type="String"></asp:Parameter>
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="ActionCode" Type="String" />
                <asp:Parameter Name="Id" Type="Int64" />
                <asp:Parameter Name="OrgId" Type="Int64" />
                <asp:Parameter Name="BranchId" Type="Int64" />
                <asp:Parameter Name="SearchText" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>

                           
                    <asp:ObjectDataSource ID="UsersDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Read" TypeName="BOL.Users">
        <SelectParameters>
        <asp:Parameter DefaultValue="2" Name="ActionCode" Type="String" />
        <asp:Parameter Name="UserID" Type="Int32" />
    <asp:Parameter Name="UserName" Type="String"></asp:Parameter>

    <asp:Parameter Name="Password" Type="String" />
       <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
        <asp:Parameter Name="SearchText" Type="String" />
        </SelectParameters></asp:ObjectDataSource>

                           
        <br />
                           
                           
    <asp:TextBox ID="txtOrgId" runat="server" 
        Visible="False" ></asp:TextBox>

        <br />

    <asp:TextBox ID="txtRemain" runat="server" Visible ="false"  ></asp:TextBox>

    </div>
        
</div>
      <script type="text/javascript">

      function ShowProductName(RId)
    {
        /*alert(prodId);*/

          var txtPaymentValue = document.getElementById('ContentPlaceHolder1_SchPayRecitesUC_lv_txtPaymentValue_' + RId);
          var txtInvRemain = document.getElementById('ContentPlaceHolder1_SchPayRecitesUC_lv_txtInvRemain_' + RId);
          var txtInvPayment = document.getElementById('ContentPlaceHolder1_SchPayRecitesUC_lv_txtInvPayment_' + RId);
          var txtInvTotalNet = document.getElementById('ContentPlaceHolder1_SchPayRecitesUC_lv_txtInvTotalNet_' + RId);

          var InvRemain = 0;
          if (txtInvRemain != null)
          {
              InvRemain = txtInvRemain.value;
          }
        if (txtPaymentValue != null && txtInvTotalNet != null)
        {

            if (txtPaymentValue.value > txtInvTotalNet.value)
            {
                return false;
            }
                     
        }
        if (txtPaymentValue != null && InvRemain > 0) {
        {
            if (txtPaymentValue.value > InvRemain) {
                return false;
            }
        }
          
       /* alert('product name is ' + txtTotalPrice.value);*/

        return false;
          }
      </script>