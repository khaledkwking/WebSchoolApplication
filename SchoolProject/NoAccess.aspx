<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMainPageMaster.Master" AutoEventWireup="true" CodeBehind="NoAccess.aspx.cs" Inherits="ProjectsManagements.NoAccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <%--  <link href="assets/vendors/custom/datatables/datatables.bundle.css" rel="stylesheet" type="text/css" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div style="background-color :red; min-height:600px">
    <div class="kt-subheader-search">
        <div class="kt-form">
            <div class="kt-grid">
                <div class="kt-grid__item">
                    <div class="row">
                        <div class="col-lg-12 text-center text-white">
                            <h1><%=Resources.DefaultResource.AccessTitle%> </h1>
                        </div>

                        
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="kt-content  kt-grid__item kt-grid__item--fluid" id="kt_content">
        <div class="row">
            <div class="col-lg-12">
                <div class="kt-portlet kt-portlet--skin-solid kt-bg-danger">
                    <div class="kt-portlet__body text-center">
                       <h2 style=" text-transform:uppercase; padding:50px;">
                           <%=Resources.DefaultResource.PermissionMsg%>
                       </h2>
                        <h2>
                            <a class="btn btn-warning btn-elevate btn-elevate-air" href="<%=Request.QueryString["URL"] %>">

                                <%=Resources.DefaultResource.GoBackTitle%>
                                
                            </a>
                        </h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
        </div>
</asp:Content>

