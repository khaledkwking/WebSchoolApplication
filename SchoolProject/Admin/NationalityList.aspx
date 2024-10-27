<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageMain.master" AutoEventWireup="true" Inherits="Admin_NationalityList" Codebehind="NationalityList.aspx.cs" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="bodyContainer">
        <div class="pageTitle">
            <div class=" container">
                <div class="row">
                    <div class="col-12">         
                          <h1 style="height: 50px;">أكواد الجنسيات </h1>
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
                          <div>
                                <asp:Label ID="Label1" runat="server"  Text="الجنسية"></asp:Label>
                                <asp:TextBox ID="txtNatName" runat="server" CssClass="FormTextBox"   placeholder="الجنسية"></asp:TextBox>
                            </div>
                            </div>
                                     

                        <div class="col-sm-6 pull-left">
                      
                       
                             
                                    <div>
                                <asp:Label ID="Label2" runat="server"  Text="الاسم بالانجليزي"></asp:Label>
                                <asp:TextBox ID="txtNatEngName" runat="server" CssClass="FormTextBox"   placeholder="الاسم بالانجليزي"></asp:TextBox>
                            </div>            
                   
                        </div>
                
                                
                       
                  </div>
                  </div>
                  </div>
            </nav>        
     </div>
                    
           
            
          
        
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataSourceID="ObjectDataSourceNat" Width="100%"  ForeColor="#333333" GridLines="None"  AllowPaging="True" AllowSorting="True" DataKeyNames="NATIONALITY_CODE" PageSize="25"  Font-Size="Medium" OnRowCommand="GridView1_RowCommand">
        <FooterStyle BackColor="#507CD1" ForeColor="White"  />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1"  ForeColor="#333333" />
        <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#2461BF" />
        <HeaderStyle BackColor="#507CD1"  ForeColor="White" />
        <Columns>
            <asp:BoundField DataField="NATIONALITY_CODE" HeaderText="الكود" ReadOnly="True" SortExpression="NATIONALITY_CODE" />
            <asp:BoundField DataField="NATIONALITY_DESC" HeaderText="الجنسية" SortExpression="NATIONALITY_DESC" />
            <asp:BoundField DataField="NATIONALITY_Eng" HeaderText="الاسم الانجليزي" SortExpression="NATIONALITY_Eng" />
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
    
    
      <asp:ObjectDataSource ID="ObjectDataSourceNatParam" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByCode" TypeName="PersonalDataSetTableAdapters.CDE_NATIONALITYTableAdapter">
          <SelectParameters>
              <asp:ControlParameter ControlID="txtid" Name="Code" PropertyName="Text" Type="Decimal" />
          </SelectParameters>
    </asp:ObjectDataSource>
    
    
      <asp:ObjectDataSource ID="ObjectDataSourceNat" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="PersonalDataSetTableAdapters.CDE_NATIONALITYTableAdapter" InsertMethod="Insert" UpdateMethod="Update" DeleteMethod="Delete">
          <DeleteParameters>
              <asp:ControlParameter ControlID="txtid" Name="Original_NATIONALITY_CODE" PropertyName="Text" Type="Decimal" />
          </DeleteParameters>
          <InsertParameters>
              <asp:ControlParameter ControlID="txtNatName" Name="NATIONALITY_DESC" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtNatEngName" Name="NATIONALITY_Eng" PropertyName="Text" Type="String" />
          </InsertParameters>
          <UpdateParameters>
              <asp:ControlParameter ControlID="txtNatName" Name="NATIONALITY_DESC" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtNatEngName" Name="NATIONALITY_Eng" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtid" Name="Original_NATIONALITY_CODE" PropertyName="Text" Type="Decimal" />
              <asp:Parameter Name="NATIONALITY_CODE" Type="Decimal" />
          </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:TextBox ID="txtOrgId" runat="server" Visible="False"  ></asp:TextBox>
    
   
    <asp:TextBox ID="txtEditFlag" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1">0</asp:TextBox>
    
       
</asp:Content>


<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
   
</asp:Content>



