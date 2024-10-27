<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMainPageMaster.Master" AutoEventWireup="true" Inherits="SchTeacherSubjects" Codebehind="SchTeacherSubjects.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <%--  <link href="assets/vendors/custom/datatables/datatables.bundle.css" rel="stylesheet" type="text/css" />--%>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <School:SchTeacherSubjects ID="SchTeacherSubjectsUC" runat="server" />
  <%--  <div class="kt-portlet kt-portlet--mobile">
    <div class="kt-portlet__body">
    <div id="ErrorDiv" runat="server"></div>

       
                   
                    </div>
                </div>--%>
    
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
