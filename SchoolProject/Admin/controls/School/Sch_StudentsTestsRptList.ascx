
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Sch_StudentsTestsRptList.ascx.cs" Inherits="WebSchool.Admin.controls.School.Sch_StudentsTestsRptList" %>


<div class="content-header">
    <%-- <div class="header-section">
        <h1>
            <i class="gi gi-user"></i> <%= Resources.DefaultResource.Main%>
        </h1>
    </div>--%>
</div>
<ul class="breadcrumb breadcrumb-top">
    <li><a href="Main.aspx"><%= Resources.DefaultResource.Main%> </a></li>
    <li> <%= Resources.DefaultResource.StudentTestReport %> </li>
</ul>


       
<div class="block table-responsive">
    <!-- Table Styles Title -->
    <div class="block-title">
        <h2><strong><%= Resources.DefaultResource.List%>  </strong> <%= Resources.DefaultResource.StudentTestReport%> </h2>
        <%--  <div class="block-options pull-right">
            <asp:LinkButton ID="NewRecord" runat="server" CssClass="btn btn-sm btn-success" data-toggle="tooltip" title="<%$ Resources:DefaultResource, NewRecord%>"  data-original-title="<%$ Resources:DefaultResource, NewRecord%>" OnClick="NewRecord_Click"> <i class="fa fa-file"></i></asp:LinkButton>
        </div>--%>
    </div>
    <!-- END Table Styles Title -->
    
    <div class="gallery gallery-widget" data-toggle="lightbox-gallery" style ="min-height :600px">
               
     <!-- General Data Block -->  
        <div class="row">
             <div class=" col-md-4">
                 <asp:TextBox ID="StartDateTextBox" runat="server"  CssClass="form-control input-datepicker" placeholder="<%$ Resources:DefaultResource, FromDate%>" data-date-format="dd/mm/yyyy" autocomplete ="off"/>
            </div>
             <div class=" col-md-4">
                 <asp:TextBox ID="EndDateTextBox" runat="server"  CssClass="form-control input-datepicker" placeholder="<%$ Resources:DefaultResource, ToDate%>" data-date-format="dd/mm/yyyy" autocomplete ="off" />
            </div>
           
             <div class="col-md-4">
                <asp:DropDownList ID="DropDownListEmp" runat="server" CssClass="form-control select-chosen" AppendDataBoundItems="True" DataSourceID="UsersDS" DataTextField="Name" DataValueField="ID"  >
                        <asp:ListItem Text="<%$ Resources:DefaultResource, ChooseEmp%>"  Value="0"></asp:ListItem>
                   
                </asp:DropDownList>

                </div>
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
 

                           
                         
        <asp:ObjectDataSource ID="PaymentReciteDS" runat="server" SelectMethod="Read" TypeName="BOL.Sch_PaymentRecite" DeleteMethod="DML" InsertMethod="DML" UpdateMethod="DML">
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
                <asp:Parameter Name="OrgId" Type="Int64" />
                <asp:Parameter Name="PaymentBefore" Type="Decimal" />
                <asp:Parameter Name="RecSerial" Type="Int64" />
                <asp:Parameter Name="CreatedBy" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="UpdateBy" SessionField="UserId" Type="Int32" />
                <asp:CookieParameter CookieName="UserId" Name="DeletedBy" Type="Int32" />
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
                <asp:SessionParameter Name="CreatedBy" SessionField="UserId" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="UpdateBy" SessionField="UserId" Type="Int32" />
                <asp:Parameter Name="DeletedBy" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="2" Name="ActionCode" Type="String" />
                <asp:ControlParameter ControlID="StartDateTextBox" DefaultValue="" Name="StartDate" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="EndDateTextBox" Name="EndDate" PropertyName="Text" Type="String" />
                <asp:Parameter Name="ReciteId" Type="Int64"></asp:Parameter>
                <asp:Parameter DefaultValue="" Name="InvId" Type="Int64" />
                <asp:Parameter Name="InvType" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="PayementTypeId" Type="Int32"></asp:Parameter>
                <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:Parameter Name="BranchId" Type="Int64" />
                <asp:ControlParameter ControlID="DropDownListEmp" DefaultValue="" Name="UserId" PropertyName="SelectedValue" Type="Int32" />
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
                <asp:Parameter Name="CreatedBy" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="UpdateBy" SessionField="UserId" Type="Int32" />
                <asp:Parameter Name="DeletedBy" Type="Int32" /></UpdateParameters></asp:ObjectDataSource>

                           
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

                    <asp:ObjectDataSource ID="UsersDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Read" TypeName="BOL.Users">
        <SelectParameters>
        <asp:Parameter DefaultValue="2" Name="ActionCode" Type="String" />
        <asp:Parameter Name="UserID" Type="Int32" />
    <asp:Parameter Name="UserName" Type="String"></asp:Parameter>

    <asp:Parameter Name="Password" Type="String" />
       <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
        <asp:Parameter Name="SearchText" Type="String" />
        </SelectParameters></asp:ObjectDataSource>

    <asp:TextBox ID="txtOrgId" runat="server" 
        Visible="False" ></asp:TextBox>

        <br />

    <asp:TextBox ID="txtRemain" runat="server" Visible ="false"  ></asp:TextBox>

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