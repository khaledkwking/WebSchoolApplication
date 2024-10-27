<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Sch_StudentsTestAdd.ascx.cs" Inherits="WebSchool.ADMIN.Controls.School.Sch_StudentsTestAdd" %>

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
    <li> <a href="SchInvoicesDetials.aspx?RFlag=1"><%= Resources.DefaultResource.StudentTests%> </a></li> -
   <li> <%--<a href='javascript:history.go(-1)'>--%>
        <a href="SchInvoicesDetials.aspx?RFlag=1&StudentId=<%=Session["StudentId"].ToString() %>">
       <asp:Label ID="SName" runat="server" Text="--"></asp:Label></a></li>
</ul>
       
<div class="block">
    <!-- Table Styles Title -->
    <div class="block-title">
        <h2><strong><%= Resources.DefaultResource.List%>  </strong> <%= Resources.DefaultResource.StudentTests%> </h2>
        <div class="block-options pull-right">
            <asp:LinkButton ID="NewRecord" runat="server" CssClass="btn btn-sm btn-success" data-toggle="tooltip" title="<%$ Resources:DefaultResource, NewRecord%>"  data-original-title="<%$ Resources:DefaultResource, NewRecord%>" OnClick="NewRecord_Click"> <i class="fa fa-file"></i></asp:LinkButton>
        </div>
    </div>
    <!-- END Table Styles Title -->

    <div class="gallery gallery-widget" data-toggle="lightbox-gallery">
               
       <!-- General Data Block -->                             
        <div class="input-group">
            <asp:TextBox ID="SearchTextBox" runat="server" CssClass="form-control" placeholder="<%$ Resources:DefaultResource, Search%>"></asp:TextBox>
            <span class="input-group-btn">
                
                <asp:LinkButton ID="ClearLinkButton" runat="server" CssClass="btn btn-danger" OnClick="ClearLinkButton_Click"> <i class="hi hi-remove"></i><%= Resources.DefaultResource.ClearSearch%></asp:LinkButton>
               
                <asp:LinkButton ID="SearchLinkButton" runat="server" CssClass="btn btn-primary"> <i class="fa fa-search"></i><%= Resources.DefaultResource.SearchTitle%></asp:LinkButton>

            </span>
        </div>
        <br />
 
        <asp:ListView ID="InvoiceDetView" runat="server" DataKeyNames="InvDetId" DataSourceID="InvoicesDetailsDS" OnItemDataBound="InvoiceDetView_ItemDataBound"   >
     
            <ItemTemplate>
               
                    <div class="row ">
                        <div class="col-md-12">
                            <div class="table-body">
                                <table class="table">
                                     
                                     <tbody>
                                            <tr style="">
                                                <th> <%= Resources.DefaultResource.InvoiceCode%> 
                                                </th>
                                                <td colspan="2">
                                                  
                                                     <asp:label ID="Label9" runat="server"  class="control-label" Text='<%# Bind("InvCode") %>'/>
                                                </td>
                                                <th> <%= Resources.DefaultResource.StudentName%> 
                                                </th>
                                                <td colspan="2">
                                                  
                                                     <asp:label ID="Label11" runat="server"  class="control-label" Text='<%# Bind("StudentName") %>'/>
                                                </td>
                                                <th> <%= Resources.DefaultResource.StudentPeriod%> 
                                                </th>
                                                 <td colspan="2">
                                                  
                                                     <asp:label ID="Label12" runat="server"  class="control-label" Text='<%# Bind("PeriodName") %>'/>
                                                </td>
                                                
                                                <th> <%= Resources.DefaultResource.InvoiceDate%> 
                                                </th>
                                                <td colspan="2">
                                                  
                                                     <asp:label ID="Label10" runat="server"  class="control-label" Text='
                                                         <%#String.Format(new System.Globalization.CultureInfo("ar-KW"), "{0: dd/MMM/yyyy}", Eval("InvDate")) %>'/>
                                                </td>
                                                 <th> 
                                                      <label for="NotesTextBox" class="control-label">
                                                         <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:DefaultResource, SubjectName%>" />
                                                        </label>
                                                </th>
                                                <td colspan="2">

                                                  
                                                     <asp:label ID="Label6" runat="server"  class="control-label" Text='<%# Bind("SubName") %>'/>
                                                </td>

                                                 <th> 
                                                       <label for="NotesTextBox" class=" control-label">
                                                         <asp:Literal ID="Literal19" runat="server" Text="<%$ Resources:DefaultResource, FromDateTitle%>" />
                                                        </label>
                                                    
                                                </th>
                                                <td colspan="2">
                                                  <asp:label ID="Label13" runat="server"  class="control-label" Text='
                                                         <%#String.Format(new System.Globalization.CultureInfo("ar-KW"), "{0: dd/MMM/yyyy}", Eval("StudyStartDate")) %>'/>
                          
                                                </td>
                                                 <th>
                                                     <label for="NotesTextBox" class="control-label">
                                                         <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:DefaultResource, ToDateTitle%>" />
                                                        </label>
                                                   
                                                </th>
                                                <td colspan="2">
               
                                                      <asp:label ID="Label14" runat="server"  class="control-label" Text='
                                                         <%#String.Format(new System.Globalization.CultureInfo("ar-KW"), "{0: dd/MMM/yyyy}", Eval("StudyEndDate")) %>'/>
                          
                                                </td>
                                                
                                               
                                                 
                                                
                                            </tr>
                                     </tbody> 
                                 </table>
                              </div>
                            </div>
                        </div>

            </ItemTemplate>
         <LayoutTemplate>
                    <div id="itemPlaceholder" runat="server">
                    </div>
          </LayoutTemplate>
        </asp:ListView>
        <br />
    <div id="ErrorDiv" runat="server"></div>
        <asp:ListView ID="lv" runat="server" DataKeyNames="Id" OnItemCommand="lv_ItemCommand" OnItemDataBound="lv_ItemDataBound" DataSourceID="Student_TestsDS">
            <EditItemTemplate>
               <tr>
                    <td colspan="12">
                        <div class="col-md-12 col-xs-12">
                            <!-- Basic Form Elements Block -->
                            <div class="block">
                                <!-- Basic Form Elements Title -->
                                <div class="block-title">
                                    <h2><strong> <%= Resources.DefaultResource.StudentTests%></strong></h2>
                                </div>
                                <!-- END Form Elements Title -->
                                <!-- Basic Form Elements Content -->
                                <div class="form-horizontal form-bordered">

                                     <%--<asp:CheckBox ID="CheckBoxNotifyFlag" runat="server" Checked='<%# Bind("NotifyFlag") %>' Visible="false" />--%>
                                        <asp:TextBox ID="TextBoxInvId" runat="server" Text='<%# Bind("InvId") %>'   CssClass="form-control " Visible="false"  />
                                     <asp:TextBox ID="TextBoxStudentId" runat="server" Text='<%# Bind("StudentId") %>'   CssClass="form-control " Visible="false"  />
                                    <%--<asp:TextBox ID="TextBoxInvDetId" runat="server" Text='<%# Bind("InvDetId") %>'   CssClass="form-control " Visible="false"  />--%>
                                    <asp:TextBox ID="TextBoxSubjectId" runat="server" Text='<%# Bind("SubId") %>'   CssClass="form-control " Visible="false"  />
                            <!--begin::Form-->
                             <div class="form-group">
                                       
                                        <label for="ddlSubjects" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:DefaultResource, SubjectName%>" />
                                        </label>
                                        <div class="col-md-4">
                                            <asp:DropDownList ID="ddlSubjects" runat="server" class="select-chosen" data-placeholder="<%$ Resources:DefaultResource, teacherName%>"
                                                DataSourceID="InvoicesDetailsSubjectsDS" DataTextField="SubName" DataValueField="SubjectId" Text='<%# Bind("SubId") %>'> 
                                                <asp:ListItem Text="<%$ Resources:DefaultResource, SubjectName%>" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPeriod" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="ddlSubjects" ValidationGroup="DML" CssClass="label label-warning">
                                            </asp:RequiredFieldValidator>
                                      </div>
                                        <label for="lblDate" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:DefaultResource, TestDate%>" />
                                        </label>
                                        <div class="col-md-4">
                                             
                                           <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("TestDate","{0: dd/MM/yyyy}") %>'   CssClass="form-control  input-datepicker" placeholder="<%$ Resources:DefaultResource, Date%>"  data-date-format="dd/mm/yyyy" AutoComplete="Off" />
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidatorDate" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="DateTextBox" ValidationGroup="DML" CssClass="label label-warning">
                                            </asp:RequiredFieldValidator>
                                           </div>
                                       
                                    </div>
                                   <div class="form-group">
                                  
                                       
                                            <%--<legend><i class="fa fa-angle-right"></i> Timepickers</legend>--%>
                                      
                                      

                                      <label for="txtMaxGrade" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal19" runat="server" Text="<%$ Resources:DefaultResource, MaxGrade%>" />
                                        </label>
                                        <div class="col-md-4">
                                          <asp:TextBox ID="txtHour" runat="server" CssClass="form-control" Text='<%# Bind("MaxGrade") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, SubjectHours%>"  />
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtHour" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="txtHour" ValidationGroup="DML" CssClass="label label-warning">
                                            </asp:RequiredFieldValidator>
                                           <%-- <asp:CompareValidator ID="CompareValidatorHour" runat="server"  Operator="LessThanEqual"
                                                ErrorMessage="<%$ Resources:DefaultResource, RemainValidate%>" Display="Dynamic"
                                                ValidationGroup="DML" CssClass="label label-warning"
                                                ControlToValidate="txtHour" ControlToCompare="ItemRemainHours" Type="Double" />--%>
                                            <asp:RangeValidator ID="RangeValidator1" runat="server" ValidationGroup="DML" CssClass="label label-warning"
                                                 ControlToValidate="txtHour"
                                                ErrorMessage="<%$ Resources:DefaultResource, HourRangeValidate%>" MinimumValue="0" MaximumValue="100" Type="Double"></asp:RangeValidator>

                                        </div>
                                  
                                       <label for="txtGrade" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:DefaultResource, Grade%>" />
                                        </label>
                                        <div class="col-md-4">
                                          <asp:TextBox ID="txtGrade" runat="server" CssClass="form-control" Text='<%# Bind("Grade") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, SubjectHours%>"  />
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="txtGrade" ValidationGroup="DML" CssClass="label label-warning">
                                            </asp:RequiredFieldValidator>
                                           <%-- <asp:CompareValidator ID="CompareValidatorHour" runat="server"  Operator="LessThanEqual"
                                                ErrorMessage="<%$ Resources:DefaultResource, RemainValidate%>" Display="Dynamic"
                                                ValidationGroup="DML" CssClass="label label-warning"
                                                ControlToValidate="txtHour" ControlToCompare="ItemRemainHours" Type="Double" />--%>
                                            <asp:RangeValidator ID="RangeValidator2" runat="server" ValidationGroup="DML" CssClass="label label-warning"
                                                 ControlToValidate="txtGrade"
                                                ErrorMessage="<%$ Resources:DefaultResource, HourRangeValidate%>" MinimumValue="0" MaximumValue="100" Type="Double"></asp:RangeValidator>

                                        </div>
                                       
                                        </div>
                                      <div class="form-group">
                                           <label for="txtxNotes" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:DefaultResource, CardNotes%>" />
                                        </label>
                                        <div class="col-md-10">
                                          <asp:TextBox ID="txtxNotes" runat="server" CssClass="form-control" Text='<%# Bind("Notes") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, CardNotes%>" TextMode="MultiLine" Rows="5"/>
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
                    <td colspan="12">
                        <div class="col-md-12">
                            <!-- Basic Form Elements Block -->
                            <div class="block">
                                <!-- Basic Form Elements Title -->
                                <div class="block-title">
                                    <h2><strong><%= Resources.DefaultResource.List %></strong> <%= Resources.DefaultResource.StudentTests %></h2>
                                </div>
                                <!-- END Form Elements Title -->
                                <!-- Basic Form Elements Content -->

                                <div class="form-horizontal form-bordered">
                                                            <!--begin::Form-->
                             <!--begin::Form-->
                             <div class="form-group">
                                       
                                        <label for="ddlSubjects" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:DefaultResource, SubjectName%>" />
                                        </label>
                                        <div class="col-md-4">
                                            <asp:DropDownList ID="ddlSubjects" runat="server" class="select-chosen" data-placeholder="<%$ Resources:DefaultResource, teacherName%>"
                                                DataSourceID="InvoicesDetailsSubjectsDS" DataTextField="SubName" DataValueField="SubjectId" Text='<%# Bind("SubId") %>'> 
                                                <asp:ListItem Text="<%$ Resources:DefaultResource, SubjectName%>" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPeriod" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="ddlSubjects" ValidationGroup="DML" CssClass="label label-warning">
                                            </asp:RequiredFieldValidator>
                                      </div>
                                        <label for="lblDate" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:DefaultResource, TestDate%>" />
                                        </label>
                                        <div class="col-md-4">
                                             
                                           <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("TestDate","{0: dd/MM/yyyy}") %>'   CssClass="form-control  input-datepicker" placeholder="<%$ Resources:DefaultResource, Date%>"  data-date-format="dd/mm/yyyy" AutoComplete="Off" />
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidatorDate" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="DateTextBox" ValidationGroup="DML" CssClass="label label-warning">
                                            </asp:RequiredFieldValidator>
                                           </div>
                                       
                                    </div>
                                   <div class="form-group">
                                  
                                       
                                            <%--<legend><i class="fa fa-angle-right"></i> Timepickers</legend>--%>
                                      
                                      

                                      <label for="txtMaxGrade" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal19" runat="server" Text="<%$ Resources:DefaultResource, MaxGrade%>" />
                                        </label>
                                        <div class="col-md-4">
                                          <asp:TextBox ID="txtHour" runat="server" CssClass="form-control" Text='<%# Bind("MaxGrade") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, SubjectHours%>"  />
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtHour" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="txtHour" ValidationGroup="DML" CssClass="label label-warning">
                                            </asp:RequiredFieldValidator>
                                           <%-- <asp:CompareValidator ID="CompareValidatorHour" runat="server"  Operator="LessThanEqual"
                                                ErrorMessage="<%$ Resources:DefaultResource, RemainValidate%>" Display="Dynamic"
                                                ValidationGroup="DML" CssClass="label label-warning"
                                                ControlToValidate="txtHour" ControlToCompare="ItemRemainHours" Type="Double" />--%>
                                            <asp:RangeValidator ID="RangeValidator1" runat="server" ValidationGroup="DML" CssClass="label label-warning"
                                                 ControlToValidate="txtHour"
                                                ErrorMessage="<%$ Resources:DefaultResource, HourRangeValidate%>" MinimumValue="0" MaximumValue="100" Type="Double"></asp:RangeValidator>

                                        </div>
                                  
                                       <label for="txtGrade" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:DefaultResource, Grade%>" />
                                        </label>
                                        <div class="col-md-4">
                                          <asp:TextBox ID="txtGrade" runat="server" CssClass="form-control" Text='<%# Bind("Grade") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, SubjectHours%>"  />
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="txtGrade" ValidationGroup="DML" CssClass="label label-warning">
                                            </asp:RequiredFieldValidator>
                                           <%-- <asp:CompareValidator ID="CompareValidatorHour" runat="server"  Operator="LessThanEqual"
                                                ErrorMessage="<%$ Resources:DefaultResource, RemainValidate%>" Display="Dynamic"
                                                ValidationGroup="DML" CssClass="label label-warning"
                                                ControlToValidate="txtHour" ControlToCompare="ItemRemainHours" Type="Double" />--%>
                                            <asp:RangeValidator ID="RangeValidator2" runat="server" ValidationGroup="DML" CssClass="label label-warning"
                                                 ControlToValidate="txtGrade"
                                                ErrorMessage="<%$ Resources:DefaultResource, HourRangeValidate%>" MinimumValue="0" MaximumValue="100" Type="Double"></asp:RangeValidator>

                                        </div>
                                       
                                        </div>
                                      <div class="form-group">
                                           <label for="txtxNotes" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:DefaultResource, CardNotes%>" />
                                        </label>
                                        <div class="col-md-10">
                                          <asp:TextBox ID="txtxNotes" runat="server" CssClass="form-control" Text='<%# Bind("Notes") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, CardNotes%>" TextMode="MultiLine" Rows="5"/>
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
                    <asp:TextBox ID="TextBoxSubjectId" runat="server" Text='<%# Bind("SubId") %>'   CssClass="form-control " Visible="false"  />
                      <td>
                        <asp:Label ID="Label8" runat="server" Text='<%# Container.DisplayIndex+1%>' />
                    </td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("StudentName") %>' />
                    </td>
                     <td>
                        <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("PeriodName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="GEIDLabel" runat="server" Text='<%# Eval("SubName") %>' />
                    </td>
                   
                    <td>
                   
                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("TestDate","{0: dd/MM/yyyy}") %>' />
                    </td>
                  
                     <td>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Grade","{0:N2}") %>' />
                    </td>
                    
                     <td>
                        <asp:Label ID="Label15" runat="server" Text='<%# Eval("MaxGrade","{0:N2}") %>' />
                    </td>
                                        
                   
                   <td class="text-center block-options">
                     
                         <asp:LinkButton ID="EditLinkButton" runat="server" CommandName="Edit" Text="" data-toggle="tooltip" title="<%$ Resources:DefaultResource, Edite%>" CssClass="btn btn-sm btn-default" data-original-title="<%$ Resources:DefaultResource, Edite%>">
                          
                                <i class="fa fa-pencil"></i>
                        </asp:LinkButton>
                       
                      <%--  <% if (Session["RoleID"].ToString() != "7")
                        { %>--%>
                            <asp:LinkButton ID="DeleteLinkButton" runat="server" CommandName="Delete" Text="" data-toggle="tooltip" title="<%$ Resources:DefaultResource, Delete%>" CssClass="btn btn-sm btn-danger" data-original-title="<%$ Resources:DefaultResource, Delete%>"  OnClientClick="javascript:if(!confirm('هل انت متأكد من حذف هذا السجل؟')){return false;}">
                                    <i class="fa fa-times"></i>
                            </asp:LinkButton>

                      <%--   <a data-toggle="tooltip" title="<%= Resources.DefaultResource.SchoolPeriods%>"   class="btn btn-sm btn-warning" data-original-title="<%= Resources.DefaultResource.SchoolPeriods%>" href="Periods.aspx?@StageId=<%# Eval("StageId")%>">
                            <i class="fa fa-minus-circle"></i>
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
                                <asp:LinkButton ID="LinkButton7" runat="server" CommandArgument="Name" CommandName="Sort" Text="<%$ Resources:DefaultResource, RowSerial%>" />
                            </th> 
                              <th class ="text-center">
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument="StudentName" CommandName="Sort" Text="<%$ Resources:DefaultResource, StudentName%>" />
                            </th> 
                            
                            <th class ="text-center">
                                <asp:LinkButton ID="TitleLinkButton" runat="server" CommandArgument="PeriodName" CommandName="Sort" Text="<%$ Resources:DefaultResource, StudentPeriod%>" />
                            </th>
                             <th class ="text-center">
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument="SubName" CommandName="Sort" Text="<%$ Resources:DefaultResource, SubjectName%>" />
                            </th>                    

                             <th class ="text-center">
                                <asp:LinkButton ID="LinkButton6" runat="server" CommandArgument="TestDate" CommandName="Sort" Text="<%$ Resources:DefaultResource, TestDate%>" />
                            </th>
                            <th class ="text-center">
                                <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument="Grade" CommandName="Sort" Text="<%$ Resources:DefaultResource, Grade%>" />
                            </th>
                             <th class ="text-center">
                                <asp:LinkButton ID="LinkButton4" runat="server" CommandArgument="MaxGrade" CommandName="Sort" Text="<%$ Resources:DefaultResource, MaxGrade%>" />
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
                            <td colspan="12">
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
                           
                           
        <asp:ObjectDataSource ID="Student_TestsDS" runat="server"  SelectMethod="Read" TypeName="BOL.Student_Tests" DeleteMethod="DML" InsertMethod="DML" UpdateMethod="DML"  ><DeleteParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="3" />
            <asp:Parameter Name="Id" Type="Int64" />
            <asp:Parameter Name="StudentId" Type="Int64" />
            <asp:Parameter Name="SubId" Type="Int64" />
            <asp:Parameter Name="TestDate" Type="String" />
            <asp:Parameter Name="Notes" Type="String" />
            <asp:Parameter Name="Grade" Type="Decimal" />
            <asp:Parameter Name="MaxGrade" Type="Decimal" />
<asp:Parameter Name="WeekId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="InvId" Type="Int64" />
            <asp:Parameter Name="OrgId" Type="Int64" />
            <asp:Parameter Name="CreatedBy" Type="Int32" />
            <asp:Parameter Name="UpdateBy" Type="Int32" />
            <asp:SessionParameter DefaultValue="" Name="DeletedBy" SessionField="UserId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ActionCode" Type="String" DefaultValue="1" />
                <asp:Parameter Name="Id" Type="Int64" />
                <asp:QueryStringParameter DefaultValue="" Name="StudentId" QueryStringField="StudentId" Type="Int64" />
                <asp:Parameter Name="SubId" Type="Int64" />
<asp:Parameter Name="TestDate" Type="String"></asp:Parameter>
                <asp:Parameter Name="Notes" Type="String" />
                <asp:Parameter Name="Grade" Type="Decimal" />
                <asp:Parameter Name="MaxGrade" Type="Decimal" />
<asp:Parameter Name="WeekId" Type="Int32"></asp:Parameter>
                <asp:QueryStringParameter DefaultValue="" Name="InvId" QueryStringField="InvId" Type="Int64" />
                <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:SessionParameter Name="CreatedBy" SessionField="UserId" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="UpdateBy" SessionField="UserId" Type="Int32" />
                <asp:Parameter Name="DeletedBy" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" />
                <asp:Parameter Name="StartDate" Type="String" />
                <asp:Parameter Name="EndDate" Type="String" />
                <asp:Parameter Name="Id" Type="Int64" />
                <asp:QueryStringParameter DefaultValue="" Name="InvId" QueryStringField="InvId" Type="Int64" />
<asp:Parameter Name="InvType" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="SubId" Type="Int64" />
                <asp:SessionParameter DefaultValue="" Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:Parameter Name="BranchId" Type="Int64" />
                <asp:Parameter Name="UserId" Type="Int32" />
                <asp:Parameter Name="StudenId" Type="Int64" />
                <asp:Parameter Name="PeriodId" Type="Int64" DefaultValue="" />
                <asp:Parameter Name="SexId" Type="Int32" />
                <asp:Parameter Name="SearchText" Type="String" />
            </SelectParameters><UpdateParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="2" /><asp:Parameter Name="Id" Type="Int64" />
                <asp:Parameter Name="StudentId" Type="Int64" />
                <asp:Parameter Name="SubId" Type="Int64" />
                <asp:Parameter Name="TestDate" Type="String" />
                <asp:Parameter Name="Notes" Type="String" />
                <asp:Parameter Name="Grade" Type="Decimal" />
                <asp:Parameter Name="MaxGrade" Type="Decimal" />
<asp:Parameter Name="WeekId" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="InvId" Type="Int64" />
                <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:Parameter Name="CreatedBy" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="UpdateBy" SessionField="UserId" Type="Int32" />
                <asp:Parameter Name="DeletedBy" Type="Int32" />
            </UpdateParameters></asp:ObjectDataSource>

    <asp:TextBox ID="txtOrgId" runat="server" 
        Visible="False" ></asp:TextBox>

    </div>

</div>
                                </div> 
           </div> 
     </div>

    <asp:HiddenField ID="StageIdHiddenField" runat="server" />


      
 


                                 

       
                                
                            <asp:ObjectDataSource ID="InvoicesDetailsDS" runat="server"  SelectMethod="Read" TypeName="BOL.Sch_InvoicesDetails" DeleteMethod="DML" InsertMethod="DML" UpdateMethod="DML" OldValuesParameterFormatString="original_{0}"><DeleteParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="3" /><asp:Parameter Name="InvDetId" Type="Int64" /><asp:Parameter Name="InvId" Type="Int64" /><asp:Parameter Name="SubjectId" Type="Int64" />
                                <asp:Parameter Name="MonthNum" Type="Decimal" /><asp:Parameter Name="HourNumPerMonth" Type="Decimal" />
    <asp:Parameter Name="HourPrice" Type="Decimal" />
                                <asp:Parameter Name="TotalPrice" Type="Decimal" />
    <asp:Parameter Name="InvType" Type="Int16" />
    <asp:Parameter Name="RemainHours" Type="Decimal" />
    <asp:Parameter Name="TeacherId" Type="Int64" /><asp:Parameter Name="CreatedBy" Type="Int32" /><asp:SessionParameter Name="UpdateBy" SessionField="UserId" Type="Int32" /><asp:SessionParameter DefaultValue="" Name="DeletedBy" SessionField="UserId" Type="Int32" /></DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ActionCode" Type="String" DefaultValue="1" /><asp:Parameter Name="InvDetId" Type="Int64" /><asp:Parameter Name="InvId" Type="Int64" /><asp:Parameter Name="SubjectId" Type="Int64" />
                <asp:Parameter Name="MonthNum" Type="Decimal" /><asp:Parameter Name="HourNumPerMonth" Type="Decimal" />
                <asp:Parameter Name="HourPrice" Type="Decimal" />
                <asp:Parameter Name="TotalPrice" Type="Decimal" />
                <asp:Parameter Name="InvType" Type="Int16" />
                <asp:Parameter Name="RemainHours" Type="Decimal" />
                <asp:Parameter Name="TeacherId" Type="Int64" /><asp:Parameter Name="CreatedBy" Type="Int32" /><asp:Parameter Name="UpdateBy" Type="Int32" /><asp:Parameter Name="DeletedBy" Type="Int32" /></InsertParameters>
            <SelectParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="1" />
                <asp:Parameter Name="StartDate" Type="String" DefaultValue="" />
                <asp:Parameter Name="EndDate" Type="String" />
                <asp:QueryStringParameter Name="InvDetId" QueryStringField="InvDetId" Type="Int64" />
                <asp:Parameter Name="InvId" Type="Int64" /><asp:Parameter Name="InvType" Type="Int32" />
                <asp:Parameter Name="PayementTypeId" Type="Int32" />
                <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" /><asp:Parameter Name="BRANCHId" Type="Int64" /><asp:Parameter Name="UserId" Type="Int32" />
                <asp:Parameter Name="StudenId" Type="Int64" />
                <asp:Parameter Name="GroupId" Type="Int64" />
                <asp:Parameter Name="PeriodId" Type="Int64" />
                <asp:Parameter Name="SubjectId" Type="Int64" />
                <asp:Parameter DefaultValue="" Name="SearchText" Type="String" />
                                </SelectParameters><UpdateParameters><asp:Parameter Name="ActionCode" Type="String" /><asp:Parameter Name="InvDetId" Type="Int64" /><asp:Parameter Name="InvId" Type="Int64" /><asp:Parameter Name="SubjectId" Type="Int64" />
<asp:Parameter Name="MonthNum" Type="Decimal"></asp:Parameter>
<asp:Parameter Name="HourNumPerMonth" Type="Decimal"></asp:Parameter>
<asp:Parameter Name="HourPrice" Type="Decimal"></asp:Parameter>
                                    <asp:Parameter Name="TotalPrice" Type="Decimal" /><asp:Parameter Name="InvType" Type="Int16" /><asp:Parameter Name="RemainHours" Type="Decimal" />
                                    <asp:Parameter Name="TeacherId" Type="Int64" />
                                    <asp:Parameter Name="CreatedBy" Type="Int32" /><asp:Parameter Name="UpdateBy" Type="Int32" />
                                    <asp:Parameter Name="DeletedBy" Type="Int32" /></UpdateParameters></asp:ObjectDataSource>

    


    <p>


      
 


                                 

       
                                
                            <asp:ObjectDataSource ID="InvoicesDetailsSubjectsDS" runat="server"  SelectMethod="Read" TypeName="BOL.Sch_InvoicesDetails" DeleteMethod="DML" InsertMethod="DML" UpdateMethod="DML"><DeleteParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="3" /><asp:Parameter Name="InvDetId" Type="Int64" /><asp:Parameter Name="InvId" Type="Int64" /><asp:Parameter Name="SubjectId" Type="Int64" />
                                <asp:Parameter Name="MonthNum" Type="Decimal" /><asp:Parameter Name="HourNumPerMonth" Type="Decimal" />
    <asp:Parameter Name="HourPrice" Type="Decimal" />
                                <asp:Parameter Name="TotalPrice" Type="Decimal" />
    <asp:Parameter Name="InvType" Type="Int16" />
    <asp:Parameter Name="RemainHours" Type="Decimal" />
    <asp:Parameter Name="TeacherId" Type="Int64" /><asp:Parameter Name="CreatedBy" Type="Int32" /><asp:SessionParameter Name="UpdateBy" SessionField="UserId" Type="Int32" /><asp:SessionParameter DefaultValue="" Name="DeletedBy" SessionField="UserId" Type="Int32" /></DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ActionCode" Type="String" DefaultValue="1" /><asp:Parameter Name="InvDetId" Type="Int64" /><asp:Parameter Name="InvId" Type="Int64" /><asp:Parameter Name="SubjectId" Type="Int64" />
                <asp:Parameter Name="MonthNum" Type="Decimal" /><asp:Parameter Name="HourNumPerMonth" Type="Decimal" />
                <asp:Parameter Name="HourPrice" Type="Decimal" />
                <asp:Parameter Name="TotalPrice" Type="Decimal" />
                <asp:Parameter Name="InvType" Type="Int16" />
                <asp:Parameter Name="RemainHours" Type="Decimal" />
                <asp:Parameter Name="TeacherId" Type="Int64" /><asp:Parameter Name="CreatedBy" Type="Int32" /><asp:Parameter Name="UpdateBy" Type="Int32" /><asp:Parameter Name="DeletedBy" Type="Int32" /></InsertParameters>
            <SelectParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="1" />
                <asp:Parameter Name="StartDate" Type="String" DefaultValue="" />
                <asp:Parameter Name="EndDate" Type="String" />
                <asp:Parameter Name="InvDetId" Type="Int64" DefaultValue="" />
                <asp:QueryStringParameter Name="InvId" QueryStringField="InvId" Type="Int64" />
                <asp:Parameter Name="InvType" Type="Int32" />
                <asp:Parameter Name="PayementTypeId" Type="Int32" />
                <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" /><asp:Parameter Name="BRANCHId" Type="Int64" /><asp:Parameter Name="UserId" Type="Int32" />
                <asp:Parameter Name="StudenId" Type="Int64" />
                <asp:Parameter Name="GroupId" Type="Int64" />
                <asp:Parameter Name="PeriodId" Type="Int64" />
                <asp:Parameter Name="SubjectId" Type="Int64" />
                <asp:Parameter DefaultValue="" Name="SearchText" Type="String" />
                                </SelectParameters><UpdateParameters><asp:Parameter Name="ActionCode" Type="String" /><asp:Parameter Name="InvDetId" Type="Int64" /><asp:Parameter Name="InvId" Type="Int64" /><asp:Parameter Name="SubjectId" Type="Int64" />
<asp:Parameter Name="MonthNum" Type="Decimal"></asp:Parameter>
<asp:Parameter Name="HourNumPerMonth" Type="Decimal"></asp:Parameter>
<asp:Parameter Name="HourPrice" Type="Decimal"></asp:Parameter>
                                    <asp:Parameter Name="TotalPrice" Type="Decimal" /><asp:Parameter Name="InvType" Type="Int16" /><asp:Parameter Name="RemainHours" Type="Decimal" />
                                    <asp:Parameter Name="TeacherId" Type="Int64" />
                                    <asp:Parameter Name="CreatedBy" Type="Int32" /><asp:Parameter Name="UpdateBy" Type="Int32" />
                                    <asp:Parameter Name="DeletedBy" Type="Int32" /></UpdateParameters></asp:ObjectDataSource>

    


    <asp:TextBox ID="txtStudentId" runat="server" 
        Visible="False" ></asp:TextBox>

    <asp:TextBox ID="txtRemainHours" runat="server" 
        Visible="False" ></asp:TextBox>

    <asp:TextBox ID="txtResevedHours" runat="server" 
        Visible="False" ></asp:TextBox>

        <asp:HiddenField ID="txtActualRemainHours" runat="server" />

    <asp:TextBox ID="txtHourNumPerMonth" runat="server" 
        Visible="False" ></asp:TextBox>

    </p>
<script>
    ShowProductName();
    function ShowProductName() {
     
       /* var txtHourPrice = document.getElementById('ContentPlaceHolder1_SchStudentsIndvAttendanceUC_lv_txtHour_' + prodId);*/
        var ItemRemainHours = document.getElementById('ContentPlaceHolder1_SchStudentsIndvAttendanceUC_lv_ItemRemainHours');
       
        var txtActualRemainHours = document.getElementById('ContentPlaceHolder1_SchStudentsIndvAttendanceUC_txtActualRemainHours');
     /*   alert("gf");*/
        /*alert(txtActualRemainHours.value);*/
        if (txtActualRemainHours != null)
        {
         
            ItemRemainHours.value = txtActualRemainHours.value;
            //var Hour = txtHour.value;
           
            //if (Hour > RemainHours)
            //{
            //    alert("يجب ان يكون عدد الساعات اقل من الساعات المتبيقة");
            //    txtHour.focus();
            //}
          }
       
        return false;
    }

</script>

    


    