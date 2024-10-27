<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QidShow.ascx.cs" Inherits="WebSchool.Controls.Account.QidShow" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%--<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>--%>

<div dir="rtl" >
        <%--<rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Height="700px" >
            <LocalReport ReportEmbeddedResource="" ReportPath="Reports\BudgetReceipt.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>--%>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
   

    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%" Height="700px">
          <LocalReport ReportEmbeddedResource="" ReportPath="Reports_Rdl\QidRpt.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="QidDs" Name="DataSet1" />
                    <rsweb:ReportDataSource DataSourceId="SetupDs" Name="SetupDataSet" />
                </DataSources>
            </LocalReport>
    </rsweb:ReportViewer>
    </div>
        


        <asp:ObjectDataSource ID="QidDs" runat="server" SelectMethod="Read" TypeName="BOL.qidsDetails">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" />
                <asp:Parameter Name="StartDate" Type="String" DefaultValue="" />
                <asp:Parameter Name="EndDate" Type="String" />
                <asp:Parameter Name="recitetype" Type="Int32" />
                <asp:QueryStringParameter DefaultValue="" Name="QidId" QueryStringField="QidId" Type="Int64" />
                <asp:Parameter Name="Id" Type="Int64" />
                <asp:CookieParameter DefaultValue="" Name="OrgId" Type="Int64" CookieName="OrgId" />
                <asp:Parameter Name="BRANCHId" Type="Int64" />
                <asp:Parameter Name="EmpId" Type="Int32" />
                <asp:Parameter Name="Detcode" Type="Int32" DefaultValue="" />
                <asp:Parameter Name="AccountId" Type="Int64" />
                <asp:Parameter Name="ParentAccountId" Type="Int64" />
                <asp:Parameter Name="CostId" Type="Int64" />
                <asp:Parameter Name="SearchText" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>

<asp:ObjectDataSource ID="QidStatmentDs" runat="server" SelectMethod="Read" TypeName="BOL.QidDetailsStatmentStatment" OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:Parameter DefaultValue="2" Name="ActionCode" Type="String" />
                <asp:Parameter Name="StartDate" Type="String" DefaultValue="" />
                <asp:Parameter Name="EndDate" Type="String" />
                <asp:Parameter Name="recitetype" Type="Int32" />
                <asp:QueryStringParameter DefaultValue="" Name="QidId" QueryStringField="QidId" Type="Int64" />
                <asp:Parameter Name="Id" Type="Int64" />
                <asp:CookieParameter DefaultValue="" Name="OrgId" Type="Int64" CookieName="OrgId" />
                <asp:Parameter Name="BRANCHId" Type="Int64" />
                <asp:Parameter Name="EmpId" Type="Int32" />
                <asp:Parameter Name="Detcode" Type="Int32" DefaultValue="" />
                <asp:Parameter Name="AccountId" Type="Int64" />
                <asp:Parameter Name="ParentAccountId" Type="Int64" />
                <asp:Parameter Name="CostId" Type="Int64" />
                <asp:Parameter Name="SearchText" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>

        <asp:TextBox ID="txtMainSalesAccid" runat="server"       Visible="False" ></asp:TextBox>
<asp:TextBox ID="txtMainPurchaseaccid" runat="server"       Visible="False" ></asp:TextBox>
<asp:TextBox ID="txtPaymentsaccid" runat="server"       Visible="False" ></asp:TextBox>

                          
        <asp:ObjectDataSource ID="SetupDs" runat="server" SelectMethod="Read" TypeName="BOL.Setup" OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="ActionCode" Type="String" />
                <asp:SessionParameter Name="OrgId" SessionField="OrgId" Type="Int64" />
                <asp:Parameter Name="StartDate" Type="String" />
                <asp:Parameter Name="EndDate" Type="String" />
                <asp:Parameter Name="SearchText" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        

        <asp:ObjectDataSource ID="AccountsDs" runat="server" SelectMethod="ReadTree" TypeName="BOL.Accounts" OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:Parameter DefaultValue="5" Name="ActionCode" Type="String" />
                <asp:Parameter Name="AccountId" Type="Int64" />
                <asp:CookieParameter DefaultValue="" Name="OrgId" Type="Int64" CookieName="OrgId" />
                <asp:Parameter Name="BRANCHId" Type="Int64" />
                <asp:Parameter Name="ParentAccountId" Type="Int64" DefaultValue="" />
                <asp:Parameter Name="CostId" Type="Int64" />
                <asp:Parameter Name="StartDate" Type="String" DefaultValue="" />
                <asp:Parameter Name="EndDate" Type="String" />
                <asp:Parameter Name="SearchText" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>

        
<asp:ObjectDataSource ID="AccountsIncomeStatementDs" runat="server" SelectMethod="ReadIncome" TypeName="BOL.Accounts" OldValuesParameterFormatString="original_{0}">
    <SelectParameters>
        <asp:Parameter DefaultValue="5" Name="ActionCode" Type="String" />
        <asp:Parameter Name="AccountId" Type="Int64"></asp:Parameter>
        <asp:CookieParameter CookieName="OrgId" DefaultValue="" Name="OrgId" Type="Int64"></asp:CookieParameter>
        <asp:Parameter Name="BRANCHId" Type="Int64" />
        <asp:ControlParameter ControlID="txtMainPurchaseaccid" PropertyName="Text" DefaultValue="" Name="MainPurchaseaccid" Type="Int64"></asp:ControlParameter>
        <asp:ControlParameter ControlID="txtPaymentsaccid" PropertyName="Text" DefaultValue="" Name="Paymentsaccid" Type="Int64"></asp:ControlParameter>

        <asp:ControlParameter ControlID="txtMainSalesAccid" PropertyName="Text" Name="MainSalesAccid" Type="Int64"></asp:ControlParameter>

        <asp:Parameter Name="CostId" Type="Int64" />
                <asp:Parameter Name="StartDate" Type="String" DefaultValue="" />
                <asp:Parameter Name="EndDate" Type="String" />
                <asp:Parameter Name="SearchText" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
                          
        