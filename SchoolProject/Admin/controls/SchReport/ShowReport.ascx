<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ShowReport.ascx.cs" Inherits="WebSchool.Admin.controls.SchReport.ShowReport" %>


<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%--<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>--%>

<div dir="rtl" style="min-height:900px" >
        <%--<rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Height="700px" >
            <LocalReport ReportEmbeddedResource="" ReportPath="Reports\BudgetReceipt.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>--%>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
   

    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%" Height="900px" BackColor="" ClientIDMode="AutoID" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226">
          <LocalReport ReportEmbeddedResource="" ReportPath="Reports_Rdl\InvoiceRpt.rdlc">
               <DataSources>
                    <rsweb:ReportDataSource DataSourceId="InvDetailsDs" Name="DataSet1" />
                    <rsweb:ReportDataSource DataSourceId="SetupDs" Name="SetupDataSet" />
                     <rsweb:ReportDataSource DataSourceId="InvPaymentDatesDs" Name="DataSetPaymentDates" />
                </DataSources>
            </LocalReport>
    </rsweb:ReportViewer>
    </div>
        


        <asp:ObjectDataSource ID="InvDetailsDs" runat="server" SelectMethod="Read" TypeName="BOL.Sch_InvoicesDetails" OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" />
                <asp:Parameter Name="StartDate" Type="String" DefaultValue="" />
                <asp:Parameter Name="EndDate" Type="String" />
                <asp:Parameter Name="InvDetId" Type="Int64" />
                <asp:QueryStringParameter DefaultValue="" Name="InvId" QueryStringField="InvId" Type="Int64" />
                <asp:Parameter Name="InvType" Type="Int32" />
                <asp:Parameter Name="PayementTypeId" Type="Int32" />
                <asp:Parameter Name="OrgId" Type="Int64" DefaultValue="" />
                <asp:Parameter Name="BRANCHId" Type="Int64" />
                <asp:Parameter Name="UserId" Type="Int32" />
                <asp:Parameter Name="StudenId" Type="Int64" />
                <asp:Parameter Name="GroupId" Type="Int64" />
                <asp:Parameter Name="PeriodId" Type="Int64" />
                <asp:Parameter Name="SubjectId" Type="Int64" />
                <asp:Parameter Name="SearchText" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>

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
        

        <asp:ObjectDataSource ID="InvPaymentDatesDs" runat="server" SelectMethod="Read" TypeName="BOL.Sch_InvPaymentDates" OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" />
                <asp:Parameter Name="StartDate" Type="String" DefaultValue="" />
                <asp:Parameter Name="EndDate" Type="String" />
                <asp:Parameter Name="PayId" Type="Int64" />
                <asp:QueryStringParameter Name="InvId" QueryStringField="InvId" Type="Int64" />
                <asp:Parameter Name="InvType" Type="Int32" />
                <asp:Parameter Name="PayementTypeId" Type="Int32" />
                <asp:Parameter Name="OrgId" Type="Int64" DefaultValue="" />
                <asp:Parameter Name="BRANCHId" Type="Int64" />
                <asp:Parameter Name="UserId" Type="Int32" />
                <asp:Parameter Name="StudenId" Type="Int64" />
                <asp:Parameter Name="PeriodId" Type="Int64" />
                <asp:Parameter Name="FinishFlag" Type="Boolean" />
                <asp:Parameter Name="SearchText" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>

        

                          
        <asp:ObjectDataSource ID="InvPaymentsDs" runat="server" SelectMethod="Read" TypeName="BOL.Sch_PaymentRecite" OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" />
                <asp:Parameter Name="StartDate" Type="String" DefaultValue="" />
                <asp:Parameter Name="EndDate" Type="String" />
                <asp:QueryStringParameter Name="ReciteId" QueryStringField="ReciteId" Type="Int64" DefaultValue="-1" />
                <asp:Parameter Name="InvId" Type="Int64" DefaultValue="" />
                <asp:Parameter Name="InvType" Type="Int32" />
                <asp:Parameter Name="PayementTypeId" Type="Int32" />
                <asp:Parameter Name="OrgId" Type="Int64" DefaultValue="" />
                <asp:Parameter Name="BRANCHId" Type="Int64" />
                <asp:Parameter Name="UserId" Type="Int32" />
                <asp:Parameter Name="StudenId" Type="Int64" />
                <asp:Parameter Name="SearchText" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>

        

                          
        <asp:ObjectDataSource ID="WorkOrdersDs" runat="server" SelectMethod="Read" TypeName="BOL.Sch_StudentsIndvAttendance" OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" />
                <asp:Parameter Name="Id" Type="Int64" />
                <asp:SessionParameter DefaultValue="" Name="StartDate" SessionField="SDate" Type="String" />
                <asp:SessionParameter Name="EndDate" SessionField="SEdate" Type="String" />
                <asp:Parameter Name="InvId" Type="Int64" DefaultValue="" />
                <asp:Parameter Name="InvDetId" Type="Int64" />
                <asp:Parameter Name="SubjectId" Type="Int64" />
                <asp:Parameter Name="periodId" Type="Int64" />
                <asp:SessionParameter Name="TeacherId" SessionField="TeacherId" Type="Int64" />
                <asp:Parameter Name="InvType" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:Parameter Name="BRANCHId" Type="Int64" />
                <asp:Parameter Name="UserId" Type="Int32" />
                <asp:SessionParameter Name="StudentId" SessionField="StudentId" Type="Int64" />
                <asp:SessionParameter DefaultValue="" Name="AttFlag" SessionField="AttFlag" Type="Boolean" />
                <asp:Parameter Name="SearchText" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>

        

                          
        <asp:ObjectDataSource ID="InvoicesDs" runat="server" SelectMethod="Read" TypeName="BOL.Sch_Invoices" OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" />
                <asp:SessionParameter DefaultValue="" Name="StartDate" SessionField="SDate" Type="String" />
                <asp:SessionParameter Name="EndDate" SessionField="EDate" Type="String" />
                <asp:Parameter Name="InvId" Type="Int64" DefaultValue="" />
                <asp:Parameter Name="InvType" Type="Int32" />
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
                <asp:Parameter Name="FinishFlag" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>

        

        

                          
           