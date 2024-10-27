<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Sch_TeacherSubjectsGovs.ascx.cs" Inherits="WebSchool.ADMIN.Controls.School.Sch_TeacherSubjectsGovs" %>

<div class="row">
<div class="col-md-12 col-sm-12">
<!-- Lightbox Gallery Block -->
<div class="block">
    <%--<div class="content-header">
    <div class="header-section">
        <h1>
            <i class="gi gi-user"></i><%= Resources.DefaultResource.Branches%> 
        </h1>
    </div>
</div>--%>   
<ul class="breadcrumb breadcrumb-top">
    <li><a href="Main.aspx"><%= Resources.DefaultResource.Main%> </a></li>
    <li> <%= Resources.DefaultResource.TeacherSubjects%> </li> - 
    <li> <asp:Label ID="labName" runat="server" Text="Label"></asp:Label> </li>
    
</ul>
       
<div class="block">
    <!-- Table Styles Title -->
    <div class="block-title">
        <h2><strong><%= Resources.DefaultResource.List%>  </strong> <%= Resources.DefaultResource.TeacherSubjects%> </h2>
        <div class="block-options pull-right">
            <asp:LinkButton ID="NewRecord" runat="server" CssClass="btn btn-sm btn-success" data-toggle="tooltip" title="<%$ Resources:DefaultResource, NewRecord%>"  data-original-title="<%$ Resources:DefaultResource, NewRecord%>" OnClick="NewRecord_Click"> <i class="fa fa-file"></i></asp:LinkButton>
        </div>
    </div>
    <!-- END Table Styles Title -->

    <div class="gallery gallery-widget" data-toggle="lightbox-gallery">
               
       <!-- General Data Block -->                             
        <div class="input-group">
            <asp:TextBox ID="SearchTextBox" runat="server" CssClass="form-control" placeholder="<%$ Resources:DefaultResource, Search%>"></asp:TextBox>
            <span class="input-group-btn">
                
                <asp:LinkButton ID="ClearLinkButton" runat="server" CssClass="btn btn-danger" OnClick="ClearLinkButton_Click"> <i class="hi hi-remove"></i><%= Resources.DefaultResource.ClearSearch%></asp:LinkButton>
               
                <asp:LinkButton ID="SearchLinkButton" runat="server" CssClass="btn btn-primary"> <i class="fa fa-search"></i><%= Resources.DefaultResource.SearchTitle%></asp:LinkButton>

            </span>
        </div>
        <br />
    <div id="ErrorDiv" runat="server"></div>
    <asp:ListView ID="lv" runat="server" DataKeyNames="TeacherId" DataSourceID="TeacherSubjectsGovsDS" OnItemCommand="lv_ItemCommand" OnItemDataBound="lv_ItemDataBound" style="margin-top: 1px">
                       
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td><%= Resources.DefaultResource.DataNotFound %></td></tr></table></EmptyDataTemplate>
           
            <ItemTemplate>
                <tr >
                    <td>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Name") %>' />
                    </td>
                    <td>
                        <asp:Label ID="GEIDLabel" runat="server" Text='<%# Eval("StageName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("PeriodName") %>' />
                    </td>
                  <td>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("SubName") %>' />
                    </td>
                  
                  
                    <td>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("GovDesc") %>' />
                    </td>

                   <td class="text-center block-options">
                     
                         <asp:LinkButton ID="EditLinkButton" runat="server" CommandName="Edit" Text="" data-toggle="tooltip" title="<%$ Resources:DefaultResource, Edite%>" CssClass="btn btn-sm btn-default" data-original-title="<%$ Resources:DefaultResource, Edite%>">
                          
                                <i class="fa fa-pencil"></i>
                        </asp:LinkButton>
                       
                      
                            <asp:LinkButton ID="DeleteLinkButton" runat="server" CommandName="Delete" Text="" data-toggle="tooltip" title="<%$ Resources:DefaultResource, Delete%>" CssClass="btn btn-sm btn-danger" data-original-title="<%$ Resources:DefaultResource, Delete%>"  OnClientClick="javascript:if(!confirm('هل انت متأكد من حذف هذا السجل؟')){return false;}">
                                    <i class="fa fa-times"></i>
                            </asp:LinkButton>

                   
                        

                    </td>
                     
                              
                </tr>

            </ItemTemplate>
        <LayoutTemplate>
                
                <table id="general-table" class="table table-striped table-vcenter table-bordered table-condensed">
                    <thead >
                        <tr>
                              <th class ="text-center">
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument="Name" CommandName="Sort" Text="<%$ Resources:DefaultResource, CardName%>" />
                            </th> 
                            <th class ="text-center">
                                <asp:LinkButton ID="MagazineTitleLinkButton" runat="server" CommandArgument="StageName" CommandName="Sort" Text="<%$ Resources:DefaultResource, StageName%>" />
                            </th>
                            <th class ="text-center">
                                <asp:LinkButton ID="TitleLinkButton" runat="server" CommandArgument="PeriodName" CommandName="Sort" Text="<%$ Resources:DefaultResource, StudentPeriod%>" />
                            </th>
                             <th class ="text-center">
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument="SubName" CommandName="Sort" Text="<%$ Resources:DefaultResource, SubjectName%>" />
                            </th>                    
                           
                            <th class ="text-center">
                                <asp:LinkButton ID="LinkButton4" runat="server" CommandArgument="GovDesc" CommandName="Sort" Text="<%$ Resources:DefaultResource, GovDesc%>" />
                            </th>

                       
                            <th class ="text-center" style="width :10%">
                                <asp:Literal runat="server" Text="<%$ Resources:DefaultResource, Actions%>" /></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr id="itemPlaceholder" runat="server">
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="11">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="50">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" NextPageText="<%$ Resources:DefaultResource, Next%>" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" PreviousPageText="<%$ Resources:DefaultResource, Pervious%>" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </LayoutTemplate>
        </asp:ListView>
                           
                           
        <asp:ObjectDataSource ID="TeacherSubjectsGovsDS" runat="server"  SelectMethod="Read" TypeName="BOL.Sch_TeacherSubjectsGovs" OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:Parameter DefaultValue="3" Name="ActionCode" Type="String" />
                <asp:QueryStringParameter DefaultValue="" Name="TeacherId" QueryStringField="TeacherId" Type="Int64" />
                <asp:Parameter Name="SubjectId" Type="Int64" />
                <asp:Parameter Name="PeriodId" Type="Int64" DefaultValue="" />
                <asp:Parameter DefaultValue="" Name="StageId" Type="Int64" />
                <asp:QueryStringParameter Name="GovId" QueryStringField="GovId" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:QueryStringParameter DefaultValue="" Name="SubjectCommonId" QueryStringField="SubjectCommonId" Type="Int32" />
                <asp:Parameter Name="BranchId" Type="Int64" />
                <asp:Parameter Name="SearchText" Type="String" />
            </SelectParameters></asp:ObjectDataSource>

    <asp:TextBox ID="txtOrgId" runat="server" 
        Visible="False" ></asp:TextBox>

    </div>

</div>
                                </div> 
           </div> 
     </div><asp:ObjectDataSource ID="SubjectsDS" runat="server"  SelectMethod="Read" TypeName="BOL.Sch_Subjects" DeleteMethod="DML" InsertMethod="DML" UpdateMethod="DML" OldValuesParameterFormatString="original_{0}"><DeleteParameters><asp:Parameter Name="ActionCode" Type="String" />
        <asp:Parameter Name="SubId" Type="Int64" />
        <asp:Parameter Name="SubCode" Type="String" />
        <asp:Parameter Name="SubName" Type="String" />
        <asp:Parameter Name="PeriodId" Type="Int64" />
        <asp:Parameter Name="GroupHours" Type="Decimal" />
        <asp:Parameter Name="PersonHours" Type="Decimal" />
        <asp:Parameter Name="MonthPrice" Type="Decimal" />
        <asp:Parameter Name="HourPrice" Type="Decimal" />
        <asp:Parameter Name="Notes" Type="String" />
        <asp:Parameter Name="OrgId" Type="Int64" />
        <asp:Parameter Name="BranchId" Type="Int64" />
        <asp:Parameter Name="CreatedBy" Type="Int32" />
        <asp:Parameter Name="UpdateBy" Type="Int32" />
        <asp:Parameter Name="DeletedBy" Type="Int32" />
        </DeleteParameters><InsertParameters><asp:Parameter Name="ActionCode" Type="String" /><asp:Parameter Name="SubId" Type="Int64" /><asp:Parameter Name="SubCode" Type="String" /><asp:Parameter Name="SubName" Type="String" /><asp:Parameter Name="PeriodId" Type="Int64" /><asp:Parameter Name="GroupHours" Type="Decimal" /><asp:Parameter Name="PersonHours" Type="Decimal" /><asp:Parameter Name="MonthPrice" Type="Decimal" /><asp:Parameter Name="HourPrice" Type="Decimal" /><asp:Parameter Name="Notes" Type="String" /><asp:Parameter Name="OrgId" Type="Int64" /><asp:Parameter Name="BranchId" Type="Int64" /><asp:Parameter Name="CreatedBy" Type="Int32" /><asp:Parameter Name="UpdateBy" Type="Int32" /><asp:Parameter Name="DeletedBy" Type="Int32" /></InsertParameters><SelectParameters>
        <asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" />
        <asp:Parameter Name="SubId" Type="Int64" />
            <asp:Parameter DefaultValue="-1" Name="PeriodId" Type="Int64"></asp:Parameter>

            <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
        <asp:Parameter Name="BranchId" Type="Int64" />
        <asp:Parameter Name="SearchText" Type="String" />
        </SelectParameters><UpdateParameters><asp:Parameter Name="ActionCode" Type="String" /><asp:Parameter Name="SubId" Type="Int64" /><asp:Parameter Name="SubCode" Type="String" /><asp:Parameter Name="SubName" Type="String" /><asp:Parameter Name="PeriodId" Type="Int64" /><asp:Parameter Name="GroupHours" Type="Decimal" /><asp:Parameter Name="PersonHours" Type="Decimal" /><asp:Parameter Name="MonthPrice" Type="Decimal" /><asp:Parameter Name="HourPrice" Type="Decimal" /><asp:Parameter Name="Notes" Type="String" /><asp:Parameter Name="OrgId" Type="Int64" /><asp:Parameter Name="BranchId" Type="Int64" /><asp:Parameter Name="CreatedBy" Type="Int32" /><asp:Parameter Name="UpdateBy" Type="Int32" /><asp:Parameter Name="DeletedBy" Type="Int32" /></UpdateParameters></asp:ObjectDataSource>


                                 

       
                                
<asp:ObjectDataSource ID="PeriodsDS" runat="server" OldValuesParameterFormatString="original_{0}"  SelectMethod="Read" TypeName="BOL.Sch_Periods"><SelectParameters>
        <asp:Parameter DefaultValue="3" Name="ActionCode" Type="String" />
        <asp:Parameter Name="PeriodId" Type="Int64" DefaultValue="" />
        <asp:Parameter Name="StageId" Type="Int64" />
        <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
        <asp:Parameter Name="BranchId" Type="Int64" />
        </SelectParameters></asp:ObjectDataSource>

<asp:ObjectDataSource ID="StageDS" runat="server" OldValuesParameterFormatString="original_{0}"  SelectMethod="Read" TypeName="BOL.Sch_Stages"><SelectParameters>
        <asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" />
        <asp:Parameter Name="StageId" Type="Int64" />
        <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
        <asp:Parameter Name="BranchId" Type="Int64" />
        </SelectParameters></asp:ObjectDataSource>

    <asp:HiddenField ID="StageIdHiddenField" runat="server" />


        <asp:ObjectDataSource ID="SalarytypesDS" runat="server"  SelectMethod="Read" TypeName="BOL.Salarytypes" OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" />
                <asp:Parameter Name="SalarytypeId" Type="Int64" />
                <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:Parameter Name="BranchId" Type="Int64" />
            </SelectParameters></asp:ObjectDataSource>

    


    