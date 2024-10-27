<%@ Page Language="C#" AutoEventWireup="true" Inherits="Reports_DefaultRptTest" Codebehind="DefaultRptTest.aspx.cs" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <input id="btnPrint" type="button" value="Print" onclick="Print()" />
    <div id="dvReport">
    
        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" ReportSourceID="CrystalReportSource1" ToolPanelView="None" ReuseParameterValuesOnRefresh="True" />
    
    </div>
        <asp:ObjectDataSource ID="ObjectDataSourceEmp" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByParam" TypeName="PersonalDataSetTableAdapters.EmpViewTableAdapter">
            <SelectParameters>
                <asp:Parameter Name="OrgId" Type="Int64" />
                <asp:Parameter Name="FullName" Type="String" />
                <asp:Parameter Name="EngFullName" Type="String" />
                <asp:Parameter Name="EmpNum" Type="String" />
                <asp:Parameter Name="Job_cls_code" Type="Decimal" />
                <asp:Parameter Name="CivilId" Type="String" />
                <asp:Parameter Name="PassFromDate" Type="DateTime" />
                <asp:Parameter Name="PassToDate" Type="DateTime" />
                <asp:Parameter Name="ResidenceFromDate" Type="DateTime" />
                <asp:Parameter Name="ResidenceToDate" Type="DateTime" />
                <asp:Parameter Name="BranchId" Type="Int32" />
                <asp:Parameter Name="DEPTCODE" Type="Int64" />
                <asp:Parameter Name="SALARYFrom" Type="Decimal" />
                <asp:Parameter Name="SALARYTo" Type="Decimal" />
                <asp:Parameter Name="Status" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
            <Report FileName="PerEmpDataRpt.rpt">
                <DataSources>
                    <CR:DataSourceRef DataSourceID="ObjectDataSourceEmp" TableName="EmpView" />
                </DataSources>
            </Report>
        </CR:CrystalReportSource>

        <script type="text/javascript">
            function Print() {
                var dvReport = document.getElementById("dvReport");
                var frame1 = dvReport.getElementsByTagName("iframe")[0];
                if (navigator.appName.indexOf("Internet Explorer") != -1 || navigator.appVersion.indexOf("Trident") != -1) {
                    frame1.name = frame1.id;
                    window.frames[frame1.id].focus();
                    window.frames[frame1.id].print();
                } else {
                    var frameDoc = frame1.contentWindow ? frame1.contentWindow : frame1.contentDocument.document ? frame1.contentDocument.document : frame1.contentDocument;
                    frameDoc.print();
                }
            }
</script>  
    </form>
</body>
</html>
