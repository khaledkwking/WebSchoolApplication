<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageMain.master" AutoEventWireup="true" Inherits="Admin_VacationsList" Codebehind="VacationsList.aspx.cs" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="bodyContainer">
        <div class="pageTitle">
            <div class=" container">
                <div class="row">
                    <div class="col-12">         
                          <h1 style="height: 50px;">أكواد الاجازات </h1>
                    </div>
                </div>
            </div>
        </div>

      <div class="container TexRight">
            <div class="row">
                <div class="col-12">

                <div class="formContactUs">
                <nav class="navbar buttonsNavBar">
                <div class="container-fluid">
                     <ul class="nav nav-pills">
                    <li class="active pull-right"> <asp:Button ID="CmdAdd" runat="server" Text="" CssClass="mainBarButtons addBtn"  CausesValidation="False" data-toggle="tooltip" data-placement="bottom" title="اضف بيان جديد" UseSubmitBehavior="False" OnClick="CmdAdd_Click" /></li>
                   <li id="Li5" runat="server" class="pull-right"><asp:Button ID="CloseBtn" runat="server" Text="" CssClass="mainBarButtons CloseBtn"  data-toggle="tooltip" data-placement="bottom" title="خروج" UseSubmitBehavior="False" OnClick="CloseBtn_Click" /></li>
                  
                </ul>
                      
                </div>
    </nav>
                 
            
                   
          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataSourceID="ObjectDataSourceVacations" Width="100%"  ForeColor="#333333" GridLines="None"  AllowPaging="True" AllowSorting="True" DataKeyNames="VAC_TYPE_CODE" PageSize="25"  Font-Size="Medium" OnRowCommand="GridView1_RowCommand">
        <FooterStyle BackColor="#507CD1" ForeColor="White"  />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1"  ForeColor="#333333" />
        <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#2461BF" />
        <HeaderStyle BackColor="#507CD1"  ForeColor="White" />
        <Columns>
            <asp:BoundField DataField="VAC_TYPE_CODE" HeaderText="الكود" InsertVisible="False" ReadOnly="True" SortExpression="VAC_TYPE_CODE" />
            <asp:BoundField DataField="VAC_TYPE_DESC" HeaderText="أسم الاجازة" SortExpression="VAC_TYPE_DESC" />
            <asp:BoundField DataField="MAX_NUM" HeaderText="MAX_NUM" SortExpression="MAX_NUM" Visible="False" />
            <asp:BoundField DataField="FEM_FLAG" HeaderText="FEM_FLAG" SortExpression="FEM_FLAG" Visible="False" />
            <asp:BoundField DataField="CALE_CYCLE" HeaderText="CALE_CYCLE" SortExpression="CALE_CYCLE" Visible="False" />
            <asp:CheckBoxField DataField="DEC_FLAG" HeaderText="DEC_FLAG" SortExpression="DEC_FLAG" Visible="False" />
            <asp:BoundField DataField="ACCUM_FLAG" HeaderText="ACCUM_FLAG" SortExpression="ACCUM_FLAG" Visible="False" />
            <asp:BoundField DataField="MAX_DUR_ONCE" HeaderText="MAX_DUR_ONCE" SortExpression="MAX_DUR_ONCE" Visible="False" />
            <asp:BoundField DataField="MAX_DUR" HeaderText="MAX_DUR" SortExpression="MAX_DUR" Visible="False" />
            <asp:BoundField DataField="SAL_DED_PERCENT" HeaderText="SAL_DED_PERCENT" SortExpression="SAL_DED_PERCENT" Visible="False" />
            <asp:BoundField DataField="BALANCE_FLAG" HeaderText="BALANCE_FLAG" SortExpression="BALANCE_FLAG" Visible="False" />
            <asp:BoundField DataField="VACATION_CLASS_CODE" HeaderText="VACATION_CLASS_CODE" SortExpression="VACATION_CLASS_CODE" Visible="False" />
            <asp:CheckBoxField DataField="PERIOD_FLAG" HeaderText="PERIOD_FLAG" SortExpression="PERIOD_FLAG" Visible="False" />
            <asp:ButtonField CommandName="Update" Text="تعديل" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
        <PagerSettings PageButtonCount="20" />
    </asp:GridView>
     </div>
                    
           
            
          
        
    
       
   
                         </div>
                     </div>
                 </div>
          </div>
    
    
    <asp:ObjectDataSource ID="ObjectDataSourceVacations" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
        TypeName="PersonalDataSetTableAdapters.CDE_PER_VAC_SUB_CLASSTableAdapter" InsertMethod="Insert" UpdateMethod="Update" DeleteMethod="Delete">
        <DeleteParameters>
            <asp:Parameter Name="Original_VAC_TYPE_CODE" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="VAC_TYPE_DESC" Type="String" />
            <asp:Parameter Name="MAX_NUM" Type="Decimal" />
            <asp:Parameter Name="FEM_FLAG" Type="String" />
            <asp:Parameter Name="CALE_CYCLE" Type="Decimal" />
            <asp:Parameter Name="DEC_FLAG" Type="Boolean" />
            <asp:Parameter Name="ACCUM_FLAG" Type="String" />
            <asp:Parameter Name="MAX_DUR_ONCE" Type="Decimal" />
            <asp:Parameter Name="MAX_DUR" Type="Decimal" />
            <asp:Parameter Name="SAL_DED_PERCENT" Type="Decimal" />
            <asp:Parameter Name="BALANCE_FLAG" Type="Decimal" />
            <asp:Parameter Name="VACATION_CLASS_CODE" Type="Decimal" />
            <asp:Parameter Name="PERIOD_FLAG" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="VAC_TYPE_DESC" Type="String" />
            <asp:Parameter Name="MAX_NUM" Type="Decimal" />
            <asp:Parameter Name="FEM_FLAG" Type="String" />
            <asp:Parameter Name="CALE_CYCLE" Type="Decimal" />
            <asp:Parameter Name="DEC_FLAG" Type="Boolean" />
            <asp:Parameter Name="ACCUM_FLAG" Type="String" />
            <asp:Parameter Name="MAX_DUR_ONCE" Type="Decimal" />
            <asp:Parameter Name="MAX_DUR" Type="Decimal" />
            <asp:Parameter Name="SAL_DED_PERCENT" Type="Decimal" />
            <asp:Parameter Name="BALANCE_FLAG" Type="Decimal" />
            <asp:Parameter Name="VACATION_CLASS_CODE" Type="Decimal" />
            <asp:Parameter Name="PERIOD_FLAG" Type="Boolean" />
            <asp:Parameter Name="Original_VAC_TYPE_CODE" Type="Decimal" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:TextBox ID="txtid" runat="server" Visible="False"  ></asp:TextBox>
    
    <asp:TextBox ID="txtOrgId" runat="server" Visible="False"  ></asp:TextBox>
    
    </asp:Content>


<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
   
</asp:Content>



