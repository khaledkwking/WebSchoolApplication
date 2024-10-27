<%@ Page Language="VB" MasterPageFile="~/Admin/MasterPageMain.master" AutoEventWireup="false" Inherits="OffersStatisticsShowRpt" title="" Codebehind="OffersStatisticsShowRpt.aspx.vb" %>


<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
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
        <asp:ObjectDataSource ID="ObjectDataSourceEmp" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PersonalDataSetTableAdapters.EmpViewTableAdapter"></asp:ObjectDataSource>
        <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
            <Report FileName="PerEmpDataRpt.rpt">
                <DataSources>
                    <CR:DataSourceRef DataSourceID="ObjectDataSourceEmp" TableName="EmpView" />
                </DataSources>
            </Report>
        </CR:CrystalReportSource>
 
    <br />
</asp:Content>

