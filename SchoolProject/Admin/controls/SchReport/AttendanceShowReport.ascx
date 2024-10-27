<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AttendanceShowReport.ascx.cs" Inherits="WebSchool.Admin.controls.SchReport.AttendanceShowReport" %>


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
        


                          
        <asp:ObjectDataSource ID="LastInvoicesGroupAttendanceDs" runat="server" SelectMethod="ReadAttendance" TypeName="BOL.Sch_StudentsGroupAttendance" OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:Parameter DefaultValue="2" Name="ActionCode" Type="String" />
                <asp:Parameter Name="InvId" Type="Int64" DefaultValue="" />
                <asp:SessionParameter DefaultValue="" Name="InvType" SessionField="InvTypeId" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:Parameter Name="BRANCHId" Type="Int64" />
                <asp:SessionParameter Name="UserId" SessionField="EmpId" Type="Int32" />
                <asp:SessionParameter Name="StudenId" SessionField="StudentId" Type="Int64" />
                <asp:SessionParameter DefaultValue="" Name="PeriodId" SessionField="PeriodId" Type="Int64" />
                <asp:SessionParameter Name="SexId" SessionField="Sex" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="StudyStartDate" SessionField="SDate" Type="String" />
                <asp:SessionParameter Name="StudyEndDate" SessionField="EDate" Type="String" />
                <asp:SessionParameter DefaultValue="" Name="SearchText" SessionField="SearchText" Type="String" />
                <asp:SessionParameter Name="LastDayOfMonth" SessionField="LastDayOfMonth" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>

        

        

                          
        

        

        

                          
        

        

        

                          
           

        

        

        

                          
           