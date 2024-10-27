    <%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Sch_TeachersList.ascx.cs" Inherits="WebSchool.ADMIN.Controls.School.Sch_TeachersList" %>


<div class="content-header">
    <%-- <div class="header-section">
        <h1>
            <i class="gi gi-user"></i> <%= Resources.DefaultResource.Main%>
        </h1>
    </div>--%>
</div>
<ul class="breadcrumb breadcrumb-top">
    <li><a href="Main.aspx"><%= Resources.DefaultResource.Main%> </a></li>
    <li> <%= Resources.DefaultResource.SchoolTeachers %> </li>
</ul>


       
<div class="block table-responsive">
    <!-- Table Styles Title -->
    <div class="block-title">
        <h2><strong><%= Resources.DefaultResource.List%>  </strong> <%= Resources.DefaultResource.SchoolTeachers%> </h2>
        <div class="block-options pull-right">
            <asp:LinkButton ID="NewRecord" runat="server" CssClass="btn btn-sm btn-success" data-toggle="tooltip" title="<%$ Resources:DefaultResource, NewRecord%>"  data-original-title="<%$ Resources:DefaultResource, NewRecord%>" OnClick="NewRecord_Click"> <i class="fa fa-file"></i></asp:LinkButton>
        </div>
    </div>
    <!-- END Table Styles Title -->
    
       <div class="row">
           <%-- <label for="PeriodDropDownList" class="col-md-2 control-label">
                <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:DefaultResource, StudentPeriod%>" />
            </label>--%>
             <div class="col-md-4">
                        <asp:DropDownList ID="PeriodDropDownList" runat="server" CssClass="form-control select-chosen" AppendDataBoundItems="True" DataSourceID="PeriodsDS" DataTextField="PeriodName" DataValueField="PeriodId" AutoPostBack="True" OnSelectedIndexChanged="PeriodDropDownList_SelectedIndexChanged">
                        <asp:ListItem Text="<%$ Resources:DefaultResource, ChoosePeriod%>"  Value=""></asp:ListItem>
                   
                    </asp:DropDownList>
                </div>

             <div class="col-md-4">
                        <asp:DropDownList ID="SubjectsDropDownList" runat="server" CssClass="form-control "  DataSourceID="SubjectsDS" DataTextField="SubName" DataValueField="SubId" OnSelectedIndexChanged="SubjectsDropDownList_SelectedIndexChanged" AutoPostBack="True" >
                       <%-- <asp:ListItem Text="<%$ Resources:DefaultResource, ChooseSubject%>"  Value=""></asp:ListItem>--%>
                   
                    </asp:DropDownList>
                </div>
            <div class="col-md-4">
                        <asp:DropDownList ID="DropDownListNewArea" runat="server" CssClass="form-control select-chosen" AppendDataBoundItems="True" DataSourceID="AreaDS" DataTextField="Citydec" DataValueField="CityId">
                        <asp:ListItem Text="<%$ Resources:DefaultResource, ChooseArea%>"  Value=""></asp:ListItem>
                   
                    </asp:DropDownList>
                 </div>
          </div> 
   
      
     <br />
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
    <asp:ListView ID="lv" runat="server" DataKeyNames="TeacherId" DataSourceID="TeacherDS" OnItemCommand="lv_ItemCommand" OnItemDataBound="lv_ItemDataBound">
            <EditItemTemplate>
               <tr>
                    <td colspan="10">
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
                          
                                  
                                     <asp:TextBox ID="TeacherId" runat="server" CssClass="form-control" Text='<%# Bind("TeacherId") %>'  Visible="false"/>

                            <div class="form-group">
                                        <label for="TitleArTextBox" class="col-md-1 control-label">
                                            <asp:Literal ID="TitleArLiteral1" runat="server" Text="<%$ Resources:DefaultResource, code%>" />
                                        </label>
                                        <div class="col-md-1 ">
                                            <asp:TextBox ID="CodeTextBox" runat="server" CssClass="form-control" Text='<%# Bind("TeacherCode") %>' ReadOnly="true" />
                                           </div>

                                        <label for="lblName" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:DefaultResource, teacherName%>" />
                                        </label>
                                        <div class="col-md-4 ">
                                            <asp:TextBox ID="NameTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Name") %>'
                                                data-placeholder="<%$ Resources:DefaultResource, StudentName%>" />
                                            <asp:RequiredFieldValidator ID="NameRequiredFieldValidator" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="NameTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator>

                                        </div>

                                          <label for="birthTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:DefaultResource, HiringDate%>" />
                                        </label>
                                        <div class="col-md-2 ">
                                            <asp:RequiredFieldValidator ID="TrainingsDateEndTextBoxRFV" runat="server" ErrorMessage="لا يمكن أن يكون تاريخ فارغا." Display="Dynamic"
                                                ControlToValidate="HireDateTextBox" ValidationGroup="DML" CssClass="label label-warning" >
                                            </asp:RequiredFieldValidator>

                                            <asp:TextBox ID="HireDateTextBox" runat="server" Text='<%# Bind("HireDate","{0: dd/MM/yyyy}") %>' CssClass="form-control input-datepicker" placeholder="<%$ Resources:DefaultResource,HiringDate%>" data-date-format="dd/mm/yyyy" AutoComplete="Off"/>
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
                                            <asp:DropDownList ID="SexDropDownList" runat="server" class="select-chosen" data-placeholder="<%$ Resources:DefaultResource, StudentMan%>" AppendDataBoundItems="true" Text='<%# Bind("GenderId") %>'> 
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
                                              <label for="CivilTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:DefaultResource, CivilId%>" />
                                        </label>
                                        <div class="col-md-2 ">
                                              <asp:TextBox ID="CivilTextBox" runat="server" CssClass="form-control" Text='<%# Bind("CivilId") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, CivilId%>"/>
                                           </div>
                                      
                                    </div>
                                  <div class="form-group">
                                   
                                          <label for="SchoolNameTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:DefaultResource, UserName%>" />
                                        </label>
                                        <div class="col-md-2 ">
                                            <div class="input-group">
                                          <asp:TextBox ID="StudentSchoolNameTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Username") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, UserName%>"/>
                                                 <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                           </div>
                                          </div> 
                                          <label for="SchoolNameTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal20" runat="server" Text="<%$ Resources:DefaultResource, Password%>" />
                                        </label>
                                        <div class="col-md-2 ">
                                            <div class="input-group">
                                          <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Text='<%# Bind("Password") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, Password%>"/>
                                                 <span class="input-group-addon"><i class="gi gi-asterisk"></i></span>
                                           </div>
                                            </div>

                                               <label for="txtTel" class="col-md-2 control-label">
                                            <asp:Literal ID="LiteralTel" runat="server" Text="<%$ Resources:DefaultResource, CardPhone%>" />
                                        </label>
                                        <div class="col-md-2 ">
                                              
                                            <div class="input-group">
                                          <asp:TextBox ID="txtTel" runat="server" CssClass="form-control" Text='<%# Bind("Tel") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, StudentTel%>"/>
                                                  <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                                                </div>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorTel" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="txtTel" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator>

                                             <asp:RegularExpressionValidator Display = "Dynamic" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true" ControlToValidate = "txtTel" ID="RegularExpressionValidator2" ValidationExpression = "^5[0-9].*|4[0-9].*|6[0-9].*|9[0-9].*" runat="server" ErrorMessage="<%$ Resources:DefaultResource, NumValidateTitle%>">
                                            </asp:RegularExpressionValidator>

                                             <asp:RegularExpressionValidator Display = "Dynamic" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true" ControlToValidate = "txtTel" ID="RegularExpressionValidator3" ValidationExpression = "^([0-9]{8,8})$" runat="server" ErrorMessage="<%$ Resources:DefaultResource, NumValidateLengthTitle%>">
                                            </asp:RegularExpressionValidator>
                                        </div>
                                      
                                     

                                      </div>  
                               <div class="form-group">
                                       <label for="txtHomeTel" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal10" runat="server" Text="<%$ Resources:DefaultResource, AnotherTel%>" />
                                        </label>
                                        <div class="col-md-2 ">
                                              
                                            <div class="input-group">
                                          <asp:TextBox ID="txtHomeTel" runat="server" CssClass="form-control" Text='<%# Bind("HomeTel") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, AnotherTel%>"/>
                                                  <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                                                </div>
                                            <asp:RegularExpressionValidator Display = "Dynamic" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true" ControlToValidate = "txtHomeTel" ID="RegularExpressionValidator1" ValidationExpression = "^5[0-9].*|4[0-9].*|6[0-9].*|9[0-9].*" runat="server" ErrorMessage="<%$ Resources:DefaultResource, NumValidateTitle%>">
                                            </asp:RegularExpressionValidator>

                                             <asp:RegularExpressionValidator Display = "Dynamic" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true" ControlToValidate = "txtHomeTel" ID="RegularExpressionValidator4" ValidationExpression = "^([0-9]{8,8})$" runat="server" ErrorMessage="<%$ Resources:DefaultResource, NumValidateLengthTitle%>">
                                            </asp:RegularExpressionValidator>
                                                
                                        </div>
                                    <label for="StudentAreaTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal13" runat="server" Text="<%$ Resources:DefaultResource, StudentArea%>" />
                                        </label>
                                        <div class="col-md-2">
                                            <asp:DropDownList ID="AreaDropDownList" runat="server" class="select-chosen" data-placeholder="<%$ Resources:DefaultResource, StudentArea%>" AppendDataBoundItems="true"
                                                DataSourceID="AreaDS" DataTextField="Citydec" DataValueField="CityId" Text='<%# Bind("AreaId") %>'> 
                                                <asp:ListItem Text="<%$ Resources:DefaultResource, StudentArea%>" Value=""></asp:ListItem>
                                            </asp:DropDownList>
      
                                        </div>
                                         

                                    <label for="FatherTelTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal9" runat="server" Text="<%$ Resources:DefaultResource, CardEmail%>" />
                                        </label>
                                        <div class="col-md-2 ">
                                             <div class="input-group">
                                          <asp:TextBox ID="FatherTelTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Email") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, CardEmail%>"/>
                                                 <span class="input-group-addon"><i class="gi gi-envelope"></i></span>
                                           </div>
                                        </div>

                             
                                       
                                   </div>
                                       
                                        <div class="form-group">
                                         <label for="AddressTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal14" runat="server" Text="<%$ Resources:DefaultResource, StudentBlockNo%>" />
                                        </label>
                                        <div class="col-md-2">
                                          <asp:TextBox ID="AddressTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Address") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, StudentBlockNo%>"/>
                                        </div>
                                        <label for="EducationalTitleTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal8" runat="server" Text="<%$ Resources:DefaultResource, EducationalTitle%>" />
                                        </label>
                                        <div class="col-md-2">
                                          <asp:TextBox ID="EducationalTitleTextBox" runat="server" CssClass="form-control" Text='<%# Bind("EducationalTitle") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, EducationalTitle%>"/>
                                        </div>
                                             
                                   <label for="EducationalTitleTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal12" runat="server" Text="<%$ Resources:DefaultResource, Salary%>" />
                                        </label>
                                        <div class="col-md-2">
                                          <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text='<%# Bind("SalaryValue") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, Salary%>"/>
                                        </div>

                                      </div>
                                    
                                  <div class="form-group">
                                         <label for="StudentAreaTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal11" runat="server" Text="<%$ Resources:DefaultResource, ContractDesc%>" />
                                        </label>
                                        <div class="col-md-10">
                                          <asp:TextBox ID="TextBoxContractDesc" runat="server" CssClass="form-control" Text='<%# Bind("ContractDesc") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, ContractDesc%>" TextMode="MultiLine" Height="120" />
                                        </div>
                                       </div>

                                       <div class="form-group">
                                          <label for="LicenceTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal15" runat="server" Text="<%$ Resources:DefaultResource, FingerPrint%>" />
                                        </label>
                                        <div class="col-md-2">
                                             <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" Text='<%# Bind("Notes") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, FingerPrint%>"/> 

                                           
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
                    <td colspan="10">
                        <div class="col-md-12">
                            <!-- Basic Form Elements Block -->
                            <div class="block">
                                <!-- Basic Form Elements Title -->
                                <div class="block-title">
                                    <h2><strong><%= Resources.DefaultResource.List %></strong> <%= Resources.DefaultResource.SchoolTeachers %></h2>
                                </div>
                                <!-- END Form Elements Title -->
                                <!-- Basic Form Elements Content -->
                                  <div class="form-horizontal form-bordered">
                                                                  
                             <div class="form-group">
                                        <label for="TitleArTextBox" class="col-md-1 control-label">
                                            <asp:Literal ID="TitleArLiteral1" runat="server" Text="<%$ Resources:DefaultResource, code%>" />
                                        </label>
                                        <div class="col-md-1 ">
                                            <asp:TextBox ID="CodeTextBox" runat="server" CssClass="form-control" Text='<%# Bind("TeacherCode") %>' ReadOnly="true" />
                                           </div>

                                        <label for="lblName" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:DefaultResource, teacherName%>" />
                                        </label>
                                        <div class="col-md-4 ">
                                            <asp:TextBox ID="NameTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Name") %>'
                                                data-placeholder="<%$ Resources:DefaultResource, StudentName%>" />
                                            <asp:RequiredFieldValidator ID="NameRequiredFieldValidator" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="NameTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator>

                                        </div>

                                          <label for="birthTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:DefaultResource, HiringDate%>" />
                                        </label>
                                        <div class="col-md-2 ">
                                            <asp:RequiredFieldValidator ID="TrainingsDateEndTextBoxRFV" runat="server" ErrorMessage="لا يمكن أن يكون تاريخ فارغا." Display="Dynamic"
                                                ControlToValidate="HireDateTextBox" ValidationGroup="DML" CssClass="label label-warning" >
                                            </asp:RequiredFieldValidator>

                                            <asp:TextBox ID="HireDateTextBox" runat="server" Text='<%# Bind("HireDate","{0: dd/MM/yyyy}") %>' CssClass="form-control input-datepicker" placeholder="<%$ Resources:DefaultResource,HiringDate%>" data-date-format="dd/mm/yyyy" AutoComplete="Off"/>
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
                                            <asp:DropDownList ID="SexDropDownList" runat="server" class="select-chosen" data-placeholder="<%$ Resources:DefaultResource, StudentMan%>" AppendDataBoundItems="true" Text='<%# Bind("GenderId") %>'> 
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
                                              <label for="CivilTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:DefaultResource, CivilId%>" />
                                        </label>
                                        <div class="col-md-2 ">
                                              <asp:TextBox ID="CivilTextBox" runat="server" CssClass="form-control" Text='<%# Bind("CivilId") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, CivilId%>"/>
                                           </div>
                                      
                                    </div>
                                  <div class="form-group">
                                   
                                          <label for="UserNameTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:DefaultResource, UserName%>" />
                                        </label>
                                        <div class="col-md-2 ">
                                            <div class="input-group">
                                          <asp:TextBox ID="UserNameTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Username") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, UserName%>"/>
                                                 <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                           </div>
                                          </div> 
                                          <label for="PasswordTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal20" runat="server" Text="<%$ Resources:DefaultResource, Password%>" />
                                        </label>
                                        <div class="col-md-2 ">
                                            <div class="input-group">
                                          <asp:TextBox ID="PasswordTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Password") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, Password%>"/>
                                                 <span class="input-group-addon"><i class="gi gi-asterisk"></i></span>
                                           </div>
                                            </div>
                                               <label for="StudentTelTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="LiteralTel" runat="server" Text="<%$ Resources:DefaultResource, CardPhone%>" />
                                        </label>
                                        <div class="col-md-2 ">
                                              
                                            <div class="input-group">
                                          <asp:TextBox ID="txtTel" runat="server" CssClass="form-control" Text='<%# Bind("Tel") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, StudentTel%>"/>
                                                  <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                                                </div>
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidatorTel" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="txtTel" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator>

                                             <asp:RegularExpressionValidator Display = "Dynamic" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true" ControlToValidate = "txtTel" ID="RegularExpressionValidator2" ValidationExpression = "^5[0-9].*|4[0-9].*|6[0-9].*|9[0-9].*" runat="server" ErrorMessage="<%$ Resources:DefaultResource, NumValidateTitle%>">
                                            </asp:RegularExpressionValidator>

                                             <asp:RegularExpressionValidator Display = "Dynamic" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true" ControlToValidate = "txtTel" ID="RegularExpressionValidator3" ValidationExpression = "^([0-9]{8,8})$" runat="server" ErrorMessage="<%$ Resources:DefaultResource, NumValidateLengthTitle%>">
                                            </asp:RegularExpressionValidator>
                                        </div>

                                      </div>  
                               <div class="form-group">
                                   <label for="txtHomeTel" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal10" runat="server" Text="<%$ Resources:DefaultResource, AnotherTel%>" />
                                        </label>
                                        <div class="col-md-2 ">
                                              
                                            <div class="input-group">
                                          <asp:TextBox ID="txtHomeTel" runat="server" CssClass="form-control" Text='<%# Bind("HomeTel") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, AnotherTel%>"/>
                                                  <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                                                </div>
                                                 <asp:RegularExpressionValidator Display = "Dynamic" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true" ControlToValidate = "txtHomeTel" ID="RegularExpressionValidator1" ValidationExpression = "^5[0-9].*|4[0-9].*|6[0-9].*|9[0-9].*" runat="server" ErrorMessage="<%$ Resources:DefaultResource, NumValidateTitle%>">
                                            </asp:RegularExpressionValidator>

                                             <asp:RegularExpressionValidator Display = "Dynamic" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true" ControlToValidate = "txtHomeTel" ID="RegularExpressionValidator4" ValidationExpression = "^([0-9]{8,8})$" runat="server" ErrorMessage="<%$ Resources:DefaultResource, NumValidateLengthTitle%>">
                                            </asp:RegularExpressionValidator>
                                        </div>
                                    <label for="AreaDropDownList" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal13" runat="server" Text="<%$ Resources:DefaultResource, StudentArea%>" />
                                        </label>
                                        <div class="col-md-2">
                                            <asp:DropDownList ID="AreaDropDownList" runat="server" class="select-chosen" data-placeholder="<%$ Resources:DefaultResource, StudentArea%>" AppendDataBoundItems="true"
                                                DataSourceID="AreaDS" DataTextField="Citydec" DataValueField="CityId" Text='<%# Bind("AreaId") %>'> 
                                                <asp:ListItem Text="<%$ Resources:DefaultResource, StudentArea%>" Value=""></asp:ListItem>
                                            </asp:DropDownList>
      
                                        </div>
                                         

                                    <label for="FatherTelTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal9" runat="server" Text="<%$ Resources:DefaultResource, CardEmail%>" />
                                        </label>
                                        <div class="col-md-2 ">
                                             <div class="input-group">
                                          <asp:TextBox ID="FatherTelTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Email") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, CardEmail%>"/>
                                                 <span class="input-group-addon"><i class="gi gi-envelope"></i></span>
                                           </div>
                                        </div>

                               
                                       
                                   </div>
                                       
                                        <div class="form-group">
                                         <label for="StudentAreaTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal14" runat="server" Text="<%$ Resources:DefaultResource, StudentBlockNo%>" />
                                        </label>
                                        <div class="col-md-2">
                                          <asp:TextBox ID="BlockNoTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Address") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, StudentBlockNo%>"/>
                                        </div>
                                        <label for="EducationalTitleTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal8" runat="server" Text="<%$ Resources:DefaultResource, EducationalTitle%>" />
                                        </label>
                                        <div class="col-md-2">
                                          <asp:TextBox ID="EducationalTitleTextBox" runat="server" CssClass="form-control" Text='<%# Bind("EducationalTitle") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, EducationalTitle%>"/>
                                        </div>
                                         <label for="LicenceTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:DefaultResource, Salary%>" />
                                        </label>
                                        <div class="col-md-2">
                                             <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" Text='<%# Bind("SalaryValue") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, salary%>"/> 

                                           
                                        </div>
                                      </div>
                                        <div class="form-group">
                                         <label for="StudentAreaTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal11" runat="server" Text="<%$ Resources:DefaultResource, ContractDesc%>" />
                                        </label>
                                        <div class="col-md-10">
                                          <asp:TextBox ID="TextBoxContractDesc" runat="server" CssClass="form-control" Text='<%# Bind("ContractDesc") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, ContractDesc%>" TextMode="MultiLine" Height="120" />
                                        </div>
                                       </div>
                                      <div class="form-group">
                                          <label for="LicenceTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal15" runat="server" Text="<%$ Resources:DefaultResource, FingerPrint%>" />
                                        </label>
                                        <div class="col-md-2">
                                             <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" Text='<%# Bind("Notes") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, FingerPrint%>"/> 

                                           
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
                        <asp:Label ID="CodeLabel" runat="server" Text='<%# Eval("TeacherCode") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                    </td>
                   <td>
                        <asp:Label ID="StudentCivilIdLabel" runat="server" Text='<%# Eval("CivilId") %>' />
                    </td>
                  <td>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Tel") %>' />
                    </td>
                  
                    <td>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Email") %>' />
                    </td>
                      <td>
                        <%# String.Format(new System.Globalization.CultureInfo("ar-KW"), "{0: dd/MMM/yyyy}", Eval("HireDate")) %>
                    
                    </td>
                       <td>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Citydec") %>' />
                    </td>
                    
                    <td>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Govdec") %>' />
                    </td>

                    
                     <td>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("ContractDesc") %>' />
                    </td>

                   <td class="text-center block-options">
                      
                         <asp:LinkButton ID="EditLinkButton" runat="server" CommandName="Edit" Text="" data-toggle="tooltip" title="<%$ Resources:DefaultResource, Edite%>" CssClass="btn btn-sm btn-default" data-original-title="<%$ Resources:DefaultResource, Edite%>">
                          
                                <i class="fa fa-pencil"></i>
                        </asp:LinkButton>
                        
                     
                            <asp:LinkButton ID="DeleteLinkButton" runat="server" CommandName="Delete" Text="" data-toggle="tooltip" title="<%$ Resources:DefaultResource, Delete%>" CssClass="btn btn-sm btn-danger" data-original-title="<%$ Resources:DefaultResource, Delete%>"  OnClientClick="javascript:if(!confirm('هل انت متأكد من حذف هذا السجل؟')){return false;}">
                                    <i class="fa fa-times"></i>
                            </asp:LinkButton>

                         <a data-toggle="tooltip" title="<%= Resources.DefaultResource.TeacherSubjects%>"   class="btn btn-sm btn-success" data-original-title="<%= Resources.DefaultResource.TeacherSubjects%>" href="SchTeacherSubjects.aspx?TeacherId=<%# Eval("TeacherId")%>">
                            <i class="fa fa-users"></i>
                        </a>
                         <a data-toggle="tooltip" title="<%= Resources.DefaultResource.TeacherGovs%>"   class="btn btn-sm btn-success" data-original-title="<%= Resources.DefaultResource.TeacherGovs%>" href="SchTeacherGovs.aspx?TeacherId=<%# Eval("TeacherId")%>">
                            <i class="fa fa-map-o"></i>
                        </a>
                 

                         <asp:LinkButton ID="LinkButtonSend" runat="server" CommandName="Send" CommandArgument='<%# Eval("TeacherId") %>' Text="" data-toggle="tooltip" title="<%$ Resources:DefaultResource, SendContract%>" CssClass="btn btn-sm btn-info" data-original-title="<%$ Resources:DefaultResource, SendContract%>">
                          
                                <i class="fa fa-paper-plane"></i>
                        </asp:LinkButton>
                        

                    </td>
                     
                              
                </tr>

            </ItemTemplate>
        <LayoutTemplate>
                
                <table id="general-table" class="table table-striped table-vcenter table-bordered table-condensed">
                    <thead >
                        <tr>
                            <th class ="text-center">
                                <asp:LinkButton ID="CodeTitleLinkButton" runat="server" CommandArgument="TeacherId" CommandName="Sort" Text="<%$ Resources:DefaultResource, code%>" />
                            </th>
                            <th class ="text-center">
                                <asp:LinkButton ID="StudentNameLinkButton" runat="server" CommandArgument="Name" CommandName="Sort" Text="<%$ Resources:DefaultResource, CardName%>" />
                            </th>
                             <th class ="text-center">
                                <asp:LinkButton ID="CivilIdLinkButton" runat="server" CommandArgument="CivilId" CommandName="Sort" Text="<%$ Resources:DefaultResource, CivilId%>" />
                            </th>                      
                             <th class ="text-center">
                                <asp:LinkButton ID="StudentPeriodLinkButton" runat="server" CommandArgument="Tel" CommandName="Sort" Text="<%$ Resources:DefaultResource, CardPhone%>" />
                            </th>
                            <th class ="text-center">
                                <asp:LinkButton ID="LinkButtonNat" runat="server" CommandArgument="Email" CommandName="Sort" Text="<%$ Resources:DefaultResource, CardEmail%>" />
                            </th>
                          <th class ="text-center">
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument="HireDate" CommandName="Sort" Text="<%$ Resources:DefaultResource, HiringDate%>" />
                            </th>
                             <th class ="text-center">
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument="AreaId" CommandName="Sort" Text="<%$ Resources:DefaultResource, StudentArea%>" />
                            </th>
                             <th class ="text-center">
                                <asp:LinkButton ID="LinkButton4" runat="server" CommandArgument="Govdec" CommandName="Sort" Text="<%$ Resources:DefaultResource, GovDesc%>" />
                            </th>

                             <th class ="text-center">
                                <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument="Notes" CommandName="Sort" Text="<%$ Resources:DefaultResource, CardNotes%>" />
                            </th>

                            <th class ="text-center" style="width :20%">
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
                           
                           
      
 


                                 

       
                                
                            <asp:ObjectDataSource ID="TeacherDS" runat="server"  SelectMethod="Read" TypeName="BOL.Sch_Teachers" DeleteMethod="DML" InsertMethod="DML" UpdateMethod="DML"><DeleteParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="3" />
    <asp:Parameter Name="TeacherId" Type="Int64" /><asp:Parameter Name="TeacherCode" Type="String" />
                                <asp:Parameter Name="Name" Type="String" /><asp:Parameter Name="HireDate" Type="String" />
    <asp:Parameter Name="NatId" Type="Int32" />
                                <asp:Parameter Name="CivilId" Type="String" />
    <asp:Parameter Name="Username" Type="String" />
    <asp:Parameter Name="Password" Type="String" />
                                <asp:Parameter Name="Tel" Type="String" />
                                <asp:Parameter Name="HomeTel" Type="String" />
                                <asp:Parameter Name="Email" Type="String" />
                                <asp:Parameter Name="SalaryValue" Type="Decimal" />
                                <asp:Parameter Name="GenderId" Type="Int32" />
                                <asp:Parameter Name="Licence" Type="Boolean" />
                                <asp:Parameter Name="EducationalTitle" Type="String" />
                                <asp:Parameter Name="AreaId" Type="Int32" />
                                <asp:Parameter Name="GovId" Type="Int32" />
                                <asp:Parameter Name="Address" Type="String" />
                                <asp:Parameter Name="OrgId" Type="Int64" /><asp:Parameter Name="BranchId" Type="Int64" />
                                <asp:Parameter Name="Notes" Type="String" />
                                <asp:Parameter Name="ContractDesc" Type="String" />
                                <asp:Parameter Name="CreatedBy" Type="Int32" /><asp:SessionParameter Name="UpdateBy" SessionField="UserId" Type="Int32" /><asp:SessionParameter DefaultValue="" Name="DeletedBy" SessionField="UserId" Type="Int32" />
                                <asp:Parameter Direction="InputOutput" Name="InsertedId" Type="Object" />
                                </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ActionCode" Type="String" DefaultValue="1" />
                <asp:Parameter Name="TeacherId" Type="Int64" />
                <asp:Parameter Name="TeacherCode" Type="String" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="HireDate" Type="String" />
                <asp:Parameter Name="NatId" Type="Int32" />
                <asp:Parameter Name="CivilId" Type="String" />
                <asp:Parameter Name="Username" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="Tel" Type="String" />
                <asp:Parameter Name="HomeTel" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="SalaryValue" Type="Decimal" />
                <asp:Parameter Name="GenderId" Type="Int32" />
                <asp:Parameter Name="Licence" Type="Boolean" />
                <asp:Parameter Name="EducationalTitle" Type="String" />
                <asp:Parameter Name="AreaId" Type="Int32" />
                <asp:Parameter Name="GovId" Type="Int32" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:SessionParameter DefaultValue="" Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:Parameter Name="BranchId" Type="Int64" />
                <asp:Parameter Name="Notes" Type="String" />
                <asp:Parameter Name="ContractDesc" Type="String" />
                <asp:SessionParameter Name="CreatedBy" SessionField="userId" Type="Int32" />
                <asp:SessionParameter Name="UpdateBy" SessionField="userId" Type="Int32" />
                <asp:Parameter Name="DeletedBy" Type="Int32" />
                <asp:Parameter Direction="InputOutput" Name="InsertedId" Type="Object" />
                                </InsertParameters>
            <SelectParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="1" />
                <asp:Parameter Name="TeacherId" Type="Int64" />
                <asp:ControlParameter ControlID="SubjectsDropDownList" DefaultValue="" Name="subjectId" PropertyName="SelectedValue" Type="Int64" />
                <asp:ControlParameter ControlID="PeriodDropDownList" Name="PeriodId" PropertyName="SelectedValue" Type="Int64" />
                <asp:SessionParameter DefaultValue="" Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:Parameter Name="BRANCHId" Type="Int64" />
                <asp:Parameter Name="UserId" Type="Int32" />
                <asp:Parameter Name="StudenId" Type="Int64" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:ControlParameter ControlID="DropDownListNewArea" Name="AreaId" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="SearchTextBox" DefaultValue="" Name="SearchText" PropertyName="Text" Type="String" />
                                </SelectParameters><UpdateParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="2" />
                                    <asp:Parameter Name="TeacherId" Type="Int64" />
                                    <asp:Parameter Name="TeacherCode" Type="String" />
<asp:Parameter Name="Name" Type="String"></asp:Parameter>
<asp:Parameter Name="HireDate" Type="String"></asp:Parameter>
<asp:Parameter Name="NatId" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="CivilId" Type="String" /><asp:Parameter Name="Username" Type="String" /><asp:Parameter Name="Password" Type="String" />
                                    <asp:Parameter Name="Tel" Type="String" />
                                    <asp:Parameter Name="HomeTel" Type="String" />
                                    <asp:Parameter Name="Email" Type="String" />
                                    <asp:Parameter Name="SalaryValue" Type="Decimal" />
                                    <asp:Parameter Name="GenderId" Type="Int32" />
                                    <asp:Parameter Name="Licence" Type="Boolean" />
                                    <asp:Parameter Name="EducationalTitle" Type="String" />
                                    <asp:Parameter Name="AreaId" Type="Int32" />
                                    <asp:Parameter Name="GovId" Type="Int32" />
                                    <asp:Parameter Name="Address" Type="String" />
                                    <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
                                    <asp:Parameter Name="BranchId" Type="Int64" />
                                    <asp:Parameter Name="Notes" Type="String" />
                                    <asp:Parameter Name="ContractDesc" Type="String" />
                                    <asp:Parameter Name="CreatedBy" Type="Int32" />
                                    <asp:SessionParameter Name="UpdateBy" SessionField="UserId" Type="Int32" />
                                    <asp:Parameter Name="DeletedBy" Type="Int32" />
                                    <asp:Parameter Direction="InputOutput" Name="InsertedId" Type="Object" />
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

                           
    <asp:TextBox ID="txtOrgId" runat="server" 
        Visible="False" ></asp:TextBox>

                           
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

                           
    </div>
        
</div>
                            
          <p>

        <asp:ObjectDataSource ID="SubjectsDS" runat="server"  SelectMethod="Read" TypeName="BOL.Sch_Subjects"><SelectParameters>
        <asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" />
        <asp:Parameter Name="SubId" Type="Int64" />
            <asp:ControlParameter ControlID="PeriodDropDownList" DefaultValue="" Name="PeriodId" PropertyName="SelectedValue" Type="Int64" />
       <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
        <asp:Parameter Name="BranchId" Type="Int64" />
        <asp:Parameter Name="SearchText" Type="String" />
        </SelectParameters></asp:ObjectDataSource>


                                 

       
                                
<asp:ObjectDataSource ID="PeriodsDS" runat="server"  SelectMethod="Read" TypeName="BOL.Sch_Periods" OldValuesParameterFormatString="original_{0}"><SelectParameters>
        <asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" />
        <asp:Parameter Name="PeriodId" Type="Int64" DefaultValue="" />
        <asp:Parameter Name="StageId" Type="Int64" />
        <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
        <asp:Parameter Name="BranchId" Type="Int64" />
        </SelectParameters></asp:ObjectDataSource>

    </p>

                            
          