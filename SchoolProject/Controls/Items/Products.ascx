<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Products.ascx.cs" Inherits="WebSchool.Controls.Items.Products" %>
     

<ul class="breadcrumb breadcrumb-top">
    <li><a href="default.aspx"><%= Resources.DefaultResource.Main%> </a></li>
    <li> <%= Resources.DefaultResource.ProductTree%> </li>
</ul>


<div class="block table-responsive-lg">
    <!-- Table Styles Title -->
    <div class="block-title">
        <h2><strong><%= Resources.DefaultResource.List%>  </strong> <%= Resources.DefaultResource.ProductTree%> </h2>
        <div class="block-options pull-right">
           <%-- <asp:LinkButton ID="NewRecord" runat="server" CssClass="btn btn-sm btn-success" data-toggle="tooltip" title="<%$ Resources:DefaultResource, NewRecord%>"  data-original-title="<%$ Resources:DefaultResource, NewRecord%>" OnClick="NewRecord_Click">
                <i class="fa fa-file"></i>
            </asp:LinkButton>--%>
        </div>
    </div>
    <!-- END Table Styles Title -->
     <div id="ErrorDiv" runat="server"></div>
    <div class="gallery gallery-widget" data-toggle="lightbox-gallery">

                    <div class="row">
                     <div class="col-lg-6 ">
               <div class="block">
          <!-- General Data Title -->
        <div class="block-title">
            <h2><i class="fa fa-pencil"></i> <strong><asp:Literal runat="server" Text="<%$ Resources:DefaultResource, ProductData%>" /></strong> </h2>
        </div>
                 <%--<div class ="table-responsive">--%>
                
 <div id="Tabs" role="tabpanel">
<ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item" id ="HomeTab"  runat="server">
      <%-- aria-selected="true"--%>     <%-- <a class="nav-link" id="home-tab"  data-bs-toggle="tab" href="#home" role="tab" aria-controls="home" ><%= Resources.DefaultResource.BasicData%>  </a>--%>
      <asp:LinkButton ID="LinkButtonHome" runat="server"    CssClass="nav-link"  OnClick="LinkButtonHome_Click"> <%= Resources.DefaultResource.BasicData%></asp:LinkButton>
  </li>
  <li class="nav-item" id ="PriceTab" runat="server">
       <%-- <a class="nav-link" id="profile-tab"  data-bs-toggle="tab" href="#profile" role="tab" aria-controls="profile" ><%= Resources.DefaultResource.PriceData%></a>--%>
      <asp:LinkButton ID="LinkButtonPrice" runat="server"    CssClass="nav-link"  OnClick="LinkButtonPrice_Click"> <%= Resources.DefaultResource.PriceData%></asp:LinkButton>
  </li>
   <li class="nav-item" id ="StockTab" runat="server">
       <%-- <a class="nav-link" id="profile-tab"  data-bs-toggle="tab" href="#profile" role="tab" aria-controls="profile" ><%= Resources.DefaultResource.PriceData%></a>--%>
      <asp:LinkButton ID="LinkButtonQty" runat="server"    CssClass="nav-link" OnClick="LinkButtonQty_Click"  > <%= Resources.DefaultResource.InventoryStock%></asp:LinkButton>
  </li>
       <%--<li class="nav-item">
    <a class="nav-link" id="contact-tab"  data-bs-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">Contact</a>
  </li>--%>
</ul>

<div class="tab-content" id="myTabContent">
  
         
  <div class='<%= HiddenFieldTab1.Value %>' id="home" role="tabpanel" aria-labelledby="home-tab" runat="server" >
      
   <div class="row">
      <div class="col-12">
      <div class="block">
          <!-- General Data Title -->
        <div class="block-title">
            <h2><i class="fa fa-pencil"></i> <strong><asp:Literal runat="server" Text="<%$ Resources:DefaultResource, ProductData%>" /></strong> </h2>
        </div>
         
             <!-- General Data Content -->
       
                    <div class="form-horizontal form-bordered">
                        <!--begin: Datatable -->
                        
                     <%--   <div class="kt-datatable kt-datatable--default kt-datatable--brand kt-datatable--scroll kt-datatable--loaded" id="kt_datatable_latest_orders" >
                       --%><%--<div class="kt-portlet__body">--%>
                        <div class="form-group row">
                                        <label for="ProductCodeLiteral" class="col-md-2 control-label">
                                            <asp:Literal ID="Productcodelabel" runat="server" Text="<%$ Resources:DefaultResource, ProductCode %>" />
                                        </label>
                                        <div class="col-sm-4 col-xs-4 col-4">
                                            <asp:TextBox ID="ProductCodeTextBox" runat="server" CssClass="form-control" Text='<%# Bind("PRODUCTCODE") %>' />
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidatorProductCode" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="ProductCodeTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                        <label for="ProductNamelebel" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal8" runat="server" Text="<%$ Resources:DefaultResource, ProductName%>" />
                                        </label>
                                        <div class="col-sm-4 col-xs-4 col-4">
                                            <%--<asp:TextBox ID="TextBox2" runat="server" AutoComplete="Off" CssClass="form-control date-picker" Text='<%# Bind("DataDate","{0:MM/dd/yyyy}") %>' />--%>
                                            <asp:TextBox ID="ProductNameTextBox" runat="server"  CssClass="form-control" Text='<%# Bind("productname") %>' />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="ProductNameTextBox" ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator>

                                        </div></div>
                        <div class="form-group row">
                                        <label for="ProductMainNameLabel" class="col-md-2 control-label">
                                            <asp:Literal ID="ProductMainNameLiteral" runat="server" Text="<%$ Resources:DefaultResource,MainProduct %>" />
                                        </label>
                                           <div class="col-sm-4 col-xs-4 col-4">
                                            <asp:CheckBox ID="ProductMainNameCheckBox" runat="server"  Checked='<%# Bind("MainNode") %>'/>
                                            </div>

                                         <label for="Main Productlabel" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:DefaultResource, ProductMainName %>" />
                                        </label>
                                        <div class="col-sm-4 col-xs-4 col-4">
                                            <%--<asp:TextBox ID="TextBox2" runat="server" AutoComplete="Off" CssClass="form-control date-picker" Text='<%# Bind("DataDate","{0:MM/dd/yyyy}") %>' />--%>
                                            <asp:TextBox ID="MainProductTextBox" runat="server"  CssClass="form-control" Text='<%# Bind("ProductparentName") %>' ReadOnly="True" />
                                           
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="ProductClosedToLabel" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:DefaultResource, ProductFileNo%>" />
                                        </label>
                                        <div class="col-sm-4 col-xs-4 col-4">
                                            <%--<asp:TextBox ID="TextBox2" runat="server" AutoComplete="Off" CssClass="form-control date-picker" Text='<%# Bind("DataDate","{0:MM/dd/yyyy}") %>' />--%>
                                            <asp:TextBox ID="SERIALNOTextBox" runat="server"  CssClass="form-control" Text='<%# Bind("SERIALNO") %>' />
                                           
                                        </div>
                                    <label for="ProductTypeLabel" class="col-md-2 control-label">
                                            <asp:Literal ID="ProductTypeLiteral" runat="server" Text="<%$ Resources:DefaultResource, ProductType%>" />
                                        </label>
                                        <div class="col-sm-4 col-xs-4 col-4">
                                            <asp:DropDownList ID="ProductTypeDropDownList" runat="server" CssClass="form-control"
                                                AppendDataBoundItems="True"  DataTextField="TYPEDESC" DataValueField="TYPEID" DataSourceID="ProductTypeDS">
                                                <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0" />
                                            </asp:DropDownList>
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidatorProductType" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="ProductTypeDropDownList"  InitialValue="0"  ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator>

                                              <%--<asp:RangeValidator ID="RangeValidatorProductType" runat="server" ControlToValidate="ProductTypeDropDownList" MinimumValue="1" MaximumValue="100"
                                                ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"></asp:RangeValidator>--%>
                                            
                                        </div>
                                       </div>

                            <div class="form-group row">
                                    
                                       <label for="CreditLiteral" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:DefaultResource, Weight%>" />
                                        </label>
                                        <div class="col-sm-4 col-xs-4 col-4">
                                            <asp:TextBox ID="WeightTextBox" runat="server" CssClass="form-control" Text='<%# Bind("PWeight") %>'  />
                                        </div>
                                        <label for="Debitlabel" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:DefaultResource, Color%>" />
                                        </label>
                                        <div class="col-sm-4 col-xs-4 col-4">
                                            <%--<asp:TextBox ID="TextBox2" runat="server" AutoComplete="Off" CssClass="form-control date-picker" Text='<%# Bind("DataDate","{0:MM/dd/yyyy}") %>' />--%>
                                         
                                             <asp:TextBox ID="ColorTextBox" runat="server"  CssClass="form-control" Text='<%# Bind("PColor") %>' />
                                        </div>
                                     
                                    </div>
                     
                        <div class="form-group row">
                                    
                                       <label for="ProductBalanceLiteral" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:DefaultResource, Size%>" />
                                        </label>
                                        <div class="col-sm-4 col-xs-4 col-4">
                                            
                                             <asp:TextBox ID="SizeTextBox" runat="server"  CssClass="form-control" Text='<%# Bind("PSize") %>' />
                                        </div>
                                        <label for="Volumelabel" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:DefaultResource, Volume%>" />
                                        </label>
                                        <div class="col-sm-4 col-xs-4 col-4">
                                          
                                            <asp:TextBox ID="VolumeTextBox" runat="server"  CssClass="form-control" Text='<%# Bind("PVolume") %>' />
                                            
                                        </div>
                                     
                                    </div>

                        <div class="form-group row">
                                    
                                   <label for="Noteslabel" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:DefaultResource, ProductDesc%>" />
                                        </label>
                                        <div class="col-sm-4 col-xs-4 col-4">
                                            <%--<asp:TextBox ID="TextBox2" runat="server" AutoComplete="Off" CssClass="form-control date-picker" Text='<%# Bind("DataDate","{0:MM/dd/yyyy}") %>' />--%>
                                            <asp:TextBox ID="PDescTextBox" runat="server"  CssClass="form-control" Text='<%# Bind("PDesc") %>' TextMode="MultiLine" />
                                            
                                        </div>
                                       
                                     <label for="Noteslabel" class="col-md-2 control-label">
                                            <asp:Literal ID="Literal9" runat="server" Text="<%$ Resources:DefaultResource, Brand%>" />
                                        </label>
                                        <div class="col-sm-4 col-xs-4 col-4">
                                            <%--<asp:TextBox ID="TextBox2" runat="server" AutoComplete="Off" CssClass="form-control date-picker" Text='<%# Bind("DataDate","{0:MM/dd/yyyy}") %>' />--%>
                                          
                                             <asp:TextBox ID="BrandTextBox" runat="server"  CssClass="form-control" Text='<%# Bind("shape2") %>' />
                                            <asp:HiddenField ID="txtProductId" runat="server" />
                                   </div></div>

         
                                      <div class="form-group form-actions">
                                            <div class="col-md-12 col-md-offset-3 text-center">
                                
                                       
                                            <div class="col-2">
                                                <asp:HiddenField ID="HiddenFieldTab1" runat="server" Value="tab-pane fade show active" />
                                                <asp:HiddenField ID="HiddenFieldTab2" runat="server" Value="tab-pane fade show" />
                                                <asp:HiddenField ID="HiddenFieldTab3" runat="server" Value="tab-pane fade show" />
                                                <asp:HiddenField ID="HiddenFieldTab" runat="server" Value="#home" />
                                                </div> 
                                            <div class="col-10 text-center">
                                                <asp:Button ID="AddButton" runat="server"  Text="<%$ Resources:DefaultResource, New%>"  data-original-title="<%$ Resources:DefaultResource, New%>"  data-bs-toggle="tooltip" title="<%$ Resources:DefaultResource, New%>" CssClass="btn btn-info" ValidationGroup="DML"  OnClick="AddButton_Click" CausesValidation="False" />
                                          &nbsp;
                                                
                                                <asp:Button ID="SaveButton" runat="server"  Text="<%$ Resources:DefaultResource, Insert%>"  data-original-title="<%$ Resources:DefaultResource, Insert%>"  data-bs-toggle="tooltip" title="<%$ Resources:DefaultResource, Insert%>" CssClass="btn btn-success" ValidationGroup="DML" OnClick="SaveButton_Click" />
                                                
                                           &nbsp;
                                                <%--<asp:LinkButton ID="DeleteLinkButton" runat="server" CommandName="Delete" Text=""  data-bs-toggle="tooltip" title="<%$ Resources:DefaultResource, delete%>"
                                                CssClass="btn btn-sm btn-danger" data-original-title="Delete" OnClientClick="javascript:if(!confirm('سيتم حذف جميع البيانات المتعلقة به ?')){return false;}">
                                                    <i class="fa fa-times"></i>
                                            </asp:LinkButton>--%>
                                                 <asp:Button ID="DelButton" runat="server"  data-original-title="<%$ Resources:DefaultResource, delete%>"  data-bs-toggle="tooltip" title="<%$ Resources:DefaultResource, delete%>" Text="<%$ Resources:DefaultResource, Delete%>" CssClass="btn btn-danger" ValidationGroup="DML"  OnClientClick="javascript:if(!confirm('سيتم حذف جميع البيانات المتعلقة به ?')){return false;}" OnClick="DelButton_Click"/>
                                            </div> 
                                         </div>
                                             
                                        </div>
                      </div>
          </div>
     
             </div>
      
       </div>
    </div>
  <div class='<%= HiddenFieldTab2.Value %>' id="price" role="tabpanel" aria-labelledby="price-tab" runat="server">
     
      <asp:ListView runat="server" ID="lv" DataKeyNames="UitPriceId" DataSourceID="ProductPriceDS" OnItemCommand="lv_ItemCommand" OnDataBound="lv_DataBound" OnItemDataBound="lv_ItemDataBound">
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
                                    <div class="form-group row">
                                        <label for="BarcodeTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="BarcodeLiteral" runat="server" Text="<%$ Resources:DefaultResource, Barcode%>" />
                                        </label>
                                        <div class="col-10">
                                             <asp:TextBox ID="TextBoxCode" runat="server" CssClass="form-control" Text='<%# Bind("PRODUCTBRAND") %>' />
                                          
                                              </div></div><div class="form-group row">

                                        <label for="UintIdTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="UintIdLiteral" runat="server" Text="<%$ Resources:DefaultResource, Unit%>" />
                                        </label>
                                        <div class="col-10">
                                            <asp:DropDownList ID="UnitsDropDownList" runat="server" CssClass="form-control"
                                                AppendDataBoundItems="True" DataTextField="UNITDESC" DataValueField="UINTID" DataSourceID="ProductUnits" Text='<%# Bind("UintId") %>'>
                                                <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0" />
                                            </asp:DropDownList>
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidatorUnits" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="UnitsDropDownList"  InitialValue="0"  ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="NameTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="MainUnitLiteral" runat="server" Text="<%$ Resources:DefaultResource, MainUint%>" />
                                        </label>
                                        <div class="col-10">
                                             <asp:CheckBox ID="MainUnitCheckBox" runat="server"  Checked='<%# Bind("MainUnit") %>'/>
                                             </div>

                                    </div>
                                    <div class="form-group row">
                                            <label for="Addresslabel" class="col-md-2 control-label">
                                                <asp:Literal ID="ConFactorLiteral" runat="server" Text="<%$ Resources:DefaultResource, ProdcutFactor%>" />
                                            </label>
                                            <div class="col-10">
                                             <asp:TextBox ID="TextBoxConFactor" runat="server" CssClass="form-control" Text='<%# Bind("ConFactor") %>' />
                                            </div>
                                      </div>
                                    <div class="form-group row">
                                            <label for="Limitlabel" class="col-md-2 control-label">
                                                <asp:Literal ID="LiteralLimit" runat="server" Text="<%$ Resources:DefaultResource, ProductLimit%>" />
                                            </label>
                                            <div class="col-10">
                                             <asp:TextBox ID="TextBoxLimit" runat="server" CssClass="form-control" Text='<%# Bind("THRESHOLDINSTOCK") %>' />
                                            </div>
                                      </div>
                                      <div class="form-group row">
                                            <label for="CostmerPricelabel" class="col-md-2 control-label">
                                                <asp:Literal ID="LiteralCostmerPrice" runat="server" Text="<%$ Resources:DefaultResource, SalePrice%>" />
                                            </label>
                                            <div class="col-10">
                                             <asp:TextBox ID="TextBoxCostmerPrice" runat="server" CssClass="form-control" Text='<%# Bind("CostmerPrice") %>' />
                                            </div>
                                      </div>
                                     <div class="form-group row">
                                            <label for="BuyPricelabel" class="col-md-2 control-label">
                                                <asp:Literal ID="LiteralBuyPrice" runat="server" Text="<%$ Resources:DefaultResource, BuyPrice%>" />
                                            </label>
                                            <div class="col-10">
                                             <asp:TextBox ID="TextBoxBuyPrice" runat="server" CssClass="form-control" Text='<%# Bind("BuyPrice") %>' />
                                            </div>
                                      </div>
                                    <div class="form-group row">
                                            <label for="Noteslabel" class="col-md-2 control-label">
                                                <asp:Literal ID="LastSalePriceNotes" runat="server" Text="<%$ Resources:DefaultResource, LastSalePrice%>" />
                                            </label>
                                            <div class="col-10">
                                             <asp:TextBox ID="TextBoxNotes" runat="server" CssClass="form-control" Text='<%# Bind("LastSalePrice") %>' />
                                            </div>
                                      </div>
                                    <div class="form-group row">
                                            <label for="LastBuyPricelabel" class="col-md-2 control-label">
                                                <asp:Literal ID="Literal10" runat="server" Text="<%$ Resources:DefaultResource, LastBuyPrice%>" />
                                            </label>
                                            <div class="col-10">
                                             <asp:TextBox ID="TextBoxLastBuyPrice" runat="server" CssClass="form-control" Text='<%# Bind("LastBuyPrice") %>' />
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
                        <td><%= Resources.DefaultResource.DataNotFound %></td></tr></table></EmptyDataTemplate>
          <InsertItemTemplate>
                <tr>
                    <td colspan="12">
                        <div class="kt-portlet">
                      
                            <!--begin::Form-->
                            <div class="kt-form kt-form--label-right">
                                <div class="kt-portlet__body">
                                     
                                    <div class="form-group row">
                                        <label for="BarcodeTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="BarcodeLiteral" runat="server" Text="<%$ Resources:DefaultResource, Barcode%>" />
                                        </label>
                                        <div class="col-10">
                                             <asp:TextBox ID="TextBoxCode" runat="server" CssClass="form-control" Text='<%# Bind("PRODUCTBRAND") %>' />
                                          
                                              </div></div><div class="form-group row">

                                        <label for="UintIdTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="UintIdLiteral" runat="server" Text="<%$ Resources:DefaultResource, Unit%>" />
                                        </label>
                                        <div class="col-10">
                                            <asp:DropDownList ID="UnitsDropDownList" runat="server" CssClass="form-control"
                                                AppendDataBoundItems="True" DataTextField="UNITDESC" DataValueField="UINTID" DataSourceID="ProductUnits" Text='<%# Bind("UintId") %>'>
                                                <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0" />
                                            </asp:DropDownList>
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidatorUnits" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="UnitsDropDownList"  InitialValue="0"  ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="NameTextBox" class="col-md-2 control-label">
                                            <asp:Literal ID="MainUnitLiteral" runat="server" Text="<%$ Resources:DefaultResource, MainUint%>" />
                                        </label>
                                        <div class="col-10">
                                             <asp:CheckBox ID="MainUnitCheckBox" runat="server"  Checked='<%# Bind("MainUnit") %>'/>
                                             </div>

                                    </div>
                                    <div class="form-group row">
                                            <label for="Addresslabel" class="col-md-2 control-label">
                                                <asp:Literal ID="ConFactorLiteral" runat="server" Text="<%$ Resources:DefaultResource, ProdcutFactor%>" />
                                            </label>
                                            <div class="col-10">
                                             <asp:TextBox ID="TextBoxConFactor" runat="server" CssClass="form-control" Text='<%# Bind("ConFactor") %>' />
                                            </div>
                                      </div>
                                    <div class="form-group row">
                                            <label for="Limitlabel" class="col-md-2 control-label">
                                                <asp:Literal ID="LiteralLimit" runat="server" Text="<%$ Resources:DefaultResource, ProductLimit%>" />
                                            </label>
                                            <div class="col-10">
                                             <asp:TextBox ID="TextBoxLimit" runat="server" CssClass="form-control" Text='<%# Bind("THRESHOLDINSTOCK") %>' />
                                            </div>
                                      </div>
                                      <div class="form-group row">
                                            <label for="CostmerPricelabel" class="col-md-2 control-label">
                                                <asp:Literal ID="LiteralCostmerPrice" runat="server" Text="<%$ Resources:DefaultResource, SalePrice%>" />
                                            </label>
                                            <div class="col-10">
                                             <asp:TextBox ID="TextBoxCostmerPrice" runat="server" CssClass="form-control" Text='<%# Bind("CostmerPrice") %>' />
                                            </div>
                                      </div>
                                     <div class="form-group row">
                                            <label for="BuyPricelabel" class="col-md-2 control-label">
                                                <asp:Literal ID="LiteralBuyPrice" runat="server" Text="<%$ Resources:DefaultResource, BuyPrice%>" />
                                            </label>
                                            <div class="col-10">
                                             <asp:TextBox ID="TextBoxBuyPrice" runat="server" CssClass="form-control" Text='<%# Bind("BuyPrice") %>' />
                                            </div>
                                      </div>
                                    <div class="form-group row">
                                            <label for="Noteslabel" class="col-md-2 control-label">
                                                <asp:Literal ID="LastSalePriceNotes" runat="server" Text="<%$ Resources:DefaultResource, LastSalePrice%>" />
                                            </label>
                                            <div class="col-10">
                                             <asp:TextBox ID="TextBoxNotes" runat="server" CssClass="form-control" Text='<%# Bind("LastSalePrice") %>' />
                                            </div>
                                      </div>
                                    <div class="form-group row">
                                            <label for="LastBuyPricelabel" class="col-md-2 control-label">
                                                <asp:Literal ID="Literal10" runat="server" Text="<%$ Resources:DefaultResource, LastBuyPrice%>" />
                                            </label>
                                            <div class="col-10">
                                             <asp:TextBox ID="TextBoxLastBuyPrice" runat="server" CssClass="form-control" Text='<%# Bind("LastBuyPrice") %>' />
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
            </InsertItemTemplate>
            <ItemTemplate>
                <tr>
                 <td>
                          <asp:label ID="SortOrderTxt" runat="server" Text='<%#Container.DisplayIndex+1 %>' SkinID="sort" />
                  </td>
                    <td style ="display:none">
                        <%# Eval("UintId") %>
                    </td>
                    <td >
                        <%# Eval("PRODUCTBRAND") %>
                

                    </td>
                    <td>
                        <%--<%# Eval("MonthlyDate","{0: dd-MMM-yyyy}") %>--%>
                          <%# Eval("UNITDESC")  %>
                    </td>
                    <td>
                  
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked=<%# Convert.ToBoolean (Eval("MainUnit").ToString ()) %>  Enabled ="false" />
                      <%--  <%# Eval("MainUnit")  %>--%>
                    </td>
                    <td>
                        <%# Eval("ConFactor")  %>
                         <%--<%# Eval("Actual","{0:N0}")  %>--%>
                    </td>
                   
                     <td>
                        <%# Eval("CostmerPrice")  %>
                         <%--<%# Eval("Actual","{0:N0}")  %>--%>
                    </td>
                     <td>
                        <%# Eval("BuyPrice")  %>
                         <%--<%# Eval("Actual","{0:N0}")  %>--%>
                    </td>
                      <%-- <td>
                        <asp:CheckBox ID="ChkBoxStopFlag" runat="server"  Checked ='<%#Eval("StopFlag")%>' Enabled="False" />
                    </td>--%>
                    <td class="text-center block-options">

                        <asp:LinkButton ID="EditLinkButton" runat="server" CommandName="Edit"  data-bs-toggle="kt-tooltip" title="<%$ Resources:DefaultResource, Edite%>" CssClass="btn btn-sm btn-icon btn-outline-primary btn-icon-md">
                                <i class="fa fa-edit"></i>
                        </asp:LinkButton><asp:LinkButton ID="DeleteLinkButton" runat="server" CommandName="Delete"  data-bs-toggle="kt-tooltip" title="<%$ Resources:DefaultResource, Delete%>" CssClass="btn btn-outline-danger btn-sm btn-icon"
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
                                <asp:LinkButton ID="CodeLinkButton" runat="server" CommandArgument="SUP_CUST_CODE" CommandName="Sort" Text="<%$ Resources:DefaultResource, Barcode%>" />
                            </th>
                             <th>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument="PHONE1" CommandName="Sort" Text="<%$ Resources:DefaultResource, Unit%>" />
                            </th>
                            <th>
                                <asp:LinkButton ID="NameButton" runat="server" CommandArgument="SUP_CUST_FNAME" CommandName="Sort" Text="<%$ Resources:DefaultResource, MainUint%>" />
                            </th>
                            <th>
                                <asp:LinkButton ID="PhoneButton" runat="server" CommandArgument="PHONE1" CommandName="Sort" Text="<%$ Resources:DefaultResource, ProdcutFactor%>" />
                            </th>
                             
                              <th>
                                <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument="PHONE1" CommandName="Sort" Text="<%$ Resources:DefaultResource, SalePrice%>" />
                            </th>
                             <th>
                                <asp:LinkButton ID="LinkButton4" runat="server" CommandArgument="PHONE1" CommandName="Sort" Text="<%$ Resources:DefaultResource, BuyPrice%>" />
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
<div class='<%= HiddenFieldTab3.Value %>' id="Stock" role="tabpanel" aria-labelledby="Stock-tab" runat="server">
     
      <asp:ListView runat="server" ID="LvStock" DataKeyNames="StockId" DataSourceID="StockDS" OnItemCommand="lv_ItemCommand" OnDataBound="lv_DataBound" OnItemDataBound="lv_ItemDataBound">
          
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td><%= Resources.DefaultResource.DataNotFound %></td></tr></table></EmptyDataTemplate>
        
            <ItemTemplate>
                <tr>
                 <td>
                          <asp:label ID="SortOrderTxt" runat="server" Text='<%#Container.DisplayIndex+1 %>' SkinID="sort" />
                  </td>
                    <td style ="display:none">
                        <%# Eval("StockId") %>
                    </td>
                    <td >
                        <%# Eval("PRODUCTCODE") %>
                
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
                    
                    <%--<td class="text-center block-options">

                        <asp:LinkButton ID="EditLinkButton" runat="server" CommandName="Edit"  data-bs-toggle="kt-tooltip" title="<%$ Resources:DefaultResource, Edite%>" CssClass="btn btn-sm btn-icon btn-outline-primary btn-icon-md">
                                <i class="fa fa-edit"></i>
                        </asp:LinkButton><asp:LinkButton ID="DeleteLinkButton" runat="server" CommandName="Delete"  data-bs-toggle="kt-tooltip" title="<%$ Resources:DefaultResource, Delete%>" CssClass="btn btn-outline-danger btn-sm btn-icon"
                            OnClientClick="javascript:if(!confirm('This action will delete the record and all related Records!')){return false;}">
                                <i class="la la-close"></i>
                        </asp:LinkButton>

                    </td>--%>

                </tr></ItemTemplate>
          <LayoutTemplate>
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
                                <asp:LinkButton ID="CodeLinkButton" runat="server" CommandArgument="SUP_CUST_CODE" CommandName="Sort" Text="<%$ Resources:DefaultResource, ProductCode%>" />
                            </th>
                             <th>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument="PHONE1" CommandName="Sort" Text="<%$ Resources:DefaultResource, ProductName%>" />
                            </th>
                            <th>
                                <asp:LinkButton ID="NameButton" runat="server" CommandArgument="SUP_CUST_FNAME" CommandName="Sort" Text="<%$ Resources:DefaultResource, InventoryName%>" />
                            </th>
                            <th>
                                <asp:LinkButton ID="PhoneButton" runat="server" CommandArgument="PHONE1" CommandName="Sort" Text="<%$ Resources:DefaultResource, Unit%>" />
                            </th>
                             
                              <th>
                                <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument="PHONE1" CommandName="Sort" Text="<%$ Resources:DefaultResource, StartQuantity%>" />
                            </th>
                             <th>
                                <asp:LinkButton ID="LinkButton4" runat="server" CommandArgument="PHONE1" CommandName="Sort" Text="<%$ Resources:DefaultResource, CurrentQuantity%>" />
                            </th>
                           <%-- <th>
                                <asp:LinkButton ID="ActionsLinkButton" runat="server" CommandName="Sort" Text="<%$ Resources:DefaultResource, Actions%>" />
                            </th>--%>
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
   </div>

  </div>

                   </div>

         </div>
                   
                     
                   

                             <div class="col-lg-6">
                                   <%# Eval("UintId") %>
                                 <%# Eval("PRODUCTBRAND") %>                         
                                        <%# Eval("UNITDESC")  %>
                                      <%# Eval("ConFactor")  %>

                                <!-- General Data Block -->
                                <div class="block">
                                    <!-- General Data Title -->
                                    <div class="block-title">
                                        <div class="block-options pull-left">
         
                                           <div class="btn-group btn-group-sm">
                                                <a href="javascript:void(0)" class="btn btn-alt btn-sm btn-default dropdown-toggle enable-tooltip" data-toggle="dropdown" title="Options"><span class="caret"></span></a>
                                                <ul class="dropdown-menu dropdown-custom dropdown-menu-right">
                                                    <li>
                                                   <asp:LinkButton ID="MainSubProductBtn" runat="server"   data-bs-toggle="tooltip" data-original-title="<%$ Resources:DefaultResource, AddMainProduct%>"  class="kt-nav__link" OnClick="MainSubProductBtn_Click" >
                                                 <i class="gi gi-airplane pull-right"></i>
                                            <span class="">
                                                <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, AddMainProduct%>" />
                                            </span>
                                            </asp:LinkButton>
                                                                                             
                                                    </li>
                                            <li class="divider"></li>

                                          

                          <li class="divider"></li>
                                    
                                    <li>
                                      <asp:LinkButton ID="NewSubProduct" runat="server"   data-bs-toggle="tooltip" data-original-title="<%$ Resources:DefaultResource, AddSubProduct%>"  class="kt-nav__link" OnClick="NewSubProduct_Click" >
                                                 <i class="gi gi-airplane pull-right"></i>
                                            <span class="">
                                                <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, AddSubProduct%>" />
                                            </span>
                                            </asp:LinkButton>

                                    </li>
                                     <li class="divider"></li>
                                    <li >
                                             <asp:LinkButton ID="LinkButtonMoveProduct" runat="server"   data-bs-toggle="tooltip" data-original-title="<%$ Resources:DefaultResource, MoveProduct%>"  class="kt-nav__link"  >
                                               <i class="gi gi-airplane pull-right"></i>
                                            <span class="">
                                                <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, MoveProduct%>" />
                                            </span>
                                            </asp:LinkButton>

                                         </li>
                                            <li class="divider"></li>
                                        <li>
                                            

                                    </li>
                                      <li class="divider"></li>
                                    <li >
                                            <asp:LinkButton ID="LinkButtonSave" runat="server"   data-bs-toggle="tooltip" data-original-title="<%$ Resources:DefaultResource, new%>"  class="kt-nav__link" OnClick="LinkButtonSave_Click"  >
                                              <i class="gi gi-airplane pull-right"></i>
                                            <span class="">
                                                <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, Save%>" />
                                            </span>
                                            </asp:LinkButton>

                                      

                                    </li>
  <li class="divider"></li>
                                    <li >
                                         <asp:LinkButton ID="LinkButtondelete" runat="server"   data-bs-toggle="tooltip" data-original-title="<%$ Resources:DefaultResource, delete%>"  class="kt-nav__link" OnClick="LinkButtondelete_Click"  >
                                               <i class="gi gi-airplane pull-right"></i>
                                            <span class="">
                                                <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, delete%>" />
                                            </span>
                                          </asp:LinkButton>
                                        </li> 

                                                    
                                                
                                                </ul>
                                            </div>
                                        </div>
                                       <h2> <strong><asp:Literal runat="server" Text="<%$ Resources:DefaultResource, AccountTree%>" /></strong> </h2>
                                   </div>

                                     <div  style="border: 0px solid #000000; overflow: auto; max-height: 550px; width:100%;">
                
                                                       <%-- display tree in div--%>
                                                <div id="myTree"  ></div>

                              
                                     </div>

                        <div style="visibility: hidden" >                  
                       <asp:Button ID="btnSubmit" runat="server" Text="Button" OnClick="btnSubmit_Click" Width="0px" />

                                   </div>
                                    </div>
                                 </div>
                    </div>          
                              
                </div>
                <!--end:: Widgets/Sales States-->
  
  </div>
  <%-- <%# Eval("CostmerPrice")  %>--%>
    
    <%--<%# Eval("Actual","{0:N0}")  %>--%>
<!--begin::Modal-->
             
            
<!--end::Modal-->

<asp:ObjectDataSource ID="GEODS" runat="server" OldValuesParameterFormatString="original"
            SelectMethod="GetDataByOrgId" TypeName="NEWERPDataSetTableAdapters.PRODUCTSTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update" ><DeleteParameters><asp:ControlParameter ControlID="txtProductId" Name="Original_PRODUCTID" PropertyName="Value" Type="Int64" /></DeleteParameters><InsertParameters><asp:ControlParameter ControlID="ProductNameTextBox" Name="productname" PropertyName="Text" Type="String" /><asp:Parameter Name="EnglishName" Type="String" /><asp:ControlParameter ControlID="ProductCodeTextBox" Name="PRODUCTCODE" PropertyName="Text" Type="String" /><asp:ControlParameter ControlID="txtParentID" Name="ParentProductId" PropertyName="Text" Type="Int64" /><asp:ControlParameter ControlID="txtRoot" Name="Root" PropertyName="Text" Type="Boolean" /><asp:ControlParameter ControlID="txtProcessFlag" Name="ProcessFlag" PropertyName="Text" Type="Boolean" /><asp:ControlParameter ControlID="ProductMainNameCheckBox" Name="MainNode" PropertyName="Checked" Type="Boolean" /><asp:ControlParameter ControlID="txtlevel" Name="Level" PropertyName="Text" Type="Int32" /><asp:ControlParameter ControlID="ProductTypeDropDownList" Name="ProductTypeID" PropertyName="SelectedValue" Type="Int64" /><asp:ControlParameter ControlID="SERIALNOTextBox" Name="SERIALNO" PropertyName="Text" Type="String" /><asp:Parameter Name="SUPPLIERID" Type="Int64" /><asp:Parameter Name="CATEGORYID" Type="Int32" /><asp:ControlParameter ControlID="WeightTextBox" Name="PWeight" PropertyName="Text" Type="String" /><asp:ControlParameter ControlID="SizeTextBox" Name="PSize" PropertyName="Text" Type="String" /><asp:ControlParameter ControlID="ColorTextBox" Name="PColor" PropertyName="Text" Type="String" /><asp:ControlParameter ControlID="VolumeTextBox" Name="PVolume" PropertyName="Text" Type="String" /><asp:Parameter Name="picpath" Type="Object" /><asp:ControlParameter ControlID="PDescTextBox" Name="PDesc" PropertyName="Text" Type="String" /><asp:Parameter Name="PriceRule" Type="String" /><asp:Parameter Name="PriceFromDate" Type="DateTime" /><asp:Parameter Name="PriceToDate" Type="DateTime" /><asp:Parameter Name="OfferTypeID" Type="Int32" /><asp:Parameter Name="OfferFromDate" Type="DateTime" /><asp:Parameter Name="OfferToDate" Type="DateTime" /><asp:Parameter Name="OfferProductId" Type="Int64" /><asp:Parameter Name="OfferUnit" Type="Int32" /><asp:Parameter Name="UNITPRICECOST" Type="Decimal" /><asp:Parameter Name="UNITPRICESALES" Type="Decimal" /><asp:Parameter Name="BUYDATE" Type="DateTime" /><asp:Parameter Name="DISCONTINUED" Type="Boolean" /><asp:Parameter Name="REORDERLEVEL" Type="Int16" /><asp:Parameter Name="STOCKNO" Type="Int64" /><asp:Parameter Name="SHAPE" Type="String" /><asp:Parameter Name="QUANTITYPERUNIT" Type="Single" /><asp:Parameter Name="complexproduct" Type="Boolean" /><asp:Parameter Name="UNITSINSTOCK" Type="Double" /><asp:Parameter Name="ACCOUNTID" Type="Int32" /><asp:Parameter Name="QUANTITYINUNIT" Type="Double" /><asp:Parameter Name="initialsmallquantity" Type="Double" /><asp:Parameter Name="initiallargequantity" Type="Double" /><asp:Parameter Name="serviceproduct" Type="Boolean" /><asp:Parameter Name="forcurrency" Type="Decimal" /><asp:Parameter Name="shape2" Type="String" /><asp:ControlParameter ControlID="txtLastSerialNo" Name="SerialCode" PropertyName="Text" Type="Int64" /><asp:Parameter Name="THRESHOLDINSTOCK" Type="Decimal" /><asp:Parameter Name="VALIDITY" Type="DateTime" /><asp:Parameter Name="RECEIVERID" Type="Int32" /><asp:Parameter Name="minprice" Type="Decimal" /><asp:Parameter Name="initialprice" Type="Decimal" /><asp:Parameter Name="profit" Type="Single" /><asp:Parameter Name="BarCode" Type="String" /><asp:Parameter Name="Quantity" Type="Int32" /><asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" /></InsertParameters><SelectParameters><asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" /></SelectParameters><UpdateParameters><asp:ControlParameter ControlID="ProductNameTextBox" Name="productname" PropertyName="Text" Type="String" /><asp:Parameter Name="EnglishName" Type="String" /><asp:ControlParameter ControlID="ProductCodeTextBox" Name="PRODUCTCODE" PropertyName="Text" Type="String" /><asp:ControlParameter ControlID="txtParentID" Name="ParentProductId" PropertyName="Text" Type="Int64" /><asp:ControlParameter ControlID="txtRoot" Name="Root" PropertyName="Text" Type="Boolean" /><asp:ControlParameter ControlID="txtProcessFlag" Name="ProcessFlag" PropertyName="Text" Type="Boolean" /><asp:ControlParameter ControlID="ProductMainNameCheckBox" Name="MainNode" PropertyName="Checked" Type="Boolean" /><asp:ControlParameter ControlID="txtlevel" Name="Level" PropertyName="Text" Type="Int32" /><asp:ControlParameter ControlID="ProductTypeDropDownList" Name="ProductTypeID" PropertyName="SelectedValue" Type="Int64" /><asp:ControlParameter ControlID="SERIALNOTextBox" Name="SERIALNO" PropertyName="Text" Type="String" /><asp:Parameter Name="SUPPLIERID" Type="Int64" /><asp:Parameter Name="CATEGORYID" Type="Int32" /><asp:ControlParameter ControlID="WeightTextBox" Name="PWeight" PropertyName="Text" Type="String" /><asp:ControlParameter ControlID="SizeTextBox" Name="PSize" PropertyName="Text" Type="String" /><asp:ControlParameter ControlID="ColorTextBox" Name="PColor" PropertyName="Text" Type="String" /><asp:ControlParameter ControlID="VolumeTextBox" Name="PVolume" PropertyName="Text" Type="String" /><asp:Parameter Name="picpath" Type="Object" /><asp:ControlParameter ControlID="PDescTextBox" Name="PDesc" PropertyName="Text" Type="String" /><asp:Parameter Name="PriceRule" Type="String" /><asp:Parameter Name="PriceFromDate" Type="DateTime" /><asp:Parameter Name="PriceToDate" Type="DateTime" /><asp:Parameter Name="OfferTypeID" Type="Int32" /><asp:Parameter Name="OfferFromDate" Type="DateTime" /><asp:Parameter Name="OfferToDate" Type="DateTime" /><asp:Parameter Name="OfferProductId" Type="Int64" /><asp:Parameter Name="OfferUnit" Type="Int32" /><asp:Parameter Name="UNITPRICECOST" Type="Decimal" /><asp:Parameter Name="UNITPRICESALES" Type="Decimal" /><asp:Parameter Name="BUYDATE" Type="DateTime" /><asp:Parameter Name="DISCONTINUED" Type="Boolean" /><asp:Parameter Name="REORDERLEVEL" Type="Int16" /><asp:Parameter Name="STOCKNO" Type="Int64" /><asp:Parameter Name="SHAPE" Type="String" /><asp:Parameter Name="QUANTITYPERUNIT" Type="Single" /><asp:Parameter Name="complexproduct" Type="Boolean" /><asp:Parameter Name="UNITSINSTOCK" Type="Double" /><asp:Parameter Name="ACCOUNTID" Type="Int32" /><asp:Parameter Name="QUANTITYINUNIT" Type="Double" /><asp:Parameter Name="initialsmallquantity" Type="Double" /><asp:Parameter Name="initiallargequantity" Type="Double" /><asp:Parameter Name="serviceproduct" Type="Boolean" /><asp:Parameter Name="forcurrency" Type="Decimal" /><asp:Parameter Name="shape2" Type="String" /><asp:ControlParameter ControlID="txtLastSerialNo" Name="SerialCode" PropertyName="Text" Type="Int64" /><asp:Parameter Name="THRESHOLDINSTOCK" Type="Decimal" /><asp:Parameter Name="VALIDITY" Type="DateTime" /><asp:Parameter Name="RECEIVERID" Type="Int32" /><asp:Parameter Name="minprice" Type="Decimal" /><asp:Parameter Name="initialprice" Type="Decimal" /><asp:Parameter Name="profit" Type="Single" /><asp:Parameter Name="BarCode" Type="String" /><asp:Parameter Name="Quantity" Type="Int32" /><asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" /><asp:ControlParameter ControlID="txtProductId" Name="Original_PRODUCTID" PropertyName="Value" Type="Int64" /></UpdateParameters></asp:ObjectDataSource>

               

            <asp:ObjectDataSource ID="GEODSById" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataByProductId" TypeName="NEWERPDataSetTableAdapters.ProductViewTableAdapter" ><SelectParameters>
                    <asp:ControlParameter ControlID="txtProductId" Name="ProductID" PropertyName="Value" Type="Int64" /></SelectParameters>
                </asp:ObjectDataSource>

            <asp:TextBox ID="txtMainNode" runat="server"  Visible="False">

            </asp:TextBox><asp:TextBox ID="txtExpand1" runat="server" Visible="False" ></asp:TextBox><asp:TextBox ID="txtOrgId" runat="server"  Visible="False"></asp:TextBox><asp:TextBox ID="txtParentID" runat="server"  Visible="False"></asp:TextBox><asp:TextBox ID="txtLastSerialNo" runat="server"  Visible="False"></asp:TextBox><asp:TextBox ID="txtlevel" runat="server"  Visible="False"></asp:TextBox><asp:TextBox ID="txtRoot" runat="server"  Visible="False"></asp:TextBox><asp:TextBox ID="txtProcessFlag" runat="server"  Visible="False"></asp:TextBox><asp:ObjectDataSource ID="GEODSByCode" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataByCode" TypeName="NEWERPDataSetTableAdapters.PRODUCTSTableAdapter" DeleteMethod="Delete" ><DeleteParameters>
                    <asp:Parameter Name="Original_Productid" Type="Int64" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="ProductCodeTextBox" Name="Productcode" PropertyName="Text" Type="String" />
                </SelectParameters>
                </asp:ObjectDataSource>

            <asp:HiddenField ID="txtExpand" runat="server" />
            <asp:ObjectDataSource ID="ProductPriceDS" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataByProductId" TypeName="NEWERPDataSetTableAdapters.Product_Units_PricesTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update" ><DeleteParameters><asp:Parameter Name="Original_UitPriceId" Type="Int64" /></DeleteParameters><InsertParameters><asp:Parameter Name="UintId" Type="Int64" /><asp:ControlParameter ControlID="txtProductId" Name="Productid" PropertyName="Value" Type="Int64" /><asp:Parameter Name="PRODUCTBRAND" Type="String" /><asp:Parameter Name="ConFactor" Type="Double" /><asp:Parameter Name="PriceOnly" Type="Boolean" /><asp:Parameter Name="Dim" Type="String" /><asp:Parameter Name="DimDesc" Type="String" /><asp:Parameter Name="MainUnit" Type="Boolean" /><asp:Parameter Name="AvgCostPrice" Type="Decimal" /><asp:Parameter Name="MaxCostPrice" Type="Decimal" /><asp:Parameter Name="MinCostPrice" Type="Decimal" /><asp:Parameter Name="SalePrice" Type="Decimal" /><asp:Parameter Name="MinPrice" Type="Decimal" /><asp:Parameter Name="BuyPrice" Type="Decimal" /><asp:Parameter Name="CostmerPrice" Type="Decimal" /><asp:Parameter Name="PrivatePrice" Type="Decimal" /><asp:Parameter Name="Minprofit" Type="Double" /><asp:Parameter Name="MaxProfit" Type="Double" /><asp:Parameter Name="MaxSalePrice" Type="Decimal" /><asp:Parameter Name="MinSalePrice" Type="Decimal" /><asp:Parameter Name="LastSalePrice" Type="Decimal" /><asp:Parameter Name="MaxBuyPrice" Type="Decimal" /><asp:Parameter Name="MinBuyPrice" Type="Decimal" /><asp:Parameter Name="LastBuyPrice" Type="Decimal" /><asp:Parameter Name="LastCostPrice" Type="Decimal" /><asp:Parameter Name="THRESHOLDINSTOCK" Type="Decimal" /><asp:Parameter Name="VALIDITY" Type="DateTime" /><asp:Parameter Name="RECEIVERID" Type="Int32" /><asp:Parameter Name="StoreEnterDate" Type="DateTime" /><asp:Parameter Name="FCostPrice" Type="Decimal" /><asp:Parameter Name="FPrice" Type="Decimal" /></InsertParameters><SelectParameters><asp:ControlParameter ControlID="txtProductId" Name="ProductId" PropertyName="Value" Type="Int64" /></SelectParameters><UpdateParameters><asp:Parameter Name="UintId" Type="Int64" /><asp:ControlParameter ControlID="txtProductId" Name="productid" PropertyName="Value" Type="Int64" /><asp:Parameter Name="PRODUCTBRAND" Type="String" /><asp:Parameter Name="ConFactor" Type="Double" /><asp:Parameter Name="PriceOnly" Type="Boolean" /><asp:Parameter Name="Dim" Type="String" /><asp:Parameter Name="DimDesc" Type="String" /><asp:Parameter Name="MainUnit" Type="Boolean" /><asp:Parameter Name="AvgCostPrice" Type="Decimal" /><asp:Parameter Name="MaxCostPrice" Type="Decimal" /><asp:Parameter Name="MinCostPrice" Type="Decimal" /><asp:Parameter Name="SalePrice" Type="Decimal" /><asp:Parameter Name="MinPrice" Type="Decimal" /><asp:Parameter Name="BuyPrice" Type="Decimal" /><asp:Parameter Name="CostmerPrice" Type="Decimal" /><asp:Parameter Name="PrivatePrice" Type="Decimal" /><asp:Parameter Name="Minprofit" Type="Double" /><asp:Parameter Name="MaxProfit" Type="Double" /><asp:Parameter Name="MaxSalePrice" Type="Decimal" /><asp:Parameter Name="MinSalePrice" Type="Decimal" /><asp:Parameter Name="LastSalePrice" Type="Decimal" /><asp:Parameter Name="MaxBuyPrice" Type="Decimal" /><asp:Parameter Name="MinBuyPrice" Type="Decimal" /><asp:Parameter Name="LastBuyPrice" Type="Decimal" /><asp:Parameter Name="LastCostPrice" Type="Decimal" /><asp:Parameter Name="THRESHOLDINSTOCK" Type="Decimal" /><asp:Parameter Name="VALIDITY" Type="DateTime" /><asp:Parameter Name="RECEIVERID" Type="Int32" /><asp:Parameter Name="StoreEnterDate" Type="DateTime" /><asp:Parameter Name="FCostPrice" Type="Decimal" /><asp:Parameter Name="FPrice" Type="Decimal" /><asp:Parameter Name="Original_UitPriceId" Type="Int64" /></UpdateParameters></asp:ObjectDataSource>

               

            <asp:ObjectDataSource ID="ProductTypeDS" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="NEWERPDataSetTableAdapters.CDE_PRODUCTTYPESTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update" ><DeleteParameters><asp:Parameter Name="Original_TYPEID" Type="Int64" /><asp:Parameter Name="Original_TYPEDESC" Type="String" /></DeleteParameters><InsertParameters><asp:Parameter Name="TYPEDESC" Type="String" /></InsertParameters><UpdateParameters><asp:Parameter Name="TYPEDESC" Type="String" /><asp:Parameter Name="Original_TYPEID" Type="Int64" /><asp:Parameter Name="Original_TYPEDESC" Type="String" /></UpdateParameters></asp:ObjectDataSource>

            <asp:ObjectDataSource ID="ProductUnits" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="NEWERPDataSetTableAdapters.CDE_UNIT_TYPESTableAdapter" ></asp:ObjectDataSource>

            <asp:ObjectDataSource ID="StockDS" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataByByParam" TypeName="NEWERPDataSetTableAdapters.STOCKTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update" ><DeleteParameters><asp:Parameter Name="Original_StockId" Type="Int64" /></DeleteParameters><InsertParameters><asp:Parameter Name="STOREID" Type="Int64" /><asp:Parameter Name="PRODUCTID" Type="Int64" /><asp:Parameter Name="UnitID" Type="Int64" /><asp:Parameter Name="QUANTITY" Type="Double" /><asp:Parameter Name="MovmentQty" Type="Double" /><asp:Parameter Name="MaxQty" Type="Double" /><asp:Parameter Name="visitationQty" Type="Double" /><asp:Parameter Name="Related" Type="Boolean" /><asp:Parameter Name="OrderQTY" Type="Double" /><asp:Parameter Name="QtyInStore" Type="Double" /><asp:Parameter Name="QtyINRoad" Type="Double" /><asp:Parameter Name="QtynotAmount" Type="Double" /><asp:Parameter Name="QtyNotProchuse" Type="Double" /><asp:Parameter Name="QtyNotCost" Type="Double" /><asp:Parameter Name="QtyNotSale" Type="Double" /></InsertParameters><SelectParameters><asp:Parameter Name="STOREID" Type="Int64" /><asp:ControlParameter ControlID="txtProductId" Name="PRODUCTID" PropertyName="Value" Type="Int64" /><asp:Parameter Name="searchParam" Type="String" /></SelectParameters><UpdateParameters><asp:Parameter Name="STOREID" Type="Int64" /><asp:Parameter Name="PRODUCTID" Type="Int64" /><asp:Parameter Name="UnitID" Type="Int64" /><asp:Parameter Name="QUANTITY" Type="Double" /><asp:Parameter Name="MovmentQty" Type="Double" /><asp:Parameter Name="MaxQty" Type="Double" /><asp:Parameter Name="visitationQty" Type="Double" /><asp:Parameter Name="Related" Type="Boolean" /><asp:Parameter Name="OrderQTY" Type="Double" /><asp:Parameter Name="QtyInStore" Type="Double" /><asp:Parameter Name="QtyINRoad" Type="Double" /><asp:Parameter Name="QtynotAmount" Type="Double" /><asp:Parameter Name="QtyNotProchuse" Type="Double" /><asp:Parameter Name="QtyNotCost" Type="Double" /><asp:Parameter Name="QtyNotSale" Type="Double" /><asp:Parameter Name="Original_StockId" Type="Int64" /></UpdateParameters></asp:ObjectDataSource>

            <%# Eval("BuyPrice")  %><script type="text/javascript">
                                        $(document).ready(function () {


                                           <%-- var treeData =<%= jsonStrnig %> ;
                                            alert(treeData);--%>

                                            var treeData = [
                                                     <%=jsonStrnig %>
                                            ];


                                            $('#myTree').treeview({
                                                data: treeData,
                                                //color: "#428bca",
                                                expandIcon: 'fa fa-plus',
                                                collapseIcon: 'fa fa-angle-right fa-fw',
                                                indent: 1.25,
                                                parentsMarginLeft: '1.25rem',
                                                onNodeChecked: function (event, data) { },
                                                onNodeSelected: function (event, node) {
                                                    //$('.contanter').css('background','green');
                                                    //alert( $('myTree').treeview('getSelected', nodeId));
                                                    //alert("sel");
                                                    $("#<%= txtProductId.ClientID %>").val(node.id);
                                                    //$('#btnSubmit').trigger('click');
                                                    $("#<%=btnSubmit.ClientID%>").trigger('click'); 


                                              <%-- <% GetNodeInfo(txtProductId.Text);%>--%>
                                                    //window.location.href = "WebTree.aspx?Id=" + node.id;

                                                    //__doPostBack('', '');
                                                    //alert(node.id);
                                                },
                                                onNodeUnselected: function (event, node) {
                                                    //$('.contanter').css('background','red');
                                                    //$('#myTree').treeview('toggleNodeSelected', [data.nodeId, { silent: true }]);

                                                },
                                                onNodeExpanded: function (event, node) {
                                                    //$('.contanter').css('background','red');
                                                    //alert("Expand");
                                                    $("#<%= txtProductId.ClientID %>").val(node.id);
                                                    $("#<%= txtExpand.ClientID %>").val(1);
                                                    
                                                    $("#<%=btnSubmit.ClientID%>").trigger('click'); 


                                                //$('#btnSubmit').trigger('click');

                                            },

                                            onNodeCollapsed: function (event, node) {

                                                //alert("coll");
                                                $("#<%= txtProductId.ClientID %>").val(node.id);
                                                $("#<%= txtExpand.ClientID %>").val(0); 
                                                $("#<%= btnSubmit.ClientID%>").trigger('click'); 
                                                //$('#btnSubmit').trigger('click');
                                    
                                            }

                                            //onNodeSelected: function (event, data) { }
                                            });

                                           <%-- var selectedTab = $("#<%=HiddenFieldTab.ClientID%>");
                                            var tabId = selectedTab.val() != "" ? selectedTab.val() : "home";
                                            alert($('#Tabs a[href="#' + tabId + '"]').tab('show'));
                                            $('#Tabs a[href="#' + tabId + '"]').tab('show');
                                           
                                            $("#Tabs a").click(function () {
                                                selectedTab.val($(this).attr("href").substring(1));
                                               
                                            });--%>
                                            
                                        });

                                       <%--  var treeObj = $('#myTree');
                                        var nodes = treeObj.getNodes();
               
                                        if (nodes.length > 0) {
                 
                                            var node = treeObj.selectNode(<%= txtProductId.ClientID %>);
                                                alert(node);
                                        }--%>

            </script>
