<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QidsDetails.ascx.cs" Inherits="WebSchool.Controls.Account.QidsDetails" %>
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
                <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, AccountQids%>" />
            </span>
        </div>
    </div>
</div>
<div class="kt-subheader-search">
    <h3 class="kt-subheader-search__title">
        <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, GlobalSearch%>" />
        <span class="kt-subheader-search__desc">
            <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, GlobalSearchNote%>" />
        </span>
    </h3>
    <div class="kt-form">
        <div class="kt-grid">
            <div class="kt-grid__item">
                <div class="row">
                    <div class="col-lg-4" style ="display :none">
                        <div class="kt-input-icon kt-input-icon--pill kt-input-icon--right">
                            <asp:TextBox ID="SearchTextBox" runat="server" CssClass="form-control "></asp:TextBox>
                            <span class="kt-input-icon__icon kt-input-icon__icon--right"><span><i class="la la-puzzle-piece"></i></span></span>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="kt-input-icon kt-input-icon--pill kt-input-icon--right">
                            <asp:TextBox ID="StartDateTextBox" CssClass="form-control date-picker" runat="server" placeholder="<%$ Resources:DefaultResource, FromDateTitle%>" data-date-format="dd/mm/yyyy"></asp:TextBox>
                            <span class="kt-input-icon__icon kt-input-icon__icon--right"><span><i class="la la-calendar-check-o"></i></span></span>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="kt-input-icon kt-input-icon--pill kt-input-icon--right">
                            <asp:TextBox ID="EndDateTextBox" CssClass="form-control date-picker" runat="server" placeholder="<%$ Resources:DefaultResource, ToDateTitle%>" data-date-format="dd/mm/yyyy"></asp:TextBox>
                            <span class="kt-input-icon__icon kt-input-icon__icon--right"><span><i class="la la-calendar-check-o"></i></span></span>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="kt-grid__item kt-grid__item--middle">
                            <div class="kt-margin-top-20 kt--visible-tablet-and-mobile"></div>
                            <asp:LinkButton ID="SearchLinkButton" runat="server" Text="<%$ Resources:DefaultResource, Search%>"
                                CssClass="btn btn-upper btn-bold btn-font-sm kt-subheader-search__submit-btn" />
                            <asp:LinkButton ID="ClearLinkButton" runat="server" Text="<%$ Resources:DefaultResource, Clear%>"
                                CssClass="btn btn-upper btn-bold btn-font-sm btn-default" OnClick="ClearLinkButton_Click" />
                        </div>
                    </div>
                </div>
            </div>
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
                <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, AccountQids%>" />
            </h3>
        </div>
        <div class="kt-portlet__head-toolbar">
            <div class="kt-portlet__head-wrapper">
                <div class="kt-portlet__head-actions">
                    <div class="dropdown dropdown-inline">

                    </div>
                    <asp:LinkButton ID="NewRecord" runat="server" CssClass="btn btn-brand btn-elevate btn-icon-sm"  data-bs-toggle="tooltip"
                        title="<%$ Resources:DefaultResource, NewRecord%>" data-original-title="<%$ Resources:DefaultResource, NewRecord%>" OnClick="NewRecord_Click">
                        <i class="la la-plus"></i>
                        <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, NewRecord%>" />
                    </asp:LinkButton></div></div></div></div><div class="kt-portlet__body">
        <div id="ErrorDiv" runat="server"></div>
<div class="form-group row">

    <div  class="table-responsive col-4">
        <asp:ListView ID="lv" runat="server" DataKeyNames="QidID" DataSourceID="QidsDS" OnItemCommand="lv_ItemCommand" OnItemDataBound="lv_ItemDataBound" OnSelectedIndexChanging="lv_SelectedIndexChanging1">
            <EditItemTemplate>
                <tr style="">
                    <td colspan="8">
                        <div class="kt-portlet">
                            <div class="kt-portlet__head">
                                <div class="kt-portlet__head-label">
                                    <h3 class="kt-portlet__head-title">
                                        <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, UpdateRecord%>" />
                                    </h3>
                                </div>
                            </div>

                            <!--begin::Form-->
                            <div class="kt-form kt-form--label-right">
                                <div class="kt-portlet__body">
                         
                                    <div class="form-group row">
                                        <label for="qididlabel" class="col-2 col-form-label">
                                            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:DefaultResource, QidAutoNo%>" />
                                        </label>
                                        <div class="col-4">
                                            <asp:TextBox ID="qididTextBox" runat="server" CssClass="form-control" Text='<%# Bind("qidid") %>' Enabled ="false" />
                                           </div>

                                        <label for="QidCodelabel" class="col-2 col-form-label">
                                            <asp:Literal ID="QidCodeLiteral1" runat="server" Text="<%$ Resources:DefaultResource, QidCode%>" />
                                        </label>
                                        <div class="col-4">
                                            <asp:TextBox ID="qidcodeTextBox" runat="server" CssClass="form-control" Text='<%# Bind("qidcode") %>' />
                                            <asp:RequiredFieldValidator ID="TitleArTextBoxRFV" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="qidcodeTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator></div></div><div class="form-group row">
                                        <label for="qidDatelabel" class="col-2 col-form-label">
                                            <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:DefaultResource, Date%>" />
                                        </label>
                                        <div class="col-4">
                                            <asp:TextBox ID="qidDateTextBox" runat="server" AutoComplete="Off"  CssClass="form-control date-picker" Text='<%# Bind("qidDate","{0: dd/MM/yyyy}")%>' />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorDate" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="qidDateTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator></div><label for="BranchIdDropDownList" class="col-2 col-form-label"><asp:Literal ID="BranchIdLiteral" runat="server" Text="<%$ Resources:DefaultResource, BranchName%>" />
                                        </label>
                                        <div class="col-4">
                                            <asp:DropDownList ID="BranchIdDropDownList" runat="server" CssClass="form-control"
                                                AppendDataBoundItems="True" DataSourceID="Branches" DataTextField="BRANCHNAME" DataValueField="BRANCHCODE" Text='<%# Bind("BrachId") %>'>
                                                <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0" />
                                            </asp:DropDownList>
                                            
                                        </div>

                                    </div>
                                   
                                     <div class="form-group row">
                                        <label for="Noteslabel" class="col-2 col-form-label">
                                            <asp:Literal ID="LiteralNotes" runat="server" Text="<%$ Resources:DefaultResource, Notes%>" />
                                        </label>
                                        <div class="col-4">
                                            <asp:TextBox ID="TextBoxNotes" runat="server" AutoComplete="Off" CssClass="form-control" Text='<%# Bind("Notes") %>' TextMode="MultiLine" />
  
                                        </div>
                                         <label for="EmpIdlabel" class="col-2 col-form-label">
                                            <asp:Literal ID="LiteralEmpId" runat="server" Text="<%$ Resources:DefaultResource, EmpNo%>" />
                                        </label>
                                        <div class="col-4">
                                            <asp:TextBox ID="TextBoxEmpId" runat="server" AutoComplete="Off" CssClass="form-control" Text='<%# Bind("EmpId") %>'  Enabled ="false"/>
                                          </div>

                                    </div>
                                       <%-- <div class="col-10">
                                            <span class="kt-switch kt-switch--lg kt-switch--icon">
                                                <label>
                                                    <asp:CheckBox ID="AllowDisplayCheckBox" runat="server" Checked='<%# Bind("ActiveFlag") %>' />
                                                    <span></span>
                                                </label>
                                            </span>
                                        </div>--%>
                                    </div>
                                </div>
                                <div class="kt-portlet__foot">
                                    <div class="kt-form__actions">
                                        <div class="row">
                                            <div class="col-2">
                                            </div>
                                            <div class="col-10">
                                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="<%$ Resources:DefaultResource, Update%>" CssClass="btn btn-success" ValidationGroup="DML" />
                                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="<%$ Resources:DefaultResource, Cancel%>" CssClass="btn btn-secondary" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
            </EditItemTemplate>
            
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td><%= Resources.DefaultResource.DataNotFound %></td></tr></table></EmptyDataTemplate><InsertItemTemplate>
                <tr style="">
                    <td colspan="8">
                        <div class="kt-portlet">
                            <div class="kt-portlet__head">
                                <div class="kt-portlet__head-label">
                                    <h3 class="kt-portlet__head-title">
                                        <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, NewRecord%>" />
                                    </h3>
                                </div>
                            </div>

                            <!--begin::Form-->
                            <div class="kt-form kt-form--label-right">
                                <div class="kt-portlet__body">
                                    <div class="form-group row">
                                      <%--  <label for="qididlabel" class="col-2 col-form-label">
                                            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:DefaultResource, QidAutoNo%>" />
                                        </label>--%>
                                       <%-- <div class="col-4">
                                            <asp:TextBox ID="qididTextBox" runat="server" CssClass="form-control" Text='<%# Bind("qidid") %>'  Enabled ="false" />
                                           </div>--%>

                                        <label for="QidCodelabel" class="col-2 col-form-label">
                                            <asp:Literal ID="QidCodeLiteral1" runat="server" Text="<%$ Resources:DefaultResource, QidCode%>" />
                                        </label>
                                        <div class="col-4">
                                            <asp:TextBox ID="qidcodeTextBox" runat="server" CssClass="form-control" Text='<%# Bind("qidcode") %>' />
                                            <asp:RequiredFieldValidator ID="TitleArTextBoxRFV" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="qidcodeTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator></div><label for="qidDatelabel" class="col-2 col-form-label"><asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:DefaultResource, Date%>" />
                                        </label>
                                        <div class="col-4">
                                            <asp:TextBox ID="qidDateTextBox" runat="server" AutoComplete="Off"  CssClass="form-control date-picker " Text='<%# Bind("qidDate","{0: dd/MM/yyyy}")%>' />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorDate" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="qidDateTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator></div></div><div class="form-group row">
                                      
                                        <label for="BranchIdDropDownList" class="col-2 col-form-label"><asp:Literal ID="BranchIdLiteral" runat="server" Text="<%$ Resources:DefaultResource, BranchName%>" />
                                        </label>
                                        <div class="col-4">
                                            <asp:DropDownList ID="BranchIdDropDownList" runat="server" CssClass="form-control"
                                                AppendDataBoundItems="True" DataSourceID="Branches" DataTextField="BRANCHNAME" DataValueField="BRANCHCODE" Text='<%# Bind("BrachId") %>'>
                                               <%-- <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0" />--%>
                                            </asp:DropDownList>
                                            </div>
                                             <label for="EmpIdlabel" class="col-2 col-form-label">
                                            <asp:Literal ID="LiteralEmpId" runat="server" Text="<%$ Resources:DefaultResource, EmpNo%>" />
                                        </label>
                                        <div class="col-4">
                                            <asp:TextBox ID="TextBoxEmpId" runat="server" AutoComplete="Off" CssClass="form-control" Text='<%# Bind("EmpId") %>'  Enabled ="false"/>
                                          </div>
                                        

                                    </div>
                                   
                                     <div class="form-group row">
                                        <label for="Noteslabel" class="col-2 col-form-label">
                                            <asp:Literal ID="LiteralNotes" runat="server" Text="<%$ Resources:DefaultResource, Notes%>" />
                                        </label>
                                        <div class="col-10">
                                            <asp:TextBox ID="TextBoxNotes" runat="server" AutoComplete="Off" CssClass="form-control" Text='<%# Bind("Notes") %>' />
  
                                        </div>
                                        

                                    </div>
                                    
                                

                                       <%-- <div class="col-10">
                                            <span class="kt-switch kt-switch--lg kt-switch--icon">
                                                <label>
                                                    <asp:CheckBox ID="AllowDisplayCheckBox" runat="server" Checked='<%# Bind("ActiveFlag") %>' />
                                                    <span></span>
                                                </label>
                                            </span>
                                        </div>--%>
                                    </div>
                                <div class="kt-portlet__foot">
                                    <div class="kt-form__actions">
                                        <div class="row">
                                            <div class="col-2">
                                            </div>
                                            <div class="col-10">
                                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="<%$ Resources:DefaultResource, Insert%>" CssClass="btn btn-success" />
                                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="<%$ Resources:DefaultResource, Cancel%>" CssClass="btn btn-secondary" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </div>
                        </div>
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="GEIDLabel" runat="server" Text='<%# Eval("qidid") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("qidcode") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TitleArLabel" runat="server" Text='<%# Eval("qidDate","{0: dd/MM/yyyy}")  %>' />
                       
                    </td>
                   <%-- <td>
                        <asp:Label ID="TotalContractsLabel" runat="server" Text='<%# Eval("BRANCHName") %>' />
                    </td>--%>
                  
                 
                        <td class="text-center block-options">
                           <asp:LinkButton ID="EditLinkButton" runat="server" CommandName="Edit"  data-bs-toggle="kt-tooltip"
                            title="<%$ Resources:DefaultResource, Edite%>" CssClass="btn btn-sm btn-pill btn-icon btn-outline-primary btn-icon-md"
                            data-original-title="<%$ Resources:DefaultResource, Edite%>">
                                <i class="fa fa-edit"></i>
                        </asp:LinkButton>&nbsp <asp:LinkButton ID="DeleteLinkButton" runat="server" CommandName="Delete"  data-bs-toggle="kt-tooltip"
                            title="<%$ Resources:DefaultResource, Delete%>" CssClass="btn btn-pill btn-outline-danger btn-sm btn-icon" data-original-title="<%$ Resources:DefaultResource, Delete%>"
                            OnClientClick="javascript:if(!confirm('This action will delete the record and all related Records!')){return false;}">
                                <i class="la la-close"></i>
                        </asp:LinkButton>&nbsp <asp:LinkButton ID="ViewDetailsLinkButton" runat="server" CommandName="select"  data-bs-toggle="kt-tooltip" title="<%$ Resources:DefaultResource, ViewDetails%>" CommandArgument='<%# Eval("qidid") %>'
                                CssClass="btn btn-sm btn-icon btn-pill btn-outline-primary btn-icon-md">
                                <i class="la la-angle-down"></i>
                            </asp:LinkButton><%--     <asp:LinkButton ID="ViewDetailsLinkButton" runat="server" CommandName="select"  data-bs-toggle="kt-tooltip" title="<%$ Resources:DefaultResource, ViewDetails%>"
                                CssClass="btn btn-sm btn-icon btn-pill btn-outline-primary btn-icon-md">
                                <i class="la la-angle-down"></i>
                            </asp:LinkButton>&nbsp 
                              
                              <a href="ActivitiesList.aspx?ID=<%# Eval("STOREID") %>"  data-bs-toggle="kt-tooltip"
                                title="<%= Resources.DefaultResource.ViewDetails%>" class="btn btn-pill btn-outline-info btn-sm btn-icon"><i class="flaticon-map"></i></a>--%></td></tr></ItemTemplate>
            <LayoutTemplate>
                <table class="table table-striped table-bordered table-hover table-checkable">
                    <thead class="thead-dark">
                        <tr>
                            <th>
                                <asp:LinkButton ID="MagazineTitleLinkButton" runat="server" CommandArgument="QidAutoNo" CommandName="Sort" Text="<%$ Resources:DefaultResource, QidAutoNo%>" />
                            </th>
                            <th>
                                <asp:LinkButton ID="TitleLinkButton" runat="server" CommandArgument="QidCode" CommandName="Sort" Text="<%$ Resources:DefaultResource, QidCode%>" />
                            </th>
                            <th>
                                <asp:LinkButton ID="TitleArLinkButton" runat="server" CommandArgument="Date" CommandName="Sort" Text="<%$ Resources:DefaultResource, Date%>" />
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
             <SelectedItemTemplate>
                    <tr style="background-color: #ebedf2;">
                     
                        
                    <td>
                        <asp:Label ID="GEIDLabel" runat="server" Text='<%# Eval("qidid") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("qidcode") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TitleArLabel" runat="server" Text='<%# Eval("qidDate","{0: dd/MM/yyyy}")  %>' />
                       
                    </td>
                  <%--  <td>
                        <asp:Label ID="TotalContractsLabel" runat="server" Text='<%# Eval("BRANCHName") %>' />
                    </td>--%>
                  
                         <td class="text-center block-options">
                           <asp:LinkButton ID="EditLinkButton" runat="server" CommandName="Edit"  data-bs-toggle="kt-tooltip"
                            title="<%$ Resources:DefaultResource, Edite%>" CssClass="btn btn-sm btn-pill btn-icon btn-outline-primary btn-icon-md"
                            data-original-title="<%$ Resources:DefaultResource, Edite%>">
                                <i class="fa fa-edit"></i>
                        </asp:LinkButton>&nbsp <asp:LinkButton ID="DeleteLinkButton" runat="server" CommandName="Delete"  data-bs-toggle="kt-tooltip"
                            title="<%$ Resources:DefaultResource, Delete%>" CssClass="btn btn-pill btn-outline-danger btn-sm btn-icon" data-original-title="<%$ Resources:DefaultResource, Delete%>"
                            OnClientClick="javascript:if(!confirm('This action will delete the record and all related Records!')){return false;}">
                                <i class="la la-close"></i>
                        </asp:LinkButton>&nbsp <asp:LinkButton ID="ViewDetailsLinkButton" runat="server" CommandName="select"  data-bs-toggle="kt-tooltip" title="<%$ Resources:DefaultResource, ViewDetails%>"
                                CssClass="btn btn-sm btn-icon btn-pill btn-outline-primary btn-icon-md">
                                <i class="la la-angle-down"></i>
                            </asp:LinkButton><asp:Label ID="qidIDLabel" runat="server" Text='<%# Eval("qidid") %>' Visible="False"></asp:Label><asp:ListView ID="lv1" runat="server" >
                                   <ItemTemplate>
                                          <tr style="">
                                             <asp:TextBox ID="txtqidid" runat="server" Text='' Visible ="false"/>
                                             <asp:TextBox ID="txtEnterDate" runat="server" Text='' Visible ="false"/>
                                             <asp:TextBox ID="txtDetcode" runat="server"  Visible ="false"/>
                                               <td>
                                                      <asp:TextBox ID="txtFromValue" runat="server" />
                                                    </td>
                                              </tr>
                                       </ItemTemplate>
                             </asp:ListView>
                        </tr>
                 </SelectedItemTemplate>
        </asp:ListView>
        </div>
     <div  class="table-responsive col-8">
         <asp:ListView ID="ListViewQid" runat="server" DataKeyNames="QidID"  OnItemCommand="ListViewQid_ItemCommand" OnItemDataBound="lv_ItemDataBound" AutoGenerateColumns="false">
            
          <%--  <EmptyDataTemplate>  </EmptyDataTemplate>--%>
                <ItemTemplate>
                      <tr style="">
               
                 <asp:TextBox ID="txtqidid" runat="server" Text='<%# Eval("qidid") %>' Visible ="false"/>
                   <asp:TextBox ID="txtID" runat="server" Text='<%# Eval("ID") %>' Visible ="false"/>
                          
                 <asp:TextBox ID="txtEnterDate" runat="server" Text='<%# Eval("EnterDate") %>' Visible ="false"/>
                 <asp:TextBox ID="txtDetcode" runat="server" Text='<%# Eval("Detcode") %>' Visible ="false"/>
                  <td>
                     <asp:TextBox ID="txtFromValue" runat="server" Text='<%# Eval("FromValue") %>' /> </td>
                   
                   <td>
                     <asp:TextBox ID="txtToValue" runat="server" Text='<%# Eval("ToValue") %>' />  
                   </td>          
                    <td>
                    <asp:DropDownList ID="ddlACCOUNTID" runat="server" DataSourceID="AccountDS" DataTextField="accountname" DataValueField="AccountId"  Text='<%# Bind("ACCOUNTID") %>' >                     </asp:DropDownList>
                   </td>                   
                         <td>
                     <asp:TextBox ID="txtDescription" runat="server" Text='<%# Eval("Description") %>'  />
                   </td>        
                      <td>
                     <asp:DropDownList ID="ddlCostId" runat="server" DataSourceID="CostDS" DataTextField="costName"  DataValueField="costId" AppendDataBoundItems="true" Text='<%# Bind("CostId") %>'>
                         
                          <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value=""></asp:ListItem></asp:DropDownList></td><td class="text-center block-options">
                           <%--<asp:LinkButton ID="EditLinkButton" runat="server" CommandName="Edit"  data-bs-toggle="kt-tooltip"
                            title="<%$ Resources:DefaultResource, Edite%>" CssClass="btn btn-sm btn-pill btn-icon btn-outline-primary btn-icon-md"
                            data-original-title="<%$ Resources:DefaultResource, Edite%>">
                                <i class="fa fa-edit"></i>
                        </asp:LinkButton>&nbsp --%>
                              
                              <asp:LinkButton ID="DeleteLinkButton" runat="server" CommandName="Delete"  data-bs-toggle="kt-tooltip"
                            title="<%$ Resources:DefaultResource, Delete%>" CssClass="btn btn-pill btn-outline-danger btn-sm btn-icon" data-original-title="<%$ Resources:DefaultResource, Delete%>"
                            OnClientClick="javascript:if(!confirm('This action will delete the record and all related Records!')){return false;}">
                                <i class="la la-close"></i>
                        </asp:LinkButton>&nbsp <%--     <asp:LinkButton ID="ViewDetailsLinkButton" runat="server" CommandName="select"  data-bs-toggle="kt-tooltip" title="<%$ Resources:DefaultResource, ViewDetails%>"
                                CssClass="btn btn-sm btn-icon btn-pill btn-outline-primary btn-icon-md">
                                <i class="la la-angle-down"></i>
                            </asp:LinkButton>&nbsp 
                              
                              <a href="ActivitiesList.aspx?ID=<%# Eval("STOREID") %>"  data-bs-toggle="kt-tooltip"
                                title="<%= Resources.DefaultResource.ViewDetails%>" class="btn btn-pill btn-outline-info btn-sm btn-icon"><i class="flaticon-map"></i></a>--%></td></tr></ItemTemplate><LayoutTemplate>
                <table class="table table-striped table-bordered table-hover table-checkable">
                    <thead class="thead-dark">
                        <tr>
                            <th>
                                <asp:LinkButton ID="MagazineTitleLinkButton" runat="server" CommandArgument="STOREID" CommandName="Sort" Text="<%$ Resources:DefaultResource, AccountCredit %>" /></th>
                            <th>
                                <asp:LinkButton ID="TitleLinkButton" runat="server" CommandArgument="STORECODE" CommandName="Sort" Text="<%$ Resources:DefaultResource, AccountDebit %>" /></th>
                            <th>
                                <asp:LinkButton ID="AccountnamekButton" runat="server" CommandArgument="STORNAME" CommandName="Sort" Text="<%$ Resources:DefaultResource, AccountName %>" /></th>
                            <th>
                                <asp:LinkButton ID="NotesLinkButton" runat="server" CommandArgument="BRANCHCODE" CommandName="Sort" Text="<%$ Resources:DefaultResource, CardNotes %>" /></th>
                            
                              <th>
                                <asp:LinkButton ID="CostCenterLinkButton" runat="server" CommandArgument="BRANCHCODE" CommandName="Sort" Text="<%$ Resources:DefaultResource, CostCenter %>" /></th>

                        <th>
                                <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, Actions %>" /></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr style="">
                           
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
                                      <asp:LinkButton ID="AddQidDetLinkButton" runat="server" CssClass="btn btn-brand btn-elevate btn-icon-sm"  data-bs-toggle="tooltip"
                        title="<%$ Resources:DefaultResource, NewRecord%>" data-original-title="<%$ Resources:DefaultResource, NewRecord%>" OnClick="AddQidDetLinkButton_Click">
                        <i class="la la-plus"></i>
                        <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, NewRecord%>" />
                    </asp:LinkButton></div></td></tr></tfoot></table></LayoutTemplate></asp:ListView><asp:Button ID="SaveDataBtn" runat="server" Text="<%$ Resources:DefaultResource, Insert%>"  CssClass="btn btn-success" OnClick="SaveDataBtn_Click" />
     </div>

         
        <%-- <div class="col-10">
                                            <span class="kt-switch kt-switch--lg kt-switch--icon">
                                                <label>
                                                    <asp:CheckBox ID="AllowDisplayCheckBox" runat="server" Checked='<%# Bind("ActiveFlag") %>' />
                                                    <span></span>
                                                </label>
                                            </span>
                                        </div>--%></div>
                        
                        <asp:ObjectDataSource ID="QidsDS" runat="server"  SelectMethod="GetDataByParam" TypeName="NEWERPDataSetTableAdapters.qidsTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update"><DeleteParameters><asp:Parameter Name="Original_qidid" Type="Int64" /></DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="qidcode" Type="String" /><asp:Parameter Name="qidDate" Type="DateTime" /><asp:Parameter Name="description" Type="String" /><asp:Parameter Name="edit" Type="Boolean" /><asp:Parameter Name="recitetype" Type="Int32" DefaultValue="1" /><asp:Parameter Name="underupdate" Type="Boolean" /><asp:Parameter Name="name" Type="String" /><asp:Parameter Name="BrachId" Type="Int64" /><asp:Parameter Name="EmpId" Type="Int64" /><asp:Parameter Name="Notes" Type="String" /><asp:Parameter Name="Active" Type="Boolean" /><asp:Parameter Name="repeated" Type="Boolean" /><asp:Parameter Name="BankAccId" Type="Int64" /><asp:Parameter Name="ChequeNo" Type="String" /><asp:Parameter Name="InvId" Type="Int64" /><asp:Parameter Name="ReorderInvId" Type="Int64" /><asp:Parameter Name="PaymentType" Type="Boolean" /><asp:Parameter Name="PaymentTo" Type="String" /><asp:Parameter Name="QidSerial" Type="Int64" /></InsertParameters>
            <SelectParameters><asp:Parameter Name="StatDate" Type="DateTime" /><asp:Parameter Name="EndDate" Type="DateTime" /><asp:Parameter Name="recitetype" Type="Int32" DefaultValue="1" /></SelectParameters><UpdateParameters><asp:Parameter Name="qidcode" Type="String" /><asp:Parameter Name="qidDate" Type="DateTime" /><asp:Parameter Name="description" Type="String" /><asp:Parameter Name="edit" Type="Boolean" /><asp:Parameter Name="recitetype" Type="Int32" DefaultValue="1" /><asp:Parameter Name="underupdate" Type="Boolean" /><asp:Parameter Name="name" Type="String" /><asp:Parameter Name="BrachId" Type="Int64" /><asp:Parameter Name="EmpId" Type="Int64" /><asp:Parameter Name="Notes" Type="String" /><asp:Parameter Name="Active" Type="Boolean" /><asp:Parameter Name="repeated" Type="Boolean" /><asp:Parameter Name="BankAccId" Type="Int64" /><asp:Parameter Name="ChequeNo" Type="String" /><asp:Parameter Name="InvId" Type="Int64" /><asp:Parameter Name="ReorderInvId" Type="Int64" /><asp:Parameter Name="PaymentType" Type="Boolean" /><asp:Parameter Name="PaymentTo" Type="String" /><asp:Parameter Name="QidSerial" Type="Int64" /><asp:Parameter Name="Original_qidid" Type="Int64" /></UpdateParameters></asp:ObjectDataSource>

    <asp:TextBox ID="txtOrgId" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1"></asp:TextBox><asp:ObjectDataSource ID="Branches" runat="server" OldValuesParameterFormatString="original_{0}"  SelectMethod="GetData" TypeName="NEWERPDataSetTableAdapters.BRANCHESTableAdapter"></asp:ObjectDataSource>

    <asp:TextBox ID="txtFromValue" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1"></asp:TextBox><asp:TextBox ID="txtAccountId" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1"></asp:TextBox><asp:HiddenField ID="txtQidId" runat="server" Value="1" /><asp:TextBox ID="txtToValue" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1"></asp:TextBox><asp:TextBox ID="txtCostId" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1"></asp:TextBox><asp:TextBox ID="txtDesc" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1" Height="22px"></asp:TextBox><asp:TextBox ID="txtId" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1" Height="22px"></asp:TextBox><asp:TextBox ID="txtEnterDate" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1" Height="22px"></asp:TextBox></div></div><asp:ObjectDataSource ID="QidsDetsDS" runat="server"  SelectMethod="GetDataById" TypeName="NEWERPDataSetTableAdapters.qidsDetailsTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update" OldValuesParameterFormatString="original_{0}"><DeleteParameters><asp:Parameter Name="Original_ID" Type="Int64" /></DeleteParameters><InsertParameters><asp:ControlParameter ControlID="txtQidId" Name="qidid" PropertyName="Value" Type="Int64" /><asp:ControlParameter ControlID="txtFromValue" Name="FromValue" PropertyName="Text" Type="Decimal" /><asp:ControlParameter ControlID="txtToValue" Name="ToValue" PropertyName="Text" Type="Decimal" /><asp:ControlParameter ControlID="txtAccountId" Name="ACCOUNTID" PropertyName="Text" Type="Int64" /><asp:Parameter Name="type" Type="Int16" DefaultValue="1" /><asp:ControlParameter ControlID="txtDesc" DefaultValue="" Name="Description" PropertyName="Text" Type="String" /><asp:ControlParameter ControlID="txtEnterDate" Name="EnterDate" PropertyName="Text" Type="DateTime" /><asp:Parameter Name="Detcode" Type="Int32" /><asp:Parameter Name="QidType" Type="Int32" DefaultValue="1" /><asp:Parameter Name="TotalPrice" Type="Decimal" DefaultValue="" /><asp:Parameter Name="ActionType" Type="Int32" /><asp:ControlParameter ControlID="txtCostId" Name="CostId" PropertyName="Text" Type="Int64" /><asp:Parameter Name="Machineid" Type="Int64" /></InsertParameters><SelectParameters><asp:ControlParameter ControlID="txtQidId" Name="QidId" PropertyName="Value" Type="Int64" /></SelectParameters><UpdateParameters><asp:ControlParameter ControlID="txtQidId" Name="qidid" PropertyName="Value" Type="Int64" /><asp:ControlParameter ControlID="txtFromValue" Name="FromValue" PropertyName="Text" Type="Decimal" /><asp:ControlParameter ControlID="txtToValue" Name="ToValue" PropertyName="Text" Type="Decimal" /><asp:ControlParameter ControlID="txtAccountId" Name="ACCOUNTID" PropertyName="Text" Type="Int64" /><asp:Parameter Name="type" Type="Int16" /><asp:ControlParameter ControlID="txtDesc" DefaultValue="" Name="Description" PropertyName="Text" Type="String" /><asp:ControlParameter ControlID="txtEnterDate" Name="EnterDate" PropertyName="Text" Type="DateTime" /><asp:Parameter Name="Detcode" Type="Int32" /><asp:Parameter Name="QidType" Type="Int32" DefaultValue="1" /><asp:Parameter Name="TotalPrice" Type="Decimal" /><asp:Parameter Name="ActionType" Type="Int32" /><asp:ControlParameter ControlID="txtCostId" Name="CostId" PropertyName="Text" Type="Int64" /><asp:Parameter Name="Machineid" Type="Int64" /><asp:ControlParameter ControlID="txtId" Name="Original_ID" PropertyName="Text" Type="Int64" /></UpdateParameters></asp:ObjectDataSource>

    <asp:ObjectDataSource ID="AccountDS" runat="server" OldValuesParameterFormatString="original_{0}"  SelectMethod="GetDataByMainNode" TypeName="NEWERPDataSetTableAdapters.accountingTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update"><DeleteParameters><asp:Parameter Name="Original_accountid" Type="Int64" /></DeleteParameters><InsertParameters><asp:Parameter Name="AccountCode" Type="String" /><asp:Parameter Name="accountname" Type="String" /><asp:Parameter Name="AccountSName" Type="String" /><asp:Parameter Name="AccountparentId" Type="Int64" /><asp:Parameter Name="root" Type="Boolean" /><asp:Parameter Name="Totalfromvalue" Type="Decimal" /><asp:Parameter Name="Totaltovalue" Type="Decimal" /><asp:Parameter Name="notes" Type="String" /><asp:Parameter Name="startbalancefrom" Type="Double" /><asp:Parameter Name="startdate" Type="DateTime" /><asp:Parameter Name="startbalanceto" Type="Double" /><asp:Parameter Name="balance" Type="Boolean" /><asp:Parameter Name="accountType" Type="Int32" /><asp:Parameter Name="ClosedTo" Type="Int64" /><asp:Parameter Name="MainNode" Type="Boolean" /><asp:Parameter Name="ProcessFlag" Type="Boolean" /><asp:Parameter Name="display_Flag" Type="Boolean" /><asp:Parameter Name="AccLevel" Type="Int32" /><asp:Parameter Name="MainParentAccId" Type="Int64" /><asp:Parameter Name="LastSerialNo" Type="String" /><asp:Parameter Name="CurId" Type="Int64" /><asp:Parameter Name="OrgId" Type="Int64" /></InsertParameters><UpdateParameters><asp:Parameter Name="AccountCode" Type="String" /><asp:Parameter Name="accountname" Type="String" /><asp:Parameter Name="AccountSName" Type="String" /><asp:Parameter Name="AccountparentId" Type="Int64" /><asp:Parameter Name="root" Type="Boolean" /><asp:Parameter Name="Totalfromvalue" Type="Decimal" /><asp:Parameter Name="Totaltovalue" Type="Decimal" /><asp:Parameter Name="notes" Type="String" /><asp:Parameter Name="startbalancefrom" Type="Double" /><asp:Parameter Name="startdate" Type="DateTime" /><asp:Parameter Name="startbalanceto" Type="Double" /><asp:Parameter Name="balance" Type="Boolean" /><asp:Parameter Name="accountType" Type="Int32" /><asp:Parameter Name="ClosedTo" Type="Int64" /><asp:Parameter Name="MainNode" Type="Boolean" /><asp:Parameter Name="ProcessFlag" Type="Boolean" /><asp:Parameter Name="display_Flag" Type="Boolean" /><asp:Parameter Name="AccLevel" Type="Int32" /><asp:Parameter Name="MainParentAccId" Type="Int64" /><asp:Parameter Name="LastSerialNo" Type="String" /><asp:Parameter Name="CurId" Type="Int64" /><asp:Parameter Name="OrgId" Type="Int64" /><asp:Parameter Name="Original_accountid" Type="Int64" /></UpdateParameters></asp:ObjectDataSource>

    

    <asp:ObjectDataSource ID="CostDS" runat="server" OldValuesParameterFormatString="original_{0}"  SelectMethod="GetDataByMain" TypeName="NEWERPDataSetTableAdapters.CostCentersTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update"><DeleteParameters><asp:Parameter Name="Original_costid" Type="Int64" /><asp:Parameter Name="Original_costName" Type="String" /><asp:Parameter Name="Original_costCode" Type="String" /><asp:Parameter Name="Original_costSName" Type="String" /><asp:Parameter Name="Original_costparentId" Type="Int32" /><asp:Parameter Name="Original_root" Type="Boolean" /><asp:Parameter Name="Original_Totalfromvalue" Type="Decimal" /><asp:Parameter Name="Original_Totaltovalue" Type="Decimal" /><asp:Parameter Name="Original_startbalancefrom" Type="Double" /><asp:Parameter Name="Original_startdate" Type="DateTime" /><asp:Parameter Name="Original_startbalanceto" Type="Double" /><asp:Parameter Name="Original_balance" Type="Boolean" /><asp:Parameter Name="Original_costType" Type="Int32" /><asp:Parameter Name="Original_ClosedTo" Type="Int64" /><asp:Parameter Name="Original_MainNode" Type="Boolean" /><asp:Parameter Name="Original_ProcessFlag" Type="Boolean" /><asp:Parameter Name="Original_display_Flag" Type="Boolean" /><asp:Parameter Name="Original_LastSerialNo" Type="String" /><asp:Parameter Name="Original_AccLevel" Type="Int32" /><asp:Parameter Name="Original_MainParentAccId" Type="Int64" /></DeleteParameters><InsertParameters><asp:Parameter Name="costName" Type="String" /><asp:Parameter Name="costCode" Type="String" /><asp:Parameter Name="costSName" Type="String" /><asp:Parameter Name="costparentId" Type="Int32" /><asp:Parameter Name="root" Type="Boolean" /><asp:Parameter Name="Totalfromvalue" Type="Decimal" /><asp:Parameter Name="Totaltovalue" Type="Decimal" /><asp:Parameter Name="notes" Type="String" /><asp:Parameter Name="startbalancefrom" Type="Double" /><asp:Parameter Name="startdate" Type="DateTime" /><asp:Parameter Name="startbalanceto" Type="Double" /><asp:Parameter Name="balance" Type="Boolean" /><asp:Parameter Name="costType" Type="Int32" /><asp:Parameter Name="ClosedTo" Type="Int64" /><asp:Parameter Name="MainNode" Type="Boolean" /><asp:Parameter Name="ProcessFlag" Type="Boolean" /><asp:Parameter Name="display_Flag" Type="Boolean" /><asp:Parameter Name="LastSerialNo" Type="String" /><asp:Parameter Name="AccLevel" Type="Int32" /><asp:Parameter Name="MainParentAccId" Type="Int64" /></InsertParameters><UpdateParameters><asp:Parameter Name="costName" Type="String" /><asp:Parameter Name="costCode" Type="String" /><asp:Parameter Name="costSName" Type="String" /><asp:Parameter Name="costparentId" Type="Int32" /><asp:Parameter Name="root" Type="Boolean" /><asp:Parameter Name="Totalfromvalue" Type="Decimal" /><asp:Parameter Name="Totaltovalue" Type="Decimal" /><asp:Parameter Name="notes" Type="String" /><asp:Parameter Name="startbalancefrom" Type="Double" /><asp:Parameter Name="startdate" Type="DateTime" /><asp:Parameter Name="startbalanceto" Type="Double" /><asp:Parameter Name="balance" Type="Boolean" /><asp:Parameter Name="costType" Type="Int32" /><asp:Parameter Name="ClosedTo" Type="Int64" /><asp:Parameter Name="MainNode" Type="Boolean" /><asp:Parameter Name="ProcessFlag" Type="Boolean" /><asp:Parameter Name="display_Flag" Type="Boolean" /><asp:Parameter Name="LastSerialNo" Type="String" /><asp:Parameter Name="AccLevel" Type="Int32" /><asp:Parameter Name="MainParentAccId" Type="Int64" /><asp:Parameter Name="Original_costid" Type="Int64" /><asp:Parameter Name="Original_costName" Type="String" /><asp:Parameter Name="Original_costCode" Type="String" /><asp:Parameter Name="Original_costSName" Type="String" /><asp:Parameter Name="Original_costparentId" Type="Int32" /><asp:Parameter Name="Original_root" Type="Boolean" /><asp:Parameter Name="Original_Totalfromvalue" Type="Decimal" /><asp:Parameter Name="Original_Totaltovalue" Type="Decimal" /><asp:Parameter Name="Original_startbalancefrom" Type="Double" /><asp:Parameter Name="Original_startdate" Type="DateTime" /><asp:Parameter Name="Original_startbalanceto" Type="Double" /><asp:Parameter Name="Original_balance" Type="Boolean" /><asp:Parameter Name="Original_costType" Type="Int32" /><asp:Parameter Name="Original_ClosedTo" Type="Int64" /><asp:Parameter Name="Original_MainNode" Type="Boolean" /><asp:Parameter Name="Original_ProcessFlag" Type="Boolean" /><asp:Parameter Name="Original_display_Flag" Type="Boolean" /><asp:Parameter Name="Original_LastSerialNo" Type="String" /><asp:Parameter Name="Original_AccLevel" Type="Int32" /><asp:Parameter Name="Original_MainParentAccId" Type="Int64" /></UpdateParameters></asp:ObjectDataSource>

    

    