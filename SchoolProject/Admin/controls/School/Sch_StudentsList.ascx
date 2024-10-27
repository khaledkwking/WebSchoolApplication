    <%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Sch_StudentsList.ascx.cs" Inherits="WebSchool.ADMIN.Controls.School.Sch_StudentsList" %>


<div class="content-header">
   <%-- <div class="header-section">
        <h1>
            <i class="gi gi-user"></i> <%= Resources.DefaultResource.Main%>
        </h1>
    </div>--%>
</div>
<ul class="breadcrumb breadcrumb-top">
    <li><a href="Main.aspx"><%= Resources.DefaultResource.Main%> </a></li>
    <li> <%= Resources.DefaultResource.SchoolStudents %> </li>
</ul>


       
<div class="block table-responsive">
    <!-- Table Styles Title -->
    <div class="block-title">
        <h2><strong><%= Resources.DefaultResource.List%>  </strong> <%= Resources.DefaultResource.SchoolStudents%> </h2>
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
               
                <asp:LinkButton ID="SearchLinkButton" runat="server" CssClass="btn btn-primary" OnClick="SearchLinkButton_Click"> <i class="fa fa-search"></i><%= Resources.DefaultResource.SearchTitle%></asp:LinkButton>

            </span>
        </div>
       

        <br />
    <div id="ErrorDiv" runat="server"></div>
    <asp:ListView ID="lv" runat="server" DataKeyNames="StudentId" DataSourceID="StudentsDS" OnItemCommand="lv_ItemCommand" OnItemDataBound="lv_ItemDataBound">
            <EditItemTemplate>
               <tr>
                    <td colspan="11">
                       <div class="col-md-12">
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
                          
                                     <asp:TextBox ID="TextBoxOrgId" runat="server" CssClass="form-control" Text='<%# Bind("OrgId") %>'  Visible="false"/>

                                   <div class="form-group">
                                        <label for="TitleArTextBox" class="col-md-1 control-label">
                                            <asp:Literal ID="TitleArLiteral1" runat="server" Text="<%$ Resources:DefaultResource, code%>" />
                                        </label>
                                        <div class="col-md-1 ">
                                            <asp:TextBox ID="CodeTextBox" runat="server" CssClass="form-control" Text='<%# Bind("StudentId") %>' ReadOnly="true" />
                                           </div>

                                        <label for="lblName" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:DefaultResource, StudentName%>" />
                                        </label>
                                        <div class="col-md-4 ">
                                            <asp:TextBox ID="NameTextBox" runat="server" CssClass="form-control" Text='<%# Bind("StudentName") %>'
                                                data-placeholder="<%$ Resources:DefaultResource, StudentName%>" />
                                            <asp:RequiredFieldValidator ID="NameRequiredFieldValidator" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="NameTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator>

                                        </div>

                                         <label for="lblPeriodTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal8" runat="server" Text="<%$ Resources:DefaultResource, StudentPeriod%>" />
                                        </label>
                                        <div class="col-md-2 ">
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidatorPeriod" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="PeriodDropDownList" ValidationGroup="DML" CssClass="label label-warning">
                                            </asp:RequiredFieldValidator>
                                            <asp:DropDownList ID="PeriodDropDownList" runat="server" class="select-chosen" data-placeholder="<%$ Resources:DefaultResource, StudentPeriod%>" AppendDataBoundItems="true"
                                                DataSourceID="PeriodsDS" DataTextField="PeriodName" DataValueField="PeriodId" Text='<%# Bind("PeriodId") %>' > 
                                                <asp:ListItem Text="<%$ Resources:DefaultResource, StudentPeriod%>" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                           </div>

                                    </div>
                                
                                     <div class="form-group">
                                        <label for="TitleArTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:DefaultResource, StudentSex%>" />
                                        </label>
                                        <div class="col-md-2">
                                           
                                            <asp:RequiredFieldValidator ID="SexRequiredFieldValidator" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="SexDropDownList" ValidationGroup="DML" CssClass="label label-warning">
                                            </asp:RequiredFieldValidator>
                                            <asp:DropDownList ID="SexDropDownList" runat="server" class="select-chosen" data-placeholder="<%$ Resources:DefaultResource, StudentMan%>" AppendDataBoundItems="true" Text='<%# Bind("Sex") %>'> 
                                                 <asp:ListItem Text="<%$ Resources:DefaultResource, StudentMan%>" Value="1"></asp:ListItem>
                                                 <asp:ListItem Text="<%$ Resources:DefaultResource, StudentWoman%>" Value="2"></asp:ListItem>
                                            </asp:DropDownList>
                                           </div>

                                        <label for="lblName" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:DefaultResource, StudentNat%>" />
                                        </label>
                                        <div class="col-md-2">
                                            
                                            <asp:RequiredFieldValidator ID="NatRequiredFieldValidator" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="NatDropDownList" ValidationGroup="DML" CssClass="label label-warning">
                                            </asp:RequiredFieldValidator>
                                            <asp:DropDownList ID="NatDropDownList" runat="server" class="select-chosen" data-placeholder="<%$ Resources:DefaultResource, StudentNat%>" AppendDataBoundItems="true"
                                                DataSourceID="NatDS" DataTextField="NATIONALITY_DESC" DataValueField="NATIONALITY_CODE" Text='<%# Bind("NatId") %>'  > 
                                                <asp:ListItem Text="<%$ Resources:DefaultResource, StudentNat%>" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <label for="birthTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:DefaultResource, StudentBrithDate%>" />
                                        </label>
                                        <div class="col-md-2 ">
                                          <%--  <asp:RequiredFieldValidator ID="TrainingsDateEndTextBoxRFV" runat="server" ErrorMessage="لا يمكن أن يكون تاريخ فارغا." Display="Dynamic"
                                                ControlToValidate="BirthDateTextBox" ValidationGroup="DML" CssClass="label label-warning" >
                                            </asp:RequiredFieldValidator>--%>

                                            <asp:TextBox ID="BirthDateTextBox" runat="server" Text='<%# Bind("BrithDate","{0: dd/MM/yyyy}") %>' CssClass="form-control input-datepicker" placeholder="<%$ Resources:DefaultResource,StudentBrithDate%>" data-date-format="dd/mm/yyyy" AutoComplete="Off"/>
                                           </div>
                                    </div>
                                     <div class="form-group">
                                        <label for="CivilTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:DefaultResource, CivilId%>" />
                                        </label>
                                        <div class="col-md-2 ">
                                              <asp:TextBox ID="CivilTextBox" runat="server" CssClass="form-control" Text='<%# Bind("StudentCivilId") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, CivilId%>"/>
                                           </div>
                                          <label for="SchoolNameTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:DefaultResource, StudentSchoolName%>" />
                                        </label>
                                        <div class="col-md-2 ">
                                          <asp:TextBox ID="StudentSchoolNameTextBox" runat="server" CssClass="form-control" Text='<%# Bind("SchoolName") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, StudentSchoolName%>"/>
                                           </div>
                                          <label for="lblTypeTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:DefaultResource, StudentSchooltype%>" />
                                        </label>
                                        <div class="col-md-2 ">
                                            <asp:DropDownList ID="SchoolTypeDropDownList" runat="server" class="select-chosen" data-placeholder="<%$ Resources:DefaultResource, StudentSchooltype%>" AppendDataBoundItems="true"
                                                DataSourceID="SchoolTypeDS" DataTextField="SchoolType" DataValueField="TypeId" Text='<%# Bind("SchoolType") %>' > 
                                                <asp:ListItem Text="<%$ Resources:DefaultResource, StudentSchooltype%>" Value="0"></asp:ListItem>
                                            </asp:DropDownList>
                                           </div>
                                      </div> 
                               <div class="form-group">
                                    <label for="StudentTelTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="LiteralTel" runat="server" Text="<%$ Resources:DefaultResource, StudentTel%>" />
                                        </label>
                                        <div class="col-md-2 ">
                                               

                                          <asp:TextBox ID="StudentTelTextBox" runat="server" CssClass="form-control" Text='<%# Bind("StudentTel") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, StudentTel%>"  />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTel" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="StudentTelTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator>
                                             <asp:RegularExpressionValidator Display = "Dynamic" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true" ControlToValidate = "StudentTelTextBox" ID="RegularExpressionValidator2" ValidationExpression = "^5[0-9].*|4[0-9].*|6[0-9].*|9[0-9].*" runat="server" ErrorMessage="<%$ Resources:DefaultResource, NumValidateTitle%>">
                                            </asp:RegularExpressionValidator>

                                             <asp:RegularExpressionValidator Display = "Dynamic" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true" ControlToValidate = "StudentTelTextBox" ID="RegularExpressionValidator3" ValidationExpression = "^([0-9]{8,8})$" runat="server" ErrorMessage="<%$ Resources:DefaultResource, NumValidateLengthTitle%>">
                                            </asp:RegularExpressionValidator>

                                         

                                        </div>
                                    <label for="FatherTelTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal9" runat="server" Text="<%$ Resources:DefaultResource, StudenFatherTel%>" />
                                        </label>
                                        <div class="col-md-2 ">
                                          <asp:TextBox ID="FatherTelTextBox" runat="server" CssClass="form-control" Text='<%# Bind("FatherTel") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, StudenFatherTel%>"/>
                                        </div>
                                    <label for="MotherTelTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal10" runat="server" Text="<%$ Resources:DefaultResource, StudentMonthTel%>" />
                                        </label>
                                        <div class="col-md-2 ">
                                          <asp:TextBox ID="MotherTelTextBox" runat="server" CssClass="form-control" Text='<%# Bind("MotherTel") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, StudentMonthTel%>"/>
                                        </div>
                                   </div>
                                       <div class="form-group">
                                         <label for="FatherNameTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal11" runat="server" Text="<%$ Resources:DefaultResource, StudentFatherName%>" />
                                        </label>
                                        <div class="col-md-6" >
                                          <asp:TextBox ID="FatherNameTextBox" runat="server" CssClass="form-control" Text='<%# Bind("FatherName") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, StudentFatherName%>"/>
                                        </div>
                                        <label for="FatherNameTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal12" runat="server" Text="<%$ Resources:DefaultResource, StudentRelative%>" />
                                        </label>
                                        <div class="col-md-2">
                                          <asp:TextBox ID="FatherNameTextBox1" runat="server" CssClass="form-control" Text='<%# Bind("Kinship") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, StudentRelative%>"/>
                                        </div>
                                       </div> 
                                    <div class="form-group">
                                        <label for="StudentAreaTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal13" runat="server" Text="<%$ Resources:DefaultResource, StudentArea%>" />
                                        </label>
                                        <div class="col-md-2">
                                            <asp:DropDownList ID="AreaDropDownList" runat="server" class="select-chosen" data-placeholder="<%$ Resources:DefaultResource, StudentArea%>" AppendDataBoundItems="true"
                                                DataSourceID="AreaDS" DataTextField="Citydec" DataValueField="CityId" Text='<%# Bind("Area") %>'> 
                                                <asp:ListItem Text="<%$ Resources:DefaultResource, StudentArea%>" Value=""></asp:ListItem>
                                            </asp:DropDownList>
      
                                        </div>
                                         <label for="StudentAreaTextBox" class="col-md-1 control-label">
                                            <asp:Literal ID="Literal14" runat="server" Text="<%$ Resources:DefaultResource, StudentBlockNo%>" />
                                        </label>
                                        <div class="col-md-1">
                                          <asp:TextBox ID="BlockNoTextBox" runat="server" CssClass="form-control" Text='<%# Bind("BlockNo") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, StudentBlockNo%>"/>
                                        </div>
                                         <label for="StreetTextBox" class="col-md-1 control-label">
                                            <asp:Literal ID="Literal15" runat="server" Text="<%$ Resources:DefaultResource, StudentStreetNo%>" />
                                        </label>
                                        <div class="col-md-1 ">
                                          <asp:TextBox ID="StreetTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Street") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, StudentStreetNo%>"/>
                                        </div>

                                         <label for="HouseNoTextBox" class="col-md-1 control-label">
                                            <asp:Literal ID="Literal16" runat="server" Text="<%$ Resources:DefaultResource, StudentBuildingNo%>" />
                                        </label>
                                        <div class="col-md-1 ">
                                          <asp:TextBox ID="HouseNoTextBox" runat="server" CssClass="form-control" Text='<%# Bind("HouseNo") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, StudentBuildingNo%>"/>
                                        </div>

                                          <label for="FloorNoTextBox" class="col-md-1 control-label">
                                            <asp:Literal ID="Literal17" runat="server" Text="<%$ Resources:DefaultResource, StudentFloorNo%>" />
                                        </label>
                                        <div class="col-md-1 ">
                                          <asp:TextBox ID="FloorNoTextBox" runat="server" CssClass="form-control" Text='<%# Bind("FloorNo") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, StudentFloorNo%>"/>
                                        </div>
                                        </div>

                                      <div class="form-group">
                                           <label for="GadaTextBox" class="col-md-1 control-label">
                                            <asp:Literal ID="Literal20" runat="server" Text="<%$ Resources:DefaultResource, Gada%>" />
                                        </label>
                                           <div class="col-md-1">
                                          <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Text='<%# Bind("Gada") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, Gada%>"/>
                                        </div>
                                    <label for="SaleManNameTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal18" runat="server" Text="<%$ Resources:DefaultResource, SaleManName%>" />
                                        </label>
                                        <div class="col-md-2 ">
                                          <asp:TextBox ID="SaleManNameTextBox" runat="server" CssClass="form-control" Text='<%# Bind("SalesMan") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, SaleManName%>"/>
                                        </div>
                                             <label for="StudentTelTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal19" runat="server" Text="<%$ Resources:DefaultResource, CardNotes%>" />
                                        </label>
                                        <div class="col-md-4">
                                          <asp:TextBox ID="NotesTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Note") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, CardNotes%>"/>
                                        </div>
                                          </div>
                                     <div class="form-group">
                                           <label for="TextBoxLocation" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal21" runat="server" Text="<%$ Resources:DefaultResource, Location%>" />
                                        </label>
                                          <div class="col-md-10">
                                         <asp:TextBox ID="TextBoxLocation" runat="server" CssClass="form-control" Text='<%# Bind("InstituteName") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, Location%>" TextMode="MultiLine" />
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
                        <td><%= Resources.DefaultResource.DataNotFound %></td>
                    </tr>

                </table>

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
                                        <label for="TitleArTextBox" class="col-md-1 control-label">
                                            <asp:Literal ID="TitleArLiteral1" runat="server" Text="<%$ Resources:DefaultResource, code%>" />
                                        </label>
                                        <div class="col-md-1 ">
                                            <asp:TextBox ID="CodeTextBox" runat="server" CssClass="form-control" Text='<%# Bind("StudentId") %>' ReadOnly="true" />
                                           </div>

                                        <label for="lblName" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:DefaultResource, StudentName%>" />
                                        </label>
                                        <div class="col-md-4 ">
                                            <asp:TextBox ID="NameTextBox" runat="server" CssClass="form-control" Text='<%# Bind("StudentName") %>'
                                                data-placeholder="<%$ Resources:DefaultResource, StudentName%>" />
                                            <asp:RequiredFieldValidator ID="NameRequiredFieldValidator" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="NameTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator>

                                        </div>

                                         <label for="lblPeriodTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal8" runat="server" Text="<%$ Resources:DefaultResource, StudentPeriod%>" />
                                        </label>
                                        <div class="col-md-2 ">
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidatorPeriod" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="PeriodDropDownList" ValidationGroup="DML" CssClass="label label-warning">
                                            </asp:RequiredFieldValidator>
                                            <asp:DropDownList ID="PeriodDropDownList" runat="server" class="select-chosen" data-placeholder="<%$ Resources:DefaultResource, StudentPeriod%>" AppendDataBoundItems="true"
                                                DataSourceID="PeriodsDS" DataTextField="PeriodName" DataValueField="PeriodId" Text='<%# Bind("PeriodId") %>' > 
                                                <asp:ListItem Text="<%$ Resources:DefaultResource, StudentPeriod%>" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                           </div>

                                    </div>
                                
                                     <div class="form-group">
                                        <label for="TitleArTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:DefaultResource, StudentSex%>" />
                                        </label>
                                        <div class="col-md-2 ">
                                           
                                            <asp:RequiredFieldValidator ID="SexRequiredFieldValidator" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="SexDropDownList" ValidationGroup="DML" CssClass="label label-warning">
                                            </asp:RequiredFieldValidator>
                                            <asp:DropDownList ID="SexDropDownList" runat="server" class="select-chosen" data-placeholder="<%$ Resources:DefaultResource, StudentMan%>" AppendDataBoundItems="true" Text='<%# Bind("Sex") %>'> 
                                                 <asp:ListItem Text="<%$ Resources:DefaultResource, StudentMan%>" Value="1"></asp:ListItem>
                                                 <asp:ListItem Text="<%$ Resources:DefaultResource, StudentWoman%>" Value="2"></asp:ListItem>
                                            </asp:DropDownList>
                                           </div>

                                        <label for="lblName" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:DefaultResource, StudentNat%>" />
                                        </label>
                                        <div class="col-md-2 ">
                                            
                                            <asp:RequiredFieldValidator ID="NatRequiredFieldValidator" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="NatDropDownList" ValidationGroup="DML" CssClass="label label-warning">
                                            </asp:RequiredFieldValidator>
                                            <asp:DropDownList ID="NatDropDownList" runat="server" class="select-chosen" data-placeholder="<%$ Resources:DefaultResource, StudentNat%>" AppendDataBoundItems="true"
                                                DataSourceID="NatDS" DataTextField="NATIONALITY_DESC" DataValueField="NATIONALITY_CODE" Text='<%# Bind("NatId") %>'  > 
                                                <asp:ListItem Text="<%$ Resources:DefaultResource, StudentNat%>" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <label for="birthTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:DefaultResource, StudentBrithDate%>" />
                                        </label>
                                        <div class="col-md-2 ">
                                           <%-- <asp:RequiredFieldValidator ID="TrainingsDateEndTextBoxRFV" runat="server" ErrorMessage="لا يمكن أن يكون تاريخ فارغا." Display="Dynamic"
                                                ControlToValidate="BirthDateTextBox" ValidationGroup="DML" CssClass="label label-warning" >
                                            </asp:RequiredFieldValidator>--%>

                                            <asp:TextBox ID="BirthDateTextBox" runat="server" Text='<%# Bind("BrithDate","{0: dd/MM/yyyy}") %>' CssClass="form-control input-datepicker" placeholder="<%$ Resources:DefaultResource,StudentBrithDate%>" data-date-format="dd/mm/yyyy" AutoComplete="Off"/>
                                           </div>
                                    </div>
                                     <div class="form-group">
                                        <label for="CivilTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:DefaultResource, CivilId%>" />
                                        </label>
                                        <div class="col-md-2 ">
                                              <asp:TextBox ID="CivilTextBox" runat="server" CssClass="form-control" Text='<%# Bind("StudentCivilId") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, CivilId%>"/>
                                           </div>
                                          <label for="SchoolNameTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:DefaultResource, StudentSchoolName%>" />
                                        </label>
                                        <div class="col-md-2 ">
                                          <asp:TextBox ID="StudentSchoolNameTextBox" runat="server" CssClass="form-control" Text='<%# Bind("SchoolName") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, StudentSchoolName%>"/>
                                           </div>
                                          <label for="lblTypeTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:DefaultResource, StudentSchooltype%>" />
                                        </label>
                                        <div class="col-md-2 ">
                                            <asp:DropDownList ID="SchoolTypeDropDownList" runat="server" class="select-chosen" data-placeholder="<%$ Resources:DefaultResource, StudentSchooltype%>" AppendDataBoundItems="true"
                                                DataSourceID="SchoolTypeDS" DataTextField="SchoolType" DataValueField="TypeId" Text='<%# Bind("SchoolType") %>' > 
                                                <asp:ListItem Text="<%$ Resources:DefaultResource, StudentSchooltype%>" Value="0"></asp:ListItem>
                                            </asp:DropDownList>
                                           </div>
                                      </div> 
                               <div class="form-group">
                                    <label for="StudentTelTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="LiteralTel" runat="server" Text="<%$ Resources:DefaultResource, StudentTel%>" />
                                        </label>
                                        <div class="col-md-2 ">
                                            
                                          <asp:TextBox ID="StudentTelTextBox" runat="server" CssClass="form-control" Text='<%# Bind("StudentTel") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, StudentTel%>"/>
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidatorTel" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="StudentTelTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate = "StudentTelTextBox" ID="RegularExpressionValidator1" ValidationExpression = "^[\s\S]{0,8}$" runat="server" ErrorMessage="Maximum 8 characters allowed.">

                                            </asp:RegularExpressionValidator>
                                                <asp:RegularExpressionValidator Display = "Dynamic" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true" ControlToValidate = "StudentTelTextBox" ID="RegularExpressionValidator2" ValidationExpression = "^5[0-9].*|4[0-9].*|6[0-9].*|9[0-9].*" runat="server" ErrorMessage="<%$ Resources:DefaultResource, NumValidateTitle%>">
                                            </asp:RegularExpressionValidator>

                                             <asp:RegularExpressionValidator Display = "Dynamic" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true" ControlToValidate = "StudentTelTextBox" ID="RegularExpressionValidator3" ValidationExpression = "^([0-9]{8,8})$" runat="server" ErrorMessage="<%$ Resources:DefaultResource, NumValidateLengthTitle%>">
                                            </asp:RegularExpressionValidator>
                                        </div>
                                    <label for="FatherTelTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal9" runat="server" Text="<%$ Resources:DefaultResource, StudenFatherTel%>" />
                                        </label>
                                        <div class="col-md-2 ">
                                          <asp:TextBox ID="FatherTelTextBox" runat="server" CssClass="form-control" Text='<%# Bind("FatherTel") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, StudenFatherTel%>"/>
                                        </div>
                                    <label for="MotherTelTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal10" runat="server" Text="<%$ Resources:DefaultResource, StudentMonthTel%>" />
                                        </label>
                                        <div class="col-md-2 ">
                                          <asp:TextBox ID="MotherTelTextBox" runat="server" CssClass="form-control" Text='<%# Bind("MotherTel") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, StudentMonthTel%>"/>
                                        </div>
                                   </div>
                                       <div class="form-group">
                                         <label for="FatherNameTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal11" runat="server" Text="<%$ Resources:DefaultResource, StudentFatherName%>" />
                                        </label>
                                        <div class="col-md-6 ">
                                          <asp:TextBox ID="FatherNameTextBox" runat="server" CssClass="form-control" Text='<%# Bind("FatherName") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, StudentFatherName%>"/>
                                        </div>
                                        <label for="FatherNameTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal12" runat="server" Text="<%$ Resources:DefaultResource, StudentRelative%>" />
                                        </label>
                                        <div class="col-md-2 ">
                                          <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text='<%# Bind("Kinship") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, StudentRelative%>"/>
                                        </div>
                                       </div> 
                                    <div class="form-group">
                                        <label for="StudentAreaTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal13" runat="server" Text="<%$ Resources:DefaultResource, StudentArea%>" />
                                        </label>
                                        <div class="col-md-2 ">
                                            <asp:DropDownList ID="AreaDropDownList" runat="server" class="select-chosen" data-placeholder="<%$ Resources:DefaultResource, StudentArea%>" AppendDataBoundItems="true"
                                                DataSourceID="AreaDS" DataTextField="Citydec" DataValueField="CityId" Text='<%# Bind("Area") %>'> 
                                                <asp:ListItem Text="<%$ Resources:DefaultResource, StudentArea%>" Value=""></asp:ListItem>
                                            </asp:DropDownList>
      
                                        </div>
                                         <label for="StudentAreaTextBox" class="col-md-1 control-label">
                                            <asp:Literal ID="Literal14" runat="server" Text="<%$ Resources:DefaultResource, StudentBlockNo%>" />
                                        </label>
                                        <div class="col-md-1 ">
                                          <asp:TextBox ID="BlockNoTextBox" runat="server" CssClass="form-control" Text='<%# Bind("BlockNo") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, StudentBlockNo%>"/>
                                        </div>
                                         <label for="StreetTextBox" class="col-md-1 control-label">
                                            <asp:Literal ID="Literal15" runat="server" Text="<%$ Resources:DefaultResource, StudentStreetNo%>" />
                                        </label>
                                        <div class="col-md-1 ">
                                          <asp:TextBox ID="StreetTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Street") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, StudentStreetNo%>"/>
                                        </div>

                                         <label for="HouseNoTextBox" class="col-md-1 control-label">
                                            <asp:Literal ID="Literal16" runat="server" Text="<%$ Resources:DefaultResource, StudentBuildingNo%>" />
                                        </label>
                                        <div class="col-md-1 ">
                                          <asp:TextBox ID="HouseNoTextBox" runat="server" CssClass="form-control" Text='<%# Bind("HouseNo") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, StudentBuildingNo%>"/>
                                        </div>

                                         <label for="FloorNoTextBox" class="col-md-1 control-label">
                                            <asp:Literal ID="Literal17" runat="server" Text="<%$ Resources:DefaultResource, StudentFloorNo%>" />
                                        </label>
                                        <div class="col-md-1 ">
                                          <asp:TextBox ID="FloorNoTextBox" runat="server" CssClass="form-control" Text='<%# Bind("FloorNo") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, StudentFloorNo%>"/>
                                        </div>

                                        </div>
                                       <div class="form-group">
                                             <label for="NotesTextBox" class="col-md-1 control-label">
                                            <asp:Literal ID="Literal20" runat="server" Text="<%$ Resources:DefaultResource, Gada%>" />
                                        </label>
                                           <div class="col-md-1">
                                          <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Text='<%# Bind("Gada") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, Gada%>"/>
                                        </div>
                                    <label for="SaleManNameTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal18" runat="server" Text="<%$ Resources:DefaultResource, SaleManName%>" />
                                        </label>
                                        <div class="col-md-2 ">
                                          <asp:TextBox ID="SaleManNameTextBox" runat="server" CssClass="form-control" Text='<%# Bind("SalesMan") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, SaleManName%>"/>
                                        </div>
                                        <label for="NotesTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal19" runat="server" Text="<%$ Resources:DefaultResource, CardNotes%>" />
                                        </label>
                                        <div class="col-md-4 ">
                                          <asp:TextBox ID="NotesTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Note") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, CardNotes%>"/>
                                        </div>
                                          </div>
                                       <div class="form-group">
                                           <label for="TextBoxLocation" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal21" runat="server" Text="<%$ Resources:DefaultResource, Location%>" />
                                        </label>
                                          <div class="col-md-10">
                                         <asp:TextBox ID="TextBoxLocation" runat="server" CssClass="form-control" Text='<%# Bind("InstituteName") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, Location%>" TextMode="MultiLine" />
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
                        <asp:Label ID="CodeLabel" runat="server" Text='<%# Eval("StudentId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("StudentName") %>' />
                    </td>
                   <td>
                        <asp:Label ID="StudentCivilIdLabel" runat="server" Text='<%# Eval("StudentCivilId") %>' />
                    </td>
                  <td>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("PeriodName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("NATIONALITY_DESC") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("StudentTel") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("FatherTel") %>' />
                    </td>
                     <td>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("MotherTel") %>' />
                    </td>
                     <td>
                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("Citydec") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("GovDesc") %>' />
                    </td>
                   <td class="text-center block-options">
                      
                         <asp:LinkButton ID="EditLinkButton" runat="server" CommandName="Edit" Text="" data-toggle="tooltip" title="<%$ Resources:DefaultResource, Edite%>" CssClass="btn btn-sm btn-default" data-original-title="<%$ Resources:DefaultResource, Edite%>">
                          
                                <i class="fa fa-pencil"></i>
                        </asp:LinkButton>
                        
                     
                            <asp:LinkButton ID="DeleteLinkButton" runat="server" CommandName="Delete" Text="" data-toggle="tooltip" title="<%$ Resources:DefaultResource, Delete%>" CssClass="btn btn-sm btn-danger" data-original-title="<%$ Resources:DefaultResource, Delete%>"  OnClientClick="javascript:if(!confirm('هل انت متأكد من حذف هذا السجل؟')){return false;}">
                                    <i class="fa fa-times"></i>
                            </asp:LinkButton>

                         <a data-toggle="tooltip" title="<%= Resources.DefaultResource.SalesInvoiceInv%>"   class="btn btn-sm btn-success" data-original-title="<%= Resources.DefaultResource.SalesInvoice%>" href="SchInvoices.aspx?StudentId=<%# Eval("StudentId")%>">
                            <i class="fa fa-users"></i>
                        </a>
                 
                        

                    </td>
                     
                              
                </tr>

            </ItemTemplate>
        <LayoutTemplate>
                
                <table id="general-table" class="table table-striped table-vcenter table-bordered table-condensed">
                    <thead >
                        <tr>
                            <th class ="text-center">
                                <asp:LinkButton ID="CodeTitleLinkButton" runat="server" CommandArgument="code" CommandName="Sort" Text="<%$ Resources:DefaultResource, code%>" />
                            </th>
                            <th class ="text-center">
                                <asp:LinkButton ID="StudentNameLinkButton" runat="server" CommandArgument="StudentName" CommandName="Sort" Text="<%$ Resources:DefaultResource, StudentName%>" />
                            </th>
                             <th class ="text-center">
                                <asp:LinkButton ID="CivilIdLinkButton" runat="server" CommandArgument="StudentCivilId" CommandName="Sort" Text="<%$ Resources:DefaultResource, CivilId%>" />
                            </th>                      
                             <th class ="text-center">
                                <asp:LinkButton ID="StudentPeriodLinkButton" runat="server" CommandArgument="PeriodName" CommandName="Sort" Text="<%$ Resources:DefaultResource, StudentPeriod%>" />
                            </th>
                            <th class ="text-center">
                                <asp:LinkButton ID="LinkButtonNat" runat="server" CommandArgument="NatId" CommandName="Sort" Text="<%$ Resources:DefaultResource, StudentNat%>" />
                            </th>
                         <th class ="text-center">
                                <asp:LinkButton ID="StudentTelLinkButton" runat="server" CommandArgument="StudentTel" CommandName="Sort" Text="<%$ Resources:DefaultResource, StudentTel%>" />
                            </th>
                             <th class ="text-center">
                                <asp:LinkButton ID="FatherTelLinkButton" runat="server" CommandArgument="FatherTel" CommandName="Sort" Text="<%$ Resources:DefaultResource, StudenFatherTel%>" />
                            </th>
                            <th class ="text-center">
                                <asp:LinkButton ID="MotherTelLinkButton" runat="server" CommandArgument="MotherTel" CommandName="Sort" Text="<%$ Resources:DefaultResource, StudentMonthTel%>" />
                            </th>
                             <th class ="text-center">
                                <asp:LinkButton ID="CitydecLinkButton" runat="server" CommandArgument="MotherTel" CommandName="Sort" Text="<%$ Resources:DefaultResource, StudentArea%>" />
                            </th>
                             <th class ="text-center">
                                <asp:LinkButton ID="GovDescLinkButton" runat="server" CommandArgument="MotherTel" CommandName="Sort" Text="<%$ Resources:DefaultResource, GovDesc%>" />
                            </th>

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
                           
                           
        <asp:ObjectDataSource ID="StudentsDS" runat="server"  SelectMethod="Read" TypeName="BOL.Sch_Student" DeleteMethod="DML" InsertMethod="DML" UpdateMethod="DML"><DeleteParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="3" />
            <asp:Parameter Name="StudentId" Type="Int64" />
            <asp:Parameter Name="StudentCode" Type="String" />
            <asp:Parameter Name="Sex" Type="Int32" />
            <asp:Parameter Name="StudentName" Type="String" />
            <asp:Parameter Name="NatId" Type="Int32" />
            <asp:Parameter Name="SchoolName" Type="String" />
            <asp:Parameter Name="SchoolType" Type="Int32" />
            <asp:Parameter Name="PeriodId" Type="Int64" />
            <asp:Parameter Name="StudentCivilId" Type="String" />
            <asp:Parameter Name="FatherTel" Type="String" />
            <asp:Parameter Name="MotherTel" Type="String" />
            <asp:Parameter Name="OtherTel" Type="String" />
            <asp:Parameter Name="StudentTel" Type="String" />
            <asp:Parameter Name="FatherName" Type="String" />
            <asp:Parameter Name="BrithDate" Type="String" />
            <asp:Parameter Name="Kinship" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Area" Type="Int32" />
            <asp:Parameter Name="BlockNo" Type="String" />
            <asp:Parameter Name="Street" Type="String" />
            <asp:Parameter Name="Gada" Type="String" />
            <asp:Parameter Name="HouseNo" Type="String" />
            <asp:Parameter Name="FloorNo" Type="String" />
            <asp:Parameter Name="KnowToIns" Type="Int32" />
            <asp:Parameter Name="Note" Type="String" />
            <asp:Parameter Name="InstituteName" Type="String" />
            <asp:Parameter Name="LeaveReason" Type="String" />
            <asp:Parameter Name="HomeTel" Type="String" />
            <asp:Parameter Name="PervStudyFlag" Type="Boolean" />
            <asp:Parameter Name="SalesMan" Type="String" />
            <asp:Parameter Name="UserId" Type="Int32" />
            <asp:Parameter Name="SchoolGovId" Type="Int32" />
            <asp:Parameter Name="EmpId" Type="Int64" />
            <asp:Parameter Name="BranchId" Type="Int64" />
            <asp:Parameter Name="OrgId" Type="Int64" />
            <asp:Parameter Name="CreatedBy" Type="Int32" />
            <asp:SessionParameter DefaultValue="" Name="UpdateBy" SessionField="UserId" Type="Int32" />
            <asp:CookieParameter CookieName="UserId" Name="DeletedBy" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ActionCode" Type="String" DefaultValue="1" /><asp:Parameter Name="StudentId" Type="Int64" /><asp:Parameter Name="StudentCode" Type="String" />
                <asp:Parameter Name="Sex" Type="Int32" />
                <asp:Parameter Name="StudentName" Type="String" />
                <asp:Parameter Name="NatId" Type="Int32" />
                <asp:Parameter Name="SchoolName" Type="String" />
                <asp:Parameter Name="SchoolType" Type="Int32" />
                <asp:Parameter Name="PeriodId" Type="Int64" />
                <asp:Parameter Name="StudentCivilId" Type="String" />
                <asp:Parameter Name="FatherTel" Type="String" />
                <asp:Parameter Name="MotherTel" Type="String" />
                <asp:Parameter Name="OtherTel" Type="String" />
                <asp:Parameter Name="StudentTel" Type="String" />
                <asp:Parameter Name="FatherName" Type="String" />
                <asp:Parameter Name="BrithDate" Type="String" />
                <asp:Parameter Name="Kinship" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Area" Type="Int32" />
                <asp:Parameter Name="BlockNo" Type="String" />
                <asp:Parameter Name="Street" Type="String" />
                <asp:Parameter Name="Gada" Type="String" />
                <asp:Parameter Name="HouseNo" Type="String" />
                <asp:Parameter Name="FloorNo" Type="String" />
                <asp:Parameter Name="KnowToIns" Type="Int32" />
                <asp:Parameter Name="Note" Type="String" />
                <asp:Parameter Name="InstituteName" Type="String" />
                <asp:Parameter Name="LeaveReason" Type="String" />
                <asp:Parameter Name="HomeTel" Type="String" />
                <asp:Parameter Name="PervStudyFlag" Type="Boolean" />
                <asp:Parameter Name="SalesMan" Type="String" />
                <asp:Parameter Name="UserId" Type="Int32" />
                <asp:Parameter Name="SchoolGovId" Type="Int32" />
                <asp:Parameter Name="EmpId" Type="Int64" />
                <asp:Parameter Name="BranchId" Type="Int64" />
                <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:SessionParameter Name="CreatedBy" SessionField="UserId" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="UpdateBy" SessionField="UserId" Type="Int32" />
                <asp:Parameter Name="DeletedBy" Type="Int32" /></InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="2" Name="ActionCode" Type="String" />
                <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:Parameter Name="StudentId" Type="Int64" />
                <asp:Parameter Name="PeriodId" Type="Int64" />
                <asp:Parameter Name="BranchId" Type="Int64" />
                <asp:ControlParameter ControlID="SearchTextBox" DefaultValue="" Name="SearchText" PropertyName="Text" Type="String" />
            </SelectParameters><UpdateParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="2" /><asp:Parameter Name="StudentId" Type="Int64" /><asp:Parameter Name="StudentCode" Type="String" />
                <asp:Parameter Name="Sex" Type="Int32" />
                <asp:Parameter Name="StudentName" Type="String" />
                <asp:Parameter Name="NatId" Type="Int32" />
                <asp:Parameter Name="SchoolName" Type="String" />
                <asp:Parameter Name="SchoolType" Type="Int32" />
                <asp:Parameter Name="PeriodId" Type="Int64" />
                <asp:Parameter Name="StudentCivilId" Type="String" />
                <asp:Parameter Name="FatherTel" Type="String" />
                <asp:Parameter Name="MotherTel" Type="String" />
                <asp:Parameter Name="OtherTel" Type="String" />
                <asp:Parameter Name="StudentTel" Type="String" />
                <asp:Parameter Name="FatherName" Type="String" />
                <asp:Parameter Name="BrithDate" Type="String" />
                <asp:Parameter Name="Kinship" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Area" Type="Int32" />
                <asp:Parameter Name="BlockNo" Type="String" />
                <asp:Parameter Name="Street" Type="String" />
                <asp:Parameter Name="Gada" Type="String" />
                <asp:Parameter Name="HouseNo" Type="String" />
                <asp:Parameter Name="FloorNo" Type="String" />
                <asp:Parameter Name="KnowToIns" Type="Int32" />
                <asp:Parameter Name="Note" Type="String" />
                <asp:Parameter Name="InstituteName" Type="String" />
                <asp:Parameter Name="LeaveReason" Type="String" />
                <asp:Parameter Name="HomeTel" Type="String" />
                <asp:Parameter Name="PervStudyFlag" Type="Boolean" />
                <asp:Parameter Name="SalesMan" Type="String" />
                <asp:Parameter Name="UserId" Type="Int32" />
                <asp:Parameter Name="SchoolGovId" Type="Int32" />
                <asp:Parameter Name="EmpId" Type="Int64" />
                <asp:Parameter Name="BranchId" Type="Int64" /><asp:Parameter Name="OrgId" Type="Int64" />
                <asp:Parameter Name="CreatedBy" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="UpdateBy" SessionField="UserId" Type="Int32" />
                <asp:Parameter Name="DeletedBy" Type="Int32" />

                               </UpdateParameters></asp:ObjectDataSource>

        <br />
                           
                           
        <asp:ObjectDataSource ID="NatDS" runat="server"  SelectMethod="Read" TypeName="BOL.CDE_NATIONALITY" DeleteMethod="DML" InsertMethod="DML" UpdateMethod="DML" OldValuesParameterFormatString="original_{0}"><DeleteParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="3" />
            <asp:Parameter Name="StageId" Type="Int64" />
            <asp:Parameter Name="StageName" Type="String" />
            <asp:Parameter Name="PaymentValue" Type="Decimal" />
            <asp:Parameter Name="OrgId" Type="Int64" />
            <asp:Parameter Name="BranchId" Type="Int64" />
            <asp:Parameter Name="IsActive" Type="Boolean" />
            <asp:Parameter Name="CreatedBy" Type="Int32" />
            <asp:Parameter Name="UpdateBy" Type="Int32" />
            <asp:Parameter Name="DeletedBy" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ActionCode" Type="String" DefaultValue="1" /><asp:Parameter Name="StageId" Type="Int64" /><asp:Parameter Name="StageName" Type="String" /><asp:Parameter Name="PaymentValue" Type="Decimal" />
                <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:Parameter Name="BranchId" Type="Int64" /><asp:Parameter Name="IsActive" Type="Boolean" />
                <asp:SessionParameter Name="CreatedBy" SessionField="UserId" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="UpdateBy" SessionField="UserId" Type="Int32" />
                <asp:Parameter Name="DeletedBy" Type="Int32" /></InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" />
                <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
            </SelectParameters><UpdateParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="2" /><asp:Parameter Name="StageId" Type="Int64" /><asp:Parameter Name="StageName" Type="String" /><asp:Parameter Name="PaymentValue" Type="Decimal" /><asp:Parameter Name="OrgId" Type="Int64" /><asp:Parameter Name="BranchId" Type="Int64" /><asp:Parameter Name="IsActive" Type="Boolean" /><asp:Parameter Name="CreatedBy" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="UpdateBy" SessionField="UserId" Type="Int32" />
                <asp:Parameter Name="DeletedBy" Type="Int32" /></UpdateParameters></asp:ObjectDataSource>

                           
        <asp:ObjectDataSource ID="AreaDS" runat="server"  SelectMethod="Read" TypeName="BOL.Cde_Area" DeleteMethod="DML" InsertMethod="DML" UpdateMethod="DML" OldValuesParameterFormatString="original_{0}"><DeleteParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="3" />
            <asp:Parameter Name="StageId" Type="Int64" />
            <asp:Parameter Name="StageName" Type="String" />
            <asp:Parameter Name="PaymentValue" Type="Decimal" />
            <asp:Parameter Name="OrgId" Type="Int64" />
            <asp:Parameter Name="BranchId" Type="Int64" />
            <asp:Parameter Name="IsActive" Type="Boolean" />
            <asp:Parameter Name="CreatedBy" Type="Int32" />
            <asp:Parameter Name="UpdateBy" Type="Int32" />
            <asp:Parameter Name="DeletedBy" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ActionCode" Type="String" DefaultValue="1" /><asp:Parameter Name="StageId" Type="Int64" /><asp:Parameter Name="StageName" Type="String" /><asp:Parameter Name="PaymentValue" Type="Decimal" />
                <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:Parameter Name="BranchId" Type="Int64" /><asp:Parameter Name="IsActive" Type="Boolean" />
                <asp:SessionParameter Name="CreatedBy" SessionField="UserId" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="UpdateBy" SessionField="UserId" Type="Int32" />
                <asp:Parameter Name="DeletedBy" Type="Int32" /></InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" />
                <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
            </SelectParameters><UpdateParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="2" /><asp:Parameter Name="StageId" Type="Int64" /><asp:Parameter Name="StageName" Type="String" /><asp:Parameter Name="PaymentValue" Type="Decimal" /><asp:Parameter Name="OrgId" Type="Int64" /><asp:Parameter Name="BranchId" Type="Int64" /><asp:Parameter Name="IsActive" Type="Boolean" /><asp:Parameter Name="CreatedBy" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="UpdateBy" SessionField="UserId" Type="Int32" />
                <asp:Parameter Name="DeletedBy" Type="Int32" /></UpdateParameters></asp:ObjectDataSource>

                           
        <asp:ObjectDataSource ID="SchoolTypeDS" runat="server"  SelectMethod="Read" TypeName="BOL.Sch_SchoolType" DeleteMethod="DML" InsertMethod="DML" UpdateMethod="DML" OldValuesParameterFormatString="original_{0}"><DeleteParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="3" />
            <asp:Parameter Name="StageId" Type="Int64" />
            <asp:Parameter Name="StageName" Type="String" />
            <asp:Parameter Name="PaymentValue" Type="Decimal" />
            <asp:Parameter Name="OrgId" Type="Int64" />
            <asp:Parameter Name="BranchId" Type="Int64" />
            <asp:Parameter Name="IsActive" Type="Boolean" />
            <asp:Parameter Name="CreatedBy" Type="Int32" />
            <asp:Parameter Name="UpdateBy" Type="Int32" />
            <asp:Parameter Name="DeletedBy" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ActionCode" Type="String" DefaultValue="1" /><asp:Parameter Name="StageId" Type="Int64" /><asp:Parameter Name="StageName" Type="String" /><asp:Parameter Name="PaymentValue" Type="Decimal" />
                <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:Parameter Name="BranchId" Type="Int64" /><asp:Parameter Name="IsActive" Type="Boolean" />
                <asp:SessionParameter Name="CreatedBy" SessionField="UserId" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="UpdateBy" SessionField="UserId" Type="Int32" />
                <asp:Parameter Name="DeletedBy" Type="Int32" /></InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" />
                <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
            </SelectParameters><UpdateParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="2" /><asp:Parameter Name="StageId" Type="Int64" /><asp:Parameter Name="StageName" Type="String" /><asp:Parameter Name="PaymentValue" Type="Decimal" /><asp:Parameter Name="OrgId" Type="Int64" /><asp:Parameter Name="BranchId" Type="Int64" /><asp:Parameter Name="IsActive" Type="Boolean" /><asp:Parameter Name="CreatedBy" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="UpdateBy" SessionField="UserId" Type="Int32" />
                <asp:Parameter Name="DeletedBy" Type="Int32" /></UpdateParameters></asp:ObjectDataSource>

                           
        <asp:ObjectDataSource ID="PeriodsDS" runat="server"  SelectMethod="Read" TypeName="BOL.Sch_Periods" OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" />
                <asp:Parameter Name="PeriodId" Type="Int64" />
                <asp:Parameter Name="StageId" Type="Int64" />
                <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:Parameter Name="BranchId" Type="Int64" />
            </SelectParameters></asp:ObjectDataSource>

    <asp:TextBox ID="txtOrgId" runat="server" 
        Visible="False" ></asp:TextBox>

    </div>
        
</div>
                            
          