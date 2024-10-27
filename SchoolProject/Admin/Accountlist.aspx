<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMainPageMaster.Master" AutoEventWireup="true" Inherits="Admin_Accountlist" Codebehind="Accountlist.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
		  integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous"/>
     
    <link hrfe="../CSS/bstreeview.css" rel="stylesheet" />

    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
			crossorigin="anonymous"></script>
      <script src="../js/bstreeview.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <WEB:Accounts ID="AccountsUC" runat="server" />
  <%--  <div class="kt-portlet kt-portlet--mobile">
    <div class="kt-portlet__body">
    <div id="ErrorDiv" runat="server"></div>

       
                   
                    </div>
                </div>--%>
    
</asp:Content>
