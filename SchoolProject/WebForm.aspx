<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm.aspx.cs" Inherits="WebSchool.WebForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src ="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
          <button type="button" class="btn btn-sm btn-success" id="Addbtn" name="Addbtn">
            Add
         </button>
            <br />
            <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label>
        </div>
    </form>
    <script type="text/javascript">

        $("#Addbtn").click(function () {

            var employeeId = 1; // e.target.id;
            var flag = confirm('You are about to delete Employee ID ' + employeeId + ' permanently.Are you sure you want to delete this record ? ');
            if (flag) {
                $.ajax({
                    url: "WebForm.aspx/GetCurrentTime",
                    type: 'POST',
                    data: { name: 1 },
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
    </script>

</body>
</html>
