<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WorkOrdersReport.ascx.cs" Inherits="WebSchool.Admin.controls.SchReport.WorkOrdersReport" %>

<script src="../../../assets/js/vendor/jquery.min.js"></script>
<div class="content-header">
    <%-- <div class="header-section">
        <h1>
            <i class="gi gi-user"></i> <%= Resources.DefaultResource.Main%>
        </h1>
    </div>--%>
</div>
<ul class="breadcrumb breadcrumb-top">
    <li><a href="../../School/default.aspx"><%= Resources.DefaultResource.Main%> </a></li>
    <li>
        <%if (Request.QueryString["Accflag"] != null)
            {%>

                <%=Resources.DefaultResource.TeacherAccount%>
          <%}

              else
              {%>
                    <%=Resources.DefaultResource.PrintInvTableReport%>
             <%}%>
      

    </li>

</ul>
     
   
<div class="block table-responsive" style ="min-height:700px">
    <!-- Table Styles Title -->
    
    <!-- END Table Styles Title -->
    
    <div class="gallery gallery-widget" data-toggle="lightbox-gallery">
               
       <!-- General Data Block -->  
        <div class="row">
             <div class=" col-md-6">
                 <asp:TextBox ID="StartDateTextBox" runat="server"  CssClass="form-control input-datepicker" placeholder="<%$ Resources:DefaultResource, FromDate%>" data-date-format="dd/mm/yyyy" autocomplete ="off"/>
            </div>
             <div class=" col-md-6">
                 <asp:TextBox ID="EndDateTextBox" runat="server"  CssClass="form-control input-datepicker" placeholder="<%$ Resources:DefaultResource, ToDate%>" data-date-format="dd/mm/yyyy" autocomplete ="off" />
            </div>
           
          </div>
         <div class="row">
            <div class=" col-md-6">
                <asp:DropDownList ID="StudentDropDownList" runat="server" CssClass="form-control select-chosen" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="StudentsDS" DataTextField="StudentName" DataValueField="StudentId" >
                    <asp:ListItem Text="<%$ Resources:DefaultResource, ChooseStudent%>"  Value=""></asp:ListItem>
                   
                </asp:DropDownList>
                 
            </div>
             <div class=" col-md-6">
                <asp:DropDownList ID="TeacherDropDownList" runat="server" CssClass="form-control select-chosen" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="TeachersDS" DataTextField="Name" DataValueField="TeacherId" >
                    <asp:ListItem Text="<%$ Resources:DefaultResource, ChooseTeacher%>"  Value=""></asp:ListItem>
                   
                </asp:DropDownList>
                 
            </div>
             </div>
        <div class="input-group">
            <asp:TextBox ID="SearchTextBox" runat="server" CssClass="form-control" placeholder="<%$ Resources:DefaultResource, Search%>"></asp:TextBox>

            <span class="input-group-btn">
                
                <asp:LinkButton ID="ClearLinkButton" runat="server" CssClass="btn btn-sm btn-danger" OnClick="ClearLinkButton_Click"> <i class="hi hi-remove"></i><%= Resources.DefaultResource.ClearSearch%></asp:LinkButton>
               
                <asp:LinkButton ID="SearchLinkButton" runat="server" CssClass="btn btn-sm btn-primary" OnClick="SearchLinkButton_Click" > <i class="fa fa-search"></i><%= Resources.DefaultResource.Print%>
                     <i class="fa fa-print"></i>
                </asp:LinkButton>

            </span>
        </div>
       
       
              
 
      
       
   
      <asp:ObjectDataSource ID="StudentsDS" runat="server"  SelectMethod="Read" TypeName="BOL.Sch_Student" OldValuesParameterFormatString="original_{0}">
            <SelectParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="1" />
                <asp:SessionParameter DefaultValue="" Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:Parameter Name="StudentId" Type="Int64" />
                <asp:Parameter Name="PeriodId" Type="Int64" />
                <asp:Parameter Name="BRANCHId" Type="Int64" /><asp:Parameter Name="SearchText" Type="String" DefaultValue="" />
                </SelectParameters></asp:ObjectDataSource>

    <br />


                                 

       
                                
                            <asp:ObjectDataSource ID="TeachersDS" runat="server"  SelectMethod="Read" TypeName="BOL.Sch_Teachers" OldValuesParameterFormatString="original_{0}">
            <SelectParameters><asp:Parameter Name="ActionCode" Type="String" DefaultValue="1" />
                <asp:Parameter Name="TeacherId" Type="Int64" />
                <asp:Parameter Name="subjectId" Type="Int64" />
                <asp:Parameter Name="PeriodId" Type="Int64" />
                <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" /><asp:Parameter Name="BRANCHId" Type="Int64" /><asp:Parameter Name="UserId" Type="Int32" />
                <asp:Parameter Name="StudenId" Type="Int64" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="AreaId" Type="Int32" />
                <asp:Parameter DefaultValue="" Name="SearchText" Type="String" />
                                </SelectParameters></asp:ObjectDataSource>

    <br />

    <br />
    </div>

    </div>

 


   
   

   
   


    

    

    

    