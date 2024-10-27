<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StatementSheet.ascx.cs" Inherits="WebSchool.Controls.Account.StatementSheet" %>


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
                <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, AccountStatementSheet%>" />
               
            </span>
        </div>
    </div>
</div>
<div class="kt-subheader-search">
            <br />
        <br />
    <h3 class="kt-subheader-search__title">
        <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, GlobalSearch%>" />
        <span class="kt-subheader-search__desc">
            <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, GlobalSearchNote%>" />
        </span>
    </h3>
    <br />
    <br />
        <br />

    <div class="kt-form">
        <div class="kt-grid">
            <div class="kt-grid__item">
                <div class="row">
                    <div class="col-lg-3" style ="display :none">
                        <div class="kt-input-icon kt-input-icon--pill kt-input-icon--right">
                            <asp:TextBox ID="SearchTextBox" runat="server" CssClass="form-control "></asp:TextBox>
                            <span class="kt-input-icon__icon kt-input-icon__icon--right"><span><i class="la la-puzzle-piece"></i></span></span>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="kt-input-icon kt-input-icon--pill kt-input-icon--right" >
                            <asp:TextBox ID="StartDateTextBox" CssClass="form-control date-picker" runat="server" placeholder="<%$ Resources:DefaultResource, FromDateTitle%>" data-date-format="dd/mm/yyyy" ></asp:TextBox>
                            <span class="kt-input-icon__icon kt-input-icon__icon--right"><span><i class="la la-calendar-check-o"></i></span></span>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="kt-input-icon kt-input-icon--pill kt-input-icon--right">
                            <asp:TextBox ID="EndDateTextBox" CssClass="form-control date-picker" runat="server" placeholder="<%$ Resources:DefaultResource, ToDateTitle%>" data-date-format="dd/mm/yyyy"></asp:TextBox>
                            <span class="kt-input-icon__icon kt-input-icon__icon--right"><span><i class="la la-calendar-check-o"></i></span></span>
                        </div>
                    </div>
                     <div class="col-lg-3">
                        <div class="kt-input-icon kt-input-icon--pill ">
                            <asp:DropDownList ID="AccountDropDownList" runat="server" CssClass="select-chosen"  data-style="btn btn-success" data-live-search="true" AppendDataBoundItems="True"
                           
                                 DataSourceID="AccountDS" DataTextField="accountname" DataValueField="accountid">
                                <asp:ListItem Text="<%$ Resources:DefaultResource, AccountSelect%>" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                           
                            <span class="kt-input-icon__icon kt-input-icon__icon--right"><span><i class="la la-list"></i></span></span>
                        </div>
                    </div>
                     <div class="col-lg-3">
                        <div class="kt-grid__item kt-grid__item--middle">
                            <div class="kt-margin-top-20 kt--visible-tablet-and-mobile"></div>
                            <asp:LinkButton ID="SearchLinkButton" runat="server" Text="<%$ Resources:DefaultResource, Search%>"
                                CssClass="btn btn-upper btn-bold btn-font-sm kt-subheader-search__submit-btn" OnClick="SearchLinkButton_Click" />
                            <asp:LinkButton ID="ClearLinkButton" runat="server" Text="<%$ Resources:DefaultResource, Clear%>"
                                CssClass="btn btn-upper btn-bold btn-font-sm btn-default" OnClick="ClearLinkButton_Click" />
                        </div>
                    </div>
                    </div>
               <br />
                <div class="row">
                   
                    <div class="col-lg-3">
                        <div class="kt-input-icon kt-input-icon--pill ">
                            <asp:DropDownList ID="BranchDropDownList" runat="server" CssClass="select-chosen"  data-style="btn btn-success" data-live-search="true" AppendDataBoundItems="True"
                           
                                 DataSourceID="Branches" DataTextField="BRANCHNAME" DataValueField="BRANCHCODE">
                                <asp:ListItem Text="<%$ Resources:DefaultResource, BranchSelect%>" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                           
                            <span class="kt-input-icon__icon kt-input-icon__icon--right"><span><i class="la la-list"></i></span></span>
                        </div>
                    </div>
                      <div class="col-lg-3">
                        <div class="kt-input-icon kt-input-icon--pill ">
                            <asp:DropDownList ID="CostDropDownList" runat="server" CssClass="select-chosen"  data-style="btn btn-success" data-live-search="true" AppendDataBoundItems="True"
                           
                                 DataSourceID="CostDS" DataTextField="costName" DataValueField="costid">
                                <asp:ListItem Text="<%$ Resources:DefaultResource, CostSelect%>" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                           
                            <span class="kt-input-icon__icon kt-input-icon__icon--right"><span><i class="la la-list"></i></span></span>
                        </div>
                    </div>
                   <div class="col-lg-3">
                        <div class="kt-grid__item kt-grid__item--middle">
                            <div class="kt-margin-top-20 kt--visible-tablet-and-mobile"></div>
                                   <asp:LinkButton ID="PrintBtn" runat="server" CssClass="btn btn-brand btn-elevate btn-icon-sm" data-toggle="tooltip"
                        title="<%$ Resources:DefaultResource, Print%>" data-original-title="<%$ Resources:DefaultResource, Print%>" OnClick="PrintBtn_Click" >
                        <i class="la la-language"></i>
                        <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, Print%>" />
                    </asp:LinkButton></div></div></div></div></div></div></div><div class="kt-portlet kt-portlet--mobile">
    <div class="kt-portlet__head kt-portlet__head--lg">
        <div class="kt-portlet__head-label">
            <span class="kt-portlet__head-icon">
                <i class="kt-font-brand flaticon2-checking"></i>
            </span>
            <h3 class="kt-portlet__head-title">
              
              

                <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, AccountStatementSheet%>" />
            </h3>
        </div>
        <div class="kt-portlet__head-toolbar">
            <div class="kt-portlet__head-wrapper">
                <div class="kt-portlet__head-actions">
                    <div class="dropdown dropdown-inline">

                    </div>
                  </div></div></div></div>
    <div class="kt-portlet__body">
        <div id="ErrorDiv" runat="server"></div>
                       <div class="kt-widget17">
            <div class="kt-widget17__stats">
                <div class="kt-widget17__items">
                      <div class="kt-widget17__item text-center">
                        <span class="kt-widget17__icon">
                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" class="kt-svg-icon">
                                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                    <polygon id="Shape2" points="0 0 24 0 24 24 0 24" />
                                    <path d="M12,11 C9.790861,11 8,9.209139 8,7 C8,4.790861 9.790861,3 12,3 C14.209139,3 16,4.790861 16,7 C16,9.209139 14.209139,11 12,11 Z" id="Mask" fill="#000000" fill-rule="nonzero" opacity="0.3" />
                                    <path d="M3.00065168,20.1992055 C3.38825852,15.4265159 7.26191235,13 11.9833413,13 C16.7712164,13 20.7048837,15.2931929 20.9979143,20.2 C21.0095879,20.3954741 20.9979143,21 20.2466999,21 C16.541124,21 11.0347247,21 3.72750223,21 C3.47671215,21 2.97953825,20.45918 3.00065168,20.1992055 Z" id="Mask-Copy" fill="#000000" fill-rule="nonzero" />
                                </g>
                            </svg></span><span class="kt-widget17__subtitle" id="txtTotalBalanceBefore" runat="server"></span><span class="kt-widget17__desc"><asp:Literal runat="server" Text="<%$ Resources:DefaultResource, TotalBalanceBefore%>" />
                        </span>
                    </div>

                    <div class="kt-widget17__item text-center">
                        <span class="kt-widget17__icon">
                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" class="kt-svg-icon">
                                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                    <polygon id="Shape55" points="0 0 24 0 24 24 0 24" />
                                    <path d="M12,11 C9.790861,11 8,9.209139 8,7 C8,4.790861 9.790861,3 12,3 C14.209139,3 16,4.790861 16,7 C16,9.209139 14.209139,11 12,11 Z" id="Mask3" fill="#000000" fill-rule="nonzero" opacity="0.3" />
                                    <path d="M3.00065168,20.1992055 C3.38825852,15.4265159 7.26191235,13 11.9833413,13 C16.7712164,13 20.7048837,15.2931929 20.9979143,20.2 C21.0095879,20.3954741 20.9979143,21 20.2466999,21 C16.541124,21 11.0347247,21 3.72750223,21 C3.47671215,21 2.97953825,20.45918 3.00065168,20.1992055 Z" id="Mask-Copy" fill="#000000" fill-rule="nonzero" />
                                </g>
                            </svg></span><span class="kt-widget17__subtitle" id="TotalCredit" runat="server"></span><span class="kt-widget17__desc"><asp:Literal runat="server" Text="<%$ Resources:DefaultResource, TotalCredit%>" />  
                        </span>
                    </div>
                    
                  
                        <div class="kt-widget17__item text-center">
                        <span class="kt-widget17__icon">
                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" class="kt-svg-icon">
                                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                    <polygon id="Shape55" points="0 0 24 0 24 24 0 24" />
                                    <path d="M12,11 C9.790861,11 8,9.209139 8,7 C8,4.790861 9.790861,3 12,3 C14.209139,3 16,4.790861 16,7 C16,9.209139 14.209139,11 12,11 Z" id="Mask3" fill="#000000" fill-rule="nonzero" opacity="0.3" />
                                    <path d="M3.00065168,20.1992055 C3.38825852,15.4265159 7.26191235,13 11.9833413,13 C16.7712164,13 20.7048837,15.2931929 20.9979143,20.2 C21.0095879,20.3954741 20.9979143,21 20.2466999,21 C16.541124,21 11.0347247,21 3.72750223,21 C3.47671215,21 2.97953825,20.45918 3.00065168,20.1992055 Z" id="Mask-Copy" fill="#000000" fill-rule="nonzero" />
                                </g>
                            </svg></span><span class="kt-widget17__subtitle" id="TotalDebit" runat="server"></span><span class="kt-widget17__desc"><asp:Literal runat="server" Text="<%$ Resources:DefaultResource, TotalDebit%>" />  
                        </span>
                    </div>
                  
                    <div class="kt-widget17__item text-center">
                        <span class="kt-widget17__icon">
                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" class="kt-svg-icon">
                                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                    <polygon id="Shape2" points="0 0 24 0 24 24 0 24" />
                                    <path d="M12,11 C9.790861,11 8,9.209139 8,7 C8,4.790861 9.790861,3 12,3 C14.209139,3 16,4.790861 16,7 C16,9.209139 14.209139,11 12,11 Z" id="Mask" fill="#000000" fill-rule="nonzero" opacity="0.3" />
                                    <path d="M3.00065168,20.1992055 C3.38825852,15.4265159 7.26191235,13 11.9833413,13 C16.7712164,13 20.7048837,15.2931929 20.9979143,20.2 C21.0095879,20.3954741 20.9979143,21 20.2466999,21 C16.541124,21 11.0347247,21 3.72750223,21 C3.47671215,21 2.97953825,20.45918 3.00065168,20.1992055 Z" id="Mask-Copy" fill="#000000" fill-rule="nonzero" />
                                </g>
                            </svg></span><span class="kt-widget17__subtitle" id="txtTotalBalance" runat="server"></span><span class="kt-widget17__desc"><asp:Literal runat="server" Text="<%$ Resources:DefaultResource, TotalBalanceTitle%>" />
                        </span>
                    </div>

                </div>
            </div>
        </div>
  
<div class="form-group row">

    <div  class="table-responsive col-12">
        <asp:ListView ID="lv" runat="server" DataKeyNames="QidID" DataSourceID="QidsDS" OnItemCommand="lv_ItemCommand" OnItemDataBound="lv_ItemDataBound" >
           
            
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td><%= Resources.DefaultResource.DataNotFound %></td></tr></table></EmptyDataTemplate><ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="FromValueLabel" runat="server" Text='<%# Eval("FromValue","{0:N3}") %>' />
                    </td>
                      <td>
                        <asp:Label ID="ToValueLabel" runat="server" Text='<%# Eval("ToValue","{0:N3}") %>' />
                    </td>
                     <td>
                        <asp:Label ID="TitleArLabel" runat="server" Text='<%# Eval("qidDate","{0: dd/MM/yyyy}")  %>' />
                       
                    </td>
                    <td>
                        <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("qidcode") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("accountname") %>' />
                    </td>
                      <td>
                        <asp:Label ID="NotesLabel" runat="server" Text='<%# Eval("Notes")%>' />
                       
                    </td>
                   <%-- <td>
                        <asp:Label ID="TotalContractsLabel" runat="server" Text='<%# Eval("BRANCHName") %>' />
                    </td>--%>
                  
                 
                        <td class="text-center block-options">
                           <asp:LinkButton ID="EditLinkButton" runat="server" CommandName="Edit" data-toggle="kt-tooltip"
                            title="<%$ Resources:DefaultResource, Edite%>" CssClass="btn btn-sm btn-pill btn-icon btn-outline-primary btn-icon-md"
                            data-original-title="<%$ Resources:DefaultResource, Edite%>">
                                <i class="fa fa-edit"></i>
                        </asp:LinkButton>&nbsp <asp:HyperLink ID="LinkButtonprint" runat="server" CommandName="Print" data-toggle="kt-tooltip" Text ="<%$ Resources:DefaultResource, Print%>" title="<%$ Resources:DefaultResource, Print%>"
                                CssClass="btn btn-outline-info btn-icon-sm" CommandArgument='<%# Eval("qidid") %>' data-original-title="<%$ Resources:DefaultResource, Print%>" NavigateUrl='<%# String.Format("../../Admin/QidShowRpt.aspx?Id=1&QidId={0}",Eval("qidid")) %>' Target="_blank" >
                                <i class="fa fa-print"></i>
                            </asp:HyperLink></td></tr></ItemTemplate><LayoutTemplate>
                <table class="table table-striped table-bordered table-hover table-checkable">
                    <thead class="thead-dark">
                        <tr>
                             <th>
                                <asp:LinkButton ID="AccountCreditTitleLinkButton" runat="server" CommandArgument="FromValue" CommandName="Sort" Text="<%$ Resources:DefaultResource, AccountCredit %>"  />
                            </th>
                            <th>
                                <asp:LinkButton ID="TitleLinkButton" runat="server" CommandArgument="ToValue" CommandName="Sort" Text="<%$ Resources:DefaultResource, AccountDebit%>" />
                            </th>
                            <th>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument="qidDate" CommandName="Sort" Text="<%$ Resources:DefaultResource, Date%>" />
                            </th>
                           
                           <th>
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument="qidcode" CommandName="Sort" Text="<%$ Resources:DefaultResource, QidCode%>" />
                            </th>
                              <th>
                                <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument="qidcode" CommandName="Sort" Text="<%$ Resources:DefaultResource, AccountName%>" />
                            </th>
                             <th>
                                <asp:LinkButton ID="NotesLinkButton" runat="server" CommandArgument="Notes" CommandName="Sort" Text="<%$ Resources:DefaultResource, Notes%>" />
                            </th>
                            <%--<th>
                                <asp:LinkButton ID="TotalContractsLinkButton" runat="server" CommandArgument="BRANCHCODE" CommandName="Sort" Text="<%$ Resources:DefaultResource, BranchName%>" />
                            </th>--%>
                            

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

        

</div><asp:ObjectDataSource ID="QidsDS" runat="server"  SelectMethod="ReadQids" TypeName="BOL.QidDetailsStatmentStatment"><SelectParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="1" /><asp:ControlParameter ControlID="StartDateTextBox" Name="StartDate" PropertyName="Text" Type="String" /><asp:ControlParameter ControlID="EndDateTextBox" Name="EndDate" PropertyName="Text" Type="String" /><asp:Parameter Name="recitetype" Type="Int32" DefaultValue="" /><asp:Parameter Name="QidId" Type="Int64" DefaultValue="" /><asp:Parameter Name="Id" Type="Int64" /><asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" /><asp:ControlParameter ControlID="BranchDropDownList" Name="BRANCHId" PropertyName="SelectedValue" Type="Int64" /><asp:Parameter Name="EmpId" Type="Int32" /><asp:Parameter Name="Detcode" Type="Int32" />
            <asp:Parameter DefaultValue="" Name="AccountId" Type="Int64" />
            <asp:ControlParameter ControlID="AccountDropDownList" Name="ParentAccountId" PropertyName="SelectedValue" Type="Int64" /><asp:ControlParameter ControlID="CostDropDownList" Name="CostId" PropertyName="SelectedValue" Type="Int64" /><asp:Parameter DefaultValue="" Name="SearchText" Type="String" /></SelectParameters></asp:ObjectDataSource>

    <asp:TextBox ID="txtOrgId" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1"></asp:TextBox><asp:ObjectDataSource ID="Branches" runat="server" OldValuesParameterFormatString="original_{0}"  SelectMethod="GetDataByOrgId" TypeName="NEWERPDataSetTableAdapters.BRANCHESTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update"><DeleteParameters><asp:Parameter Name="Original_BRANCHCODE" Type="Int64" /></DeleteParameters><InsertParameters><asp:Parameter Name="BRANCHNAME" Type="String" /><asp:Parameter Name="CompanyName" Type="String" /><asp:Parameter Name="Address" Type="String" /><asp:Parameter Name="TelPhone" Type="String" /><asp:Parameter Name="HintName" Type="String" /><asp:Parameter Name="SalInvSerial" Type="Int64" /><asp:Parameter Name="PurchInvSerial" Type="Int64" /><asp:Parameter Name="InvOrderSerial" Type="Int64" /><asp:Parameter Name="OrderSerial" Type="Int64" /><asp:Parameter Name="MovementSerial" Type="Int64" /><asp:Parameter Name="salesaccid" Type="Int16" /><asp:Parameter Name="purchaseaccid" Type="Int16" /><asp:Parameter Name="boxaccid" Type="Int64" /><asp:Parameter Name="bankaccid" Type="Int64" /><asp:Parameter Name="Visaaccid" Type="Int64" /><asp:Parameter Name="Masteraccid" Type="Int64" /><asp:Parameter Name="KeyNetaccid" Type="Int64" /><asp:Parameter Name="Otheraccid" Type="Int64" /><asp:Parameter Name="VisaComaccid" Type="Int64" /><asp:Parameter Name="MasterComaccid" Type="Int64" /><asp:Parameter Name="KeyNetComaccid" Type="Int64" /><asp:Parameter Name="OtherComaccid" Type="Int64" /><asp:Parameter Name="salesAgalaccid" Type="Int64" /><asp:Parameter Name="purchaseAgalaaccid" Type="Int64" /><asp:Parameter Name="OwnerName" Type="String" /><asp:Parameter Name="OwnerNat" Type="String" /><asp:Parameter Name="BlockNo" Type="String" /><asp:Parameter Name="Area" Type="String" /><asp:Parameter Name="GovId" Type="Int32" /><asp:Parameter Name="Gada" Type="String" /><asp:Parameter Name="HouseType" Type="String" /><asp:Parameter Name="Floor" Type="String" /><asp:Parameter Name="FlatNo" Type="String" /><asp:Parameter Name="Street" Type="String" /><asp:Parameter Name="MailSign" Type="String" /><asp:Parameter Name="MailBox" Type="String" /><asp:Parameter Name="SignatureOwner" Type="String" /><asp:Parameter Name="FileNo" Type="String" /><asp:Parameter Name="CommerName" Type="String" /><asp:Parameter Name="CommerRecord" Type="String" /><asp:Parameter Name="CivilId" Type="String" /><asp:Parameter Name="uinNum" Type="String" /><asp:Parameter Name="ActivityEng" Type="String" /><asp:Parameter Name="CompanyNameEng" Type="String" /><asp:Parameter Name="SignatureOwnerEng" Type="String" /><asp:Parameter Name="ContractNo" Type="String" /><asp:Parameter Name="LawNo" Type="String" /><asp:Parameter Name="Email" Type="String" /><asp:Parameter Name="OrgId" Type="Int64" /><asp:Parameter Name="DiscountValue" Type="Decimal" /></InsertParameters><SelectParameters><asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" /></SelectParameters><UpdateParameters><asp:Parameter Name="BRANCHNAME" Type="String" /><asp:Parameter Name="CompanyName" Type="String" /><asp:Parameter Name="Address" Type="String" /><asp:Parameter Name="TelPhone" Type="String" /><asp:Parameter Name="HintName" Type="String" /><asp:Parameter Name="SalInvSerial" Type="Int64" /><asp:Parameter Name="PurchInvSerial" Type="Int64" /><asp:Parameter Name="InvOrderSerial" Type="Int64" /><asp:Parameter Name="OrderSerial" Type="Int64" /><asp:Parameter Name="MovementSerial" Type="Int64" /><asp:Parameter Name="salesaccid" Type="Int16" /><asp:Parameter Name="purchaseaccid" Type="Int16" /><asp:Parameter Name="boxaccid" Type="Int64" /><asp:Parameter Name="bankaccid" Type="Int64" /><asp:Parameter Name="Visaaccid" Type="Int64" /><asp:Parameter Name="Masteraccid" Type="Int64" /><asp:Parameter Name="KeyNetaccid" Type="Int64" /><asp:Parameter Name="Otheraccid" Type="Int64" /><asp:Parameter Name="VisaComaccid" Type="Int64" /><asp:Parameter Name="MasterComaccid" Type="Int64" /><asp:Parameter Name="KeyNetComaccid" Type="Int64" /><asp:Parameter Name="OtherComaccid" Type="Int64" /><asp:Parameter Name="salesAgalaccid" Type="Int64" /><asp:Parameter Name="purchaseAgalaaccid" Type="Int64" /><asp:Parameter Name="OwnerName" Type="String" /><asp:Parameter Name="OwnerNat" Type="String" /><asp:Parameter Name="BlockNo" Type="String" /><asp:Parameter Name="Area" Type="String" /><asp:Parameter Name="GovId" Type="Int32" /><asp:Parameter Name="Gada" Type="String" /><asp:Parameter Name="HouseType" Type="String" /><asp:Parameter Name="Floor" Type="String" /><asp:Parameter Name="FlatNo" Type="String" /><asp:Parameter Name="Street" Type="String" /><asp:Parameter Name="MailSign" Type="String" /><asp:Parameter Name="MailBox" Type="String" /><asp:Parameter Name="SignatureOwner" Type="String" /><asp:Parameter Name="FileNo" Type="String" /><asp:Parameter Name="CommerName" Type="String" /><asp:Parameter Name="CommerRecord" Type="String" /><asp:Parameter Name="CivilId" Type="String" /><asp:Parameter Name="uinNum" Type="String" /><asp:Parameter Name="ActivityEng" Type="String" /><asp:Parameter Name="CompanyNameEng" Type="String" /><asp:Parameter Name="SignatureOwnerEng" Type="String" /><asp:Parameter Name="ContractNo" Type="String" /><asp:Parameter Name="LawNo" Type="String" /><asp:Parameter Name="Email" Type="String" /><asp:Parameter Name="OrgId" Type="Int64" /><asp:Parameter Name="DiscountValue" Type="Decimal" /><asp:Parameter Name="Original_BRANCHCODE" Type="Int64" /></UpdateParameters></asp:ObjectDataSource>

    <asp:TextBox ID="txtAccountId" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1"></asp:TextBox><asp:HiddenField ID="txtQidId" runat="server" Value="1" />
         <asp:HiddenField ID="txtQidSerial" runat="server" Value="1" /><asp:HiddenField ID="txtTypeId" runat="server" Value="1" /><asp:TextBox ID="txtId" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1" Height="22px"></asp:TextBox></div></div><asp:ObjectDataSource ID="AccountDS" runat="server" OldValuesParameterFormatString="original_{0}"  SelectMethod="Read" TypeName="BOL.Accounts"><SelectParameters><asp:Parameter DefaultValue="4" Name="ActionCode" Type="String" /><asp:Parameter Name="AccountId" Type="Int64" /><asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" /><asp:Parameter Name="BRANCHId" Type="Int64" /><asp:Parameter Name="ParentAccountId" Type="Int64" />
    <asp:Parameter Name="CostId" Type="Int64" />
    <asp:Parameter Name="StartDate" Type="String" />
    <asp:Parameter Name="EndDate" Type="String" />
    <asp:Parameter Name="SearchText" Type="String" /><asp:Parameter Name="AccountCode" Type="String" /><asp:Parameter Name="AccountName" Type="String" /></SelectParameters></asp:ObjectDataSource>

    

    <asp:ObjectDataSource ID="CostDS" runat="server" OldValuesParameterFormatString="original_{0}"  SelectMethod="GetDataByMain" TypeName="NEWERPDataSetTableAdapters.CostCentersTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update"><DeleteParameters><asp:Parameter Name="Original_costid" Type="Int64" /><asp:Parameter Name="Original_costName" Type="String" /><asp:Parameter Name="Original_costCode" Type="String" /><asp:Parameter Name="Original_costSName" Type="String" /><asp:Parameter Name="Original_costparentId" Type="Int32" /><asp:Parameter Name="Original_root" Type="Boolean" /><asp:Parameter Name="Original_Totalfromvalue" Type="Decimal" /><asp:Parameter Name="Original_Totaltovalue" Type="Decimal" /><asp:Parameter Name="Original_startbalancefrom" Type="Double" /><asp:Parameter Name="Original_startdate" Type="DateTime" /><asp:Parameter Name="Original_startbalanceto" Type="Double" /><asp:Parameter Name="Original_balance" Type="Boolean" /><asp:Parameter Name="Original_costType" Type="Int32" /><asp:Parameter Name="Original_ClosedTo" Type="Int64" /><asp:Parameter Name="Original_MainNode" Type="Boolean" /><asp:Parameter Name="Original_ProcessFlag" Type="Boolean" /><asp:Parameter Name="Original_display_Flag" Type="Boolean" /><asp:Parameter Name="Original_LastSerialNo" Type="String" /><asp:Parameter Name="Original_AccLevel" Type="Int32" /><asp:Parameter Name="Original_MainParentAccId" Type="Int64" /></DeleteParameters><InsertParameters><asp:Parameter Name="costName" Type="String" /><asp:Parameter Name="costCode" Type="String" /><asp:Parameter Name="costSName" Type="String" /><asp:Parameter Name="costparentId" Type="Int32" /><asp:Parameter Name="root" Type="Boolean" /><asp:Parameter Name="Totalfromvalue" Type="Decimal" /><asp:Parameter Name="Totaltovalue" Type="Decimal" /><asp:Parameter Name="notes" Type="String" /><asp:Parameter Name="startbalancefrom" Type="Double" /><asp:Parameter Name="startdate" Type="DateTime" /><asp:Parameter Name="startbalanceto" Type="Double" /><asp:Parameter Name="balance" Type="Boolean" /><asp:Parameter Name="costType" Type="Int32" /><asp:Parameter Name="ClosedTo" Type="Int64" /><asp:Parameter Name="MainNode" Type="Boolean" /><asp:Parameter Name="ProcessFlag" Type="Boolean" /><asp:Parameter Name="display_Flag" Type="Boolean" /><asp:Parameter Name="LastSerialNo" Type="String" /><asp:Parameter Name="AccLevel" Type="Int32" /><asp:Parameter Name="MainParentAccId" Type="Int64" /></InsertParameters><UpdateParameters><asp:Parameter Name="costName" Type="String" /><asp:Parameter Name="costCode" Type="String" /><asp:Parameter Name="costSName" Type="String" /><asp:Parameter Name="costparentId" Type="Int32" /><asp:Parameter Name="root" Type="Boolean" /><asp:Parameter Name="Totalfromvalue" Type="Decimal" /><asp:Parameter Name="Totaltovalue" Type="Decimal" /><asp:Parameter Name="notes" Type="String" /><asp:Parameter Name="startbalancefrom" Type="Double" /><asp:Parameter Name="startdate" Type="DateTime" /><asp:Parameter Name="startbalanceto" Type="Double" /><asp:Parameter Name="balance" Type="Boolean" /><asp:Parameter Name="costType" Type="Int32" /><asp:Parameter Name="ClosedTo" Type="Int64" /><asp:Parameter Name="MainNode" Type="Boolean" /><asp:Parameter Name="ProcessFlag" Type="Boolean" /><asp:Parameter Name="display_Flag" Type="Boolean" /><asp:Parameter Name="LastSerialNo" Type="String" /><asp:Parameter Name="AccLevel" Type="Int32" /><asp:Parameter Name="MainParentAccId" Type="Int64" /><asp:Parameter Name="Original_costid" Type="Int64" /><asp:Parameter Name="Original_costName" Type="String" /><asp:Parameter Name="Original_costCode" Type="String" /><asp:Parameter Name="Original_costSName" Type="String" /><asp:Parameter Name="Original_costparentId" Type="Int32" /><asp:Parameter Name="Original_root" Type="Boolean" /><asp:Parameter Name="Original_Totalfromvalue" Type="Decimal" /><asp:Parameter Name="Original_Totaltovalue" Type="Decimal" /><asp:Parameter Name="Original_startbalancefrom" Type="Double" /><asp:Parameter Name="Original_startdate" Type="DateTime" /><asp:Parameter Name="Original_startbalanceto" Type="Double" /><asp:Parameter Name="Original_balance" Type="Boolean" /><asp:Parameter Name="Original_costType" Type="Int32" /><asp:Parameter Name="Original_ClosedTo" Type="Int64" /><asp:Parameter Name="Original_MainNode" Type="Boolean" /><asp:Parameter Name="Original_ProcessFlag" Type="Boolean" /><asp:Parameter Name="Original_display_Flag" Type="Boolean" /><asp:Parameter Name="Original_LastSerialNo" Type="String" /><asp:Parameter Name="Original_AccLevel" Type="Int32" /><asp:Parameter Name="Original_MainParentAccId" Type="Int64" /></UpdateParameters></asp:ObjectDataSource>

    

    