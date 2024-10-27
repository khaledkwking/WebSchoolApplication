<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Sch_InvPaymentDatesList.ascx.cs" Inherits="WebSchool.Admin.controls.School.Sch_InvPaymentDatesList" %>

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
    <li> <%= Resources.DefaultResource.PaymentDateAppointment %> </li>
</ul>
     
   
<div class="block table-responsive" style="min-height:700px">
    <!-- Table Styles Title -->
    <div class="block-title">
        <h2><strong><%= Resources.DefaultResource.List%>  </strong> <%= Resources.DefaultResource.PaymentDateAppointment%> </h2>
        <%--<div class="block-options pull-right">
            <asp:LinkButton ID="NewRecord" runat="server" CssClass="btn btn-sm btn-success" data-toggle="tooltip" title="<%$ Resources:DefaultResource, NewRecord%>"  data-original-title="<%$ Resources:DefaultResource, NewRecord%>" OnClick="NewRecord_Click"> <i class="fa fa-file"></i></asp:LinkButton>
        </div>--%>        <%--<button type="button" class="btn btn-sm btn-success" id="Addbtn" name="Addbtn">
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
                    <div class="col-md-3">
                        <asp:DropDownList ID="DropDownListStudent" runat="server" CssClass="form-control select-chosen" AppendDataBoundItems="True" DataSourceID="StudentsDS" DataTextField="StudentName" DataValueField="StudentId">
                        <asp:ListItem Text="<%$ Resources:DefaultResource, ChooseStudent%>"  Value=""></asp:ListItem>
                   
                    </asp:DropDownList>
                 </div>
             <div class="col-md-3">
                        <asp:DropDownList ID="PeriodDropDownList" runat="server" CssClass="form-control select-chosen" AppendDataBoundItems="True" DataSourceID="PeriodsDS" DataTextField="PeriodName" DataValueField="PeriodId"  >
                        <asp:ListItem Text="<%$ Resources:DefaultResource, ChoosePeriod%>"  Value=""></asp:ListItem>
                   
                    </asp:DropDownList>
                </div>

          <%--   <label for="SubjectsDropDownList" class="col-md-2 control-label">
                <asp:Literal ID="Literal9" runat="server" Text="<%$ Resources:DefaultResource, SubjectName%>" />
            </label>--%>
              <div class="col-md-3">
                <asp:DropDownList ID="DropDownListEmp" runat="server" CssClass="form-control select-chosen" AppendDataBoundItems="True" DataSourceID="UsersDS" DataTextField="Name" DataValueField="ID" Width="80px"  >
                        <asp:ListItem Text="<%$ Resources:DefaultResource, ChooseEmp%>"  Value=""></asp:ListItem>
                   
                </asp:DropDownList>

                </div>
               
            
                
                     <div class="col-md-3">
               
                            <label class="switch switch-success">
                                 عرض لم يحصل فقط
                                <asp:CheckBox ID="FinishCheckBox" runat="server"  /><span></span>
                            </label>
                 
                            </div>
                
          </div> 
       
        <div class="input-group">
            <asp:TextBox ID="SearchTextBox" runat="server" CssClass="form-control" placeholder="<%$ Resources:DefaultResource, Search%>"></asp:TextBox>

            <span class="input-group-btn">
                
                <asp:LinkButton ID="ClearLinkButton" runat="server" CssClass="btn btn-sm btn-danger" OnClick="ClearLinkButton_Click"> <i class="hi hi-remove"></i><%= Resources.DefaultResource.ClearSearch%></asp:LinkButton>
               
                <asp:LinkButton ID="SearchLinkButton" runat="server" CssClass="btn btn-sm btn-primary" OnClick="SearchLinkButton_Click"> <i class="fa fa-search"></i><%= Resources.DefaultResource.SearchTitle%></asp:LinkButton>
                  &nbsp; 
                 <asp:LinkButton ID="PrintLinkButton" runat="server" CssClass="btn btn-sm btn-info" OnClick="PrintLinkButton_Click" > <i class="fa fa-Print"></i><%= Resources.DefaultResource.Print%></asp:LinkButton>
                
            </span>
        </div>
      
       
        <br />
           
          <div id="ErrorDiv" runat="server"></div>
        <asp:ListView ID="lv" runat="server" DataKeyNames="PayId" DataSourceID="InvoicesPaymentDatesDS" OnItemCommand="lv_ItemCommand" OnItemDataBound="lv_ItemDataBound" >
           
            
            <EmptyDataTemplate>
               

            </EmptyDataTemplate>
           
            <ItemTemplate>
                <tr >
                    
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("InvId") %>' Visible="false" />
                    <td>
                        <asp:Label ID="GEIDLabel" runat="server" Text='<%# Eval("PayId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("InvCode") %>' />
                    </td>
                     <td>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("StudentTel") %>' />
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
                         <asp:Label ID="Label3" runat="server" Text='<%# String.Format(new System.Globalization.CultureInfo("ar-KW"), "{0: dd/MMM/yyyy}", Eval("PayDate")) %>'/>
                    </td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Amount","{0:N3}") %>' />
                       
                    </td>
                     <td <%# Eval("FinishFlag").ToString()=="False" ? "style='background-color:pink'" :""%> class ="text-center">
                          
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("AmountPay","{0:N3}") %>' />
                    </td>
                    <td>
                          <asp:Label ID="LabelStudyStartDate" runat="server" Text='<%# String.Format(new System.Globalization.CultureInfo("ar-KW"), "{0: dd/MMM/yyyy}", Eval("StudyStartDate")) %>'/>
                    </td>
                    <td>
                         <asp:Label ID="LabelStudyEndDate" runat="server" Text='<%# String.Format(new System.Globalization.CultureInfo("ar-KW"), "{0: dd/MMM/yyyy}", Eval("StudyEndDate")) %>'/>
                    </td>
                      <td>
                        <asp:Label ID="Label10" runat="server" Text='<%# Eval("SaleManName") %>' />
                    </td>
                      <td <%# Eval("FinishFlag").ToString()=="False" ? "style='background-color:#FF0000'" :""%> class ="text-center">
                          
                        <%# Eval("FinishFlag").ToString()=="False"? "لم يتم التحصيل":"تم التحصيل"%> 
                    </td>
                    
                   <%-- <td>
                        <asp:Label ID="InvTotalNetLabel" runat="server" Text='<%# Eval("InvTotalNet") %>' />
                    </td>
                    <td>
                        <asp:Label ID="InvPaymentLabel" runat="server" Text='<%# Eval("InvPayment") %>' />
                    </td>
                    <td>
                        <asp:Label ID="InvRemainLabel" runat="server" Text='<%# Eval("InvRemain") %>' />
                    </td>--%>
                   <td class="text-center block-options">
                                
                      <%--   <asp:LinkButton ID="EditLinkButton" runat="server" CommandName="ViewDetails" CommandArgument='<%# Eval("InvId") %>' Text="" data-toggle="tooltip" title="<%$ Resources:DefaultResource, Edite%>" CssClass="btn btn-sm btn-default" data-original-title="<%$ Resources:DefaultResource, Edite%>">
                          
                                <i class="fa fa-pencil"></i>
                        </asp:LinkButton>
                                            --%>
                           <%-- <asp:LinkButton ID="DeleteLinkButton" runat="server" CommandName="Delete" Text="" data-toggle="tooltip" title="<%$ Resources:DefaultResource, Delete%>" CssClass="btn btn-sm btn-danger" data-original-title="<%$ Resources:DefaultResource, Delete%>"  OnClientClick="javascript:if(!confirm('هل انت متأكد من حذف هذا السجل؟')){return false;}">
                                    <i class="fa fa-times"></i>
                            </asp:LinkButton>--%>

                         <a data-toggle="tooltip" title="<%= Resources.DefaultResource.SalesInvoices%>"   class="btn btn-sm btn-primary" data-original-title="<%= Resources.DefaultResource.CreateWorkOrder%>" href="SchInvoices.aspx?InvId=<%# Eval("InvId")%>">
                            <i class="fa fa-calendar"></i>
                        </a>
                                         
                         <a   data-toggle="tooltip" title="<%= Resources.DefaultResource.SchoolPayments%>"   class="btn btn-sm btn-warning" data-original-title="<%= Resources.DefaultResource.SchoolPayments%>" href="SchPaymentRecite.aspx?InvId=<%# Eval("InvId")%>">
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
                                <asp:LinkButton ID="InvIdLinkButton" runat="server" CommandArgument="InvId" CommandName="Sort" Text="<%$ Resources:DefaultResource, Id%>" />
                            </th>
                            <th class ="text-center">
                                <asp:LinkButton ID="LinkButton4" runat="server" CommandArgument="InvId" CommandName="Sort" Text="<%$ Resources:DefaultResource, InvoiceCode%>" />
                            </th>
                            <th class ="text-center">
                                <asp:LinkButton ID="LinkButton5" runat="server" CommandArgument="StudentTel" CommandName="Sort" Text="<%$ Resources:DefaultResource, StudentTel%>" />
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
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument="PayDate" CommandName="Sort" Text="<%$ Resources:DefaultResource, PaymentLateDate%>" />
                            </th>      
                             <th class ="text-center">
                                <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument="Amount" CommandName="Sort" Text="<%$ Resources:DefaultResource, AmountDebt%>" />
                            </th>      
                                <th class ="text-center">
                                <asp:LinkButton ID="LinkButton7" runat="server" CommandArgument="Amount" CommandName="Sort" Text="<%$ Resources:DefaultResource, AmountPay%>" />
                            </th>     
                                  
                             <th class ="text-center">
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument="StudyStartDate" CommandName="Sort" Text="<%$ Resources:DefaultResource, FromDateTitle%>" />
                            </th>      

                       <th class ="text-center">
                                <asp:LinkButton ID="StudyEndDateLinkButton" runat="server" CommandArgument="StudyEndDate" CommandName="Sort" Text="<%$ Resources:DefaultResource, ToDateTitle%>" />
                            </th>  
                             <th class ="text-center">
                                <asp:LinkButton ID="LinkButtonPervInfoNotes" runat="server" CommandArgument="SaleManName" CommandName="Sort" Text="<%$ Resources:DefaultResource, SalesMan%>" />
                           <%-- </th>    
                              <th class ="text-center">
                                <asp:LinkButton ID="InvTotalNetLinkButton" runat="server" CommandArgument="InvTotalNet" CommandName="Sort" Text="<%$ Resources:DefaultResource, ValueTitle%>" />
                            </th>    
                              <th class ="text-center">
                                <asp:LinkButton ID="InvPaymentLinkButton" runat="server" CommandArgument="InvPayment" CommandName="Sort" Text="<%$ Resources:DefaultResource, Payment%>" />
                            </th>    
                              <th class ="text-center">
                                <asp:LinkButton ID="InvRemainLinkButton" runat="server" CommandArgument="InvRemain" CommandName="Sort" Text="<%$ Resources:DefaultResource, Remain%>" />
                            </th>    --%>
                           <th class ="text-center">
                                <asp:LinkButton ID="LinkButton6" runat="server" CommandArgument="StudyEndDate" CommandName="Sort" Text="<%$ Resources:DefaultResource, PayDateStatus%>" />
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
                            <td colspan="15">
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
           <div class="form-group">
                 <label for="lblPaymentTextBox" class="col-md-2 control-label">
                    <asp:Literal ID="Literal8" runat="server" Text="<%$ Resources:DefaultResource, TotalRequired%>" />
                </label>
                <div class="col-md-2 ">
                    <asp:Label ID="lblltotal" runat="server" class="control-label" Font-Bold="True" ></asp:Label>
                  
                 </div>
              <%--  <label for="lblPayment" class="col-md-2 control-label">
                    <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:DefaultResource, Payment%>" />
                </label>
                <div class="col-md-2 ">
                    <asp:Label ID="lblPayment" runat="server" class="control-label" Font-Bold="True"></asp:Label>
                  
                    </div>
               <label for="lblPaymentTextBox" class="col-md-2 control-label">
                    <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:DefaultResource, Remain%>" />
                </label>
                <div class="col-md-2 ">
                    <asp:Label ID="lblRemain" runat="server" class="control-label" Font-Bold="True"></asp:Label>
                  
                    </div>--%>
             </div>
        </div>

        
      
 


                                 

       
                                
                            <asp:ObjectDataSource ID="InvoicesPaymentDatesDS" runat="server"  SelectMethod="Read" TypeName="BOL.Sch_InvPaymentDates" OldValuesParameterFormatString="original_{0}">
            <SelectParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="1" />
                <asp:ControlParameter ControlID="StartDateTextBox" DefaultValue="" Name="StartDate" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="EndDateTextBox" Name="EndDate" PropertyName="Text" Type="String" />
                <asp:Parameter Name="PayId" Type="Int64" />
                <asp:Parameter Name="InvId" Type="Int64" /><asp:Parameter Name="InvType" Type="Int32" />
                <asp:Parameter Name="PayementTypeId" Type="Int32" />
                <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" /><asp:Parameter Name="BRANCHId" Type="Int64" />
                <asp:ControlParameter ControlID="DropDownListEmp" DefaultValue="" Name="UserId" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="DropDownListStudent" DefaultValue="" Name="StudenId" PropertyName="SelectedValue" Type="Int64" />
                <asp:ControlParameter ControlID="PeriodDropDownList" DefaultValue="" Name="PeriodId" PropertyName="SelectedValue" Type="Int64" />
                <asp:Parameter Name="FinishFlag" Type="Boolean" />
                <asp:ControlParameter ControlID="SearchTextBox" DefaultValue="" Name="SearchText" PropertyName="Text" Type="String" />
                                </SelectParameters></asp:ObjectDataSource>

    <asp:TextBox ID="txtOrgId" runat="server" 
        Visible="False" > </asp:TextBox>


                                 

       
                                
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
        Visible="False"  Height="22px"></asp:TextBox></div>

<script type="text/javascript">

 //$(document).ready(function () {
   
 //    $('#Addbtn').click(function ()
 //    {
 //               alert("The paragraph was clicked.");
 //      });

 //})

    function ShowProductName(prodId)
    {
        /*alert(prodId);*/

        var txtHourPrice = document.getElementById('ContentPlaceHolder1_SchInvoicesUC_ListViewInvDet_txtHourPrice_' + prodId);
        var txtHourNumPerMonth = document.getElementById('ContentPlaceHolder1_SchInvoicesUC_ListViewInvDet_txtHourNumPerMonth_' + prodId);
        var txtTotalPrice = document.getElementById('ContentPlaceHolder1_SchInvoicesUC_ListViewInvDet_txtTotalPrice_' + prodId);
        if (txtHourPrice != null && txtHourNumPerMonth != null)
        {
            var TotalPrice = 0;
            var HourNumPerMonth = txtHourNumPerMonth.value;
            var HourPrice = txtHourPrice.value;
            TotalPrice = HourNumPerMonth * HourPrice;
            txtTotalPrice.value = TotalPrice;

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

   

       

</script>
    

    <asp:ObjectDataSource ID="UsersDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Read" TypeName="BOL.Users">
        <SelectParameters>
        <asp:Parameter DefaultValue="2" Name="ActionCode" Type="String" />
        <asp:Parameter Name="UserID" Type="Int32" />
    <asp:Parameter Name="UserName" Type="String"></asp:Parameter>

    <asp:Parameter Name="Password" Type="String" />
       <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
        <asp:Parameter Name="SearchText" Type="String" />
        </SelectParameters></asp:ObjectDataSource>

    

<asp:ObjectDataSource ID="StudentsDS" runat="server" OldValuesParameterFormatString="original_{0}"  SelectMethod="Read" TypeName="BOL.Sch_Student"><SelectParameters>
        <asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" />
       <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
        <asp:Parameter Name="StudentId" Type="Int64" />
    <asp:Parameter DefaultValue="" Name="PeriodId" Type="Int64"></asp:Parameter>

    <asp:Parameter Name="BranchId" Type="Int64" />
        <asp:Parameter Name="SearchText" Type="String" />
        </SelectParameters></asp:ObjectDataSource>

    
    

    

    

    