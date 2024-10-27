<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageMain.master" AutoEventWireup="true" Inherits="Admin_DeptList" Codebehind="DeptList.aspx.cs" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="bodyContainer">
        <div class="pageTitle">
            <div class=" container">
                <div class="row">
                    <div class="col-12">         
                          <h1 style="height: 50px;">المسميات الوظيفية </h1>
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
                                <asp:TextBox ID="txtDeptCode" runat="server" CssClass="FormTextBox" placeholder="الكود" Enabled="False"></asp:TextBox>
                            </div>
                       
                            </div>
                                     

                        <div class="col-sm-6 pull-left">
                      
                       
                                <div>
                                <asp:Label ID="Label1" runat="server"  Text="المسمي الوظيفى"></asp:Label>
                                <asp:TextBox ID="txtDeptName" runat="server" CssClass="FormTextBox"   placeholder="المسمي الوظيفى"></asp:TextBox>
                            </div>
                                                
                   
                        </div>
                
                                
                       
                  </div>
                  </div>
                  </div>
            </nav>        
     </div>
                    
           
            
          
        
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataSourceID="ObjectDataSourceDept" Width="100%"  ForeColor="#333333" GridLines="None"  AllowPaging="True" AllowSorting="True" DataKeyNames="DEPT_CODE" PageSize="25"  Font-Size="Medium" OnRowCommand="GridView1_RowCommand">
        <FooterStyle BackColor="#507CD1" ForeColor="White"  />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1"  ForeColor="#333333" />
        <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#2461BF" />
        <HeaderStyle BackColor="#507CD1"  ForeColor="White" />
        <Columns>
            <asp:BoundField DataField="DEPT_CODE" HeaderText="الكود" InsertVisible="False" ReadOnly="True" SortExpression="DEPT_CODE" />
            <asp:BoundField DataField="DEPT_DESC" HeaderText="المسمى الوظيفى" SortExpression="DEPT_DESC" />
            <asp:BoundField DataField="OrgId" HeaderText="OrgId" SortExpression="OrgId" Visible="False" />
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
    
    
      <asp:ObjectDataSource ID="ObjectDataSourceDeptParam" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByDeptCode" TypeName="PersonalDataSetTableAdapters.CDE_DEPTTableAdapter" InsertMethod="Insert" UpdateMethod="Update" DeleteMethod="Delete">
          <DeleteParameters>
              <asp:Parameter Name="Original_DEPT_CODE" Type="Int64" />
          </DeleteParameters>
          <InsertParameters>
              <asp:ControlParameter ControlID="txtDeptName" Name="DEPT_DESC" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtOrgId" Name="OrgId" PropertyName="Text" Type="Int64" />
          </InsertParameters>
          <SelectParameters>
              <asp:ControlParameter ControlID="txtid" Name="DeptCode" PropertyName="Text" Type="Int64" />
          </SelectParameters>
          <UpdateParameters>
              <asp:ControlParameter ControlID="txtDeptName" Name="DEPT_DESC" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtOrgId" Name="OrgId" PropertyName="Text" Type="Int64" />
              <asp:ControlParameter ControlID="txtid" Name="Original_DEPT_CODE" PropertyName="Text" Type="Int64" />
          </UpdateParameters>
    </asp:ObjectDataSource>
    
    
      <asp:ObjectDataSource ID="ObjectDataSourceDept" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByOrgId" TypeName="PersonalDataSetTableAdapters.CDE_DEPTTableAdapter" InsertMethod="Insert" UpdateMethod="Update" DeleteMethod="Delete">
          <DeleteParameters>
              <asp:ControlParameter ControlID="txtid" Name="Original_DEPT_CODE" PropertyName="Text" Type="Int64" />
          </DeleteParameters>
          <InsertParameters>
              <asp:ControlParameter ControlID="txtDeptName" Name="DEPT_DESC" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtOrgId" Name="OrgId" PropertyName="Text" Type="Int64" />
          </InsertParameters>
          <SelectParameters>
              <asp:ControlParameter ControlID="txtOrgId" Name="OrgId" PropertyName="Text" Type="Int64" />
          </SelectParameters>
          <UpdateParameters>
              <asp:ControlParameter ControlID="txtDeptName" Name="DEPT_DESC" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtOrgId" Name="OrgId" PropertyName="Text" Type="Int64" />
              <asp:ControlParameter ControlID="txtid" Name="Original_DEPT_CODE" PropertyName="Text" Type="Int64" />
          </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:TextBox ID="txtOrgId" runat="server" Visible="False"  ></asp:TextBox>
    
   
    <asp:TextBox ID="txtEditFlag" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1">0</asp:TextBox>
    
       
</asp:Content>


<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
   
</asp:Content>



