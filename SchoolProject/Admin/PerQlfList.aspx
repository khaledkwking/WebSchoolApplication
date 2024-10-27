<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageMain.master" AutoEventWireup="true" Inherits="Admin_PerQlfList" Codebehind="PerQlfList.aspx.cs" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="bodyContainer">
        <div class="pageTitle">
            <div class=" container">
                <div class="row">
                    <div class="col-12">         
                          <h1 style="height: 50px;">أكواد المؤهلات </h1>
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
                    <li id="Li2" runat="server" class="pull-right"> <asp:Button ID="cmdsave" runat="server" Text="" CssClass="mainBarButtons saveBtn"  Visible="true" data-toggle="tooltip" data-placement="bottom" title="حفظ التعديلات" UseSubmitBehavior="False" OnClick="cmdsave_Click" /></li>
                                     <li id="Li3" runat="server" class="pull-right"><asp:Button ID="DelCmd" runat="server" Text="" CssClass="mainBarButtons deletBtn"  data-toggle="tooltip" data-placement="bottom" title="حذف البيانات" UseSubmitBehavior="False" OnClick="DelCmd_Click" /></li>
                    <li id="Li1" runat="server" class="active pull-right">  <asp:Button ID="CloseBtn" runat="server" Text="" CssClass="mainBarButtons CloseBtn"  data-toggle="tooltip" data-placement="bottom" title="خروج" UseSubmitBehavior="False" OnClick="CloseBtn_Click" /></li>
                  
                </ul>
                      
                </div>
    </nav>
                 
            
                   
           <nav class="navbar buttonsNavBar">
            <div class="tab-content clearfix">
            <%-- Student basic informatin section --%>
            <div class="tab-pane active" id="basicStudentInfo">             
                <%--<div class="vertialMenu shadow">--%>
                <%-- <nav id="sidebar">--%>
                 <div class="row">
                 <div class="col-12">
               
                
                        <div class="col-sm-6 pull-right">
                            <div>
                                <asp:Label ID="Label6" runat="server" Text="الكود" ></asp:Label>
                                <asp:TextBox ID="txtQlfCode" runat="server" CssClass="FormTextBox" placeholder="الكود" Enabled="False"></asp:TextBox>
                            </div>
                       
                            </div>
                                     

                        <div class="col-sm-6 pull-left">
                      
                       
                                <div>
                                <asp:Label ID="Label1" runat="server"  Text="المؤهل"></asp:Label>
                                <asp:TextBox ID="txtQlfName" runat="server" CssClass="FormTextBox"   placeholder="أدخل المؤهل"></asp:TextBox>
                            </div>
                                                
                   
                        </div>
                
                                
                       
                  </div>
                  </div>
                  </div>
            </nav>        
     </div>
                    
           
            
          
        
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataSourceID="ObjectDataSourcePerQlf" Width="100%"  ForeColor="#333333" GridLines="None"  AllowPaging="True" AllowSorting="True" DataKeyNames="QLF_CODE" PageSize="25"  Font-Size="Medium" OnRowCommand="GridView1_RowCommand">
        <FooterStyle BackColor="#507CD1" ForeColor="White"  />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1"  ForeColor="#333333" />
        <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#2461BF" />
        <HeaderStyle BackColor="#507CD1"  ForeColor="White" />
        <Columns>
            <asp:BoundField DataField="QLF_CODE" HeaderText="الكود" InsertVisible="False" ReadOnly="True" SortExpression="QLF_CODE" />
            <asp:BoundField DataField="QLF_TYP_CODE" HeaderText="QLF_TYP_CODE" SortExpression="QLF_TYP_CODE" Visible="False" />
            <asp:BoundField DataField="QLF_DESC" HeaderText="المؤهل" SortExpression="QLF_DESC" />
            <asp:BoundField DataField="AZHAR_FLAG" HeaderText="AZHAR_FLAG" SortExpression="AZHAR_FLAG" Visible="False" />
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
    
    
   
    <asp:TextBox ID="txtid" runat="server" Visible="False"  ></asp:TextBox>
    
    
      <asp:ObjectDataSource ID="ObjectDataSourcePerQlfParam" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataById" TypeName="PersonalDataSetTableAdapters.CDE_PER_QLFTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
          <DeleteParameters>
              <asp:Parameter Name="Original_QLF_CODE" Type="Int32" />
          </DeleteParameters>
          <InsertParameters>
              <asp:Parameter Name="QLF_TYP_CODE" Type="Decimal" />
              <asp:Parameter Name="QLF_DESC" Type="String" />
              <asp:Parameter Name="AZHAR_FLAG" Type="Decimal" />
          </InsertParameters>
          <SelectParameters>
              <asp:ControlParameter ControlID="txtid" Name="Code" PropertyName="Text" Type="Int32" />
          </SelectParameters>
          <UpdateParameters>
              <asp:Parameter Name="QLF_TYP_CODE" Type="Decimal" />
              <asp:Parameter Name="QLF_DESC" Type="String" />
              <asp:Parameter Name="AZHAR_FLAG" Type="Decimal" />
              <asp:Parameter Name="Original_QLF_CODE" Type="Int32" />
          </UpdateParameters>
    </asp:ObjectDataSource>
    
    
      <asp:ObjectDataSource ID="ObjectDataSourcePerQlf" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="PersonalDataSetTableAdapters.CDE_PER_QLFTableAdapter" InsertMethod="Insert" UpdateMethod="Update" DeleteMethod="Delete">
          <DeleteParameters>
              <asp:ControlParameter ControlID="txtid" Name="Original_QLF_CODE" PropertyName="Text" Type="Int32" />
          </DeleteParameters>
          <InsertParameters>
              <asp:Parameter Name="QLF_TYP_CODE" Type="Decimal" />
              <asp:ControlParameter ControlID="txtQlfName" Name="QLF_DESC" PropertyName="Text" Type="String" />
              <asp:Parameter Name="AZHAR_FLAG" Type="Decimal" />
          </InsertParameters>
          <UpdateParameters>
              <asp:Parameter Name="QLF_TYP_CODE" Type="Decimal" />
              <asp:ControlParameter ControlID="txtQlfName" Name="QLF_DESC" PropertyName="Text" Type="String" />
              <asp:Parameter Name="AZHAR_FLAG" Type="Decimal" />
              <asp:ControlParameter ControlID="txtid" Name="Original_QLF_CODE" PropertyName="Text" Type="Int32" />
          </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:TextBox ID="txtOrgId" runat="server" Visible="False"  ></asp:TextBox>
    
   
    <asp:TextBox ID="txtEditFlag" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1">0</asp:TextBox>
    
       
</asp:Content>


<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
   
</asp:Content>



