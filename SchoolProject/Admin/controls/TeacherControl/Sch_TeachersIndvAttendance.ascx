<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Sch_TeachersIndvAttendance.ascx.cs" Inherits="WebSchool.ADMIN.Controls.TeacherControl.Sch_TeachersIndvAttendance" %>

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
    <li><a href="~/Admin/Main.aspx"><%= Resources.DefaultResource.Main%> </a></li>
    <li> <%= Resources.DefaultResource.TeacherClass%> </li>
</ul>
       
<div class="block">
    <!-- Table Styles Title -->
    <div class="block-title">
        <h2><strong><%= Resources.DefaultResource.List%>  </strong> <%= Resources.DefaultResource.TeacherClass%> </h2>
       
    </div>
    <!-- END Table Styles Title -->

    <div class="gallery gallery-widget" data-toggle="lightbox-gallery">
        <div class="row">
             <div class=" col-md-6">
                 <asp:TextBox ID="StartDateTextBox" runat="server"  CssClass="form-control input-datepicker" placeholder="<%$ Resources:DefaultResource, FromDate%>" data-date-format="dd/mm/yyyy" autocomplete ="off"/>
            </div>
             <div class=" col-md-6">
                 <asp:TextBox ID="EndDateTextBox" runat="server"  CssClass="form-control input-datepicker" placeholder="<%$ Resources:DefaultResource, ToDate%>" data-date-format="dd/mm/yyyy" autocomplete ="off" />
            </div>
           
          </div>
       <!-- General Data Block -->                             
        <div class="input-group">
            <asp:TextBox ID="SearchTextBox" runat="server" CssClass="form-control" placeholder="<%$ Resources:DefaultResource, Search%>"></asp:TextBox>
            <span class="input-group-btn">
                
                <asp:LinkButton ID="ClearLinkButton" runat="server" CssClass="btn btn-danger" OnClick="ClearLinkButton_Click"> <i class="hi hi-remove"></i><%= Resources.DefaultResource.ClearSearch%></asp:LinkButton>
               
                <asp:LinkButton ID="SearchLinkButton" runat="server" CssClass="btn btn-primary"> <i class="fa fa-search"></i><%= Resources.DefaultResource.SearchTitle%></asp:LinkButton>

            </span>
        </div>
        <br />
 
        <br />
    <div id="ErrorDiv" runat="server"></div>
        <asp:ListView ID="lv" runat="server" DataKeyNames="Id" OnItemCommand="lv_ItemCommand" OnItemDataBound="lv_ItemDataBound" DataSourceID="StudentsIndvAttendanceDS">
            <EditItemTemplate>
               <tr>
                    <td colspan="12">
                        <div class="col-md-12 col-xs-12">
                            <!-- Basic Form Elements Block -->
                            <div class="block">
                                <!-- Basic Form Elements Title -->
                                <div class="block-title">
                                    <h2><strong> <%= Resources.DefaultResource.UpdateWorkOrder%></strong></h2>
                                </div>
                                <!-- END Form Elements Title -->
                                <!-- Basic Form Elements Content -->
                                <div class="form-horizontal form-bordered">
                                     <asp:CheckBox ID="CheckBoxExceptionFlag" runat="server" Checked='<%# Bind("ExceptionFlag") %>' Visible="false"  />
                                     <%--<asp:CheckBox ID="CheckBoxNotifyFlag" runat="server" Checked='<%# Bind("NotifyFlag") %>' Visible="false" />--%>
                                     <asp:TextBox ID="TextBoxTeacherValue" runat="server" Text='<%# Bind("TeacherValue") %>'   CssClass="form-control " Visible="false"  />
                                     <asp:TextBox ID="TextBoxStudentId" runat="server" Text='<%# Bind("StudentId") %>'   CssClass="form-control " Visible="false"  />
                                    <asp:TextBox ID="TextBoxInvDetId" runat="server" Text='<%# Bind("InvDetId") %>'   CssClass="form-control " Visible="false"  />
                                    <asp:TextBox ID="TextBoxSubjectId" runat="server" Text='<%# Bind("SubjectId") %>'   CssClass="form-control " Visible="false"  />
                            <!--begin::Form-->
                             <div class="form-group">
                                       
                                        <label for="ddlTeachers" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:DefaultResource, teacherName%>" />
                                        </label>
                                        <div class="col-md-4">
                                            <asp:DropDownList ID="ddlTeachers" runat="server" class="select-chosen" data-placeholder="<%$ Resources:DefaultResource, teacherName%>"
                                                DataSourceID="TeachersDS" DataTextField="Name" DataValueField="TeacherId" Text='<%# Bind("TeacherId") %>' > 
                                                <asp:ListItem Text="<%$ Resources:DefaultResource, StageName%>" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPeriod" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="ddlTeachers" ValidationGroup="DML" CssClass="label label-warning">
                                            </asp:RequiredFieldValidator>
                                      </div>
                                        <label for="lblDate" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:DefaultResource, Date%>" />
                                        </label>
                                        <div class="col-md-4">
                                             
                                           <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("DayDate","{0: dd/MM/yyyy}") %>'   CssClass="form-control  input-datepicker" placeholder="<%$ Resources:DefaultResource, Date%>"  data-date-format="dd/mm/yyyy" AutoComplete="Off" />
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidatorDate" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="DateTextBox" ValidationGroup="DML" CssClass="label label-warning">
                                            </asp:RequiredFieldValidator>
                                           </div>
                                       
                                    </div>
                                   <div class="form-group">
                                   <label for="lblDayTime" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:DefaultResource, TimeTitle%>" />
                                        </label>
                                       
                                            <%--<legend><i class="fa fa-angle-right"></i> Timepickers</legend>--%>
                                        <div class="col-md-3">
                                             <div class="input-group bootstrap-timepicker">
                                             <asp:TextBox ID="txtDayTime" runat="server" Text='<%# Bind("DayTime","{0: hh:mm tt}") %>'   CssClass="form-control input-timepicker"   AutoComplete="Off" />
                                                  <span class="input-group-btn">
                                                       <a href="javascript:void(0)" class="btn btn-primary"><i class="fa fa-clock-o"></i></a>
                                                </span>
                                              </div>
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidatorDayTime" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="txtDayTime" ValidationGroup="DML" CssClass="label label-warning">
                                            </asp:RequiredFieldValidator>
                                           </div>
                                      

                                      <label for="txtHour" class="col-md-1 control-label">
                                            <asp:Literal ID="Literal19" runat="server" Text="<%$ Resources:DefaultResource, SubjectHours%>" />
                                        </label>
                                        <div class="col-md-2">
                                          <asp:TextBox ID="txtHour" runat="server" CssClass="form-control" Text='<%# Bind("Hours") %>' 
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
                                                ErrorMessage="<%$ Resources:DefaultResource, HourRangeValidate%>" MinimumValue="1" MaximumValue="100" Type="Double"></asp:RangeValidator>

                                        </div>
                                  
                                       <label class="col-md-1 control-label" for="example-text-input"><%= Resources.DefaultResource.AttendenceFlag%></label>
                                          <div class="col-md-1">
                                            <label class="switch switch-success">

                                                <asp:CheckBox ID="AttFlagCheckBox" runat="server" Checked='<%# Bind("AttFlag") %>' /><span></span>
                                            </label>
                                        </div>
                                          <label class="col-md-1 control-label" for="example-text-input"><%= Resources.DefaultResource.RequestTeacherAtt%></label>
                                          <div class="col-md-1">
                                            <label class="switch switch-success">

                                                <asp:CheckBox ID="NotifyFlagCheckBox" runat="server" Checked='<%# Bind("NotifyFlag") %>' /><span></span>
                                            </label>
                                        </div>
                                        </div>
                                      <div class="form-group">
                                           <label for="txtxNotes" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:DefaultResource, CardNotes%>" />
                                        </label>
                                        <div class="col-md-10">
                                          <asp:TextBox ID="txtxNotes" runat="server" CssClass="form-control" Text='<%# Bind("Notes") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, CardNotes%>"/>
                                        </div>
                                          </div>
                                      <div class="form-group">

                                   <label for="NotesTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:DefaultResource, Location%>" />
                                        </label>
                                       
                                           <div class="col-md-10">
                                          <asp:TextBox ID="txtStudentAddress" runat="server" CssClass="form-control" Text='<%# Bind("StudentAddress") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, Location%>" TextMode="MultiLine" Rows="5" />
                                       
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
                                    <h2><strong><%= Resources.DefaultResource.List %></strong> <%= Resources.DefaultResource.AddWorkOrder %></h2>
                                </div>
                                <!-- END Form Elements Title -->
                                <!-- Basic Form Elements Content -->

                                <div class="form-horizontal form-bordered">
                                                            <!--begin::Form-->
                             <div class="form-group">
                                       
                                        <label for="ddlTeachers" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:DefaultResource, teacherName%>" />
                                        </label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="ddlTeachers" runat="server" class="select-chosen" data-placeholder="<%$ Resources:DefaultResource, teacherName%>"
                                                DataSourceID="TeachersDS" DataTextField="Name" DataValueField="TeacherId" Text='<%# Bind("TeacherId") %>' > 
                                                <asp:ListItem Text="<%$ Resources:DefaultResource, StageName%>" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPeriod" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="ddlTeachers" ValidationGroup="DML" CssClass="label label-warning">
                                            </asp:RequiredFieldValidator>
                                      </div>
                                        <label for="lblDate" class="col-md-1 control-label">
                                            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:DefaultResource, Date%>" />
                                        </label>
                                        <div class="col-md-2">
                            
                                           <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("DayDate","{0: dd/MM/yyyy}") %>'   CssClass="form-control  input-datepicker" placeholder="<%$ Resources:DefaultResource, Date%>"  data-date-format="dd/mm/yyyy" AutoComplete="Off" />
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidatorDate" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="DateTextBox" ValidationGroup="DML" CssClass="label label-warning">
                                            </asp:RequiredFieldValidator>
                                           </div>
                                       
                                        <label class="col-md-1 control-label" for="example-text-input"><%= Resources.DefaultResource.ReaptAppoint%></label>
                                        <div class="col-md-1">
                                            <label class="switch switch-success">

                                                <asp:CheckBox ID="RepeatChkBox" runat="server" /><span></span>
                                            </label>
                                        </div>
                                  
                                    <label class="col-md-1 control-label" for="example-text-input"><%= Resources.DefaultResource.ReaptedNumber%></label>
                                        <div class="col-md-1">
                                         <asp:TextBox ID="txtReaptedNumber" runat="server" CssClass="form-control"   data-placeholder="<%$ Resources:DefaultResource, ReaptedNumber%>" TextMode="Number"/>
                                        </div>
                                    </div>
                                  <div class="form-group">
                                   <label for="lblDayTime" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:DefaultResource, TimeTitle%>" />
                                        </label>
                                       
                                            <%--<legend><i class="fa fa-angle-right"></i> Timepickers</legend>--%>
                                        <div class="col-md-3">
                                             <div class="input-group bootstrap-timepicker">
                                             <asp:TextBox ID="txtDayTime" runat="server" Text='<%# Bind("DayTime") %>'   CssClass="form-control input-timepicker"   AutoComplete="Off" />
                                                  <span class="input-group-btn">
                                                       <a href="javascript:void(0)" class="btn btn-primary"><i class="fa fa-clock-o"></i></a>
                                                </span>
                                              </div>
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidatorDayTime" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="txtDayTime" ValidationGroup="DML" CssClass="label label-warning">
                                            </asp:RequiredFieldValidator>
                                           </div>
                                      
                                      
                                    
                                      <label for="txtHour" class="col-md-1 control-label">
                                            <asp:Literal ID="Literal19" runat="server" Text="<%$ Resources:DefaultResource, SubjectHours%>" />
                                        </label>
                                        <div class="col-md-2">
                                          <asp:TextBox ID="txtHour" runat="server" CssClass="form-control" Text='<%# Bind("Hours") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, SubjectHours%>" 
                                               onchange=<%# "javascript:"+string.Format("ShowProductName('{0}');",Eval("Id")) %> />

                                             <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtHour" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="txtHour" ValidationGroup="DML" CssClass="label label-warning">
                                            </asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="CompareValidatorHour" runat="server"  Operator="LessThanEqual"
                                                ErrorMessage="<%$ Resources:DefaultResource, RemainValidate%>" Display="Dynamic"
                                                ValidationGroup="DML" CssClass="label label-warning"
                                                ControlToValidate="txtHour" ControlToCompare="ItemRemainHours" Type="Double" />
                                            <asp:RangeValidator ID="RangeValidator1" runat="server" ValidationGroup="DML" CssClass="label label-warning"
                                                 ControlToValidate="txtHour"
                                                ErrorMessage="<%$ Resources:DefaultResource, HourRangeValidate%>" MinimumValue="1" MaximumValue="100" Type="Double"></asp:RangeValidator>
                                        </div>
                                  
                                       <label class="col-md-2 control-label" for="example-text-input">
                                           <%= Resources.DefaultResource.AttendenceFlag%></label>
                                          <div class="col-md-2">
                                            <label class="switch switch-success">

                                                <asp:CheckBox ID="AttFlagCheckBox" runat="server" Checked='<%# Bind("AttFlag") %>' /><span></span>
                                            </label>
                                        </div>
               
                                        </div>
                                
                                      <div class="form-group">
                                           <label for="txtxNotes" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:DefaultResource, CardNotes%>" />
                                        </label>
                                        <div class="col-md-6">
                                          <asp:TextBox ID="txtxNotes" runat="server" CssClass="form-control" Text='<%# Bind("Notes") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, CardNotes%>"/>
                                        </div>
                                         <label for="lblRemainHours" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:DefaultResource, RemainHours%>" />
                                        </label>
                                        <div class="col-md-2" >
                                              <asp:TextBox ID="ItemRemainHours" runat="server" CssClass="form-control" />
                                            
                                        </div>
                                      </div>
                                      <div class="form-group">

                                   <label for="txtStudentAddress" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:DefaultResource, Location%>" />
                                        </label>
                                        <div class="col-md-10">
                                          <asp:TextBox ID="txtStudentAddress" runat="server" CssClass="form-control" Text='<%# Bind("StudentAddress") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, Location%>" TextMode="MultiLine" Rows="5" />
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
                    <asp:TextBox ID="TextBoxSubjectId" runat="server" Text='<%# Bind("SubjectId") %>'   CssClass="form-control " Visible="false"  />
                      <td>
                        <asp:Label ID="Label8" runat="server" Text='<%# Container.DisplayIndex+1%>' />
                    </td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("StudentName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="GEIDLabel" runat="server" Text='<%# Eval("Name") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("PeriodName") %>' />
                    </td>
                  <td>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("SubName") %>' />
                    </td>
            
                    <td>
                   
                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("DayDate","{0: dd/MM/yyyy}") %>' />
                    </td>
                      <td>
                   
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("DayDate","{0: ddd}") %>' />
                    </td>
                  <td>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("DayTime","{0: hh:mm tt}")  %>' />
                    </td>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Hours") %>' />
                    </td>
                     <td>
                        <%-- <% if (Eval("Hours")) %>--%>
                           <a data-toggle="tooltip" title="<%= Resources.DefaultResource.Location%>"  class="btn btn-sm btn-warning"  data-original-title="<%= Resources.DefaultResource.Location%>" href='<%# Eval("InstituteName") %>' Target="_blank" 
                               <%# Eval("InstituteName").ToString () !="" ? "style=\"display:block; width:100%\"" : "style=\"display:none; visibility: hidden\""%>
                               >
                               <%=Resources.DefaultResource.Location %>

                               <%-- <i class="fa fa-print"></i>--%>
                            </a>
                      <%--<asp:Label ID="LabelStudentAddress" runat="server" Text='<%# Eval("StudentAddress") %>' />--%>
                    </td>
                    <td class ="text-center">
                          <label class="switch switch-success"  >

                                  <asp:CheckBox ID="NotifyFlagCheckBox" runat="server" Checked='<%# Bind("NotifyFlag") %>' OnCheckedChanged="CheckBox_CheckedChanged" AutoPostBack="True" />
                              
                              <span></span>
                        </label>
                     

                    </td>
                    
                    <%--<td  class ="text-center">
                           <label class="switch switch-success"  >

                                  <asp:CheckBox ID="NotifyFlagCheckBox" runat="server" Checked='<%# Bind("NotifyFlag") %>' /><span style="pointer-events:none"></span>
                           </label                      
                    </td>--%>
                   <%--<td class="text-center block-options">
                     
                         <asp:LinkButton ID="EditLinkButton" runat="server" CommandName="Edit" Text="" data-toggle="tooltip" title="<%$ Resources:DefaultResource, Edite%>" CssClass="btn btn-sm btn-default" data-original-title="<%$ Resources:DefaultResource, Edite%>">
                          
                                <i class="fa fa-pencil"></i>
                        </asp:LinkButton>
                       
                    </td>--%>
                     
                              
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
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument="Name" CommandName="Sort" Text="<%$ Resources:DefaultResource, StudentName%>" />
                            </th> 
                            <th class ="text-center">
                                <asp:LinkButton ID="MagazineTitleLinkButton" runat="server" CommandArgument="StageName" CommandName="Sort" Text="<%$ Resources:DefaultResource, teacherName%>" />
                            </th>
                            <th class ="text-center">
                                <asp:LinkButton ID="TitleLinkButton" runat="server" CommandArgument="PeriodName" CommandName="Sort" Text="<%$ Resources:DefaultResource, StudentPeriod%>" />
                            </th>
                             <th class ="text-center">
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument="SubName" CommandName="Sort" Text="<%$ Resources:DefaultResource, SubjectName%>" />
                            </th>                    

                             <th class ="text-center">
                                <asp:LinkButton ID="LinkButton6" runat="server" CommandArgument="Date" CommandName="Sort" Text="<%$ Resources:DefaultResource, DayDate%>" />
                            </th>
                            <th class ="text-center">
                                <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument="Date" CommandName="Sort" Text="<%$ Resources:DefaultResource, Date%>" />
                            </th>
                             <th class ="text-center">
                                <asp:LinkButton ID="LinkButton4" runat="server" CommandArgument="DayTime" CommandName="Sort" Text="<%$ Resources:DefaultResource, TimeTitle%>" />
                            </th>    
                            <th class ="text-center">
                                <asp:LinkButton ID="LinkButton5" runat="server" CommandArgument="Hours" CommandName="Sort" Text="<%$ Resources:DefaultResource, SubjectHours%>" />
                            </th>    
                            <th class ="text-center">
                                <asp:LinkButton ID="linkNotifyFlag" runat="server" CommandArgument="NotifyFlag" CommandName="Sort" Text="<%$ Resources:DefaultResource, Location%>" />
                            </th>    
                            <th class ="text-center">
                                <asp:LinkButton ID="linkAttFlag" runat="server" CommandArgument="AttFlag" CommandName="Sort" Text="<%$ Resources:DefaultResource, AttendenceFlag %>" />
                            </th>  
                            
                        <%--    <th>
                                <asp:LinkButton ID="CreatorLinkButton" runat="server" CommandArgument="Creator" CommandName="Sort" Text="<%$ Resources:DefaultResource, Creator%>" />
                            </th>
                            <th>
                                <asp:LinkButton ID="UpdaterLinkButton" runat="server" CommandArgument="Creator" CommandName="Sort" Text="<%$ Resources:DefaultResource, Updater%>" />
                            </th>--%>
                           <%-- <th class ="text-center" style="width :10%">
                                <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, Actions%>" /></th>--%>
                        </tr>
                    </thead>
                    <tbody>
                        <tr id="itemPlaceholder" runat="server">
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="10">
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
                           
                           
        <asp:ObjectDataSource ID="StudentsIndvAttendanceDS" runat="server"  SelectMethod="Read" TypeName="BOL.Sch_StudentsIndvAttendance" DeleteMethod="DML" InsertMethod="DML" UpdateMethod="DML" OldValuesParameterFormatString="original_{0}"><DeleteParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="3" />
            <asp:Parameter Name="Id" Type="Int64" />
            <asp:Parameter Name="StudentId" Type="Int64" />
            <asp:Parameter Name="TeacherId" Type="Int64" />
            <asp:Parameter Name="InvDetId" Type="Int64" />
            <asp:Parameter Name="SubjectId" Type="Int64" />
<asp:Parameter Name="DayDate" Type="String"></asp:Parameter>
<asp:Parameter Name="DayTime" Type="String"></asp:Parameter>
            <asp:Parameter Name="Hours" Type="Decimal" />
            <asp:Parameter Name="TeacherValue" Type="Decimal" />
            <asp:Parameter Name="AttFlag" Type="Boolean" />
            <asp:Parameter Name="ExceptionFlag" Type="Boolean" />
            <asp:Parameter Name="NotifyFlag" Type="Boolean" />
            <asp:Parameter Name="Notes" Type="String" />
            <asp:Parameter Name="StudentAddress" Type="String" />
            <asp:Parameter Name="BranchId" Type="Int64" />
            <asp:Parameter Name="OrgId" Type="Int64" />
            <asp:Parameter Name="CreatedBy" Type="Int32" />
            <asp:Parameter Name="UpdateBy" Type="Int32" />
            <asp:SessionParameter DefaultValue="" Name="DeletedBy" SessionField="UserId" Type="Int32" />
            <asp:Parameter Name="RepeatFlag" Type="Int32" />
            <asp:Parameter Name="RepeatNumber" Type="Int32" />
            <asp:Parameter Name="RemainHours" Type="Decimal" />
            <asp:Parameter Name="InsertedId" Type="Int64" />
            <asp:Parameter Name="RepeatCount" Type="Int64" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ActionCode" Type="String" DefaultValue="1" />
                <asp:Parameter Name="Id" Type="Int64" />
                <asp:QueryStringParameter DefaultValue="" Name="StudentId" QueryStringField="StudentId" Type="Int64" />
                <asp:Parameter DefaultValue="" Name="TeacherId" Type="Int64" />
                <asp:QueryStringParameter DefaultValue="" Name="InvDetId" QueryStringField="InvDetId" Type="Int64" />
                <asp:QueryStringParameter Name="SubjectId" QueryStringField="SubjectId" Type="Int64" />
<asp:Parameter Name="DayDate" Type="String"></asp:Parameter>
<asp:Parameter Name="DayTime" Type="String"></asp:Parameter>
                <asp:Parameter Name="Hours" Type="Decimal" />
                <asp:Parameter Name="TeacherValue" Type="Decimal" />
                <asp:Parameter Name="AttFlag" Type="Boolean" />
                <asp:Parameter Name="ExceptionFlag" Type="Boolean" />
                <asp:Parameter Name="NotifyFlag" Type="Boolean" />
                <asp:Parameter Name="Notes" Type="String" />
                <asp:Parameter Name="StudentAddress" Type="String" />
                <asp:Parameter Name="BranchId" Type="Int64" />
                <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:SessionParameter Name="CreatedBy" SessionField="UserId" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="UpdateBy" SessionField="UserId" Type="Int32" />
                <asp:Parameter Name="DeletedBy" Type="Int32" />
                <asp:Parameter Name="RepeatFlag" Type="Int32" />
                <asp:Parameter Name="RepeatNumber" Type="Int32" />
                <asp:Parameter Name="RemainHours" Type="Decimal" />
                <asp:Parameter Name="InsertedId" Type="Int64" />
                <asp:Parameter Name="RepeatCount" Type="Int64" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="5" Name="ActionCode" Type="String" />
                <asp:Parameter Name="Id" Type="Int64" />
                <asp:ControlParameter ControlID="StartDateTextBox" DefaultValue="" Name="StartDate" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="EndDateTextBox" Name="EndDate" PropertyName="Text" Type="String" />
                <asp:Parameter Name="InvId" Type="Int64" DefaultValue="" />
                <asp:QueryStringParameter Name="InvDetId" QueryStringField="InvDetId" Type="Int64" />
                <asp:Parameter Name="SubjectId" Type="Int64" />
                <asp:Parameter Name="PeriodId" Type="Int64" DefaultValue="" />
                <asp:SessionParameter DefaultValue="" Name="TeacherId" SessionField="TeacherId" Type="Int64" />
<asp:Parameter Name="InvType" Type="Int32"></asp:Parameter>
                <asp:Parameter DefaultValue="" Name="OrgId" Type="Int64" />
                <asp:Parameter Name="BranchId" Type="Int64" />
                <asp:Parameter Name="UserId" Type="Int32" />
                <asp:Parameter Name="StudentId" Type="Int64" />
                <asp:Parameter Name="AttFlag" Type="Boolean" />
                <asp:Parameter Name="SearchText" Type="String" />
            </SelectParameters><UpdateParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="2" /><asp:Parameter Name="Id" Type="Int64" />
                <asp:Parameter Name="StudentId" Type="Int64" />
                <asp:Parameter Name="TeacherId" Type="Int64" DefaultValue="" />
                <asp:Parameter Name="InvDetId" Type="Int64" />
                <asp:Parameter Name="SubjectId" Type="Int64" />
<asp:Parameter Name="DayDate" Type="String"></asp:Parameter>
<asp:Parameter Name="DayTime" Type="String"></asp:Parameter>
                <asp:Parameter Name="Hours" Type="Decimal" />
                <asp:Parameter Name="TeacherValue" Type="Decimal" />
                <asp:Parameter Name="AttFlag" Type="Boolean" />
                <asp:Parameter Name="ExceptionFlag" Type="Boolean" />
                <asp:Parameter Name="NotifyFlag" Type="Boolean" />
                <asp:Parameter Name="Notes" Type="String" />
                <asp:Parameter Name="StudentAddress" Type="String" />
                <asp:Parameter Name="BranchId" Type="Int64" />
                <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:Parameter Name="CreatedBy" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="UpdateBy" SessionField="UserId" Type="Int32" />
                <asp:Parameter Name="DeletedBy" Type="Int32" />
                <asp:Parameter Name="RepeatFlag" Type="Int32" />
                <asp:Parameter Name="RepeatNumber" Type="Int32" />
                <asp:Parameter Name="RemainHours" Type="Decimal" />
                <asp:Parameter Name="InsertedId" Type="Int64" />
                <asp:Parameter Name="RepeatCount" Type="Int64" />
            </UpdateParameters></asp:ObjectDataSource>

    <asp:TextBox ID="txtOrgId" runat="server" 
        Visible="False" ></asp:TextBox>

    </div>

</div>
                                </div> 
           </div> 
     </div>

<asp:ObjectDataSource ID="TeachersDS" runat="server"  SelectMethod="Read" TypeName="BOL.Sch_Teachers" OldValuesParameterFormatString="original_{0}"><SelectParameters>
        <asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" />
        <asp:Parameter Name="TeacherId" Type="Int64" />
        <asp:QueryStringParameter Name="subjectId" QueryStringField="subjectId" Type="Int64" />
        <asp:QueryStringParameter DefaultValue="" Name="PeriodId" QueryStringField="PeriodId" Type="Int64" />
        <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
        <asp:Parameter Name="BranchId" Type="Int64" />
        <asp:Parameter Name="UserId" Type="Int32" />
        <asp:Parameter Name="StudenId" Type="Int64" />
        <asp:Parameter Name="UserName" Type="String" />
        <asp:Parameter Name="Password" Type="String" />
        <asp:Parameter Name="SearchText" Type="String" />
        </SelectParameters></asp:ObjectDataSource>

    <asp:HiddenField ID="StageIdHiddenField" runat="server" />


      
 


                                 

       
                                
    <p>

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

    


    