<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageCustomerMain.master" AutoEventWireup="true" Inherits="Admin_CustomerAddData" EnableViewStateMac="false" EnableEventValidation="false"  ValidateRequest="false" Codebehind="CustomerAddData.aspx.cs" %>


<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
  
       <div class="bodyContainer">
        <div class="pageTitle">
            <div class="container">
                <div class="row">
                    <div class="col-12">         
                          <h1 style="  width: 100%; height:100%"> أدخال البيانات  </h1>
                    </div>
                </div>
            </div>
        </div>
     
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="formContactUs">
         <nav class="navbar buttonsNavBar">
        <div class="container-fluid">
             <ul class="nav nav-pills">
            <li class="active pull-right"> <asp:Button ID="CmdAdd" runat="server" Text="" CssClass="mainBarButtons addBtn"  CausesValidation="False" data-toggle="tooltip" data-placement="bottom" title="اضف بيان جديد" UseSubmitBehavior="False" OnClick="CmdAdd_Click" /></li>
            <%--<li id="Li1" runat="server" class="active pull-right">  <asp:Button ID="EditCmd" runat="server" Text="" CssClass="mainBarButtons editBtn"  data-toggle="tooltip" data-placement="bottom" title="تعديل البيانات" UseSubmitBehavior="False"  Visible="False" /></li>
            <li id="Li2" runat="server" class="pull-right"> <asp:Button ID="cmdsave" runat="server" Text="" CssClass="mainBarButtons saveBtn"  Visible="true" data-toggle="tooltip" data-placement="bottom" title="حفظ التعديلات" UseSubmitBehavior="False" OnClick="cmdsave_Click" /></li>
            <li id="Li3" runat="server" class="pull-right"><asp:Button ID="DelCmd" runat="server" Text="" CssClass="mainBarButtons deletBtn"  data-toggle="tooltip" data-placement="bottom" title="حذف البيانات" UseSubmitBehavior="False" OnClick="DelCmd_Click" /></li>--%>
<%--          <li id="Li4" runat="server" class="pull-right"><asp:Button ID="BtnPrint" runat="server" Text="" CssClass="mainBarButtons printBtn"  data-toggle="tooltip" data-placement="bottom" title="طباعة البيانات" UseSubmitBehavior="False" OnClick="BtnPrint_Click" /></li>--%>
           <li id="Li5" runat="server" class="pull-right"><asp:Button ID="CloseBtn" runat="server" Text="" CssClass="mainBarButtons CloseBtn"  data-toggle="tooltip" data-placement="bottom" title="خروج" UseSubmitBehavior="False" OnClick="CloseBtn_Click" Visible="False" /></li>
        </ul>
      
        </div>
    </nav>
                      
                                         
       <div id="formTabs" class="container pull-right" >
        <%--tabs head--%>
        <ul class="nav nav-pills" >
            
            <li class="active pull-right" ><a href="#basicStudentInfo" data-toggle="tab">بيانات اساسية</a></li>
   <%--         <li id="studentBasicInfoTab2" runat="server" class="pull-right"><a href="#basicEducationFileInfo" data-toggle="tab">الملف الوظيفي</a></li>--%>
            <li id="studentBasicInfoTab3" runat="server" class="pull-right"><a href="#basicOtherInfo" data-toggle="tab">طباعة النماذج</a></li>
<%--            <li id="studentBasicInfoTab4" runat="server" class="pull-right"><a href="#basicStudentCaseStudyInfo" data-toggle="tab"></a></li>--%>

        </ul>
            
        <div class="tab-content clearfix">
            <%-- Student basic informatin section --%>
            <div class="tab-pane active" id="basicStudentInfo">
                <h3>البيانات الاساسية </h3>    
                <div class="row">
                    <div class="col-sm-3 pull-right">
                      
                         <div>
                         <asp:Label ID="Label7" runat="server"    Text="نوع الطلب" ></asp:Label>
                            <asp:DropDownList ID="DropDownListApplicationTypes" placeholder="نوع الطلب" runat="server" CssClass="FormDropDownList" DataSourceID="ObjectDataSourceApplicationTypes" DataTextField="AppTypeDesc" DataValueField="AppTypeId">
                                    </asp:DropDownList>
                       </div> 
                    
                        <div>
                         <asp:Label ID="Label9" runat="server"    Text="الادارة" ></asp:Label>
                            <asp:DropDownList ID="DropDownListGov" placeholder="الادارة" runat="server" CssClass="FormDropDownList" DataSourceID="ObjectDataSourceEmpGov" DataTextField="GOVER_DESC" DataValueField="GOVER_CODE">
                                    </asp:DropDownList>
                       </div> 
                    
                       
                         <div>
                            <asp:Label ID="Label1" runat="server" Text="الاسم العربى لمقدم الطلب" ></asp:Label>
                            <asp:TextBox ID="txtEmpFulName" runat="server" CssClass="FormTextBox" placeholder=" الاسم العربى لمقدم الطلب" required="required"></asp:TextBox> 
                            <span class="alert-text" >*</span>
                        </div>
                      
                      <div>
                               <asp:Label ID="Label76" runat="server"    Text="الرقم الموحد" ></asp:Label>
                            <asp:TextBox ID="txtEmpCommanNo" runat="server" CssClass="FormTextBox" placeholder="الرقم الموحد" ></asp:TextBox>
                        </div>
                     
                        <div >
                        <asp:Label ID="Label65" runat="server"  Text="رقم جواز السفر" ></asp:Label>
                         
                <asp:TextBox ID="txtPassportNo" runat="server" CssClass="FormTextBox" placeholder="رقم جواز السفر" ></asp:TextBox>
                    </div >
                          <div >
                 <asp:Label ID="Label70" runat="server"  Text="نوع الجواز" ></asp:Label>
                   <asp:TextBox ID="txtPassType" runat="server" CssClass="FormTextBox" placeholder="نوع الجواز" ></asp:TextBox>
                         </div >
                         <div>
                           <asp:Label ID="Label49" runat="server"    Text="الحالة الاجتماعية" ></asp:Label>
                                  <asp:DropDownList ID="CmbEmpMatStatus" runat="server" CssClass="FormDropDownList"   DataSourceID="ObjectDataSourceMalStatus" DataTextField="StatusDesc" DataValueField="StatusId">
                                </asp:DropDownList>
                        </div>
                           <div >
                            <asp:Label ID="Label57" runat="server" Text="سنة التخرج" ></asp:Label>
                            <asp:TextBox ID="txtEducationDate" runat="server" CssClass="FormTextBox"  placeholder="سنة التخرج" ></asp:TextBox>

                        </div>
                         <div >                        
                           <asp:Label ID="Label77" runat="server"  Text="تاريخ التعيين" ></asp:Label>
                        
                        <asp:TextBox ID="txtHireDate" runat="server" CssClass="FormTextBox"  data-toggle="datepicker" placeholder="تاريخ التعيين"></asp:TextBox>
                        </div>
                           <div >
                             
                            <asp:Label ID="Label41" runat="server"   Text="تاريخ انتهاءالاقامة"></asp:Label>
                               
                                    <asp:TextBox ID="txtVisaEndDate" runat="server" CssClass="FormTextBox"  data-toggle="datepicker" placeholder="تاريخ انتهاءالاقامة"></asp:TextBox>
                                 <span class="alert-text" >*</span>
                        </div>
                       
                       </div>
                       
                                                

                    <div class="col-sm-3 pull-right">
                          <div>
                         <asp:Label ID="Label8" runat="server"    Text="نوع الاقامة" ></asp:Label>
                              <asp:DropDownList ID="DropDownListResidenceTypes" placeholder="نوع الاقامة" runat="server" CssClass="FormDropDownList" DataSourceID="ObjectDataSourceResidenceTypes" DataTextField="ResTypeDesc" DataValueField="ResTypeID">
                                    </asp:DropDownList>
                       </div> 
                          <div>
                         <asp:Label ID="Label10" runat="server"    Text="مادة الاقامة" ></asp:Label>
                              <asp:DropDownList ID="DropDownListResidenceItems" مادةplaceholder="مادة الاقامة" runat="server" CssClass="FormDropDownList" DataSourceID="ObjectDataSourceResidenceItems" DataTextField="ResidenceItemDesc" DataValueField="ResidenceItemId">
                                    </asp:DropDownList>
                       </div> 
                           <div>
                           <asp:Label ID="Label6" runat="server" Text=" الاسم الانجليزي لمقدم الطلب" ></asp:Label>
                            <asp:TextBox ID="txtEmpFulEngName" runat="server" CssClass="FormTextBox" placeholder="الاسم الانجليزي لمقدم الطلب" required="required" ></asp:TextBox>
                           <span class="alert-text" >*</span>
                        </div>

                       

                     

                        <div>
                             <div>
                             <asp:Label ID="Label46" runat="server"   Text="الجنسية" ></asp:Label>
                              <asp:DropDownList ID="CmbEmpNat" runat="server" CssClass="FormTextBox"   DataSourceID="ObjectDataSourceNats" DataTextField="NATIONALITY_DESC" DataValueField="NATIONALITY_CODE">
                              </asp:DropDownList>
                        </div>
                               <div >
                        <asp:Label ID="Label67" runat="server" Text="تاريخ اصدار الجواز" ></asp:Label>      
                            <asp:TextBox ID="txtPassDate" runat="server" CssClass="FormTextBox"  data-toggle="datepicker" placeholder="تاريخ اصدار الجواز"></asp:TextBox>
                        </div >
                           <asp:Label ID="Label45" runat="server"  Text="المؤهل" ></asp:Label>
                                     <asp:DropDownList ID="cmbEducation" runat="server" CssClass="FormDropDownList"   DataSourceID="ObjectDataSourceEduction" DataTextField="QLF_DESC" DataValueField="QLF_TYP_CODE">
                                    </asp:DropDownList>
                                 <span class="alert-text" >*</span>
                        </div>
                        <div>
                             <asp:Label ID="Label43" runat="server"    Text="الوظيفة" ></asp:Label>
                               <asp:DropDownList ID="CmbJob" runat="server" CssClass="FormDropDownList"   DataSourceID="ObjectDataSourceJobs" DataTextField="JOB_CLS_DESC" DataValueField="JOB_CLS_CODE">
                                 </asp:DropDownList>
                        </div>
                     
                         <div>
                            <asp:Label ID="Label64" runat="server"  Text="رقم العقد"></asp:Label>
                            <asp:TextBox ID="txtContractNo" runat="server" CssClass="FormTextBox" placeholder="رقم العقد"></asp:TextBox>
                     </div>
                       
                        <div>
                             <asp:Label ID="Label2" runat="server"  Text="رقم الرخصة"  ></asp:Label>
                                 <asp:TextBox ID="txtLicenceNo" runat="server" CssClass="FormTextBox" placeholder="رقم الرخصة"  ></asp:TextBox>
                                 <span class="alert-text" >*</span>
                         </div>

                          <div>
                            <asp:Label ID="Label72" runat="server"    Text="المسمي الوظيفي" ></asp:Label>
                                  <asp:DropDownList ID="CmbEmpDept" runat="server" CssClass="FormDropDownList"  >
                            </asp:DropDownList>
                        </div>
                       
                         
                       <%-- <div class="row">
                            <div class=" col-sm-3 pull-right">
                                

                            </div>
                        </div>--%>
                        
                    </div>
                    <div class="col-sm-3 pull-right">
                       <div>
                         <asp:Label ID="Label12" runat="server"    Text="الغرض" ></asp:Label>
                           <asp:DropDownList ID="DropDownListAppReasons" placeholder="الغرض" runat="server" CssClass="FormDropDownList" DataSourceID="ObjectDataSourceAppReasons" DataTextField="AppReasonDesc" DataValueField="AppReasonId">
                                    </asp:DropDownList>
                       </div> 
                         <div>
                               <asp:Label ID="Label3" runat="server"  Text="رقم الاقامة" ></asp:Label>
                                 <asp:TextBox ID="txtEmpVisaNo" runat="server" CssClass="FormTextBox" placeholder="رقم الاقامة"></asp:TextBox>
                        </div>
                          <div>
                            <asp:Label ID="Label47" runat="server"  Text="الجنس" ></asp:Label>

                                <asp:DropDownList ID="CmbEmpGender" runat="server" CssClass="FormDropDownList"   required="required" DataSourceID="ObjectDataSourceSex" DataTextField="Sex" DataValueField="Id" placeholder="الجنس">
                                 </asp:DropDownList>
                                 <span class="alert-text" >*</span>
                        </div>

                         <div>
                          <asp:Label ID="Label11" runat="server"   Text="محل الميلاد"></asp:Label>
                          <asp:TextBox ID="txtBirthPlace" runat="server" CssClass="FormTextBox" placeholder="محل الميلاد"></asp:TextBox>
                            <span class="alert-text" >*</span>
                        </div>
                           <div >
                      <asp:Label ID="Label68" runat="server"   Text="تاريخ انتهاء الجواز"></asp:Label>
                                <asp:TextBox ID="txtPassEndDate" runat="server" CssClass="FormTextBox" required="required" data-toggle="datepicker"  placeholder="تاريخ انتهاء الجواز"></asp:TextBox>
                </div >
                        <div>
                             <asp:Label ID="Label74" runat="server"  Text="تاريخ الدخول" ></asp:Label>
                         <asp:TextBox ID="txtEnterDate" runat="server" CssClass="FormTextBox"   data-toggle="datepicker" placeholder="تاريخ الدخول"></asp:TextBox>
                
                        </div>
                           <div>
                             <asp:Label ID="Label44" runat="server"   Text="الوظيفة بالانجليزية" ></asp:Label>
                                <asp:DropDownList ID="CmbEngJob" runat="server" CssClass="FormDropDownList"   DataSourceID="ObjectDataSourceJobs" DataTextField="JOB_CLS_DESC_Eng" DataValueField="JOB_CLS_CODE">
                                    </asp:DropDownList>
                        </div>
                         <div>
                            <asp:Label ID="Label60" runat="server"  Text="رقم التأمين الصحى" ></asp:Label>
       
                            <asp:TextBox ID="txtEmpHealthInsNo" runat="server" CssClass="FormTextBox" placeholder="رقم التأمين الصحى"></asp:TextBox>
                       </div>
                        <div>
                         <asp:Label ID="Label61" runat="server"    Text="نوع الرخصة" ></asp:Label>
             
                           <asp:DropDownList ID="CmbLicenseType" runat="server" CssClass="FormDropDownList"   DataSourceID="ObjectDataSourceLicenseType" DataTextField="LicenseTypeDesc" DataValueField="LicenseTypeId">
                            </asp:DropDownList>
                            </div>
                                 <div>
                           <asp:Label ID="Label52" runat="server"    Text="نوع الاقامة"></asp:Label>
                                 <asp:TextBox ID="txtVisatype" runat="server" CssClass="FormTextBox"  placeholder="نوع الاقامة"></asp:TextBox>
                                </div>
                    </div>
                     <div class="col-sm-3 pull-right">
                       <div>
                         <asp:Label ID="Label13" runat="server"    Text="الاجراء" ></asp:Label>
                           <asp:DropDownList ID="DropDownListAppProcedures" placeholder="الاجراء" runat="server" CssClass="FormDropDownList" DataSourceID="ObjectDataSourceAppProcedures" DataTextField="AppProcedureDesc" DataValueField="AppProcedureId">
                                    </asp:DropDownList>
                       </div> 
                         <div>
                            <asp:Label ID="Label21" runat="server" Text="الرقم المدني"></asp:Label>
                            <asp:TextBox ID="txtCivilId" runat="server" CssClass="FormTextBox"  required="required" placeholder="الرقم المدنى"></asp:TextBox>
                             <span class="alert-text" >*</span>
                        </div>
                            <div>
                                 <asp:Label ID="Label5" runat="server" Text="تاريخ الميلاد" ></asp:Label>
                                <asp:TextBox ID="txtEmpBirthDate" runat="server" CssClass="FormTextBox" required="required" data-toggle="datepicker"  placeholder="تاريخ الميلاد" ></asp:TextBox>
                                 <span class="alert-text" >*</span>
                        </div>
                         
                          <div>
                             <asp:Label ID="Label4" runat="server"   Text="الديانة" ></asp:Label>
                                <asp:DropDownList ID="cmbRelgion" runat="server" CssClass="FormDropDownList"   DataSourceID="ObjectDataSourceRelgion" DataTextField="ReligionDesc" DataValueField="ReligionId" placeholder="الديانة" required="required">
                                       </asp:DropDownList>
                        </div>
                            <div >
                 <asp:Label ID="Label66" runat="server" Text="مكان الاصدار الجواز" ></asp:Label>
                  <asp:TextBox ID="txtPassplace" runat="server" CssClass="FormTextBox" placeholder="مكان الاصدار الجواز"></asp:TextBox>
                </div >
                           <div >

                    <asp:Label ID="Label69" runat="server"   Text=" جنسية الجواز" ></asp:Label>
                   <asp:TextBox ID="txtPlaceNat" runat="server" CssClass="FormTextBox" placeholder=" جنسية الجواز"></asp:TextBox>
                </div >
                         <div> 
                             <asp:Label ID="Label54" runat="server" Text="الراتب الاساسى" ></asp:Label>
                                   <asp:TextBox ID="txtBSalary" runat="server" CssClass="FormTextBox" placeholder="الراتب الاساسى" ></asp:TextBox>
                          
                        </div> 
                          <div>
                             <asp:Label ID="Label71" runat="server"  Text="انتهاء التأمبن الصحي" ></asp:Label>
                            <asp:TextBox ID="txtEmpHealthInsDate" runat="server" CssClass="FormTextBox"  data-toggle="datepicker" placeholder="انتهاء التأمبن الصحي"></asp:TextBox>
                
                        </div>
                          <div>
                            <asp:Label ID="Label63" runat="server"  Text="تاريخ انتهاء الرخصة " ></asp:Label>
                            <asp:TextBox ID="txtLicenseEndDate" runat="server" CssClass="FormTextBox" data-toggle="datepicker" placeholder="تاريخ انتهاء الرخصة "></asp:TextBox>
               
                        </div>

                         
                    </div>
                  </div>
               
            </div>

            <%-- Student educaton file information section --%>
           <%-- <div class="tab-pane" id="basicEducationFileInfo">
                <h3>الملف الملف الوظيفي</h3>
                <hr />--%>
                <%-- Tools Section --%>
               <%-- <div class="row">
                    <div class="col-sm-6 pull-right ">
                       
                        
                        <div>
                         <asp:Label ID="Label53" runat="server"    Text="حالة الموظف" ></asp:Label>
                                    <asp:DropDownList ID="CmbStatus" runat="server"  CssClass="FormDropDownList" DataSourceID="ObjectDataSourceEmpStatus" DataTextField="StatusDesc" DataValueField="Id">
                                    </asp:DropDownList>
                       </div> 
                         
                        
                     

                   <div>
                            <asp:Label ID="Label51" runat="server"    Text="الكفيل"></asp:Label>
                                <asp:DropDownList ID="CmbEmpBranch" runat="server" CssClass="FormDropDownList"   DataSourceID="ObjectDataSourceBranches" DataTextField="BRANCHNAME" DataValueField="BRANCHCODE">
                                </asp:DropDownList>
                           
                        </div>
                       </div> 
                                   
                           
                    <div class="col-sm-6 pull-left">
                            <div >
                              <asp:Label ID="Label55" runat="server"  Text="الراتب الفعلى" ></asp:Label>
                                   <asp:TextBox ID="txtAcualSal" runat="server" CssClass="FormTextBox" placeholder="الراتب الفعلى"></asp:TextBox>
                           
                        </div>
                        
                        <div>
                             <asp:Label ID="Label56" runat="server"  Text="اخر زيادة" ></asp:Label>
                             <asp:TextBox ID="txtLastInc" runat="server" CssClass="FormTextBox" placeholder="اخر زيادة"></asp:TextBox>
                       </div>
                         <div >
                            <asp:Label ID="Label62" runat="server"  Text="تاريخ اخر زيادة" ></asp:Label>

                            <asp:TextBox ID="txtLastIncDate" runat="server" CssClass="FormTextBox" data-toggle="datepicker" placeholder="تاريخ اخر زيادة"></asp:TextBox>
                           </div >

                       
                        <div>
                              <asp:Label ID="Label73" runat="server"  Text="القسم" ></asp:Label>
              
                        <asp:DropDownList ID="cmbDeptsNew" runat="server" CssClass="FormDropDownList"   DataSourceID="ObjectDataSourceDeptsNew" DataTextField="LocName" DataValueField="LocId">
                        </asp:DropDownList>
                        </div>
                        
                        
                      
                       
                    </div>
                </div>--%>
              
          <%--  </div>--%>

             <div class="tab-pane" id="basicOtherInfo">
                <h3>النماذج</h3>
                <hr />
                <%-- Tools Section --%>
                <div class="row">
                     
                    <div class="col-sm-3 pull-right ">
                        <div>
                         <asp:Label ID="Label14" runat="server"    Text="أسم الزائر بالعربى" ></asp:Label>
                          <asp:TextBox ID="txtVisitorArabName" runat="server" CssClass="FormTextBox" placeholder="أسم الزائر بالعربى"></asp:TextBox>
                                 
                       </div> 
                        <div>
                         <asp:Label ID="Label17" runat="server"    Text="أسم الزائر بالانجليزي" ></asp:Label>
                          <asp:TextBox ID="txtVisitorEngName" runat="server" CssClass="FormTextBox" placeholder="أسم الزائر بالانجليزي"></asp:TextBox>
                                 
                       </div> 
                         <div>
                               <asp:Label ID="Label15" runat="server"  Text="رقم جواز الزائر" ></asp:Label>
                                 <asp:TextBox ID="txtVisitorPassportNo" runat="server" CssClass="FormTextBox" placeholder="رقم جواز الزائر"></asp:TextBox>
                        </div>
                        <div>
                                 <asp:Label ID="Label16" runat="server"   Text="جنسية الزائر" ></asp:Label>
                                  <asp:DropDownList ID="DropDownListVistorNat" runat="server" CssClass="FormTextBox"   DataSourceID="ObjectDataSourceNats" DataTextField="NATIONALITY_DESC" DataValueField="NATIONALITY_CODE">
                                  </asp:DropDownList>
                            </div>
                        
                            </div>
                          <div class="col-sm-3 pull-right ">
                              <div>
                       <asp:Button ID="BtnPrintVisitor" CssClass=" btn btn-primary sendMail" runat="server" Text="تعهد زيارة عائليه" UseSubmitBehavior="False"  OnClick="BtnPrintVisitor_Click"  />
                     </div>
           
                         <div>
                       <asp:Button ID="Button2" CssClass=" btn btn-primary sendMail" runat="server" Text="المرور"  />
                     </div>
                    </div>
                   
                              
                           
                    <div class="col-sm-3 pull-left">
                         <div>
                       <asp:Button ID="Button3" CssClass="btn btn-primary sendMail" runat="server" Text="الشئون"  />
                     </div>
           
                         <div>
                       <asp:Button ID="Button4" CssClass=" btn btn-primary sendMail" runat="server" Text="المرور"  />
                     </div>
                      <%--  <div>
                             <asp:Label ID="Label75" runat="server"      Text="رقم حساب البنك" ></asp:Label>
                              <asp:TextBox ID="txtBankAcc1" runat="server" CssClass="FormTextBox"   placeholder="رقم حساب البنك" ></asp:TextBox>
                        </div>--%>
                            
                                              
                      
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


       
          
        
      
    
          
        
   
                

  

    <asp:TextBox ID="txtUdpdateUserId" runat="server" meta:resourcekey="txtPervMonthIdResource1"
        Text="1" Visible="False"></asp:TextBox>
    <asp:ObjectDataSource ID="ObjectDataSourceEmps" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="PersonalDataSetTableAdapters.CustomersTableAdapter" InsertMethod="Insert" UpdateMethod="Update" OnInserted="ObjectDataSourceEmps_Inserted" DeleteMethod="Delete">
        <DeleteParameters>
            <asp:Parameter Name="Original_EMP_CODE" Type="Int64" />
        </DeleteParameters>
        <InsertParameters>
             <asp:Parameter Name="EmpNum" Type="String" />
            <asp:ControlParameter ControlID="txtCivilId" Name="CIVILID" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtEmpName1" Name="FName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtEmpName2" Name="SName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtEmpName3" Name="TName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtEmpName4" Name="FoName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtNameEng1" Name="FEngName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtNameEng2" Name="SEngName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtNameEng3" Name="TEngName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtNameEng4" Name="FoEngName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="CmbJob" Name="TITLE" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="CmbEmpGender" Name="EMP_GENDER" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="txtContractNo" Name="ContractNo" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtEmpBirthDate" Name="EMP_BIRTH_DATE" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="txtBirthPlace" Name="EMP_BIRTH_PLACE" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="CmbEmpDept" Name="DEPTCODE" PropertyName="SelectedValue" Type="Int64" />
            <asp:ControlParameter ControlID="txtHireDate" Name="EMP_HIREDATE" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="txtEnterDate" Name="entrydate" PropertyName="Text" Type="DateTime" />
            <asp:Parameter Name="JOB_CODE" Type="Decimal" />
             <asp:ControlParameter ControlID="CmbJob" Name="JOB_CLS_CODE" PropertyName="SelectedValue" Type="Decimal" />
            <asp:ControlParameter ControlID="CmbEmpMatStatus" Name="MARITAL_STATUS_CODE" PropertyName="SelectedValue" Type="Decimal" />
            <asp:ControlParameter ControlID="CmbEmpNat" Name="NATIONALITY_CODE" PropertyName="SelectedValue" Type="Decimal" />
            <asp:Parameter Name="GOVER_CODE" Type="Decimal" />
            <asp:Parameter Name="NOTES" Type="String" />
            <asp:ControlParameter ControlID="txtPassportNo" Name="PassportNo" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtPassType" Name="PassType" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtPassDate" Name="PassDate" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="txtPassEndDate" Name="PassEndDate" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="txtPassplace" Name="Passplace" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtBSalary" Name="SALARY" PropertyName="Text" Type="Decimal" />
             <asp:Parameter Name="Status" Type="Int32" />
             <asp:Parameter Name="BRANCH_CODE" Type="Int64" />
            <asp:Parameter Name="GroupId" Type="Int64" />
            <asp:ControlParameter ControlID="cmbRelgion" Name="ReligionId" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="cmbEducation" Name="EducationId" PropertyName="SelectedValue" Type="Int32" />
            <asp:Parameter Name="EducationMajored" Type="String" />
            <asp:Parameter Name="EducationMajoredDate" Type="DateTime" />
            <asp:ControlParameter ControlID="txtEducationDate" Name="EducationMajoredYear" PropertyName="Text" Type="Int32" />
            <asp:Parameter Name="EducationMajoredPlace" Type="String" />
            <asp:ControlParameter ControlID="txtEmpVisaNo" Name="ResidenceNo" PropertyName="Text" Type="String" />
            <asp:Parameter Name="ResidenceIssueDate" Type="DateTime" />
            <asp:ControlParameter ControlID="txtVisaEndDate" Name="ResidenceEndDate" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="txtLicenceNo" Name="LicenseNo" PropertyName="Text" Type="String" />
            <asp:Parameter Name="LicenseTypeId" Type="Int32" />
            <asp:Parameter Name="LicenseIssueDate" Type="DateTime" />
            <asp:ControlParameter ControlID="txtLicenseEndDate" Name="LicenseEndDate" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="txtEmpHealthInsDate" Name="EMP_HEALTH_INS_DATE" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="txtEmpHealthInsNo" Name="EMP_HEALTH_INS_NUM" PropertyName="Text" Type="String" />
            <asp:Parameter Name="JoiningDate" Type="DateTime" />
            <asp:Parameter Name="SalaryType" Type="Int32" />
            <asp:ControlParameter ControlID="txtVisatype" Name="ContractType" PropertyName="Text" Type="Int32" />
            <asp:Parameter Name="ADDRESS" Type="String" />
            <asp:Parameter Name="WorkTel" Type="String" />
            <asp:Parameter Name="HomeTel" Type="String" />
            <asp:Parameter Name="Mobile1" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="ContactLocation" Type="String" />
            <asp:Parameter Name="ContactLocationDate" Type="DateTime" />
            <asp:ControlParameter ControlID="txtEmpFulName" Name="FullName" PropertyName="Text" Type="String" />
             <asp:ControlParameter ControlID="txtEmpFulEngName" Name="EngFullName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtEmpCommanNo" Name="VisaNo" PropertyName="Text" Type="String" />
            <asp:Parameter Name="ComingDate" Type="DateTime" />
            <asp:ControlParameter ControlID="txtEmpName5" Name="FiName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtNameEng5" Name="FiEngName" PropertyName="Text" Type="String" />
            <asp:Parameter Name="FFEngName" Type="String" />
            <asp:ControlParameter ControlID="txtBirthPlace" Name="BirthPlace" PropertyName="Text" Type="String" />
            <asp:Parameter Name="BloodType" Type="String" />
            <asp:Parameter Name="HealthcardEndDate" Type="DateTime" />
            <asp:ControlParameter ControlID="txtPlaceNat" Name="PassNat" PropertyName="Text" Type="String" />
             <asp:ControlParameter ControlID="CmbEngJob" Name="TITLEEng" PropertyName="Text" Type="String" />
             <asp:ControlParameter ControlID="txtOrgId" Name="OrgId" PropertyName="Text" Type="Int64" />
             <asp:Parameter Name="LocationId" Type="Int32" />
             <asp:ControlParameter ControlID="txtVisitorArabName" Name="VisitorArabName" PropertyName="Text" Type="String" />
             <asp:ControlParameter ControlID="txtVisitorEngName" Name="VisitorEngName" PropertyName="Text" Type="String" />
             <asp:ControlParameter ControlID="txtVisitorPassportNo" Name="VisitorPassportNo" PropertyName="Text" Type="String" />
             <asp:ControlParameter ControlID="DropDownListVistorNat" Name="VisitorNatCode" PropertyName="SelectedValue" Type="Decimal" />
             <asp:Parameter Direction="InputOutput" Name="EMP_CODE" Type="Object" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="EmpNum" Type="String" />
            <asp:ControlParameter ControlID="txtCivilId" Name="CIVILID" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtEmpName1" Name="FName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtEmpName2" Name="SName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtEmpName3" Name="TName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtEmpName4" Name="FoName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtNameEng1" Name="FEngName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtNameEng2" Name="SEngName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtNameEng3" Name="TEngName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtNameEng4" Name="FoEngName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="CmbJob" Name="TITLE" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="CmbEmpGender" Name="EMP_GENDER" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="txtContractNo" Name="ContractNo" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtEmpBirthDate" Name="EMP_BIRTH_DATE" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="txtBirthPlace" Name="EMP_BIRTH_PLACE" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="CmbEmpDept" Name="DEPTCODE" PropertyName="SelectedValue" Type="Int64" />
            <asp:ControlParameter ControlID="txtHireDate" Name="EMP_HIREDATE" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="txtEnterDate" Name="entrydate" PropertyName="Text" Type="DateTime" />
            <asp:Parameter Name="JOB_CODE" Type="Decimal" />
            <asp:ControlParameter ControlID="CmbJob" Name="JOB_CLS_CODE" PropertyName="SelectedValue" Type="Decimal" />
            <asp:ControlParameter ControlID="CmbEmpMatStatus" Name="MARITAL_STATUS_CODE" PropertyName="SelectedValue" Type="Decimal" />
            <asp:ControlParameter ControlID="CmbEmpNat" Name="NATIONALITY_CODE" PropertyName="SelectedValue" Type="Decimal" />
            <asp:Parameter Name="GOVER_CODE" Type="Decimal" />
            <asp:Parameter Name="NOTES" Type="String" />
            <asp:ControlParameter ControlID="txtPassportNo" Name="PassportNo" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtPassType" Name="PassType" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtPassDate" Name="PassDate" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="txtPassEndDate" Name="PassEndDate" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="txtPassplace" Name="Passplace" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtBSalary" Name="SALARY" PropertyName="Text" Type="Decimal" />
            <asp:Parameter Name="Status" Type="Int32" />
            <asp:Parameter Name="BRANCH_CODE" Type="Int64" />
            <asp:Parameter Name="GroupId" Type="Int64" />
            <asp:ControlParameter ControlID="cmbRelgion" Name="ReligionId" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="cmbEducation" Name="EducationId" PropertyName="SelectedValue" Type="Int32" />
            <asp:Parameter Name="EducationMajored" Type="String" />
            <asp:ControlParameter ControlID="txtEducationDate" Name="EducationMajoredDate" PropertyName="Text" Type="DateTime" />
            <asp:Parameter Name="EducationMajoredYear" Type="Int32" />
            <asp:Parameter Name="EducationMajoredPlace" Type="String" />
            <asp:ControlParameter ControlID="txtEmpVisaNo" Name="ResidenceNo" PropertyName="Text" Type="String" />
            <asp:Parameter Name="ResidenceIssueDate" Type="DateTime" />
            <asp:ControlParameter ControlID="txtVisaEndDate" Name="ResidenceEndDate" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="txtLicenceNo" Name="LicenseNo" PropertyName="Text" Type="String" />
            <asp:Parameter Name="LicenseTypeId" Type="Int32" />
            <asp:Parameter Name="LicenseIssueDate" Type="DateTime" />
            <asp:ControlParameter ControlID="txtLicenseEndDate" Name="LicenseEndDate" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="txtEmpHealthInsDate" Name="EMP_HEALTH_INS_DATE" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="txtEmpHealthInsNo" Name="EMP_HEALTH_INS_NUM" PropertyName="Text" Type="String" />
            <asp:Parameter Name="JoiningDate" Type="DateTime" />
            <asp:Parameter Name="SalaryType" Type="Int32" />
            <asp:ControlParameter ControlID="txtVisatype" Name="ContractType" PropertyName="Text" Type="Int32" />
            <asp:Parameter Name="ADDRESS" Type="String" />
            <asp:Parameter Name="WorkTel" Type="String" />
            <asp:Parameter Name="HomeTel" Type="String" />
            <asp:Parameter Name="Mobile1" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="ContactLocation" Type="String" />
            <asp:Parameter Name="ContactLocationDate" Type="DateTime" />
            <asp:ControlParameter ControlID="txtEmpFulName" Name="FullName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtEmpFulEngName" Name="EngFullName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtEmpCommanNo" Name="VisaNo" PropertyName="Text" Type="String" />
            <asp:Parameter Name="ComingDate" Type="DateTime" />
            <asp:ControlParameter ControlID="txtEmpName5" Name="FiName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtNameEng5" Name="FiEngName" PropertyName="Text" Type="String" />
            <asp:Parameter Name="FFEngName" Type="String" />
            <asp:ControlParameter ControlID="txtBirthPlace" Name="BirthPlace" PropertyName="Text" Type="String" />
            <asp:Parameter Name="BloodType" Type="String" />
            <asp:Parameter Name="HealthcardEndDate" Type="DateTime" />
            <asp:ControlParameter ControlID="txtPlaceNat" Name="PassNat" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="CmbEngJob" Name="TITLEEng" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtOrgId" Name="OrgId" PropertyName="Text" Type="Int64" />
            <asp:Parameter Name="LocationId" Type="Int32" />
            <asp:Parameter Name="VisitorArabName" Type="String" />
            <asp:Parameter Name="VisitorEngName" Type="String" />
            <asp:Parameter Name="VisitorPassportNo" Type="String" />
            <asp:Parameter Name="VisitorNatCode" Type="Decimal" />
            <asp:ControlParameter ControlID="txtid" Name="Original_EMP_CODE" PropertyName="Text" Type="Int64" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSourceJobs" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="PersonalDataSetTableAdapters.CDE_PER_JOB_CLASSTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_JOB_CLS_CODE" Type="Decimal" />
            <asp:Parameter Name="Original_JOB_CLS_DESC" Type="String" />
            <asp:Parameter Name="Original_JOB_CLS_DESC_Eng" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="JOB_CLS_DESC" Type="String" />
            <asp:Parameter Name="JOB_CLS_DESC_Eng" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="JOB_CLS_DESC" Type="String" />
            <asp:Parameter Name="JOB_CLS_DESC_Eng" Type="String" />
            <asp:Parameter Name="Original_JOB_CLS_CODE" Type="Decimal" />
            <asp:Parameter Name="Original_JOB_CLS_DESC" Type="String" />
            <asp:Parameter Name="Original_JOB_CLS_DESC_Eng" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSourceSex" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="PersonalDataSetTableAdapters.SexTabTableAdapter">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSourceNats" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="PersonalDataSetTableAdapters.CDE_NATIONALITYTableAdapter">
    </asp:ObjectDataSource>
    <asp:TextBox ID="txtBranchId" runat="server" meta:resourcekey="txtidResource1" Visible="False"></asp:TextBox>
     
  
    <asp:TextBox ID="txtid" runat="server" Visible="False" meta:resourcekey="txtidResource1"  ></asp:TextBox>

    <asp:TextBox ID="txtUserId" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1"></asp:TextBox>
    
    <asp:TextBox ID="txtAdaraId" runat="server" meta:resourcekey="txtPervMonthIdResource1"
        Text="1" Visible="False"></asp:TextBox>

    <asp:TextBox ID="txtOrgId" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1"></asp:TextBox>
    
    <asp:TextBox ID="txtEmpName1" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1"></asp:TextBox>
    
    <asp:TextBox ID="txtEmpName2" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1"></asp:TextBox>
    
    <asp:TextBox ID="txtEmpName3" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1"></asp:TextBox>
    
    <asp:TextBox ID="txtEmpName4" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1"></asp:TextBox>
    
    <asp:TextBox ID="txtEmpName5" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1"></asp:TextBox>
    
    <asp:TextBox ID="txtNameEng1" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1"></asp:TextBox>
    
    <asp:TextBox ID="txtNameEng2" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1"></asp:TextBox>
    
    <asp:TextBox ID="txtNameEng3" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1"></asp:TextBox>
    
    <asp:TextBox ID="txtNameEng4" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1"></asp:TextBox>
    
    <asp:TextBox ID="txtNameEng5" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1"></asp:TextBox>
    
    <asp:TextBox ID="txtEditFlag" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1">0</asp:TextBox>
    
    <asp:ObjectDataSource ID="ObjectDataSourceMalStatus" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="PersonalDataSetTableAdapters.MalStatusTypesTableAdapter">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSourceRelgion" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="PersonalDataSetTableAdapters.ReligionTypesTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_ReligionId" Type="Int32" />
            <asp:Parameter Name="Original_ReligionDesc" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ReligionId" Type="Int32" />
            <asp:Parameter Name="ReligionDesc" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ReligionDesc" Type="String" />
            <asp:Parameter Name="Original_ReligionId" Type="Int32" />
            <asp:Parameter Name="Original_ReligionDesc" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSourceEduction" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="PersonalDataSetTableAdapters.CDE_PER_QLFTableAdapter">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSourceAppReasons" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="PersonalDataSetTableAdapters.AppReasonsTableAdapter">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSourceEmpGov" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="PersonalDataSetTableAdapters.CDE_GOVERNORATETableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_GOVER_CODE" Type="Int32" />
            <asp:Parameter Name="Original_GOVER_DESC" Type="String" />
            <asp:Parameter Name="Original_GoverEng" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="GOVER_CODE" Type="Int32" />
            <asp:Parameter Name="GOVER_DESC" Type="String" />
            <asp:Parameter Name="GoverEng" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="GOVER_DESC" Type="String" />
            <asp:Parameter Name="GoverEng" Type="String" />
            <asp:Parameter Name="Original_GOVER_CODE" Type="Int32" />
            <asp:Parameter Name="Original_GOVER_DESC" Type="String" />
            <asp:Parameter Name="Original_GoverEng" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSourceLicenseType" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="PersonalDataSetTableAdapters.LicenseTypesTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_LicenseTypeId" Type="Int32" />
            <asp:Parameter Name="Original_LicenseTypeDesc" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="LicenseTypeDesc" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="LicenseTypeDesc" Type="String" />
            <asp:Parameter Name="Original_LicenseTypeId" Type="Int32" />
            <asp:Parameter Name="Original_LicenseTypeDesc" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSourceApplicationTypes" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="PersonalDataSetTableAdapters.ApplicationTypesTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_AppTypeId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="AppTypeId" Type="Int32" />
            <asp:Parameter Name="AppTypeDesc" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="AppTypeDesc" Type="String" />
            <asp:Parameter Name="Original_AppTypeId" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSourceResidenceItems" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="PersonalDataSetTableAdapters.ResidenceItemsTableAdapter">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSourceAppProcedures" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="PersonalDataSetTableAdapters.AppProceduresTableAdapter">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSourceResidenceTypes" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="PersonalDataSetTableAdapters.ResidenceTypesTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_ResTypeID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ResTypeID" Type="Int32" />
            <asp:Parameter Name="ResTypeDesc" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ResTypeDesc" Type="String" />
            <asp:Parameter Name="Original_ResTypeID" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    
    <asp:ObjectDataSource ID="ObjectDataSourceCustomerView" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByEmpCode"
        TypeName="PersonalDataSetTableAdapters.CustomerViewTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtid" Name="EmpCode" PropertyName="Text" Type="Int64" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
   
        <CR:CrystalReportSource ID="CrystalReportSourceEmp" runat="server">
            <Report FileName="~/Reports/VisitorBookRpt.rpt">
                <DataSources>
                    <CR:DataSourceRef DataSourceID="ObjectDataSourceCustomerView" TableName="CustomerView" />
                </DataSources>
            </Report>
        </CR:CrystalReportSource>
 
    </asp:Content>



