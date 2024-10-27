<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMainPageMaster.Master" AutoEventWireup="true" Inherits="Admin_BranchAdd" Codebehind="BranchAdd.aspx.cs" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="bodyContainer">
        <div class="pageTitle">
            <div class=" container">
                <div class="row">
                    <div class="col-12">         
                          <h1 style="height: 50px;">بيانات الافراع </h1>
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
                    <li class="active pull-right"> <asp:Button ID="CmdAdd" runat="server" Text="" CssClass="mainBarButtons addBtn"  CausesValidation="False" data-bs-toggle="tooltip" data-placement="bottom" title="اضف بيان جديد" UseSubmitBehavior="False" OnClick="CmdAdd_Click" /></li>
                    <li id="Li2" runat="server" class="pull-right"> <asp:Button ID="cmdsave" runat="server" Text="" CssClass="mainBarButtons saveBtn"  Visible="true"  data-bs-toggle="tooltip" data-placement="bottom" title="حفظ التعديلات" UseSubmitBehavior="False" OnClick="cmdsave_Click" /></li>
                                     <li id="Li3" runat="server" class="pull-right"><asp:Button ID="DelCmd" runat="server" Text="" CssClass="mainBarButtons deletBtn"  data-bs-toggle="tooltip" data-placement="bottom" title="حذف البيانات" UseSubmitBehavior="False" OnClick="DelCmd_Click" /></li>
                    <li id="Li1" runat="server" class="active pull-right">  <asp:Button ID="CloseBtn" runat="server" Text="" CssClass="mainBarButtons CloseBtn"  data-bs-toggle="tooltip" data-placement="bottom" title="خروج" UseSubmitBehavior="False" OnClick="CloseBtn_Click" /></li>
                  
                </ul>
                      
                </div>
    </nav>
                 
            
                   
         <div id="formTabs" class="container pull-right" >
        <%--tabs head--%>
        <ul class="nav nav-pills" >
            
            <li class="active pull-right" ><a href="#basicStudentInfo"  data-bs-toggle="tab">بيانات اساسية</a></li>
            <li id="studentBasicInfoTab2" runat="server" class="pull-right"><a href="#basicOtherFileInfo"  data-bs-togglef="tab">بيانات اخرى</a></li>
 
        </ul>
            
        <div class="tab-content clearfix">
            <%-- Student basic informatin section --%>
            <div class="tab-pane active" id="basicStudentInfo">
                <h3>البيانات الاساسية </h3>    
                <div class="row">
                    <div class="col-sm-6 pull-right">
                                              
                        <div>
                           <asp:Label ID="Label18" runat="server" Text="أسم الشركة" ></asp:Label>
                          <asp:TextBox ID="txBranchName" runat="server" CssClass="FormTextBox" placeholder="أسم الشركة" required="required"></asp:TextBox>
                            <span class="alert-text" >*</span>
                            <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtStudentBirthDay" ErrorMessage="أدخل تاريخ الميلاد"></asp:RequiredFieldValidator>--%>
                        </div>
                          <div>
                           <asp:Label ID="Label6" runat="server" Text="أسم الشركة بالانجليزية" ></asp:Label>
                            <asp:TextBox ID="txtCompanyEng" runat="server" CssClass="FormTextBox" placeholder="الاسم الانجليزي" required="required" ></asp:TextBox>
                           <span class="alert-text" >*</span>
                        </div>
                        <div>
                            <asp:Label ID="Label21" runat="server" Text="الرقم المدنى للكفيل"></asp:Label>
                            <asp:TextBox ID="txtCivilId" runat="server" CssClass="FormTextBox"   placeholder="الرقم المدنى للكفيل"></asp:TextBox>
                             <span class="alert-text" >*</span>
                        </div>
                        <div>
                            <asp:Label ID="Label1" runat="server" Text="الرقم الموحد للكفيل" ></asp:Label>
                            <asp:TextBox ID="txtUiqNum" runat="server" CssClass="FormTextBox" placeholder="الرقم الموحد للكفيل" required="required"></asp:TextBox> 
                             </div>
                      
                            <div>
                            <asp:Label ID="Label2" runat="server" Text="الاسم التجاري" ></asp:Label>
                            <asp:TextBox ID="txtsCompanyName" runat="server" CssClass="FormTextBox" placeholder="الاسم التجاري" required="required"></asp:TextBox> 
                             </div>
                          <div>
                            <asp:Label ID="Label13" runat="server" Text="اسم الكفيل" ></asp:Label>
                            <asp:TextBox ID="txtOwner" runat="server" CssClass="FormTextBox" placeholder="اسم الكفيل" required="required"></asp:TextBox> 
                             </div>
                          <div>
                            <asp:Label ID="Label7" runat="server" Text="جنسية الكفيل" ></asp:Label>
                            <asp:TextBox ID="txtOwnerNat" runat="server" CssClass="FormTextBox" placeholder="جنسية الكفيل" required="required"></asp:TextBox> 
                          </div>
                       
                        
                       </div>
                       
    
                    <div class="col-sm-6 pull-left">
                         <div>
                            <asp:Label ID="Label8" runat="server" Text="أسم المفوض بالتوقيع" ></asp:Label>
                            <asp:TextBox ID="txtSignPerson" runat="server" CssClass="FormTextBox" placeholder="المفوض بالتوقيع" required="required"></asp:TextBox> 
                          </div>
                        <div>
                            <asp:Label ID="Label4" runat="server" Text="المفوض بالتوقيع بالانجليزية" ></asp:Label>
                            <asp:TextBox ID="txtSignPersonEng" runat="server" CssClass="FormTextBox" placeholder="المفوض بالتوقيع بالانجليزية" required="required"></asp:TextBox> 
                          </div>
                        <div>
                                 <asp:Label ID="Label5" runat="server" Text="رقم الترخيص" ></asp:Label>
                                <asp:TextBox ID="txtApplyNo" runat="server" CssClass="FormTextBox"    placeholder="رقم الترخيص" ></asp:TextBox>
                                 
                        </div>

                        <div>
                                 <asp:Label ID="Label9" runat="server" Text="نشاط الشركة" ></asp:Label>
                                <asp:TextBox ID="hintNameTextBox" runat="server" CssClass="FormTextBox"    placeholder="نشاط الشركة" ></asp:TextBox>
                                 
                        </div>
                        <div>
                                 <asp:Label ID="Label10" runat="server" Text="نشاط الشركة بالانجليزية" ></asp:Label>
                                <asp:TextBox ID="txtActEng" runat="server" CssClass="FormTextBox"   placeholder="نشاط الشركة بالانجليزية" ></asp:TextBox>
                                 
                        </div>
                        <div>
                                 <asp:Label ID="Label12" runat="server" Text="الهاتف" ></asp:Label>
                                <asp:TextBox ID="telPhoneTextBox" runat="server" CssClass="FormTextBox"   placeholder="الهاتف" ></asp:TextBox>
                                 
                        </div>
                      
                         <div >
                             
                            <asp:Label ID="Label11" runat="server"   Text="رقم الملف"></asp:Label>
                               
                                    <asp:TextBox ID="txtFileNo" runat="server" CssClass="FormTextBox"   placeholder="رقم الملف"></asp:TextBox>
                                 
                        </div>
                      
                       
                    </div>
                </div>
               
            </div>

            <%-- Student educaton file information section --%>
            <div class="tab-pane" id="basicOtherFileInfo">
                <h3>بيانات اخرى</h3>
                <hr />
                <%-- Tools Section --%>
                <div class="row">
                    <div class="col-sm-6 pull-right ">
                        <div >
                           <asp:Label ID="Label77" runat="server"  Text="عنوان الفرع" ></asp:Label>                     
                        <asp:TextBox ID="addressTextBox" runat="server" CssClass="FormTextBox"  placeholder="عنوان الفرع"></asp:TextBox>
                        </div>
                          
                        <div>
                         <asp:Label ID="Label53" runat="server"    Text="محافظة" ></asp:Label>
                            <asp:DropDownList ID="cmbGov" runat="server" CssClass="FormDropDownList" DataSourceID="ObjectDataSourceGov" DataTextField="GOVER_DESC" DataValueField="GOVER_CODE">
                            </asp:DropDownList>
                       </div> 
                         <div>
                        <asp:Label ID="Label52" runat="server"    Text="منطقة"></asp:Label>
                         <asp:TextBox ID="txtCompArea" runat="server" CssClass="FormTextBox"  placeholder="منطقة"></asp:TextBox>
                        </div>
                        <div>
                               <asp:Label ID="Label3" runat="server"  Text="رقم القطعة" ></asp:Label>
                                 <asp:TextBox ID="txtCompBlockNo" runat="server" CssClass="FormTextBox" placeholder="رقم القطعة"></asp:TextBox>
                        </div>
                        
                         <div>
                               <asp:Label ID="Label14" runat="server"  Text="جاده" ></asp:Label>
                                 <asp:TextBox ID="txtGada" runat="server" CssClass="FormTextBox" placeholder="جاده"></asp:TextBox>
                        </div>
                      <div>
                               <asp:Label ID="Label15" runat="server"  Text="الدور" ></asp:Label>
                                 <asp:TextBox ID="txtFloor" runat="server" CssClass="FormTextBox" placeholder="الدور"></asp:TextBox>
                        </div>

                        <div>
                               <asp:Label ID="Label16" runat="server"  Text="شقة" ></asp:Label>
                                 <asp:TextBox ID="txtFlat" runat="server" CssClass="FormTextBox" placeholder="شقة"></asp:TextBox>
                        </div>
                        <div>
                             <asp:Label ID="Label20" runat="server"  Text="الرقم الالى للعنوان" ></asp:Label>
                            <asp:TextBox ID="txtAutoAddress" runat="server" CssClass="FormTextBox"    placeholder="الرقم الالى للعنوان"></asp:TextBox>

                             </div>
                       </div> 
                                   
                           
                    <div class="col-sm-6 pull-left">
                            <div >
                              <asp:Label ID="Label55" runat="server"  Text="الرمز البريدي" ></asp:Label>
                                   <asp:TextBox ID="txtmailNo" runat="server" CssClass="FormTextBox" placeholder="الرمز البريدي"></asp:TextBox>
                           
                        </div>
                        <div> 
                             <asp:Label ID="Label54" runat="server" Text="صندوق بريد" ></asp:Label>
                                   <asp:TextBox ID="txtMailBox" runat="server" CssClass="FormTextBox" placeholder="الراتب الاساسى" ></asp:TextBox>
                          
                        </div> 
                        <div>
                             <asp:Label ID="Label56" runat="server"  Text="رقم الممثل القانوني" ></asp:Label>
                             <asp:TextBox ID="txtLawNo" runat="server" CssClass="FormTextBox" placeholder="اخر زيادة"></asp:TextBox>
                       </div>
                         <div >
                            <asp:Label ID="Label62" runat="server"  Text="شارع" ></asp:Label>
                            <asp:TextBox ID="txtstreet" runat="server" CssClass="FormTextBox"  placeholder="شارع"></asp:TextBox>
                           </div >
                          <div >
                            <asp:Label ID="Label17" runat="server"  Text="نوع المبنى" ></asp:Label>
                            <asp:TextBox ID="txtHouseType" runat="server" CssClass="FormTextBox"  placeholder="نوع المبنى"></asp:TextBox>
                           </div >
                       
                           <div>
                             <asp:Label ID="Label74" runat="server"  Text="رقم العقد" ></asp:Label>
                            <asp:TextBox ID="txtContract" runat="server" CssClass="FormTextBox"    placeholder="رقم العقد"></asp:TextBox>
                               
                        </div>
                         <div>
                             <asp:Label ID="Label19" runat="server"  Text="البريد الالكتروني" ></asp:Label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="FormTextBox"    placeholder="البريد الالكتروني"></asp:TextBox>

                             </div>
                                      
                    </div>
                </div>
              
            </div>    
     </div>
                    
           
            
          
        
                         </div>
                     </div>
                 </div>
          </div>
    
    </div> 
   
    <asp:TextBox ID="txtid" runat="server" Visible="False"  ></asp:TextBox>
    </div>
    
      <asp:ObjectDataSource ID="ObjectDataSourceGov" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="PersonalDataSetTableAdapters.CDE_GOVERNORATETableAdapter">
    </asp:ObjectDataSource>
    
      <asp:ObjectDataSource ID="ObjectDataSourceBranch" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByOrgId" TypeName="PersonalDataSetTableAdapters.BRANCHESTableAdapter" InsertMethod="Insert" UpdateMethod="Update" DeleteMethod="Delete">
          <DeleteParameters>
              <asp:Parameter Name="Original_BRANCHCODE" Type="Int64" />
          </DeleteParameters>
          <InsertParameters>
              <asp:ControlParameter ControlID="txBranchName" Name="BRANCHNAME" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtCompanyEng" Name="CompanyName" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="addressTextBox" Name="Address" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="telPhoneTextBox" Name="TelPhone" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="hintNameTextBox" Name="HintName" PropertyName="Text" Type="String" />
              <asp:Parameter Name="SalInvSerial" Type="Int64" />
              <asp:Parameter Name="PurchInvSerial" Type="Int64" />
              <asp:Parameter Name="InvOrderSerial" Type="Int64" />
              <asp:Parameter Name="OrderSerial" Type="Int64" />
              <asp:Parameter Name="MovementSerial" Type="Int64" />
              <asp:Parameter Name="salesaccid" Type="Int16" />
              <asp:Parameter Name="purchaseaccid" Type="Int16" />
              <asp:Parameter Name="boxaccid" Type="Int64" />
              <asp:Parameter Name="bankaccid" Type="Int64" />
              <asp:Parameter Name="Visaaccid" Type="Int64" />
              <asp:Parameter Name="Masteraccid" Type="Int64" />
              <asp:Parameter Name="KeyNetaccid" Type="Int64" />
              <asp:Parameter Name="Otheraccid" Type="Int64" />
              <asp:Parameter Name="VisaComaccid" Type="Int64" />
              <asp:Parameter Name="MasterComaccid" Type="Int64" />
              <asp:Parameter Name="KeyNetComaccid" Type="Int64" />
              <asp:ControlParameter ControlID="txtAutoAddress" Name="OtherComaccid" PropertyName="Text" Type="Int64" />
              <asp:Parameter Name="salesAgalaccid" Type="Int64" />
              <asp:Parameter Name="purchaseAgalaaccid" Type="Int64" />
              <asp:ControlParameter ControlID="txtOwner" Name="OwnerName" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtOwnerNat" Name="OwnerNat" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtCompBlockNo" Name="BlockNo" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtCompArea" Name="Area" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="cmbGov" Name="GovId" PropertyName="SelectedValue" Type="Int32" />
              <asp:ControlParameter ControlID="txtGada" Name="Gada" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtHouseType" Name="HouseType" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtFloor" Name="Floor" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtFlat" Name="FlatNo" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtstreet" Name="Street" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtmailNo" Name="MailSign" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtMailBox" Name="MailBox" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtSignPerson" Name="SignatureOwner" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtFileNo" Name="FileNo" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtsCompanyName" Name="CommerName" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtApplyNo" Name="CommerRecord" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtCivilId" Name="CivilId" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtUiqNum" Name="uinNum" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtActEng" Name="ActivityEng" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtCompanyEng" Name="CompanyNameEng" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtSignPersonEng" Name="SignatureOwnerEng" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtContract" Name="ContractNo" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtLawNo" Name="LawNo" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtEmail" Name="Email" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtOrgId" Name="OrgId" PropertyName="Text" Type="Int64" />
          </InsertParameters>
          <SelectParameters>
              <asp:ControlParameter ControlID="txtOrgId" Name="OrgId" PropertyName="Text" Type="Int64" />
          </SelectParameters>
          <UpdateParameters>
              <asp:ControlParameter ControlID="txBranchName" Name="BRANCHNAME" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtCompanyEng" Name="CompanyName" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="addressTextBox" Name="Address" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="telPhoneTextBox" Name="TelPhone" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="hintNameTextBox" Name="HintName" PropertyName="Text" Type="String" />
              <asp:Parameter Name="SalInvSerial" Type="Int64" />
              <asp:Parameter Name="PurchInvSerial" Type="Int64" />
              <asp:Parameter Name="InvOrderSerial" Type="Int64" />
              <asp:Parameter Name="OrderSerial" Type="Int64" />
              <asp:Parameter Name="MovementSerial" Type="Int64" />
              <asp:Parameter Name="salesaccid" Type="Int16" />
              <asp:Parameter Name="purchaseaccid" Type="Int16" />
              <asp:Parameter Name="boxaccid" Type="Int64" />
              <asp:Parameter Name="bankaccid" Type="Int64" />
              <asp:Parameter Name="Visaaccid" Type="Int64" />
              <asp:Parameter Name="Masteraccid" Type="Int64" />
              <asp:Parameter Name="KeyNetaccid" Type="Int64" />
              <asp:Parameter Name="Otheraccid" Type="Int64" />
              <asp:Parameter Name="VisaComaccid" Type="Int64" />
              <asp:Parameter Name="MasterComaccid" Type="Int64" />
              <asp:Parameter Name="KeyNetComaccid" Type="Int64" />
              <asp:ControlParameter ControlID="txtAutoAddress" Name="OtherComaccid" PropertyName="Text" Type="Int64" />
              <asp:Parameter Name="salesAgalaccid" Type="Int64" />
              <asp:Parameter Name="purchaseAgalaaccid" Type="Int64" />
              <asp:ControlParameter ControlID="txtOwner" Name="OwnerName" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtOwnerNat" Name="OwnerNat" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtCompBlockNo" Name="BlockNo" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtCompArea" Name="Area" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="cmbGov" Name="GovId" PropertyName="SelectedValue" Type="Int32" />
              <asp:ControlParameter ControlID="txtGada" Name="Gada" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtHouseType" Name="HouseType" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtFloor" Name="Floor" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtFlat" Name="FlatNo" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtstreet" Name="Street" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtmailNo" Name="MailSign" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtMailBox" Name="MailBox" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtSignPerson" Name="SignatureOwner" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtFileNo" Name="FileNo" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtsCompanyName" Name="CommerName" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtApplyNo" Name="CommerRecord" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtCivilId" Name="CivilId" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtUiqNum" Name="uinNum" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtActEng" Name="ActivityEng" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtCompanyEng" Name="CompanyNameEng" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtSignPersonEng" Name="SignatureOwnerEng" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtContract" Name="ContractNo" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtLawNo" Name="LawNo" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtEmail" Name="Email" PropertyName="Text" Type="String" />
              <asp:ControlParameter ControlID="txtOrgId" Name="OrgId" PropertyName="Text" Type="Int64" />
              <asp:ControlParameter ControlID="txtid" Name="Original_BRANCHCODE" PropertyName="Text" Type="Int64" />
          </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:TextBox ID="txtOrgId" runat="server" Visible="False"  ></asp:TextBox>
    
   
    <asp:TextBox ID="txtEditFlag" runat="server" Visible="False"  >0</asp:TextBox>
    
   
</asp:Content>


<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
   
</asp:Content>



