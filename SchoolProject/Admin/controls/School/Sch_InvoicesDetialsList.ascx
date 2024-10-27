<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Sch_InvoicesDetialsList.ascx.cs" Inherits="WebSchool.Admin.controls.School.Sch_InvoicesDetialsList" %>

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
    <li> <%= Resources.DefaultResource.SchoolWorkOrders %> </li>
</ul>
     
   
<div class="block table-responsive" style="min-height:700px">
    <!-- Table Styles Title -->
    <div class="block-title">
        <h2><strong><%= Resources.DefaultResource.List%>  </strong> <%= Resources.DefaultResource.SchoolWorkOrders%> </h2>
        <%--<div class="block-options pull-right">
            <asp:LinkButton ID="NewRecord" runat="server" CssClass="btn btn-sm btn-success" data-toggle="tooltip" title="<%$ Resources:DefaultResource, NewRecord%>"  data-original-title="<%$ Resources:DefaultResource, NewRecord%>" OnClick="NewRecord_Click"> <i class="fa fa-file"></i></asp:LinkButton>
        </div>--%>
        <%--<button type="button" class="btn btn-sm btn-success" id="Addbtn" name="Addbtn">
            Add
         </button>--%>
    </div>
    <!-- END Table Styles Title -->
    
    <div class="gallery gallery-widget" data-toggle="lightbox-gallery" >
               
       <!-- General Data Block --> 
        
         <div class="row">
             <div class=" col-md-6">
                 <asp:TextBox ID="StartDateTextBox" runat="server"  CssClass="form-control input-datepicker" placeholder="<%$ Resources:DefaultResource, FromDate%>" data-date-format="dd/mm/yyyy" autocomplete ="off"/>
            </div>
             <div class="col-md-6">
                 <asp:TextBox ID="EndDateTextBox" runat="server"  CssClass="form-control input-datepicker" placeholder="<%$ Resources:DefaultResource, ToDate%>" data-date-format="dd/mm/yyyy" autocomplete ="off" />
            </div>
           
          </div>
          <div class="row">
           <%-- <label for="PeriodDropDownList" class="col-md-2 control-label">
                <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:DefaultResource, StudentPeriod%>" />
            </label>--%>
             <div class="col-md-4">
                        <asp:DropDownList ID="PeriodDropDownList" runat="server" CssClass="form-control select-chosen" AppendDataBoundItems="True" DataSourceID="PeriodsDS" DataTextField="PeriodName" DataValueField="PeriodId" AutoPostBack="True" OnSelectedIndexChanged="PeriodDropDownList_SelectedIndexChanged" >
                        <asp:ListItem Text="<%$ Resources:DefaultResource, ChoosePeriod%>"  Value=""></asp:ListItem>
                   
                    </asp:DropDownList>
                </div>

             <div class="col-md-4">
                        <asp:DropDownList ID="SubjectsDropDownList" runat="server" CssClass="form-control select-chosen" AppendDataBoundItems="True" DataSourceID="SubjectsDS" DataTextField="SubName" DataValueField="SubId" OnSelectedIndexChanged="SubjectsDropDownList_SelectedIndexChanged" >
                        <asp:ListItem Text="<%$ Resources:DefaultResource, ChooseSubject%>"  Value=""></asp:ListItem>
                   
                    </asp:DropDownList>
                </div>
          </div> 
       <div class="row">
            <div class="col-md-4">
                        <asp:DropDownList ID="DropDownListStudent" runat="server" CssClass="form-control select-chosen" AppendDataBoundItems="True" DataSourceID="StudentsDS" DataTextField="StudentName" DataValueField="StudentId">
                        <asp:ListItem Text="<%$ Resources:DefaultResource, ChooseStudent%>"  Value=""></asp:ListItem>
                   
                    </asp:DropDownList>
                 </div>

     
            <div class="col-md-4">
                <asp:DropDownList ID="DropDownListEmp" runat="server" CssClass="form-control select-chosen" AppendDataBoundItems="True" DataSourceID="UsersDS" DataTextField="Name" DataValueField="ID"  >
                        <asp:ListItem Text="<%$ Resources:DefaultResource, ChooseEmp%>"  Value="0"></asp:ListItem>
                   
                </asp:DropDownList>

               </div>
             <div class="col-md-4">
                 <asp:DropDownList ID="DropDownListGroupType" runat="server" CssClass="form-control" data-live-search="true"
                                                AppendDataBoundItems="True"  >
                    <asp:ListItem  Value="0" text="<%$ Resources:DefaultResource, ChooseInvType%>"> 

                    </asp:ListItem><asp:ListItem Value="1" Text="<%$ Resources:DefaultResource, IndvInvoiceTitle%>">

                        </asp:ListItem><asp:ListItem Value="2" Text="<%$ Resources:DefaultResource, GroupInvoiceTitle%>">
              
              </asp:ListItem></asp:DropDownList>
       </div>
        <div class="input-group">
            <asp:TextBox ID="SearchTextBox" runat="server" CssClass="form-control" placeholder="<%$ Resources:DefaultResource, Search%>"></asp:TextBox>

            <span class="input-group-btn">
                
                <asp:LinkButton ID="ClearLinkButton" runat="server" CssClass="btn btn-sm btn-danger" OnClick="ClearLinkButton_Click"> <i class="hi hi-remove"></i><%= Resources.DefaultResource.ClearSearch%></asp:LinkButton>
               
                <asp:LinkButton ID="SearchLinkButton" runat="server" CssClass="btn btn-sm btn-primary" OnClick="SearchLinkButton_Click"> <i class="fa fa-search"></i><%= Resources.DefaultResource.SearchTitle%></asp:LinkButton>
                 &nbsp; &nbsp;
                  <asp:LinkButton ID="PrintLinkButton" runat="server" CssClass="btn btn-sm btn-info" OnClick="PrintLinkButton_Click" > <i class="fa fa-Print"></i><%= Resources.DefaultResource.Print%></asp:LinkButton>
            </span>
        </div>
      
       
        <br />
           
          <div id="ErrorDiv" runat="server"></div>
        <asp:ListView ID="lv" runat="server" DataKeyNames="InvDetId" DataSourceID="InvoicesDetailsDS" OnItemCommand="lv_ItemCommand" OnItemDataBound="lv_ItemDataBound" >
           
            
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td><%= Resources.DefaultResource.DataNotFound %></td></tr></table>

            </EmptyDataTemplate>
           
            <ItemTemplate>
                <tr >
                    
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("InvId") %>' Visible="false" />
                    <td>
                        <asp:Label ID="GEIDLabel" runat="server" Text='<%# Eval("InvDetId") %>' />
                    </td>
                    <td>
                        
                        <%# String.Format(new System.Globalization.CultureInfo("ar-KW"), "{0: dd/MMM/yyyy}", Eval("InvDate")) %>
                    </td>
                    <td>
                        <asp:Label ID="StudentNameLabel" runat="server" Text='<%# Eval("StudentName") %>' />
                    </td>
                      <td>
                        <asp:Label ID="PeriodNameLabel" runat="server" Text='<%# Eval("PeriodName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SubNameLabel" runat="server" Text='<%# Eval("SubName") %>' />
                    </td>
                      <td>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("HourNumPerMonth","{0:N3}") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("HourPrice","{0:N3}") %>' />
                    </td>
                    <td>
                          <asp:Label ID="LabelStudyStartDate" runat="server" Text='<%# String.Format(new System.Globalization.CultureInfo("ar-KW"), "{0: dd/MMM/yyyy}", Eval("StudyStartDate")) %>'/>
                    </td>
                    <td>
                         <asp:Label ID="LabelStudyEndDate" runat="server" Text='<%# String.Format(new System.Globalization.CultureInfo("ar-KW"), "{0: dd/MMM/yyyy}", Eval("StudyEndDate")) %>'/>
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
                     <td>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("SaleManName") %>' />
                    </td>
                     <td>
                         <asp:Label ID="Label5" runat="server" Text='<%# Eval("InvType").ToString()=="1" ? Resources.DefaultResource.IndvInvoiceTitle:Resources.DefaultResource.GroupInvoiceTitle%>' />
                        
                    
                        <%--<asp:Label ID="Label5" runat="server" Text='<%# Eval("InvoiceType") %>' />--%>
                    </td>
                    
                   <td class="text-center block-options">
                                
                      
                        <asp:LinkButton ID="LinkButtonSend" runat="server" CommandName="Send" CommandArgument='<%# Eval("TeacherId") %>' Text="" data-toggle="tooltip" title="<%$ Resources:DefaultResource, SendTable%>" CssClass="btn btn-sm btn-info" data-original-title="<%$ Resources:DefaultResource, SendTable%>">
                          
                                <i class="fa fa-paper-plane"></i>
                        </asp:LinkButton>
                         <a data-toggle="tooltip" title="<%= Resources.DefaultResource.DisplayTable%>"   class="btn btn-sm btn-primary" 
                             style='<%# Eval("InvType").ToString()=="1" ? "": "visibility:hidden"%>'
                             
                             data-original-title="<%= Resources.DefaultResource.DisplayTable%>" href="SchWorkOrder.aspx?InvDetId=<%# Eval("InvDetId")%>&StudentId=<%# Eval("StudentId")%>&SubjectId=<%#Eval("SubjectId")%>&PeriodId=<%#Eval("PeriodId")%>&stageId=<%#Eval("stageId")%>">
                            <i class="fa fa-calendar"></i>
                        </a>
                     

                          <a data-toggle="tooltip" title="<%= Resources.DefaultResource.StudentTests%>"   class="btn btn-sm btn-success" 
                             style='<%# Eval("InvType").ToString()=="2" ? "": "visibility:hidden"%>'
                             
                             data-original-title="<%= Resources.DefaultResource.StudentTests%>" href="Sch_StudentsTestList.aspx?InvDetId=<%# Eval("InvDetId")%>&InvId=<%# Eval("InvId")%>&StudentId=<%# Eval("StudentId")%>&SubjectId=<%#Eval("SubjectId")%>&PeriodId=<%#Eval("PeriodId")%>&stageId=<%#Eval("stageId")%>">
                            <i class="fa fa-graduation-cap"></i>
                        </a>   
                       
                      

                           

                    </td>
                     
                              
                </tr>

            </ItemTemplate>
        <LayoutTemplate>
                
                <table id="general-table" class="table table-striped table-vcenter table-bordered table-condensed">
                    <thead >
                        <tr>
                            <th class ="text-center">
                                <asp:LinkButton ID="InvIdLinkButton" runat="server" CommandArgument="InvId" CommandName="Sort" Text="<%$ Resources:DefaultResource, Id%>" />
                            </th>
                            <th class ="text-center">
                                <asp:LinkButton ID="InvDateLinkButton" runat="server" CommandArgument="InvDate" CommandName="Sort" Text="<%$ Resources:DefaultResource, InvoiceDate%>" />
                            </th>
                              <th class ="text-center">
                                <asp:LinkButton ID="StudentNameLinkButton" runat="server" CommandArgument="StudentName" CommandName="Sort" Text="<%$ Resources:DefaultResource, StudentName%>" />
                            </th>   
                              <th class ="text-center">
                                <asp:LinkButton ID="PeriodNameLinkButton" runat="server" CommandArgument="PeriodName" CommandName="Sort" Text="<%$ Resources:DefaultResource, StudentPeriod%>" />
                            </th>     
                             <th class ="text-center">
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument="SubName" CommandName="Sort" Text="<%$ Resources:DefaultResource, SubjectName%>" />
                            </th>      
                             <th class ="text-center">
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument="HourNumPerMonth" CommandName="Sort" Text="<%$ Resources:DefaultResource, SubjectHours%>" />
                            </th>      
                             <th class ="text-center">
                                <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument="HourPrice" CommandName="Sort" Text="<%$ Resources:DefaultResource, SubjectHourPrice%>" />
                            </th>      
                             <th class ="text-center">
                                <asp:LinkButton ID="StudyStartDateLinkButton" runat="server" CommandArgument="StudyStartDate" CommandName="Sort" Text="<%$ Resources:DefaultResource, FromDateTitle%>" />
                            </th>        
                       <th class ="text-center">
                                <asp:LinkButton ID="StudyEndDateLinkButton" runat="server" CommandArgument="StudyEndDate" CommandName="Sort" Text="<%$ Resources:DefaultResource, ToDateTitle%>" />
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
                                <asp:LinkButton ID="LinkButtonSalesMan" runat="server" CommandArgument="PervInfoNotes" CommandName="Sort" Text="<%$ Resources:DefaultResource, SalesMan%>" />
                            </th>    
                             <th class ="text-center">
                                <asp:LinkButton ID="LinkButton4" runat="server" CommandArgument="InvoiceType" CommandName="Sort" Text="<%$ Resources:DefaultResource, InvoiceType%>" />
                            </th>    
                            <th class ="text-center" style="width :15%">
                                <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, Actions%>" /></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr id="itemPlaceholder" runat="server">
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="14">
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
        </div>

        
      
 


                                 

       
                                
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
                <asp:ControlParameter ControlID="StartDateTextBox" DefaultValue="" Name="StartDate" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="EndDateTextBox" Name="EndDate" PropertyName="Text" Type="String" />
                <asp:Parameter Name="InvDetId" Type="Int64" />
                <asp:Parameter Name="InvId" Type="Int64" />
                <asp:ControlParameter ControlID="DropDownListGroupType" Name="InvType" PropertyName="SelectedValue" Type="Int32" />
                <asp:Parameter Name="PayementTypeId" Type="Int32" />
                <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" /><asp:Parameter Name="BRANCHId" Type="Int64" />
                <asp:ControlParameter ControlID="DropDownListEmp" DefaultValue="" Name="UserId" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="DropDownListStudent" Name="StudenId" PropertyName="SelectedValue" Type="Int64" />
                <asp:Parameter Name="GroupId" Type="Int64" />
                <asp:ControlParameter ControlID="PeriodDropDownList" DefaultValue="" Name="PeriodId" PropertyName="SelectedValue" Type="Int64" />
                <asp:ControlParameter ControlID="SubjectsDropDownList" DefaultValue="" Name="SubjectId" PropertyName="SelectedValue" Type="Int64" />
                <asp:ControlParameter ControlID="SearchTextBox" DefaultValue="" Name="SearchText" PropertyName="Text" Type="String" />
                                </SelectParameters><UpdateParameters><asp:Parameter Name="ActionCode" Type="String" /><asp:Parameter Name="InvDetId" Type="Int64" /><asp:Parameter Name="InvId" Type="Int64" /><asp:Parameter Name="SubjectId" Type="Int64" />
<asp:Parameter Name="MonthNum" Type="Decimal"></asp:Parameter>
<asp:Parameter Name="HourNumPerMonth" Type="Decimal"></asp:Parameter>
<asp:Parameter Name="HourPrice" Type="Decimal"></asp:Parameter>
                                    <asp:Parameter Name="TotalPrice" Type="Decimal" /><asp:Parameter Name="InvType" Type="Int16" /><asp:Parameter Name="RemainHours" Type="Decimal" />
                                    <asp:Parameter Name="TeacherId" Type="Int64" />
                                    <asp:Parameter Name="CreatedBy" Type="Int32" /><asp:Parameter Name="UpdateBy" Type="Int32" />
                                    <asp:Parameter Name="DeletedBy" Type="Int32" /></UpdateParameters></asp:ObjectDataSource>

    <asp:TextBox ID="txtOrgId" runat="server" 
        Visible="False" > </asp:TextBox><asp:ObjectDataSource ID="SubjectsDS" runat="server"  SelectMethod="Read" TypeName="BOL.Sch_Subjects" DeleteMethod="DML" InsertMethod="DML" UpdateMethod="DML" OldValuesParameterFormatString="original_{0}"><DeleteParameters><asp:Parameter Name="ActionCode" Type="String" />
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
            <asp:ControlParameter ControlID="PeriodDropDownList" DefaultValue="" Name="PeriodId" PropertyName="SelectedValue" Type="Int64" />
       <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
        <asp:Parameter Name="BranchId" Type="Int64" />
        <asp:Parameter Name="SearchText" Type="String" />
        </SelectParameters><UpdateParameters><asp:Parameter Name="ActionCode" Type="String" /><asp:Parameter Name="SubId" Type="Int64" /><asp:Parameter Name="SubCode" Type="String" /><asp:Parameter Name="SubName" Type="String" /><asp:Parameter Name="PeriodId" Type="Int64" /><asp:Parameter Name="GroupHours" Type="Decimal" /><asp:Parameter Name="PersonHours" Type="Decimal" /><asp:Parameter Name="MonthPrice" Type="Decimal" /><asp:Parameter Name="HourPrice" Type="Decimal" /><asp:Parameter Name="Notes" Type="String" />
            <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
            <asp:Parameter Name="BranchId" Type="Int64" /><asp:Parameter Name="CreatedBy" Type="Int32" /><asp:Parameter Name="UpdateBy" Type="Int32" /><asp:Parameter Name="DeletedBy" Type="Int32" /></UpdateParameters></asp:ObjectDataSource>


                                 

       
                                
    <br />

    <br />
<asp:ObjectDataSource ID="PeriodsDS" runat="server"  SelectMethod="Read" TypeName="BOL.Sch_Periods"><SelectParameters>
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
        Visible="False" ></asp:TextBox><asp:TextBox ID="txtId" runat="server" 
        Visible="False"  Height="22px"></asp:TextBox>

    <asp:ObjectDataSource ID="UsersDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Read" TypeName="BOL.Users">
        <SelectParameters>
        <asp:Parameter DefaultValue="2" Name="ActionCode" Type="String" />
        <asp:Parameter Name="UserID" Type="Int32" />
    <asp:Parameter Name="UserName" Type="String"></asp:Parameter>

    <asp:Parameter Name="Password" Type="String" />
       <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
        <asp:Parameter Name="SearchText" Type="String" />
        </SelectParameters></asp:ObjectDataSource>

    <asp:ObjectDataSource ID="StudentsDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Read" TypeName="BOL.Sch_Student" ><SelectParameters>
        <asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" />
       <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
        <asp:Parameter Name="StudentId" Type="Int64" />
    <asp:Parameter DefaultValue="" Name="PeriodId" Type="Int64"></asp:Parameter>

    <asp:Parameter Name="BranchId" Type="Int64" />
        <asp:Parameter Name="SearchText" Type="String" />
        </SelectParameters></asp:ObjectDataSource>

    </div>

<script type="text/javascript">

 //$(document).ready(function () {
   
 //    $('#Addbtn').click(function ()
 //    {
 //               alert("The paragraph was clicked.");
 //      });

 //})

    //function ShowProductName(prodId)
    //{
    //    /*alert(prodId);*/

    //    var txtHourPrice = document.getElementById('ContentPlaceHolder1_SchInvoicesUC_ListViewInvDet_txtHourPrice_' + prodId);
    //    var txtHourNumPerMonth = document.getElementById('ContentPlaceHolder1_SchInvoicesUC_ListViewInvDet_txtHourNumPerMonth_' + prodId);
    //    var txtTotalPrice = document.getElementById('ContentPlaceHolder1_SchInvoicesUC_ListViewInvDet_txtTotalPrice_' + prodId);
    //    if (txtHourPrice != null && txtHourNumPerMonth != null)
    //    {
    //        var TotalPrice = 0;
    //        var HourNumPerMonth = txtHourNumPerMonth.value;
    //        var HourPrice = txtHourPrice.value;
    //        TotalPrice = HourNumPerMonth * HourPrice;
    //        txtTotalPrice.value = TotalPrice;

    //    }
    //   /* alert('product name is ' + txtTotalPrice.value);*/

    //    return false;
    //}


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

   

       

</script>
    

    

    

    