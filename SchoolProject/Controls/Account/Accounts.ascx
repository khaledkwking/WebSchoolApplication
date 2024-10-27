<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Accounts.ascx.cs" Inherits="WebSchool.Controls.Account.Accounts" %>
 


<ul class="breadcrumb breadcrumb-top">
    <li><a href="default.aspx"><%= Resources.DefaultResource.Main%> </a></li>
    <li> <%= Resources.DefaultResource.AccountData%> </li>
</ul>


<div class="block table-responsive-lg">
    <!-- Table Styles Title -->
    <div class="block-title">
        <h2><strong><%= Resources.DefaultResource.List%>  </strong> <%= Resources.DefaultResource.AccountData%> </h2>
        <div class="block-options pull-right">
           <%-- <asp:LinkButton ID="NewRecord" runat="server" CssClass="btn btn-sm btn-success" data-toggle="tooltip" title="<%$ Resources:DefaultResource, NewRecord%>"  data-original-title="<%$ Resources:DefaultResource, NewRecord%>" OnClick="NewRecord_Click">
                <i class="fa fa-file"></i>
            </asp:LinkButton>--%>
        </div>
    </div>
    <!-- END Table Styles Title -->

    <div class="gallery gallery-widget" data-toggle="lightbox-gallery">

                    <div class="row">
                            <div class="col-lg-6">
                                <!-- General Data Block -->
                                <div class="block">
                                    <!-- General Data Title -->
                                    <div class="block-title">
                                        <h2><i class="fa fa-pencil"></i> <strong><asp:Literal runat="server" Text="<%$ Resources:DefaultResource, AccountData%>" /></strong> </h2>
                                    </div>
                                    <!-- END General Data Title -->

                                    <!-- General Data Content -->
                                   <div class="form-horizontal form-bordered">
                                      <div id="ErrorDiv" runat="server"></div>
                                     <div class="form-group row">
                                        <label for="AccountCodeLiteral" class="col-md-2 control-label">
                                            <asp:Literal ID="Accountcodelabel" runat="server" Text="<%$ Resources:DefaultResource, AccountCode%>" />
                                        </label>
                                        <div class="col-sm-4 col-xs-4 col-4 ">
                                            <asp:TextBox ID="AccountCodeTextBox" runat="server" CssClass="form-control" Text='<%# Bind("AccountCode") %>' />
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidatorAccountCode" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="AccountCodeTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                        <label for="AccountNamelebel" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal8" runat="server" Text="<%$ Resources:DefaultResource, AccountName%>" />
                                        </label>
                                        <div class="col-sm-4 col-xs-4 col-4">
                                            <%--<asp:TextBox ID="TextBox2" runat="server" AutoComplete="Off" CssClass="form-control date-picker" Text='<%# Bind("DataDate","{0:MM/dd/yyyy}") %>' />--%><asp:TextBox ID="AccountNameTextBox" runat="server"  CssClass="form-control" Text='<%# Bind("accountname") %>' />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="AccountNameTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator>

                                        </div></div>
                        <div class="form-group row">
                                        <label for="AccountMainNameLabel" class="col-md-2 control-label">
                                            <asp:Literal ID="AccountMainNameLiteral" runat="server" Text="<%$ Resources:DefaultResource,MainAccount %>" />
                                        </label>
                                           <div class="col-sm-4 col-xs-4 col-4">
                                            <asp:CheckBox ID="AccountMainNameCheckBox" runat="server"  Checked='<%# Bind("root") %>'/>
                                            </div>

                                         <label for="Main Accountlabel" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:DefaultResource, MainAccount %>" />
                                        </label>
                                        <div class="col-sm-4 col-xs-4 col-4">
                                            <%--<asp:TextBox ID="TextBox2" runat="server" AutoComplete="Off" CssClass="form-control date-picker" Text='<%# Bind("DataDate","{0:MM/dd/yyyy}") %>' />--%><asp:TextBox ID="MainAccountTextBox" runat="server"  CssClass="form-control" Text='<%# Bind("AccountparentName") %>' ReadOnly="True" />
                                           
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="AccountClosedToLabel" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:DefaultResource, AccountClosedTo%>" />
                                        </label>
                                        <div class="col-sm-4 col-xs-4 col-4">
                                             <asp:DropDownList ID="AccountClosedToDropDownList" runat="server" CssClass="form-control"
                                                AppendDataBoundItems="True" DataTextField="accountname" DataValueField="accountId" ><asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0" />
                                            </asp:DropDownList>
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidatorAccountClosedTo" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="AccountClosedToDropDownList"  InitialValue="0"  ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator>
                                            

                                            </div>
                                    <label for="AccountTypeLabel" class="col-md-2 control-label">
                                            <asp:Literal ID="accountTypeLiteral" runat="server" Text="<%$ Resources:DefaultResource, AccountType%>" />
                                        </label>
                                        <div class="col-sm-4 col-xs-4 col-4">
                                            <asp:DropDownList ID="accountTypeDropDownList" runat="server" CssClass="form-control"
                                                AppendDataBoundItems="True"  DataTextField="DESC" DataValueField="ID">
                                                <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0" />
                                            </asp:DropDownList>
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidatoraccountType" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="accountTypeDropDownList"  InitialValue="0"  ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator>

                                              <%--<asp:RangeValidator ID="RangeValidatoraccountType" runat="server" ControlToValidate="accountTypeDropDownList" MinimumValue="1" MaximumValue="100"
                                                ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"></asp:RangeValidator>--%>
                                            
                                        </div>
                                       </div>

                            <div class="form-group row">
                                    
                                       <label for="CreditLiteral" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:DefaultResource, AccountCredit%>" />
                                        </label>
                                        <div class="col-sm-4 col-xs-4 col-4">
                                            <asp:TextBox ID="CreditTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Totaltovalue") %>' ReadOnly="True" />
                                        </div>
                                        <label for="Debitlabel" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:DefaultResource, AccountDebit%>" />
                                        </label>
                                        <div class="col-sm-4 col-xs-4 col-4">
                                            <%--<asp:TextBox ID="TextBox2" runat="server" AutoComplete="Off" CssClass="form-control date-picker" Text='<%# Bind("DataDate","{0:MM/dd/yyyy}") %>' />--%><asp:TextBox ID="DebitTextBox" runat="server"  CssClass="form-control" Text='<%# Bind("Totalfromvalue") %>' ReadOnly="True" />
                                            
                                        </div>
                                     
                                    </div>
                     
                        <div class="form-group row">
                                    
                                       <label for="AccountBalanceLiteral" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:DefaultResource, AccountBalance%>" />
                                        </label>
                                        <div class="col-sm-4 col-xs-4 col-4">
                                            <asp:TextBox ID="AccountBalanceTextBox" runat="server" CssClass="form-control" Text='<%# Bind("startbalancefrom") %>' ReadOnly="True" />
                                        </div>
                                        <label for="EnterDatelabel" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:DefaultResource, EnterDate%>" />
                                        </label>
                                        <div class="col-sm-4 col-xs-4 col-4">
                                            <asp:TextBox ID="EnterDateTextBox" runat="server" AutoComplete="Off" CssClass="form-control date-picker" Text='<%# Bind("startdate","{0:dd/MM/yyyy}") %>' ReadOnly="True" />
                                            
                                        </div>
                                     
                                    </div>

                        <div class="form-group row">
                                    
                                   <label for="Noteslabel" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:DefaultResource, Notes%>" />
                                        </label>
                                        <div class="col-sm-4 col-xs-4 col-4">
                                            <%--<asp:TextBox ID="TextBox2" runat="server" AutoComplete="Off" CssClass="form-control date-picker" Text='<%# Bind("DataDate","{0:MM/dd/yyyy}") %>' />--%><asp:TextBox ID="NotesTextBox" runat="server"  CssClass="form-control" Text='<%# Bind("Notes") %>' TextMode="MultiLine" />
                                            
                                        </div>
                                       
                                     <label for="Noteslabel" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal9" runat="server" Text="<%$ Resources:DefaultResource, No%>" />
                                        </label>
                                        <div class="col-sm-4 col-xs-4 col-4">
                                            <%--<asp:TextBox ID="TextBox2" runat="server" AutoComplete="Off" CssClass="form-control date-picker" Text='<%# Bind("DataDate","{0:MM/dd/yyyy}") %>' />--%>
                                            <asp:TextBox ID="txtAccountId1" runat="server" CssClass="form-control" Width="0px" Visible="False"></asp:TextBox>
                                            <asp:HiddenField ID="txtAccountId" runat="server" />
                                            <asp:HiddenField ID="txtAccountId2" runat="server" />
                                   </div></div>

                                      <div class="form-group form-actions">
                                            <div class="col-md-12 col-md-offset-3 text-center">
                                           <%--     <button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-floppy-o"></i> Save</button>
                                                <button type="reset" class="btn btn-sm btn-warning"><i class="fa fa-repeat"></i> Reset</button>
                                           --%>
                                                
                                          
                                            
                                                <asp:Button ID="AddButton" runat="server"  Text="<%$ Resources:DefaultResource, New%>"  data-original-title="<%$ Resources:DefaultResource, New%>"  data-bs-toggle="tooltip" title="<%$ Resources:DefaultResource, New%>" CssClass="btn btn-sm btn-info" ValidationGroup="DML"  OnClick="AddButton_Click" CausesValidation="False" />
                                                   &nbsp;
                                                <asp:Button ID="SaveButton" runat="server"  Text="<%$ Resources:DefaultResource, Insert%>"  data-original-title="<%$ Resources:DefaultResource, Insert%>"  data-bs-toggle="tooltip" title="<%$ Resources:DefaultResource, Insert%>" CssClass="btn btn-sm btn-primary" ValidationGroup="DML"  OnClick="SaveButton_Click" />
                                                   &nbsp;
                                           
                                            
                                                 <asp:Button ID="DelButton" runat="server"  data-original-title="<%$ Resources:DefaultResource, delete%>"  data-bs-toggle="tooltip" title="<%$ Resources:DefaultResource, delete%>" Text="<%$ Resources:DefaultResource, Delete%>" CssClass="btn btn-sm btn-warning" ValidationGroup="DML"  OnClientClick="javascript:if(!confirm('سيتم حذف جميع البيانات المتعلقة به ?')){return false;}" OnClick="DelButton_Click"/>
                                         
 </div>
                                        </div>

                                    </div>
                                    <!-- END General Data Content -->
                                </div>
                                <!-- END General Data Block -->
                            </div>
        
     
                       
                            <div class="col-lg-6">
                                <!-- General Data Block -->
                                <div class="block">
                                    <!-- General Data Title -->
                                    <div class="block-title">
                                        <div class="block-options pull-left">
                                         

                                           <div class="btn-group btn-group-sm">
                                                <a href="javascript:void(0)" class="btn btn-alt btn-sm btn-default dropdown-toggle enable-tooltip" data-toggle="dropdown" title="Options"><span class="caret"></span></a>
                                                <ul class="dropdown-menu dropdown-custom dropdown-menu-right">
                                                    <li>
                                                 <asp:LinkButton ID="MainSubAccountBtn" runat="server"   data-bs-toggle="tooltip" data-original-title="<%$ Resources:DefaultResource, AddMainAccount%>"  class="kt-nav__link" OnClick="MainSubAccountBtn_Click" >
                                                 <i class="gi gi-airplane pull-right"></i>
                                           
                                                <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, AddMainAccount%>" />
                                            
                                            </asp:LinkButton>
                                                  
                                              
                                                     
                                                    </li>
                                            <li class="divider"></li>
                                           <li >
                                          <asp:LinkButton ID="NewSubAccount" runat="server"   data-bs-toggle="tooltip" data-original-title="<%$ Resources:DefaultResource, AddSubAccount%>"  class="kt-nav__link" OnClick="NewSubAccount_Click" >
                                                 <i class="fa fa-wrench fa-fw pull-right"></i>
                                            <span class="">
                                                <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, AddSubAccount%>" />
                                            </span>
                                            </asp:LinkButton></li>
                          <li class="divider"></li>
                                    
                                    <li>
                                       <asp:LinkButton ID="LinkButtonMoveAccount" runat="server"   data-bs-toggle="tooltip" data-original-title="<%$ Resources:DefaultResource, MoveAccount%>"  class="kt-nav__link"  >
                                               <i class="gi gi-airplane pull-right"></i>
                                            <span class="">
                                                <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, MoveAccount%>" />
                                            </span>
                                            </asp:LinkButton>

                                    </li>
                                                     <li class="divider"></li>
                                    <li >
                                            <asp:LinkButton ID="LinkButtonAccountCard" runat="server"  data-bs-toggle="modal" data-target="#kt_Card_modal"   data-original-title="<%$ Resources:DefaultResource, AccountCard%>"  class="kt-nav__link" OnClick="LinkButtonAccountCard_Click"  >
                                            <i class="fa fa-wrench fa-fw pull-right"></i>
                                            <span class="">
                                                <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, AccountCard%>" />
                                            </span>
                                            </asp:LinkButton>
                                               </li>
                                                     <li class="divider"></li>
                                                    <li>
                                             <asp:LinkButton ID="LinkButtonSave" runat="server"   data-bs-toggle="tooltip" data-original-title="<%$ Resources:DefaultResource, new%>"  class="kt-nav__link" OnClick="LinkButtonSave_Click"  >
                                              <i class="fa fa-wrench fa-fw pull-right"></i>
                                            <span class="">
                                                <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, Save%>" />
                                            </span>
                                            </asp:LinkButton>

                                    </li>
                                      <li class="divider"></li>
                                    <li >
                                            <asp:LinkButton ID="LinkButtondelete" runat="server"   data-bs-toggle="tooltip" data-original-title="<%$ Resources:DefaultResource, delete%>"  class="kt-nav__link" OnClick="LinkButtondelete_Click"  >
                                              <i class="fa fa-wrench fa-fw pull-right"></i>
                                            <span class="">
                                                <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, delete%>" />
                                            </span>
                                          </asp:LinkButton>

                                    </li>


                                                    
                                                  <%--  <li>
                                                        <a href="javascript:void(0)"><i class="fa fa-wrench fa-fw pull-right"></i>Separated Action</a>
                                                    </li>--%>
                                                </ul>
                                            </div>
                                        </div>
                                       <h2> <strong><asp:Literal runat="server" Text="<%$ Resources:DefaultResource, AccountTree%>" /></strong> </h2>
                                   </div>

                               
                               
                                    <!-- END General Data Title -->

                                    <!-- General Data Content -->
                                 <%--  <div class="form-horizontal form-bordered">--%>

                                       <div  style="border: 0px solid #000000; overflow: auto; max-height: 450px; width:100%;">
                
                                                       <%-- display tree in div--%>
                                                <div id="myTree"  ></div>

                              
                                     </div>
           

                       <div style="visibility: hidden" >                  
                       <asp:Button ID="btnSubmit" runat="server" Text="Button" OnClick="btnSubmit_Click" Width="0px" />

                                   </div>
                                    </div>
                                 </div>
                            </div>

                </div>

   </div>

   
                <!--end:: Widgets/Sales States-->
          

<!--begin::Modal-->
<div class="modal fade" id="kt_Card_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">
                    <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, CardData%>" />
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button></div><div class="modal-body">
              
               <asp:ListView runat="server" ID="lv" DataKeyNames="SUP_CUST_ID" DataSourceID="SUPPLIERS_CUSTOMERS_DS" OnItemCommand="lv_ItemCommand" OnDataBound="lv_DataBound" OnItemDataBound="lv_ItemDataBound">
                   <EditItemTemplate>
                <tr>
                    <td colspan="12">
                        <div class="kt-portlet">
                            <div class="kt-portlet__head">
                                <div class="kt-portlet__head-label">
                                    <h3 class="kt-portlet__head-title">
                                        <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, UpdateRecord%>" />
                                    </h3>
                                </div>
                            </div>
                           <%-- <asp:Label ID="PlannedAverageLabel" runat="server" Text='<%# Eval("PlannedAverage") %>' Visible="false"></asp:Label>
                            
                            <asp:Label ID="ActualAverageLabel" runat="server" Text='<%# Eval("ActualAverage") %>' Visible="false"></asp:Label>
                            <asp:Label ID="AverageDifferenceLabel" runat="server" Text='<%# Eval("AverageDifference") %>' Visible="false"></asp:Label>
                            <asp:Label ID="PercentageDifferenceLabel" runat="server" Text='<%# Eval("PercentageDifference") %>' Visible="false"></asp:Label>--%>
                            <!--begin::Form-->
                            
                            <div class="kt-form kt-form--label-right">
                                <div class="kt-portlet__body">

                                    <div class="form-group row">
                                        <label for="CodeTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="CodeLiteral" runat="server" Text="<%$ Resources:DefaultResource, Code%>" />
                                        </label>
                                        <div class="col-10">
                                             <asp:TextBox ID="TextBoxCode" runat="server" CssClass="form-control" Text='<%# Bind("SUP_CUST_CODE") %>' />
                                            <%--<asp:TextBox ID="MonthlyDateTextBox" runat="server" AutoComplete="Off" CssClass="form-control date-picker" Text='<%# Bind("MonthlyDate", "{0: MM/dd/yyyy}") %>' />--%>
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidatorCode" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                    ControlToValidate="TextBoxCode" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                                </asp:RequiredFieldValidator></div></div><div class="form-group row">
                                        <label for="AccountNumberTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="AccountNumberLiteral" runat="server" Text="<%$ Resources:DefaultResource, AccountNo%>" />
                                        </label>
                                        <div class="col-10">
                                            <asp:TextBox ID="AccountNumberTextBox" runat="server" CssClass="form-control" Text='<%# Bind("accountid") %>' />
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="NameTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="ActualLiteral" runat="server" Text="<%$ Resources:DefaultResource, CardName%>" />
                                        </label>
                                        <div class="col-10">
                                            <asp:TextBox ID="NameTextBox" runat="server" CssClass="form-control" Text='<%# Bind("SUP_CUST_FNAME") %>' />
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                    ControlToValidate="NameTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                                </asp:RequiredFieldValidator></div></div><div class="form-group row">
                                            <label for="Addresslabel" class="col-md-2 control-label">
                                                <asp:Literal ID="AddressLiteral" runat="server" Text="<%$ Resources:DefaultResource, CardAddress%>" />
                                            </label>
                                            <div class="col-10">
                                             <asp:TextBox ID="TextBoxAddress" runat="server" CssClass="form-control" Text='<%# Bind("ADDRESS") %>' />
                                            </div>
                                      </div>
                                    <div class="form-group row">
                                            <label for="Phonelabel" class="col-md-2 control-label">
                                                <asp:Literal ID="LiteralPhone" runat="server" Text="<%$ Resources:DefaultResource, CardPhone%>" />
                                            </label>
                                            <div class="col-10">
                                             <asp:TextBox ID="TextBoxPhone" runat="server" CssClass="form-control" Text='<%# Bind("PHONE1") %>' />
                                            </div>
                                      </div>
                                      <div class="form-group row">
                                            <label for="Faxlabel" class="col-md-2 control-label">
                                                <asp:Literal ID="LiteralFax" runat="server" Text="<%$ Resources:DefaultResource, CardFax%>" />
                                            </label>
                                            <div class="col-10">
                                             <asp:TextBox ID="TextBoxFax" runat="server" CssClass="form-control" Text='<%# Bind("FAX") %>' />
                                            </div>
                                      </div>
                                     <div class="form-group row">
                                            <label for="Emaillabel" class="col-md-2 control-label">
                                                <asp:Literal ID="LiteralEmail" runat="server" Text="<%$ Resources:DefaultResource, CardEmail%>" />
                                            </label>
                                            <div class="col-10">
                                             <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="form-control" Text='<%# Bind("EMAIL") %>' />
                                            </div>
                                      </div>
                                    <div class="form-group row">
                                            <label for="Noteslabel" class="col-md-2 control-label">
                                                <asp:Literal ID="LiteralNotes" runat="server" Text="<%$ Resources:DefaultResource, CardNotes%>" />
                                            </label>
                                            <div class="col-10">
                                             <asp:TextBox ID="TextBoxNotes" runat="server" CssClass="form-control" Text='<%# Bind("NOTES") %>' />
                                            </div>
                                      </div>
                                </div>
                                <div class="kt-portlet__foot">
                                    <div class="kt-form__actions">
                                        <div class="row">
                                            <div class="col-2">
                                            </div>
                                            <div class="col-10">
                                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="<%$ Resources:DefaultResource, Update%>" CssClass="btn btn-success" ValidationGroup="DML" />
                                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="<%$ Resources:DefaultResource, Cancel%>" CssClass="btn btn-secondary" />
                                            </div>
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
                        <td><%= Resources.DefaultResource.DataNotFound %></td></tr></table></EmptyDataTemplate><InsertItemTemplate>
                <tr>
                    <td colspan="12">
                        <div class="kt-portlet">
                      

                            <!--begin::Form-->
                            <div class="kt-form kt-form--label-right">
                                <div class="kt-portlet__body">

                                    <div class="form-group row">
                                        <label for="CodeTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="CodeLiteral" runat="server" Text="<%$ Resources:DefaultResource, Code%>" />
                                        </label>
                                        <div class="col-10">
                                             <asp:TextBox ID="TextBoxCode" runat="server" CssClass="form-control" Text='<%# Bind("SUP_CUST_CODE") %>' />
                                            <%--<asp:TextBox ID="MonthlyDateTextBox" runat="server" AutoComplete="Off" CssClass="form-control date-picker" Text='<%# Bind("MonthlyDate", "{0: MM/dd/yyyy}") %>' />--%>
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidatorCode" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                    ControlToValidate="TextBoxCode" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                                </asp:RequiredFieldValidator></div></div><div class="form-group row">
                                        <label for="AccountNumberTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="AccountNumberLiteral" runat="server" Text="<%$ Resources:DefaultResource, AccountNo%>" />
                                        </label>
                                        <div class="col-10">
                                            <asp:TextBox ID="AccountNumberTextBox" runat="server" CssClass="form-control" Text='<%# Bind("accountid") %>' />
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="NameTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="ActualLiteral" runat="server" Text="<%$ Resources:DefaultResource, CardName%>" />
                                        </label>
                                        <div class="col-10">
                                            <asp:TextBox ID="NameTextBox" runat="server" CssClass="form-control" Text='<%# Bind("SUP_CUST_FNAME") %>' />
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                    ControlToValidate="NameTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                                </asp:RequiredFieldValidator></div></div><div class="form-group row">
                                            <label for="Addresslabel" class="col-md-2 control-label">
                                                <asp:Literal ID="AddressLiteral" runat="server" Text="<%$ Resources:DefaultResource, CardAddress%>" />
                                            </label>
                                            <div class="col-10">
                                             <asp:TextBox ID="TextBoxAddress" runat="server" CssClass="form-control" Text='<%# Bind("ADDRESS") %>' />
                                            </div>
                                      </div>
                                    <div class="form-group row">
                                            <label for="Phonelabel" class="col-md-2 control-label">
                                                <asp:Literal ID="LiteralPhone" runat="server" Text="<%$ Resources:DefaultResource, CardPhone%>" />
                                            </label>
                                            <div class="col-10">
                                             <asp:TextBox ID="TextBoxPhone" runat="server" CssClass="form-control" Text='<%# Bind("PHONE1") %>' />
                                            </div>
                                      </div>
                                      <div class="form-group row">
                                            <label for="Faxlabel" class="col-md-2 control-label">
                                                <asp:Literal ID="LiteralFax" runat="server" Text="<%$ Resources:DefaultResource, CardFax%>" />
                                            </label>
                                            <div class="col-10">
                                             <asp:TextBox ID="TextBoxFax" runat="server" CssClass="form-control" Text='<%# Bind("FAX") %>' />
                                            </div>
                                      </div>
                                     <div class="form-group row">
                                            <label for="Emaillabel" class="col-md-2 control-label">
                                                <asp:Literal ID="LiteralEmail" runat="server" Text="<%$ Resources:DefaultResource, CardEmail%>" />
                                            </label>
                                            <div class="col-10">
                                             <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="form-control" Text='<%# Bind("EMAIL") %>' />
                                            </div>
                                      </div>
                                    <div class="form-group row">
                                            <label for="Noteslabel" class="col-md-2 control-label">
                                                <asp:Literal ID="LiteralNotes" runat="server" Text="<%$ Resources:DefaultResource, CardNotes%>" />
                                            </label>
                                            <div class="col-10">
                                             <asp:TextBox ID="TextBoxNotes" runat="server" CssClass="form-control" Text='<%# Bind("NOTES") %>' />
                                            </div>
                                      </div>
                                </div>
                                <div class="kt-portlet__foot">
                                    <div class="kt-form__actions">
                                        <div class="row">
                                            <div class="col-2">
                                            </div>
                                            <div class="col-10">
                                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="<%$ Resources:DefaultResource, Insert%>" CssClass="btn btn-success"  ValidationGroup="DML" />
                                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="<%$ Resources:DefaultResource, Cancel%>" CssClass="btn btn-secondary" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr>
                 <td>
                          <asp:label ID="SortOrderTxt" runat="server" Text='<%#Container.DisplayIndex+1 %>' SkinID="sort" />
                  </td>
                    <td style ="display:none">
                        <%# Eval("SUP_CUST_ID") %>
                      <%--  <asp:Label ID="PlannedAverageLabel" runat="server" Text='<%# Eval("PlannedAverage") %>' Visible="false"/>--%>
                       

                    </td>
                    <td>
                        <%--<%# Eval("MonthlyDate","{0: dd-MMM-yyyy}") %>--%>
                          <%# Eval("SUP_CUST_CODE")  %>
                    </td>
                    <td>
                        <%# Eval("SUP_CUST_FNAME")  %>
                    </td>
                    <td>
                        <%# Eval("PHONE1")  %>
                         <%--<%# Eval("Actual","{0:N0}")  %>--%>
                    </td>
                      <%-- <td>
                        <asp:CheckBox ID="ChkBoxStopFlag" runat="server"  Checked ='<%#Eval("StopFlag")%>' Enabled="False" />
                    </td>--%>
                    <td class="text-center block-options">

                        <asp:LinkButton ID="EditLinkButton" runat="server" CommandName="Edit" data-bs-toggle="kt-tooltip" title="<%$ Resources:DefaultResource, Edite%>" CssClass="btn btn-sm btn-icon btn-outline-primary btn-icon-md">
                                <i class="fa fa-edit"></i>
                        </asp:LinkButton><asp:LinkButton ID="DeleteLinkButton" runat="server" CommandName="Delete" data-bs-toggle="kt-tooltip" title="<%$ Resources:DefaultResource, Delete%>" CssClass="btn btn-outline-danger btn-sm btn-icon"
                            OnClientClick="javascript:if(!confirm('This action will delete the record and all related Records!')){return false;}">
                                <i class="la la-close"></i>
                        </asp:LinkButton></td></tr></ItemTemplate><LayoutTemplate>
                <table class="table table-striped table-bordered table-hover table-checkable">
                    <thead class="thead-dark">
                        <tr>
                            <th>
                                <asp:LinkButton ID="NoLinkButton" runat="server" CommandArgument="" CommandName="Sort" Text="<%$ Resources:DefaultResource, No%>" />
                            </th>
                           <%-- <th>
                                <asp:LinkButton ID="IdLinkButton" runat="server" CommandArgument="SUP_CUST_ID" CommandName="Sort" Text="<%$ Resources:DefaultResource, Id%>" />
                            </th>--%>
                            <th>
                                <asp:LinkButton ID="CodeLinkButton" runat="server" CommandArgument="SUP_CUST_CODE" CommandName="Sort" Text="<%$ Resources:DefaultResource, code%>" />
                            </th>

                            <th>
                                <asp:LinkButton ID="NameButton" runat="server" CommandArgument="SUP_CUST_FNAME" CommandName="Sort" Text="<%$ Resources:DefaultResource, CardName%>" />
                            </th>
                            <th>
                                <asp:LinkButton ID="PhoneButton" runat="server" CommandArgument="PHONE1" CommandName="Sort" Text="<%$ Resources:DefaultResource, CardPhone%>" />
                            </th>
                         <%--      <th>
                                <asp:LinkButton ID="StopFlagLinkButton" runat="server" CommandArgument="StopFlag" CommandName="Sort" Text="<%$ Resources:DefaultResource, CardName%>" />
                            </th>--%>
                            <th>
                                <asp:LinkButton ID="ActionsLinkButton" runat="server" CommandName="Sort" Text="<%$ Resources:DefaultResource, Actions%>" />
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
                    
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">
                    <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, Close%>" /></button>
            <asp:ObjectDataSource ID="GEODS" runat="server"
            SelectMethod="Read" TypeName="BOL.Accounts" DeleteMethod="DML" InsertMethod="DML" UpdateMethod="DML" ><DeleteParameters><asp:Parameter Name="ActionCode" Type="String" /><asp:Parameter Name="accountid" Type="Int64" /><asp:Parameter Name="AccountCode" Type="String" /><asp:Parameter Name="accountname" Type="String" /><asp:Parameter Name="AccountSName" Type="String" /><asp:Parameter Name="AccountparentId" Type="Int64" /><asp:Parameter Name="root" Type="Boolean" /><asp:Parameter Name="Totalfromvalue" Type="Decimal" /><asp:Parameter Name="totaltovalue" Type="Decimal" /><asp:Parameter Name="notes" Type="String" /><asp:Parameter Name="startbalancefrom" Type="Double" /><asp:Parameter Name="startbalanceto" Type="Double" /><asp:Parameter Name="accountType" Type="Int32" /><asp:Parameter Name="ClosedTo" Type="Int64" /><asp:Parameter Name="MainNode" Type="Boolean" /><asp:Parameter Name="ProcessFlag" Type="Boolean" /><asp:Parameter Name="display_Flag" Type="Boolean" /><asp:Parameter Name="AccLevel" Type="Int32" /><asp:Parameter Name="MainParentAccId" Type="Int64" /><asp:Parameter Name="LastSerialNo" Type="String" /><asp:Parameter Name="CurId" Type="Int64" /><asp:Parameter Name="OrgId" Type="Int64" /><asp:Parameter Name="CreatedBy" Type="Int32" /><asp:Parameter Name="UpdateBy" Type="Int32" /><asp:Parameter Name="DeletedBy" Type="Int32" /><asp:Parameter Direction="InputOutput" Name="InsertedId" Type="Object" /></DeleteParameters><InsertParameters><asp:Parameter Name="ActionCode" Type="String" /><asp:Parameter Name="accountid" Type="Int64" /><asp:Parameter Name="AccountCode" Type="String" /><asp:Parameter Name="accountname" Type="String" /><asp:Parameter Name="AccountSName" Type="String" /><asp:Parameter Name="AccountparentId" Type="Int64" /><asp:Parameter Name="root" Type="Boolean" /><asp:Parameter Name="Totalfromvalue" Type="Decimal" /><asp:Parameter Name="totaltovalue" Type="Decimal" /><asp:Parameter Name="notes" Type="String" /><asp:Parameter Name="startbalancefrom" Type="Double" /><asp:Parameter Name="startbalanceto" Type="Double" /><asp:Parameter Name="accountType" Type="Int32" /><asp:Parameter Name="ClosedTo" Type="Int64" /><asp:Parameter Name="MainNode" Type="Boolean" /><asp:Parameter Name="ProcessFlag" Type="Boolean" /><asp:Parameter Name="display_Flag" Type="Boolean" /><asp:Parameter Name="AccLevel" Type="Int32" /><asp:Parameter Name="MainParentAccId" Type="Int64" /><asp:Parameter Name="LastSerialNo" Type="String" /><asp:Parameter Name="CurId" Type="Int64" /><asp:Parameter Name="OrgId" Type="Int64" /><asp:Parameter Name="CreatedBy" Type="Int32" /><asp:Parameter Name="UpdateBy" Type="Int32" /><asp:Parameter Name="DeletedBy" Type="Int32" /><asp:Parameter Direction="InputOutput" Name="InsertedId" Type="Object" /></InsertParameters><SelectParameters><asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" /><asp:Parameter Name="AccountId" Type="Int64" /><asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" /><asp:Parameter Name="BRANCHId" Type="Int64" /><asp:Parameter Name="ParentAccountId" Type="Int64" /><asp:Parameter Name="CostId" Type="Int64" /><asp:Parameter Name="StartDate" Type="String" /><asp:Parameter Name="EndDate" Type="String" /><asp:Parameter Name="SearchText" Type="String" /><asp:Parameter Name="AccountCode" Type="String" /><asp:Parameter Name="AccountName" Type="String" /></SelectParameters><UpdateParameters><asp:Parameter Name="ActionCode" Type="String" /><asp:Parameter Name="accountid" Type="Int64" /><asp:Parameter Name="AccountCode" Type="String" /><asp:Parameter Name="accountname" Type="String" /><asp:Parameter Name="AccountSName" Type="String" /><asp:Parameter Name="AccountparentId" Type="Int64" /><asp:Parameter Name="root" Type="Boolean" /><asp:Parameter Name="Totalfromvalue" Type="Decimal" /><asp:Parameter Name="totaltovalue" Type="Decimal" /><asp:Parameter Name="notes" Type="String" /><asp:Parameter Name="startbalancefrom" Type="Double" /><asp:Parameter Name="startbalanceto" Type="Double" /><asp:Parameter Name="accountType" Type="Int32" /><asp:Parameter Name="ClosedTo" Type="Int64" /><asp:Parameter Name="MainNode" Type="Boolean" /><asp:Parameter Name="ProcessFlag" Type="Boolean" /><asp:Parameter Name="display_Flag" Type="Boolean" /><asp:Parameter Name="AccLevel" Type="Int32" /><asp:Parameter Name="MainParentAccId" Type="Int64" /><asp:Parameter Name="LastSerialNo" Type="String" /><asp:Parameter Name="CurId" Type="Int64" /><asp:Parameter Name="OrgId" Type="Int64" /><asp:Parameter Name="CreatedBy" Type="Int32" /><asp:Parameter Name="UpdateBy" Type="Int32" /><asp:Parameter Name="DeletedBy" Type="Int32" /><asp:Parameter Direction="InputOutput" Name="InsertedId" Type="Object" /></UpdateParameters></asp:ObjectDataSource>

               

            </div>
        </div>
    </div>
</div>
<!--end::Modal-->


            <asp:ObjectDataSource ID="GEODSById" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataByAccId" TypeName="NEWERPDataSetTableAdapters.AccountTreeViewTableAdapter" >
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtAccountId" Name="AccountId" PropertyName="Value" Type="Int64" />
                </SelectParameters>
                </asp:ObjectDataSource>

            <asp:TextBox ID="txtMainNode" runat="server"  Visible="False">

            </asp:TextBox><asp:TextBox ID="txtExpand1" runat="server" Visible="False" ></asp:TextBox><asp:TextBox ID="txtOrgId" runat="server"  Visible="False"></asp:TextBox><asp:TextBox ID="txtParentID" runat="server"  Visible="False"></asp:TextBox><asp:TextBox ID="txtLastSerialNo" runat="server"  Visible="False"></asp:TextBox><asp:TextBox ID="txtlevel" runat="server"  Visible="False"></asp:TextBox><asp:TextBox ID="txtRoot" runat="server"  Visible="False"></asp:TextBox><asp:TextBox ID="txtProcessFlag" runat="server"  Visible="False"></asp:TextBox><asp:ObjectDataSource ID="GEODSByCode" runat="server"
                SelectMethod="Read" TypeName="BOL.Accounts" OldValuesParameterFormatString="original_{0}"><SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" />
                    <asp:Parameter Name="AccountId" Type="Int64" />
                    <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
                    <asp:Parameter DefaultValue="" Name="BRANCHId" Type="Int64" />
                    <asp:Parameter Name="ParentAccountId" Type="Int64" />
                    <asp:Parameter Name="CostId" Type="Int64" />
                    <asp:Parameter Name="StartDate" Type="String" />
                    <asp:Parameter Name="EndDate" Type="String" />
                    <asp:Parameter Name="SearchText" Type="String" />
                    <asp:ControlParameter ControlID="AccountCodeTextBox" Name="accountcode" PropertyName="Text" Type="String" />
                <asp:Parameter Name="AccountName" Type="String" /></SelectParameters>
            </asp:ObjectDataSource>

            <asp:HiddenField ID="txtExpand" runat="server" />
            <asp:ObjectDataSource ID="SUPPLIERS_CUSTOMERS_DS" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataByAccountIdAndType" TypeName="NEWERPDataSetTableAdapters.SUPPLIERS_CUSTOMERSTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update" ><DeleteParameters><asp:Parameter Name="Original_SUP_CUST_ID" Type="Int64" /></DeleteParameters><InsertParameters><asp:Parameter Name="SUP_CUST_CODE" Type="String" /><asp:Parameter Name="SUP_CUST_FNAME" Type="String" /><asp:Parameter Name="SUP_CUST_SNAME" Type="String" /><asp:Parameter Name="SUP_CUST_TYPE" Type="Int32" /><asp:Parameter Name="ADMIN_NAME" Type="String" /><asp:Parameter Name="ADMIN_TITLE" Type="String" /><asp:Parameter Name="ADDRESS" Type="String" /><asp:Parameter Name="CITY" Type="String" /><asp:Parameter Name="GOVERNERATE" Type="String" /><asp:Parameter Name="COUNTRY" Type="String" /><asp:Parameter Name="PHONE1" Type="String" /><asp:Parameter Name="PHONE2" Type="String" /><asp:Parameter Name="FAX" Type="String" /><asp:Parameter Name="POSTOFFICE" Type="String" /><asp:Parameter Name="EMAIL" Type="String" /><asp:Parameter Name="SUPPLIERACOUNT" Type="Double" /><asp:Parameter Name="CONVICT" Type="Double" /><asp:Parameter Name="CREDITOR" Type="Double" /><asp:Parameter Name="NOTES" Type="String" /><asp:Parameter Name="accountid" Type="Int64" /><asp:Parameter Name="WORKHOURS" Type="String" /><asp:Parameter Name="WEEKEND" Type="String" /><asp:Parameter Name="SALEADMIN" Type="Int64" /><asp:Parameter Name="CREDITLIMIT" Type="Decimal" /><asp:Parameter Name="CREDITPEROID" Type="Decimal" /><asp:Parameter Name="PAYPEROID" Type="Decimal" /></InsertParameters><SelectParameters><asp:ControlParameter ControlID="accountTypeDropDownList" Name="SUP_CUST_TYPE" PropertyName="SelectedValue" Type="Int32" /><asp:ControlParameter ControlID="txtAccountId" Name="accountId" PropertyName="Value" Type="Int64" /></SelectParameters><UpdateParameters><asp:Parameter Name="SUP_CUST_CODE" Type="String" /><asp:Parameter Name="SUP_CUST_FNAME" Type="String" /><asp:Parameter Name="SUP_CUST_SNAME" Type="String" /><asp:Parameter Name="SUP_CUST_TYPE" Type="Int32" /><asp:Parameter Name="ADMIN_NAME" Type="String" /><asp:Parameter Name="ADMIN_TITLE" Type="String" /><asp:Parameter Name="ADDRESS" Type="String" /><asp:Parameter Name="CITY" Type="String" /><asp:Parameter Name="GOVERNERATE" Type="String" /><asp:Parameter Name="COUNTRY" Type="String" /><asp:Parameter Name="PHONE1" Type="String" /><asp:Parameter Name="PHONE2" Type="String" /><asp:Parameter Name="FAX" Type="String" /><asp:Parameter Name="POSTOFFICE" Type="String" /><asp:Parameter Name="EMAIL" Type="String" /><asp:Parameter Name="SUPPLIERACOUNT" Type="Double" /><asp:Parameter Name="CONVICT" Type="Double" /><asp:Parameter Name="CREDITOR" Type="Double" /><asp:Parameter Name="NOTES" Type="String" /><asp:Parameter Name="accountid" Type="Int64" /><asp:Parameter Name="WORKHOURS" Type="String" /><asp:Parameter Name="WEEKEND" Type="String" /><asp:Parameter Name="SALEADMIN" Type="Int64" /><asp:Parameter Name="CREDITLIMIT" Type="Decimal" /><asp:Parameter Name="CREDITPEROID" Type="Decimal" /><asp:Parameter Name="PAYPEROID" Type="Decimal" /><asp:ControlParameter ControlID="txtAccountId" Name="Original_SUP_CUST_ID" PropertyName="Value" Type="Int64" /></UpdateParameters></asp:ObjectDataSource>

               

            <%-- <asp:Label ID="PlannedAverageLabel" runat="server" Text='<%# Eval("PlannedAverage") %>' Visible="false"></asp:Label>
                            
                            <asp:Label ID="ActualAverageLabel" runat="server" Text='<%# Eval("ActualAverage") %>' Visible="false"></asp:Label>
                            <asp:Label ID="AverageDifferenceLabel" runat="server" Text='<%# Eval("AverageDifference") %>' Visible="false"></asp:Label>
                            <asp:Label ID="PercentageDifferenceLabel" runat="server" Text='<%# Eval("PercentageDifference") %>' Visible="false"></asp:Label>--%>
<script type="text/javascript">
                                        $(document).ready(function () {


                                           <%-- var treeData =<%= jsonStrnig %> ;
                                            alert(treeData);--%>

                                            var treeData = [
                                                     <%= jsonStrnig %>
                                            ];


                                            $('#myTree').treeview({
                                                data: treeData,
                                                expandIcon: 'fa fa-plus',
                                                collapseIcon: 'fa fa-angle-right fa-fw',
                                                indent: 1.25,
                                                parentsMarginLeft: '1.25rem',
                                                //expandIcon: 'fa fa-angle-down fa-fw',
                                                //collapseIcon: 'fa fa-angle-right fa-fw',
                                                //indent: 1.25,
                                                //parentsMarginLeft: '1.25rem',
                                                //openNodeLinkOnNewTab: true,
                                                //color: "#428bca",
                                                onNodeChecked: function (event, data) { },
                                                onNodeSelected: function (event, node) {
                                                    //$('.contanter').css('background','green');
                                                    //alert( $('myTree').treeview('getSelected', nodeId));
                                                    //alert("sel");
                                                    $("#<%= txtAccountId.ClientID %>").val(node.id);
                                                    //$('#btnSubmit').trigger('click');
                                                    $("#<%=btnSubmit.ClientID%>").trigger('click'); 


                                              <%-- <% GetNodeInfo(txtAccountId.Text);%>--%>
                                                    //window.location.href = "WebTree.aspx?Id=" + node.id;

                                                    //__doPostBack('', '');
                                                    //alert(node.id);
                                                },
                                                onNodeUnselected: function (event, node) {
                                                    //$('.contanter').css('background','red');
                                                    //$('#myTree').treeview('toggleNodeSelected', [data.nodeId, { silent: true }]);

                                                },
                                                onNodeExpanded: function (event, node) {
                                                    //$('.contanter').css('background','red');
                                                    //alert("Expand");
                                                    $("#<%= txtAccountId.ClientID %>").val(node.id);
                                                    $("#<%= txtExpand.ClientID %>").val(1);
                                                    
                                                    $("#<%=btnSubmit.ClientID%>").trigger('click'); 


                                                //$('#btnSubmit').trigger('click');

                                            },

                                            onNodeCollapsed: function (event, node) {

                                                //alert("coll");
                                                $("#<%= txtAccountId.ClientID %>").val(node.id);
                                                $("#<%= txtExpand.ClientID %>").val(0); 
                                                $("#<%= btnSubmit.ClientID%>").trigger('click'); 
                                                //$('#btnSubmit').trigger('click');
                                    
                                            }

                                            //onNodeSelected: function (event, data) { }
                                        });
                                        });

                                       <%--  var treeObj = $('#myTree');
                                        var nodes = treeObj.getNodes();
               
                                        if (nodes.length > 0) {
                 
                                            var node = treeObj.selectNode(<%= txtAccountId.ClientID %>);
                                                alert(node);
                                        }--%>

</script>
