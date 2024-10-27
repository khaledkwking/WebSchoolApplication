<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SetupNewAccount.ascx.cs" Inherits="WebSchool.Controls.Setup.SetupNewAccount" %>

<style>
    div.admin-box {
        background-color: #FFE16A;
    }

/*.active a { background-color: #FFE16A !important;}*/
</style>
<%--     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">--%>
<%--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>--%>
    
<script src="../../assets/vendors/general/jquery/dist/jquery.min.js"></script>
<script src="../../assets/vendors/general/bootstrap/dist/js/bootstrap.min.js"></script>


<div class="kt-portlet kt-portlet--mobile">

    <div class="kt-portlet__body">
        <div id="ErrorDiv" runat="server"></div>




  <ul class="nav nav-tabs">
       <li id="Limenu1" class="active" runat="server" >
           <a data-toggle="tab" href="#menu1" ><% =Resources.DefaultResource.CompanyData%></a></li>
    <li  id="Lihome" runat="server" visible ="false">
        
        <a data-toggle="tab" href="#home" ><% =Resources.DefaultResource.OptionAccount%></a>

    </li>
   
   <%-- <li><a data-toggle="tab" href="#menu2"><% =Resources.DefaultResource.CodesData%></a></li>--%>
        <%--  <li><a data-toggle="tab" href="#menu3"><% =Resources.DefaultResource.CodesData%></a></li>--%>
  </ul>

  <div class="tab-content">
  
    <div id="menu1" class="tab-pane fade show active" runat="server">
              <div class="kt-portlet">
                        <%--    <div class="kt-portlet__head">
                                <div class="kt-portlet__head-label">
                                    <h3 class="kt-portlet__head-title">
                                        <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0" />
                                    </h3>
                                </div>
                            </div>--%>

                            <!--begin::Form-->
                            <div class="kt-form kt-form--label-right">
                                <div class="kt-portlet__body">

              <div class="form-group row">
                <label class="col-2 col-form-label">
                        <asp:Literal ID="Literal18" runat="server" Text="<%$ Resources:DefaultResource, CompanyArName%>" />
                        </label>
                    <div class="col-4">
                       <asp:TextBox ID="CompanyArNameTextBox" runat="server" AutoComplete="Off"  CssClass="form-control"  />
                         <asp:RequiredFieldValidator ID="CompanyArNameRequiredFieldValidator" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                           ControlToValidate="CompanyArNameTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true"> </asp:RequiredFieldValidator>

                    </div>
            <label class="col-2 col-form-label">
                        <asp:Literal ID="Literal19" runat="server" Text="<%$ Resources:DefaultResource, CompanyEngName%>" />
                        </label>
                <div class="col-4">

                   <asp:TextBox ID="CompanyEngNameTextBox" runat="server" AutoComplete="Off"  CssClass="form-control"  />
                         <asp:RequiredFieldValidator ID="CompanyEngNameRequiredFieldValidator" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                           ControlToValidate="CompanyArNameTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true"> </asp:RequiredFieldValidator>

                       

                </div>

         </div>
                <div class="form-group row">
                <label class="col-2 col-form-label">
                        <asp:Literal ID="Literal20" runat="server" Text="<%$ Resources:DefaultResource, CompanyArAddress%>" />
                        </label>
                    <div class="col-4">
                       <asp:TextBox ID="CompanyArAddressTextBox" runat="server" AutoComplete="Off"  CssClass="form-control"  />
                         <asp:RequiredFieldValidator ID="CompanyArAddressRequiredFieldValidator" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                           ControlToValidate="CompanyArAddressTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true"> </asp:RequiredFieldValidator>

                    </div>
            <label class="col-2 col-form-label">
                        <asp:Literal ID="Literal21" runat="server" Text="<%$ Resources:DefaultResource, CompanyEngAddress%>" />
                        </label>
                <div class="col-4">

                   <asp:TextBox ID="CompanyEngAddressTextBox" runat="server" AutoComplete="Off"  CssClass="form-control"  />
                         <asp:RequiredFieldValidator ID="CompanyEngAddressRequiredFieldValidator" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                           ControlToValidate="CompanyEngAddressTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true"> </asp:RequiredFieldValidator>

                </div>

         </div>
                                    <div class="form-group row">
                <label class="col-2 col-form-label">
                        <asp:Literal ID="Literal22" runat="server" Text="<%$ Resources:DefaultResource, CompanyTel%>" />
                        </label>
                    <div class="col-4">
                       <asp:TextBox ID="CompanyTelTextBox" runat="server" AutoComplete="Off"  CssClass="form-control"  />
                         <asp:RequiredFieldValidator ID="CompanyTelRequiredFieldValidator" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                           ControlToValidate="CompanyTelTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true"> </asp:RequiredFieldValidator>

                    </div>
            <label class="col-2 col-form-label">
                        <asp:Literal ID="Literal23" runat="server" Text="<%$ Resources:DefaultResource, ComapanyFax%>" />
                        </label>
                <div class="col-4">

                   <asp:TextBox ID="ComapanyFaxTextBox" runat="server" AutoComplete="Off"  CssClass="form-control"  />
                        

                </div>

         </div>
            <div class="form-group row">
                <label class="col-2 col-form-label">
                        <asp:Literal ID="Literal24" runat="server" Text="<%$ Resources:DefaultResource, CompanyEmail%>" />
                        </label>
                    <div class="col-4">
                       <asp:TextBox ID="CompanyEmailTextBox" runat="server" AutoComplete="Off"  CssClass="form-control"  />
                        

                    </div>
            <label class="col-2 col-form-label">
                        <asp:Literal ID="Literal25" runat="server" Text="<%$ Resources:DefaultResource, CompanyArActivity%>" />
                        </label>
                <div class="col-4">

                   <asp:TextBox ID="CompanyArActivityTextBox" runat="server" AutoComplete="Off"  CssClass="form-control"  />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                           ControlToValidate="CompanyArActivityTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true"> </asp:RequiredFieldValidator>

                </div>

         </div>
            <div class="form-group row">
                <label class="col-2 col-form-label">
                        <asp:Literal ID="Literal31" runat="server" Text="<%$ Resources:DefaultResource, UserName%>" />
                        </label>
                    <div class="col-4">
                    
                         <asp:TextBox ID="txtUserName" runat="server"  AutoComplete="Off" CssClass="form-control" placeholder="<%$ Resources:DefaultResource, UserName%>" required="required"  ></asp:TextBox>
                         <asp:RequiredFieldValidator ID="UserNameRequiredFieldValidator" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                           ControlToValidate="txtUserName" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true"> </asp:RequiredFieldValidator>

                    </div>
            <label class="col-2 col-form-label">
                        <asp:Literal ID="Literal32" runat="server" Text="<%$ Resources:DefaultResource, Password%>" />
                        </label>
                <div class="col-4">

                  
                     <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control " placeholder="<%$ Resources:DefaultResource, Password%>" TextMode="Password" AutoComplete="Off"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="PasswordRequiredFieldValidator" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                           ControlToValidate="txtPassword" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true"> </asp:RequiredFieldValidator>

                </div>

         </div>
                         <div class="form-group row">
                <label class="col-2 col-form-label">
                        <asp:Literal ID="Literal26" runat="server" Text="<%$ Resources:DefaultResource, CompanyEngActivity%>" />
                        </label>
                    <div class="col-4">
                       <asp:TextBox ID="CompanyEngActivityTextBox" runat="server" AutoComplete="Off"  CssClass="form-control"  />
                        

                    </div>
                       <label class="col-2 col-form-label">
                        <asp:Literal ID="Literal28" runat="server" Text="<%$ Resources:DefaultResource, ComapanyLogo%>" />
                        </label>
                          
                                    <div class="col-3">
                                        <asp:FileUpload ID="ImageUploaderFileUploader" runat="server" CssClass="form-control" placeholder="<%$ Resources:DefaultResource, ImageFile%>" />
                                        <%--<asp:RequiredFieldValidator ID="ImageUploaderFileUploaderRFV" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                            ControlToValidate="ImageUploaderFileUploader" ValidationGroup="DML" CssClass="label label-warning">
                                        </asp:RequiredFieldValidator>--%>
                                    </div>
                                <div class="col-1">
                                       
                                       <asp:Image ID="ImageLogo" runat="server" Height="70px" Width="70px" />
                                    </div>

         </div>       
                                    <div class="form-group row">
                                        <label class="col-2 col-form-label">
                        <asp:Literal ID="Literal27" runat="server" Text="<%$ Resources:DefaultResource, CompanyNotes%>" />
                        </label>
                <div class="col-10">

                   <asp:TextBox ID="CompanyNotesTextBox" runat="server" AutoComplete="Off"  CssClass="form-control"  TextMode ="MultiLine" Height="60px" />
                        

                </div>
                                        </div>
                <div class="col-2">
                                                
                          <asp:Button ID="SaveButton" runat="server"  Text="<%$ Resources:DefaultResource, Insert%>"  data-original-title="<%$ Resources:DefaultResource, Insert%>" data-toggle="tooltip" title="<%$ Resources:DefaultResource, Insert%>" CssClass="btn btn-success" ValidationGroup="DML" Width="100%" OnClick="SaveButton_Click" />
                                                
                 </div>         

                                </div>
                                </div>
                  </div>
        

    </div>
        <div id="home" class="tab-pane fade" runat="server" visible ="false">
          <div class="kt-portlet">
                            <div class="kt-portlet__head">
                                <div class="kt-portlet__head-label">
                                    <h3 class="kt-portlet__head-title">
                                        <% =Resources.DefaultResource.OptionAccount%>
                                    </h3>
                                </div>
                            </div>

                            <!--begin::Form-->
                            <div class="kt-form kt-form--label-right">
                                <div class="kt-portlet__body">
      
      
         <div class="form-group row">
                <label class="col-2 col-form-label">
                        <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:DefaultResource, SalesAccount%>" />
                        </label>
                <div class="col-4">

                    <asp:DropDownList ID="SalesAccountDropDownList" runat="server" CssClass="form-control selectpicker"  data-live-search="true"  
                        AppendDataBoundItems="True" DataTextField="accountname" DataValueField="accountid" DataSourceID="AccountDS">
                            <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0" />
                    </asp:DropDownList>

                     

                </div>
            <label class="col-2 col-form-label">
                        <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:DefaultResource, SalesCashAccount%>" />
                        </label>
                <div class="col-4">

                    <asp:DropDownList ID="SalesCashAccountDropDownList" runat="server" CssClass="form-control selectpicker"  data-live-search="true" 
                        AppendDataBoundItems="True" DataTextField="accountname" DataValueField="accountid" DataSourceID="AccountDS">
                            <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0" />
                    </asp:DropDownList>

                      

                </div>

         </div>
        <div class="form-group row">
                <label class="col-2 col-form-label">
                        <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:DefaultResource, SalesDebitAccount%>" />
                        </label>
                <div class="col-4">

                    <asp:DropDownList ID="SalesDebitAccountDropDownList" runat="server" CssClass="form-control selectpicker"  data-live-search="true" 
                        AppendDataBoundItems="True" DataTextField="accountname" DataValueField="accountid" DataSourceID="AccountDS">
                            <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0" />
                    </asp:DropDownList>

                       

                </div>
            <label class="col-2 col-form-label">
                        <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:DefaultResource, SalesReturnCashAccount%>" />
                        </label>
                <div class="col-4">

                    <asp:DropDownList ID="SalesReturnCashAccountDropDownList" runat="server" CssClass="form-control selectpicker"  data-live-search="true" 
                        AppendDataBoundItems="True" DataTextField="accountname" DataValueField="accountid" DataSourceID="AccountDS">
                            <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0" />
                    </asp:DropDownList>

                      

                </div>

         </div>
                                    
        <div class="form-group row">
          <label for="qididlabel" class="col-2 col-form-label">
                        <asp:Literal ID="SalesReturnDebitAccountlabel" runat="server" Text="<%$ Resources:DefaultResource, SalesReturnDebitAccount%>" />
                        </label>
                <div class="col-4">

                    <asp:DropDownList ID="SalesReturnDebitAccountDropDownList" runat="server" CssClass="form-control selectpicker"  data-live-search="true" 
                        AppendDataBoundItems="True" DataTextField="accountname" DataValueField="accountid" DataSourceID="AccountDS">
                            <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0" />
                    </asp:DropDownList>

                      

                </div>
            <label class="col-2 col-form-label">
                        <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:DefaultResource, PurchaseAccount%>" />
                        </label>
                <div class="col-4">

                    <asp:DropDownList ID="PurchaseAccountDropDownList" runat="server" CssClass="form-control selectpicker"  data-live-search="true" 
                        AppendDataBoundItems="True" DataTextField="accountname" DataValueField="accountid" DataSourceID="AccountDS">
                            <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0" />
                    </asp:DropDownList>

                      

                </div>

         </div>
          <div class="form-group row">
                <label class="col-2 col-form-label">
                        <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:DefaultResource, PurchaseCashAccount%>" />
                        </label>
                <div class="col-4">

                    <asp:DropDownList ID="PurchaseCashAccountDropDownList" runat="server" CssClass="form-control selectpicker"  data-live-search="true" 
                        AppendDataBoundItems="True" DataTextField="accountname" DataValueField="accountid" DataSourceID="AccountDS">
                            <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0" />
                    </asp:DropDownList>

                      

                </div>
            <label class="col-2 col-form-label">
                        <asp:Literal ID="Literal8" runat="server" Text="<%$ Resources:DefaultResource, PurchaseDebitAccount%>" />
                        </label>
                <div class="col-4">

                    <asp:DropDownList ID="PurchaseDebitAccountDropDownList" runat="server" CssClass="form-control selectpicker"  data-live-search="true" 
                        AppendDataBoundItems="True" DataTextField="accountname" DataValueField="accountid" DataSourceID="AccountDS">
                            <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0" />
                    </asp:DropDownList>

                       

                </div>

         </div>
         <div class="form-group row">
                <label class="col-2 col-form-label">
                        <asp:Literal ID="Literal9" runat="server" Text="<%$ Resources:DefaultResource, PurchaseReturnCashAccount%>" />
                        </label>
                <div class="col-4">

                    <asp:DropDownList ID="PurchaseReturnCashAccountDropDownList" runat="server" CssClass="form-control selectpicker"  data-live-search="true" 
                        AppendDataBoundItems="True" DataTextField="accountname" DataValueField="accountid" DataSourceID="AccountDS">
                            <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0" />
                    </asp:DropDownList>

                       

                </div>
            <label class="col-2 col-form-label">
                        <asp:Literal ID="Literal10" runat="server" Text="<%$ Resources:DefaultResource, PurchaseDebitAccount%>" />
                        </label>
                <div class="col-4">

                    <asp:DropDownList ID="PurchaseReturnDebitAccountDropDownList" runat="server" CssClass="form-control selectpicker"  data-live-search="true" 
                        AppendDataBoundItems="True" DataTextField="accountname" DataValueField="accountid" DataSourceID="AccountDS">
                            <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0" />
                    </asp:DropDownList>

                     

                </div>

         </div>
         <div class="form-group row">
                <label class="col-2 col-form-label">
                        <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:DefaultResource, CashBoxAccount%>" />
                        </label>
                <div class="col-4">

                    <asp:DropDownList ID="CashBoxAccountDropDownList" runat="server" CssClass="form-control selectpicker"  data-live-search="true" 
                        AppendDataBoundItems="True" DataTextField="accountname" DataValueField="accountid" DataSourceID="AccountDS">
                            <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0" />
                    </asp:DropDownList>

                      

                </div>
            <label class="col-2 col-form-label">
                        <asp:Literal ID="Literal11" runat="server" Text="<%$ Resources:DefaultResource, BanksAccount%>" />
                        </label>
                <div class="col-4">

                    <asp:DropDownList ID="BanksAccountDropDownList" runat="server" CssClass="form-control selectpicker"  data-live-search="true" 
                        AppendDataBoundItems="True" DataTextField="accountname" DataValueField="accountid" DataSourceID="AccountDS">
                            <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0" />
                    </asp:DropDownList>

                      

                </div>

         </div>
         <div class="form-group row">
                <label class="col-2 col-form-label">
                        <asp:Literal ID="Literal12" runat="server" Text="<%$ Resources:DefaultResource, Customers%>" />
                        </label>
                <div class="col-4">

                    <asp:DropDownList ID="CustomersDropDownList" runat="server" CssClass="form-control selectpicker"  data-live-search="true" 
                        AppendDataBoundItems="True" DataTextField="accountname" DataValueField="accountid" DataSourceID="AccountDS">
                            <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0" />
                    </asp:DropDownList>

                       

                </div>
            <label class="col-2 col-form-label">
                        <asp:Literal ID="Literal13" runat="server" Text="<%$ Resources:DefaultResource, suppliers%>" />
                        </label>
                <div class="col-4">

                    <asp:DropDownList ID="suppliersDropDownList" runat="server" CssClass="form-control selectpicker"  data-live-search="true" 
                        AppendDataBoundItems="True" DataTextField="accountname" DataValueField="accountid" DataSourceID="AccountDS">
                            <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0" />
                    </asp:DropDownList>

                       

                </div>

         </div>
           <div class="form-group row">
                <label class="col-2 col-form-label">
                        <asp:Literal ID="Literal14" runat="server" Text="<%$ Resources:DefaultResource, AssetAccount%>" />
                        </label>
                <div class="col-4">

                    <asp:DropDownList ID="AssetAccountDropDownList" runat="server" CssClass="form-control selectpicker"  data-live-search="true" 
                        AppendDataBoundItems="True" DataTextField="accountname" DataValueField="accountid" DataSourceID="AccountDS">
                            <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0" />
                    </asp:DropDownList>

                      

                </div>
            <label class="col-2 col-form-label">
                        <asp:Literal ID="Literal15" runat="server" Text="<%$ Resources:DefaultResource, DiscountAccount%>" />
                        </label>
                <div class="col-4">

                    <asp:DropDownList ID="DiscountAccountDropDownList" runat="server" CssClass="form-control selectpicker"  data-live-search="true" 
                        AppendDataBoundItems="True" DataTextField="accountname" DataValueField="accountid" DataSourceID="AccountDS">
                            <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0" />
                    </asp:DropDownList>

                       

                </div>

         </div>
         <div class="form-group row">
                <label class="col-2 col-form-label">
                        <asp:Literal ID="Literal16" runat="server" Text="<%$ Resources:DefaultResource, PaymentAccount%>" />
                        </label>
                <div class="col-4">

                    <asp:DropDownList ID="PaymentAccountDropDownList" runat="server" CssClass="form-control selectpicker"  data-live-search="true" 
                        AppendDataBoundItems="True" DataTextField="accountname" DataValueField="accountid" DataSourceID="AccountDS">
                            <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0" />
                    </asp:DropDownList>

                       

                </div>
            <label class="col-2 col-form-label">
                        <asp:Literal ID="Literal17" runat="server" Text="<%$ Resources:DefaultResource, ProfitAccount%>" />
                        </label>
                <div class="col-4">

                    <asp:DropDownList ID="ProfitAccountDropDownList" runat="server" CssClass="form-control selectpicker"  data-live-search="true" 
                        AppendDataBoundItems="True" DataTextField="accountname" DataValueField="accountid" DataSourceID="AccountDS">
                            <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0" />
                    </asp:DropDownList>

                       

                </div>

         </div>
                   <div class="col-2">
                                                
                          <asp:Button ID="ButtonUpdate" runat="server"  Text="<%$ Resources:DefaultResource, Insert%>"  data-original-title="<%$ Resources:DefaultResource, Insert%>" data-toggle="tooltip" title="<%$ Resources:DefaultResource, Insert%>" CssClass="btn btn-success" ValidationGroup="DML" Width="100%" OnClick="ButtonUpdate_Click"  />
                                                
                 </div>    
         </div>
                                </div>
              </div>
        </div>
   <%-- <div id="menu2" class="tab-pane fade">--%>
<%--    <h3><%--<asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0" />--%>
    <%--  <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
    </div>--%>
      
      <%--<asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0" />--%>

    

    </div>
                     
    </div>
    
</div>
<asp:ObjectDataSource ID="AccountDS" runat="server" SelectMethod="Read" TypeName="BOL.Accounts" OldValuesParameterFormatString="original_{0}">
    <SelectParameters>
        <asp:Parameter DefaultValue="4" Name="ActionCode" Type="String" />
        <asp:Parameter Name="AccountId" Type="Int64" />
        <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
        <asp:Parameter Name="BRANCHId" Type="Int64" />
        <asp:Parameter Name="ParentAccountId" Type="Int64" />
        <asp:Parameter Name="CostId" Type="Int64" />
        <asp:Parameter Name="StartDate" Type="String" />
        <asp:Parameter Name="EndDate" Type="String" />
        <asp:Parameter Name="SearchText" Type="String" />
        <asp:Parameter Name="AccountCode" Type="String" />
        <asp:Parameter Name="AccountName" Type="String"></asp:Parameter>
    </SelectParameters></asp:ObjectDataSource>

    

    
                   <asp:TextBox ID="ExpiredFlagTextBox" runat="server" AutoComplete="Off"  CssClass="form-control"  Visible ="false"  />
                    <asp:TextBox ID="SubStartDateTextBox" runat="server" AutoComplete="Off"  CssClass="form-control"  Visible ="false"  />
                 <asp:TextBox ID="SubEndDateTextBox" runat="server" AutoComplete="Off"  CssClass="form-control"  Visible ="false"  />
                  
    

    
    
                   <asp:TextBox ID="txtCode" runat="server" AutoComplete="Off"  CssClass="form-control"  Visible ="false"  />
                    
                  
    

    
    
                   <asp:TextBox ID="txtImageLogo" runat="server" AutoComplete="Off"  CssClass="form-control"  Visible ="false"  />
                    
                  
    

    
    
