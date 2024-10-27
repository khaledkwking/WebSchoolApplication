<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SchoolShowRpt.aspx.cs" Inherits="WebSchool.Admin.SchoolShowRpt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <SchReports:ShowReport id="ShowReportUC" runat="server" />
        </div>
    </form>
</body>
</html>
