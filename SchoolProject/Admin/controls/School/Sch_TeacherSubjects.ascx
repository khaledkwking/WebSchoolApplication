<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Sch_TeacherSubjects.ascx.cs" Inherits="WebSchool.ADMIN.Controls.School.Sch_TeacherSubjects" %>

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
    <li> <%= Resources.DefaultResource.TeacherSubjects%> </li> - 
    <li> <asp:Label ID="labName" runat="server" Text="Label"></asp:Label> </li>
    
</ul>
       
<div class="block">
    <!-- Table Styles Title -->
    <div class="block-title">
        <h2><strong><%= Resources.DefaultResource.List%>  </strong> <%= Resources.DefaultResource.TeacherSubjects%> </h2>
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
    <div id="ErrorDiv" runat="server"></div>
    <asp:ListView ID="lv" runat="server" DataKeyNames="Id" DataSourceID="TeacherSubjectsDS" OnItemCommand="lv_ItemCommand" OnItemDataBound="lv_ItemDataBound">
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
                             <div class="form-group">
                                       
                                        <label for="lblStageId" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:DefaultResource, StageName%>" />
                                        </label>
                                        <div class="col-md-4">
                                            <asp:DropDownList ID="ddlStageId" runat="server" class="select-chosen" data-placeholder="<%$ Resources:DefaultResource, StageName%>" 
                                                DataSourceID="StageDS" DataTextField="StageName" DataValueField="StageId" Text='<%# Bind("StageId") %>' AutoPostBack="True" OnSelectedIndexChanged="ddlStage_SelectedIndexChanged"> 
                                                <%--<asp:ListItem Text="<%$ Resources:DefaultResource, StageName%>" Value="0"></asp:ListItem>--%>
                                            </asp:DropDownList>
                                      </div>
                                        <label for="lblStudentPeriod" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:DefaultResource, StudentPeriod%>" />
                                        </label>
                                        <div class="col-md-4">
                                             <asp:TextBox ID="PeriodIdHiddenField" runat="server" Text='<%# Bind("PeriodId") %>' Visible="false"> </asp:TextBox>
                                            <asp:DropDownList ID="ddlPeriod" runat="server" class="select-chosen" data-placeholder="<%$ Resources:DefaultResource, StudentPeriod%>"  
                                                DataSourceID="PeriodsDS" DataTextField="PeriodName" DataValueField="PeriodId" AutoPostBack="True"  OnSelectedIndexChanged="ddlPeriod_SelectedIndexChanged"> 
                                               <%-- <asp:ListItem Text="<%$ Resources:DefaultResource, StudentPeriod%>" Value="0"></asp:ListItem>--%>
                                            </asp:DropDownList>
                                           </div>
                                       
                                    </div>
                                  <div class="form-group">
                                   <label for="lblSubject" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:DefaultResource, SubjectName%>" />
                                        </label>
                                        <div class="col-md-4">
                                              <asp:TextBox ID="SubjectIdHiddenField" runat="server" Text='<%# Bind("SubjectId") %>' Visible="false"> </asp:TextBox>
                                            <asp:DropDownList ID="ddlSubject" runat="server" class="select-chosen" data-placeholder="<%$ Resources:DefaultResource, SubjectName%>" 
                                                DataSourceID="SubjectsDS" DataTextField="SubName" DataValueField="SubId"> 
                                                <%--<asp:ListItem Text="<%$ Resources:DefaultResource, SubjectName%>" Value="0"></asp:ListItem>--%>
                                            </asp:DropDownList>
                                           </div>
                                        <label for="LicenceTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:DefaultResource, AllPeriod%>" />
                                        </label>
                                        <div class="col-md-4">
                                            <label class="switch switch-success">
                                                <asp:CheckBox ID="LicenceCheckBox" runat="server" Checked='<%# Bind("AllStageFlag") %>' /><span></span>
                                            </label>
                                        </div>

                                     
                                  </div>
                                  <div class="form-group">
                                       <label for="StudentAreaTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal21" runat="server" Text="<%$ Resources:DefaultResource, Salarytype%>" />
                                        </label>
                                        <div class="col-md-4">
                                             <asp:DropDownList ID="DropDownListSalarytypes" runat="server" class="select-chosen" data-placeholder="<%$ Resources:DefaultResource, Salarytype%>" AppendDataBoundItems="true"
                                                DataSourceID="SalarytypesDS" DataTextField="Salarytype" DataValueField="SalarytypeId" Text='<%# Bind("Salarytype") %>'>
                                                <asp:ListItem Text="<%$ Resources:DefaultResource, Salarytype%>" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorType" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="DropDownListSalarytypes" ValidationGroup="DML" CssClass="label label-warning">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                   <label for="FatherNameTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal11" runat="server" Text="<%$ Resources:DefaultResource, SalaryPerHour%>" />
                                        </label>
                                        <div class="col-md-4" >
                                          <asp:TextBox ID="SalaryPerHourTextBox" runat="server" CssClass="form-control" Text='<%# Bind("HourValue") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, SalaryPerHour%>"/>
                                        </div>
                                      
                                </div>
                                  <div class="form-group">
                                          <label for="SalaryPerMonthTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal12" runat="server" Text="<%$ Resources:DefaultResource, SalaryPerMonth%>" />
                                        </label>
                                        <div class="col-md-4">
                                          <asp:TextBox ID="SalaryPerMonthTextBox" runat="server" CssClass="form-control" Text='<%# Bind("SalaryValue") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, SalaryPerMonth%>"/>
                                        </div>
                                           <label for="lblSalaryPerPercentage" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal22" runat="server" Text="<%$ Resources:DefaultResource, SalaryPerPercentage%>" />
                                        </label>
                                        <div class="col-md-4">
                                          <asp:TextBox ID="SalaryPerPercentageTextBox" runat="server" CssClass="form-control" Text='<%# Bind("PercentageValue") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource,SalaryPerPercentage%>"/>
                                        </div>
                                 </div>
                               <div class="form-group">
                                     <label for="NotesTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal19" runat="server" Text="<%$ Resources:DefaultResource, CardNotes%>" />
                                        </label>
                                        <div class="col-md-10">
                                          <asp:TextBox ID="NotesTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Notes") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, CardNotes%>"/>
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
                                   <%-- <asp:TextBox ID="TextBoxOrgId" runat="server" CssClass="form-control" Text='<%# Bind("OrgId") %>'  Visible="false"/>--%>
                                    <div class="form-group">
                                       
                                        <label for="lblStageId" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:DefaultResource, StageName%>" />
                                        </label>
                                        <div class="col-md-4">
                                            <asp:DropDownList ID="ddlStageId" runat="server" class="select-chosen" data-placeholder="<%$ Resources:DefaultResource, StageName%>" 
                                                DataSourceID="StageDS" DataTextField="StageName" DataValueField="StageId" Text='<%# Bind("StageId") %>' AutoPostBack="True" OnSelectedIndexChanged="ddlStage_SelectedIndexChanged"> 
                                                <%--<asp:ListItem Text="<%$ Resources:DefaultResource, StageName%>" Value="0"></asp:ListItem>--%>
                                            </asp:DropDownList>
                                      </div>
                                        <label for="lblStudentPeriod" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:DefaultResource, StudentPeriod%>" />
                                        </label>
                                        <div class="col-md-4">
                                             <asp:TextBox ID="PeriodIdHiddenField" runat="server" Text='<%# Bind("PeriodId") %>' Visible="false"> </asp:TextBox>
                                            <asp:DropDownList ID="ddlPeriod" runat="server" class="select-chosen" data-placeholder="<%$ Resources:DefaultResource, StudentPeriod%>"  
                                                DataSourceID="PeriodsDS" DataTextField="PeriodName" DataValueField="PeriodId" AutoPostBack="True"  OnSelectedIndexChanged="ddlPeriod_SelectedIndexChanged"> 
                                               <%-- <asp:ListItem Text="<%$ Resources:DefaultResource, StudentPeriod%>" Value="0"></asp:ListItem>--%>
                                            </asp:DropDownList>
                                           </div>
                                       
                                    </div>
                                  <div class="form-group">
                                   <label for="lblSubject" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:DefaultResource, SubjectName%>" />
                                        </label>
                                        <div class="col-md-4">
                                              <asp:TextBox ID="SubjectIdHiddenField" runat="server" Text='<%# Bind("SubjectId") %>' Visible="false"> </asp:TextBox>
                                            <asp:DropDownList ID="ddlSubject" runat="server" class="select-chosen" data-placeholder="<%$ Resources:DefaultResource, SubjectName%>" 
                                                DataSourceID="SubjectsDS" DataTextField="SubName" DataValueField="SubId"> 
                                                <%--<asp:ListItem Text="<%$ Resources:DefaultResource, SubjectName%>" Value="0"></asp:ListItem>--%>
                                            </asp:DropDownList>
                                           </div>
                                       <label for="LicenceTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:DefaultResource, AllPeriod%>" />
                                        </label>
                                        <div class="col-md-4">
                                            <label class="switch switch-success">
                                                <asp:CheckBox ID="LicenceCheckBox" runat="server" Checked='<%# Bind("AllStageFlag") %>' /><span></span>
                                            </label>
                                        </div>

                                     
                                  </div>
                                           <div class="form-group">
                                       <label for="StudentAreaTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal21" runat="server" Text="<%$ Resources:DefaultResource, Salarytype%>" />
                                        </label>
                                        <div class="col-md-4">
                                             <asp:DropDownList ID="DropDownListSalarytypes" runat="server" class="select-chosen" data-placeholder="<%$ Resources:DefaultResource, Salarytype%>" AppendDataBoundItems="true"
                                                DataSourceID="SalarytypesDS" DataTextField="Salarytype" DataValueField="SalarytypeId" Text='<%# Bind("Salarytype") %>'>
                                                <asp:ListItem Text="<%$ Resources:DefaultResource, Salarytype%>" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidatorType" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="DropDownListSalarytypes" ValidationGroup="DML" CssClass="label label-warning">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                   <label for="FatherNameTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal11" runat="server" Text="<%$ Resources:DefaultResource, SalaryPerHour%>" />
                                        </label>
                                        <div class="col-md-4" >
                                          <asp:TextBox ID="SalaryPerHourTextBox" runat="server" CssClass="form-control" Text='<%# Bind("HourValue") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, SalaryPerHour%>"/>
                                        </div>
                                      
                                </div>
                                  <div class="form-group">
                                          <label for="SalaryPerMonthTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal12" runat="server" Text="<%$ Resources:DefaultResource, SalaryPerMonth%>" />
                                        </label>
                                        <div class="col-md-4">
                                          <asp:TextBox ID="SalaryPerMonthTextBox" runat="server" CssClass="form-control" Text='<%# Bind("SalaryValue") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, SalaryPerMonth%>"/>
                                        </div>
                                           <label for="lblSalaryPerPercentage" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal22" runat="server" Text="<%$ Resources:DefaultResource, SalaryPerPercentage%>" />
                                        </label>
                                        <div class="col-md-4">
                                          <asp:TextBox ID="SalaryPerPercentageTextBox" runat="server" CssClass="form-control" Text='<%# Bind("PercentageValue") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource,SalaryPerPercentage%>"/>
                                        </div>
                                 </div>
                                    <div class="form-group">
                                     <label for="NotesTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal19" runat="server" Text="<%$ Resources:DefaultResource, CardNotes%>" />
                                        </label>
                                        <div class="col-md-10">
                                          <asp:TextBox ID="NotesTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Notes") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, CardNotes%>"/>
                                        </div>
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
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Name") %>' />
                    </td>
                    <td>
                        <asp:Label ID="GEIDLabel" runat="server" Text='<%# Eval("StageName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("PeriodName") %>' />
                    </td>
                  <td>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("SubName") %>' />
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
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument="Name" CommandName="Sort" Text="<%$ Resources:DefaultResource, CardName%>" />
                            </th> 
                            <th class ="text-center">
                                <asp:LinkButton ID="MagazineTitleLinkButton" runat="server" CommandArgument="StageName" CommandName="Sort" Text="<%$ Resources:DefaultResource, StageName%>" />
                            </th>
                            <th class ="text-center">
                                <asp:LinkButton ID="TitleLinkButton" runat="server" CommandArgument="PeriodName" CommandName="Sort" Text="<%$ Resources:DefaultResource, StudentPeriod%>" />
                            </th>
                             <th class ="text-center">
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument="SubName" CommandName="Sort" Text="<%$ Resources:DefaultResource, SubjectName%>" />
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
                           
                           
        <asp:ObjectDataSource ID="TeacherSubjectsDS" runat="server"  SelectMethod="Read" TypeName="BOL.Sch_TeacherSubjects" DeleteMethod="DML" InsertMethod="DML" UpdateMethod="DML"><DeleteParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="3" />
            <asp:Parameter Name="Id" Type="Int64" />
            <asp:Parameter Name="TeacherId" Type="Int64" />
            <asp:Parameter Name="SubjectId" Type="Int64" />
            <asp:Parameter Name="PeriodId" Type="Int64" />
            <asp:Parameter Name="StageId" Type="Int64" />
            <asp:Parameter Name="Salarytype" Type="Int32" />
            <asp:Parameter Name="HourValue" Type="Decimal" />
            <asp:Parameter Name="SalaryValue" Type="Decimal" />
            <asp:Parameter Name="PercentageValue" Type="Decimal" />
            <asp:Parameter Name="Notes" Type="String" />
            <asp:Parameter Name="AllStageFlag" Type="Boolean" />
            <asp:Parameter Name="OrgId" Type="Int64" />
            <asp:Parameter Name="BranchId" Type="Int64" />
            <asp:Parameter Name="CreatedBy" Type="Int32" />
            <asp:Parameter Name="UpdateBy" Type="Int32" />
            <asp:SessionParameter DefaultValue="" Name="DeletedBy" SessionField="UserId" Type="Int32" />
            <asp:Parameter Direction="InputOutput" Name="InsertedId" Type="Object" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ActionCode" Type="String" DefaultValue="1" />
                <asp:Parameter Name="Id" Type="Int64" />
                <asp:QueryStringParameter DefaultValue="" Name="TeacherId" QueryStringField="teacherId" Type="Int64" />
                <asp:Parameter Name="SubjectId" Type="Int64" />
                <asp:Parameter Name="PeriodId" Type="Int64" /><asp:Parameter Name="StageId" Type="Int64" />
                <asp:Parameter Name="Salarytype" Type="Int32" />
                <asp:Parameter Name="HourValue" Type="Decimal" />
                <asp:Parameter Name="SalaryValue" Type="Decimal" />
                <asp:Parameter Name="PercentageValue" Type="Decimal" />
                <asp:Parameter Name="Notes" Type="String" />
                <asp:Parameter Name="AllStageFlag" Type="Boolean" />
                <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:Parameter Name="BranchId" Type="Int64" />
                <asp:SessionParameter Name="CreatedBy" SessionField="UserId" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="UpdateBy" SessionField="UserId" Type="Int32" />
                <asp:Parameter Name="DeletedBy" Type="Int32" />
                <asp:Parameter Direction="InputOutput" Name="InsertedId" Type="Object" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="3" Name="ActionCode" Type="String" />
                <asp:QueryStringParameter DefaultValue="" Name="TeacherId" QueryStringField="TeacherId" Type="Int64" />
                <asp:Parameter Name="Id" Type="Int64" />
                <asp:Parameter Name="SubjectId" Type="Int64" />
                <asp:Parameter Name="PeriodId" Type="Int64" DefaultValue="" />
                <asp:Parameter DefaultValue="" Name="StageId" Type="Int64" />
                <asp:SessionParameter DefaultValue="" Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:Parameter Name="BranchId" Type="Int64" />
                <asp:Parameter Name="SearchText" Type="String" />
            </SelectParameters><UpdateParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="2" /><asp:Parameter Name="Id" Type="Int64" />
                <asp:QueryStringParameter DefaultValue="" Name="TeacherId" QueryStringField="teacherId" Type="Int64" />
                <asp:Parameter Name="SubjectId" Type="Int64" />
                <asp:Parameter Name="PeriodId" Type="Int64" /><asp:Parameter Name="StageId" Type="Int64" />
                <asp:Parameter Name="Salarytype" Type="Int32" />
                <asp:Parameter Name="HourValue" Type="Decimal" />
                <asp:Parameter Name="SalaryValue" Type="Decimal" />
                <asp:Parameter Name="PercentageValue" Type="Decimal" />
                <asp:Parameter Name="Notes" Type="String" />
                <asp:Parameter Name="AllStageFlag" Type="Boolean" />
                <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:Parameter Name="BranchId" Type="Int64" /><asp:Parameter Name="CreatedBy" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="UpdateBy" SessionField="UserId" Type="Int32" />
                <asp:Parameter Name="DeletedBy" Type="Int32" />
                <asp:Parameter Direction="InputOutput" Name="InsertedId" Type="Object" />
            </UpdateParameters></asp:ObjectDataSource>

    <asp:TextBox ID="txtOrgId" runat="server" 
        Visible="False" ></asp:TextBox>

    </div>

</div>
                                </div> 
           </div> 
     </div><asp:ObjectDataSource ID="SubjectsDS" runat="server"  SelectMethod="Read" TypeName="BOL.Sch_Subjects" DeleteMethod="DML" InsertMethod="DML" UpdateMethod="DML" OldValuesParameterFormatString="original_{0}"><DeleteParameters><asp:Parameter Name="ActionCode" Type="String" />
        <asp:Parameter Name="SubId" Type="Int64" />
        <asp:Parameter Name="SubCode" Type="String" />
        <asp:Parameter Name="SubName" Type="String" />
        <asp:Parameter Name="PeriodId" Type="Int64" />
        <asp:Parameter Name="GroupHours" Type="Decimal" />
        <asp:Parameter Name="PersonHours" Type="Decimal" />
        <asp:Parameter Name="MonthPrice" Type="Decimal" />
        <asp:Parameter Name="HourPrice" Type="Decimal" />
        <asp:Parameter Name="Notes" Type="String" />
        <asp:Parameter Name="OrgId" Type="Int64" />
        <asp:Parameter Name="BranchId" Type="Int64" />
        <asp:Parameter Name="CreatedBy" Type="Int32" />
        <asp:Parameter Name="UpdateBy" Type="Int32" />
        <asp:Parameter Name="DeletedBy" Type="Int32" />
        </DeleteParameters><InsertParameters><asp:Parameter Name="ActionCode" Type="String" /><asp:Parameter Name="SubId" Type="Int64" /><asp:Parameter Name="SubCode" Type="String" /><asp:Parameter Name="SubName" Type="String" /><asp:Parameter Name="PeriodId" Type="Int64" /><asp:Parameter Name="GroupHours" Type="Decimal" /><asp:Parameter Name="PersonHours" Type="Decimal" /><asp:Parameter Name="MonthPrice" Type="Decimal" /><asp:Parameter Name="HourPrice" Type="Decimal" /><asp:Parameter Name="Notes" Type="String" /><asp:Parameter Name="OrgId" Type="Int64" /><asp:Parameter Name="BranchId" Type="Int64" /><asp:Parameter Name="CreatedBy" Type="Int32" /><asp:Parameter Name="UpdateBy" Type="Int32" /><asp:Parameter Name="DeletedBy" Type="Int32" /></InsertParameters><SelectParameters>
        <asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" />
        <asp:Parameter Name="SubId" Type="Int64" />
            <asp:Parameter DefaultValue="-1" Name="PeriodId" Type="Int64"></asp:Parameter>

            <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
        <asp:Parameter Name="BranchId" Type="Int64" />
        <asp:Parameter Name="SearchText" Type="String" />
        </SelectParameters><UpdateParameters><asp:Parameter Name="ActionCode" Type="String" /><asp:Parameter Name="SubId" Type="Int64" /><asp:Parameter Name="SubCode" Type="String" /><asp:Parameter Name="SubName" Type="String" /><asp:Parameter Name="PeriodId" Type="Int64" /><asp:Parameter Name="GroupHours" Type="Decimal" /><asp:Parameter Name="PersonHours" Type="Decimal" /><asp:Parameter Name="MonthPrice" Type="Decimal" /><asp:Parameter Name="HourPrice" Type="Decimal" /><asp:Parameter Name="Notes" Type="String" /><asp:Parameter Name="OrgId" Type="Int64" /><asp:Parameter Name="BranchId" Type="Int64" /><asp:Parameter Name="CreatedBy" Type="Int32" /><asp:Parameter Name="UpdateBy" Type="Int32" /><asp:Parameter Name="DeletedBy" Type="Int32" /></UpdateParameters></asp:ObjectDataSource>


                                 

       
                                
<asp:ObjectDataSource ID="PeriodsDS" runat="server" OldValuesParameterFormatString="original_{0}"  SelectMethod="Read" TypeName="BOL.Sch_Periods"><SelectParameters>
        <asp:Parameter DefaultValue="3" Name="ActionCode" Type="String" />
        <asp:Parameter Name="PeriodId" Type="Int64" DefaultValue="" />
        <asp:Parameter Name="StageId" Type="Int64" />
        <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
        <asp:Parameter Name="BranchId" Type="Int64" />
        </SelectParameters></asp:ObjectDataSource>

<asp:ObjectDataSource ID="StageDS" runat="server" OldValuesParameterFormatString="original_{0}"  SelectMethod="Read" TypeName="BOL.Sch_Stages"><SelectParameters>
        <asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" />
        <asp:Parameter Name="StageId" Type="Int64" />
        <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
        <asp:Parameter Name="BranchId" Type="Int64" />
        </SelectParameters></asp:ObjectDataSource>

    <asp:HiddenField ID="StageIdHiddenField" runat="server" />


        <asp:ObjectDataSource ID="SalarytypesDS" runat="server"  SelectMethod="Read" TypeName="BOL.Salarytypes" OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" />
                <asp:Parameter Name="SalarytypeId" Type="Int64" />
                <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:Parameter Name="BranchId" Type="Int64" />
            </SelectParameters></asp:ObjectDataSource>

    


    