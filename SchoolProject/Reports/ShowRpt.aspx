<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageMain.master" AutoEventWireup="true" Inherits="Reports_ShowRpt" Codebehind="ShowRpt.aspx.cs" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <br />

   <div class="container TexRight">
            <div class="row">
                <div class="col-12">

                    <div class="formContactUs">
                        <div class="form-group row">
              <div class="table-responsive"> 
    <table style=" width: 100%; height: 100%;" class="table-responsive" >
        <tr>
            <td dir="rtl">
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="True"  Height="100%"  ToolPanelWidth="200px" Width="350px" ToolPanelView="None" ReportSourceID="CrystalReportSource1"  />
            </td>
        </tr>
    </table>
 </div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
   
     <div>
    
      
    
    </div>
        <asp:ObjectDataSource ID="ObjectDataSourceEmp" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByParam" TypeName="PersonalDataSetTableAdapters.EmpViewTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtOrgId" Name="OrgId" PropertyName="Text" Type="Int64" />
                <asp:ControlParameter ControlID="txtFullName" Name="FullName" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtEngFullName" Name="EngFullName" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtEmpNum" Name="EmpNum" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtJob_cls_code" Name="Job_cls_code" PropertyName="Text" Type="Decimal" />
                <asp:ControlParameter ControlID="txtCivilId" Name="CivilId" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtPassFromDate" Name="PassFromDate" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="txtPassToDate" Name="PassToDate" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="txtResidenceFromDate" Name="ResidenceFromDate" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="txtResidenceToDate" Name="ResidenceToDate" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="txtBranchId" Name="BranchId" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="txtDEPTCODE" Name="DEPTCODE" PropertyName="Text" Type="Int64" />
                <asp:ControlParameter ControlID="txtSALARYFrom" Name="SALARYFrom" PropertyName="Text" Type="Decimal" />
                <asp:ControlParameter ControlID="txtSALARYTo" Name="SALARYTo" PropertyName="Text" Type="Decimal" />
                <asp:ControlParameter ControlID="txtStatus" Name="Status" PropertyName="Text" Type="Int32" />
            </SelectParameters>
     </asp:ObjectDataSource>
    <asp:TextBox ID="txtOrgId" runat="server" Visible="False"  ></asp:TextBox>
    
   
    <asp:TextBox ID="txtFullName" runat="server" Visible="False"  ></asp:TextBox>
    
   
    <asp:TextBox ID="txtEngFullName" runat="server" Visible="False"  ></asp:TextBox>
    
   
    <asp:TextBox ID="txtEmpNum" runat="server" Visible="False"  ></asp:TextBox>
    
   
    <asp:TextBox ID="txtJob_cls_code" runat="server" Visible="False"  ></asp:TextBox>
    
   
    <asp:TextBox ID="txtCivilId" runat="server" Visible="False"  ></asp:TextBox>
    
   
    <asp:TextBox ID="txtPassFromDate" runat="server" Visible="False"  ></asp:TextBox>
    
   
    <asp:TextBox ID="txtPassToDate" runat="server" Visible="False"  ></asp:TextBox>
    
   
    <asp:TextBox ID="txtResidenceFromDate" runat="server" Visible="False"  ></asp:TextBox>
    
   
    <asp:TextBox ID="txtResidenceToDate" runat="server" Visible="False"  ></asp:TextBox>
    
   
    <asp:TextBox ID="txtBranchId" runat="server" Visible="False"  ></asp:TextBox>
    
   
    <asp:TextBox ID="txtDEPTCODE" runat="server" Visible="False"  ></asp:TextBox>
    
   
    <asp:TextBox ID="txtSALARYFrom" runat="server" Visible="False"  ></asp:TextBox>
    
   
    <asp:TextBox ID="txtSALARYTo" runat="server" Visible="False"  ></asp:TextBox>
    
   
    <asp:TextBox ID="txtStatus" runat="server" Visible="False"  ></asp:TextBox>
    
   
        <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
            <Report FileName="PerEmpDataRpt.rpt">
                <DataSources>
                    <CR:DataSourceRef DataSourceID="ObjectDataSourceEmp" TableName="EmpView" />
                </DataSources>
            </Report>
        </CR:CrystalReportSource>
 
    <br />
</asp:Content>

