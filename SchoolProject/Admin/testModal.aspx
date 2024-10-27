<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMainPageMaster.Master" AutoEventWireup="true" Inherits="testModal" Codebehind="testModal.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <%--  <link href="assets/vendors/custom/datatables/datatables.bundle.css" rel="stylesheet" type="text/css" />--%>
    <script type="text/javascript">
        function showPopup() {

            /* $('#myModal').modal('show');*/
            let modal = bootstrap.Modal.getOrCreateInstance(document.getElementById('myModal')) // Returns a Bootstrap modal instance
            // Show or hide:
            modal.show();

        }

        $('.date').datepicker({
            autoclose: true,
            format: 'dd-mm-yyyy',
            endDate: new Date(),
            todayHighlight: true,
            orientation: "bottom",
        });

        $('#myModal').on('shown.bs.modal', function () {
            $('#myInput').trigger('focus')
        })

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
    
</asp:Content>
<%--<asp:Content ID="Content2" ContentPlaceHolderID="FooterContentPlaceHolder" runat="server">

     <!--end::Global Theme Bundle -->
    <!--begin::Page Vendors(used by this page) -->
     <% if (Session["SiteLanguage"].ToString() == "ArabicTheme")
        { %>
            <script src="assets/vendors/custom/datatables/datatables.bundle.Ar.js" type="text/javascript"></script>
            <!--begin::Page Scripts(used by this page) -->
            <script src="assets/app/custom/general/crud/datatables/basic/headers2Ar.js" type="text/javascript"></script>
    <% }
        else
        { %>
            <script src="assets/vendors/custom/datatables/datatables.bundle.js" type="text/javascript"></script>
            <!--begin::Page Scripts(used by this page) -->
            <script src="assets/app/custom/general/crud/datatables/basic/headers2.js" type="text/javascript"></script>
     <% } %>
    <!--end::Page Vendors -->
</asp:Content>--%>
