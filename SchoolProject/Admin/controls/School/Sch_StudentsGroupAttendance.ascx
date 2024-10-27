<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Sch_StudentsGroupAttendance.ascx.cs" Inherits="WebSchool.Admin.controls.School.Sch_StudentsGroupAttendance" %>

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
    <li> <a href="SchInvoicesDetials.aspx?RFlag=1"><%= Resources.DefaultResource.GroupAttandences%> </a></li>
</ul>
       
<div class="block">
    <!-- Table Styles Title -->
    <div class="block-title">
        <h2><strong><%= Resources.DefaultResource.List%>  </strong> <%= Resources.DefaultResource.GroupAttandences%> </h2>
       <%-- <div class="block-options pull-right">
            <asp:LinkButton ID="NewRecord" runat="server" CssClass="btn btn-sm btn-success" data-toggle="tooltip" title="<%$ Resources:DefaultResource, NewRecord%>"  data-original-title="<%$ Resources:DefaultResource, NewRecord%>" OnClick="NewRecord_Click"> <i class="fa fa-file"></i></asp:LinkButton>
        </div>--%>
    </div>
    <!-- END Table Styles Title -->

    <div class="gallery gallery-widget" data-toggle="lightbox-gallery">
               
            <div class="row">
             <div class=" col-md-6">
                 <asp:TextBox ID="StartDateTextBox" runat="server"  CssClass="form-control input-datepicker" placeholder="<%$ Resources:DefaultResource, FromDate%>" data-date-format="dd/mm/yyyy" autocomplete ="off"/>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidatorDate" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                     ControlToValidate="StartDateTextBox" ValidationGroup="DML" CssClass="label label-warning"> </asp:RequiredFieldValidator>

                 <asp:CompareValidator    id="dateValidator" runat="server"     Type="Date"    Operator="DataTypeCheck"    ControlToValidate="StartDateTextBox" Display="Dynamic"
                      ErrorMessage="<%$ Resources:DefaultResource, DateMessage%>" ValidationGroup="DML">
                        </asp:CompareValidator>
            </div>
             <div class=" col-md-6">
            </div>
           
          </div>
            <div class="row">
                
                    <div class="col-md-4">
                        <asp:DropDownList ID="DropDownListStudent" runat="server" CssClass="form-control select-chosen" AppendDataBoundItems="True" DataSourceID="StudentsDS" DataTextField="StudentName" DataValueField="StudentId">
                        <asp:ListItem Text="<%$ Resources:DefaultResource, ChooseStudent%>"  Value=""></asp:ListItem>
                   
                    </asp:DropDownList>
                 </div>
                    <div class="col-md-4">
                        <asp:DropDownList ID="PeriodDropDownList" runat="server" CssClass="form-control select-chosen" AppendDataBoundItems="True" DataSourceID="PeriodsDS" DataTextField="PeriodName" DataValueField="PeriodId"  >
                        <asp:ListItem Text="<%$ Resources:DefaultResource, ChoosePeriod%>"  Value=""></asp:ListItem>
                   
                    </asp:DropDownList>
                </div>
                <div class="col-md-4">
         <asp:DropDownList ID="SexDropDownList" runat="server" class="select-chosen" data-placeholder="<%$ Resources:DefaultResource, StudentMan%>" AppendDataBoundItems="true" > 
                                        <asp:ListItem Text="<%$ Resources:DefaultResource, ChooseSex%>"  Value=""></asp:ListItem>
                                                 <asp:ListItem Text="<%$ Resources:DefaultResource, StudentMan%>" Value="1"></asp:ListItem>
                                                 <asp:ListItem Text="<%$ Resources:DefaultResource, StudentWoman%>" Value="2"></asp:ListItem>
                                            </asp:DropDownList>
                 </div> 
        </div>
   
       <!-- General Data Block -->                             
        <div class="input-group">
            <asp:TextBox ID="SearchTextBox" runat="server" CssClass="form-control" placeholder="<%$ Resources:DefaultResource, Search%>"></asp:TextBox>
            <span class="input-group-btn">
                
                <asp:LinkButton ID="ClearLinkButton" runat="server" CssClass="btn btn-danger" OnClick="ClearLinkButton_Click"> <i class="hi hi-remove"></i><%= Resources.DefaultResource.ClearSearch%></asp:LinkButton>
               
                <asp:LinkButton ID="SearchLinkButton" runat="server" CssClass="btn btn-primary"> <i class="fa fa-search"></i><%= Resources.DefaultResource.SearchTitle%></asp:LinkButton>

                 <asp:LinkButton ID="LinkButtonAddAtt" runat="server" CssClass="btn btn-warning" OnClick="LinkButtonAddAtt_Click"  > <i class="fa fa-address-book"></i><%= Resources.DefaultResource.MakeAttendances%></asp:LinkButton>

            </span>
        </div>
        <br />
 

    <div id="ErrorDiv" runat="server"></div>
        <asp:ListView ID="lv" runat="server" DataKeyNames="Id" OnItemCommand="lv_ItemCommand" OnItemDataBound="lv_ItemDataBound" DataSourceID="StudentsGroupAttendanceDS">
         
            
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td><%= Resources.DefaultResource.DataNotFound %></td></tr></table></EmptyDataTemplate>
          
            <ItemTemplate>
                <tr >
                    <asp:TextBox ID="txtId" runat="server" Text='<%# Bind("Id") %>'   CssClass="form-control " Visible="false"  />
                      <td>
                        <asp:Label ID="Label8" runat="server" Text='<%# Container.DisplayIndex+1%>' />
                    </td>
                    <td>
                   
                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("DayDate","{0: dd/MM/yyyy}") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("StudentName") %>' />
                    </td>
                    
                    <td>
                        <asp:Label ID="GEIDLabel" runat="server" Text='<%# Eval("StudentTel") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("PeriodName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("GroupName") %>' />
                    </td>

                       <td>
                          <asp:Label ID="LabelStudyStartDate" runat="server" Text='<%# String.Format(new System.Globalization.CultureInfo("ar-KW"), "{0: dd/MMM/yyyy}", Eval("StudyStartDate")) %>'/>
                     
                    </td>
                    <td>
                         <asp:Label ID="LabelStudyEndDate" runat="server" Text='<%# String.Format(new System.Globalization.CultureInfo("ar-KW"), "{0: dd/MMM/yyyy}", Eval("StudyEndDate")) %>'/>
                      
                    </td>
                    <td class ="text-center">
                          <label class="switch switch-success"  >

                                  <asp:CheckBox ID="AttFlagCheckBox" runat="server" Checked='<%# Bind("AttFlag") %>' OnCheckedChanged="CheckBox_CheckedChanged" AutoPostBack="True" />
                              
                              <span></span>
                        </label>
                      <td class ="text-center">
                          <label class="switch switch-success"  >

                                  <asp:CheckBox ID="CheckBoxExceptionFlag" runat="server" Checked='<%# Bind("ExceptionFlag") %>' OnCheckedChanged="CheckBox_CheckedChanged" AutoPostBack="True" />
                              
                              <span></span>
                        </label>


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
                                <asp:LinkButton ID="LinkButton6" runat="server" CommandArgument="Date" CommandName="Sort" Text="<%$ Resources:DefaultResource, DayDate%>" />
                            </th>
                              <th class ="text-center">
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument="Name" CommandName="Sort" Text="<%$ Resources:DefaultResource, StudentName%>" />
                            </th> 
                            <th class ="text-center">
                                <asp:LinkButton ID="MagazineTitleLinkButton" runat="server" CommandArgument="StageName" CommandName="Sort" Text="<%$ Resources:DefaultResource, StudentTel%>" />
                            </th>
                            <th class ="text-center">
                                <asp:LinkButton ID="TitleLinkButton" runat="server" CommandArgument="PeriodName" CommandName="Sort" Text="<%$ Resources:DefaultResource, StudentPeriod%>" />
                            </th>
                             <th class ="text-center">
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument="SubName" CommandName="Sort" Text="<%$ Resources:DefaultResource, GroupName%>" />
                            </th>                    

                           
                            <th class ="text-center">
                                <asp:LinkButton ID="StudyStartDateLinkButton" runat="server" CommandArgument="StudyStartDate" CommandName="Sort" Text="<%$ Resources:DefaultResource, FromDateTitle%>" />
                            </th>        
                             <th class ="text-center">
                                <asp:LinkButton ID="StudyEndDateLinkButton" runat="server" CommandArgument="StudyEndDate" CommandName="Sort" Text="<%$ Resources:DefaultResource, ToDateTitle%>" />
                            </th> 
                            
                            <th class ="text-center">
                                <asp:LinkButton ID="linkAttFlag" runat="server" CommandArgument="AttFlag" CommandName="Sort" Text="<%$ Resources:DefaultResource, StudentAttendance%>" />
                            </th>  
                            <th class ="text-center">
                                <asp:LinkButton ID="linkNotifyFlag" runat="server" CommandArgument="NotifyFlag" CommandName="Sort" Text="<%$ Resources:DefaultResource, ExceptionFlag%>" />
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
                           
                           
        <asp:ObjectDataSource ID="StudentsGroupAttendanceDS" runat="server"  SelectMethod="Read" TypeName="BOL.Sch_StudentsGroupAttendance" OnInserted="StudentsIndvAttendanceDS_Inserted" OnInserting="StudentsIndvAttendanceDS_Inserting" OnUpdated="StudentsIndvAttendanceDS_Updated" OnUpdating="StudentsIndvAttendanceDS_Updating" OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" />
                <asp:Parameter Name="Id" Type="Int64" />
                <asp:ControlParameter ControlID="StartDateTextBox" DefaultValue="" Name="StartDate" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="StartDateTextBox" Name="EndDate" PropertyName="Text" Type="String" />
                <asp:Parameter Name="InvId" Type="Int64" DefaultValue="" />
                <asp:ControlParameter ControlID="PeriodDropDownList" DefaultValue="" Name="PeriodId" PropertyName="SelectedValue" Type="Int64" />
                <asp:Parameter Name="InvType" Type="Int32" DefaultValue="2" />
                <asp:SessionParameter DefaultValue="" Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:Parameter Name="BranchId" Type="Int64" />
                <asp:Parameter Name="UserId" Type="Int32" />
                <asp:ControlParameter ControlID="DropDownListStudent" Name="StudentId" PropertyName="SelectedValue" Type="Int64" />
                <asp:Parameter Name="AttFlag" Type="Boolean" />
                <asp:ControlParameter ControlID="SexDropDownList" DefaultValue="" Name="sex" PropertyName="SelectedValue" Type="Int32" />
                <asp:Parameter Name="SearchText" Type="String" />
            </SelectParameters></asp:ObjectDataSource>

    <asp:TextBox ID="txtOrgId" runat="server" 
        Visible="False" ></asp:TextBox>

    </div>

</div>
                                </div> 
           </div> 
     </div>

    


    <p>

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

    


<asp:ObjectDataSource ID="PeriodsDS" runat="server" OldValuesParameterFormatString="original_{0}"  SelectMethod="Read" TypeName="BOL.Sch_Periods"><SelectParameters>
        <asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" />
        <asp:Parameter Name="PeriodId" Type="Int64" DefaultValue="" />
        <asp:Parameter Name="StageId" Type="Int64" />
       <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
        <asp:Parameter Name="BranchId" Type="Int64" />
        </SelectParameters></asp:ObjectDataSource>

    <asp:ObjectDataSource ID="StudentsDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Read" TypeName="BOL.Sch_Student" ><SelectParameters>
        <asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" />
       <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
        <asp:Parameter Name="StudentId" Type="Int64" />
    <asp:Parameter DefaultValue="" Name="PeriodId" Type="Int64"></asp:Parameter>

    <asp:Parameter Name="BranchId" Type="Int64" />
        <asp:Parameter Name="SearchText" Type="String" />
        </SelectParameters></asp:ObjectDataSource>

    

    


    