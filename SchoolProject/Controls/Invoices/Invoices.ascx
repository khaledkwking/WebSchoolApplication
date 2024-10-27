<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Invoices.ascx.cs" Inherits="WebSchool.Controls.Invoices.Invoices" %>
<div class="kt-subheader   kt-grid__item" id="kt_subheader">
    <div class="kt-subheader__main">
        <h3 class="kt-subheader__title">
            <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, YOUAREHERE%>" />: 
        </h3>
        <span class="kt-subheader__separator kt-hidden"></span>
        <div class="kt-subheader__breadcrumbs">
            <a href="default.aspx" class="kt-subheader__breadcrumbs-home"><i class="flaticon2-shelter"></i></a>
            <span class="kt-subheader__breadcrumbs-separator"></span>
            <span class="kt-subheader__breadcrumbs-link kt-subheader__breadcrumbs-link--active">
                <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, SalesInvoices%>" />
            </span>
        </div>
    </div>
</div>

<div class="kt-portlet kt-portlet--mobile">
    <div class="kt-portlet__head kt-portlet__head--lg">
        <div class="kt-portlet__head-label">
            <span class="kt-portlet__head-icon">
                <i class="kt-font-brand flaticon2-checking"></i>
            </span>
            <h3 class="kt-portlet__head-title">
                <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, SalesInvoices%>" />
            </h3>
        </div>
        <div class="kt-portlet__head-toolbar">
            <div class="kt-portlet__head-wrapper">
                <div class="kt-portlet__head-actions">
                    <div class="dropdown dropdown-inline">

                    </div>
                    <asp:LinkButton ID="NewRecord" runat="server" CssClass="btn btn-brand btn-elevate btn-icon-sm" data-toggle="tooltip"
                        title="<%$ Resources:DefaultResource, NewRecord%>" data-original-title="<%$ Resources:DefaultResource, NewRecord%>" OnClick="NewRecord_Click">
                        <i class="la la-plus"></i>
                        <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, NewRecord%>" />
                    </asp:LinkButton></div></div></div></div><div class="kt-portlet__body">
        <div id="ErrorDiv" runat="server"></div>
                         <div class="table-responsive">
                        <div class="kt-datatable kt-datatable--default kt-datatable--brand kt-datatable--scroll kt-datatable--loaded" id="kt_datatable_latest_orders" style="">
        <asp:ListView ID="lv" runat="server" DataKeyNames="InvId" DataSourceID="InvoicesDS" OnItemCommand="lv_ItemCommand" OnItemDataBound="lv_ItemDataBound">
         
            
      

            <ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="GEIDLabel" runat="server" Text='<%# Eval("InvCode") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("InvDate","{0: dd-MM-yyyy}") %>' />
                       
                    </td>
                     <td>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("InvPayTypeDesc") %>' />
                    </td>
                    
                    <td>
                        <asp:Label ID="TitleArLabel" runat="server" Text='<%# Eval("SUP_CUST_FNAME") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TotalContractsLabel" runat="server" Text='<%# Eval("invTotal","{0:N3}") %>' />
                    </td>
                  <td>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Discount","{0:N3}") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("InvTotalNet","{0:N3}") %>' />
                    </td>
                     <td>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("InvPayment","{0:N3}") %>' />
                    </td>
                     <td>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("InvRemain","{0:N3}") %>' />
                    </td>
                  <%--  <td>
                        <asp:Label ID="CreatorLabel" runat="server" Text='<%# Eval("Creator") %>' />
                    </td>
                    <td>
                        <asp:Label ID="UpdaterLabel" runat="server" Text='<%# Eval("Updater") %>' />
                    </td>--%>
                          <td class="text-center block-options">
                           <asp:LinkButton ID="EditLinkButton" runat="server" CommandName="Edit" data-toggle="kt-tooltip"
                            title="<%$ Resources:DefaultResource, Edite%>" CssClass="btn btn-sm btn-pill btn-icon btn-outline-primary btn-icon-md"
                            data-original-title="<%$ Resources:DefaultResource, Edite%>">
                                <i class="fa fa-edit"></i>
                        </asp:LinkButton>&nbsp <asp:LinkButton ID="DeleteLinkButton" runat="server" CommandName="Delete" data-toggle="kt-tooltip"
                            title="<%$ Resources:DefaultResource, Delete%>" CssClass="btn btn-pill btn-outline-danger btn-sm btn-icon" data-original-title="<%$ Resources:DefaultResource, Delete%>"
                            OnClientClick="javascript:if(!confirm('This action will delete the record and all related Records!')){return false;}">
                                <i class="la la-close"></i>
                        </asp:LinkButton>&nbsp <%--     <asp:LinkButton ID="ViewDetailsLinkButton" runat="server" CommandName="select" data-toggle="kt-tooltip" title="<%$ Resources:DefaultResource, ViewDetails%>"
                                CssClass="btn btn-sm btn-icon btn-pill btn-outline-primary btn-icon-md">
                                <i class="la la-angle-down"></i>
                            </asp:LinkButton>&nbsp 
                              
                              <a href="ActivitiesList.aspx?ID=<%# Eval("STOREID") %>" data-toggle="kt-tooltip"
                                title="<%= Resources.DefaultResource.ViewDetails%>" class="btn btn-pill btn-outline-info btn-sm btn-icon"><i class="flaticon-map"></i></a>--%></td></tr></ItemTemplate><LayoutTemplate>
                <table class="table table-striped table-bordered table-hover table-checkable">
                    <thead class="thead-dark">
                        <tr>
                            <th>
                                <asp:LinkButton ID="MagazineTitleLinkButton" runat="server" CommandArgument="InvCode" CommandName="Sort" Text="<%$ Resources:DefaultResource, InvoiceCode%>" />
                            </th>
                            <th>
                                <asp:LinkButton ID="TitleLinkButton" runat="server" CommandArgument="InvDate" CommandName="Sort" Text="<%$ Resources:DefaultResource, InvoiceDate%>" />
                            </th>
                            <th>
                                <asp:LinkButton ID="TitleArLinkButton" runat="server" CommandArgument="PaymentType" CommandName="Sort" Text="<%$ Resources:DefaultResource, InvoiceType%>" />
                            </th>
                            <th>
                                <asp:LinkButton ID="TotalContractsLinkButton" runat="server" CommandArgument="SUP_CUST_FNAME" CommandName="Sort" Text="<%$ Resources:DefaultResource, CustomerName%>" />
                            </th>
                            <th>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument="invTotal" CommandName="Sort" Text="<%$ Resources:DefaultResource, Total%>" />
                            </th>
                             <th>
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument="Discount" CommandName="Sort" Text="<%$ Resources:DefaultResource, Discount%>" />
                            </th>
                              <th>
                                <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument="InvTotalNet" CommandName="Sort" Text="<%$ Resources:DefaultResource, TotalNet%>" />
                            </th>
                                 <th>
                                <asp:LinkButton ID="LinkButton4" runat="server" CommandArgument="InvPayment" CommandName="Sort" Text="<%$ Resources:DefaultResource, Payment%>" />
                            </th>
                                   <th>
                                <asp:LinkButton ID="LinkButton5" runat="server" CommandArgument="InvRemain" CommandName="Sort" Text="<%$ Resources:DefaultResource, Remain%>" />
                            </th>
                        <%--    <th>
                                <asp:LinkButton ID="CreatorLinkButton" runat="server" CommandArgument="Creator" CommandName="Sort" Text="<%$ Resources:DefaultResource, Creator%>" />
                            </th>
                            <th>
                                <asp:LinkButton ID="UpdaterLinkButton" runat="server" CommandArgument="Creator" CommandName="Sort" Text="<%$ Resources:DefaultResource, Updater%>" />
                            </th>--%>
                            <th>
                                <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, Actions%>" /></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr id="itemPlaceholder" runat="server"></tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="10">
                                <div class="paginationCust">
                                    <asp:DataPager ID="DataPager1" runat="server" PageSize="50">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Link" ButtonCssClass="pagelink" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" NextPageText="التالي" />
                                            <asp:NumericPagerField ButtonType="Link" ButtonCount="10" CurrentPageLabelCssClass="pagelink Current" NumericButtonCssClass="pagelink" />
                                            <asp:NextPreviousPagerField ButtonType="Link" ButtonCssClass="pagelink" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" PreviousPageText="السابق" />
                                        </Fields>
                                    </asp:DataPager>
                                </div>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </LayoutTemplate>
        </asp:ListView>
                            </div>
                             </div>
        <asp:ObjectDataSource ID="InvoicesDS" runat="server"  SelectMethod="Read" TypeName="BOL.Invoices" DeleteMethod="DML" UpdateMethod="DML"><DeleteParameters><asp:Parameter Name="ActionCode" Type="String" /><asp:Parameter Name="InvId" Type="Int64" /><asp:Parameter Name="InvCode" Type="String" /><asp:Parameter Name="RecoderCode" Type="String" /><asp:Parameter Name="InvDate" Type="String" /><asp:Parameter Name="Cust_Sup_Accid" Type="Int64" /><asp:Parameter Name="InvAccid" Type="Int64" /><asp:Parameter Name="PaymentType" Type="Int16" /><asp:Parameter Name="PaymentAccid" Type="Int64" /><asp:Parameter Name="BranchId" Type="Int64" /><asp:Parameter Name="InvType" Type="Int32" /><asp:Parameter Name="EmpId" Type="Int64" /><asp:Parameter Name="PaymentValue" Type="Decimal" /><asp:Parameter Name="PaymentDate" Type="String" /><asp:Parameter Name="Notes" Type="String" /><asp:Parameter Name="invTotal" Type="Decimal" /><asp:Parameter Name="Discount" Type="Double" /><asp:Parameter Name="InvTotalNet" Type="Decimal" /><asp:Parameter Name="InvPayment" Type="Decimal" /><asp:Parameter Name="InvRemain" Type="Decimal" /><asp:Parameter Name="ReferID" Type="Int64" /><asp:Parameter Name="PaymentCost" Type="Decimal" /><asp:Parameter Name="ChequeNo" Type="String" /><asp:Parameter Name="ChequeFlag" Type="Boolean" /><asp:Parameter Name="TotalAddCost" Type="Decimal" /><asp:Parameter Name="TotalReoder" Type="Decimal" /><asp:Parameter Name="TotalReoderNet" Type="Decimal" /><asp:Parameter Name="CostId" Type="Int64" /><asp:Parameter Name="SUP_CUST_ID" Type="Int64" /><asp:Parameter Name="PayFinish" Type="Boolean" /><asp:Parameter Name="CollectValue" Type="Decimal" /><asp:Parameter Name="KeyNetValue" Type="Decimal" /><asp:Parameter Name="VisaValue" Type="Decimal" /><asp:Parameter Name="MasterValue" Type="Decimal" /><asp:Parameter Name="ChequeValue" Type="Decimal" /><asp:Parameter Name="OtherValue" Type="Decimal" /><asp:Parameter Name="CustId" Type="Int64" /><asp:Parameter Name="Serial" Type="Int64" /><asp:Parameter Name="OrgId" Type="Int64" /><asp:Parameter Name="PayeTypeId" Type="Int32" /><asp:Parameter Name="CreatedBy" Type="Int32" /><asp:Parameter Name="UpdateBy" Type="Int32" /><asp:Parameter Name="DeletedBy" Type="Int32" /><asp:Parameter Direction="InputOutput" Name="OutId" Type="Object" /></DeleteParameters><SelectParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="1" /><asp:Parameter Name="StartDate" Type="String" /><asp:Parameter Name="EndDate" Type="String" /><asp:Parameter Name="InvId" Type="Int64" /><asp:Parameter Name="InvtypeId" Type="Int32" /><asp:Parameter Name="InvPaymentTypeId" Type="Int32" /><asp:Parameter Name="PayTypeId" Type="Int32" /><asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" /><asp:Parameter Name="BRANCHId" Type="Int64" /><asp:Parameter Name="EmpId" Type="Int32" /><asp:Parameter Name="CostId" Type="Int64" /><asp:Parameter Name="SearchText" Type="String" /></SelectParameters><UpdateParameters><asp:Parameter Name="ActionCode" Type="String" /><asp:Parameter Name="InvId" Type="Int64" /><asp:Parameter Name="InvCode" Type="String" /><asp:Parameter Name="RecoderCode" Type="String" /><asp:Parameter Name="InvDate" Type="String" /><asp:Parameter Name="Cust_Sup_Accid" Type="Int64" /><asp:Parameter Name="InvAccid" Type="Int64" /><asp:Parameter Name="PaymentType" Type="Int16" /><asp:Parameter Name="PaymentAccid" Type="Int64" /><asp:Parameter Name="BranchId" Type="Int64" /><asp:Parameter Name="InvType" Type="Int32" /><asp:Parameter Name="EmpId" Type="Int64" /><asp:Parameter Name="PaymentValue" Type="Decimal" /><asp:Parameter Name="PaymentDate" Type="String" /><asp:Parameter Name="Notes" Type="String" /><asp:Parameter Name="invTotal" Type="Decimal" /><asp:Parameter Name="Discount" Type="Double" /><asp:Parameter Name="InvTotalNet" Type="Decimal" /><asp:Parameter Name="InvPayment" Type="Decimal" /><asp:Parameter Name="InvRemain" Type="Decimal" /><asp:Parameter Name="ReferID" Type="Int64" /><asp:Parameter Name="PaymentCost" Type="Decimal" /><asp:Parameter Name="ChequeNo" Type="String" /><asp:Parameter Name="ChequeFlag" Type="Boolean" /><asp:Parameter Name="TotalAddCost" Type="Decimal" /><asp:Parameter Name="TotalReoder" Type="Decimal" /><asp:Parameter Name="TotalReoderNet" Type="Decimal" /><asp:Parameter Name="CostId" Type="Int64" /><asp:Parameter Name="SUP_CUST_ID" Type="Int64" /><asp:Parameter Name="PayFinish" Type="Boolean" /><asp:Parameter Name="CollectValue" Type="Decimal" /><asp:Parameter Name="KeyNetValue" Type="Decimal" /><asp:Parameter Name="VisaValue" Type="Decimal" /><asp:Parameter Name="MasterValue" Type="Decimal" /><asp:Parameter Name="ChequeValue" Type="Decimal" /><asp:Parameter Name="OtherValue" Type="Decimal" /><asp:Parameter Name="CustId" Type="Int64" /><asp:Parameter Name="Serial" Type="Int64" /><asp:Parameter Name="OrgId" Type="Int64" /><asp:Parameter Name="PayeTypeId" Type="Int32" /><asp:Parameter Name="CreatedBy" Type="Int32" /><asp:Parameter Name="UpdateBy" Type="Int32" /><asp:Parameter Name="DeletedBy" Type="Int32" /><asp:Parameter Direction="InputOutput" Name="OutId" Type="Object" /></UpdateParameters></asp:ObjectDataSource>

    <asp:TextBox ID="txtOrgId" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1"></asp:TextBox></div></div>