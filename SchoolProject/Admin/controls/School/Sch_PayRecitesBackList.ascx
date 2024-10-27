    <%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Sch_PayRecitesBackList.ascx.cs" Inherits="WebSchool.ADMIN.Controls.School.Sch_PayRecitesBackList" %>


<div class="content-header">
    <%-- <div class="header-section">
        <h1>
            <i class="gi gi-user"></i> <%= Resources.DefaultResource.Main%>
        </h1>
    </div>--%>
</div>
<ul class="breadcrumb breadcrumb-top">
    <li><a href="Main.aspx"><%= Resources.DefaultResource.Main%> </a></li>
    <li> <%= Resources.DefaultResource.SchoolInvoiceReturns %> </li>
</ul>


       
<div class="block table-responsive">
    <!-- Table Styles Title -->
    <div class="block-title">
        <h2><strong><%= Resources.DefaultResource.List%>  </strong> <%= Resources.DefaultResource.SchoolInvoiceReturns%> </h2>
        <div class="block-options pull-right">
            <asp:LinkButton ID="NewRecord" runat="server" CssClass="btn btn-sm btn-success" data-toggle="tooltip" title="<%$ Resources:DefaultResource, NewRecord%>"  data-original-title="<%$ Resources:DefaultResource, NewRecord%>" OnClick="NewRecord_Click"> <i class="fa fa-file"></i></asp:LinkButton>
        </div>
    </div>
    <!-- END Table Styles Title -->
    
    <div class="gallery gallery-widget" data-toggle="lightbox-gallery">
               
     <!-- General Data Block -->  
        <div class="row">
             <div class=" col-md-6">
                 <asp:TextBox ID="StartDateTextBox" runat="server"  CssClass="form-control input-datepicker" placeholder="<%$ Resources:DefaultResource, FromDate%>" data-date-format="dd/mm/yyyy" autocomplete ="off"/>
            </div>
             <div class=" col-md-6">
                 <asp:TextBox ID="EndDateTextBox" runat="server"  CssClass="form-control input-datepicker" placeholder="<%$ Resources:DefaultResource, ToDate%>" data-date-format="dd/mm/yyyy" autocomplete ="off" />
            </div>
           
          </div>
        <div class="input-group">
            <asp:TextBox ID="SearchTextBox" runat="server" CssClass="form-control" placeholder="<%$ Resources:DefaultResource, Search%>"></asp:TextBox>

            <span class="input-group-btn">
                
                <asp:LinkButton ID="ClearLinkButton" runat="server" CssClass="btn btn-sm btn-danger" OnClick="ClearLinkButton_Click"> <i class="hi hi-remove"></i><%= Resources.DefaultResource.ClearSearch%></asp:LinkButton>
               
                <asp:LinkButton ID="SearchLinkButton" runat="server" CssClass="btn btn-sm btn-primary" OnClick="SearchLinkButton_Click"> <i class="fa fa-search"></i><%= Resources.DefaultResource.SearchTitle%></asp:LinkButton>

            </span>
        </div>
        <br />
  
        <asp:ListView ID="InvoiceView" runat="server" DataKeyNames="InvId" DataSourceID="InvoiceDS"   OnItemDataBound="InvoiceView_ItemDataBound">
                      
                     
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
                                                   <%-- <%# Eval("InvCode") %>--%>
                                                     <asp:label ID="Label9" runat="server"  class="control-label" Text='<%# Bind("InvCode") %>'/>
                                                </td>
                                                 <th> 
                                                       <label for="NotesTextBox" class=" control-label">
                                                         <asp:Literal ID="Literal19" runat="server" Text="<%$ Resources:DefaultResource, StudentName%>" />
                                                        </label>
                                                     <%--<%= Resources.DefaultResource.StudentName%> --%>
                                                </th>
                                                <td colspan="2">
                                                   <%-- <%# Eval("StudentName") %>--%>
                                                     <asp:label ID="Label8" runat="server"  class="control-label" Text='<%# Bind("StudentName") %>'/>
                                                </td>
                                                 <th>
                                                     <label for="NotesTextBox" class="control-label">
                                                         <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:DefaultResource, TotalInvoice%>" />
                                                        </label>
                                                    <%-- <%= Resources.DefaultResource.TotalInvoice%> --%>
                                                </th>
                                                <td colspan="2">
                                                   <%-- <%# Eval("InvTotalNet") %>--%>
                                                     <asp:label ID="Label7" runat="server"  class="control-label" Text='<%# Bind("InvTotalNet") %>'/>
                                                </td>
                                                 <th> 
                                                      <label for="NotesTextBox" class="control-label">
                                                         <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:DefaultResource, Payment%>" />
                                                        </label>
                                                   <%--  <%= Resources.DefaultResource.Payment%> --%>
                                                </th>
                                                <td colspan="2">

                                                   <%-- <%# Eval("InvPayment") %>--%>
                                                     <asp:label ID="lblInvPayment" runat="server"  class="control-label" Text='<%# Bind("InvPayment") %>'/>
                                                </td>
                                                <th> 
                                                     <label for="NotesTextBox" class="control-label">
                                                         <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:DefaultResource, Remain%>" />
                                                        </label>
                                                  <%--  <%= Resources.DefaultResource.Remain%> --%>

                                                </th>
                                                <td colspan="2">
                                                    <%--<%# Eval("InvRemain") %>--%>
                                                      <asp:label ID="lblInvRemain" runat="server"  class="control-label" Text='<%# Bind("InvRemain") %>'/>
                                                </td>
                                                 <th> 
                                                     <label for="NotesTextBox" class="control-label">
                                                         <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:DefaultResource, SalesMan%>" />
                                                        </label>
                                                  <%--  <%= Resources.DefaultResource.Remain%> --%>

                                                </th>
                                                  <td colspan="2">
                                                    <%--<%# Eval("InvRemain") %>--%>
                                                      <asp:label ID="LabelSalesMan" runat="server"  class="control-label" Text='<%# Bind("SaleManName") %>'/>
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
        <asp:ListView ID="lv" runat="server" DataKeyNames="ReciteId" DataSourceID="PaymentReciteDS" OnItemCommand="lv_ItemCommand" OnItemDataBound="lv_ItemDataBound" OnPreRender="lv_PreRender" OnSelectedIndexChanged="lv_SelectedIndexChanged">
            <EditItemTemplate>
               <tr>
                    <td colspan="12">
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
                          
                                 
                                
                                   <%--  <div class="form-group">
                                        <label for="TitleArTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:DefaultResource, InvoiceCode%>" />
                                        </label>

                                         <label for="InvCodeTextBox" class="col-md-4 control-label">
                                            <asp:Literal ID="Literal3" runat="server" Text='<%# Bind("InvCode") %>' />
                                        </label>

                                          <label for="TitleArTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:DefaultResource, StudentName%>" />
                                        </label>

                                         <label for="InvCodeTextBox" class="col-md-4 control-label">
                                            <asp:Literal ID="Literal5" runat="server" Text='<%# Bind("StudentName") %>' />
                                        </label>
                                    </div>--%>
                                <div class="form-group">
                                       <asp:label ID="InvIdTextBox" runat="server" CssClass="form-control" Text='<%# Bind("InvId") %>' Visible="false"/>
                                    <asp:label ID="RecSerialTextBox" runat="server" CssClass="form-control" Text='<%# Bind("RecSerial") %>'  Visible="false"/>
                                     <asp:label ID="ReciteIdTextBox" runat="server" CssClass="form-control" Text='<%# Bind("ReciteId") %>'  Visible="false"/>
                                 <%--    <asp:TextBox ID="TextBoxOrgId" runat="server" CssClass="form-control" Text='<%# Bind("OrgId") %>'  Visible="false" />--%>

                                        <label for="TitleArTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="TitleArLiteral1" runat="server" Text="<%$ Resources:DefaultResource, QidCode%>" />
                                        </label>
                                        <div class="col-md-4 ">
                                            <asp:TextBox ID="CodeTextBox" runat="server" CssClass="form-control" Text='<%# Bind("ReciteCode") %>' ReadOnly="true" />
                                           </div>

                                        <label for="lblName" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:DefaultResource, ReciteDate%>" />
                                        </label>
                                        <div class="col-md-4 ">
                                             <asp:TextBox ID="ReciteDateTextBox" runat="server" Text='<%# Bind("ReciteDate","{0: dd/MM/yyyy}") %>'   CssClass="form-control  input-datepicker" placeholder="<%$ Resources:DefaultResource, ReciteDate%>"  data-date-format="dd/mm/yyyy" AutoComplete="Off" />
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidatorDate" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="ReciteDateTextBox" ValidationGroup="DML" CssClass="label label-warning">
                                            </asp:RequiredFieldValidator>

                                        </div>

                                        

                                    </div>
                                
                                     <div class="form-group">
                                          <label for="lblPaymentTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal8" runat="server" Text="<%$ Resources:DefaultResource, ReturnAmount%>" />
                                        </label>
                                        <div class="col-md-3 ">
                                             <asp:TextBox ID="PaymentValueTextBox" runat="server" Text='<%# Bind("PaymentValue") %>'   CssClass="form-control" placeholder="<%$ Resources:DefaultResource, Payment%>"  />
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="PaymentValueTextBox" ValidationGroup="DML" CssClass="label label-warning">
                                            </asp:RequiredFieldValidator>

                                        </div>
                                        
                                        <label for="" class="col-md-2 control-label">
                                         
                                             <asp:Literal ID="lblPaymentType" runat="server" Text="<%$ Resources:DefaultResource, PaymentType%>" />
                                          </label>
                                       <div class="col-sm-3 col-xs-3 col-3">

                                            <asp:DropDownList ID="DropDownListPaymentType" Text='<%# Bind("PaymentType") %>' runat="server" CssClass="form-control" data-live-search="true"
                                                AppendDataBoundItems="True"  >
                                                <asp:ListItem  Value="1" text="<%$ Resources:DefaultResource, Cash%>"> 

                                                </asp:ListItem><asp:ListItem Value="2" Text="<%$ Resources:DefaultResource, Cheque%>">

                                                  </asp:ListItem><asp:ListItem Value="3" Text="<%$ Resources:DefaultResource, KeyNet%>">
                                                   </asp:ListItem><asp:ListItem Value="4" Text="<%$ Resources:DefaultResource, LinkPayement%>">

                                                   </asp:ListItem></asp:DropDownList>

                                       </div>
                                          <label for="" class="col-md-1 control-label">
                                         
                                             <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:DefaultResource, InvCloseFlag%>" />
                                          </label>
                                        <div class="col-md-1">
                                            <label class="switch switch-success">

                                                <asp:CheckBox ID="AttFlagCheckBox" runat="server" Checked='<%# Bind("CloseFlag") %>' /><span></span>
                                            </label>
                                        </div>
                                    </div>
                                    

                                <div class="form-group">
                               
                                        <label for="NotesTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal19" runat="server" Text="<%$ Resources:DefaultResource, CardNotes%>" />
                                        </label>
                                        <div class="col-md-4">
                                          <asp:TextBox ID="NotesTextBox" runat="server" CssClass="form-control" Text='<%# Bind("description") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, CardNotes%>" TextMode="MultiLine" />
                                        </div>
                                        <label for="NotesTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:DefaultResource, Payment%>" />
                                        </label>
                                      <div class="col-md-4">
                                       <asp:TextBox ID="txtInvRemain" CssClass="form-control"  runat="server" Text='<%# Eval("InvRemain") %>' ReadOnly="true"   />
                                        </div>
                                   </div>

                                <div class="form-group form-actions">
                                        <div class="col-md-12 col-md-offset-3">
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
                    <td colspan="12">
                        <div class="col-md-12">
                            <!-- Basic Form Elements Block -->
                            <div class="block">
                                <!-- Basic Form Elements Title -->
                                <div class="block-title">
                                    <h2><strong><%= Resources.DefaultResource.List %></strong> <%= Resources.DefaultResource.SchoolPayments %></h2>
                                </div>
                                <!-- END Form Elements Title -->
                                <!-- Basic Form Elements Content -->
                               
                                 <asp:TextBox ID="txtInvPayment" CssClass="form-control" runat="server" Text='<%# Eval("InvPayment") %>' Visible="false" />
                                  <asp:TextBox ID="txtInvTotalNet" CssClass="form-control" runat="server" Text='<%# Eval("InvTotalNet") %>' Visible="false" />

                                  <div class="form-horizontal form-bordered">
                                      <%--<asp:Label ID="TrainingIDLabel" runat="server" Text='<%# Eval("InvId ") %>' Visible="false" />    --%>
                                      <asp:Label ID="Label2" runat="server" Text='<%# Eval("StudentId ") %>' Visible="false" /> 
                                        <div class="form-group">
                                        <label for="TitleArTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="TitleArLiteral1" runat="server" Text="<%$ Resources:DefaultResource, QidCode%>" />
                                        </label>
                                        <div class="col-md-4 ">
                                            <asp:TextBox ID="CodeTextBox" runat="server" CssClass="form-control" Text='<%# Bind("ReciteCode") %>' ReadOnly="true" />
                                           </div>

                                        <label for="lblName" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:DefaultResource, ReciteDate%>" />
                                        </label>
                                        <div class="col-md-4 ">
                                             <asp:TextBox ID="ReciteDateTextBox" runat="server" Text='<%# Bind("ReciteDate","{0: dd/MM/yyyy}") %>'    CssClass="form-control  input-datepicker" placeholder="<%$ Resources:DefaultResource, ReciteDate%>"  data-date-format="dd/mm/yyyy" AutoComplete="Off" />
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidatorDate" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="ReciteDateTextBox" ValidationGroup="DML" CssClass="label label-warning">
                                            </asp:RequiredFieldValidator>


                                        </div>

                                        

                                    </div>
                                
                                     <div class="form-group">
                                          <label for="lblPaymentTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal8" runat="server" Text="<%$ Resources:DefaultResource, ReturnAmount%>" />
                                        </label>
                                        <div class="col-md-3 ">
                                             <asp:TextBox ID="txtPaymentValue" runat="server" Text='<%# Bind("PaymentValue") %>'   CssClass="form-control" placeholder="<%$ Resources:DefaultResource, Payment%>"  />
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="txtPaymentValue" ValidationGroup="DML" CssClass="label label-warning">
                                            </asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="CompareValidatorPayment" runat="server"  Operator="LessThanEqual"
                                                ErrorMessage="<%$ Resources:DefaultResource, PayamentValidate%>" Display="Dynamic"
                                                ValidationGroup="DML" CssClass="label label-warning"
                                                ControlToValidate="txtPaymentValue" ControlToCompare="txtInvRemain" Type="Double">

                                            </asp:CompareValidator>
                                        </div>
                                        
                                        <label for="" class="col-md-2 control-label">
                                         
                                             <asp:Literal ID="lblPaymentType" runat="server" Text="<%$ Resources:DefaultResource, PaymentType%>" />
                                          </label>
                                       <div class="col-sm-3 col-xs-3 col-3">

                                            <asp:DropDownList ID="DropDownListPaymentType" Text='<%# Bind("PaymentType") %>' runat="server" CssClass="form-control" data-live-search="true"
                                                AppendDataBoundItems="True"  >
                                                <asp:ListItem  Value="1" text="<%$ Resources:DefaultResource, Cash%>"> 

                                                </asp:ListItem><asp:ListItem Value="2" Text="<%$ Resources:DefaultResource, Cheque%>">

                                                  </asp:ListItem><asp:ListItem Value="3" Text="<%$ Resources:DefaultResource, KeyNet%>">
                                                   </asp:ListItem><asp:ListItem Value="4" Text="<%$ Resources:DefaultResource, LinkPayement%>">
                                                   </asp:ListItem>

                                            </asp:DropDownList>

                                       </div>
                                          <label for="" class="col-md-1 control-label">
                                         
                                             <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:DefaultResource, InvCloseFlag%>" />
                                          </label>
                                        <div class="col-md-1">
                                            <label class="switch switch-success">

                                                <asp:CheckBox ID="AttFlagCheckBox" runat="server" Checked='<%# Bind("CloseFlag") %>' /><span></span>
                                            </label>
                                        </div>

                                    </div>
                                    

                                       <div class="form-group">
                               
                                        <label for="NotesTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal19" runat="server" Text="<%$ Resources:DefaultResource, CardNotes%>" />
                                        </label>
                                        <div class="col-md-4">
                                          <asp:TextBox ID="NotesTextBox" runat="server" CssClass="form-control" Text='<%# Bind("description") %>' 
                                                   data-placeholder="<%$ Resources:DefaultResource, CardNotes%>" TextMode="MultiLine" />
                                        </div>
                                        <label for="NotesTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:DefaultResource, Payment%>" />
                                        </label>
                                      <div class="col-md-4">
                                       <asp:TextBox ID="txtInvRemain" CssClass="form-control"  runat="server" Text='<%# Eval("InvRemain") %>' ReadOnly="true"   />
                                        </div>
                                       </div>
                                
                                     <div class="form-group form-actions">
                                        <div class="col-md-12 col-md-offset-3">
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
                   
                    <%-- <asp:Label ID="InvIdLabel" runat="server" Text='<%# Eval("InvId") %>' Visible="false" />
                      <asp:Label ID="Label6" runat="server" Text='<%# Eval("RecSerial") %>' Visible="false" />
                      <asp:Label ID="Label7" runat="server" Text='<%# Eval("ReciteId") %>' Visible="false" />

                                    --%>
                   
                    <td>
                        <asp:Label ID="CodeLabel" runat="server" Text='<%# Eval("ReciteCode") %>' />
                    </td>
                     <td>
                         <%# String.Format(new System.Globalization.CultureInfo("ar-KW"), "{0: dd/MMM/yyyy}", Eval("ReciteDate")) %>
                    </td>
                      <td>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("InvCode") %>' />
                    </td>
                     <td>
                         <%# String.Format(new System.Globalization.CultureInfo("ar-KW"), "{0: dd/MMM/yyyy}", Eval("InvDate")) %>
                    </td>
                     <td>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("PaymentValue") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("StudentName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("PeriodName") %>' />
                    </td>
                   <td>
                         <%# String.Format(new System.Globalization.CultureInfo("ar-KW"), "{0: dd/MMM/yyyy}", Eval("StudyStartDate")) %>
                    </td>
            
                   <td>
                         <%# String.Format(new System.Globalization.CultureInfo("ar-KW"), "{0: dd/MMM/yyyy}", Eval("StudyEndDate")) %>
                    </td>
                  
                     <td>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("InvTotalNet") %>' />
                    </td>
                   <td class="text-center block-options">
                      
                         <asp:LinkButton ID="EditLinkButton" runat="server" CommandName="Edit" Text="" data-toggle="tooltip" title="<%$ Resources:DefaultResource, Edite%>" CssClass="btn btn-sm btn-default" data-original-title="<%$ Resources:DefaultResource, Edite%>">
                          
                                <i class="fa fa-pencil"></i>
                        </asp:LinkButton>
                        
                     
                            <asp:LinkButton ID="DeleteLinkButton" runat="server" CommandName="Delete" Text="" data-toggle="tooltip" title="<%$ Resources:DefaultResource, Delete%>" CssClass="btn btn-sm btn-danger" data-original-title="<%$ Resources:DefaultResource, Delete%>"  OnClientClick="javascript:if(!confirm('هل انت متأكد من حذف هذا السجل؟')){return false;}">
                                    <i class="fa fa-times"></i>
                            </asp:LinkButton>

                      <%--   <a data-toggle="tooltip" title="<%= Resources.DefaultResource.SchoolPeriods%>"   class="btn btn-sm btn-success" data-original-title="<%= Resources.DefaultResource.SchoolPeriods%>" href="Periods.aspx?StudentId=<%# Eval("StudentId")%>">
                            <i class="fa fa-users"></i>
                        </a>
                 --%>
                        

                    </td>
                     
                              
                </tr>

            </ItemTemplate>
        <LayoutTemplate>
                
                <table id="general-table" class="table table-striped table-vcenter table-bordered table-condensed">
                    <thead >
                        <tr>
                            <th class ="text-center">
                                <asp:LinkButton ID="CodeTitleLinkButton" runat="server" CommandArgument="ReciteCode" CommandName="Sort" Text="<%$ Resources:DefaultResource, QidCode%>" />
                            </th>
                             <th class ="text-center">
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument="ReciteDate" CommandName="Sort" Text="<%$ Resources:DefaultResource, ReciteDate%>" />
                            </th>
                              <th class ="text-center">
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument="InvCode" CommandName="Sort" Text="<%$ Resources:DefaultResource, InvoiceCode%>" />
                            </th>
                              <th class ="text-center">
                                <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument="InvDate" CommandName="Sort" Text="<%$ Resources:DefaultResource, InvoiceDate%>" />
                            </th>
                               <th class ="text-center">
                                <asp:LinkButton ID="LinkButton4" runat="server" CommandArgument="PaymentValue" CommandName="Sort" Text="<%$ Resources:DefaultResource, ReturnAmount%>" />
                            </th>
                            <th class ="text-center">
                                <asp:LinkButton ID="StudentNameLinkButton" runat="server" CommandArgument="StudentName" CommandName="Sort" Text="<%$ Resources:DefaultResource, StudentName%>" />
                            </th>
                                       
                           
                             <th class ="text-center">
                                <asp:LinkButton ID="LinkButton5" runat="server" CommandArgument="PeriodName" CommandName="Sort" Text="<%$ Resources:DefaultResource, StudentPeriod%>" />
                            </th>
                              <th class ="text-center">
                                <asp:LinkButton ID="LinkButton6" runat="server" CommandArgument="StudyStartDate" CommandName="Sort" Text="<%$ Resources:DefaultResource, FromDate%>" />
                            </th>
                             <th class ="text-center">
                                <asp:LinkButton ID="LinkButton8" runat="server" CommandArgument="StudyEndDate" CommandName="Sort" Text="<%$ Resources:DefaultResource, ToDate%>" />
                            </th>
                              <th class ="text-center">
                                <asp:LinkButton ID="LinkButton7" runat="server" CommandArgument="InvTotalNet" CommandName="Sort" Text="<%$ Resources:DefaultResource, TotalInvoice%>" />
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
                           
                           
        <asp:ObjectDataSource ID="PaymentReciteDS" runat="server" SelectMethod="Read" TypeName="BOL.Sch_PaymentReciteBack" DeleteMethod="DML" InsertMethod="DML" UpdateMethod="DML">
            <DeleteParameters>
                <asp:Parameter Name="ActionCode" Type="String" DefaultValue="3" />
                <asp:Parameter Name="ReciteId" Type="Int64" />
                <asp:Parameter Name="ReciteCode" Type="String" />
                <asp:Parameter Name="ReciteDate" Type="String" />
                <asp:Parameter Name="StudentId" Type="Int64" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="PaymentValue" Type="Decimal" />
                <asp:Parameter Name="PaymentType" Type="Int16" />
                <asp:Parameter Name="UserId" Type="Int64" />
                <asp:Parameter Name="InvId" Type="Int64" />
                <asp:SessionParameter DefaultValue="" Name="OrgId" SessionField="OrgId" Type="Int64" />
<asp:Parameter Name="PaymentBefore" Type="Decimal"></asp:Parameter>
                <asp:Parameter Name="RecSerial" Type="Int64" />
<asp:Parameter Name="CloseFlag" Type="Boolean"></asp:Parameter>
<asp:Parameter Name="CreatedBy" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="UpdateBy" Type="Int32" />
                <asp:Parameter Name="DeletedBy" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ActionCode" Type="String" DefaultValue="1" />
                <asp:Parameter Name="ReciteId" Type="Int64" />
                <asp:Parameter Name="ReciteCode" Type="String" />
                <asp:Parameter Name="ReciteDate" Type="String" />
                <asp:Parameter Name="StudentId" Type="Int64" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="PaymentValue" Type="Decimal" />
                <asp:Parameter Name="PaymentType" Type="Int16" />
                <asp:Parameter Name="UserId" Type="Int64" />
                <asp:QueryStringParameter DefaultValue="" Name="InvId" QueryStringField="InvId" Type="Int64" />
                <asp:SessionParameter DefaultValue="" Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:Parameter Name="PaymentBefore" Type="Decimal" DefaultValue="" />
                <asp:Parameter Name="RecSerial" Type="Int64" />
                <asp:Parameter Name="CloseFlag" Type="Boolean" />
                <asp:SessionParameter Name="CreatedBy" SessionField="UserId" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="UpdateBy" SessionField="UserId" Type="Int32" />
                <asp:Parameter Name="DeletedBy" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="2" Name="ActionCode" Type="String" />
                <asp:ControlParameter ControlID="StartDateTextBox" DefaultValue="" Name="StartDate" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="EndDateTextBox" Name="EndDate" PropertyName="Text" Type="String" />
                <asp:Parameter Name="ReciteId" Type="Int64"></asp:Parameter>
                <asp:QueryStringParameter DefaultValue="" Name="InvId" QueryStringField="InvId" Type="Int64" />
                <asp:Parameter Name="InvType" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="PayementTypeId" Type="Int32"></asp:Parameter>
                <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:Parameter Name="BranchId" Type="Int64" />
                <asp:Parameter Name="UserId" Type="Int32" />
                <asp:Parameter Name="StudenId" Type="Int64" />
                <asp:ControlParameter ControlID="SearchTextBox" Name="SearchText" PropertyName="Text" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="ActionCode" Type="String" DefaultValue="2" />
                <asp:Parameter Name="ReciteId" Type="Int64" />
                <asp:Parameter Name="ReciteCode" Type="String" />
                <asp:Parameter Name="ReciteDate" Type="String" />
                <asp:Parameter Name="StudentId" Type="Int64" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="PaymentValue" Type="Decimal" />
                <asp:Parameter Name="PaymentType" Type="Int16" />
                <asp:Parameter Name="UserId" Type="Int64" />
                <asp:Parameter Name="InvId" Type="Int64" DefaultValue="" />
                <asp:SessionParameter DefaultValue="" Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:Parameter Name="PaymentBefore" Type="Decimal" />
                <asp:Parameter Name="RecSerial" Type="Int64" />
                <asp:Parameter Name="CloseFlag" Type="Boolean" />
                <asp:Parameter Name="CreatedBy" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="UpdateBy" SessionField="UserId" Type="Int32" />
                <asp:Parameter Name="DeletedBy" Type="Int32" /></UpdateParameters></asp:ObjectDataSource>

                           
        <asp:ObjectDataSource ID="InvoiceDS" runat="server" SelectMethod="Read" TypeName="BOL.Sch_Invoices">
            <SelectParameters>
                <asp:Parameter DefaultValue="2" Name="ActionCode" Type="String" />
                <asp:Parameter Name="StartDate" Type="String" DefaultValue=""></asp:Parameter>
                <asp:Parameter Name="EndDate" Type="String" />
                <asp:QueryStringParameter DefaultValue="" Name="InvId" QueryStringField="InvId" Type="Int64" />
                <asp:Parameter Name="InvType" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="PayementTypeId" Type="Int32"></asp:Parameter>
                <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:Parameter Name="BranchId" Type="Int64" />
                <asp:Parameter Name="UserId" Type="Int32" />
                <asp:Parameter Name="StudenId" Type="Int64" />
                <asp:Parameter Name="PeriodId" Type="Int64" />
                <asp:Parameter Name="SexId" Type="Int32" />
                <asp:Parameter Name="StudyStartDate" Type="String" />
                <asp:Parameter Name="StudyEndDate" Type="String" />
                <asp:Parameter Name="SearchText" Type="String" />
                <asp:Parameter Name="FinishFlag" Type="Int32" />
            </SelectParameters>
            </asp:ObjectDataSource>

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

        <br />

    <asp:TextBox ID="txtRemain" runat="server" Visible ="false"  ></asp:TextBox>

    <asp:TextBox ID="txtInvPayement" runat="server" Visible ="false"  ></asp:TextBox>

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