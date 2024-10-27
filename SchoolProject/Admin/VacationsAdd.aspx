<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageMain.master" AutoEventWireup="true" Inherits="Admin_VacationsAdd" Codebehind="VacationsAdd.aspx.cs" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="bodyContainer">
        <div class="pageTitle">
            <div class=" container">
                <div class="row">
                    <div class="col-12">         
                          <h1 style="height: 40px;"> مسميات الاجازات </h1>
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
                 
            
                   
        
      
            
      
               
                <div class="row">
                    <div class="col-sm-6 pull-right">
                                              
                        <div>
                           <asp:Label ID="Label18" runat="server" Text="أسم الاجازة" ></asp:Label>
                          <asp:TextBox ID="txVACTypeDESC" runat="server" CssClass="FormTextBox" placeholder="أسم الاجازة" required="required"></asp:TextBox>
                            <span class="alert-text" >*</span>
                            <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtStudentBirthDay" ErrorMessage="أدخل تاريخ الميلاد"></asp:RequiredFieldValidator>--%>
                        </div>
                          <div>
                           <asp:Label ID="Label6" runat="server" Text="اقصى عدد ايام للاجازة" ></asp:Label>
                            <asp:TextBox ID="txtMAXNUM" runat="server" CssClass="FormTextBox" placeholder="اقصى عدد ايام للاجازة"  ></asp:TextBox>
                         
                        </div>
                        <div>
                            <asp:Label ID="Label21" runat="server" Text="أجازة سنوية"></asp:Label>
                            
                            <asp:CheckBox ID="ChkPERIOD_FLAG" runat="server" />
                        </div>
                        
                        
                       </div>
                       
    
                    <div class="col-sm-6 pull-left">
                       
                      
                        <div>
                            <asp:Label ID="Label2" runat="server" Text="نسبة الاستقطاع" ></asp:Label>
                            <asp:TextBox ID="txtSAL_DED_PERCENT" runat="server" CssClass="FormTextBox" placeholder="نسبة الاستقطاع" required="required"></asp:TextBox> 
                             </div>
                         <div>
                            <asp:Label ID="Label1" runat="server" Text="غير مدفوعة الاجرة" ></asp:Label>
                          <asp:CheckBox ID="ChkDEC_FLAG" runat="server" />
                             </div>
                       
                    </div>
                </div>
               
            </div>

          

                     </div>
                 </div>
          </div>
    
   
    <asp:TextBox ID="txtid" runat="server" Visible="False"  ></asp:TextBox>
    </div>
    
      <asp:ObjectDataSource ID="ObjectDataSourceVacations" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByCode" TypeName="PersonalDataSetTableAdapters.CDE_PER_VAC_SUB_CLASSTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
          <DeleteParameters>
              <asp:Parameter Name="Original_VAC_TYPE_CODE" Type="Decimal" />
          </DeleteParameters>
          <InsertParameters>
              <asp:ControlParameter ControlID="txVACTypeDESC" Name="VAC_TYPE_DESC" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtMAXNUM" Name="MAX_NUM" PropertyName="Text" Type="Decimal" />
              <asp:Parameter Name="FEM_FLAG" Type="String" />
              <asp:Parameter Name="CALE_CYCLE" Type="Decimal" />
              <asp:ControlParameter ControlID="ChkDEC_FLAG" Name="DEC_FLAG" PropertyName="Checked" Type="Boolean" />
              <asp:Parameter Name="ACCUM_FLAG" Type="String" />
              <asp:Parameter Name="MAX_DUR_ONCE" Type="Decimal" />
              <asp:Parameter Name="MAX_DUR" Type="Decimal" />
              <asp:ControlParameter ControlID="txtSAL_DED_PERCENT" Name="SAL_DED_PERCENT" PropertyName="Text" Type="Decimal" />
              <asp:Parameter Name="BALANCE_FLAG" Type="Decimal" />
              <asp:Parameter Name="VACATION_CLASS_CODE" Type="Decimal" />
              <asp:ControlParameter ControlID="ChkPERIOD_FLAG" Name="PERIOD_FLAG" PropertyName="Checked" Type="Boolean" />
          </InsertParameters>
          <SelectParameters>
              <asp:ControlParameter ControlID="txtid" Name="Code" PropertyName="Text" Type="Decimal" />
          </SelectParameters>
          <UpdateParameters>
              <asp:ControlParameter ControlID="txVACTypeDESC" Name="VAC_TYPE_DESC" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtMAXNUM" Name="MAX_NUM" PropertyName="Text" Type="Decimal" />
              <asp:Parameter Name="FEM_FLAG" Type="String" />
              <asp:Parameter Name="CALE_CYCLE" Type="Decimal" />
              <asp:ControlParameter ControlID="ChkDEC_FLAG" Name="DEC_FLAG" PropertyName="Checked" Type="Boolean" />
              <asp:Parameter Name="ACCUM_FLAG" Type="String" />
              <asp:Parameter Name="MAX_DUR_ONCE" Type="Decimal" />
              <asp:Parameter Name="MAX_DUR" Type="Decimal" />
              <asp:ControlParameter ControlID="txtSAL_DED_PERCENT" Name="SAL_DED_PERCENT" PropertyName="Text" Type="Decimal" />
              <asp:Parameter Name="BALANCE_FLAG" Type="Decimal" />
              <asp:Parameter Name="VACATION_CLASS_CODE" Type="Decimal" />
              <asp:ControlParameter ControlID="ChkPERIOD_FLAG" Name="PERIOD_FLAG" PropertyName="Checked" Type="Boolean" />
              <asp:ControlParameter ControlID="txtid" Name="Original_VAC_TYPE_CODE" PropertyName="Text" Type="Decimal" />
          </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:TextBox ID="txtOrgId" runat="server" Visible="False"  ></asp:TextBox>
    
   
    <asp:TextBox ID="txtEditFlag" runat="server" Visible="False"  >0</asp:TextBox>
    
   
</asp:Content>


<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
   
</asp:Content>



