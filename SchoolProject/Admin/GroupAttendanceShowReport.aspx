<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GroupAttendanceShowReport.aspx.cs" Inherits="WebSchool.Admin.GroupAttendanceShowReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                        <SchReports:AttendanceShowReport ID="AttendanceShowReportUC" runat="server" />
        </div>
    </form>
</body>
</html>
