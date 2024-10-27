<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Sch_GroupAttendancesRptList.ascx.cs" Inherits="WebSchool.Admin.controls.School.Sch_GroupAttendancesRptList" %>

<script src="../../../assets/js/vendor/jquery.min.js"></script>
<div class="content-header">
    <%-- <div class="header-section">
        <h1>
            <i class="gi gi-user"></i> <%= Resources.DefaultResource.Main%>
        </h1>
    </div>--%>
</div>
<ul class="breadcrumb breadcrumb-top">
    <li><a href="Main.aspx"><%= Resources.DefaultResource.Main%> </a></li>
    <li> <%= Resources.DefaultResource.GroupAttandancesReport %> </li>
</ul>
     
   
<div class="block table-responsive" style="min-height:700px">
    <!-- Table Styles Title -->
    <div class="block-title">
        <h2><strong><%= Resources.DefaultResource.List%>  </strong> <%= Resources.DefaultResource.GroupAttandancesReport%> </h2>
        <%--<div class="block-options pull-right">
            <asp:LinkButton ID="NewRecord" runat="server" CssClass="btn btn-sm btn-success" data-toggle="tooltip" title="<%$ Resources:DefaultResource, NewRecord%>"  data-original-title="<%$ Resources:DefaultResource, NewRecord%>" OnClick="NewRecord_Click"> <i class="fa fa-file"></i></asp:LinkButton>
        </div>--%>
        <%--<button type="button" class="btn btn-sm btn-success" id="Addbtn" name="Addbtn">
            Add
         </button>--%>
    </div>
    <!-- END Table Styles Title -->
    
    <div class="gallery gallery-widget" data-toggle="lightbox-gallery" >
               
       <!-- General Data Block --> 
        
         <div class="row">
             <div class=" col-md-6">
                 <asp:TextBox ID="StartDateTextBox" runat="server"  CssClass="form-control input-datepicker" placeholder="<%$ Resources:DefaultResource, FromDate%>" data-date-format="dd/mm/yyyy" autocomplete ="off"/>
            </div>
             <div class="col-md-6">
                 <asp:TextBox ID="EndDateTextBox" runat="server"  CssClass="form-control input-datepicker" placeholder="<%$ Resources:DefaultResource, ToDate%>" data-date-format="dd/mm/yyyy" autocomplete ="off" />
            </div>
           
          </div>
          <div class="row">
           <%-- <label for="PeriodDropDownList" class="col-md-2 control-label">
                <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:DefaultResource, StudentPeriod%>" />
            </label>--%>
             <div class="col-md-4">
                        <asp:DropDownList ID="PeriodDropDownList" runat="server" CssClass="form-control select-chosen" AppendDataBoundItems="True" DataSourceID="PeriodsDS" DataTextField="PeriodName" DataValueField="PeriodId" >
                        <asp:ListItem Text="<%$ Resources:DefaultResource, ChoosePeriod%>"  Value=""></asp:ListItem>
                   
                    </asp:DropDownList>
                </div>

          
          </div> 
       <div class="row">
            <div class="col-md-4">
                        <asp:DropDownList ID="DropDownListStudent" runat="server" CssClass="form-control select-chosen" AppendDataBoundItems="True" DataSourceID="StudentsDS" DataTextField="StudentName" DataValueField="StudentId">
                        <asp:ListItem Text="<%$ Resources:DefaultResource, ChooseStudent%>"  Value=""></asp:ListItem>
                   
                    </asp:DropDownList>
                 </div>

     
            <div class="col-md-4">
                <asp:DropDownList ID="DropDownListEmp" runat="server" CssClass="form-control select-chosen" AppendDataBoundItems="True" DataSourceID="UsersDS" DataTextField="Name" DataValueField="ID"  >
                        <asp:ListItem Text="<%$ Resources:DefaultResource, ChooseEmp%>"  Value="0"></asp:ListItem>
                   
                </asp:DropDownList>

               </div>
            <div class="col-md-4">
         <asp:DropDownList ID="SexDropDownList" runat="server" class="select-chosen" data-placeholder="<%$ Resources:DefaultResource, StudentMan%>" AppendDataBoundItems="true" > 
                                        <asp:ListItem Text="<%$ Resources:DefaultResource, ChooseSex%>"  Value=""></asp:ListItem>
                                                 <asp:ListItem Text="<%$ Resources:DefaultResource, StudentMan%>" Value="1"></asp:ListItem>
                                                 <asp:ListItem Text="<%$ Resources:DefaultResource, StudentWoman%>" Value="2"></asp:ListItem>
                                            </asp:DropDownList>
                 </div> 

            <%-- <div class="col-md-4">
                 <asp:DropDownList ID="DropDownListGroupType" runat="server" CssClass="form-control" data-live-search="true"
                                                AppendDataBoundItems="True"  >
                    <asp:ListItem  Value="0" text="<%$ Resources:DefaultResource, ChooseInvType%>"> 

                    </asp:ListItem><asp:ListItem Value="1" Text="<%$ Resources:DefaultResource, IndvInvoiceTitle%>">

                        </asp:ListItem><asp:ListItem Value="2" Text="<%$ Resources:DefaultResource, GroupInvoiceTitle%>">
              
              </asp:ListItem></asp:DropDownList>
       </div>--%>
        <div class="input-group">
            

            <span class="input-group-btn">
                               
                  <asp:LinkButton ID="PrintLinkButton" runat="server" CssClass="btn btn-sm btn-info" OnClick="PrintLinkButton_Click" > <i class="fa fa-Print"></i><%= Resources.DefaultResource.Print%>
                       <i class="fa fa-print"></i>

                  </asp:LinkButton>
            </span>
        </div>
      
       
        <br />
           
          <div id="ErrorDiv" runat="server"></div>
        </div>

        
      
 


                                 

       
                                
    <asp:TextBox ID="txtOrgId" runat="server" 
        Visible="False" > </asp:TextBox>


                                 

       
                                
    <br />

    <br />
<asp:ObjectDataSource ID="PeriodsDS" runat="server"  SelectMethod="Read" TypeName="BOL.Sch_Periods"><SelectParameters>
        <asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" />
        <asp:Parameter Name="PeriodId" Type="Int64" DefaultValue="" />
        <asp:Parameter Name="StageId" Type="Int64" />
        <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
        <asp:Parameter Name="BranchId" Type="Int64" />
        </SelectParameters></asp:ObjectDataSource>

    <asp:TextBox ID="txtFromValue" runat="server" 
        Visible="False" ></asp:TextBox><asp:TextBox ID="txtPeriodId" runat="server" 
        Visible="False" ></asp:TextBox><asp:HiddenField ID="txtInvId" runat="server" Value="1" />
         <asp:HiddenField ID="txtInvSerial" runat="server" Value="1" /><asp:TextBox ID="txtStageId" runat="server" 
        Visible="False" ></asp:TextBox><asp:TextBox ID="txtToValue" runat="server" 
        Visible="False" ></asp:TextBox><asp:TextBox ID="txtId" runat="server" 
        Visible="False"  Height="22px"></asp:TextBox>

    <asp:ObjectDataSource ID="UsersDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Read" TypeName="BOL.Users">
        <SelectParameters>
        <asp:Parameter DefaultValue="2" Name="ActionCode" Type="String" />
        <asp:Parameter Name="UserID" Type="Int32" />
    <asp:Parameter Name="UserName" Type="String"></asp:Parameter>

    <asp:Parameter Name="Password" Type="String" />
       <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
        <asp:Parameter Name="SearchText" Type="String" />
        </SelectParameters></asp:ObjectDataSource>

    <asp:ObjectDataSource ID="StudentsDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Read" TypeName="BOL.Sch_Student" ><SelectParameters>
        <asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" />
       <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
        <asp:Parameter Name="StudentId" Type="Int64" />
    <asp:Parameter DefaultValue="" Name="PeriodId" Type="Int64"></asp:Parameter>

    <asp:Parameter Name="BranchId" Type="Int64" />
        <asp:Parameter Name="SearchText" Type="String" />
        </SelectParameters></asp:ObjectDataSource>

    </div>
    </div>
<script type="text/javascript">



   
   

    function showPopup()
    {
            $('#myModal').modal('show');

    }

    $('.date').datepicker({
        autoclose: true,
        format: 'dd-mm-yyyy',
        endDate: new Date(),
        todayHighlight: true,
        orientation: "bottom",
    });

   

       

</script>
    

    

    

    