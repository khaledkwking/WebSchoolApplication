<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StockList.ascx.cs" Inherits="WebSchool.Controls.Items.StockList" %>
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
                <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, Inventory%>" />
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
                    <div class="col-lg-2">
                        <div class="kt-input-icon kt-input-icon--pill kt-input-icon--right">
                            <asp:TextBox ID="SearchTextBox" runat="server" CssClass="form-control "></asp:TextBox>
                            <span class="kt-input-icon__icon kt-input-icon__icon--right"><span><i class="la la-puzzle-piece"></i></span></span>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="kt-input-icon kt-input-icon--pill kt-input-icon--right">
                            <asp:DropDownList ID="InventoryDropDownList" runat="server" CssClass="form-control" AppendDataBoundItems="true"
                                DataSourceID="InventoryDS" DataTextField="STORNAME" DataValueField="STOREID" AutoPostBack="True" OnSelectedIndexChanged="InventoryDropDownList_SelectedIndexChanged">
                                <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value=""></asp:ListItem>
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="InventoryDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByOrgId" TypeName="NEWERPDataSetTableAdapters.STORESTableAdapter">
                                <SelectParameters>
                                    <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
                                </SelectParameters>
     

                            </asp:ObjectDataSource>
                            <span class="kt-input-icon__icon kt-input-icon__icon--right"><span><i class="la la-list"></i></span></span>
                        </div>
                    </div>
                     <div class="col-lg-2">
                        <div class="kt-input-icon kt-input-icon--pill kt-input-icon--right">
                            <asp:DropDownList ID="DropDownListProduct" runat="server" CssClass="form-control" AppendDataBoundItems="true"
                                    DataSourceID="ProductsDS" DataTextField="productname" DataValueField="PRODUCTID" AutoPostBack="True">
                                <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value=""></asp:ListItem>
                            </asp:DropDownList>
                        
                            <span class="kt-input-icon__icon kt-input-icon__icon--right"><span><i class="la la-list"></i></span></span>
                        </div>
                    </div>
                    <%--<div class="col-lg-2">
                        <div class="kt-input-icon kt-input-icon--pill kt-input-icon--right">
                            <asp:TextBox ID="StartDateTextBox" CssClass="form-control date-picker" AutoCompleteType="Disabled" runat="server" placeholder="<%$ Resources:DefaultResource, FromDateTitle%>" data-date-format="dd/mm/yyyy"></asp:TextBox>
                            <span class="kt-input-icon__icon kt-input-icon__icon--right"><span><i class="la la-calendar-check-o"></i></span></span>
                        </div>
                    </div>--%><%--  <div class="col-lg-2">
                        <div class="kt-input-icon kt-input-icon--pill kt-input-icon--right">
                            <asp:TextBox ID="EndDateTextBox" CssClass="form-control date-picker" AutoCompleteType="Disabled" runat="server" placeholder="<%$ Resources:DefaultResource, ToDateTitle%>" data-date-format="dd/mm/yyyy"></asp:TextBox>
                            <span class="kt-input-icon__icon kt-input-icon__icon--right"><span><i class="la la-calendar-check-o"></i></span></span>
                        </div>
                    </div>--%>

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
                <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, Inventory%>" />
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
  <div class='<%= HiddenFieldTab3.Value %>' id="Stock" role="tabpanel" aria-labelledby="Stock-tab" runat="server">
      <asp:ListView runat="server" ID="lv" DataKeyNames="StockId" DataSourceID="StockDS" OnItemCommand="lv_ItemCommand" OnDataBound="lv_DataBound" OnItemDataBound="lv_ItemDataBound">
          <EditItemTemplate>
                <tr>
                    <td colspan="12">
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
                                    <asp:TextBox ID="TextBoxPRODUCTID" runat="server" CssClass="form-control" Text='<%# Bind("PRODUCTID") %>'  Visible="false" />
                                   <asp:TextBox ID="TextBoxSTOREID" runat="server" CssClass="form-control" Text='<%# Bind("STOREID") %>'  Visible="false" />
                                    <asp:TextBox ID="TextBoxUnitID" runat="server" CssClass="form-control" Text='<%# Bind("UnitID") %>'  Visible="false" />

                                     <div class="form-group row">
                                        <label for="PRODUCTCODETextBox" class="col-2 col-form-label">
                                            <asp:Literal ID="PRODUCTCODELiteral" runat="server" Text="<%$ Resources:DefaultResource, PRODUCTCODE%>" />
                                        </label>
                                        <div class="col-4">
                                            <%-- <asp:TextBox ID="TextBoxPRODUCTCODE" runat="server" CssClass="form-control" Text='<%# Bind("PRODUCTCODE") %>' />--%>
                                            <asp:DropDownList ID="ProductCodeDropDownList" runat="server" CssClass="form-control"
                                                AppendDataBoundItems="True" DataSourceID="ProductsDS" DataTextField="PRODUCTCODE" DataValueField="PRODUCTID" Text='<%# Bind("PRODUCTID") %>' Enabled="False">
                                                <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0" />
                                            </asp:DropDownList>
                                              </div>

                                          <label for="productnameTextBox" class="col-2 col-form-label">
                                            <asp:Literal ID="productnameLiteral" runat="server" Text="<%$ Resources:DefaultResource, productname%>" />
                                        </label>
                                        <div class="col-4">
                                              <asp:DropDownList ID="ProductNameDropDownList" runat="server" CssClass="form-control"
                                                AppendDataBoundItems="True" DataSourceID="ProductsDS" DataTextField="productname" DataValueField="PRODUCTID" Text='<%# Bind("PRODUCTID") %>' Enabled="False">
                                                <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0" />
                                            </asp:DropDownList>
                                           <%-- <asp:TextBox ID="TextBoxproductname" runat="server" CssClass="form-control" Text='<%# Bind("productname") %>' />--%>
                                             </div>
                                    </div>

<%--                                    <div class="form-group row">

                                        <label for="UintIdTextBox" class="col-2 col-form-label">
                                            <asp:Literal ID="UintIdLiteral" runat="server" Text="<%$ Resources:DefaultResource, Unit%>" />
                                        </label>
                                        <div class="col-10">
                                            <asp:DropDownList ID="UnitsDropDownList" runat="server" CssClass="form-control"
                                                AppendDataBoundItems="True" DataTextField="UNITDESC" DataValueField="UINTID" DataSourceID="ProductUnits" Text='<%# Bind("UintId") %>'>
                                                <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0" />
                                            </asp:DropDownList>
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidatorUnits" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="UnitsDropDownList"  InitialValue="0"  ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator></div>

                                                          </div>--%>
                                  
                                     <div class="form-group row">
                                        <label for="BarcodeTextBox" class="col-2 col-form-label">
                                            <asp:Literal ID="STORNAMELiteral" runat="server" Text="<%$ Resources:DefaultResource, InventoryName%>" />
                                        </label>
                                        <div class="col-4">
                                           <%--  <asp:TextBox ID="TextSTORNAME" runat="server" CssClass="form-control" Text='<%# Bind("STORNAME") %>' />--%>
                                            <asp:DropDownList ID="DropDownListInventory" runat="server" CssClass="form-control"
                                                AppendDataBoundItems="True" DataSourceID="InventoryDS" DataTextField="STORNAME" DataValueField="STOREID" Text='<%# Bind("STOREID") %>' Enabled="False">
                                                <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0" />
                                            </asp:DropDownList>
                                              </div>
                                         <label for="UNITDESClabel" class="col-2 col-form-label">
                                                <asp:Literal ID="UNITDESCLiteral" runat="server" Text="<%$ Resources:DefaultResource, Unit%>" />
                                            </label>
                                            <div class="col-4">
                                                <asp:DropDownList ID="DropDownListUnit" runat="server" CssClass="form-control"
                                                    AppendDataBoundItems="True" DataSourceID="UnitsDS" DataTextField="UNITDESC" DataValueField="UINTID" Text='<%# Bind("UnitID") %>' Enabled="False">
                                                <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0" />
                                            </asp:DropDownList>
                                            </div>

                                    </div>
                                  
                                    <div class="form-group row">
                                            <label for="InStorelabel" class="col-2 col-form-label">
                                                <asp:Literal ID="LiteralInStore" runat="server" Text="<%$ Resources:DefaultResource, StartQuantity%>" />
                                            </label>
                                            <div class="col-4">
                                             <asp:TextBox ID="TextBoxInStore" runat="server" CssClass="form-control" Text='<%# Bind("QtyInStore") %>' />
                                            </div>

                                          <label for="QUANTITYlabel" class="col-2 col-form-label">
                                                <asp:Literal ID="LiteralQUANTITY" runat="server" Text="<%$ Resources:DefaultResource, CurrentQuantity%>" />
                                            </label>
                                            <div class="col-4">
                                             <asp:TextBox ID="TextBoxQUANTITY" runat="server" CssClass="form-control" Text='<%# Bind("QUANTITY") %>' />
                                            </div>
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
                        <td><%= Resources.DefaultResource.DataNotFound %></td></tr></table></EmptyDataTemplate><%--   <InsertItemTemplate>
                <tr>
                    <td colspan="12">
                        <div class="kt-portlet">
                      
                            <!--begin::Form-->
                            <div class="kt-form kt-form--label-right">
                                <div class="kt-portlet__body">
                                     
                                    <div class="form-group row">
                                        <label for="BarcodeTextBox" class="col-2 col-form-label">
                                            <asp:Literal ID="BarcodeLiteral" runat="server" Text="<%$ Resources:DefaultResource, Barcode%>" />
                                        </label>
                                        <div class="col-10">
                                             <asp:TextBox ID="TextBoxCode" runat="server" CssClass="form-control" Text='<%# Bind("PRODUCTBRAND") %>' />
                                          
                                              </div></div><div class="form-group row">

                                        <label for="UintIdTextBox" class="col-2 col-form-label">
                                            <asp:Literal ID="UintIdLiteral" runat="server" Text="<%$ Resources:DefaultResource, Unit%>" />
                                        </label>
                                        <div class="col-10">
                                            <asp:DropDownList ID="UnitsDropDownList" runat="server" CssClass="form-control"
                                                AppendDataBoundItems="True" DataTextField="UNITDESC" DataValueField="UINTID" DataSourceID="ProductUnits" Text='<%# Bind("UintId") %>'>
                                                <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0" />
                                            </asp:DropDownList>
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidatorUnits" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="UnitsDropDownList"  InitialValue="0"  ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator></div></div><div class="form-group row">
                                        <label for="NameTextBox" class="col-2 col-form-label">
                                            <asp:Literal ID="MainUnitLiteral" runat="server" Text="<%$ Resources:DefaultResource, MainUint%>" />
                                        </label>
                                        <div class="col-10">
                                             <asp:CheckBox ID="MainUnitCheckBox" runat="server"  Checked='<%# Bind("MainUnit") %>'/>
                                             </div>

                                    </div>
                                   
                                   
                                   
                                   
                                </div>
                                <div class="kt-portlet__foot">
                                    <div class="kt-form__actions">
                                        <div class="row">
                                            <div class="col-2">
                                            </div>
                                            <div class="col-10">
                                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="<%$ Resources:DefaultResource, Insert%>" CssClass="btn btn-success"  ValidationGroup="DML" />
                                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="<%$ Resources:DefaultResource, Cancel%>" CssClass="btn btn-secondary" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
            </InsertItemTemplate>--%><ItemTemplate>
                <tr>
                 <td>
                          <asp:label ID="SortOrderTxt" runat="server" Text='<%#Container.DisplayIndex+1 %>' SkinID="sort" />
                  </td>
                    <td style ="display:none">
                        <%# Eval("StockId") %>
                    </td>
                    <td >
                       
                        <%# Eval("PRODUCTCODE") %>
                       <%-- <asp:DropDownList ID="DropDownListPRODUCTCODE" runat="server" DataSourceID="ProductsDS" DataTextField="PRODUCTCODE" DataValueField='<%# Bind("PRODUCTID") %>' ></asp:DropDownList>--%>
                    </td>
                    
                    <td >
                        <%# Eval("productname") %>
                
                    </td>
                    <td >
                        <%# Eval("STORNAME") %>
                

                    </td>
                    <td>
                        <%--<%# Eval("MonthlyDate","{0: dd-MMM-yyyy}") %>--%>
                          <%# Eval("UNITDESC")  %>
                    </td>
                    <td>
                        <%--<%# Eval("MonthlyDate","{0: dd-MMM-yyyy}") %>--%>
                          <%# Eval("QtyInStore")  %>
                    </td>
                    
                 <td>
                        <%--<%# Eval("MonthlyDate","{0: dd-MMM-yyyy}") %>--%>
                          <%# Eval("QUANTITY")  %>
                    </td>
                    
                    <td class="text-center block-options">

                        <asp:LinkButton ID="EditLinkButton" runat="server" CommandName="Edit" data-toggle="kt-tooltip" title="<%$ Resources:DefaultResource, Edite%>" CssClass="btn btn-sm btn-icon btn-outline-primary btn-icon-md">
                                <i class="fa fa-edit"></i>
                        </asp:LinkButton><asp:LinkButton ID="DeleteLinkButton" runat="server" CommandName="Delete" data-toggle="kt-tooltip" title="<%$ Resources:DefaultResource, Delete%>" CssClass="btn btn-outline-danger btn-sm btn-icon"
                            OnClientClick="javascript:if(!confirm('This action will delete the record and all related Records!')){return false;}">
                                <i class="la la-close"></i>
                        </asp:LinkButton></td></tr></ItemTemplate><LayoutTemplate>
                <table class="table table-striped table-bordered table-hover table-checkable">
                    <thead class="thead-dark">
                        <tr>
                            <th>
                                <asp:LinkButton ID="NoLinkButton" runat="server" CommandArgument="" CommandName="Sort" Text="<%$ Resources:DefaultResource, No%>" />
                            </th>
                           <%-- <th>
                                <asp:LinkButton ID="IdLinkButton" runat="server" CommandArgument="SUP_CUST_ID" CommandName="Sort" Text="<%$ Resources:DefaultResource, Id%>" />
                            </th>--%>
                            <th>
                                <asp:LinkButton ID="CodeLinkButton" runat="server" CommandArgument="ProductCode" CommandName="Sort" Text="<%$ Resources:DefaultResource, ProductCode%>" />
                            </th>
                             <th>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument="ProductName" CommandName="Sort" Text="<%$ Resources:DefaultResource, ProductName%>" />
                            </th>
                            <th>
                                <asp:LinkButton ID="NameButton" runat="server" CommandArgument="InventoryName" CommandName="Sort" Text="<%$ Resources:DefaultResource, InventoryName%>" />
                            </th>
                            <th>
                                <asp:LinkButton ID="PhoneButton" runat="server" CommandArgument="Unit" CommandName="Sort" Text="<%$ Resources:DefaultResource, Unit%>" />
                            </th>
                             
                              <th>
                                <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument="QtyInStore" CommandName="Sort" Text="<%$ Resources:DefaultResource, StartQuantity%>" />
                            </th>
                             <th>
                                <asp:LinkButton ID="LinkButton4" runat="server" CommandArgument="QUANTITY" CommandName="Sort" Text="<%$ Resources:DefaultResource, CurrentQuantity%>" />
                            </th>
                            <th>
                                <asp:LinkButton ID="ActionsLinkButton" runat="server" CommandName="Sort" Text="<%$ Resources:DefaultResource, Actions%>" />
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr id="itemPlaceholder" runat="server">
                        </tr>
                    </tbody>
                </table>
            </LayoutTemplate>
        </asp:ListView>
  </div>
        <asp:ObjectDataSource ID="ProductsDS" runat="server"  SelectMethod="GetData" TypeName="NEWERPDataSetTableAdapters.PRODUCTSTableAdapter" OldValuesParameterFormatString="original_{0}"></asp:ObjectDataSource>

    <asp:TextBox ID="txtOrgId" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1"></asp:TextBox></div></div><asp:ObjectDataSource ID="StockDS" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataByByParam" TypeName="NEWERPDataSetTableAdapters.STOCKTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update" ><DeleteParameters><asp:Parameter Name="Original_StockId" Type="Int64" /></DeleteParameters><InsertParameters><asp:Parameter Name="STOREID" Type="Int64" /><asp:Parameter Name="PRODUCTID" Type="Int64" /><asp:Parameter Name="UnitID" Type="Int64" /><asp:Parameter Name="QUANTITY" Type="Double" /><asp:Parameter Name="MovmentQty" Type="Double" /><asp:Parameter Name="MaxQty" Type="Double" /><asp:Parameter Name="visitationQty" Type="Double" /><asp:Parameter Name="Related" Type="Boolean" /><asp:Parameter Name="OrderQTY" Type="Double" /><asp:Parameter Name="QtyInStore" Type="Double" /><asp:Parameter Name="QtyINRoad" Type="Double" /><asp:Parameter Name="QtynotAmount" Type="Double" /><asp:Parameter Name="QtyNotProchuse" Type="Double" /><asp:Parameter Name="QtyNotCost" Type="Double" /><asp:Parameter Name="QtyNotSale" Type="Double" /></InsertParameters><SelectParameters><asp:ControlParameter ControlID="InventoryDropDownList" Name="STOREID" PropertyName="SelectedValue" Type="Int64" /><asp:ControlParameter ControlID="DropDownListProduct" Name="PRODUCTID" PropertyName="SelectedValue" Type="Int64" /><asp:ControlParameter ControlID="SearchTextBox" Name="searchParam" PropertyName="Text" Type="String" /></SelectParameters><UpdateParameters><asp:Parameter Name="STOREID" Type="Int64" /><asp:Parameter Name="PRODUCTID" Type="Int64" /><asp:Parameter Name="UnitID" Type="Int64" /><asp:Parameter Name="QUANTITY" Type="Double" /><asp:Parameter Name="MovmentQty" Type="Double" /><asp:Parameter Name="MaxQty" Type="Double" /><asp:Parameter Name="visitationQty" Type="Double" /><asp:Parameter Name="Related" Type="Boolean" /><asp:Parameter Name="OrderQTY" Type="Double" /><asp:Parameter Name="QtyInStore" Type="Double" /><asp:Parameter Name="QtyINRoad" Type="Double" /><asp:Parameter Name="QtynotAmount" Type="Double" /><asp:Parameter Name="QtyNotProchuse" Type="Double" /><asp:Parameter Name="QtyNotCost" Type="Double" /><asp:Parameter Name="QtyNotSale" Type="Double" /><asp:Parameter Name="Original_StockId" Type="Int64" /><asp:Parameter Name="StockId" Type="Int64" /></UpdateParameters></asp:ObjectDataSource>

            <asp:ObjectDataSource ID="UnitsDS" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="NEWERPDataSetTableAdapters.CDE_UNIT_TYPESTableAdapter" ></asp:ObjectDataSource>

            