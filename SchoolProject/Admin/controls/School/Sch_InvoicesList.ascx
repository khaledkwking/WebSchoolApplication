<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Sch_InvoicesList.ascx.cs" Inherits="WebSchool.Admin.controls.School.Sch_InvoicesList" %>

<script src="../../../assets/js/vendor/jquery.min.js"></script>
<div class="content-header">
    <%-- <div class="header-section">
        <h1>
            <i class="gi gi-user"></i> <%= Resources.DefaultResource.Main%>
        </h1>
    </div>--%>
</div>
<ul class="breadcrumb breadcrumb-top">
    <li><a href="Main.aspx"><%= Resources.DefaultResource.Main%> </a></li>
    <li> <%= Resources.DefaultResource.SalesInvoices %> </li>
</ul>
     
   
<div class="block table-responsive">
    <!-- Table Styles Title -->
    <div class="block-title">
        <h2><strong><%= Resources.DefaultResource.List%>  </strong> <%= Resources.DefaultResource.SalesInvoices%> </h2>
        <div class="block-options pull-right">
            <asp:LinkButton ID="NewRecord" runat="server" CssClass="btn btn-sm btn-success" data-toggle="tooltip" title="<%$ Resources:DefaultResource, NewRecord%>"  data-original-title="<%$ Resources:DefaultResource, NewRecord%>" OnClick="NewRecord_Click"> <i class="fa fa-file"></i></asp:LinkButton>

            
        </div>
        <%--<button type="button" class="btn btn-sm btn-success" id="Addbtn" name="Addbtn">
            Add
         </button>--%>
    </div>
    <!-- END Table Styles Title -->
    
    <div class="gallery gallery-widget" data-toggle="lightbox-gallery" style ="min-height:600px">
               
       <!-- General Data Block -->  
        <div class="row">
             <div class=" col-md-6">
                 <asp:TextBox ID="StartDateTextBox" runat="server"  CssClass="form-control input-datepicker" placeholder="<%$ Resources:DefaultResource, FromDate%>" data-date-format="dd/mm/yyyy" autocomplete ="off"/>
            </div>
             <div class=" col-md-6">
                 <asp:TextBox ID="EndDateTextBox" runat="server"  CssClass="form-control input-datepicker" placeholder="<%$ Resources:DefaultResource, ToDate%>" data-date-format="dd/mm/yyyy" autocomplete ="off" />
            </div>
           
          </div>
            <div class="row">
                
                    <div class="col-md-3">
                        <asp:DropDownList ID="DropDownListStudent" runat="server" CssClass="form-control select-chosen" AppendDataBoundItems="True" DataSourceID="StudentsDS" DataTextField="StudentName" DataValueField="StudentId">
                        <asp:ListItem Text="<%$ Resources:DefaultResource, ChooseStudent%>"  Value=""></asp:ListItem>
                   
                    </asp:DropDownList>
                 </div>

     
            <div class="col-md-3">
                <asp:DropDownList ID="DropDownListEmp" runat="server" CssClass="form-control select-chosen" AppendDataBoundItems="True" DataSourceID="UsersDS" DataTextField="Name" DataValueField="ID"  >
                        <asp:ListItem Text="<%$ Resources:DefaultResource, ChooseEmp%>"  Value="0"></asp:ListItem>
                   
                </asp:DropDownList>

               </div>
             <div class="col-md-3">
                 <asp:DropDownList ID="DropDownListGroupType" runat="server" CssClass="form-control" data-live-search="true"
                                                AppendDataBoundItems="True"  >
                    <asp:ListItem  Value="0" text="<%$ Resources:DefaultResource, ChooseInvType%>"> 

                    </asp:ListItem><asp:ListItem Value="1" Text="<%$ Resources:DefaultResource, IndvInvoiceTitle%>">

                        </asp:ListItem><asp:ListItem Value="2" Text="<%$ Resources:DefaultResource, GroupInvoiceTitle%>">
              
              </asp:ListItem></asp:DropDownList>


                </div>
                 
                 <div class="col-md-3">
                     
                     <asp:CheckBox ID="CheckBoxFinish" runat="server" />
                      <label for="InvCodeTextBox" class="control-label">
                            <asp:Literal ID="Literal12" runat="server" Text="<%$ Resources:DefaultResource, FinishInvoices%>" />
                        </label>
                 </div>
                </div>
         
        <div class="input-group">
            <asp:TextBox ID="SearchTextBox" runat="server" CssClass="form-control" placeholder="<%$ Resources:DefaultResource, Search%>"></asp:TextBox>

            <span class="input-group-btn">
                
                <asp:LinkButton ID="ClearLinkButton" runat="server" CssClass="btn btn-sm btn-danger" OnClick="ClearLinkButton_Click"> <i class="hi hi-remove"></i><%= Resources.DefaultResource.ClearSearch%></asp:LinkButton>
                 
                <asp:LinkButton ID="SearchLinkButton" runat="server" CssClass="btn btn-sm btn-success" OnClick="SearchLinkButton_Click"> <i class="fa fa-search"></i><%= Resources.DefaultResource.SearchTitle%>&nbsp; </asp:LinkButton>
              
                    
            </span>
        </div>
       <div class="row">
             <div class="col-md-6">
                  <asp:LinkButton ID="PrintLinkButton" runat="server" CssClass="btn btn-sm btn-info" OnClick="PrintLinkButton_Click" > <i class="fa fa-Print"></i><%= Resources.DefaultResource.PrintInvList%></asp:LinkButton>
                  &nbsp; 
                 <asp:LinkButton ID="LinkButtonAddGroup" runat="server" CssClass="btn btn-sm  btn-warning" OnClick="LinkButtonAddGroup_Click" > <i class="fa fa-Print"></i><%= Resources.DefaultResource.AddGroupInvoice%></asp:LinkButton>

                 </div>
           
             </div>
     
       
        <br />
            

          <div id="ErrorDiv" runat="server"></div>
        <asp:ListView ID="lv" runat="server" DataKeyNames="InvId" DataSourceID="InvoicesDS" OnItemCommand="lv_ItemCommand" OnItemDataBound="lv_ItemDataBound" >
           
            
            <EmptyDataTemplate>
                <%--<table runat="server" style="">
                    <tr>
                        <td><%= Resources.DefaultResource.DataNotFound %></td>

                    </tr>

                </table>--%>

            </EmptyDataTemplate>
           
            <ItemTemplate>
                <tr >
                      <asp:Label ID="InvIDLabel" runat="server" Text='<%# Eval("InvId") %>' Visible="false" />
                    <td>
                        <asp:Label ID="GEIDLabel" runat="server" Text='<%# Eval("InvCode") %>' />
                    </td>
                    <td>
                        
                        <%# String.Format(new System.Globalization.CultureInfo("ar-KW"), "{0: dd/MMM/yyyy}", Eval("InvDate")) %>
                        
                    </td>
                    <td>
                        <asp:Label ID="StudentNameLabel" runat="server" Text='<%# Eval("StudentName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("StudentTel") %>' />
                    </td>
                      <td>
                        <asp:Label ID="PeriodNameLabel" runat="server" Text='<%# Eval("PeriodName") %>' />
                    </td>
                    <td>
                          <asp:Label ID="LabelStudyStartDate" runat="server" Text='<%# String.Format(new System.Globalization.CultureInfo("ar-KW"), "{0: dd/MMM/yyyy}", Eval("StudyStartDate")) %>'/>
                      <%--  <%# Eval(String.Format(new System.Globalization.CultureInfo("ar-KW"), "{0: dd/MMM/yyyy}", Eval("StudyStartDate"))) %>--%>
                    </td>
                    <td>
                         <asp:Label ID="LabelStudyEndDate" runat="server" Text='<%# String.Format(new System.Globalization.CultureInfo("ar-KW"), "{0: dd/MMM/yyyy}", Eval("StudyEndDate")) %>'/>
                       <%-- <%# Eval(String.Format(new System.Globalization.CultureInfo("ar-KW"), "{0: dd/MMM/yyyy}", Eval("StudyEndDate"))) %>--%>
                    </td>
                  
                
                   
                      <td>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("SaleManName") %>' />
                    </td>
                        <td>
                        <asp:Label ID="InvTotalNetLabel" runat="server" Text='<%# Eval("InvTotalNet") %>' />
                    </td>
                    <td>
                        <asp:Label ID="InvPaymentLabel" runat="server" Text='<%# Eval("InvPayment") %>' />
                    </td>
                    <td>
                        <asp:Label ID="InvRemainLabel" runat="server" Text='<%# Eval("InvRemain") %>' />
                    </td>
                      <td <%# Eval("InvBackSale").ToString()!="0.000" ? "style='background-color:#FF0000'" :""%> class ="text-center">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("InvBackSale") %>'  />
                    </td>
                      <td>
                         
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("InvType").ToString()=="1" ? Resources.DefaultResource.IndvInvoiceTitle:Resources.DefaultResource.GroupInvoiceTitle%>' />
                    </td>
                   <td class="text-center block-options">
                                
                         <asp:LinkButton ID="EditLinkButton" runat="server" CommandName="ViewDetails" CommandArgument='<%# Eval("InvId") %>' Text="" data-toggle="tooltip" title="<%$ Resources:DefaultResource, Edite%>" CssClass="btn btn-sm btn-default" data-original-title="<%$ Resources:DefaultResource, Edite%>">
                          
                                <i class="fa fa-pencil"></i>
                        </asp:LinkButton>
                                            
                            <asp:LinkButton ID="DeleteLinkButton" runat="server" CommandName="Delete" Text="" data-toggle="tooltip" title="<%$ Resources:DefaultResource, Delete%>" CssClass="btn btn-sm btn-danger" data-original-title="<%$ Resources:DefaultResource, Delete%>"  OnClientClick="javascript:if(!confirm('هل انت متأكد من حذف هذا السجل؟')){return false;}">
                                    <i class="fa fa-times"></i>
                            </asp:LinkButton>

                       <asp:LinkButton ID="PaymentButton" runat="server"  Text="" data-toggle="tooltip" title="<%$ Resources:DefaultResource, SchoolPayments%>" CssClass="btn btn-sm btn-danger" data-original-title="<%$ Resources:DefaultResource, SchoolPayments%>" PostBackUrl ='<%# String.Format("../../SchPaymentRecite.aspx?InvId={0}",Eval("InvId")) %>'>
                          
                           
                                    <i class="fa fa-users"></i>
                            </asp:LinkButton>
                        <asp:LinkButton ID="ReturnButton" runat="server"  Text="" data-toggle="tooltip" title="<%$ Resources:DefaultResource, SchoolInvoiceReturns%>" CssClass="btn btn-sm btn-info" data-original-title="<%$ Resources:DefaultResource, SchoolInvoiceReturns%>" PostBackUrl ='<%# String.Format("../../SchPaymentReciteBack.aspx?InvId={0}",Eval("InvId")) %>'>
                          
                           
                                    <i class="fa fa-users"></i>
                            </asp:LinkButton>
                      <%-- <asp:LinkButton ID="PaymentButton" runat="server"  Text="" data-toggle="tooltip" title="<%$ Resources:DefaultResource, SchoolPayments%>" CssClass="btn btn-sm btn-danger" data-original-title="<%$ Resources:DefaultResource, SchoolPayments%>"  OnClientClick="SchPaymentRecite.aspx?InvId=<%# Eval("InvId")%>">
                                    <i class="fa fa-times"></i>
                            </asp:LinkButton>--%>

                         <%--<a  runat="server"  id="PaymentButton" data-toggle="tooltip" title="<%= Resources.DefaultResource.SchoolPayments%>"   class="btn btn-sm btn-warning" data-original-title="<%= Resources.DefaultResource.SchoolPayments%>" href="SchPaymentRecite.aspx?InvId=<%# Eval("InvId")%>">
                            <i class="fa fa-users"></i>
                        </a>
                         <a runat="server" id="ReturnButton" data-toggle="tooltip" title="<%= Resources.DefaultResource.SchoolInvoiceReturns%>"   class="btn btn-sm btn-info" data-original-title="<%= Resources.DefaultResource.SchoolInvoiceReturns%>" href='SchPaymentReciteBack.aspx?InvId=<%# Eval("InvId")%>'>
                            <i class="fa fa-eye"></i>
                        </a>  --%>
                     

                           <a data-toggle="tooltip" title="<%= Resources.DefaultResource.Print%>"  class="btn btn-sm btn-warning"  data-original-title="<%= Resources.DefaultResource.Print%>" href='<%# String.Format("../../admin/SchoolShowRpt.aspx?Id=1&InvId={0}&InvType={1}", Eval("InvId"),Eval("InvType")) %>' Target="_blank" >
                                <i class="fa fa-print"></i>
                            </a>
                    </td>
                     
                              
                </tr>

            </ItemTemplate>
        <LayoutTemplate>
                
                <table id="general-table" class="table table-striped table-vcenter table-bordered table-condensed">
                    <thead >
                        <tr class="active">
                            <th class ="text-center">
                                <asp:LinkButton ID="InvIdLinkButton" runat="server" CommandArgument="InvId" CommandName="Sort" Text="<%$ Resources:DefaultResource, InvoiceCode%>" />
                            </th>
                            <th class ="text-center">
                                <asp:LinkButton ID="InvDateLinkButton" runat="server" CommandArgument="InvDate" CommandName="Sort" Text="<%$ Resources:DefaultResource, InvoiceDate%>" />
                            </th>
                              <th class ="text-center">
                                <asp:LinkButton ID="StudentNameLinkButton" runat="server" CommandArgument="StudentName" CommandName="Sort" Text="<%$ Resources:DefaultResource, StudentName%>" />
                            </th>   
                             <th class ="text-center">
                                <asp:LinkButton ID="StudentTelLinkButton" runat="server" CommandArgument="StudentTel" CommandName="Sort" Text="<%$ Resources:DefaultResource, StudentTel%>" />
                            </th>
                              <th class ="text-center">
                                <asp:LinkButton ID="PeriodNameLinkButton" runat="server" CommandArgument="PeriodName" CommandName="Sort" Text="<%$ Resources:DefaultResource, StudentPeriod%>" />
                            </th>      
                             <th class ="text-center">
                                <asp:LinkButton ID="StudyStartDateLinkButton" runat="server" CommandArgument="StudyStartDate" CommandName="Sort" Text="<%$ Resources:DefaultResource, FromDateTitle%>" />
                            </th>        
                       <th class ="text-center">
                                <asp:LinkButton ID="StudyEndDateLinkButton" runat="server" CommandArgument="StudyEndDate" CommandName="Sort" Text="<%$ Resources:DefaultResource, ToDateTitle%>" />
                            </th>      
                              
                             
                            <th class ="text-center">
                                <asp:LinkButton ID="LinkButtonSaleManName" runat="server" CommandArgument="SaleManName" CommandName="Sort" Text="<%$ Resources:DefaultResource, SalesMan%>" />
                            </th>    

                            <th class ="text-center">
                                <asp:LinkButton ID="InvTotalNetLinkButton" runat="server" CommandArgument="InvTotalNet" CommandName="Sort" Text="<%$ Resources:DefaultResource, ValueTitle%>" />
                            </th>    
                             <th class ="text-center">
                                <asp:LinkButton ID="InvPaymentLinkButton" runat="server" CommandArgument="InvPayment" CommandName="Sort" Text="<%$ Resources:DefaultResource, Payment%>" />
                            </th>    
                              <th class ="text-center">
                                <asp:LinkButton ID="InvRemainLinkButton" runat="server" CommandArgument="InvRemain" CommandName="Sort" Text="<%$ Resources:DefaultResource, Remain%>" />
                            </th>    
                            <th class ="text-center">
                                <asp:LinkButton ID="InvBackSaleTitleLinkButton" runat="server" CommandArgument="InvBackSale" CommandName="Sort" Text="<%$ Resources:DefaultResource, InvBackSaleTitle%>" />
                            </th>    
                             <th class ="text-center">
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument="InvBackSale" CommandName="Sort" Text="<%$ Resources:DefaultResource, InvoiceType%>" />
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
                            <td colspan="13">
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
          <div class="col-md-12 col-xs-12 col-12">
                            <!-- Basic Form Elements Block -->
            <div class="block">
                               
                <!-- Basic Form Elements Content -->
                <div class="form-horizontal form-bordered">
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="<%$ Resources:DefaultResource, StudentPeriod%>" Visible="false"/>                                            
                        <div class="form-group">
                        <label for="InvCodeTextBox" class="col-md-2 control-label">
                            <asp:Literal ID="Literal9" runat="server" Text="<%$ Resources:DefaultResource, Total%>" />
                        </label>
                        <div class="col-sm-2 col-xs-2 col-2">
                     
                            <asp:Label ID="lblTotal" runat="server" Text="Label" CssClass="col-md-2 control-label" ForeColor="Red"></asp:Label>
                                            
                        </div>
                             <label for="InvCodeTextBox" class="col-md-2 control-label">
                            <asp:Literal ID="Literal10" runat="server" Text="<%$ Resources:DefaultResource, Payment%>" />
                        </label>
                        <div class="col-sm-2 col-xs-2 col-2">
                     
                            <asp:Label ID="lblPayment" runat="server" Text="Label" CssClass="col-md-2 control-label" ForeColor="Red"></asp:Label>
                                            
                        </div>
                             <label for="InvCodeTextBox" class="col-md-2 control-label">
                            <asp:Literal ID="Literal11" runat="server" Text="<%$ Resources:DefaultResource, Remain%>" />
                        </label>
                        <div class="col-sm-2 col-xs-2 col-2">
                     
                            <asp:Label ID="lblRemain" runat="server" Text="Label" CssClass="col-md-2 control-label" ForeColor="Red"></asp:Label>
                                            
                        </div>
                     </div>
                    </div>
            </div>
        </div>
        </div>

        
        <div class="modal fade" id="myModal" tabindex="-1"  aria-labelledby="myLargeModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog modal-dialog-centered" style="max-width: 100%;" role="document"
                                <%--role="dialog"--%>  >
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button id="CloseBtn" name="CloseBtn" type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                            <span class="fa fa-close"></span>
                                        </button>
                                        <h4 class="modal-title" id="basicModalLabel">
                                           
                                        </h4>
                                    </div>
      <div id="ErrorDetDiv" class="col-12" runat="server"></div>
 <div class="modal-body table-responsive" id ="myBodaydiv">
  
                            <!-- Basic Form Elements Block -->
             <div class="block table-responsive">
                <!-- Table Styles Title -->
            <div class="block-title">
                <h2><strong><%--  <%# Eval(String.Format(new System.Globalization.CultureInfo("ar-KW"), "{0: dd/MMM/yyyy}", Eval("StudyStartDate"))) %>--%> 
                    </strong>  </h2>
       
            </div>      
           <div class="gallery gallery-widget" data-toggle="lightbox-gallery">
 
                 <div class="col-md-12 col-xs-12 col-12">
                            <!-- Basic Form Elements Block -->
                            <div class="block">
                                <!-- Basic Form Elements Title -->
                                <%-- <%# Eval(String.Format(new System.Globalization.CultureInfo("ar-KW"), "{0: dd/MMM/yyyy}", Eval("StudyEndDate"))) %>--%>
                                <!-- END Form Elements Title -->
                                <!-- Basic Form Elements Content -->
                                <div class="form-horizontal form-bordered">
                                         <asp:TextBox ID="PeriodIdTextBox" runat="server" CssClass="form-control" placeholder="<%$ Resources:DefaultResource, StudentPeriod%>" Visible="false"/>                                            
                                     <div class="form-group">
                                        <label for="InvCodeTextBox" class="col-md-1 control-label">
                                            <asp:Literal ID="TitleArLiteral1" runat="server" Text="<%$ Resources:DefaultResource, Code%>" />
                                        </label>
                                        <div class="col-sm-2 col-xs-2 col-2">
                                            <asp:TextBox ID="InvCodeTextBox" runat="server" CssClass="form-control" placeholder="<%$ Resources:DefaultResource, Code%>" />
                                            
                                        </div>
                                          <label class="col-md-1 control-label">
                                               <asp:Literal ID="Literal8" runat="server" Text="<%$ Resources:DefaultResource, Date%>" />

                                           </label>
                                          <div class="col-sm-2 col-xs-2 col-2">
                                                 <asp:TextBox ID="InvDateTextBox" runat="server"  CssClass="form-control  input-datepicker" placeholder="<%$ Resources:DefaultResource, Date%>"  data-date-format="dd/mm/yyyy" AutoComplete="Off" />
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidatorDate" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="InvDateTextBox" ValidationGroup="DML" CssClass="label label-warning"> </asp:RequiredFieldValidator>
                                              </div> 

                                               <label for="" class="col-md-1 control-label">
                                         
                                             <asp:Literal ID="lblPaymentType" runat="server" Text="<%$ Resources:DefaultResource, PaymentType%>" />
                                          </label>
                                       <div class="col-sm-2 col-xs-2 col-2">

                                            <asp:DropDownList ID="DropDownListPaymentType" runat="server" CssClass="form-control" data-live-search="true"
                                                AppendDataBoundItems="True"  >
                                                <asp:ListItem  Value="1" text="<%$ Resources:DefaultResource, Cash%>"> 

                                                </asp:ListItem><asp:ListItem Value="2" Text="<%$ Resources:DefaultResource, Cheque%>">

                                                  </asp:ListItem><asp:ListItem Value="3" Text="<%$ Resources:DefaultResource, KeyNet%>">

                                                  </asp:ListItem><asp:ListItem Value="4" Text="<%$ Resources:DefaultResource, LinkPayement%>">

                                                   </asp:ListItem></asp:DropDownList>

                                       </div>
                                         <label for="" class="col-md-1 control-label">
                                         
                                             <asp:Literal ID="Literal13" runat="server" Text="<%$ Resources:DefaultResource, SendNotifaction%>" />
                                          </label>
                                       <div class="col-sm-2 col-xs-2 col-2">
                                            <label class="switch switch-success">
                               
                                                <asp:CheckBox ID="NotifcationCheckBox" runat="server"  /><span></span>
                                            </label>
                                           </div>

                                    </div>
                                           

                                         <div class="form-group">
                                              <label for="StudentsDropDownList" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:DefaultResource, StudentName%>" />
                                        </label>
                                             <div class="col-sm-4 col-xs-4 col-4">
                                                 <asp:DropDownList ID="StudentsDropDownList" runat="server" CssClass="form-control select-chosen" AppendDataBoundItems="True" DataSourceID="StudentsDS" DataTextField="StudentName" DataValueField="StudentId" AutoPostBack="True" OnSelectedIndexChanged="StudentsDropDownList_SelectedIndexChanged">
                                                    <asp:ListItem Text="<%$ Resources:DefaultResource, Choose%>"  Value=""></asp:ListItem>
                   
                                                </asp:DropDownList>
                                           </div>
                                             <label for="TitleArTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:DefaultResource, StudentPeriod%>" />
                                        </label>
                                             <div class="col-sm-4 col-xs-4 col-4">
                                                 <asp:TextBox ID="PeriodNameTextBox" runat="server" ReadOnly ="true" CssClass="form-control" placeholder="<%$ Resources:DefaultResource, StudentPeriod%>"  />
                                                 
                                           </div>
                                              
                                         </div>
                                          <div class="form-group">
                                               <label class="col-md-2 control-label">
                                               <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:DefaultResource, FromDate%>" />

                                           </label>
                                          <div class="col-sm-4 col-xs-4 col-4">
                                                 <asp:TextBox ID="FromDateTextBox" runat="server"  CssClass="form-control  input-datepicker" placeholder="<%$ Resources:DefaultResource, FromDate%>"  data-date-format="dd/mm/yyyy" AutoComplete="Off" />
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidatorFromDate" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="FromDateTextBox" ValidationGroup="DML" CssClass="label label-warning"> </asp:RequiredFieldValidator>
                                              </div> 

                                               <label class="col-md-2 control-label">
                                               <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:DefaultResource, ToDate%>" />

                                           </label>
                                          <div class="col-sm-4 col-xs-4 col-4">
                                                 <asp:TextBox ID="ToDateTextBox" runat="server"  CssClass="form-control  input-datepicker" placeholder="<%$ Resources:DefaultResource, ToDate%>"  data-date-format="dd/mm/yyyy" AutoComplete="Off" />
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidatorToDate" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="ToDateTextBox" ValidationGroup="DML" CssClass="label label-warning"> </asp:RequiredFieldValidator>
                                              </div>

                                          </div>
                                      <div class="form-group">
                                        <label for="TextBoxNotes" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:DefaultResource, Notes%>" />
                                        </label>
                                        <div class="col-sm-3 col-xs-3 col-3">
                                            <asp:TextBox ID="TextBoxNotes" runat="server" CssClass="form-control" placeholder="<%$ Resources:DefaultResource, Notes%>" TextMode="MultiLine" />
                                        </div>
                                     
                                          <label for="txtdiscount" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:DefaultResource, Discount%>" />
                                        </label>
                                             <div class="col-sm-2 col-xs-2 col-2">
                                                 <asp:TextBox ID="txtdiscount" runat="server"  CssClass="form-control" placeholder="<%$ Resources:DefaultResource, Discount%>" 
                                                     onKeyUp="calculateDiscount(); return false;"   TextMode="Number"/>
                                                 
                                           </div>
                                          <label for="TextBoxNotes" class="col-md-1 control-label">
                                            <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:DefaultResource, SalesMan%>" />
                                        </label>
                                        <div class="col-sm-2 col-xs-2 col-2">
                                            <asp:DropDownList ID="DropDownListUser" runat="server" CssClass="form-control select-chosen" AppendDataBoundItems="True" DataSourceID="UsersDS" DataTextField="Name" DataValueField="ID"  >
                                                    <asp:ListItem Text="<%$ Resources:DefaultResource, Choose%>"  Value="0"></asp:ListItem>
                   
                                            </asp:DropDownList>
                                          
                                        </div>
                                       </div>
                                     <div class="form-group">
                                    
                                        </div>                  

                                      <div class="form-group form-actions">
                                        <div class="col-md-12 col-md-offset-3">
                                         <asp:Button ID="InsertButton" runat="server"  Text="<%$ Resources:DefaultResource, Save%>" CssClass="btn btn-sm btn-success" ValidationGroup="DML"  OnClick="SaveDataBtn_Click" />
                                         <asp:Button ID="CancelButton" runat="server"  Text="<%$ Resources:DefaultResource, Cancel%>" CssClass="btn btn-sm btn-warning "   data-bs-toggle="modal" />
                                                                    
                                         <asp:LinkButton ID="LinkButtonprint" runat="server" CommandName="Print"  data-bs-toggle="kt-tooltip" Text ="<%$ Resources:DefaultResource, Print%>" title="<%$ Resources:DefaultResource, Print%>"
                                CssClass="btn btn-sm btn-primary" CommandArgument='<%# Eval("qidid") %>' data-original-title="<%$ Resources:DefaultResource, Print%>" PostBackUrl='<%# String.Format("../../Admin/QidShowRpt.aspx?Id={0}&QidId={1}",Eval("recitetype"),Eval("qidid")) %>' > <i class="fa fa-print"></i></asp:LinkButton>
                                       

                                     </div>
                                      </div>
                                    </div>
                                
                                  
           <br/>
                 <br />        
                                    
      
             <div class="block table-responsive"  style="min-height:300px" id ="tt"> 
                  
                <!-- Table Styles Title -->
            <div class="block-title">
                <h2><strong><%= Resources.DefaultResource.SalesInvoice%> 
                    </strong>  </h2>
                 <div class="block-options pull-right">
               
                     <asp:LinkButton ID="AddLinkButton" runat="server" CommandName="AddNew"  data-bs-toggle="kt-tooltip" ValidationGroup="DML" 
                            title="<%$ Resources:DefaultResource, AddNewDetails%>" CssClass="btn btn-sm btn-primary" OnClick="AddQidDetLinkButton_Click"
                            data-original-title="<%$ Resources:DefaultResource, AddNewDetails%>"> <i class="fa fa-plus"></i></asp:LinkButton>
                 </div>
       
            </div>  

            <div id="DivMsg" runat="server" visible="false"></div>
                
         <asp:ListView ID="ListViewInvDet" runat="server" DataKeyNames="InvDetId" OnItemCommand="ListViewQid_ItemCommand" OnItemDataBound="ListViewQid_ItemDataBound" AutoGenerateColumns="false" OnDataBound="ListViewQid_DataBound" ClientIDMode="Predictable" 
        ClientIDRowSuffix="InvDetId">
             <%--  <EmptyDataTemplate>  </EmptyDataTemplate>--%>
                <ItemTemplate>
                      <tr style="">
                           <asp:RangeValidator ID="SubjectRangeValidator" runat="server" ValidationGroup="DML" CssClass="label label-warning"
                                                 ControlToValidate="ddlSubjectId"
                                                ErrorMessage="<%$ Resources:DefaultResource, HourRangeValidate%>" MinimumValue="1" Type="Double" MaximumValue="999999999999999999"></asp:RangeValidator>
                          <asp:RangeValidator ID="HourPriceRangeValidator" runat="server" ValidationGroup="DML" CssClass="label label-warning"
                                                 ControlToValidate="txtHourPrice"
                                                ErrorMessage="<%$ Resources:DefaultResource, HourRangeValidate%>" MinimumValue="1" MaximumValue="2000" Type="Double"></asp:RangeValidator>
                          <asp:RangeValidator ID="ourNumRangeValidator" runat="server" ValidationGroup="DML" CssClass="label label-warning"
                                                 ControlToValidate="txtHourNumPerMonth"
                                                ErrorMessage="<%$ Resources:DefaultResource, HourRangeValidate%>" MinimumValue="1" MaximumValue="2000" Type="Double"></asp:RangeValidator>
               <asp:TextBox ID="txtInvId" CssClass="form-control" runat="server" Text='<%# Eval("InvId") %>' Visible="false" />
                <asp:TextBox ID="txtInvDetId" CssClass="form-control" runat="server" Text='<%# Eval("InvDetId") %>' Visible="false" />
                 <asp:TextBox ID="txtInvType" CssClass="form-control" runat="server" Text='<%# Eval("InvType") %>' Visible="false" />

                     <td>
                         <asp:DropDownList ID="ddlSubjectId" runat="server" DataSourceID="SubjectsDS" AppendDataBoundItems="true" CssClass="select-chosen" DataTextField="SubName"
                             DataValueField="SubId" Text='<%# Bind("SubjectId") %>' >     
                        <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0"></asp:ListItem>

                        </asp:DropDownList>
                        
                    </td>
                  <td >
                     <asp:TextBox ID="txtHourNumPerMonth" runat="server" CssClass="form-control" Text='<%# Bind("HourNumPerMonth","{0:N3}") %>'   onchange=<%# "javascript:"+string.Format("ShowProductName('{0}');",Eval("InvDetId")) %> />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                ControlToValidate="txtHourNumPerMonth" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                            </asp:RequiredFieldValidator>
                    </td>
                   <td>
                     <asp:TextBox ID="txtHourPrice" CssClass="form-control" runat="server" Text='<%# Eval("HourPrice","{0:N3}") %>'  onchange=<%# "javascript:"+string.Format("ShowProductName('{0}');", Eval("InvDetId")) %> />  
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                ControlToValidate="txtHourPrice" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                            </asp:RequiredFieldValidator>
                   </td>          
                    <td>
                     <asp:TextBox ID="txtMonthNum" CssClass="form-control" runat="server" Text='<%# Eval("MonthNum","{0:N3}") %>'  />  
                   </td> 
                     <td>
                     <asp:TextBox ID="txtTotalPrice" CssClass="form-control" runat="server" Text='<%# Eval("TotalPrice","{0:N3}") %>'  />  
                   </td>  
                          
                 <td class="text-center">
                      <div class="form-group form-actions">
                                        <div class="col-md-12 col-md-offset-3">
                                      
                                            
                          <asp:LinkButton ID="DeleteLinkButton" runat="server" CommandName="ItemDelete"  data-bs-toggle="kt-tooltip"
                            title="<%$ Resources:DefaultResource, Delete%>" CssClass="btn btn-sm btn-danger" data-original-title="<%$ Resources:DefaultResource, Delete%>"
                            OnClientClick="javascript:if(!confirm('This action will delete the record and all related Records!')){return false;}">
                                <i class="fa fa-times"></i>
                        </asp:LinkButton> 
                       
                                        </div>
                                    </div>
                           
                            </td>

                      </tr>

                </ItemTemplate>
             
             <LayoutTemplate>
                <table id="general-table" class="table table-bordered table-striped table-vcenter dataTable">
                    <thead >
                        <tr class="active">
                                                    
                            <th id="ThSubjectName" class ="text-center" style="width: 30%" runat="server" > 
                              
                                <asp:LinkButton ID="SubjectNameLinkButton" runat="server" CommandArgument="SubName" CommandName="Sort" Text="<%$ Resources:DefaultResource, SubjectName %>" /></th>
                          <%--  قبض  --%>
                            <th style="width: 10%" runat="server"  id="ThTovalue" class ="text-center">
                                <asp:LinkButton ID="HourNumPerMonthLinkButton" runat="server" CommandArgument="HourNumPerMonth" CommandName="Sort" Text="<%$ Resources:DefaultResource, SubjectHours %>" /></th>
                            <th style="width: 10%">
                                <asp:LinkButton ID="SubjectHourPriceButton" runat="server" CommandArgument="HourPrice" CommandName="Sort" Text="<%$ Resources:DefaultResource, SubjectHourPrice %>" /></th>
                             <th style="width: 10%" class ="text-center">
                                <asp:LinkButton ID="SubjectMonthsLinkButton" runat="server" CommandArgument="MonthNum" CommandName="Sort" Text="<%$ Resources:DefaultResource, SubjectMonths %>" /></th>
                            
                               <th style="width: 10%" class ="text-center">
                                <asp:LinkButton ID="SubjectTotalPriceLinkButton" runat="server" CommandArgument="TotalPrice" CommandName="Sort" Text="<%$ Resources:DefaultResource, SubjectTotalPrice %>" /></th>

                        <th style="width: 12%" class ="text-center">
                                <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, Actions %>" /></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr style="">
                           
                          <tr id="itemPlaceholder" runat="server"></tr>
                         
                   
                    </tbody>
                     <tfoot>
                      
                     </tfoot>

                </table></LayoutTemplate>

         </asp:ListView>

                <table class="table table-vcenter">
                    <thead>
                        <tr class="active">
                            <th class="text-right"> 
                              <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, Total%>" />
                            </th>
                            <th >

                                 <asp:TextBox ID="txtInvTotal" CssClass="form-control font-weight-bold " ReadOnly ="true" runat="server" BackColor="White" Font-Bold="True" ForeColor="Red" Font-Size="12" />  

                            </th>
                         <th class="text-right"> 
                              <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, TotalNet%>" />
                            </th>
                            <th >

                                 <asp:TextBox ID="txtInvNetTotal" CssClass="form-control font-weight-bold " runat="server" BackColor="White" Font-Bold="True" ForeColor="Red" Font-Size="12"  />  

                            </th>
                            <th></th>
                        </tr>

                    </thead>
                </table>
                            <!-- payment Dates -->
         

             <div class="block table-responsive">
                <!-- Table Styles Title -->
            <div class="block-title">
                <h2><strong> <%= Resources.DefaultResource.InvoiceDebits%> <%--  <%# Eval(String.Format(new System.Globalization.CultureInfo("ar-KW"), "{0: dd/MMM/yyyy}", Eval("StudyStartDate"))) %>--%> 
                    </strong>  </h2>
                 <div class="block-options pull-right">
                 <asp:LinkButton ID="AddDateLinkButton" runat="server" data-bs-toggle="kt-tooltip" ValidationGroup="DML" 
                            title="<%$ Resources:DefaultResource, AddNewDetails%>" CssClass="btn btn-sm btn-primary" OnClick="AddDateLinkButton_Click"
                            data-original-title="<%$ Resources:DefaultResource, AddNewDetails%>"> <i class="fa fa-plus"></i></asp:LinkButton>
                 </div>
       
            </div>              
            <asp:ListView ID="ListViewDates" runat="server" DataKeyNames="PayId" OnItemCommand="ListViewDates_ItemCommand" OnItemDataBound="ListViewDates_ItemDataBound" AutoGenerateColumns="false"  >
             <%--  <EmptyDataTemplate>  </EmptyDataTemplate>--%>
                <ItemTemplate>
                      <tr style="">
                          <asp:RangeValidator ID="RangeValidator1" runat="server" ValidationGroup="DML" CssClass="label label-warning"
                                                 ControlToValidate="txtAmount"
                                                ErrorMessage="<%$ Resources:DefaultResource, HourRangeValidate%>" MinimumValue="1" MaximumValue="2000" Type="Double"></asp:RangeValidator>
                <asp:TextBox ID="txtInvId" CssClass="form-control" runat="server" Teyxt='<%# Eval("InvId") %>' Visible="false" />
                <asp:TextBox ID="txtPayId" CssClass="form-control" runat="server" Text='<%# Eval("PayId") %>' Visible="false" />
                            <asp:TextBox ID="txtInvType" CssClass="form-control" runat="server" Text='<%# Eval("InvType") %>' Visible="false" />
                   <td>
                     <asp:TextBox ID="txtAmount" CssClass="form-control" runat="server" Text='<%# Eval("Amount","{0:N3}") %>' />  
                         <asp:RequiredFieldValidator ID="RequiredFieldValidatorAmount" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                          ControlToValidate="txtAmount" ValidationGroup="DML" CssClass="label label-warning"> </asp:RequiredFieldValidator>
                   </td>          
                    <td>
                        <asp:TextBox ID="PayDateTextBox" runat="server"  CssClass="form-control  input-datepicker" Text='<%# Eval("PayDate","{0: dd/MM/yyyy}") %>' placeholder="<%$ Resources:DefaultResource, Date%>"  data-date-format="dd/mm/yyyy" AutoComplete="Off" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDate" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                        ControlToValidate="PayDateTextBox" ValidationGroup="DML" CssClass="label label-warning"> </asp:RequiredFieldValidator>

                   </td> 
                         
                 <td class="text-center">
                      <div class="form-group form-actions">
                                        <div class="col-md-12 col-md-offset-3">
                                      
                            
                          <asp:LinkButton ID="DeleteDateLinkButton" runat="server" CommandName="ItemDelete"  data-bs-toggle="kt-tooltip"
                            title="<%$ Resources:DefaultResource, Delete%>" CssClass="btn btn-sm btn-danger" data-original-title="<%$ Resources:DefaultResource, Delete%>"
                            OnClientClick="javascript:if(!confirm('This action will delete the record and all related Records!')){return false;}">
                                <i class="fa fa-times"></i>
                        </asp:LinkButton> 
                       
                                        </div>
                                    </div>
                           
                            </td>

                      </tr>

                </ItemTemplate>
             
             <LayoutTemplate>
                <table id="general-table" class="table table-bordered table-striped table-vcenter dataTable">
                    <thead >
                        <tr class="active">
                                                    
                            <th id="ThSubjectName" class ="text-center" style="width: 30%" runat="server" > 
                              
                                <asp:LinkButton ID="AmountLinkButton" runat="server" CommandArgument="Amount" CommandName="Sort" Text="<%$ Resources:DefaultResource, Amount %>" /></th>
                         
                            <th style="width: 10%" runat="server"  id="Datevalue" class ="text-center">
                                <asp:LinkButton ID="PayDateLinkButton" runat="server" CommandArgument="PayDate" CommandName="Sort" Text="<%$ Resources:DefaultResource, PaymentLateDate %>" /></th>
                            
                        <th style="width: 12%" class ="text-center">
                                <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, Actions %>" /></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr style="">
                          <tr id="itemPlaceholder" runat="server"></tr>
                    </tbody>
                     <tfoot>
                      
                     </tfoot>

                </table></LayoutTemplate>

         </asp:ListView>    
                 <table class="table table-vcenter">
                    <thead>
                        <tr class="active">
                            <th class="text-right">
                               
                    <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, TotalDebet%>" />
                
                            </th>
                            <th >
                                

                                 <asp:TextBox ID="txtTotalDebet" CssClass="form-control font-weight-bold " runat="server" readonly="true" BackColor="White" Font-Bold="True" ForeColor="Red" Font-Size="12" />  
                                   
 
                            </th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                </table>
          </div> 
                </div>             
                            
                  

  </div>       
                   
               </div>
             
 </div>       
     
                 </div>
     
           </div> 
                                </div> 
            </div> 



       </div>
 
      
       
   
                            <asp:ObjectDataSource ID="InvoicesDS" runat="server"  SelectMethod="Read" TypeName="BOL.Sch_Invoices" DeleteMethod="DML" InsertMethod="DML" UpdateMethod="DML"><DeleteParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="3" /><asp:Parameter Name="InvId" Type="Int64" /><asp:Parameter Name="InvCode" Type="String" /><asp:Parameter Name="InvDate" Type="String" /><asp:Parameter Name="StudentId" Type="Int64" /><asp:Parameter Name="GroupId" Type="Int64" /><asp:Parameter Name="PaymentType" Type="Int16" /><asp:Parameter Name="PaymentAccid" Type="Int64" />
    <asp:Parameter Name="InvType" Type="Int16" />
    <asp:Parameter Name="PaymentValue" Type="Decimal" />
    <asp:Parameter Name="PaymentDate" Type="String" /><asp:Parameter Name="Notes" Type="String" />
    <asp:Parameter Name="invTotal" Type="Decimal" />
    <asp:Parameter Name="InvTotalNet" Type="Decimal" />
    <asp:Parameter Name="InvPayment" Type="Decimal" />
    <asp:Parameter Name="InvRemain" Type="Decimal" />
    <asp:Parameter Name="PayFinish" Type="Boolean" /><asp:Parameter Name="CostId" Type="Int64" /><asp:Parameter Name="StudyStartDate" Type="String" /><asp:Parameter Name="StudyEndDate" Type="String" />
    <asp:Parameter Name="MonthSubPrice" Type="Decimal" />
    <asp:Parameter Name="BusFlag" Type="Boolean" />
    <asp:Parameter Name="BusId" Type="Int64" />
    <asp:Parameter Name="BusStartDate" Type="String" />
    <asp:Parameter Name="BusEndDate" Type="String" />
    <asp:Parameter Name="BusPrice" Type="Decimal" />
    <asp:Parameter Name="BusMonthNum" Type="Int32" />
    <asp:Parameter Name="BusTotalPrice" Type="Decimal" />
    <asp:Parameter Name="UserId" Type="Int64" />
    <asp:Parameter Name="BusNotes" Type="String" />
    <asp:Parameter Name="PervInfoNotes" Type="String" />
    <asp:Parameter Name="InvSerial" Type="Int64" />
    <asp:Parameter Name="CourseFlag" Type="Boolean" />
    <asp:Parameter Name="InvBackSale" Type="Decimal" />
    <asp:Parameter Name="OldVaule" Type="Decimal" />
    <asp:Parameter Name="CancelFlag" Type="Boolean" />
    <asp:Parameter Name="StopFlag" Type="Boolean" />
    <asp:Parameter Name="MonthFlag" Type="Boolean" />
    <asp:Parameter Name="DayFlag" Type="Boolean" />
    <asp:Parameter Name="OrgId" Type="Int64" /><asp:Parameter Name="BranchId" Type="Int64" /><asp:Parameter Name="CreatedBy" Type="Int32" /><asp:SessionParameter Name="UpdateBy" SessionField="UserId" Type="Int32" /><asp:SessionParameter DefaultValue="" Name="DeletedBy" SessionField="UserId" Type="Int32" />
                                <asp:Parameter Direction="InputOutput" Name="InsertedId" Type="Object" />
                                </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ActionCode" Type="String" /><asp:Parameter Name="InvId" Type="Int64" /><asp:Parameter Name="InvCode" Type="String" /><asp:Parameter Name="InvDate" Type="String" /><asp:Parameter Name="StudentId" Type="Int64" /><asp:Parameter Name="GroupId" Type="Int64" /><asp:Parameter Name="PaymentType" Type="Int16" /><asp:Parameter Name="PaymentAccid" Type="Int64" />
                <asp:Parameter Name="InvType" Type="Int16" />
                <asp:Parameter Name="PaymentValue" Type="Decimal" />
                <asp:Parameter Name="PaymentDate" Type="String" /><asp:Parameter Name="Notes" Type="String" />
                <asp:Parameter Name="invTotal" Type="Decimal" />
                <asp:Parameter Name="InvTotalNet" Type="Decimal" />
                <asp:Parameter Name="InvPayment" Type="Decimal" />
                <asp:Parameter Name="InvRemain" Type="Decimal" />
                <asp:Parameter Name="PayFinish" Type="Boolean" /><asp:Parameter Name="CostId" Type="Int64" /><asp:Parameter Name="StudyStartDate" Type="String" /><asp:Parameter Name="StudyEndDate" Type="String" />
                <asp:Parameter Name="MonthSubPrice" Type="Decimal" />
                <asp:Parameter Name="BusFlag" Type="Boolean" />
                <asp:Parameter Name="BusId" Type="Int64" />
                <asp:Parameter Name="BusStartDate" Type="String" />
                <asp:Parameter Name="BusEndDate" Type="String" />
                <asp:Parameter Name="BusPrice" Type="Decimal" />
                <asp:Parameter Name="BusMonthNum" Type="Int32" />
                <asp:Parameter Name="BusTotalPrice" Type="Decimal" />
                <asp:Parameter Name="UserId" Type="Int64" />
                <asp:Parameter Name="BusNotes" Type="String" />
                <asp:Parameter Name="PervInfoNotes" Type="String" />
                <asp:Parameter Name="InvSerial" Type="Int64" />
                <asp:Parameter Name="CourseFlag" Type="Boolean" />
                <asp:Parameter Name="InvBackSale" Type="Decimal" />
                <asp:Parameter Name="OldVaule" Type="Decimal" />
                <asp:Parameter Name="CancelFlag" Type="Boolean" />
                <asp:Parameter Name="StopFlag" Type="Boolean" />
                <asp:Parameter Name="MonthFlag" Type="Boolean" />
                <asp:Parameter Name="DayFlag" Type="Boolean" />
                <asp:SessionParameter Name="OrgId" SessionField="UserId" Type="Int64" />
                <asp:Parameter Name="BranchId" Type="Int64" />
                <asp:SessionParameter Name="CreatedBy" SessionField="UserId" Type="Int32" />
                <asp:SessionParameter Name="UpdateBy" SessionField="UserId" Type="Int32" />
                <asp:Parameter Name="DeletedBy" Type="Int32" />
                <asp:Parameter Direction="InputOutput" Name="InsertedId" Type="Object" />
                                </InsertParameters>
            <SelectParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="2" /><asp:ControlParameter ControlID="StartDateTextBox" Name="StartDate" PropertyName="Text" Type="String" /><asp:ControlParameter ControlID="EndDateTextBox" Name="EndDate" PropertyName="Text" Type="String" />
                <asp:Parameter DefaultValue="" Name="InvId" Type="Int64" />
                <asp:ControlParameter ControlID="DropDownListGroupType" DefaultValue="" Name="InvType" PropertyName="SelectedValue" Type="Int32" />
                <asp:Parameter Name="PayementTypeId" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:Parameter Name="BRANCHId" Type="Int64" />
                <asp:ControlParameter ControlID="DropDownListEmp" DefaultValue="" Name="UserId" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="DropDownListStudent" DefaultValue="" Name="StudenId" PropertyName="SelectedValue" Type="Int64" />
                <asp:Parameter Name="PeriodId" Type="Int64" />
                <asp:Parameter Name="SexId" Type="Int32" />
                <asp:Parameter Name="StudyStartDate" Type="String" />
                <asp:Parameter Name="StudyEndDate" Type="String" />
                <asp:ControlParameter ControlID="SearchTextBox" DefaultValue="" Name="SearchText" PropertyName="Text" Type="String" />
                <asp:Parameter Name="FinishFlag" Type="Int32" />
                                </SelectParameters><UpdateParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="2" /><asp:Parameter Name="InvId" Type="Int64" DefaultValue="" /><asp:Parameter Name="InvCode" Type="String" /><asp:Parameter Name="InvDate" Type="String" /><asp:Parameter Name="StudentId" Type="Int64" /><asp:Parameter Name="GroupId" Type="Int64" /><asp:Parameter Name="PaymentType" Type="Int16" /><asp:Parameter Name="PaymentAccid" Type="Int64" />
        <asp:Parameter Name="InvType" Type="Int16" />
        <asp:Parameter Name="PaymentValue" Type="Decimal" />
        <asp:Parameter Name="PaymentDate" Type="String" /><asp:Parameter Name="Notes" Type="String" />
        <asp:Parameter Name="invTotal" Type="Decimal" />
        <asp:Parameter Name="InvTotalNet" Type="Decimal" />
        <asp:Parameter Name="InvPayment" Type="Decimal" />
        <asp:Parameter Name="InvRemain" Type="Decimal" />
        <asp:Parameter Name="PayFinish" Type="Boolean" /><asp:Parameter Name="CostId" Type="Int64" /><asp:Parameter Name="StudyStartDate" Type="String" /><asp:Parameter Name="StudyEndDate" Type="String" />
        <asp:Parameter Name="MonthSubPrice" Type="Decimal" />
        <asp:Parameter Name="BusFlag" Type="Boolean" />
        <asp:Parameter Name="BusId" Type="Int64" />
        <asp:Parameter Name="BusStartDate" Type="String" />
        <asp:Parameter Name="BusEndDate" Type="String" />
        <asp:Parameter Name="BusPrice" Type="Decimal" />
        <asp:Parameter Name="BusMonthNum" Type="Int32" />
        <asp:Parameter Name="BusTotalPrice" Type="Decimal" />
        <asp:Parameter Name="UserId" Type="Int64" />
        <asp:Parameter Name="BusNotes" Type="String" />
        <asp:Parameter Name="PervInfoNotes" Type="String" />
        <asp:Parameter Name="InvSerial" Type="Int64" />
        <asp:Parameter Name="CourseFlag" Type="Boolean" />
        <asp:Parameter Name="InvBackSale" Type="Decimal" />
        <asp:Parameter Name="OldVaule" Type="Decimal" />
        <asp:Parameter Name="CancelFlag" Type="Boolean" />
        <asp:Parameter Name="StopFlag" Type="Boolean" />
        <asp:Parameter Name="MonthFlag" Type="Boolean" />
        <asp:Parameter Name="DayFlag" Type="Boolean" />
                                    <asp:SessionParameter Name="OrgId" SessionField="UserId" Type="Int64" />
                                    <asp:Parameter Name="BranchId" Type="Int64" /><asp:Parameter Name="CreatedBy" Type="Int32" />
                                    <asp:SessionParameter Name="UpdateBy" SessionField="UserId" Type="Int32" />
                                    <asp:Parameter Name="DeletedBy" Type="Int32" />
                                    <asp:Parameter Direction="InputOutput" Name="InsertedId" Type="Object" />
                                </UpdateParameters></asp:ObjectDataSource>

    <br />


                                 

       
                                
                            <asp:ObjectDataSource ID="InvoicesDetailsDS" runat="server"  SelectMethod="Read" TypeName="BOL.Sch_InvoicesDetails" DeleteMethod="DML" InsertMethod="DML" UpdateMethod="DML"><DeleteParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="3" /><asp:Parameter Name="InvDetId" Type="Int64" /><asp:Parameter Name="InvId" Type="Int64" /><asp:Parameter Name="SubjectId" Type="Int64" />
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
                <asp:Parameter DefaultValue="" Name="StartDate" Type="String" />
                <asp:Parameter Name="EndDate" Type="String" />
                <asp:Parameter Name="InvDetId" Type="Int64" />
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

    <asp:TextBox ID="txtOrgId" runat="server" 
        Visible="False" > </asp:TextBox><asp:ObjectDataSource ID="SubjectsDS" runat="server"  SelectMethod="Read" TypeName="BOL.Sch_Subjects" DeleteMethod="DML" InsertMethod="DML" UpdateMethod="DML"><DeleteParameters><asp:Parameter Name="ActionCode" Type="String" />
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
        <asp:ControlParameter ControlID="PeriodIdTextBox" DefaultValue="" Name="PeriodId" PropertyName="Text" Type="Int64" />
       <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
        <asp:Parameter Name="BranchId" Type="Int64" />
        <asp:Parameter Name="SearchText" Type="String" />
        </SelectParameters><UpdateParameters><asp:Parameter Name="ActionCode" Type="String" /><asp:Parameter Name="SubId" Type="Int64" /><asp:Parameter Name="SubCode" Type="String" /><asp:Parameter Name="SubName" Type="String" /><asp:Parameter Name="PeriodId" Type="Int64" /><asp:Parameter Name="GroupHours" Type="Decimal" /><asp:Parameter Name="PersonHours" Type="Decimal" /><asp:Parameter Name="MonthPrice" Type="Decimal" /><asp:Parameter Name="HourPrice" Type="Decimal" /><asp:Parameter Name="Notes" Type="String" /><asp:Parameter Name="OrgId" Type="Int64" /><asp:Parameter Name="BranchId" Type="Int64" /><asp:Parameter Name="CreatedBy" Type="Int32" /><asp:Parameter Name="UpdateBy" Type="Int32" /><asp:Parameter Name="DeletedBy" Type="Int32" /></UpdateParameters></asp:ObjectDataSource>


                                 

       
                                
                            <asp:ObjectDataSource ID="PaymentDatesDS" runat="server"  SelectMethod="Read" TypeName="BOL.Sch_InvPaymentDates" DeleteMethod="DML" InsertMethod="DML" UpdateMethod="DML"><DeleteParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="3" /><asp:Parameter Name="PayId" Type="Int64" /><asp:Parameter Name="InvId" Type="Int64" /><asp:Parameter Name="Amount" Type="Decimal" />
                                <asp:Parameter Name="PayDate" Type="String" /><asp:Parameter Name="NotesDate" Type="String" />
    <asp:Parameter Name="Notes" Type="String" />
                                <asp:Parameter Name="OrgId" Type="Int64" />
                                <asp:Parameter Name="CreatedBy" Type="Int32" /><asp:SessionParameter Name="UpdateBy" SessionField="UserId" Type="Int32" /><asp:SessionParameter DefaultValue="" Name="DeletedBy" SessionField="UserId" Type="Int32" /></DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ActionCode" Type="String" DefaultValue="1" /><asp:Parameter Name="PayId" Type="Int64" /><asp:Parameter Name="InvId" Type="Int64" /><asp:Parameter Name="Amount" Type="Decimal" />
                <asp:Parameter Name="PayDate" Type="String" /><asp:Parameter Name="NotesDate" Type="String" />
                <asp:Parameter Name="Notes" Type="String" />
                <asp:Parameter Name="OrgId" Type="Int64" />
                <asp:Parameter Name="CreatedBy" Type="Int32" /><asp:Parameter Name="UpdateBy" Type="Int32" /><asp:Parameter Name="DeletedBy" Type="Int32" /></InsertParameters>
            <SelectParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="1" />
                <asp:Parameter DefaultValue="" Name="StartDate" Type="String" />
                <asp:Parameter Name="EndDate" Type="String" />
                <asp:Parameter Name="PayId" Type="Int64" />
                <asp:Parameter Name="InvId" Type="Int64" /><asp:Parameter Name="InvType" Type="Int32" />
                <asp:Parameter Name="PayementTypeId" Type="Int32" />
                <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" /><asp:Parameter Name="BRANCHId" Type="Int64" /><asp:Parameter Name="UserId" Type="Int32" />
                <asp:Parameter Name="StudenId" Type="Int64" />
                <asp:Parameter DefaultValue="" Name="SearchText" Type="String" />
                                </SelectParameters><UpdateParameters><asp:Parameter Name="ActionCode" Type="String" /><asp:Parameter Name="PayId" Type="Int64" /><asp:Parameter Name="InvId" Type="Int64" /><asp:Parameter Name="Amount" Type="Decimal" /><asp:Parameter Name="PayDate" Type="String" /><asp:Parameter Name="NotesDate" Type="String" /><asp:Parameter Name="Notes" Type="String" />
       <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
                                    <asp:Parameter Name="CreatedBy" Type="Int32" /><asp:Parameter Name="UpdateBy" Type="Int32" />
                                    <asp:Parameter Name="DeletedBy" Type="Int32" /></UpdateParameters></asp:ObjectDataSource>

    <br />
    <asp:ObjectDataSource ID="StudentsDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Read" TypeName="BOL.Sch_Student" OnSelecting="StudentsDS_Selecting"><SelectParameters>
        <asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" />
       <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
        <asp:Parameter Name="StudentId" Type="Int64" />
    <asp:Parameter DefaultValue="" Name="PeriodId" Type="Int64"></asp:Parameter>

    <asp:Parameter Name="BranchId" Type="Int64" />
        <asp:Parameter Name="SearchText" Type="String" />
        </SelectParameters></asp:ObjectDataSource>

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
<asp:ObjectDataSource ID="PeriodsDS" runat="server" OldValuesParameterFormatString="original_{0}"  SelectMethod="Read" TypeName="BOL.Sch_Periods"><SelectParameters>
        <asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" />
        <asp:Parameter Name="PeriodId" Type="Int64" DefaultValue="" />
        <asp:Parameter Name="StageId" Type="Int64" />
       <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
        <asp:Parameter Name="BranchId" Type="Int64" />
        </SelectParameters></asp:ObjectDataSource>

    <asp:TextBox ID="txtFromValue" runat="server" 
        Visible="False" ></asp:TextBox><asp:TextBox ID="txtPeriodId" runat="server" 
        Visible="False" ></asp:TextBox><asp:HiddenField ID="txtInvId" runat="server" Value="1" />
         <asp:HiddenField ID="txtInvSerial" runat="server" Value="1" /><asp:TextBox ID="txtStageId" runat="server" 
        Visible="False" ></asp:TextBox><asp:TextBox ID="txtToValue" runat="server" 
        Visible="False" ></asp:TextBox><asp:TextBox ID="txtCostId" runat="server" 
        Visible="False" ></asp:TextBox><asp:TextBox ID="txtDesc" runat="server" 
        Visible="False"  Height="22px"></asp:TextBox><asp:TextBox ID="txtId" runat="server" 
        Visible="False"  Height="22px"></asp:TextBox><asp:TextBox ID="txtEnterDate" runat="server" 
        Visible="False"  Height="22px"></asp:TextBox><asp:TextBox ID="txtBoxAccountId" runat="server" 
        Visible="False"  Height="22px"></asp:TextBox></div>

<script type="text/javascript">

   <%-- $(function () {
        $('[id*=txtHourPrice]').on('keyup', function () {
            var txt1Total = 0;
           
            $("[id*=txtTotalPrice]").each(function () {
                txt1Total += $(this).val() == '' ? 0 : parseFloat($(this).val());
            });
            alert(txt1Total);
            document.getElementById('<%=txtInvNetTotal.ClientID%>').value = txt1Total
          /*  $('[id*=txtInvNetTotal]').html(txt1Total);*/
        });
       
    });--%>

 //$(document).ready(function () {
   
 //    $('#Addbtn').click(function ()
 //    {
 //               alert("The paragraph was clicked.");
 //      });

 //})

    $('#CloseBtn').click(function () {
      /*  $('.myFirst').hide();*/
      
        $('#myModal').modal('hide');
        return false;
    });

    


    function ShowProductName(prodId)
    {
        /*alert(prodId);*/

        var txtHourPrice = document.getElementById('ContentPlaceHolder1_SchInvoicesUC_ListViewInvDet_txtHourPrice_' + prodId);
        var txtHourNumPerMonth = document.getElementById('ContentPlaceHolder1_SchInvoicesUC_ListViewInvDet_txtHourNumPerMonth_' + prodId);
        var txtTotalPrice = document.getElementById('ContentPlaceHolder1_SchInvoicesUC_ListViewInvDet_txtTotalPrice_' + prodId);
     
        var txtInvTotal = document.getElementById('<%=txtInvTotal.ClientID%>');

        if (txtHourPrice != null && txtHourNumPerMonth != null)
        {
            var TotalPrice = 0;
            var HourNumPerMonth = txtHourNumPerMonth.value;
            var HourPrice = txtHourPrice.value;
            TotalPrice = HourNumPerMonth * HourPrice;
            txtTotalPrice.value = TotalPrice;


            var txt1Total = 0;
            $("[id*=txtTotalPrice]").each(function () {
                txt1Total += $(this).val() == '' ? 0 : parseFloat($(this).val());
            });
            /*alert(txt1Total);*/
            txt1Total = txt1Total.toFixed(3);
            document.getElementById('<%=txtInvNetTotal.ClientID%>').value = txt1Total;
            document.getElementById('<%=txtInvTotal.ClientID%>').value = txt1Total;
            
        }
       /* alert('product name is ' + txtTotalPrice.value);*/

        return false;
    }


    $("#Addbtn").click(function () {
       
        var employeeId = 1; // e.target.id;
        var flag = confirm('You are about to delete Employee ID ' + employeeId + ' permanently.Are you sure you want to delete this record ? ');
        if (flag) {
            $.ajax({
                url: "*Sch_InvoicesList.ascx/GetCurrentTime",
                type: 'POST',
                data:'{name: "1" }',
               /* data: JSON.stringify({ employeeid: employeeId }),*/
                contentType: 'application/json; charset=utf-8',
                /* dataType: 'json',*/
                success: function () {
                    alert('success');
                },
                error: function () {
                    alert('error');
                }
            });
        }
   
        return false;
   });
    //$("#Addbtn").click(function () {

    //    var employeeId = 1; // e.target.id;
    //    var flag = confirm('You are about to delete Employee ID ' + employeeId + ' permanently.Are you sure you want to delete this record ? ');
    //    $.post('SetItemCats', { type: id, value: value }, function (data) {
    //        switch (id) {
    //            case "CatMain_Id":

    //                //PopulateDropDown("#Cat_Id", data.Category_tbl);
    //                //PopulateDropDown("#CatSub_Id", data.CatSub_tbl);
    //                //PopulateDropDown("#ddlItems", data.Item_tbl);

    //                break;
    //            case "Cat_Id":
    //                //PopulateDropDown("#CatSub_Id", data.CatSub_tbl);
    //                //PopulateDropDown("#ddlItems", data.Item_tbl);
    //                break;
    //            case "CatSub_Id":

    //                PopulateDropDown("#ddlItems", data.Item_tbl);
    //                break;
    //            case "ddlItems":
    //                //PopulateDropDown("#ddlItems", data.Item_tbl);
    //                /*  alert(data.CatMain_Name);*/

    //                var VCatMainName = document.getElementById("CatMain_Name");
    //                var VCatName = document.getElementById("Cat_Name");
    //                var VCatSubName = document.getElementById("CatSub_Name");

    //                VCatMainName.value = data.CatMain_Name;
    //                VCatName.value = data.Cat_Name;
    //                VCatSubName.value = data.CatSub_Name;
    //                break;

    //        }
    //    });
    //    return false;
    //});
   

    function showPopup()
    {
            $('#myModal').modal('show');

    }

    $('.date').datepicker({
        autoclose: true,
        format: 'dd-mm-yyyy',
        endDate: new Date(),
        todayHighlight: true,
        orientation: "bottom",
    });

    function calculateDiscount() {
       
        var txtdiscount = $('input[id=<%=txtdiscount.ClientID%>]').val();
       
        //alert(txtdiscount);
        //alert(txtTotal);
           
        document.getElementById('<%=txtInvNetTotal.ClientID%>').value =  txtTotal - txtdiscount;

        //var edValue = document.getElementById("edValue");
        //var s = edValue.value;

        //var lblValue = document.getElementById("lblValue");
        //lblValue.innerText = "The text box contains: " + s;

       
    }

         //$("#EventDate").datepicker();

         //$("body").delegate("#DatePicker", "focusin", function () {

         //    $(this).datepicker();
         //}); 

         //$('#myModal').on('shown.bs.modal', function () {
         //    $('.date').datepicker({
         //        format: "dd/mm/yyyy",
         //        startDate: "01-01-2019",
         //        autoclose: true,
         //        todayHighlight: true,
         //        container: '#myBodaydiv'
         //    });
         //});

</script>
    

    

    

    