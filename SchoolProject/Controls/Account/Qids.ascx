<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Qids.ascx.cs" Inherits="WebSchool.Controls.Account.Qids" %>

<script type="text/javascript">
            function showPopup()
            {
       
                /*$('#myModal').modal('show');*/
                let modal = bootstrap.Modal.getOrCreateInstance(document.getElementById('myModal')) // Returns a Bootstrap modal instance
                // Show or hide:
                modal.show();
       
              }

                $('.date').datepicker({
                    autoclose: true,
                    format: 'dd-mm-yyyy',
                    endDate: new Date(),
                    todayHighlight: true,
                    orientation: "bottom",
                });

         //$("#EventDate").datepicker();

         //$("body").delegate("#DatePicker", "focusin", function () {

         //    $(this).datepicker();
         //}); 

         //$('#myModal').on('shown.bs.modal', function () {
         //    $('.date').datepicker({
         //        format: "dd/mm/yyyy",
         //        startDate: "01-01-2019",
         //        autoclose: true,
         //        todayHighlight: true,
         //        container: '#myBodaydiv'
         //    });
         //});

</script>
<ul class="breadcrumb breadcrumb-top">
    <li><a href="default.aspx"><%= Resources.DefaultResource.Main%> </a></li>
    <li> 
         <%= Request.QueryString["TypeId"].ToString() == GLibrary.strarrQidTypes[0, 0].ToString() ? Resources.DefaultResource.AccountQids :""  %>
               <%= Request.QueryString["TypeId"].ToString() == GLibrary.strarrQidTypes[6, 0].ToString()  ? Resources.DefaultResource.AccountInQid :""  %>
                 <%= Request.QueryString["TypeId"].ToString() == GLibrary.strarrQidTypes[5, 0].ToString()  ? Resources.DefaultResource.AccountOutQid :""  %>
    </li>
</ul>
<div class="block table-responsive-lg">
    <!-- Table Styles Title -->
    <div class="block-title">
        <h2><strong><%= Resources.DefaultResource.List%>  </strong>
               <%= Request.QueryString["TypeId"].ToString() == GLibrary.strarrQidTypes[0, 0].ToString() ? Resources.DefaultResource.AccountQids :""  %>
               <%= Request.QueryString["TypeId"].ToString() == GLibrary.strarrQidTypes[6, 0].ToString()  ? Resources.DefaultResource.AccountInQid :""  %>
                 <%= Request.QueryString["TypeId"].ToString() == GLibrary.strarrQidTypes[5, 0].ToString()  ? Resources.DefaultResource.AccountOutQid :""  %>
        </h2>
        <div class="block-options pull-right">
           <asp:LinkButton ID="NewRecord" runat="server" CssClass="btn btn-sm btn-success" data-toggle="tooltip" title="<%$ Resources:DefaultResource, AddNewQid%>"  data-original-title="<%$ Resources:DefaultResource, AddNewQid%>" OnClick="NewRecord_Click">
                <i class="fa fa-file"></i>
            </asp:LinkButton>
        </div>
    </div>
    <!-- END Table Styles Title -->

    <div class="gallery gallery-widget" data-toggle="lightbox-gallery">
         

   <div class="input-group">


        <div class="row">
                    <div class="col-4" style ="display :none">
                        <div class="kt-input-icon kt-input-icon--pill kt-input-icon--right">
                            <asp:TextBox ID="SearchTextBox" runat="server" CssClass="form-control " placeholder="<%$ Resources:DefaultResource, Search%>"></asp:TextBox>
                            <span class="kt-input-icon__icon kt-input-icon__icon--right"><span><i class="la la-puzzle-piece"></i></span></span>
                        </div>
                    </div>
                    <div class="col-2">
                        <div class="kt-input-icon kt-input-icon--pill kt-input-icon--right">
                            <asp:TextBox ID="StartDateTextBox" CssClass="form-control date-picker" runat="server" placeholder="<%$ Resources:DefaultResource, FromDateTitle%>" data-date-format="dd/mm/yyyy"></asp:TextBox>
                            <span class="kt-input-icon__icon kt-input-icon__icon--right"><span><i class="la la-calendar-check-o"></i></span></span>
                        </div>
                    </div>
                    <div class="col-2">
                        <div class="kt-input-icon kt-input-icon--pill kt-input-icon--right">
                            <asp:TextBox ID="EndDateTextBox" CssClass="form-control date-picker" runat="server" placeholder="<%$ Resources:DefaultResource, ToDateTitle%>" data-date-format="dd/mm/yyyy"></asp:TextBox>
                            <span class="kt-input-icon__icon kt-input-icon__icon--right"><span><i class="la la-calendar-check-o"></i></span></span>
                        </div>
                    </div>
                    <div class="col-2">
                        <div class="kt-input-icon kt-input-icon--pill kt-input-icon--right">
                            <asp:TextBox ID="CodeTextBox" CssClass="form-control" runat="server" placeholder="<%$ Resources:DefaultResource, QidCode%>" ></asp:TextBox>
                            <span class="kt-input-icon__icon kt-input-icon__icon--right"><span><i class="la la-align-justify"></i></span></span>
                        </div>
                    </div>
                    <div class="col-2">
                        <div class="kt-grid__item kt-grid__item--middle">
                            <div class="kt-margin-top-20 kt--visible-tablet-and-mobile"></div>
                            <asp:LinkButton ID="SearchLinkButton" runat="server" Text="<%$ Resources:DefaultResource, Search%>"
                                CssClass="btn btn-upper btn-bold btn-font-sm kt-subheader-search__submit-btn" />
                            <asp:LinkButton ID="ClearLinkButton" runat="server" Text="<%$ Resources:DefaultResource, Clear%>"
                                CssClass="btn btn-upper btn-bold btn-font-sm btn-default" OnClick="ClearLinkButton_Click" />
                        </div>
                    </div>
                </div>
            <span class="input-group-btn">

                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-danger" OnClick="ClearLinkButton_Click">
                    <i class="hi hi-remove"></i> <%= Resources.DefaultResource.ClearSearch%>
                </asp:LinkButton>

                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-primary">
                    <i class="fa fa-search"></i><%= Resources.DefaultResource.SearchTitle%>
                </asp:LinkButton>

            </span>
        </div>
        <br />

                                <!-- General Data Block -->
       <div id="Div1" runat="server"></div>
    
        <asp:ListView ID="lv" runat="server" DataKeyNames="QidID" DataSourceID="QidsDS" OnItemCommand="lv_ItemCommand" OnItemDataBound="lv_ItemDataBound" >
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
                                            </asp:RequiredFieldValidator></div>
                                                <label for="BranchIdDropDownList" class="col-2 col-form-label"><asp:Literal ID="BranchIdLiteral" runat="server" Text="<%$ Resources:DefaultResource, BranchName%>" />
                                        </label>
                                        <div class="col-4">
                                            <asp:DropDownList ID="BranchIdDropDownList" runat="server" CssClass="select-chosen"
                                                AppendDataBoundItems="True" DataSourceID="Branches" DataTextField="BRANCHNAME" DataValueField="BRANCHCODE" Text='<%# Bind("BRANCHId") %>'>
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
                                            <span class="kt-switch kt-switch- kt-switch--icon">
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
                                                AppendDataBoundItems="True" DataSourceID="Branches" DataTextField="BRANCHNAME" DataValueField="BRANCHCODE" Text='<%# Bind("BRANCHId") %>'>
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
                                            <span class="kt-switch kt-switch- kt-switch--icon">
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
                      <td>
                        <asp:Label ID="NotesLabel" runat="server" Text='<%# Eval("Notes")%>' />
                       
                    </td>
                   <%-- <td>
                        <asp:Label ID="TotalContractsLabel" runat="server" Text='<%# Eval("BRANCHName") %>' />
                    </td>--%>
                  
                 
                        <td class="text-center block-options">
                           <asp:LinkButton ID="EditLinkButton" runat="server" CommandName="Edit"  data-bs-toggle="kt-tooltip"
                            title="<%$ Resources:DefaultResource, Edite%>" CssClass="btn btn-sm btn-pill btn-icon btn-outline-primary btn-icon"
                            data-original-title="<%$ Resources:DefaultResource, Edite%>">
                                <i class="fa fa-edit"></i>
                        </asp:LinkButton>&nbsp <asp:LinkButton ID="DeleteLinkButton" runat="server" CommandName="Delete"  data-bs-toggle="kt-tooltip"
                            title="<%$ Resources:DefaultResource, Delete%>" CssClass="btn btn-pill btn-outline-danger btn-sm btn-icon" data-original-title="<%$ Resources:DefaultResource, Delete%>"
                            OnClientClick="javascript:if(!confirm('This action will delete the record and all related Records!')){return false;}">
                                <i class="la la-close"></i>
                        </asp:LinkButton>&nbsp <asp:LinkButton ID="LinkButtonDetails" runat="server" CommandName="ViewDetails"  data-bs-toggle="kt-tooltip" Text ="<%$ Resources:DefaultResource, Details%>" title="<%$ Resources:DefaultResource, ViewDetails%>"
                                CssClass="btn btn-outline-success btn-icon-sm" CommandArgument='<%# Eval("qidid") %>' data-original-title="<%$ Resources:DefaultResource, Details%>" >
                              <%--  <i class="la la-angle-down"></i>--%>
                            </asp:LinkButton>
                            
                            <asp:HyperLink ID="LinkButtonprint" runat="server" CommandName="Print"  data-bs-toggle="kt-tooltip" Text ="<%$ Resources:DefaultResource, Print%>" title="<%$ Resources:DefaultResource, Print%>"
                                CssClass="btn btn-outline-info btn-icon-sm" CommandArgument='<%# Eval("qidid") %>' data-original-title="<%$ Resources:DefaultResource, Print%>" NavigateUrl='<%# String.Format("../../Admin/QidShowRpt.aspx?Id=1&QidId={0}",Eval("qidid")) %>' Target="_blank" >
                                <i class="fa fa-print"></i>
                            </asp:HyperLink><%-- <asp:LinkButton ID="LinkButtonConfirm" runat="server" CommandName="Confirm"  data-bs-toggle="kt-tooltip"  PostBackUrl='<%# String.Format("../../QidShowRpt.aspx?QidId={0}",Eval("qidid")) %>'
                            title="<%$ Resources:DefaultResource, Print%>" CssClass="btn btn-info"
                            data-original-title="<%$ Resources:DefaultResource, Print%>">
                                <i class="fa fa-print"></i>        
                        </asp:LinkButton>--%><%--<asp:LinkButton ID="ViewDetailsLinkButton"   data-bs-toggle="kt-tooltip"  CommandName="ViewDetails" runat="server"
                                CssClass="btn btn-brand btn-elevate btn-outline-primary btn-icon-sm" CommandArgument='<%# Eval("qidid") %>'
                            title="<%$ Resources:DefaultResource, ViewDetails%>" data-original-title="<%$ Resources:DefaultResource, ViewDetails%>"
                                   <i class="la la-close"></i>
                            </asp:LinkButton>--%></td></tr><%-- <asp:LinkButton ID="ViewDetailsLinkButton" runat="server"  data-bs-toggle="kt-tooltip"  CommandName="ViewDetails" title="<%$ Resources:DefaultResource, ViewDetails%>" CommandArgument='<%# Eval("qidid")  %>'
                                CssClass="btn btn-sm btn-icon btn-pill btn-outline-primary btn-icon">
                               
                            </asp:LinkButton>--%><%--     <asp:LinkButton ID="ViewDetailsLinkButton" runat="server" CommandName="select"  data-bs-toggle="kt-tooltip" title="<%$ Resources:DefaultResource, ViewDetails%>"
                                CssClass="btn btn-sm btn-icon btn-pill btn-outline-primary btn-icon">
                                <i class="la la-angle-down"></i>
                            </asp:LinkButton>&nbsp 
                              
                              <a href="ActivitiesList.aspx?ID=<%# Eval("STOREID") %>"  data-bs-toggle="kt-tooltip"
                                title="<%= Resources.DefaultResource.ViewDetails%>" class="btn btn-pill btn-outline-info btn-sm btn-icon"><i class="flaticon-map"></i></a>--%></td></tr></ItemTemplate><LayoutTemplate>
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

        <div class="modal fade" id="myModal" tabindex="-1"  aria-labelledby="myLargeModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
                            <div class="modal-dialog modal-dialog-centered" style="max-width: 80%;" role="document">
                                <div class="modal-content">
                                      <div class="modal-header">
                                               

                                            <h4 class="modal-title" id="basicModalLabel">
                                                 <%= Resources.DefaultResource.QidDetailsTitle %>
                                                <%-- <div class="col-10">
                                            <span class="kt-switch kt-switch- kt-switch--icon">
                                                <label>
                                                    <asp:CheckBox ID="AllowDisplayCheckBox" runat="server" Checked='<%# Bind("ActiveFlag") %>' />
                                                    <span></span>
                                                </label>
                                            </span>
                                        </div>--%>

                                            </h4>
                                                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                                     </button>

                                      </div>
                                    <div class="modal-body table-responsive" id ="myBodaydiv">
                                 

 
                            <!-- Basic Form Elements Block -->
                            <div class="block">
                                 
                                <!-- Basic Form Elements Title -->
                                <%--<div class="block-title">
                                    <h2>
                                       
                                         <%= Resources.DefaultResource.QidDetailsTitle %>
                                    </h2>
                                </div>--%>
                                <!-- END Form Elements Title -->
                                <!-- Basic Form Elements Content -->
                                 <div class="kt-portlet">
                                <div class="kt-form kt-form--label-right">
                                <div class="kt-portlet__body">
                                
                                 
                                                
                                       <div class="form-group row">
                                       <label class="col-2 control-label">
                                           <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:DefaultResource, QidCode%>" />

                                       </label>
                                       <div class="col-4">
                                           
                                            <asp:TextBox ID="QidCodeTextBox" runat="server"  CssClass="form-control" placeholder="<%$ Resources:DefaultResource, QidCode%>" />
                                             <asp:RequiredFieldValidator ID="FullNameTextBoxRFV" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="QidCodeTextBox" ValidationGroup="DML" CssClass="label label-warning">
                                            </asp:RequiredFieldValidator>

                                       </div>
                                           <label class="col-2 control-label"><asp:Literal ID="Literal8" runat="server" Text="<%$ Resources:DefaultResource, Date%>" />

                                           </label>
                                           <div class="col-4">
                                           
                                            <asp:TextBox ID="EnterqidDateTextBox" runat="server"  CssClass="form-control date-picker" placeholder="<%$ Resources:DefaultResource, Date%>"  data-date-format="dd/mm/yyyy" AutoComplete="Off" />
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="EnterqidDateTextBox" ValidationGroup="DML" CssClass="label label-warning">
                                            </asp:RequiredFieldValidator></div></div>
                                    <div class="form-group row">
                                        <label class="col-2 control-label">
                                            <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:DefaultResource, BranchName%>" />
                                          </label>
                                        <div class="col-4">

                                            <asp:DropDownList ID="BranchIdDropDownList" runat="server"  CssClass="select-chosen"
                                                AppendDataBoundItems="True" DataTextField="BRANCHNAME" DataValueField="BRANCHCODE" DataSourceID="Branches">
                                                 <%--<asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value="0" />--%>
                                            </asp:DropDownList>

                                             <asp:RequiredFieldValidator ID="RequiredFieldValidatorAccountClosedTo" runat="server" ErrorMessage="<%$ Resources:DefaultResource, RequiredField%>" Display="Dynamic"
                                                ControlToValidate="BranchIdDropDownList"  InitialValue="0"  ValidationGroup="DML" CssClass="label label-warning" SetFocusOnError="true">
                                            </asp:RequiredFieldValidator></div>
                                        <label class="col-2 control-label"><asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:DefaultResource, EmpNo%>" />
                                                                               </label>
                                                <div class="col-4">
                                           
                                            <asp:TextBox ID="EmpNoTextBox" runat="server"  Enabled="false"  CssClass="form-control" placeholder="<%$ Resources:DefaultResource, EmpNo%>" />

                                        </div>
                                    </div>

                                   
                                     <div class="form-group row">
                                        <label class="col-2 control-label">
                                           <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:DefaultResource, Notes%>" />

                                        </label>
                                         <div class="col-10">
                                           
                                            <asp:TextBox ID="TextBoxNotes" runat="server"  Height="50px"  CssClass="form-control" placeholder="<%$ Resources:DefaultResource, Notes%>" TextMode="MultiLine" />

                                        </div>
                                         </div>


                                     <div class="form-group row">
                                         <asp:Button ID="InsertButton" runat="server"  Text="<%$ Resources:DefaultResource, Save%>" CssClass="btn btn-success" ValidationGroup="DML"  OnClick="SaveDataBtn_Click" />
                                     
                                          &nbsp 
                                         <asp:LinkButton ID="LinkButtonprint" runat="server" CommandName="Print"  data-bs-toggle="kt-tooltip" Text ="<%$ Resources:DefaultResource, Print%>" title="<%$ Resources:DefaultResource, Print%>"
                                CssClass="btn btn-outline-info btn-icon-sm" CommandArgument='<%# Eval("qidid") %>' data-original-title="<%$ Resources:DefaultResource, Print%>" PostBackUrl='<%# String.Format("../../Admin/QidShowRpt.aspx?Id=1&QidId={0}",Eval("qidid")) %>' >
                                <i class="fa fa-print"></i>
                            </asp:LinkButton>
                                             &nbsp <asp:Button ID="CancelButton" runat="server"  Text="<%$ Resources:DefaultResource, Cancel%>" CssClass="btn btn-warning "  />
                                         <%--<asp:LinkButton ID="ViewDetailsLinkButton"   data-bs-toggle="kt-tooltip"  CommandName="ViewDetails" runat="server"
                                CssClass="btn btn-brand btn-elevate btn-outline-primary btn-icon-sm" CommandArgument='<%# Eval("qidid") %>'
                            title="<%$ Resources:DefaultResource, ViewDetails%>" data-original-title="<%$ Resources:DefaultResource, ViewDetails%>"
                                   <i class="la la-close"></i>
                            </asp:LinkButton>--%></div>
                                    <div class="row">
                                      
                                                 <div id="ErrorDetDiv" class="col-12" runat="server"></div>
                                            
                                      </div>
                               
                                             
                                     </div>
                                    </div>
                                     </div>



     <div class="row">
         <asp:ListView ID="ListViewQid" runat="server" DataKeyNames="QidID"  OnItemCommand="ListViewQid_ItemCommand" OnItemDataBound="lv_ItemDataBound" AutoGenerateColumns="false">
            
            
          <%--  <EmptyDataTemplate>  </EmptyDataTemplate>--%>
                <ItemTemplate>
                      <tr style="">
               <asp:TextBox ID="txtqidid" CssClass="form-control" runat="server" Text='<%# Eval("qidid") %>' Visible="false" />
                             <asp:TextBox ID="txtID" CssClass="form-control" runat="server" Text='<%# Eval("Id") %>' Visible="false" />
                 <asp:TextBox ID="txtTypeId" CssClass="form-control" runat="server" Text='<%# Eval("QidType") %>' Visible="false" />
                <asp:TextBox ID="txtInvId" CssClass="form-control" runat="server"  Visible="false"  Text='<%# Eval("InvId") %>' />
                  <td>
                     <asp:TextBox ID="txtFromValue" CssClass="form-control" runat="server" Text='<%# Eval("FromValue","{0:N3}") %>' TextMode="Number" /> </td>
                   
                   <td>
                     <asp:TextBox ID="txtToValue" CssClass="form-control" runat="server" Text='<%# Eval("ToValue","{0:N3}") %>' TextMode="Number" />  
                   </td>          
                    <td>
                        <asp:DropDownList ID="ddlACCOUNTID" runat="server" DataSourceID="AccountDS"  AppendDataBoundItems="true"  CssClass="select-chosen"      DataTextField="accountname"
                            DataValueField="AccountId"  Text='<%# Bind("ACCOUNTID") %>' AutoPostBack="False" CausesValidation="False" Width="100%">     
                        <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value=""></asp:ListItem></asp:DropDownList>


                    </td><td>
                     <asp:DropDownList ID="ddlCostId" runat="server" DataSourceID="CostDS"  DataTextField="costName"  CssClass="form-control" DataValueField="costId" AppendDataBoundItems="true" 
                         Text='<%# Bind("CostId") %>'>
                         
                          <asp:ListItem Text="<%$ Resources:DefaultResource, SelectItemPlease%>" Value=""></asp:ListItem></asp:DropDownList></td><td class="text-center block-options">
                           <asp:LinkButton ID="AddLinkButton" runat="server" CommandName="AddNew"  data-bs-toggle="kt-tooltip"
                            title="<%$ Resources:DefaultResource, AddNewDetails%>" CssClass="btn btn-sm btn-pill btn-icon btn-outline-primary btn-icon" OnClick="AddQidDetLinkButton_Click"
                            data-original-title="<%$ Resources:DefaultResource, AddNewDetails%>">
                                <i class="fa fa-plus"></i>
                        </asp:LinkButton>&nbsp <asp:LinkButton ID="DeleteLinkButton" runat="server" CommandName="ItemDelete"  data-bs-toggle="kt-tooltip"
                            title="<%$ Resources:DefaultResource, Delete%>" CssClass="btn btn-pill btn-outline-danger btn-sm btn-icon" data-original-title="<%$ Resources:DefaultResource, Delete%>"
                            OnClientClick="javascript:if(!confirm('This action will delete the record and all related Records!')){return false;}">
                                <i class="la la-close"></i>
                        </asp:LinkButton>&nbsp <%--     <asp:LinkButton ID="ViewDetailsLinkButton" runat="server" CommandName="select"  data-bs-toggle="kt-tooltip" title="<%$ Resources:DefaultResource, ViewDetails%>"
                                CssClass="btn btn-sm btn-icon btn-pill btn-outline-primary btn-icon">
                                <i class="la la-angle-down"></i>
                            </asp:LinkButton>
                                  
                                  &nbsp 
                              
                              <a href="ActivitiesList.aspx?ID=<%# Eval("STOREID") %>"  data-bs-toggle="kt-tooltip"
                                title="<%= Resources.DefaultResource.ViewDetails%>" class="btn btn-pill btn-outline-info btn-sm btn-icon"><i class="flaticon-map"></i></a>--%></td></tr></ItemTemplate><LayoutTemplate>
                <table class="table table-striped table-bordered table-hover table-checkable">
                    <thead class="thead-dark">
                        <tr>
                            <th style="width: 15%">
                                <asp:LinkButton ID="MagazineTitleLinkButton" runat="server" CommandArgument="Credit" CommandName="Sort" Text="<%$ Resources:DefaultResource, AccountCredit %>" /></th>
                            <th style="width: 15%">
                                <asp:LinkButton ID="TitleLinkButton" runat="server" CommandArgument="Debit" CommandName="Sort" Text="<%$ Resources:DefaultResource, AccountDebit %>" /></th>
                            <th style="width: 30%">
                                <asp:LinkButton ID="AccountnamekButton" runat="server" CommandArgument="AccountName" CommandName="Sort" Text="<%$ Resources:DefaultResource, AccountName %>" /></th>
                            
                            
                               <th style="width: 30%">
                                <asp:LinkButton ID="CostCenterLinkButton" runat="server" CommandArgument="CostCenterName" CommandName="Sort" Text="<%$ Resources:DefaultResource, CostCenter %>" /></th>

                        <th style="width: 10%">
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
                                       <%-- <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Link" ButtonCssClass="pagelink" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" NextPageText="التالي" />
                                            <asp:NumericPagerField ButtonType="Link" ButtonCount="10" CurrentPageLabelCssClass="pagelink Current" NumericButtonCssClass="pagelink" />
                                            <asp:NextPreviousPagerField ButtonType="Link" ButtonCssClass="pagelink" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" PreviousPageText="السابق" />
                                  
                                            
                                        </Fields>--%>
                                    </asp:DataPager>
                                      


                                </div></td></tr></tfoot></table></LayoutTemplate></asp:ListView>

        <%-- <script type="text/javascript">
             $(document).ready(function () {
              
                 initSelect2();
             });

             function pageLoad() {
                 initSelect2();
             }

             function initSelect2() {
                 $('.form-select-lg').select2();
             }
         </script>--%>
     </div>
 <div class="row">
     <label class="col-2 control-label">
           <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:DefaultResource, TotalCredit%>" />

         </label>
                                         <div class="col-4">
                                             <asp:Label ID="TotalCredit" runat="server" Text="" CssClass="text-primary font-weight-bold"></asp:Label></div><label class="col-2 control-label"><asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:DefaultResource, TotalDebit%>" />

         </label>
                                         <div class="col-4">
                                            <asp:Label ID="TotalDebit" runat="server" Text="" CssClass="text-danger font-weight-bold"></asp:Label><%-- <asp:TextBox ID="TotalDebit" runat="server"   CssClass="form-control" placeholder="<%$ Resources:DefaultResource, TotalDebit%>"  Enabled="False" />--%></div></div>

                            </div>

                                    </div></div>

                            </div>
           

        </div>

    </div>

        
        
        <asp:ObjectDataSource ID="QidsDS" runat="server"  SelectMethod="Read" TypeName="BOL.Qids" DeleteMethod="DML" InsertMethod="DML" UpdateMethod="DML"><DeleteParameters><asp:Parameter Name="ActionCode" Type="String" /><asp:Parameter Name="qidid" Type="Int64" /><asp:Parameter Name="qidcode" Type="String" /><asp:Parameter Name="qidDate" Type="String" /><asp:Parameter Name="Notes" Type="String" /><asp:Parameter Name="recitetype" Type="Int32" /><asp:Parameter Name="BranchId" Type="Int64" /><asp:Parameter Name="OrgId" Type="Int64" /><asp:Parameter Name="EmpId" Type="Int64" /><asp:Parameter Name="repeated" Type="Boolean" /><asp:Parameter Name="BankAccId" Type="Int64" /><asp:Parameter Name="ChequeNo" Type="String" /><asp:Parameter Name="InvId" Type="Int64" /><asp:Parameter Name="ReorderInvId" Type="Int64" /><asp:Parameter Name="PaymentType" Type="Int32" /><asp:Parameter Name="PaymentTo" Type="String" /><asp:Parameter Name="CreatedBy" Type="Int32" /><asp:Parameter Name="UpdateBy" Type="Int32" /><asp:Parameter Name="DeletedBy" Type="Int32" /><asp:Parameter Name="TotalDesc" Type="String" /><asp:Parameter Direction="InputOutput" Name="OutId" Type="Object" /></DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ActionCode" Type="String" /><asp:Parameter Name="qidid" Type="Int64" /><asp:Parameter Name="qidcode" Type="String" /><asp:Parameter Name="qidDate" Type="String" /><asp:Parameter Name="Notes" Type="String" /><asp:Parameter Name="recitetype" Type="Int32" DefaultValue="1" /><asp:Parameter Name="BranchId" Type="Int64" /><asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" /><asp:Parameter Name="EmpId" Type="Int64" /><asp:Parameter Name="repeated" Type="Boolean" /><asp:Parameter Name="BankAccId" Type="Int64" /><asp:Parameter Name="ChequeNo" Type="String" /><asp:Parameter Name="InvId" Type="Int64" /><asp:Parameter Name="ReorderInvId" Type="Int64" /><asp:Parameter Name="PaymentType" Type="Int32" /><asp:Parameter Name="PaymentTo" Type="String" /><asp:Parameter Name="CreatedBy" Type="Int32" /><asp:Parameter Name="UpdateBy" Type="Int32" /><asp:Parameter Name="DeletedBy" Type="Int32" /><asp:Parameter Name="TotalDesc" Type="String" /><asp:Parameter Direction="InputOutput" Name="OutId" Type="Object" /></InsertParameters>
            <SelectParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="1" /><asp:ControlParameter ControlID="StartDateTextBox" Name="StartDate" PropertyName="Text" Type="String" /><asp:ControlParameter ControlID="EndDateTextBox" Name="EndDate" PropertyName="Text" Type="String" /><asp:QueryStringParameter DefaultValue="" Name="recitetype" QueryStringField="TypeId" Type="Int32" /><asp:Parameter Name="QidId" Type="Int64" DefaultValue="" /><asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" /><asp:Parameter Name="BRANCHId" Type="Int64" /><asp:Parameter Name="EmpId" Type="Int64" /><asp:QueryStringParameter DefaultValue="" Name="repeated" QueryStringField="repeated" Type="Int32" /><asp:ControlParameter ControlID="CodeTextBox" DefaultValue="" Name="SearchText" PropertyName="Text" Type="String" /></SelectParameters><UpdateParameters><asp:Parameter Name="ActionCode" Type="String" /><asp:Parameter Name="qidid" Type="Int64" /><asp:Parameter Name="qidcode" Type="String" /><asp:Parameter Name="qidDate" Type="String" /><asp:Parameter Name="Notes" Type="String" /><asp:Parameter Name="recitetype" Type="Int32" DefaultValue="1" /><asp:Parameter Name="BranchId" Type="Int64" /><asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" /><asp:Parameter Name="EmpId" Type="Int64" /><asp:Parameter Name="repeated" Type="Boolean" /><asp:Parameter Name="BankAccId" Type="Int64" /><asp:Parameter Name="ChequeNo" Type="String" /><asp:Parameter Name="InvId" Type="Int64" /><asp:Parameter Name="ReorderInvId" Type="Int64" /><asp:Parameter Name="PaymentType" Type="Int32" /><asp:Parameter Name="PaymentTo" Type="String" /><asp:Parameter Name="CreatedBy" Type="Int32" /><asp:Parameter Name="UpdateBy" Type="Int32" /><asp:Parameter Name="DeletedBy" Type="Int32" /><asp:Parameter Name="TotalDesc" Type="String" /><asp:Parameter Name="OutId" Type="Object" Direction="InputOutput" /></UpdateParameters></asp:ObjectDataSource>

    <asp:TextBox ID="txtOrgId" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1"></asp:TextBox><asp:ObjectDataSource ID="Branches" runat="server" OldValuesParameterFormatString="original_{0}"  SelectMethod="GetDataByOrgId" TypeName="NEWERPDataSetTableAdapters.BRANCHESTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update"><DeleteParameters><asp:Parameter Name="Original_BRANCHCODE" Type="Int64" /></DeleteParameters><InsertParameters><asp:Parameter Name="BRANCHNAME" Type="String" /><asp:Parameter Name="CompanyName" Type="String" /><asp:Parameter Name="Address" Type="String" /><asp:Parameter Name="TelPhone" Type="String" /><asp:Parameter Name="HintName" Type="String" /><asp:Parameter Name="SalInvSerial" Type="Int64" /><asp:Parameter Name="PurchInvSerial" Type="Int64" /><asp:Parameter Name="InvOrderSerial" Type="Int64" /><asp:Parameter Name="OrderSerial" Type="Int64" /><asp:Parameter Name="MovementSerial" Type="Int64" /><asp:Parameter Name="salesaccid" Type="Int16" /><asp:Parameter Name="purchaseaccid" Type="Int16" /><asp:Parameter Name="boxaccid" Type="Int64" /><asp:Parameter Name="bankaccid" Type="Int64" /><asp:Parameter Name="Visaaccid" Type="Int64" /><asp:Parameter Name="Masteraccid" Type="Int64" /><asp:Parameter Name="KeyNetaccid" Type="Int64" /><asp:Parameter Name="Otheraccid" Type="Int64" /><asp:Parameter Name="VisaComaccid" Type="Int64" /><asp:Parameter Name="MasterComaccid" Type="Int64" /><asp:Parameter Name="KeyNetComaccid" Type="Int64" /><asp:Parameter Name="OtherComaccid" Type="Int64" /><asp:Parameter Name="salesAgalaccid" Type="Int64" /><asp:Parameter Name="purchaseAgalaaccid" Type="Int64" /><asp:Parameter Name="OwnerName" Type="String" /><asp:Parameter Name="OwnerNat" Type="String" /><asp:Parameter Name="BlockNo" Type="String" /><asp:Parameter Name="Area" Type="String" /><asp:Parameter Name="GovId" Type="Int32" /><asp:Parameter Name="Gada" Type="String" /><asp:Parameter Name="HouseType" Type="String" /><asp:Parameter Name="Floor" Type="String" /><asp:Parameter Name="FlatNo" Type="String" /><asp:Parameter Name="Street" Type="String" /><asp:Parameter Name="MailSign" Type="String" /><asp:Parameter Name="MailBox" Type="String" /><asp:Parameter Name="SignatureOwner" Type="String" /><asp:Parameter Name="FileNo" Type="String" /><asp:Parameter Name="CommerName" Type="String" /><asp:Parameter Name="CommerRecord" Type="String" /><asp:Parameter Name="CivilId" Type="String" /><asp:Parameter Name="uinNum" Type="String" /><asp:Parameter Name="ActivityEng" Type="String" /><asp:Parameter Name="CompanyNameEng" Type="String" /><asp:Parameter Name="SignatureOwnerEng" Type="String" /><asp:Parameter Name="ContractNo" Type="String" /><asp:Parameter Name="LawNo" Type="String" /><asp:Parameter Name="Email" Type="String" /><asp:Parameter Name="OrgId" Type="Int64" /><asp:Parameter Name="DiscountValue" Type="Decimal" /></InsertParameters><SelectParameters><asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" /></SelectParameters><UpdateParameters><asp:Parameter Name="BRANCHNAME" Type="String" /><asp:Parameter Name="CompanyName" Type="String" /><asp:Parameter Name="Address" Type="String" /><asp:Parameter Name="TelPhone" Type="String" /><asp:Parameter Name="HintName" Type="String" /><asp:Parameter Name="SalInvSerial" Type="Int64" /><asp:Parameter Name="PurchInvSerial" Type="Int64" /><asp:Parameter Name="InvOrderSerial" Type="Int64" /><asp:Parameter Name="OrderSerial" Type="Int64" /><asp:Parameter Name="MovementSerial" Type="Int64" /><asp:Parameter Name="salesaccid" Type="Int16" /><asp:Parameter Name="purchaseaccid" Type="Int16" /><asp:Parameter Name="boxaccid" Type="Int64" /><asp:Parameter Name="bankaccid" Type="Int64" /><asp:Parameter Name="Visaaccid" Type="Int64" /><asp:Parameter Name="Masteraccid" Type="Int64" /><asp:Parameter Name="KeyNetaccid" Type="Int64" /><asp:Parameter Name="Otheraccid" Type="Int64" /><asp:Parameter Name="VisaComaccid" Type="Int64" /><asp:Parameter Name="MasterComaccid" Type="Int64" /><asp:Parameter Name="KeyNetComaccid" Type="Int64" /><asp:Parameter Name="OtherComaccid" Type="Int64" /><asp:Parameter Name="salesAgalaccid" Type="Int64" /><asp:Parameter Name="purchaseAgalaaccid" Type="Int64" /><asp:Parameter Name="OwnerName" Type="String" /><asp:Parameter Name="OwnerNat" Type="String" /><asp:Parameter Name="BlockNo" Type="String" /><asp:Parameter Name="Area" Type="String" /><asp:Parameter Name="GovId" Type="Int32" /><asp:Parameter Name="Gada" Type="String" /><asp:Parameter Name="HouseType" Type="String" /><asp:Parameter Name="Floor" Type="String" /><asp:Parameter Name="FlatNo" Type="String" /><asp:Parameter Name="Street" Type="String" /><asp:Parameter Name="MailSign" Type="String" /><asp:Parameter Name="MailBox" Type="String" /><asp:Parameter Name="SignatureOwner" Type="String" /><asp:Parameter Name="FileNo" Type="String" /><asp:Parameter Name="CommerName" Type="String" /><asp:Parameter Name="CommerRecord" Type="String" /><asp:Parameter Name="CivilId" Type="String" /><asp:Parameter Name="uinNum" Type="String" /><asp:Parameter Name="ActivityEng" Type="String" /><asp:Parameter Name="CompanyNameEng" Type="String" /><asp:Parameter Name="SignatureOwnerEng" Type="String" /><asp:Parameter Name="ContractNo" Type="String" /><asp:Parameter Name="LawNo" Type="String" /><asp:Parameter Name="Email" Type="String" /><asp:Parameter Name="OrgId" Type="Int64" /><asp:Parameter Name="DiscountValue" Type="Decimal" /><asp:Parameter Name="Original_BRANCHCODE" Type="Int64" /></UpdateParameters></asp:ObjectDataSource>

    <asp:TextBox ID="txtFromValue" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1"></asp:TextBox><asp:TextBox ID="txtAccountId" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1"></asp:TextBox><asp:HiddenField ID="txtQidId" runat="server" Value="1" />
         <asp:HiddenField ID="txtQidSerial" runat="server" Value="1" /><asp:HiddenField ID="txtTypeId" runat="server" Value="1" /><asp:TextBox ID="txtToValue" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1"></asp:TextBox><asp:TextBox ID="txtCostId" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1"></asp:TextBox><asp:TextBox ID="txtDesc" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1" Height="22px"></asp:TextBox><asp:TextBox ID="txtId" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1" Height="22px"></asp:TextBox><asp:TextBox ID="txtEnterDate" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1" Height="22px"></asp:TextBox></div></div><asp:ObjectDataSource ID="AccountDS" runat="server"  SelectMethod="Read" TypeName="BOL.Accounts" OldValuesParameterFormatString="original_{0}"><SelectParameters><asp:Parameter DefaultValue="3" Name="ActionCode" Type="String" /><asp:Parameter Name="AccountId" Type="Int64" /><asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" /><asp:Parameter Name="BRANCHId" Type="Int64" /><asp:Parameter Name="ParentAccountId" Type="Int64" /><asp:Parameter Name="CostId" Type="Int64" /><asp:Parameter Name="StartDate" Type="String" /><asp:Parameter Name="EndDate" Type="String" /><asp:Parameter Name="SearchText" Type="String" /><asp:Parameter Name="AccountCode" Type="String" /><asp:Parameter Name="AccountName" Type="String" /></SelectParameters></asp:ObjectDataSource>

    

    <asp:ObjectDataSource ID="CostDS" runat="server"  SelectMethod="GetDataByMain" TypeName="NEWERPDataSetTableAdapters.CostCentersTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update"><DeleteParameters><asp:Parameter Name="Original_costid" Type="Int64" /><asp:Parameter Name="Original_costName" Type="String" /><asp:Parameter Name="Original_costCode" Type="String" /><asp:Parameter Name="Original_costSName" Type="String" /><asp:Parameter Name="Original_costparentId" Type="Int32" /><asp:Parameter Name="Original_root" Type="Boolean" /><asp:Parameter Name="Original_Totalfromvalue" Type="Decimal" /><asp:Parameter Name="Original_Totaltovalue" Type="Decimal" /><asp:Parameter Name="Original_startbalancefrom" Type="Double" /><asp:Parameter Name="Original_startdate" Type="DateTime" /><asp:Parameter Name="Original_startbalanceto" Type="Double" /><asp:Parameter Name="Original_balance" Type="Boolean" /><asp:Parameter Name="Original_costType" Type="Int32" /><asp:Parameter Name="Original_ClosedTo" Type="Int64" /><asp:Parameter Name="Original_MainNode" Type="Boolean" /><asp:Parameter Name="Original_ProcessFlag" Type="Boolean" /><asp:Parameter Name="Original_display_Flag" Type="Boolean" /><asp:Parameter Name="Original_LastSerialNo" Type="String" /><asp:Parameter Name="Original_AccLevel" Type="Int32" /><asp:Parameter Name="Original_MainParentAccId" Type="Int64" /></DeleteParameters><InsertParameters><asp:Parameter Name="costName" Type="String" /><asp:Parameter Name="costCode" Type="String" /><asp:Parameter Name="costSName" Type="String" /><asp:Parameter Name="costparentId" Type="Int32" /><asp:Parameter Name="root" Type="Boolean" /><asp:Parameter Name="Totalfromvalue" Type="Decimal" /><asp:Parameter Name="Totaltovalue" Type="Decimal" /><asp:Parameter Name="notes" Type="String" /><asp:Parameter Name="startbalancefrom" Type="Double" /><asp:Parameter Name="startdate" Type="DateTime" /><asp:Parameter Name="startbalanceto" Type="Double" /><asp:Parameter Name="balance" Type="Boolean" /><asp:Parameter Name="costType" Type="Int32" /><asp:Parameter Name="ClosedTo" Type="Int64" /><asp:Parameter Name="MainNode" Type="Boolean" /><asp:Parameter Name="ProcessFlag" Type="Boolean" /><asp:Parameter Name="display_Flag" Type="Boolean" /><asp:Parameter Name="LastSerialNo" Type="String" /><asp:Parameter Name="AccLevel" Type="Int32" /><asp:Parameter Name="MainParentAccId" Type="Int64" /></InsertParameters><UpdateParameters><asp:Parameter Name="costName" Type="String" /><asp:Parameter Name="costCode" Type="String" /><asp:Parameter Name="costSName" Type="String" /><asp:Parameter Name="costparentId" Type="Int32" /><asp:Parameter Name="root" Type="Boolean" /><asp:Parameter Name="Totalfromvalue" Type="Decimal" /><asp:Parameter Name="Totaltovalue" Type="Decimal" /><asp:Parameter Name="notes" Type="String" /><asp:Parameter Name="startbalancefrom" Type="Double" /><asp:Parameter Name="startdate" Type="DateTime" /><asp:Parameter Name="startbalanceto" Type="Double" /><asp:Parameter Name="balance" Type="Boolean" /><asp:Parameter Name="costType" Type="Int32" /><asp:Parameter Name="ClosedTo" Type="Int64" /><asp:Parameter Name="MainNode" Type="Boolean" /><asp:Parameter Name="ProcessFlag" Type="Boolean" /><asp:Parameter Name="display_Flag" Type="Boolean" /><asp:Parameter Name="LastSerialNo" Type="String" /><asp:Parameter Name="AccLevel" Type="Int32" /><asp:Parameter Name="MainParentAccId" Type="Int64" /><asp:Parameter Name="Original_costid" Type="Int64" /><asp:Parameter Name="Original_costName" Type="String" /><asp:Parameter Name="Original_costCode" Type="String" /><asp:Parameter Name="Original_costSName" Type="String" /><asp:Parameter Name="Original_costparentId" Type="Int32" /><asp:Parameter Name="Original_root" Type="Boolean" /><asp:Parameter Name="Original_Totalfromvalue" Type="Decimal" /><asp:Parameter Name="Original_Totaltovalue" Type="Decimal" /><asp:Parameter Name="Original_startbalancefrom" Type="Double" /><asp:Parameter Name="Original_startdate" Type="DateTime" /><asp:Parameter Name="Original_startbalanceto" Type="Double" /><asp:Parameter Name="Original_balance" Type="Boolean" /><asp:Parameter Name="Original_costType" Type="Int32" /><asp:Parameter Name="Original_ClosedTo" Type="Int64" /><asp:Parameter Name="Original_MainNode" Type="Boolean" /><asp:Parameter Name="Original_ProcessFlag" Type="Boolean" /><asp:Parameter Name="Original_display_Flag" Type="Boolean" /><asp:Parameter Name="Original_LastSerialNo" Type="String" /><asp:Parameter Name="Original_AccLevel" Type="Int32" /><asp:Parameter Name="Original_MainParentAccId" Type="Int64" /></UpdateParameters></asp:ObjectDataSource>

    

    