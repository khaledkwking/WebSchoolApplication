<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="InvoicesShowReport.ascx.cs" Inherits="WebSchool.Admin.controls.SchReport.InvoicesShowReport" %>


<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%--<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>--%>

<div dir="rtl" >
        <%--<rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Height="700px" >
            <LocalReport ReportEmbeddedResource="" ReportPath="Reports\BudgetReceipt.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>--%>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
   

    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%" Height="700px" BackColor="" ClientIDMode="AutoID" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226">
          
 <LocalReport ReportEmbeddedResource="" ReportPath="Reports_Rdl\InvoiceRpt.rdlc">
 <DataSources>
<rsweb:ReportDataSource DataSourceId="InvoicesDs" Name="DataSet1" />
 <rsweb:ReportDataSource DataSourceId="SetupDs" Name="SetupDataSet" />
 </DataSources>
</LocalReport>
 </rsweb:ReportViewer>
    </div>
        


        <asp:TextBox ID="txtMainSalesAccid" runat="server"       Visible="False" ></asp:TextBox>
<asp:TextBox ID="txtMainPurchaseaccid" runat="server"       Visible="False" ></asp:TextBox>
<asp:TextBox ID="txtPaymentsaccid" runat="server"       Visible="False" ></asp:TextBox>

                          
        <asp:ObjectDataSource ID="SetupDs" runat="server" SelectMethod="Read" TypeName="BOL.Setup" OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" />
                <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:Parameter Name="StartDate" Type="String" />
                <asp:Parameter Name="EndDate" Type="String" />
                <asp:Parameter Name="SearchText" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        


                          
        <asp:ObjectDataSource ID="InvoicesDs" runat="server" SelectMethod="Read" TypeName="BOL.Sch_Invoices" OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:Parameter DefaultValue="2" Name="ActionCode" Type="String" />
                <asp:SessionParameter DefaultValue="" Name="StartDate" SessionField="SDate" Type="String" />
                <asp:SessionParameter Name="EndDate" SessionField="EDate" Type="String" />
                <asp:Parameter Name="InvId" Type="Int64" DefaultValue="" />
                <asp:SessionParameter DefaultValue="" Name="InvType" SessionField="InvTypeId" Type="Int32" />
                <asp:Parameter Name="PayementTypeId" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:Parameter Name="BRANCHId" Type="Int64" />
                <asp:SessionParameter Name="UserId" SessionField="EmpId" Type="Int32" />
                <asp:SessionParameter Name="StudenId" SessionField="StudentId" Type="Int64" />
                <asp:Parameter Name="PeriodId" Type="Int64" />
                <asp:Parameter Name="SexId" Type="Int32" />
                <asp:Parameter Name="StudyStartDate" Type="String" />
                <asp:Parameter Name="StudyEndDate" Type="String" />
                <asp:SessionParameter DefaultValue="" Name="SearchText" SessionField="SearchText" Type="String" />
                <asp:SessionParameter DefaultValue="" Name="FinishFlag" SessionField="FinishFlag" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>

        

        

                          
        <asp:ObjectDataSource ID="PaymentsDs" runat="server" SelectMethod="Read" TypeName="BOL.Sch_PaymentRecite" OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:Parameter DefaultValue="2" Name="ActionCode" Type="String" />
                <asp:SessionParameter DefaultValue="" Name="StartDate" SessionField="SDate" Type="String" />
                <asp:SessionParameter Name="EndDate" SessionField="EDate" Type="String" />
                <asp:Parameter Name="ReciteId" Type="Int64" />
                <asp:Parameter Name="InvId" Type="Int64" DefaultValue="" />
                <asp:Parameter Name="InvType" Type="Int32" />
                <asp:Parameter Name="PayementTypeId" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:Parameter Name="BRANCHId" Type="Int64" />
                <asp:SessionParameter Name="UserId" SessionField="EmpId" Type="Int32" />
                <asp:SessionParameter Name="StudenId" SessionField="StudentId" Type="Int64" />
                <asp:SessionParameter DefaultValue="" Name="SearchText" SessionField="SearchText" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>

        

        

                          
        <asp:ObjectDataSource ID="InvDetailsDs" runat="server" SelectMethod="Read" TypeName="BOL.Sch_InvoicesDetails" OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" />
                <asp:SessionParameter DefaultValue="" Name="StartDate" SessionField="SDate" Type="String" />
                <asp:SessionParameter Name="EndDate" SessionField="EDate" Type="String" />
                <asp:Parameter Name="InvDetId" Type="Int64" />
                <asp:Parameter Name="InvId" Type="Int64" DefaultValue="" />
                <asp:Parameter Name="InvType" Type="Int32" />
                <asp:Parameter Name="PayementTypeId" Type="Int32" />
                <asp:Parameter Name="OrgId" Type="Int64" DefaultValue="" />
                <asp:Parameter Name="BRANCHId" Type="Int64" />
                <asp:SessionParameter DefaultValue="" Name="UserId" SessionField="EmpId" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="StudenId" SessionField="StudentId" Type="Int64" />
                <asp:Parameter Name="GroupId" Type="Int64" />
                <asp:Parameter Name="PeriodId" Type="Int64" />
                <asp:Parameter Name="SubjectId" Type="Int64" />
                <asp:SessionParameter DefaultValue="" Name="SearchText" SessionField="SearchText" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>

        

        

        

                          
        <asp:ObjectDataSource ID="CustomersCallsDs" runat="server" SelectMethod="Read" TypeName="BOL.Sch_customersCalls" OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:Parameter DefaultValue="3" Name="ActionCode" Type="String" />
                <asp:SessionParameter DefaultValue="" Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:Parameter Name="CustId" Type="Int64" DefaultValue="" />
                <asp:Parameter Name="AreaId" Type="Int64" />
                <asp:Parameter Name="CallId" Type="Int64" />
                <asp:SessionParameter Name="RelpyId" SessionField="RelpyId" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="UserId" SessionField="EmpId" Type="Int64" />
                <asp:SessionParameter DefaultValue="" Name="StartDate" SessionField="SDate" Type="String" />
                <asp:SessionParameter Name="EndDate" SessionField="EDate" Type="String" />
                <asp:Parameter Name="BRANCHId" Type="Int64" />
                <asp:SessionParameter DefaultValue="" Name="SearchText" SessionField="SearchText" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>

        

        

                          
           

        

        

        

                          
        <asp:ObjectDataSource ID="InvPaymentsDateDs" runat="server" SelectMethod="Read" TypeName="BOL.Sch_InvPaymentDates" OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" />
                <asp:SessionParameter DefaultValue="" Name="StartDate" SessionField="SDate" Type="String" />
                <asp:SessionParameter Name="EndDate" SessionField="EDate" Type="String" />
                <asp:Parameter Name="PayId" Type="Int64" />
                <asp:Parameter Name="InvId" Type="Int64" DefaultValue="" />
                <asp:Parameter Name="InvType" Type="Int32" />
                <asp:Parameter Name="PayementTypeId" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:Parameter Name="BRANCHId" Type="Int64" />
                <asp:SessionParameter Name="UserId" SessionField="EmpId" Type="Int32" />
                <asp:SessionParameter Name="StudenId" SessionField="StudentId" Type="Int64" />
                <asp:SessionParameter DefaultValue="" Name="PeriodId" SessionField="PeriodId" Type="Int64" />
                <asp:Parameter Name="FinishFlag" Type="Boolean" />
                <asp:SessionParameter DefaultValue="" Name="SearchText" SessionField="SearchText" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>

        

        

                          
        

        

        

                          
           

        

        

        

                          
           