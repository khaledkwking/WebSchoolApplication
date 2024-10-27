<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageMain.master" AutoEventWireup="true" Inherits="Admin_EmpList" Async="true"  Codebehind="EmpList.aspx.cs" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="bodyContainer">
        <div class="pageTitle">
            <div class=" container">
                <div class="row">
                    <div class="col-12">         
                          <h1 style="height: 50px;">عرض بيانات الموظفين </h1>
                    </div>
                </div>
            </div>
        </div>


        <div id="modal-ser-1" class="modal fade" role="dialog">
           
           <div class="row">
             
                        <div class="modal-dialog">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h3 class="modal-title">البحث عن  بيانات موظف</h3>
                                </div>
                                <div class="modal-body">
                                   <div class="row">
                                      <div class="col-md-12">
                                      <div class="serv_head">
                                      <div class="item">

                                           <div class="col-sm-6 pull-right">
                                                    <div>
                                                      <asp:Label ID="Label6" runat="server" Text="رقم الموظف" ></asp:Label>
                                                     <asp:TextBox ID="txtEmpNum" runat="server" CssClass="FormTextBox" placeholder="رقم الموظف"></asp:TextBox>
                                                    </div>
                       
                                                    <div>
                                                        <asp:Label ID="Label21" runat="server"   Text="الرقم المدنى"></asp:Label>
                                                        <asp:TextBox ID="txtCivilId" runat="server" CssClass="FormTextBox"  placeholder="الرقم المدنى"></asp:TextBox>       
                                                    </div>
                                                      <div>
                                                             <asp:Label ID="Label7" runat="server" Text="أسم الموظف بالعربي" ></asp:Label>
                                                            <asp:TextBox ID="txtEmpName" runat="server" CssClass="FormTextBox" placeholder="أسم الموظف بالعربي" ></asp:TextBox>
                                                    </div>

                                                    <div>
                                                        <asp:Label ID="Label3" runat="server" Text="أسم الموظف بالانجليزي" ></asp:Label>
                                                         <asp:TextBox ID="txtEngEmpName" runat="server" CssClass="FormTextBox" placeholder="أسم الموظف بالانجليزي"></asp:TextBox>
                                                    </div>
                                                     <div>
                                                        <asp:Label ID="Label16" runat="server"  Text="القسم"></asp:Label>
                                                        <asp:DropDownList ID="cmbDepts" runat="server" CssClass="FormDropDownList" DataSourceID="ObjectDataSourceDeptsNew" DataTextField="LocName" DataValueField="LocId" >
                                                        </asp:DropDownList>
                                                    </div> 
                           
                                                    <div>
                                                        <asp:Label ID="Label10" runat="server"  Text="انتهاء الاقامة من تاريخ"></asp:Label>
                                                        <asp:TextBox ID="txtResFromDate" runat="server" CssClass="FormTextBox" data-toggle="datepicker"  placeholder="انتهاء الاقامة من تاريخ"></asp:TextBox>

                                                    </div>  
                                 
                                                    <div>
                                                         <asp:Label ID="Label11" runat="server"   Text="انتهاء الاقامةالى تاريخ"></asp:Label>
                                                        <asp:TextBox ID="txtResToDate" runat="server" CssClass="FormTextBox"  data-toggle="datepicker" placeholder="انتهاء الاقامةالى تاريخ" ></asp:TextBox>
                                                   </div>
                                      
                                                 <div>
                                                      <asp:Label ID="Label15" runat="server"  Text="حالة الموظف"></asp:Label>
          
                                                    <asp:DropDownList ID="cmbEmpStatus" runat="server" CssClass="FormDropDownList" placeholder="حالة الموظف" DataSourceID="ObjectDataSourceEmpStatus" DataTextField="StatusDesc" DataValueField="Id" >
                                                    </asp:DropDownList>
                                                        </div>
                                                   </div>
                       
                                                

                                                <div class="col-sm-6 pull-left">
                      
                       
                                                      <div>
                                                            <asp:Label ID="Label8" runat="server"  Text="الكفيل" ></asp:Label>
                                                            <asp:DropDownList ID="cmbBranches" runat="server" CssClass="FormDropDownList" DataSourceID="ObjectDataSourceBranches" DataTextField="BRANCHNAME" DataValueField="BRANCHCODE" >
                                                            </asp:DropDownList>
                                                        </div> 

                                                <div>
                                                    <asp:Label ID="Label14" runat="server"  Text="المسمي الوظيفي"></asp:Label>
           
                                                    <asp:DropDownList ID="CmbEmpDept" runat="server" CssClass="FormDropDownList" DataSourceID="ObjectDataSourceDept" DataTextField="DEPT_DESC" DataValueField="DEPT_CODE" >
                                                    </asp:DropDownList>
                                                </div>
                       
                                                     <div>
                                                    <asp:Label ID="Label4" runat="server"  Text="الوظيفة"></asp:Label>
           
                                                    <asp:DropDownList ID="cmbJob" runat="server" CssClass="FormDropDownList" DataSourceID="ObjectDataSourceJobs" DataTextField="JOB_CLS_DESC" DataValueField="JOB_CLS_CODE" >
                                                    </asp:DropDownList>
                                                </div>
                                                     <div>
                                                       <asp:Label ID="Label1" runat="server"  Text="انتهاء الجواز من تاريخ"></asp:Label>
                                                        <asp:TextBox ID="txtPassportFromDate" runat="server" CssClass="FormTextBox"   data-toggle="datepicker" placeholder="انتهاء الجواز"></asp:TextBox>
                                                    </div>
                                                   <div>
                                                         <asp:Label ID="Label2" runat="server"  Text="انتهاء الجواز الى تاريخ"></asp:Label>
                                                        <asp:TextBox ID="txtPassportToDate" runat="server" CssClass="FormTextBox"  data-toggle="datepicker" placeholder="انتهاء الجواز الى تاريخ"></asp:TextBox>
                                                    </div>

                                                  
                        
                                                        <div>
                                                          <asp:Label ID="Label17" runat="server"  Text="من راتب"></asp:Label>   
                                                            <asp:TextBox ID="txtFromSal" runat="server" CssClass="FormTextBox"  placeholder="من راتب" ></asp:TextBox>
                                                    </div>
                      
                                                    <div>
                                                        <asp:Label ID="Label18" runat="server"  Text="الى راتب"></asp:Label>
                                                        <asp:TextBox ID="txtToSal" runat="server" CssClass="FormTextBox" placeholder="الى راتب"></asp:TextBox>
                                                    </div>
                      
                   
                                                </div>

                                       </div>
                                       </div>
                                    </div>
                                    </div>
                                <div class="modal-footer">
                                    <div>
                                       <%-- <button type="button"  class="btn btn-primary custom-button red-btn"  data-dismiss="modal">بحث</button>--%>
                                    <asp:Button ID="SearchCmd" runat="server" Text="بحث"  CssClass="btn btn-primary custom-button red-btn" OnClick="SearchCmd_Click" />
                                    </div>
                                </div>
                            </div>
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
                    <li class="active pull-right"> 
                        <asp:Button ID="CmdAdd" runat="server" Text="" CssClass="mainBarButtons addBtn"  CausesValidation="False" data-toggle="tooltip" data-placement="bottom" title="اضافة موظف جديد" UseSubmitBehavior="False" OnClick="CmdAdd_Click" />

                    </li>
                    <li id="Li1" runat="server" class="active pull-right">  
                        <%--<asp:Button ID="SearchCmd" runat="server" Text="" CssClass="mainBarButtons searchBtn"  data-toggle="modal" data-target="#modal-ser-1" data-placement="bottom" title="بحث عن البيان" UseSubmitBehavior="False"  />--%>
                       <button type="button" class="mainBarButtons searchBtn" data-toggle="modal" data-target="#modal-ser-1"  title="البحث"> </button>
                    </li>
                          <li class="active pull-right"> 
                        <asp:Button ID="btnPrint" runat="server" Text="" CssClass="mainBarButtons printBtn"  CausesValidation="False" data-toggle="tooltip" data-placement="bottom" title="طباعة" UseSubmitBehavior="False" OnClick="btnPrint_Click" />
<a href="https://docs.google.com/gview?embedded=true&url=https://moci.gov.kw//Files/FilesUploaded/d0458e09-8241-45cb-a678-b07a4dac4ce2.pdf" class="hvr-underline-from-center" target="_blank" hidden="hidden">  تحميل  </a>
                    </li>
                  
                </ul>
                      
                </div>
            </nav>
                 
      	


                      <%-- Student basic informatin section --%>
<%--           <nav class="navbar buttonsNavBar">
            <div class="tab-content clearfix">
         
            <div class="tab-pane active" id="basicStudentInfo">             
             
                 <div class="row">
                 <div class="col-12">
                 <ul class="list-unstyled components">
                 <li class="active">
                 <a href="#homeSubmenu" id="A1" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle collapsed">
                                مفاتيح البحث
                 </a>
                                    
                   <ul id="homeSubmenu" style="" class="collapse">
                                         
                
                       </ul>
                                        </li>
                                        </ul>
                  </div>
                  </div>
                  </div>
                  </div>
            </nav>  --%>      
     </div>
                    
           
            
          
        
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataSourceID="ObjectDataSourceEmpView" Width="100%"  ForeColor="#333333" GridLines="None"  AllowPaging="True" AllowSorting="True" DataKeyNames="EMP_CODE" PageSize="25"  Font-Size="Medium" OnRowCommand="GridView1_RowCommand">
        <FooterStyle BackColor="#507CD1" ForeColor="White"  />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1"  ForeColor="#333333" />
        <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#2461BF" />
        <HeaderStyle BackColor="#507CD1"  ForeColor="White" />
        <Columns>
            <asp:BoundField DataField="EMP_CODE" HeaderText="الرقم الالى" InsertVisible="False" ReadOnly="True" SortExpression="EMP_CODE" />
            <asp:BoundField DataField="EmpNum" HeaderText="رقم" SortExpression="EmpNum" Visible="False" />
            <asp:BoundField DataField="DEPTCODE" HeaderText="DEPTCODE" SortExpression="DEPTCODE" Visible="False" />
            <asp:BoundField DataField="EMP_EMAIL" HeaderText="EMP_EMAIL" SortExpression="EMP_EMAIL" Visible="False" />
            <asp:BoundField DataField="BRANCH_CODE" HeaderText="BRANCH_CODE" SortExpression="BRANCH_CODE" Visible="False" />
            <asp:BoundField DataField="GroupId" HeaderText="GroupId" SortExpression="GroupId" Visible="False" />
            <asp:BoundField DataField="ReligionId" HeaderText="ReligionId" SortExpression="ReligionId" Visible="False" />
            <asp:BoundField DataField="CIVILID" HeaderText="الرقم المدني" SortExpression="CIVILID" />
            <asp:BoundField DataField="FName" HeaderText="FName" SortExpression="FName" Visible="False" />
            <asp:BoundField DataField="SName" HeaderText="SName" SortExpression="SName" Visible="False" />
            <asp:BoundField DataField="TName" HeaderText="TName" SortExpression="TName" Visible="False" />
            <asp:BoundField DataField="FoName" HeaderText="FoName" SortExpression="FoName" Visible="False" />
            <asp:BoundField DataField="FEngName" HeaderText="FEngName" SortExpression="FEngName" Visible="False" />
            <asp:BoundField DataField="SEngName" HeaderText="SEngName" SortExpression="SEngName" Visible="False" />
            <asp:BoundField DataField="TEngName" HeaderText="TEngName" SortExpression="TEngName" Visible="False" />
            <asp:BoundField DataField="FoEngName" HeaderText="FoEngName" SortExpression="FoEngName" Visible="False" />
            <asp:BoundField DataField="TITLE" HeaderText="الوظيفة" SortExpression="TITLE" Visible="False" />
            <asp:BoundField DataField="EMP_GENDER" HeaderText="EMP_GENDER" SortExpression="EMP_GENDER" Visible="False" />
            <asp:BoundField DataField="EMP_BIRTH_DATE" DataFormatString="{0:d}" HeaderText="تاريخ الميلاد" SortExpression="EMP_BIRTH_DATE" Visible="False" />
            <asp:BoundField DataField="EMP_BIRTH_PLACE" HeaderText="EMP_BIRTH_PLACE" SortExpression="EMP_BIRTH_PLACE" Visible="False" />
            <asp:BoundField DataField="EMP_HIREDATE" DataFormatString="{0:d}" HeaderText="تاريخ التعين" SortExpression="EMP_HIREDATE" Visible="False" />
            <asp:BoundField DataField="Emp_End_HIREDATE" HeaderText="Emp_End_HIREDATE" SortExpression="Emp_End_HIREDATE" Visible="False" />
            <asp:BoundField DataField="JOB_CODE" HeaderText="JOB_CODE" SortExpression="JOB_CODE" Visible="False" />
            <asp:BoundField DataField="FullName" HeaderText="الاسم" SortExpression="FullName" />
            <asp:BoundField DataField="EngFullName" HeaderText="اسم انجليزى" SortExpression="EnFullName" />
            <asp:ButtonField CommandName="SEdit" Text="تعديل" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
        <PagerSettings PageButtonCount="20" />
    </asp:GridView>
       
   
                         </div>
                     </div>
                 </div>
          </div>
    
    
    <asp:TextBox ID="txtInTypeId" runat="server" Visible="False"  ></asp:TextBox>
    
    <asp:ObjectDataSource ID="ObjectDataSourceEmpView" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByParam"
        TypeName="PersonalDataSetTableAdapters.EmpViewTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtOrgId" Name="OrgId" PropertyName="Text" Type="Int64" />
            <asp:ControlParameter ControlID="txtEmpName" Name="FullName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtEngEmpName" Name="EngFullName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtEmpName" Name="EmpNum" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="cmbJob" Name="Job_cls_code" PropertyName="SelectedValue" Type="Decimal" />
            <asp:ControlParameter ControlID="txtCivilId" Name="CivilId" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtPassportFromDate" Name="PassFromDate" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="txtPassportToDate" Name="PassToDate" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="txtResFromDate" Name="ResidenceFromDate" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="txtResToDate" Name="ResidenceToDate" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="cmbBranches" Name="BranchId" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="CmbEmpDept" Name="DEPTCODE" PropertyName="SelectedValue" Type="Int64" />
            <asp:ControlParameter ControlID="txtFromSal" Name="SALARYFrom" PropertyName="Text" Type="Decimal" />
            <asp:ControlParameter ControlID="txtToSal" Name="SALARYTo" PropertyName="Text" Type="Decimal" />
            <asp:ControlParameter ControlID="cmbEmpStatus" Name="Status" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
   <asp:ObjectDataSource ID="ObjectDataSourceDeptsNew" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="PersonalDataSetTableAdapters.CDE_LOCATIONTableAdapter">
    </asp:ObjectDataSource>
    <asp:TextBox ID="txtid" runat="server" Visible="False"  ></asp:TextBox>
    
     <asp:ObjectDataSource ID="ObjectDataSourceEmpStatus" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="PersonalDataSetTableAdapters.EmpStatusTableAdapter">
    </asp:ObjectDataSource>
      <asp:ObjectDataSource ID="ObjectDataSourceDept" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="PersonalDataSetTableAdapters.CDE_DEPTTableAdapter">
    </asp:ObjectDataSource>
    <asp:TextBox ID="txtOrgId" runat="server" Visible="False"  ></asp:TextBox>
    
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
    
    <asp:ObjectDataSource ID="ObjectDataSourceBranches" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="NEWERPDataSetTableAdapters.BRANCHESTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_BRANCHCODE" Type="Int64" />
            <asp:Parameter Name="Original_BRANCHNAME" Type="String" />
            <asp:Parameter Name="Original_CompanyName" Type="String" />
            <asp:Parameter Name="Original_Address" Type="String" />
            <asp:Parameter Name="Original_TelPhone" Type="String" />
            <asp:Parameter Name="Original_HintName" Type="String" />
            <asp:Parameter Name="Original_SalInvSerial" Type="Int64" />
            <asp:Parameter Name="Original_PurchInvSerial" Type="Int64" />
            <asp:Parameter Name="Original_InvOrderSerial" Type="Int64" />
            <asp:Parameter Name="Original_OrderSerial" Type="Int64" />
            <asp:Parameter Name="Original_MovementSerial" Type="Int64" />
            <asp:Parameter Name="Original_salesaccid" Type="Int16" />
            <asp:Parameter Name="Original_purchaseaccid" Type="Int16" />
            <asp:Parameter Name="Original_boxaccid" Type="Int64" />
            <asp:Parameter Name="Original_bankaccid" Type="Int64" />
            <asp:Parameter Name="Original_Visaaccid" Type="Int64" />
            <asp:Parameter Name="Original_Masteraccid" Type="Int64" />
            <asp:Parameter Name="Original_KeyNetaccid" Type="Int64" />
            <asp:Parameter Name="Original_Otheraccid" Type="Int64" />
            <asp:Parameter Name="Original_VisaComaccid" Type="Int64" />
            <asp:Parameter Name="Original_MasterComaccid" Type="Int64" />
            <asp:Parameter Name="Original_KeyNetComaccid" Type="Int64" />
            <asp:Parameter Name="Original_OtherComaccid" Type="Int64" />
            <asp:Parameter Name="Original_salesAgalaccid" Type="Int64" />
            <asp:Parameter Name="Original_purchaseAgalaaccid" Type="Int64" />
            <asp:Parameter Name="Original_OwnerName" Type="String" />
            <asp:Parameter Name="Original_OwnerNat" Type="String" />
            <asp:Parameter Name="Original_BlockNo" Type="String" />
            <asp:Parameter Name="Original_Area" Type="String" />
            <asp:Parameter Name="Original_GovId" Type="Int32" />
            <asp:Parameter Name="Original_Gada" Type="String" />
            <asp:Parameter Name="Original_HouseType" Type="String" />
            <asp:Parameter Name="Original_Floor" Type="String" />
            <asp:Parameter Name="Original_FlatNo" Type="String" />
            <asp:Parameter Name="Original_Street" Type="String" />
            <asp:Parameter Name="Original_MailSign" Type="String" />
            <asp:Parameter Name="Original_MailBox" Type="String" />
            <asp:Parameter Name="Original_SignatureOwner" Type="String" />
            <asp:Parameter Name="Original_FileNo" Type="String" />
            <asp:Parameter Name="Original_CommerName" Type="String" />
            <asp:Parameter Name="Original_CommerRecord" Type="String" />
            <asp:Parameter Name="Original_Doc1" Type="String" />
            <asp:Parameter Name="Original_Doc2" Type="String" />
            <asp:Parameter Name="Original_Doc3" Type="String" />
            <asp:Parameter Name="Original_Doc4" Type="String" />
            <asp:Parameter Name="Original_Doc5" Type="String" />
            <asp:Parameter Name="Original_Doc6" Type="String" />
            <asp:Parameter Name="Original_Doc7" Type="String" />
            <asp:Parameter Name="Original_Doc8" Type="String" />
            <asp:Parameter Name="Original_Doc9" Type="String" />
            <asp:Parameter Name="Original_Doc110" Type="String" />
            <asp:Parameter Name="Original_CivilId" Type="String" />
            <asp:Parameter Name="Original_uinNum" Type="String" />
            <asp:Parameter Name="Original_ActivityEng" Type="String" />
            <asp:Parameter Name="Original_CompanyNameEng" Type="String" />
            <asp:Parameter Name="Original_SignatureOwnerEng" Type="String" />
            <asp:Parameter Name="Original_ContractNo" Type="String" />
            <asp:Parameter Name="Original_LawNo" Type="String" />
            <asp:Parameter Name="Original_Email" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="BRANCHNAME" Type="String" />
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="TelPhone" Type="String" />
            <asp:Parameter Name="HintName" Type="String" />
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
            <asp:Parameter Name="OtherComaccid" Type="Int64" />
            <asp:Parameter Name="salesAgalaccid" Type="Int64" />
            <asp:Parameter Name="purchaseAgalaaccid" Type="Int64" />
            <asp:Parameter Name="OwnerName" Type="String" />
            <asp:Parameter Name="OwnerNat" Type="String" />
            <asp:Parameter Name="BlockNo" Type="String" />
            <asp:Parameter Name="Area" Type="String" />
            <asp:Parameter Name="GovId" Type="Int32" />
            <asp:Parameter Name="Gada" Type="String" />
            <asp:Parameter Name="HouseType" Type="String" />
            <asp:Parameter Name="Floor" Type="String" />
            <asp:Parameter Name="FlatNo" Type="String" />
            <asp:Parameter Name="Street" Type="String" />
            <asp:Parameter Name="MailSign" Type="String" />
            <asp:Parameter Name="MailBox" Type="String" />
            <asp:Parameter Name="SignatureOwner" Type="String" />
            <asp:Parameter Name="FileNo" Type="String" />
            <asp:Parameter Name="CommerName" Type="String" />
            <asp:Parameter Name="CommerRecord" Type="String" />
            <asp:Parameter Name="Doc1" Type="String" />
            <asp:Parameter Name="Doc2" Type="String" />
            <asp:Parameter Name="Doc3" Type="String" />
            <asp:Parameter Name="Doc4" Type="String" />
            <asp:Parameter Name="Doc5" Type="String" />
            <asp:Parameter Name="Doc6" Type="String" />
            <asp:Parameter Name="Doc7" Type="String" />
            <asp:Parameter Name="Doc8" Type="String" />
            <asp:Parameter Name="Doc9" Type="String" />
            <asp:Parameter Name="Doc110" Type="String" />
            <asp:Parameter Name="CivilId" Type="String" />
            <asp:Parameter Name="uinNum" Type="String" />
            <asp:Parameter Name="ActivityEng" Type="String" />
            <asp:Parameter Name="CompanyNameEng" Type="String" />
            <asp:Parameter Name="SignatureOwnerEng" Type="String" />
            <asp:Parameter Name="ContractNo" Type="String" />
            <asp:Parameter Name="LawNo" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="BRANCHNAME" Type="String" />
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="TelPhone" Type="String" />
            <asp:Parameter Name="HintName" Type="String" />
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
            <asp:Parameter Name="OtherComaccid" Type="Int64" />
            <asp:Parameter Name="salesAgalaccid" Type="Int64" />
            <asp:Parameter Name="purchaseAgalaaccid" Type="Int64" />
            <asp:Parameter Name="OwnerName" Type="String" />
            <asp:Parameter Name="OwnerNat" Type="String" />
            <asp:Parameter Name="BlockNo" Type="String" />
            <asp:Parameter Name="Area" Type="String" />
            <asp:Parameter Name="GovId" Type="Int32" />
            <asp:Parameter Name="Gada" Type="String" />
            <asp:Parameter Name="HouseType" Type="String" />
            <asp:Parameter Name="Floor" Type="String" />
            <asp:Parameter Name="FlatNo" Type="String" />
            <asp:Parameter Name="Street" Type="String" />
            <asp:Parameter Name="MailSign" Type="String" />
            <asp:Parameter Name="MailBox" Type="String" />
            <asp:Parameter Name="SignatureOwner" Type="String" />
            <asp:Parameter Name="FileNo" Type="String" />
            <asp:Parameter Name="CommerName" Type="String" />
            <asp:Parameter Name="CommerRecord" Type="String" />
            <asp:Parameter Name="Doc1" Type="String" />
            <asp:Parameter Name="Doc2" Type="String" />
            <asp:Parameter Name="Doc3" Type="String" />
            <asp:Parameter Name="Doc4" Type="String" />
            <asp:Parameter Name="Doc5" Type="String" />
            <asp:Parameter Name="Doc6" Type="String" />
            <asp:Parameter Name="Doc7" Type="String" />
            <asp:Parameter Name="Doc8" Type="String" />
            <asp:Parameter Name="Doc9" Type="String" />
            <asp:Parameter Name="Doc110" Type="String" />
            <asp:Parameter Name="CivilId" Type="String" />
            <asp:Parameter Name="uinNum" Type="String" />
            <asp:Parameter Name="ActivityEng" Type="String" />
            <asp:Parameter Name="CompanyNameEng" Type="String" />
            <asp:Parameter Name="SignatureOwnerEng" Type="String" />
            <asp:Parameter Name="ContractNo" Type="String" />
            <asp:Parameter Name="LawNo" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Original_BRANCHCODE" Type="Int64" />
            <asp:Parameter Name="Original_BRANCHNAME" Type="String" />
            <asp:Parameter Name="Original_CompanyName" Type="String" />
            <asp:Parameter Name="Original_Address" Type="String" />
            <asp:Parameter Name="Original_TelPhone" Type="String" />
            <asp:Parameter Name="Original_HintName" Type="String" />
            <asp:Parameter Name="Original_SalInvSerial" Type="Int64" />
            <asp:Parameter Name="Original_PurchInvSerial" Type="Int64" />
            <asp:Parameter Name="Original_InvOrderSerial" Type="Int64" />
            <asp:Parameter Name="Original_OrderSerial" Type="Int64" />
            <asp:Parameter Name="Original_MovementSerial" Type="Int64" />
            <asp:Parameter Name="Original_salesaccid" Type="Int16" />
            <asp:Parameter Name="Original_purchaseaccid" Type="Int16" />
            <asp:Parameter Name="Original_boxaccid" Type="Int64" />
            <asp:Parameter Name="Original_bankaccid" Type="Int64" />
            <asp:Parameter Name="Original_Visaaccid" Type="Int64" />
            <asp:Parameter Name="Original_Masteraccid" Type="Int64" />
            <asp:Parameter Name="Original_KeyNetaccid" Type="Int64" />
            <asp:Parameter Name="Original_Otheraccid" Type="Int64" />
            <asp:Parameter Name="Original_VisaComaccid" Type="Int64" />
            <asp:Parameter Name="Original_MasterComaccid" Type="Int64" />
            <asp:Parameter Name="Original_KeyNetComaccid" Type="Int64" />
            <asp:Parameter Name="Original_OtherComaccid" Type="Int64" />
            <asp:Parameter Name="Original_salesAgalaccid" Type="Int64" />
            <asp:Parameter Name="Original_purchaseAgalaaccid" Type="Int64" />
            <asp:Parameter Name="Original_OwnerName" Type="String" />
            <asp:Parameter Name="Original_OwnerNat" Type="String" />
            <asp:Parameter Name="Original_BlockNo" Type="String" />
            <asp:Parameter Name="Original_Area" Type="String" />
            <asp:Parameter Name="Original_GovId" Type="Int32" />
            <asp:Parameter Name="Original_Gada" Type="String" />
            <asp:Parameter Name="Original_HouseType" Type="String" />
            <asp:Parameter Name="Original_Floor" Type="String" />
            <asp:Parameter Name="Original_FlatNo" Type="String" />
            <asp:Parameter Name="Original_Street" Type="String" />
            <asp:Parameter Name="Original_MailSign" Type="String" />
            <asp:Parameter Name="Original_MailBox" Type="String" />
            <asp:Parameter Name="Original_SignatureOwner" Type="String" />
            <asp:Parameter Name="Original_FileNo" Type="String" />
            <asp:Parameter Name="Original_CommerName" Type="String" />
            <asp:Parameter Name="Original_CommerRecord" Type="String" />
            <asp:Parameter Name="Original_Doc1" Type="String" />
            <asp:Parameter Name="Original_Doc2" Type="String" />
            <asp:Parameter Name="Original_Doc3" Type="String" />
            <asp:Parameter Name="Original_Doc4" Type="String" />
            <asp:Parameter Name="Original_Doc5" Type="String" />
            <asp:Parameter Name="Original_Doc6" Type="String" />
            <asp:Parameter Name="Original_Doc7" Type="String" />
            <asp:Parameter Name="Original_Doc8" Type="String" />
            <asp:Parameter Name="Original_Doc9" Type="String" />
            <asp:Parameter Name="Original_Doc110" Type="String" />
            <asp:Parameter Name="Original_CivilId" Type="String" />
            <asp:Parameter Name="Original_uinNum" Type="String" />
            <asp:Parameter Name="Original_ActivityEng" Type="String" />
            <asp:Parameter Name="Original_CompanyNameEng" Type="String" />
            <asp:Parameter Name="Original_SignatureOwnerEng" Type="String" />
            <asp:Parameter Name="Original_ContractNo" Type="String" />
            <asp:Parameter Name="Original_LawNo" Type="String" />
            <asp:Parameter Name="Original_Email" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    
   
        <CR:CrystalReportSource ID="CrystalReportSourceEmp" runat="server">
            <Report FileName="~/Reports/PerEmpDataRpt.rpt">
                <DataSources>
                    <CR:DataSourceRef DataSourceID="ObjectDataSourceEmpView" TableName="EmpView" />
                </DataSources>
            </Report>
        </CR:CrystalReportSource>
 
    </asp:Content>


<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
   
</asp:Content>



