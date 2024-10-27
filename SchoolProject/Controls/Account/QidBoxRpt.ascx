<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QidBoxRpt.ascx.cs" Inherits="ProjectsManagements.Controls.Budget.ReceiptsBoxRpt" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>




<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>




<div class="kt-subheader   kt-grid__item" id="kt_subheader">
    <div class="kt-subheader__main">
        <h3 class="kt-subheader__title">
            <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, YOUAREHERE%>" />: 
        </h3>
        <span class="kt-subheader__separator kt-hidden"></span>
        <div class="kt-subheader__breadcrumbs">
            <a href="#" class="kt-subheader__breadcrumbs-home"><i class="flaticon2-shelter"></i></a>
            <span class="kt-subheader__breadcrumbs-separator"></span>
            <a href="Main.aspx" class="kt-subheader__breadcrumbs-link">
                <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, Dashboard%>" />
            </a>
            <span class="kt-subheader__breadcrumbs-separator"></span>
          
            <span class="kt-subheader__breadcrumbs-separator"></span>
            <span class="kt-subheader__breadcrumbs-link kt-subheader__breadcrumbs-link--active">
            
                    <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, QidDetailsTitle%>" /> - 
     
                
                
            </span>
        </div>
    </div>
</div>
<%--<div class="kt-subheader-search">
    <h3 class="kt-subheader-search__title">
        <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, GlobalSearch%>" />
        <span class="kt-subheader-search__desc">
            <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, GlobalSearchNote%>" />
        </span>
    </h3>
    
</div>--%>

<div class="kt-portlet kt-portlet--mobile">
    <div class="kt-portlet__body">
       


        <div id="ErrorDiv" runat="server"></div>
        <div class="row">
            <div class="col-xl-12 order-lg-2 order-xl-1">
                <div class="kt-portlet kt-portlet--height-fluid kt-portlet--mobile ">
                    <div class="kt-portlet__head">
                        <div class="kt-portlet__head-label">
                            <h3 class="kt-portlet__head-title">
                               <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, QidDetailsTitle%>" />

                            </h3></div>
                        <div class="kt-portlet__head-toolbar">
                           
                    

                                       </div>

                    </div>
                    <div class="kt-portlet__body kt-portlet__body--fit">


                       
       
                        <!--begin: Datatable -->
                        <div class="kt-datatable kt-datatable--default kt-datatable--brand kt-datatable--scroll kt-datatable--loaded" id="kt_datatable_latest_orders" style="">
                               <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        </div>

        
<div dir="rtl">
        <%--<rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Height="700px" >
            <LocalReport ReportEmbeddedResource="" ReportPath="Reports\BudgetReceipt.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>--%>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%">
          <LocalReport ReportEmbeddedResource="" ReportPath="Reports_Rdl\QidRpt.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="QidDs" Name="DataSet1" />
                    <rsweb:ReportDataSource DataSourceId="SetupDs" Name="SetupDataSet" />
                </DataSources>
            </LocalReport>
    </rsweb:ReportViewer>
    </div>
        

        <asp:ObjectDataSource ID="QidDs" runat="server" SelectMethod="Read" TypeName="BOL.qidsDetails">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" />
                <asp:Parameter Name="StartDate" Type="String" />
                <asp:Parameter Name="EndDate" Type="String" />
                <asp:Parameter Name="recitetype" Type="Int32" />
                <asp:QueryStringParameter DefaultValue="" Name="QidId" QueryStringField="QidId" Type="Int64" />
                <asp:Parameter Name="Id" Type="Int64" />
                <asp:CookieParameter DefaultValue="" Name="OrgId" Type="Int64" CookieName="OrgId" />
                <asp:Parameter Name="BRANCHId" Type="Int64" />
                <asp:Parameter Name="EmpId" Type="Int32" />
                <asp:Parameter Name="Detcode" Type="Int32" />
                <asp:Parameter Name="AccountId" Type="Int64" />
                <asp:Parameter Name="ParentAccountId" Type="Int64" />
                <asp:Parameter Name="CostId" Type="Int64" />
                <asp:Parameter Name="SearchText" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>

        

                          
        <asp:ObjectDataSource ID="SetupDs" runat="server" SelectMethod="Read" TypeName="BOL.Setup" OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" />
                <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:Parameter Name="StartDate" Type="String" />
                <asp:Parameter Name="EndDate" Type="String" />
                <asp:Parameter Name="SearchText" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>

        

                          
                            </div><!--end: Datatable -->

                                                 </div></div></div>
            
            
         
        </div>
    </div>
</div>

         

        


        
<asp:TextBox ID="txtSDate" runat="server" Visible="False"></asp:TextBox>
<asp:TextBox ID="txtEDate" runat="server" Visible="False"></asp:TextBox>


         

        


        
