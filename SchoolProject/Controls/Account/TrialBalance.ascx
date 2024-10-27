<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TrialBalance.ascx.cs" Inherits="WebSchool.Controls.Account.TrialBalance" %>


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
                <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, TrialBalanceTitle%>" />
               
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
                        
                        <div class="kt-input-icon kt-input-icon--pill kt-input-icon--right">
                            <span class="kt-subheader-search__desc newSearchTitle">
                              <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, FromDateTitle%>" />
                             </span>
                            <asp:TextBox ID="StartDateTextBox" CssClass="form-control date-picker" runat="server" placeholder="<%$ Resources:DefaultResource, FromDateTitle%>" data-date-format="dd/mm/yyyy"></asp:TextBox>
                            <span class="kt-input-icon__icon kt-input-icon__icon--right"><span><i class="la la-calendar-check-o"></i></span></span>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="kt-input-icon kt-input-icon--pill kt-input-icon--right">
                            <span class="kt-subheader-search__desc newSearchTitle">
                              <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, ToDateTitle%>" />
                             </span>
                            <asp:TextBox ID="EndDateTextBox" CssClass="form-control date-picker" runat="server" placeholder="<%$ Resources:DefaultResource, ToDateTitle%>" data-date-format="dd/mm/yyyy"></asp:TextBox>
                            <span class="kt-input-icon__icon kt-input-icon__icon--right"><span><i class="la la-calendar-check-o"></i></span></span>
                        </div>
                    </div>
                     <div class="col-lg-3">
                        <div class="kt-input-icon kt-input-icon--pill ">
                            <span class="kt-subheader-search__desc newSearchTitle">
                              <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, AccountName%>" />
                             </span>
                            <asp:DropDownList ID="AccountDropDownList" runat="server" CssClass="select-chosen"  data-style="btn btn-success" data-live-search="true" AppendDataBoundItems="True"
                           
                                 DataSourceID="AccountDS" DataTextField="accountname" DataValueField="accountid">
                                <asp:ListItem Text="<%$ Resources:DefaultResource, AccountSelect%>" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                           
                            <span class="kt-input-icon__icon kt-input-icon__icon--right"><span><i class="la la-list"></i></span></span>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="kt-input-icon kt-input-icon--pill ">
                            <span class="kt-subheader-search__desc newSearchTitle">
                              <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, CostCenter%>" />
                             </span>
                            <asp:DropDownList ID="CostDropDownList" runat="server" CssClass="select-chosen"  data-style="btn btn-success" data-live-search="true" AppendDataBoundItems="True"
                           
                                 DataSourceID="CostDS" DataTextField="costName" DataValueField="costid">
                                <asp:ListItem Text="<%$ Resources:DefaultResource, CostSelect%>" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                           
                            <span class="kt-input-icon__icon kt-input-icon__icon--right"><span><i class="la la-list"></i></span></span>
                        </div>
                    </div>
                    <%-- <div class="col-lg-3">
                        <div class="kt-grid__item kt-grid__item--middle">
                            <div class="kt-margin-top-20 kt--visible-tablet-and-mobile"></div>
                            <asp:LinkButton ID="SearchLinkButton" runat="server" Text="<%$ Resources:DefaultResource, Search%>"
                                CssClass="btn btn-upper btn-bold btn-font-sm kt-subheader-search__submit-btn" OnClick="SearchLinkButton_Click" />
                            <asp:LinkButton ID="ClearLinkButton" runat="server" Text="<%$ Resources:DefaultResource, Clear%>"
                                CssClass="btn btn-upper btn-bold btn-font-sm btn-default" OnClick="ClearLinkButton_Click" />
                        </div>
                    </div>--%>
                    </div>
               <br />
                <div class="row">
                   
                    <div class="col-lg-3">
                        <div class="kt-input-icon kt-input-icon--pill ">
                              <span class="kt-subheader-search__desc newSearchTitle">
                              <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, BranchName%>" />
                             </span>
                            <asp:DropDownList ID="BranchDropDownList" runat="server" CssClass="select-chosen"  data-style="btn btn-success" data-live-search="true" AppendDataBoundItems="True"
                           
                                 DataSourceID="Branches" DataTextField="BRANCHNAME" DataValueField="BRANCHCODE">
                                <asp:ListItem Text="<%$ Resources:DefaultResource, BranchSelect%>" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                           
                            <span class="kt-input-icon__icon kt-input-icon__icon--right"><span><i class="la la-list"></i></span></span>
                        </div>
                    </div>
                       <div class="col-lg-3">
                         <span class="kt-subheader-search__desc newSearchTitle">
                              <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, LevelTitle%>" />
                             </span>
                        <div class="kt-grid__item kt-grid__item--middle">
                            <div class="kt-margin-top-20 kt--visible-tablet-and-mobile"></div>
                       
                            <input type="number" value="0" id="source_b" class="form-control">


                        </div>

                    </div>
             
                      <div class="col-lg-3">
                          <label>
                            <span class="kt-subheader-search__desc newSearchTitle">
                              <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, ZeroValueTitle%>"  />
                             </span>
                                </label>
                        
                        <div class="kt-grid__item kt-grid__item--middle">
                            <div class="kt-margin-top-20 kt--visible-tablet-and-mobile"></div>
                            
                              <span class="kt-switch kt-switch--outline kt-switch--icon kt-switch--success">
                                <label>
                                    <asp:CheckBox ID="AccessingCheckBox" runat="server" Checked='<%# Eval("Accessing") %>' />
                                    <span></span>
                                </label>
                            </span>
                             
                        </div>

                    </div>
                </div>
                <br />
                <div class="row">
                          <div class="col-lg-12" style ="text-align :center">
                        <div class="kt-grid__item kt-grid__item--middle">
                            <div class="kt-margin-top-20 kt--visible-tablet-and-mobile"></div>
                                   <asp:LinkButton ID="PrintBtn" runat="server" CssClass="btn btn-brand btn-elevate btn-icon-sm" data-toggle="tooltip"
                        title="<%$ Resources:DefaultResource, Print%>" data-original-title="<%$ Resources:DefaultResource, Print%>" OnClick="PrintBtn_Click"  > <i class="la la-language"></i><asp:Literal runat="server" Text="<%$ Resources:DefaultResource, Print%>" />
                    </asp:LinkButton></div></div></div></div></div></div></div><div class="kt-portlet kt-portlet--mobile">
    <div class="kt-portlet__head kt-portlet__head--lg">
       <%-- <div class="kt-portlet__head-label">
            <span class="kt-portlet__head-icon">
                <i class="kt-font-brand flaticon2-checking"></i>
            </span>
            <h3 class="kt-portlet__head-title">
              
              

                <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, TrialBalanceTitle%>" />
            </h3>
        </div>--%>
<%--        <div class="kt-portlet__head-toolbar">
            <div class="kt-portlet__head-wrapper">
                <div class="kt-portlet__head-actions">
                    <div class="dropdown dropdown-inline">

                    </div>
                  </div></div>

        </div>--%>

    </div>
    <div class="kt-portlet__body">
        <div id="ErrorDiv" runat="server"></div>
                    
  
<div class="form-group row">

    <%--<div  class="table-responsive col-12">
        </div>--%>

        

</div>

    <asp:TextBox ID="txtOrgId" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1"></asp:TextBox><asp:ObjectDataSource ID="Branches" runat="server" OldValuesParameterFormatString="original_{0}"  SelectMethod="GetDataByOrgId" TypeName="NEWERPDataSetTableAdapters.BRANCHESTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update"><DeleteParameters><asp:Parameter Name="Original_BRANCHCODE" Type="Int64" /></DeleteParameters><InsertParameters><asp:Parameter Name="BRANCHNAME" Type="String" /><asp:Parameter Name="CompanyName" Type="String" /><asp:Parameter Name="Address" Type="String" /><asp:Parameter Name="TelPhone" Type="String" /><asp:Parameter Name="HintName" Type="String" /><asp:Parameter Name="SalInvSerial" Type="Int64" /><asp:Parameter Name="PurchInvSerial" Type="Int64" /><asp:Parameter Name="InvOrderSerial" Type="Int64" /><asp:Parameter Name="OrderSerial" Type="Int64" /><asp:Parameter Name="MovementSerial" Type="Int64" /><asp:Parameter Name="salesaccid" Type="Int16" /><asp:Parameter Name="purchaseaccid" Type="Int16" /><asp:Parameter Name="boxaccid" Type="Int64" /><asp:Parameter Name="bankaccid" Type="Int64" /><asp:Parameter Name="Visaaccid" Type="Int64" /><asp:Parameter Name="Masteraccid" Type="Int64" /><asp:Parameter Name="KeyNetaccid" Type="Int64" /><asp:Parameter Name="Otheraccid" Type="Int64" /><asp:Parameter Name="VisaComaccid" Type="Int64" /><asp:Parameter Name="MasterComaccid" Type="Int64" /><asp:Parameter Name="KeyNetComaccid" Type="Int64" /><asp:Parameter Name="OtherComaccid" Type="Int64" /><asp:Parameter Name="salesAgalaccid" Type="Int64" /><asp:Parameter Name="purchaseAgalaaccid" Type="Int64" /><asp:Parameter Name="OwnerName" Type="String" /><asp:Parameter Name="OwnerNat" Type="String" /><asp:Parameter Name="BlockNo" Type="String" /><asp:Parameter Name="Area" Type="String" /><asp:Parameter Name="GovId" Type="Int32" /><asp:Parameter Name="Gada" Type="String" /><asp:Parameter Name="HouseType" Type="String" /><asp:Parameter Name="Floor" Type="String" /><asp:Parameter Name="FlatNo" Type="String" /><asp:Parameter Name="Street" Type="String" /><asp:Parameter Name="MailSign" Type="String" /><asp:Parameter Name="MailBox" Type="String" /><asp:Parameter Name="SignatureOwner" Type="String" /><asp:Parameter Name="FileNo" Type="String" /><asp:Parameter Name="CommerName" Type="String" /><asp:Parameter Name="CommerRecord" Type="String" /><asp:Parameter Name="CivilId" Type="String" /><asp:Parameter Name="uinNum" Type="String" /><asp:Parameter Name="ActivityEng" Type="String" /><asp:Parameter Name="CompanyNameEng" Type="String" /><asp:Parameter Name="SignatureOwnerEng" Type="String" /><asp:Parameter Name="ContractNo" Type="String" /><asp:Parameter Name="LawNo" Type="String" /><asp:Parameter Name="Email" Type="String" /><asp:Parameter Name="OrgId" Type="Int64" /><asp:Parameter Name="DiscountValue" Type="Decimal" /></InsertParameters><SelectParameters><asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" /></SelectParameters><UpdateParameters><asp:Parameter Name="BRANCHNAME" Type="String" /><asp:Parameter Name="CompanyName" Type="String" /><asp:Parameter Name="Address" Type="String" /><asp:Parameter Name="TelPhone" Type="String" /><asp:Parameter Name="HintName" Type="String" /><asp:Parameter Name="SalInvSerial" Type="Int64" /><asp:Parameter Name="PurchInvSerial" Type="Int64" /><asp:Parameter Name="InvOrderSerial" Type="Int64" /><asp:Parameter Name="OrderSerial" Type="Int64" /><asp:Parameter Name="MovementSerial" Type="Int64" /><asp:Parameter Name="salesaccid" Type="Int16" /><asp:Parameter Name="purchaseaccid" Type="Int16" /><asp:Parameter Name="boxaccid" Type="Int64" /><asp:Parameter Name="bankaccid" Type="Int64" /><asp:Parameter Name="Visaaccid" Type="Int64" /><asp:Parameter Name="Masteraccid" Type="Int64" /><asp:Parameter Name="KeyNetaccid" Type="Int64" /><asp:Parameter Name="Otheraccid" Type="Int64" /><asp:Parameter Name="VisaComaccid" Type="Int64" /><asp:Parameter Name="MasterComaccid" Type="Int64" /><asp:Parameter Name="KeyNetComaccid" Type="Int64" /><asp:Parameter Name="OtherComaccid" Type="Int64" /><asp:Parameter Name="salesAgalaccid" Type="Int64" /><asp:Parameter Name="purchaseAgalaaccid" Type="Int64" /><asp:Parameter Name="OwnerName" Type="String" /><asp:Parameter Name="OwnerNat" Type="String" /><asp:Parameter Name="BlockNo" Type="String" /><asp:Parameter Name="Area" Type="String" /><asp:Parameter Name="GovId" Type="Int32" /><asp:Parameter Name="Gada" Type="String" /><asp:Parameter Name="HouseType" Type="String" /><asp:Parameter Name="Floor" Type="String" /><asp:Parameter Name="FlatNo" Type="String" /><asp:Parameter Name="Street" Type="String" /><asp:Parameter Name="MailSign" Type="String" /><asp:Parameter Name="MailBox" Type="String" /><asp:Parameter Name="SignatureOwner" Type="String" /><asp:Parameter Name="FileNo" Type="String" /><asp:Parameter Name="CommerName" Type="String" /><asp:Parameter Name="CommerRecord" Type="String" /><asp:Parameter Name="CivilId" Type="String" /><asp:Parameter Name="uinNum" Type="String" /><asp:Parameter Name="ActivityEng" Type="String" /><asp:Parameter Name="CompanyNameEng" Type="String" /><asp:Parameter Name="SignatureOwnerEng" Type="String" /><asp:Parameter Name="ContractNo" Type="String" /><asp:Parameter Name="LawNo" Type="String" /><asp:Parameter Name="Email" Type="String" /><asp:Parameter Name="OrgId" Type="Int64" /><asp:Parameter Name="DiscountValue" Type="Decimal" /><asp:Parameter Name="Original_BRANCHCODE" Type="Int64" /></UpdateParameters></asp:ObjectDataSource>

    <asp:TextBox ID="txtAccountId" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1"></asp:TextBox><asp:HiddenField ID="txtQidId" runat="server" Value="1" />
         <asp:HiddenField ID="txtTypeId" runat="server" Value="1" /><asp:TextBox ID="txtId" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1" Height="22px"></asp:TextBox></div></div><asp:ObjectDataSource ID="AccountDS" runat="server" OldValuesParameterFormatString="original_{0}"  SelectMethod="Read" TypeName="BOL.Accounts"><SelectParameters><asp:Parameter DefaultValue="4" Name="ActionCode" Type="String" /><asp:Parameter Name="AccountId" Type="Int64" /><asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" /><asp:Parameter Name="BRANCHId" Type="Int64" /><asp:Parameter Name="ParentAccountId" Type="Int64" />
    <asp:Parameter Name="CostId" Type="Int64" />
    <asp:Parameter Name="StartDate" Type="String" />
    <asp:Parameter Name="EndDate" Type="String" />
    <asp:Parameter Name="SearchText" Type="String" /><asp:Parameter Name="AccountCode" Type="String" /><asp:Parameter Name="AccountName" Type="String" /></SelectParameters></asp:ObjectDataSource>

    

    <asp:ObjectDataSource ID="CostDS" runat="server" OldValuesParameterFormatString="original_{0}"  SelectMethod="GetDataByMain" TypeName="NEWERPDataSetTableAdapters.CostCentersTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update"><DeleteParameters><asp:Parameter Name="Original_costid" Type="Int64" /><asp:Parameter Name="Original_costName" Type="String" /><asp:Parameter Name="Original_costCode" Type="String" /><asp:Parameter Name="Original_costSName" Type="String" /><asp:Parameter Name="Original_costparentId" Type="Int32" /><asp:Parameter Name="Original_root" Type="Boolean" /><asp:Parameter Name="Original_Totalfromvalue" Type="Decimal" /><asp:Parameter Name="Original_Totaltovalue" Type="Decimal" /><asp:Parameter Name="Original_startbalancefrom" Type="Double" /><asp:Parameter Name="Original_startdate" Type="DateTime" /><asp:Parameter Name="Original_startbalanceto" Type="Double" /><asp:Parameter Name="Original_balance" Type="Boolean" /><asp:Parameter Name="Original_costType" Type="Int32" /><asp:Parameter Name="Original_ClosedTo" Type="Int64" /><asp:Parameter Name="Original_MainNode" Type="Boolean" /><asp:Parameter Name="Original_ProcessFlag" Type="Boolean" /><asp:Parameter Name="Original_display_Flag" Type="Boolean" /><asp:Parameter Name="Original_LastSerialNo" Type="String" /><asp:Parameter Name="Original_AccLevel" Type="Int32" /><asp:Parameter Name="Original_MainParentAccId" Type="Int64" /></DeleteParameters><InsertParameters><asp:Parameter Name="costName" Type="String" /><asp:Parameter Name="costCode" Type="String" /><asp:Parameter Name="costSName" Type="String" /><asp:Parameter Name="costparentId" Type="Int32" /><asp:Parameter Name="root" Type="Boolean" /><asp:Parameter Name="Totalfromvalue" Type="Decimal" /><asp:Parameter Name="Totaltovalue" Type="Decimal" /><asp:Parameter Name="notes" Type="String" /><asp:Parameter Name="startbalancefrom" Type="Double" /><asp:Parameter Name="startdate" Type="DateTime" /><asp:Parameter Name="startbalanceto" Type="Double" /><asp:Parameter Name="balance" Type="Boolean" /><asp:Parameter Name="costType" Type="Int32" /><asp:Parameter Name="ClosedTo" Type="Int64" /><asp:Parameter Name="MainNode" Type="Boolean" /><asp:Parameter Name="ProcessFlag" Type="Boolean" /><asp:Parameter Name="display_Flag" Type="Boolean" /><asp:Parameter Name="LastSerialNo" Type="String" /><asp:Parameter Name="AccLevel" Type="Int32" /><asp:Parameter Name="MainParentAccId" Type="Int64" /></InsertParameters><UpdateParameters><asp:Parameter Name="costName" Type="String" /><asp:Parameter Name="costCode" Type="String" /><asp:Parameter Name="costSName" Type="String" /><asp:Parameter Name="costparentId" Type="Int32" /><asp:Parameter Name="root" Type="Boolean" /><asp:Parameter Name="Totalfromvalue" Type="Decimal" /><asp:Parameter Name="Totaltovalue" Type="Decimal" /><asp:Parameter Name="notes" Type="String" /><asp:Parameter Name="startbalancefrom" Type="Double" /><asp:Parameter Name="startdate" Type="DateTime" /><asp:Parameter Name="startbalanceto" Type="Double" /><asp:Parameter Name="balance" Type="Boolean" /><asp:Parameter Name="costType" Type="Int32" /><asp:Parameter Name="ClosedTo" Type="Int64" /><asp:Parameter Name="MainNode" Type="Boolean" /><asp:Parameter Name="ProcessFlag" Type="Boolean" /><asp:Parameter Name="display_Flag" Type="Boolean" /><asp:Parameter Name="LastSerialNo" Type="String" /><asp:Parameter Name="AccLevel" Type="Int32" /><asp:Parameter Name="MainParentAccId" Type="Int64" /><asp:Parameter Name="Original_costid" Type="Int64" /><asp:Parameter Name="Original_costName" Type="String" /><asp:Parameter Name="Original_costCode" Type="String" /><asp:Parameter Name="Original_costSName" Type="String" /><asp:Parameter Name="Original_costparentId" Type="Int32" /><asp:Parameter Name="Original_root" Type="Boolean" /><asp:Parameter Name="Original_Totalfromvalue" Type="Decimal" /><asp:Parameter Name="Original_Totaltovalue" Type="Decimal" /><asp:Parameter Name="Original_startbalancefrom" Type="Double" /><asp:Parameter Name="Original_startdate" Type="DateTime" /><asp:Parameter Name="Original_startbalanceto" Type="Double" /><asp:Parameter Name="Original_balance" Type="Boolean" /><asp:Parameter Name="Original_costType" Type="Int32" /><asp:Parameter Name="Original_ClosedTo" Type="Int64" /><asp:Parameter Name="Original_MainNode" Type="Boolean" /><asp:Parameter Name="Original_ProcessFlag" Type="Boolean" /><asp:Parameter Name="Original_display_Flag" Type="Boolean" /><asp:Parameter Name="Original_LastSerialNo" Type="String" /><asp:Parameter Name="Original_AccLevel" Type="Int32" /><asp:Parameter Name="Original_MainParentAccId" Type="Int64" /></UpdateParameters></asp:ObjectDataSource>

    

    