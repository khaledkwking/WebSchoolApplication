<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminTeacherPageMaster.Master" AutoEventWireup="true" CodeBehind="MainTeacher.aspx.cs" Inherits="WebSchool.MainTeacher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <!-- Dashboard Header -->
                        <!-- For an image header add the class 'content-header-media' and an image as in the following example -->
     <%--<Main:MainDashboardHeader ID="MainDashboardHeaderUC" runat="server" />--%>
     <!-- END Dashboard Header -->
        <%--<ContentPages:PageHeader ID="PageHeaderUc" runat="server" />--%>
   <%-- <ContentPages:Dashboard_IconsHeader ID="Dashboard_IconsHeaderUc" runat="server" />--%>
    
    <%--<ContentPages:PageBlock ID="PageBlockUC" runat="server" />--%>
       
    <%--<ContentPages:CarouselHeaderWithInfo ID="CarouselHeaderWithInfoUC" runat="server" />--%>
    <%--<ContentPages:CarouselContent ID="CarouselContentUC" runat="server" />--%>
    
    <%--  <ContentPages:Mini_Top_Stats_Row ID="Mini_Top_Stats_RowUC" runat="server" />--%>
    <Teachers:MainTeacher ID="MainTeacherUC" runat="server" />
    
       

</asp:Content>