<%@ Page Language="C#" AutoEventWireup="true" Inherits="Reports_CustomerShowRpt" Codebehind="CustomerShowRpt.aspx.cs" %>

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
    
        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" ReportSourceID="CrystalReportSource1" ToolPanelView="None" ReuseParameterValuesOnRefresh="True" Height="1202px" Width="903px" />
    
    </div>
        <asp:ObjectDataSource ID="ObjectDataSourceCustomerView" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByEmpCode" TypeName="PersonalDataSetTableAdapters.CustomerViewTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtId" Name="EmpCode" PropertyName="Text" Type="Int64" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
            <Report FileName="VisitorBookRpt.rpt">
                <DataSources>
                    <CR:DataSourceRef DataSourceID="ObjectDataSourceEmp" TableName="CustomerView" />
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
        <asp:TextBox ID="txtId" runat="server" Visible="False"></asp:TextBox>
    </form>
</body>
</html>
