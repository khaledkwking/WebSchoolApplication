<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMainPageMaster.Master" AutoEventWireup="true" Inherits="Admin_Inventory" Codebehind="Inventory.aspx.cs" %>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
     <%--<link href="assets/vendors/custom/datatables/datatables.bundle.css" rel="stylesheet" type="text/css" />--%>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


     <WEB:Inventory ID="InventoryUC" runat="server" />
  <%--  <div class="kt-portlet kt-portlet--mobile">
    <div class="kt-portlet__body">
    <div id="ErrorDiv" runat="server"></div>

       
                   
                    </div>
                </div>--%>
    
</asp:Content>

