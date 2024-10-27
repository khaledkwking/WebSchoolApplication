<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageMain.master" AutoEventWireup="true" Inherits="Admin_EmpData" EnableViewStateMac="false" EnableEventValidation="false"  ValidateRequest="false" Codebehind="EmpData.aspx.cs" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="bodyContainer">
        <div class="pageTitle">
            <div class="container">
                <div class="row">
                    <div class="col-12">         
                          <h1 style="  width: 100%; height:100%"> أدخال بيانات الموظف </h1>
                    </div>
                </div>
            </div>
        </div>
     
      <div class="container TexRight">
            <div class="row">
                <div class="col-12">

                    <div class="formContactUs">
                        <div class="form-group row">
              <div class="table-responsive">     
                       
        
    <table style="  width: 100%; height: 100%;" >
        <tr>
            <td  rowspan="1" align="right" valign="top">
                <asp:Label ID="Label30" runat="server"  Font-Bold="True" Text="الرقم الالى"
                   ></asp:Label></td>
            <td  rowspan="1" align="right" valign="top">
                <asp:Label ID="lblAppNo" runat="server" Font-Bold="True"  ForeColor="Red"
                    Width="180px"></asp:Label>
                        </td>
            <td  rowspan="1" align="right" valign="top">
                </td>
            <td  rowspan="1" align="right" valign="top">
                <asp:Label ID="Label78" runat="server"  Font-Bold="True" meta:resourcekey="Label31Resource1"
                    Text="رقم الموظف" Width="106px"></asp:Label>
                        </td>
            <td align="right" colspan="1">
                <asp:TextBox ID="txtEmpCode" runat="server" CssClass="form-control" 
                     Width="180px"></asp:TextBox>
            </td>
            <td align="right"  valign="top">
               </td>
            <td align="right"  valign="top">
                <asp:Label ID="Label1" runat="server"  Font-Bold="True" Text="الرقم المدني" ></asp:Label></td>
            <td align="right" valign="top">
                <asp:TextBox ID="txtCivilId" runat="server" CssClass="form-control"  Width="150px" required="required"></asp:TextBox>
                </td>
            <td align="right" valign="top">
                </td>
        </tr>
        <tr >
            <td valign="top" align="right">
                </td>
            <td valign="top" align="right">
                </td>
            <td valign="top" align="right">
                </td>
            <td valign="top" align="right">
                </td>
            <td align="right" colspan="1" style="height: 5px">
                </td>
            <td align="right" >
                </td>
            <td valign="top">
                </td>
            <td valign="top" align="right">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCivilId"
                    ErrorMessage="أدخل الرقم المدنى"  Font-Size="X-Small"></asp:RequiredFieldValidator>
                </td>
            <td valign="top" align="right">
                </td>
        </tr>
        <tr >
            <td rowspan="1" valign="top" align="right">
                <asp:Label ID="Label31" runat="server"  Font-Bold="True" Text="الاسم"
                    Width="106px" meta:resourcekey="Label31Resource1"></asp:Label></td>
            <td valign="top" align="right" colspan="4">
                <table style="width:100%;">
                    <tr>
                        <td>
                <asp:TextBox ID="txtEmpName1" runat="server" CssClass="form-control"  Width="88px" Font-Bold="False" ></asp:TextBox>
                           
                        </td>
                        <td>
                <asp:TextBox ID="txtEmpName2" runat="server" CssClass="form-control"  Width="88px" ></asp:TextBox>
                           
                        </td>
                        <td>
                <asp:TextBox ID="txtEmpName3" runat="server" CssClass="form-control"  Width="88px" ></asp:TextBox>
                          
                        </td>
                        <td>
                <asp:TextBox ID="txtEmpName4" runat="server" CssClass="form-control"  Width="88px" Font-Bold="False" ></asp:TextBox>
                            
                        </td>
                        <td>
                <asp:TextBox ID="txtEmpName5" runat="server" CssClass="form-control"  Width="88px" Font-Bold="False" ></asp:TextBox>
                           
                        </td>
                    </tr>
                </table>
            </td>
            <td align="right" style="width: 15px">
                </td>
            <td valign="top">
                <asp:Label ID="Label2" runat="server"  Font-Bold="True" 
                    Text="الراتب الاساسى"  ></asp:Label></td>
            <td valign="top" align="right">
                <asp:TextBox ID="txtLicenceNo" runat="server" CssClass="form-control" Width="150px" ></asp:TextBox>
                </td>
            <td valign="top" align="right">
                </td>
        </tr>
        <tr >
            <td valign="top" align="right" style="height: 5px">
                </td>
            <td valign="top" align="right" style="height: 5px" colspan="4">
                </td>
            <td align="right" style="width: 15px">
                </td>
            <td valign="top">
                </td>
            <td valign="top" align="right">
                </td>
            <td valign="top" align="right">
                </td>
        </tr>
        <tr>
            <td valign="top" align="right">
                <asp:Label ID="Label42" runat="server"  Font-Bold="True" 
                    Text="الاسم الانجليزي"  ></asp:Label>
                </td>
            <td valign="top" align="right" colspan="4">
                <table style="width:100%;">
                    <tr>
                        <td>
                <asp:TextBox ID="txtNameEng1" runat="server" CssClass="form-control"  Width="88px" ></asp:TextBox>
                        </td>
                        <td>
                <asp:TextBox ID="txtNameEng2" runat="server" CssClass="form-control"  Width="88px"></asp:TextBox> 
                        </td>
                        <td>
                <asp:TextBox ID="txtNameEng3" runat="server" CssClass="form-control"  Width="88px"></asp:TextBox> 
                        </td>
                        <td>
                <asp:TextBox ID="txtNameEng4" runat="server" CssClass="form-control"  Width="88px"></asp:TextBox> 
                        </td>
                        <td>
                <asp:TextBox ID="txtNameEng5" runat="server" CssClass="form-control"  Width="88px"></asp:TextBox> 
                        </td>
                    </tr>
                </table>
                </td>
            <td align="right">
                </td>
            <td valign="top" >
                <asp:Label ID="Label41" runat="server"  Font-Bold="True" Text=" انتهاء الاقامة"
                    Width="136px" meta:resourcekey="Label41Resource1"></asp:Label>
                </td>
            <td valign="top" align="right">
                <asp:TextBox ID="txtVisaEndDate" runat="server" CssClass="form-control" 
                    required="required" data-toggle="datepicker"  Width="150px"></asp:TextBox>
               </td>
            <td valign="top" align="right">
                            </td>
        </tr>
        <tr>
            <td valign="top" align="right" style="height: 5px">
                </td>
            <td valign="top" align="right" style="height: 5px">
                </td>
            <td valign="top" align="right" style="width: 15px;">
                </td>
            <td valign="top" align="right" style="height: 5px">
                </td>
            <td valign="top" align="right" >
                </td>
            <td align="right">
                </td>
            <td valign="top" >
                           </td>
            <td valign="top" align="right">
                            </td>
            <td valign="top" align="right">
                </td>
        </tr>
        <tr>
            <td valign="top" align="right" >
                <asp:Label ID="Label44" runat="server" Font-Bold="True" 
                    Text="الوظيفة بالانجليزية" Width="149px"></asp:Label>
                </td>
            <td valign="top" align="right" >
                <asp:DropDownList ID="CmbEngJob" runat="server" CssClass="Ar_ServiceDropDownList" Font-Bold="True" Width="200px" DataSourceID="ObjectDataSourceJobs" DataTextField="JOB_CLS_DESC_Eng" DataValueField="JOB_CLS_CODE">
                </asp:DropDownList>
                </td>
            <td valign="top" align="right" style="width: 5px" >
                </td>
            <td valign="top" align="right" style="width: 5px" >
                <asp:Label ID="Label45" runat="server"  Font-Bold="True" meta:resourcekey="Label31Resource1"
                    Text="المؤهل" Width="106px"></asp:Label>
                </td>
            <td align="right"  >
                <asp:DropDownList ID="cmbEducation" runat="server" CssClass="Ar_ServiceDropDownList" Font-Bold="True" Width="200px" DataSourceID="ObjectDataSourceEduction" DataTextField="QLF_DESC" DataValueField="QLF_TYP_CODE">
                </asp:DropDownList>
            </td>
            <td align="right" style="height: 5px">
                </td>
            <td valign="top">
                <asp:Label ID="Label5" runat="server"  Font-Bold="True" Text="تاريخ الميلاد"
                    ></asp:Label>
                </td>
            <td valign="top" align="right">
                <asp:TextBox ID="txtEmpBirthDate" runat="server" CssClass="form-control"
                    Width="150px" required="required" data-toggle="datepicker"></asp:TextBox>
               </td>
            <td valign="top" align="right">
                            </td>
        </tr>
        <tr>
            <td align="right" rowspan="1" valign="top">
                </td>
            <td align="right" rowspan="1" valign="top">
                </td>
            <td align="right" rowspan="1" valign="top" style="width: 5px">
                </td>
            <td align="right" rowspan="1" valign="top">
                </td>
            <td align="right" colspan="1" valign="top" style="height: 5px">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                           </td>
            <td align="right" valign="top">
                            </td>
            <td align="right" valign="top">
                </td>
        </tr>
        <tr>
            <td align="right" valign="top">
                <asp:Label ID="Label43" runat="server"  Font-Bold="True" meta:resourcekey="Label31Resource1"
                    Text="الوظيفة" Width="106px"></asp:Label>
                </td>
            <td align="right" valign="top">
                <asp:DropDownList ID="CmbJob" runat="server" CssClass="Ar_ServiceDropDownList" Font-Bold="True" Width="200px" DataSourceID="ObjectDataSourceJobs" DataTextField="JOB_CLS_DESC" DataValueField="JOB_CLS_CODE">
                </asp:DropDownList>
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                <asp:Label ID="Label47" runat="server"  Font-Bold="True" meta:resourcekey="Label31Resource1"
                    Text="الجنس" Width="106px"></asp:Label>
                </td>
            <td align="right" colspan="1" valign="top">
                <asp:DropDownList ID="CmbEmpGender" runat="server" CssClass="Ar_ServiceDropDownList" Font-Bold="True" Width="200px" DataSourceID="ObjectDataSourceSex" DataTextField="Sex" DataValueField="Id">
                </asp:DropDownList>
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                <asp:Label ID="Label11" runat="server"  Font-Bold="True" meta:resourcekey="Label31Resource1"
                    Text="مكان الميلاد" Width="106px"></asp:Label>
                </td>
            <td align="right" valign="top">
                <asp:TextBox ID="txtBirthPlace" runat="server" CssClass="form-control" 
                     Width="249px"></asp:TextBox>
                </td>
            <td align="right" valign="top">
                </td>
        </tr>
        <tr>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" colspan="1" valign="top" style="height: 5px">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
        </tr>
        <tr>
            <td align="right" valign="top">
                <asp:Label ID="Label46" runat="server"  Font-Bold="True" meta:resourcekey="Label31Resource1"
                    Text="الجنسية" Width="106px"></asp:Label>
                </td>
            <td align="right" valign="top">
                <asp:DropDownList ID="CmbEmpNat" runat="server" CssClass="Ar_ServiceDropDownList" Font-Bold="True" Width="200px" DataSourceID="ObjectDataSourceNats" DataTextField="NATIONALITY_DESC" DataValueField="NATIONALITY_CODE">
                </asp:DropDownList>
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                <asp:Label ID="Label48" runat="server"  Font-Bold="True" meta:resourcekey="Label31Resource1"
                    Text="الديانة" Width="106px"></asp:Label>
                </td>
            <td align="right" colspan="1" valign="top">
                <asp:DropDownList ID="cmbRelgion" runat="server" CssClass="Ar_ServiceDropDownList" Font-Bold="True" Width="200px" DataSourceID="ObjectDataSourceRelgion" DataTextField="ReligionDesc" DataValueField="ReligionId">
                </asp:DropDownList>
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                <asp:Label ID="Label49" runat="server"  Font-Bold="True" meta:resourcekey="Label31Resource1"
                    Text="الحالة الاجتماعية" Width="140px"></asp:Label>
                </td>
            <td align="right" valign="top">
                <asp:DropDownList ID="CmbEmpMatStatus" runat="server" CssClass="Ar_ServiceDropDownList" Font-Bold="True" Width="200px" DataSourceID="ObjectDataSourceMalStatus" DataTextField="StatusDesc" DataValueField="StatusId">
                </asp:DropDownList>
                </td>
            <td align="right" valign="top">
                </td>
        </tr>
        <tr>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" colspan="1" valign="top" style="height: 5px">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
        </tr>
        <tr>
            <td align="right" valign="top">
                <asp:Label ID="Label50" runat="server"  Font-Bold="True" meta:resourcekey="Label31Resource1"
                    Text="رقم الاقامة" Width="106px"></asp:Label>
                </td>
            <td align="right" valign="top">
                <asp:TextBox ID="txtEmpVisaNo" runat="server" CssClass="form-control" 
                     Width="200px"></asp:TextBox>
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                <asp:Label ID="Label52" runat="server"  Font-Bold="True" meta:resourcekey="Label31Resource1"
                    Text="نوع الاقامة" Width="106px"></asp:Label>
                </td>
            <td align="right" colspan="1" valign="top">
                <asp:TextBox ID="txtVisatype" runat="server" CssClass="form-control" 
                     Width="180px"></asp:TextBox>
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                <asp:Label ID="Label51" runat="server"  Font-Bold="True" meta:resourcekey="Label31Resource1"
                    Text="الكفيل" Width="106px"></asp:Label>
                </td>
            <td align="right" valign="top">
                <asp:DropDownList ID="CmbEmpBranch" runat="server" CssClass="Ar_ServiceDropDownList" Font-Bold="True" Width="250px" DataSourceID="ObjectDataSourceBranches" DataTextField="BRANCHNAME" DataValueField="BRANCHCODE">
                </asp:DropDownList>
                </td>
            <td align="right" valign="top">
                </td>
        </tr>
        <tr>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" colspan="1" valign="top" style="height: 5px">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
        </tr>
        <tr>
            <td align="right" valign="top">
                <asp:Label ID="Label53" runat="server"  Font-Bold="True" meta:resourcekey="Label31Resource1"
                    Text="حالة الموظف" Width="106px"></asp:Label>
                </td>
            <td align="right" valign="top">
                <asp:DropDownList ID="CmbStatus" runat="server" Font-Bold="True" Width="200px" DataSourceID="ObjectDataSourceEmpStatus" DataTextField="StatusDesc" DataValueField="Id">
                </asp:DropDownList>
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                <asp:Label ID="Label54" runat="server"  Font-Bold="True" 
                    Text="الراتب " Width="106px"></asp:Label>
                </td>
            <td align="right" colspan="1" valign="top">
                <asp:TextBox ID="txtBSalary" runat="server" CssClass="form-control" 
                     Width="180px"></asp:TextBox>
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                <asp:Label ID="Label55" runat="server"  Font-Bold="True" meta:resourcekey="Label31Resource1"
                    Text="الراتب الفعلى" Width="106px"></asp:Label>
                </td>
            <td align="right" valign="top">
                <asp:TextBox ID="txtAcualSal" runat="server" CssClass="form-control" 
                     Width="195px"></asp:TextBox>
                </td>
            <td align="right" valign="top">
                </td>
        </tr>
        <tr>
            <td align="right" valign="top">
               </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" colspan="1" valign="top" style="height: 5px">
               </td>
            <td align="right" valign="top">
               </td>
            <td align="right" valign="top">
               </td>
            <td align="right" valign="top">
               </td>
            <td align="right" valign="top">
               </td>
        </tr>
        <tr>
            <td align="right" valign="top">
                <asp:Label ID="Label56" runat="server"  Font-Bold="True" meta:resourcekey="Label31Resource1"
                    Text="اخر زيادة" Width="106px"></asp:Label>
                </td>
            <td align="right" valign="top">
                <asp:TextBox ID="txtLastInc" runat="server" CssClass="form-control" 
                     Width="200px"></asp:TextBox>
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                <asp:Label ID="Label57" runat="server"  Font-Bold="True" 
                    Text="سنة التخرج" Width="106px"></asp:Label>
                </td>
            <td align="right" colspan="1" valign="top">
                <asp:TextBox ID="txtEducationDate" runat="server" CssClass="form-control" 
                     Width="180px"></asp:TextBox>
                </td>
            <td align="right" valign="top">
               </td>
            <td align="right" valign="top">
                <asp:Label ID="Label62" runat="server"  Font-Bold="True" meta:resourcekey="Label31Resource1"
                    Text="تاريخ اخر زيادة" Width="130px"></asp:Label>
                </td>
            <td align="right" valign="top">
                <asp:TextBox ID="txtLastIncDate" runat="server" CssClass="form-control"
                    Width="150px"  data-toggle="datepicker"></asp:TextBox>
                </td>
            <td align="right" valign="top">
               </td>
        </tr>
        <tr>
            <td align="right" valign="top">
               </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" colspan="1" valign="top" style="height: 5px">
               </td>
            <td align="right" valign="top">
               </td>
            <td align="right" valign="top">
               </td>
            <td align="right" valign="top">
                            </td>
            <td align="right" valign="top">
               </td>
        </tr>
        <tr>
            <td align="right" valign="top">
                <asp:Label ID="Label61" runat="server"  Font-Bold="True" meta:resourcekey="Label31Resource1"
                    Text="نوع الرخصة" Width="106px"></asp:Label>
                </td>
            <td align="right" valign="top">
                <asp:DropDownList ID="CmbLicenseType" runat="server" CssClass="Ar_ServiceDropDownList" Font-Bold="True" Width="200px" DataSourceID="ObjectDataSourceLicenseType" DataTextField="LicenseTypeDesc" DataValueField="LicenseTypeId">
                </asp:DropDownList>
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                <asp:Label ID="Label60" runat="server"  Font-Bold="True" 
                    Text="رقم ت. الصحى" Width="119px"></asp:Label>
                </td>
            <td align="right" colspan="1" valign="top">
                <asp:TextBox ID="txtEmpHealthInsNo" runat="server" CssClass="form-control" 
                     Width="180px"></asp:TextBox>
                </td>
            <td align="right" valign="top">
               </td>
            <td align="right" valign="top">
                <asp:Label ID="Label58" runat="server"  Font-Bold="True" meta:resourcekey="Label31Resource1"
                    Text="رقم الرخصة" Width="106px"></asp:Label>
                </td>
            <td align="right" valign="top">
                <asp:TextBox ID="txtLicense" runat="server" CssClass="form-control" 
                     Width="150px"></asp:TextBox>
                </td>
            <td align="right" valign="top">
               </td>
        </tr>
        <tr>
            <td align="right" valign="top">
               </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" colspan="1" valign="top" style="height: 5px">
               </td>
            <td align="right" valign="top">
               </td>
            <td align="right" valign="top">
               </td>
            <td align="right" valign="top">
               </td>
            <td align="right" valign="top">
               </td>
        </tr>
        <tr>
            <td align="right" valign="top">
                <asp:Label ID="Label71" runat="server"  Font-Bold="True" 
                    Text="انتهاء ت. الصحي" Width="140px"></asp:Label>
                </td>
            <td align="right" valign="top">
                <asp:TextBox ID="txtEmpHealthInsDate" runat="server" CssClass="form-control"
                    Width="200px" required="required" data-toggle="datepicker"></asp:TextBox>
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                <asp:Label ID="Label64" runat="server"  Font-Bold="True" 
                    Text="رقم العقد" Width="106px"></asp:Label>
                </td>
            <td align="right" colspan="1" valign="top">
                <asp:TextBox ID="txtContractNo" runat="server" CssClass="form-control" 
                     Width="180px"></asp:TextBox>
                </td>
            <td align="right" valign="top">
               </td>
            <td align="right" valign="top">
                <asp:Label ID="Label63" runat="server"  Font-Bold="True" meta:resourcekey="Label31Resource1"
                    Text="تاريخ انتهاء الرخصة " Width="145px"></asp:Label>
                </td>
            <td align="right" valign="top">
                <asp:TextBox ID="txtLicenseEndDate" runat="server" CssClass="form-control"
                    Width="150px"  data-toggle="datepicker"></asp:TextBox>
                </td>
            <td align="right" valign="top">
               </td>
        </tr>
        <tr>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" colspan="1" valign="top" style="height: 5px">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
        </tr>
        <tr>
            <td align="right" valign="top">
                <asp:Label ID="Label65" runat="server"  Font-Bold="True" meta:resourcekey="Label31Resource1"
                    Text="رقم جواز السفر" Width="154px"></asp:Label>
                </td>
            <td align="right" valign="top">
                <asp:TextBox ID="txtPassportNo" runat="server" CssClass="form-control" 
                     Width="200px"></asp:TextBox>
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                <asp:Label ID="Label69" runat="server"  Font-Bold="True" 
                    Text="جنسية الجواز" Width="106px"></asp:Label>
                </td>
            <td align="right" colspan="1" valign="top">
                <asp:TextBox ID="txtPlaceNat" runat="server" CssClass="form-control" 
                     Width="180px"></asp:TextBox>
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                <asp:Label ID="Label67" runat="server"  Font-Bold="True" meta:resourcekey="Label31Resource1"
                    Text="تاريخ اصدار الجواز" Width="145px"></asp:Label>
                </td>
            <td align="right" valign="top">
                <asp:TextBox ID="txtPassDate" runat="server" CssClass="form-control"
                    Width="150px" required="required" data-toggle="datepicker"></asp:TextBox>
                </td>
            <td align="right" valign="top">
                </td>
        </tr>
        <tr>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" colspan="1" valign="top" style="height: 5px">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
        </tr>
        <tr>
            <td align="right" valign="top">
                <asp:Label ID="Label66" runat="server"  Font-Bold="True" meta:resourcekey="Label31Resource1"
                    Text="مكان الاصدار الجواز" Width="138px"></asp:Label>
                </td>
            <td align="right" valign="top">
                <asp:TextBox ID="txtPassplace" runat="server" CssClass="form-control" 
                     Width="200px"></asp:TextBox>
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                <asp:Label ID="Label70" runat="server"  Font-Bold="True" 
                    Text="نوع الجواز" Width="106px"></asp:Label>
                </td>
            <td align="right" colspan="1" valign="top">
                <asp:TextBox ID="txtPassType" runat="server" CssClass="form-control" 
                     Width="180px"></asp:TextBox>
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                <asp:Label ID="Label68" runat="server"  Font-Bold="True" meta:resourcekey="Label31Resource1"
                    Text="تاريخ انتهاء الجواز" Width="145px"></asp:Label>
                </td>
            <td align="right" valign="top">
                <asp:TextBox ID="txtPassEndDate" runat="server" CssClass="form-control"
                    Width="150px" required="required" data-toggle="datepicker"></asp:TextBox>
                </td>
            <td align="right" valign="top">
                </td>
        </tr>
        <tr>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" colspan="1" valign="top" style="height: 5px">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
        </tr>
        <tr>
            <td align="right" valign="top">
                <asp:Label ID="Label72" runat="server"  Font-Bold="True" meta:resourcekey="Label31Resource1"
                    Text="المسمي الوظيفي" Width="138px"></asp:Label>
                </td>
            <td align="right" valign="top">
                <asp:DropDownList ID="CmbEmpDept" runat="server" CssClass="Ar_ServiceDropDownList" Font-Bold="True" Width="200px" DataSourceID="ObjectDataSourceDept" DataTextField="DEPT_DESC" DataValueField="DEPT_CODE">
                </asp:DropDownList>
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                <asp:Label ID="Label73" runat="server"  Font-Bold="True" 
                    Text="القسم" Width="106px"></asp:Label>
                </td>
            <td align="right" colspan="1" valign="top">
                <asp:DropDownList ID="cmbDeptsNew" runat="server" CssClass="Ar_ServiceDropDownList" Font-Bold="True" Width="190px" DataSourceID="ObjectDataSourceDeptsNew" DataTextField="LocName" DataValueField="LocId">
                </asp:DropDownList>
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                <asp:Label ID="Label74" runat="server"  Font-Bold="True" meta:resourcekey="Label31Resource1"
                    Text="تاريخ الدخول" Width="145px"></asp:Label>
                </td>
            <td align="right" valign="top">
                <asp:TextBox ID="txtEnterDate" runat="server" CssClass="form-control"
                    Width="150px" required="required" data-toggle="datepicker"></asp:TextBox>
                </td>
            <td align="right" valign="top">
                </td>
        </tr>
        <tr>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" colspan="1" valign="top" style="height: 5px">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                </td>
        </tr>
        <tr>
            <td align="right" valign="top">
                <asp:Label ID="Label76" runat="server"  Font-Bold="True" meta:resourcekey="Label31Resource1"
                    Text="الرقم الموحد" Width="138px"></asp:Label>
                </td>
            <td align="right" valign="top">
                <asp:TextBox ID="txtEmpCommanNo" runat="server" CssClass="form-control" 
                     Width="200px"></asp:TextBox>
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                <asp:Label ID="Label75" runat="server"  Font-Bold="True" 
                    Text="رقم ح. البنك" Width="106px"></asp:Label>
                </td>
            <td align="right" colspan="1" valign="top">
                <asp:TextBox ID="txtBankAcc1" runat="server" CssClass="form-control" 
                     Width="180px"></asp:TextBox>
                </td>
            <td align="right" valign="top">
                </td>
            <td align="right" valign="top">
                <asp:Label ID="Label77" runat="server"  Font-Bold="True" meta:resourcekey="Label31Resource1"
                    Text="تاريخ التعيين" Width="138px"></asp:Label>
                </td>
            <td align="right" valign="top">
                <asp:TextBox ID="txtHireDate" runat="server" CssClass="form-control"
                    Width="150px" required="required" data-toggle="datepicker"></asp:TextBox>
                </td>
            <td align="right" valign="top">
                </td>
        </tr>
        <tr>
            <td colspan="8"  valign="top">
                </td>
            <td  valign="top">
                </td>
        </tr>
        <tr>
            <td align="center" colspan="8" style="height: 16px">
    <asp:Button ID="CmdAdd" runat="server" Text="أضافة" Width="80px"  CssClass="btn btn-primary sendMail" meta:resourcekey="CmdAddResource1" OnClick="CmdAdd_Click"  />
                
                <asp:Button ID="cmdsave" runat="server" Text="تعديل" Width="88px" Enabled="False"  CssClass="btn btn-primary sendMail" meta:resourcekey="cmdsaveResource1" OnClick="cmdsave_Click"  />
    <asp:Button ID="DelCmd" runat="server" Text="حذف" Width="80px" Enabled="False"  CssClass="btn btn-primary sendMail" meta:resourcekey="DelCmdResource1" OnClick="DelCmd_Click"  />
                <asp:Button ID="BtnPrint" runat="server" CausesValidation="False" CssClass="btn btn-primary sendMail"
                    Text="طباعة" Width="80px" meta:resourcekey="BtnPrintResource1" Enabled="False" OnClick="BtnPrint_Click" />
                <asp:Button ID="CloseBtn" runat="server" CausesValidation="False" CssClass="btn btn-primary sendMail"
                    Text="خروج" Width="80px" OnClick="CloseBtn_Click" /></td>
            <td align="center" style="height: 16px">
                </td>
        </tr>
    </table>
               
         

                  </div>
   </div>
   </div>
   </div>
  </div>
 </div>
         </div>
    <br />
    <asp:TextBox ID="txtUdpdateUserId" runat="server" meta:resourcekey="txtPervMonthIdResource1"
        Text="1" Visible="False"></asp:TextBox>
    <asp:ObjectDataSource ID="ObjectDataSourceEmps" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="PersonalDataSetTableAdapters.PER_EMPLOYEE_DATATableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update" OnInserted="ObjectDataSourceEmps_Inserted">
        <DeleteParameters>
            <asp:Parameter Name="Original_EMP_CODE" Type="Int64" />
            <asp:Parameter Name="Original_EmpNum" Type="String" />
            <asp:Parameter Name="Original_CIVILID" Type="String" />
            <asp:Parameter Name="Original_FName" Type="String" />
            <asp:Parameter Name="Original_SName" Type="String" />
            <asp:Parameter Name="Original_TName" Type="String" />
            <asp:Parameter Name="Original_FoName" Type="String" />
            <asp:Parameter Name="Original_FEngName" Type="String" />
            <asp:Parameter Name="Original_SEngName" Type="String" />
            <asp:Parameter Name="Original_TEngName" Type="String" />
            <asp:Parameter Name="Original_FoEngName" Type="String" />
            <asp:Parameter Name="Original_TITLE" Type="String" />
            <asp:Parameter Name="Original_EMP_GENDER" Type="Int32" />
            <asp:Parameter Name="Original_ContractNo" Type="String" />
            <asp:Parameter Name="Original_EMP_BIRTH_DATE" Type="DateTime" />
            <asp:Parameter Name="Original_EMP_BIRTH_PLACE" Type="String" />
            <asp:Parameter Name="Original_DEPTCODE" Type="Int64" />
            <asp:Parameter Name="Original_EMP_EMAIL" Type="String" />
            <asp:Parameter Name="Original_EMP_HIREDATE" Type="DateTime" />
            <asp:Parameter Name="Original_entrydate" Type="DateTime" />
            <asp:Parameter Name="Original_Emp_End_HIREDATE" Type="DateTime" />
            <asp:Parameter Name="Original_JOB_CODE" Type="Decimal" />
            <asp:Parameter Name="Original_JOB_CLS_CODE" Type="Decimal" />
            <asp:Parameter Name="Original_FILE_NUM" Type="String" />
            <asp:Parameter Name="Original_DEGREE_CODE" Type="Decimal" />
            <asp:Parameter Name="Original_REC_TYPE_CODE" Type="Decimal" />
            <asp:Parameter Name="Original_MARITAL_STATUS_CODE" Type="Decimal" />
            <asp:Parameter Name="Original_NATIONALITY_CODE" Type="Decimal" />
            <asp:Parameter Name="Original_GOVER_CODE" Type="Decimal" />
            <asp:Parameter Name="Original_EMP_VISA" Type="Boolean" />
            <asp:Parameter Name="Original_BANK_CODE" Type="Decimal" />
            <asp:Parameter Name="Original_AccountID" Type="Decimal" />
            <asp:Parameter Name="Original_NOTES" Type="String" />
            <asp:Parameter Name="Original_PassportNo" Type="String" />
            <asp:Parameter Name="Original_PassType" Type="String" />
            <asp:Parameter Name="Original_PassDate" Type="DateTime" />
            <asp:Parameter Name="Original_PassEndDate" Type="DateTime" />
            <asp:Parameter Name="Original_Passplace" Type="String" />
            <asp:Parameter Name="Original_SALARY" Type="Decimal" />
            <asp:Parameter Name="Original_Status" Type="Int32" />
            <asp:Parameter Name="Original_bankacc" Type="Int32" />
            <asp:Parameter Name="Original_BRANCH_CODE" Type="Int64" />
            <asp:Parameter Name="Original_SalesAdminFalg" Type="Boolean" />
            <asp:Parameter Name="Original_GroupId" Type="Int64" />
            <asp:Parameter Name="Original_ReligionId" Type="Int32" />
            <asp:Parameter Name="Original_EducationId" Type="Int32" />
            <asp:Parameter Name="Original_EducationMajored" Type="String" />
            <asp:Parameter Name="Original_EducationMajoredDate" Type="DateTime" />
            <asp:Parameter Name="Original_EducationMajoredYear" Type="Int32" />
            <asp:Parameter Name="Original_EducationMajoredPlace" Type="String" />
            <asp:Parameter Name="Original_LocationId" Type="Int32" />
            <asp:Parameter Name="Original_RegionId" Type="Int32" />
            <asp:Parameter Name="Original_DivisionId" Type="Int32" />
            <asp:Parameter Name="Original_GardeId" Type="Int32" />
            <asp:Parameter Name="Original_ResidenceId" Type="Int32" />
            <asp:Parameter Name="Original_ResidenceNo" Type="String" />
            <asp:Parameter Name="Original_ResidenceRemark" Type="String" />
            <asp:Parameter Name="Original_ResidenceIssueDate" Type="DateTime" />
            <asp:Parameter Name="Original_ResidenceEndDate" Type="DateTime" />
            <asp:Parameter Name="Original_LicenseNo" Type="String" />
            <asp:Parameter Name="Original_LicenseTypeId" Type="Int32" />
            <asp:Parameter Name="Original_LicenseIssueDate" Type="DateTime" />
            <asp:Parameter Name="Original_LicenseEndDate" Type="DateTime" />
            <asp:Parameter Name="Original_EMP_HEALTH_INS_DATE" Type="DateTime" />
            <asp:Parameter Name="Original_EMP_HEALTH_INS_NUM" Type="String" />
            <asp:Parameter Name="Original_JoiningDate" Type="DateTime" />
            <asp:Parameter Name="Original_SalaryType" Type="Int32" />
            <asp:Parameter Name="Original_ContractType" Type="Int32" />
            <asp:Parameter Name="Original_IndemnityDays" Type="Decimal" />
            <asp:Parameter Name="Original_VaccationDays" Type="Decimal" />
            <asp:Parameter Name="Original_Ticket" Type="Decimal" />
            <asp:Parameter Name="Original_WorkHourPerDay" Type="Decimal" />
            <asp:Parameter Name="Original_WorkDaysperMonth" Type="Decimal" />
            <asp:Parameter Name="Original_ADDRESS" Type="String" />
            <asp:Parameter Name="Original_BlockNo" Type="String" />
            <asp:Parameter Name="Original_Street" Type="String" />
            <asp:Parameter Name="Original_Floor" Type="String" />
            <asp:Parameter Name="Original_WorkTel" Type="String" />
            <asp:Parameter Name="Original_HomeTel" Type="String" />
            <asp:Parameter Name="Original_Mobile1" Type="String" />
            <asp:Parameter Name="Original_Mobile2" Type="String" />
            <asp:Parameter Name="Original_Fax" Type="String" />
            <asp:Parameter Name="Original_Email" Type="String" />
            <asp:Parameter Name="Original_bank" Type="Boolean" />
            <asp:Parameter Name="Original_BankFId" Type="Int32" />
            <asp:Parameter Name="Original_BankSId" Type="Int32" />
            <asp:Parameter Name="Original_BankFBranch" Type="String" />
            <asp:Parameter Name="Original_BankSBranch" Type="String" />
            <asp:Parameter Name="Original_BankFAccountNo" Type="String" />
            <asp:Parameter Name="Original_BankSAccountNo" Type="String" />
            <asp:Parameter Name="Original_DankEffDate" Type="DateTime" />
            <asp:Parameter Name="Original_JobLevel" Type="Int32" />
            <asp:Parameter Name="Original_ContactLocation" Type="String" />
            <asp:Parameter Name="Original_ContactLocationDate" Type="DateTime" />
            <asp:Parameter Name="Original_VacEarned" Type="Decimal" />
            <asp:Parameter Name="Original_VacTaken" Type="Decimal" />
            <asp:Parameter Name="Original_VacBalance" Type="Decimal" />
            <asp:Parameter Name="Original_VacUnpaid" Type="Decimal" />
            <asp:Parameter Name="Original_SALEADMIN" Type="Int32" />
            <asp:Parameter Name="Original_FullName" Type="String" />
            <asp:Parameter Name="Original_GetAllow" Type="Decimal" />
            <asp:Parameter Name="Original_PhoneAllow" Type="Decimal" />
            <asp:Parameter Name="Original_TransAllow" Type="Decimal" />
            <asp:Parameter Name="Original_InsuranceValue" Type="Decimal" />
            <asp:Parameter Name="Original_VisaNo" Type="String" />
            <asp:Parameter Name="Original_ComingDate" Type="DateTime" />
            <asp:Parameter Name="Original_WorkPNum1" Type="String" />
            <asp:Parameter Name="Original_WorkPNum2" Type="String" />
            <asp:Parameter Name="Original_WorkPNum3" Type="String" />
            <asp:Parameter Name="Original_FiName" Type="String" />
            <asp:Parameter Name="Original_FiEngName" Type="String" />
            <asp:Parameter Name="Original_BirthPlace" Type="String" />
            <asp:Parameter Name="Original_BloodType" Type="String" />
            <asp:Parameter Name="Original_HealthcardEndDate" Type="DateTime" />
            <asp:Parameter Name="Original_Doc1" Type="String" />
            <asp:Parameter Name="Original_Doc2" Type="String" />
            <asp:Parameter Name="Original_Doc3" Type="String" />
            <asp:Parameter Name="Original_Doc4" Type="String" />
            <asp:Parameter Name="Original_Doc5" Type="String" />
            <asp:Parameter Name="Original_Doc6" Type="String" />
            <asp:Parameter Name="Original_Doc7" Type="String" />
            <asp:Parameter Name="Original_Doc8" Type="String" />
            <asp:Parameter Name="Original_Doc9" Type="String" />
            <asp:Parameter Name="Original_Doc10" Type="String" />
            <asp:Parameter Name="Original_HouseType" Type="String" />
            <asp:Parameter Name="Original_flatNo" Type="String" />
            <asp:Parameter Name="Original_PassNat" Type="String" />
            <asp:Parameter Name="Original_gada" Type="String" />
            <asp:Parameter Name="Original_TasharNO" Type="String" />
            <asp:Parameter Name="Original_FFEngName" Type="String" />
            <asp:Parameter Name="Original_IBan" Type="String" />
            <asp:Parameter Name="Original_TITLEEng" Type="String" />
            <asp:Parameter Name="Original_CompMovId" Type="Int64" />
            <asp:Parameter Name="Original_PrevContactNo" Type="String" />
            <asp:Parameter Name="Original_PrevSalKd" Type="Decimal" />
            <asp:Parameter Name="Original_PrevSalFil" Type="Decimal" />
            <asp:Parameter Name="Original_PrevJob" Type="String" />
            <asp:Parameter Name="Original_PrevContractYear" Type="String" />
            <asp:Parameter Name="Original_LastIncreasedDate" Type="DateTime" />
            <asp:Parameter Name="Original_VacRepEmpId" Type="Int64" />
            <asp:Parameter Name="Original_OrgId" Type="Int32" />
            <asp:Parameter Name="Original_EnFullName" Type="String" />
        </DeleteParameters>
        <InsertParameters>
             <asp:ControlParameter ControlID="txtEmpCode" Name="EmpNum" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtCivilId" Name="CIVILID" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtEmpName1" Name="FName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtEmpName2" Name="SName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtEmpName3" Name="TName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtEmpName4" Name="FoName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtNameEng1" Name="FEngName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtNameEng2" Name="SEngName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtNameEng3" Name="TEngName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtNameEng4" Name="FoEngName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="CmbJob" Name="TITLE" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="CmbEmpGender" Name="EMP_GENDER" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="txtContractNo" Name="ContractNo" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtEmpBirthDate" Name="EMP_BIRTH_DATE" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="txtBirthPlace" Name="EMP_BIRTH_PLACE" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="CmbEmpDept" Name="DEPTCODE" PropertyName="SelectedValue" Type="Int64" />
            <asp:Parameter Name="EMP_EMAIL" Type="String" />
            <asp:ControlParameter ControlID="txtHireDate" Name="EMP_HIREDATE" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="txtEnterDate" Name="entrydate" PropertyName="Text" Type="DateTime" />
            <asp:Parameter Name="Emp_End_HIREDATE" Type="DateTime" />
            <asp:Parameter Name="JOB_CODE" Type="Decimal" />
            <asp:Parameter Name="JOB_CLS_CODE" Type="Decimal" />
            <asp:Parameter Name="FILE_NUM" Type="String" />
            <asp:Parameter Name="DEGREE_CODE" Type="Decimal" />
            <asp:Parameter Name="REC_TYPE_CODE" Type="Decimal" />
            <asp:ControlParameter ControlID="CmbEmpMatStatus" Name="MARITAL_STATUS_CODE" PropertyName="SelectedValue" Type="Decimal" />
            <asp:ControlParameter ControlID="CmbEmpNat" Name="NATIONALITY_CODE" PropertyName="SelectedValue" Type="Decimal" />
            <asp:Parameter Name="GOVER_CODE" Type="Decimal" />
            <asp:Parameter Name="EMP_VISA" Type="Boolean" />
            <asp:Parameter Name="BANK_CODE" Type="Decimal" />
            <asp:Parameter Name="AccountID" Type="Decimal" />
            <asp:Parameter Name="NOTES" Type="String" />
            <asp:ControlParameter ControlID="txtPassportNo" Name="PassportNo" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtPassType" Name="PassType" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtPassDate" Name="PassDate" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="txtPassEndDate" Name="PassEndDate" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="txtPassplace" Name="Passplace" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtBSalary" Name="SALARY" PropertyName="Text" Type="Decimal" />
            <asp:ControlParameter ControlID="CmbStatus" Name="Status" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="txtBankAcc1" Name="bankacc" PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="CmbEmpBranch" Name="BRANCH_CODE" PropertyName="SelectedValue" Type="Int64" />
            <asp:Parameter Name="SalesAdminFalg" Type="Boolean" />
            <asp:Parameter Name="GroupId" Type="Int64" />
            <asp:ControlParameter ControlID="cmbRelgion" Name="ReligionId" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="cmbEducation" Name="EducationId" PropertyName="SelectedValue" Type="Int32" />
            <asp:Parameter Name="EducationMajored" Type="String" />
            <asp:Parameter Name="EducationMajoredDate" Type="DateTime" />
            <asp:ControlParameter ControlID="txtEducationDate" Name="EducationMajoredYear" PropertyName="Text" Type="Int32" />
            <asp:Parameter Name="EducationMajoredPlace" Type="String" />
            <asp:ControlParameter ControlID="cmbDeptsNew" Name="LocationId" PropertyName="SelectedValue" Type="Int32" />
            <asp:Parameter Name="RegionId" Type="Int32" />
            <asp:Parameter Name="DivisionId" Type="Int32" />
            <asp:Parameter Name="GardeId" Type="Int32" />
            <asp:Parameter Name="ResidenceId" Type="Int32" />
            <asp:ControlParameter ControlID="txtEmpVisaNo" Name="ResidenceNo" PropertyName="Text" Type="String" />
            <asp:Parameter Name="ResidenceRemark" Type="String" />
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
            <asp:Parameter Name="IndemnityDays" Type="Decimal" />
            <asp:Parameter Name="VaccationDays" Type="Decimal" />
            <asp:Parameter Name="Ticket" Type="Decimal" />
            <asp:Parameter Name="WorkHourPerDay" Type="Decimal" />
            <asp:Parameter Name="WorkDaysperMonth" Type="Decimal" />
            <asp:Parameter Name="ADDRESS" Type="String" />
            <asp:Parameter Name="BlockNo" Type="String" />
            <asp:Parameter Name="Street" Type="String" />
            <asp:Parameter Name="Floor" Type="String" />
            <asp:Parameter Name="WorkTel" Type="String" />
            <asp:Parameter Name="HomeTel" Type="String" />
            <asp:Parameter Name="Mobile1" Type="String" />
            <asp:Parameter Name="Mobile2" Type="String" />
            <asp:Parameter Name="Fax" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="bank" Type="Boolean" />
            <asp:Parameter Name="BankFId" Type="Int32" />
            <asp:Parameter Name="BankSId" Type="Int32" />
            <asp:Parameter Name="BankFBranch" Type="String" />
            <asp:Parameter Name="BankSBranch" Type="String" />
            <asp:Parameter Name="BankFAccountNo" Type="String" />
            <asp:Parameter Name="BankSAccountNo" Type="String" />
            <asp:Parameter Name="DankEffDate" Type="DateTime" />
            <asp:Parameter Name="JobLevel" Type="Int32" />
            <asp:Parameter Name="ContactLocation" Type="String" />
            <asp:Parameter Name="ContactLocationDate" Type="DateTime" />
            <asp:Parameter Name="VacEarned" Type="Decimal" />
            <asp:Parameter Name="VacTaken" Type="Decimal" />
            <asp:Parameter Name="VacBalance" Type="Decimal" />
            <asp:Parameter Name="VacUnpaid" Type="Decimal" />
            <asp:Parameter Name="SALEADMIN" Type="Int32" />
            <asp:ControlParameter ControlID="txtEmpFulName" Name="FullName" PropertyName="Text" Type="String" />
            <asp:Parameter Name="GetAllow" Type="Decimal" />
            <asp:ControlParameter ControlID="txtAcualSal" Name="PhoneAllow" PropertyName="Text" Type="Decimal" />
            <asp:ControlParameter ControlID="txtLastInc" Name="TransAllow" PropertyName="Text" Type="Decimal" />
            <asp:Parameter Name="InsuranceValue" Type="Decimal" />
            <asp:ControlParameter ControlID="txtEmpCommanNo" Name="VisaNo" PropertyName="Text" Type="String" />
            <asp:Parameter Name="ComingDate" Type="DateTime" />
            <asp:Parameter Name="WorkPNum1" Type="String" />
            <asp:Parameter Name="WorkPNum2" Type="String" />
            <asp:Parameter Name="WorkPNum3" Type="String" />
            <asp:ControlParameter ControlID="txtEmpName5" Name="FiName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtNameEng5" Name="FiEngName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtBirthPlace" Name="BirthPlace" PropertyName="Text" Type="String" />
            <asp:Parameter Name="BloodType" Type="String" />
            <asp:Parameter Name="HealthcardEndDate" Type="DateTime" />
            <asp:Parameter Name="Doc1" Type="String" />
            <asp:Parameter Name="Doc2" Type="String" />
            <asp:Parameter Name="Doc3" Type="String" />
            <asp:Parameter Name="Doc4" Type="String" />
            <asp:Parameter Name="Doc5" Type="String" />
            <asp:Parameter Name="Doc6" Type="String" />
            <asp:Parameter Name="Doc7" Type="String" />
            <asp:Parameter Name="Doc8" Type="String" />
            <asp:Parameter Name="Doc9" Type="String" />
            <asp:Parameter Name="Doc10" Type="String" />
            <asp:Parameter Name="HouseType" Type="String" />
            <asp:Parameter Name="flatNo" Type="String" />
            <asp:ControlParameter ControlID="txtPlaceNat" Name="PassNat" PropertyName="Text" Type="String" />
            <asp:Parameter Name="gada" Type="String" />
            <asp:Parameter Name="TasharNO" Type="String" />
            <asp:Parameter Name="EmpPic" Type="Object" />
            <asp:Parameter Name="FFEngName" Type="String" />
            <asp:Parameter Name="IBan" Type="String" />
            <asp:Parameter Name="TITLEEng" Type="String" />
            <asp:Parameter Name="CompMovId" Type="Int64" />
            <asp:Parameter Name="PrevContactNo" Type="String" />
            <asp:Parameter Name="PrevSalKd" Type="Decimal" />
            <asp:Parameter Name="PrevSalFil" Type="Decimal" />
            <asp:Parameter Name="PrevJob" Type="String" />
            <asp:Parameter Name="PrevContractYear" Type="String" />
            <asp:ControlParameter ControlID="txtLastIncDate" Name="LastIncreasedDate" PropertyName="Text" Type="DateTime" />
            <asp:Parameter Name="VacRepEmpId" Type="Int64" />
            <asp:ControlParameter ControlID="txtOrgId" Name="OrgId" PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="txtEmpFulEngName" Name="EnFullName" PropertyName="Text" Type="String" />
             <asp:Parameter Direction="InputOutput" Name="EMP_CODE" Type="Object" />
        </InsertParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="txtEmpCode" Name="EmpNum" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtCivilId" Name="CIVILID" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtEmpName1" Name="FName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtEmpName2" Name="SName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtEmpName3" Name="TName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtEmpName4" Name="FoName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtNameEng1" Name="FEngName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtNameEng2" Name="SEngName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtNameEng3" Name="TEngName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtNameEng4" Name="FoEngName" PropertyName="Text" Type="String" />
            <asp:Parameter Name="TITLE" Type="String" />
            <asp:ControlParameter ControlID="CmbEmpGender" Name="EMP_GENDER" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="txtContractNo" Name="ContractNo" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtEmpBirthDate" Name="EMP_BIRTH_DATE" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="txtBirthPlace" Name="EMP_BIRTH_PLACE" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="CmbEmpDept" Name="DEPTCODE" PropertyName="SelectedValue" Type="Int64" />
            <asp:Parameter Name="EMP_EMAIL" Type="String" />
            <asp:ControlParameter ControlID="txtHireDate" Name="EMP_HIREDATE" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="txtEnterDate" Name="entrydate" PropertyName="Text" Type="DateTime" />
            <asp:Parameter Name="Emp_End_HIREDATE" Type="DateTime" />
            <asp:Parameter Name="JOB_CODE" Type="Decimal" />
            <asp:ControlParameter ControlID="CmbJob" Name="JOB_CLS_CODE" PropertyName="SelectedValue" Type="Decimal" />
            <asp:Parameter Name="FILE_NUM" Type="String" />
            <asp:Parameter Name="DEGREE_CODE" Type="Decimal" />
            <asp:Parameter Name="REC_TYPE_CODE" Type="Decimal" />
            <asp:ControlParameter ControlID="CmbEmpMatStatus" Name="MARITAL_STATUS_CODE" PropertyName="SelectedValue" Type="Decimal" />
            <asp:ControlParameter ControlID="CmbEmpNat" Name="NATIONALITY_CODE" PropertyName="SelectedValue" Type="Decimal" />
            <asp:Parameter Name="GOVER_CODE" Type="Decimal" />
            <asp:Parameter Name="EMP_VISA" Type="Boolean" />
            <asp:Parameter Name="BANK_CODE" Type="Decimal" />
            <asp:Parameter Name="AccountID" Type="Decimal" />
            <asp:Parameter Name="NOTES" Type="String" />
            <asp:ControlParameter ControlID="txtPassportNo" Name="PassportNo" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtPassType" Name="PassType" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtPassDate" Name="PassDate" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="txtPassEndDate" Name="PassEndDate" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="txtPassplace" Name="Passplace" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtBSalary" Name="SALARY" PropertyName="Text" Type="Decimal" />
            <asp:ControlParameter ControlID="CmbStatus" Name="Status" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="txtBankAcc1" Name="bankacc" PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="CmbEmpBranch" Name="BRANCH_CODE" PropertyName="SelectedValue" Type="Int64" />
            <asp:Parameter Name="SalesAdminFalg" Type="Boolean" />
            <asp:Parameter Name="GroupId" Type="Int64" />
            <asp:ControlParameter ControlID="cmbRelgion" Name="ReligionId" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="cmbEducation" Name="EducationId" PropertyName="SelectedValue" Type="Int32" />
            <asp:Parameter Name="EducationMajored" Type="String" />
            <asp:ControlParameter ControlID="txtEducationDate" Name="EducationMajoredDate" PropertyName="Text" Type="DateTime" />
            <asp:Parameter Name="EducationMajoredYear" Type="Int32" />
            <asp:Parameter Name="EducationMajoredPlace" Type="String" />
            <asp:ControlParameter ControlID="cmbDeptsNew" Name="LocationId" PropertyName="SelectedValue" Type="Int32" />
            <asp:Parameter Name="RegionId" Type="Int32" />
            <asp:Parameter Name="DivisionId" Type="Int32" />
            <asp:Parameter Name="GardeId" Type="Int32" />
            <asp:Parameter Name="ResidenceId" Type="Int32" />
            <asp:ControlParameter ControlID="txtEmpVisaNo" Name="ResidenceNo" PropertyName="Text" Type="String" />
            <asp:Parameter Name="ResidenceRemark" Type="String" />
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
            <asp:Parameter Name="IndemnityDays" Type="Decimal" />
            <asp:Parameter Name="VaccationDays" Type="Decimal" />
            <asp:Parameter Name="Ticket" Type="Decimal" />
            <asp:Parameter Name="WorkHourPerDay" Type="Decimal" />
            <asp:Parameter Name="WorkDaysperMonth" Type="Decimal" />
            <asp:Parameter Name="ADDRESS" Type="String" />
            <asp:Parameter Name="BlockNo" Type="String" />
            <asp:Parameter Name="Street" Type="String" />
            <asp:Parameter Name="Floor" Type="String" />
            <asp:Parameter Name="WorkTel" Type="String" />
            <asp:Parameter Name="HomeTel" Type="String" />
            <asp:Parameter Name="Mobile1" Type="String" />
            <asp:Parameter Name="Mobile2" Type="String" />
            <asp:Parameter Name="Fax" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="bank" Type="Boolean" />
            <asp:Parameter Name="BankFId" Type="Int32" />
            <asp:Parameter Name="BankSId" Type="Int32" />
            <asp:Parameter Name="BankFBranch" Type="String" />
            <asp:Parameter Name="BankSBranch" Type="String" />
            <asp:Parameter Name="BankFAccountNo" Type="String" />
            <asp:Parameter Name="BankSAccountNo" Type="String" />
            <asp:Parameter Name="DankEffDate" Type="DateTime" />
            <asp:Parameter Name="JobLevel" Type="Int32" />
            <asp:Parameter Name="ContactLocation" Type="String" />
            <asp:Parameter Name="ContactLocationDate" Type="DateTime" />
            <asp:Parameter Name="VacEarned" Type="Decimal" />
            <asp:Parameter Name="VacTaken" Type="Decimal" />
            <asp:Parameter Name="VacBalance" Type="Decimal" />
            <asp:Parameter Name="VacUnpaid" Type="Decimal" />
            <asp:Parameter Name="SALEADMIN" Type="Int32" />
            <asp:ControlParameter ControlID="txtEmpFulName" Name="FullName" PropertyName="Text" Type="String" />
            <asp:Parameter Name="GetAllow" Type="Decimal" />
            <asp:ControlParameter ControlID="txtAcualSal" Name="PhoneAllow" PropertyName="Text" Type="Decimal" />
            <asp:ControlParameter ControlID="txtLastInc" Name="TransAllow" PropertyName="Text" Type="Decimal" />
            <asp:Parameter Name="InsuranceValue" Type="Decimal" />
            <asp:ControlParameter ControlID="txtEmpCommanNo" Name="VisaNo" PropertyName="Text" Type="String" />
            <asp:Parameter Name="ComingDate" Type="DateTime" />
            <asp:Parameter Name="WorkPNum1" Type="String" />
            <asp:Parameter Name="WorkPNum2" Type="String" />
            <asp:Parameter Name="WorkPNum3" Type="String" />
            <asp:ControlParameter ControlID="txtEmpName5" Name="FiName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtNameEng5" Name="FiEngName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtBirthPlace" Name="BirthPlace" PropertyName="Text" Type="String" />
            <asp:Parameter Name="BloodType" Type="String" />
            <asp:Parameter Name="HealthcardEndDate" Type="DateTime" />
            <asp:Parameter Name="Doc1" Type="String" />
            <asp:Parameter Name="Doc2" Type="String" />
            <asp:Parameter Name="Doc3" Type="String" />
            <asp:Parameter Name="Doc4" Type="String" />
            <asp:Parameter Name="Doc5" Type="String" />
            <asp:Parameter Name="Doc6" Type="String" />
            <asp:Parameter Name="Doc7" Type="String" />
            <asp:Parameter Name="Doc8" Type="String" />
            <asp:Parameter Name="Doc9" Type="String" />
            <asp:Parameter Name="Doc10" Type="String" />
            <asp:Parameter Name="HouseType" Type="String" />
            <asp:Parameter Name="flatNo" Type="String" />
            <asp:ControlParameter ControlID="txtPlaceNat" Name="PassNat" PropertyName="Text" Type="String" />
            <asp:Parameter Name="gada" Type="String" />
            <asp:Parameter Name="TasharNO" Type="String" />
            <asp:Parameter Name="EmpPic" Type="Object" />
            <asp:Parameter Name="FFEngName" Type="String" />
            <asp:Parameter Name="IBan" Type="String" />
            <asp:Parameter Name="TITLEEng" Type="String" />
            <asp:Parameter Name="CompMovId" Type="Int64" />
            <asp:Parameter Name="PrevContactNo" Type="String" />
            <asp:Parameter Name="PrevSalKd" Type="Decimal" />
            <asp:Parameter Name="PrevSalFil" Type="Decimal" />
            <asp:Parameter Name="PrevJob" Type="String" />
            <asp:Parameter Name="PrevContractYear" Type="String" />
            <asp:ControlParameter ControlID="txtLastIncDate" Name="LastIncreasedDate" PropertyName="Text" Type="DateTime" />
            <asp:Parameter Name="VacRepEmpId" Type="Int64" />
            <asp:ControlParameter ControlID="txtOrgId" Name="OrgId" PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="txtEmpFulEngName" Name="EnFullName" PropertyName="Text" Type="String" />
            <asp:Parameter Name="Original_EMP_CODE" Type="Int64" />
            <asp:Parameter Name="Original_EmpNum" Type="String" />
            <asp:Parameter Name="Original_CIVILID" Type="String" />
            <asp:Parameter Name="Original_FName" Type="String" />
            <asp:Parameter Name="Original_SName" Type="String" />
            <asp:Parameter Name="Original_TName" Type="String" />
            <asp:Parameter Name="Original_FoName" Type="String" />
            <asp:Parameter Name="Original_FEngName" Type="String" />
            <asp:Parameter Name="Original_SEngName" Type="String" />
            <asp:Parameter Name="Original_TEngName" Type="String" />
            <asp:Parameter Name="Original_FoEngName" Type="String" />
            <asp:Parameter Name="Original_TITLE" Type="String" />
            <asp:Parameter Name="Original_EMP_GENDER" Type="Int32" />
            <asp:Parameter Name="Original_ContractNo" Type="String" />
            <asp:Parameter Name="Original_EMP_BIRTH_DATE" Type="DateTime" />
            <asp:Parameter Name="Original_EMP_BIRTH_PLACE" Type="String" />
            <asp:Parameter Name="Original_DEPTCODE" Type="Int64" />
            <asp:Parameter Name="Original_EMP_EMAIL" Type="String" />
            <asp:Parameter Name="Original_EMP_HIREDATE" Type="DateTime" />
            <asp:Parameter Name="Original_entrydate" Type="DateTime" />
            <asp:Parameter Name="Original_Emp_End_HIREDATE" Type="DateTime" />
            <asp:Parameter Name="Original_JOB_CODE" Type="Decimal" />
            <asp:Parameter Name="Original_JOB_CLS_CODE" Type="Decimal" />
            <asp:Parameter Name="Original_FILE_NUM" Type="String" />
            <asp:Parameter Name="Original_DEGREE_CODE" Type="Decimal" />
            <asp:Parameter Name="Original_REC_TYPE_CODE" Type="Decimal" />
            <asp:Parameter Name="Original_MARITAL_STATUS_CODE" Type="Decimal" />
            <asp:Parameter Name="Original_NATIONALITY_CODE" Type="Decimal" />
            <asp:Parameter Name="Original_GOVER_CODE" Type="Decimal" />
            <asp:Parameter Name="Original_EMP_VISA" Type="Boolean" />
            <asp:Parameter Name="Original_BANK_CODE" Type="Decimal" />
            <asp:Parameter Name="Original_AccountID" Type="Decimal" />
            <asp:Parameter Name="Original_NOTES" Type="String" />
            <asp:Parameter Name="Original_PassportNo" Type="String" />
            <asp:Parameter Name="Original_PassType" Type="String" />
            <asp:Parameter Name="Original_PassDate" Type="DateTime" />
            <asp:Parameter Name="Original_PassEndDate" Type="DateTime" />
            <asp:Parameter Name="Original_Passplace" Type="String" />
            <asp:Parameter Name="Original_SALARY" Type="Decimal" />
            <asp:Parameter Name="Original_Status" Type="Int32" />
            <asp:Parameter Name="Original_bankacc" Type="Int32" />
            <asp:Parameter Name="Original_BRANCH_CODE" Type="Int64" />
            <asp:Parameter Name="Original_SalesAdminFalg" Type="Boolean" />
            <asp:Parameter Name="Original_GroupId" Type="Int64" />
            <asp:Parameter Name="Original_ReligionId" Type="Int32" />
            <asp:Parameter Name="Original_EducationId" Type="Int32" />
            <asp:Parameter Name="Original_EducationMajored" Type="String" />
            <asp:Parameter Name="Original_EducationMajoredDate" Type="DateTime" />
            <asp:Parameter Name="Original_EducationMajoredYear" Type="Int32" />
            <asp:Parameter Name="Original_EducationMajoredPlace" Type="String" />
            <asp:Parameter Name="Original_LocationId" Type="Int32" />
            <asp:Parameter Name="Original_RegionId" Type="Int32" />
            <asp:Parameter Name="Original_DivisionId" Type="Int32" />
            <asp:Parameter Name="Original_GardeId" Type="Int32" />
            <asp:Parameter Name="Original_ResidenceId" Type="Int32" />
            <asp:Parameter Name="Original_ResidenceNo" Type="String" />
            <asp:Parameter Name="Original_ResidenceRemark" Type="String" />
            <asp:Parameter Name="Original_ResidenceIssueDate" Type="DateTime" />
            <asp:Parameter Name="Original_ResidenceEndDate" Type="DateTime" />
            <asp:Parameter Name="Original_LicenseNo" Type="String" />
            <asp:Parameter Name="Original_LicenseTypeId" Type="Int32" />
            <asp:Parameter Name="Original_LicenseIssueDate" Type="DateTime" />
            <asp:Parameter Name="Original_LicenseEndDate" Type="DateTime" />
            <asp:Parameter Name="Original_EMP_HEALTH_INS_DATE" Type="DateTime" />
            <asp:Parameter Name="Original_EMP_HEALTH_INS_NUM" Type="String" />
            <asp:Parameter Name="Original_JoiningDate" Type="DateTime" />
            <asp:Parameter Name="Original_SalaryType" Type="Int32" />
            <asp:Parameter Name="Original_ContractType" Type="Int32" />
            <asp:Parameter Name="Original_IndemnityDays" Type="Decimal" />
            <asp:Parameter Name="Original_VaccationDays" Type="Decimal" />
            <asp:Parameter Name="Original_Ticket" Type="Decimal" />
            <asp:Parameter Name="Original_WorkHourPerDay" Type="Decimal" />
            <asp:Parameter Name="Original_WorkDaysperMonth" Type="Decimal" />
            <asp:Parameter Name="Original_ADDRESS" Type="String" />
            <asp:Parameter Name="Original_BlockNo" Type="String" />
            <asp:Parameter Name="Original_Street" Type="String" />
            <asp:Parameter Name="Original_Floor" Type="String" />
            <asp:Parameter Name="Original_WorkTel" Type="String" />
            <asp:Parameter Name="Original_HomeTel" Type="String" />
            <asp:Parameter Name="Original_Mobile1" Type="String" />
            <asp:Parameter Name="Original_Mobile2" Type="String" />
            <asp:Parameter Name="Original_Fax" Type="String" />
            <asp:Parameter Name="Original_Email" Type="String" />
            <asp:Parameter Name="Original_bank" Type="Boolean" />
            <asp:Parameter Name="Original_BankFId" Type="Int32" />
            <asp:Parameter Name="Original_BankSId" Type="Int32" />
            <asp:Parameter Name="Original_BankFBranch" Type="String" />
            <asp:Parameter Name="Original_BankSBranch" Type="String" />
            <asp:Parameter Name="Original_BankFAccountNo" Type="String" />
            <asp:Parameter Name="Original_BankSAccountNo" Type="String" />
            <asp:Parameter Name="Original_DankEffDate" Type="DateTime" />
            <asp:Parameter Name="Original_JobLevel" Type="Int32" />
            <asp:Parameter Name="Original_ContactLocation" Type="String" />
            <asp:Parameter Name="Original_ContactLocationDate" Type="DateTime" />
            <asp:Parameter Name="Original_VacEarned" Type="Decimal" />
            <asp:Parameter Name="Original_VacTaken" Type="Decimal" />
            <asp:Parameter Name="Original_VacBalance" Type="Decimal" />
            <asp:Parameter Name="Original_VacUnpaid" Type="Decimal" />
            <asp:Parameter Name="Original_SALEADMIN" Type="Int32" />
            <asp:Parameter Name="Original_FullName" Type="String" />
            <asp:Parameter Name="Original_GetAllow" Type="Decimal" />
            <asp:Parameter Name="Original_PhoneAllow" Type="Decimal" />
            <asp:Parameter Name="Original_TransAllow" Type="Decimal" />
            <asp:Parameter Name="Original_InsuranceValue" Type="Decimal" />
            <asp:Parameter Name="Original_VisaNo" Type="String" />
            <asp:Parameter Name="Original_ComingDate" Type="DateTime" />
            <asp:Parameter Name="Original_WorkPNum1" Type="String" />
            <asp:Parameter Name="Original_WorkPNum2" Type="String" />
            <asp:Parameter Name="Original_WorkPNum3" Type="String" />
            <asp:Parameter Name="Original_FiName" Type="String" />
            <asp:Parameter Name="Original_FiEngName" Type="String" />
            <asp:Parameter Name="Original_BirthPlace" Type="String" />
            <asp:Parameter Name="Original_BloodType" Type="String" />
            <asp:Parameter Name="Original_HealthcardEndDate" Type="DateTime" />
            <asp:Parameter Name="Original_Doc1" Type="String" />
            <asp:Parameter Name="Original_Doc2" Type="String" />
            <asp:Parameter Name="Original_Doc3" Type="String" />
            <asp:Parameter Name="Original_Doc4" Type="String" />
            <asp:Parameter Name="Original_Doc5" Type="String" />
            <asp:Parameter Name="Original_Doc6" Type="String" />
            <asp:Parameter Name="Original_Doc7" Type="String" />
            <asp:Parameter Name="Original_Doc8" Type="String" />
            <asp:Parameter Name="Original_Doc9" Type="String" />
            <asp:Parameter Name="Original_Doc10" Type="String" />
            <asp:Parameter Name="Original_HouseType" Type="String" />
            <asp:Parameter Name="Original_flatNo" Type="String" />
            <asp:Parameter Name="Original_PassNat" Type="String" />
            <asp:Parameter Name="Original_gada" Type="String" />
            <asp:Parameter Name="Original_TasharNO" Type="String" />
            <asp:Parameter Name="Original_FFEngName" Type="String" />
            <asp:Parameter Name="Original_IBan" Type="String" />
            <asp:Parameter Name="Original_TITLEEng" Type="String" />
            <asp:Parameter Name="Original_CompMovId" Type="Int64" />
            <asp:Parameter Name="Original_PrevContactNo" Type="String" />
            <asp:Parameter Name="Original_PrevSalKd" Type="Decimal" />
            <asp:Parameter Name="Original_PrevSalFil" Type="Decimal" />
            <asp:Parameter Name="Original_PrevJob" Type="String" />
            <asp:Parameter Name="Original_PrevContractYear" Type="String" />
            <asp:Parameter Name="Original_LastIncreasedDate" Type="DateTime" />
            <asp:Parameter Name="Original_VacRepEmpId" Type="Int64" />
            <asp:Parameter Name="Original_OrgId" Type="Int32" />
            <asp:Parameter Name="Original_EnFullName" Type="String" />
            <asp:ControlParameter ControlID="txtid" Name="EMP_CODE" PropertyName="Text" Type="Int64" />
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

    <asp:TextBox ID="txtEmpFulName" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1"></asp:TextBox>
    
    <asp:TextBox ID="txtEmpFulEngName" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1"></asp:TextBox>
    
    <asp:TextBox ID="txtOrgId" runat="server" 
        Visible="False" meta:resourcekey="txtUserIdResource1"></asp:TextBox>
    
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
    <asp:ObjectDataSource ID="ObjectDataSourceEmpStatus" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="PersonalDataSetTableAdapters.EmpStatusTableAdapter">
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
    <asp:ObjectDataSource ID="ObjectDataSourceDept" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="PersonalDataSetTableAdapters.CDE_DEPTTableAdapter">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSourceDeptsNew" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="PersonalDataSetTableAdapters.CDE_LOCATIONTableAdapter">
    </asp:ObjectDataSource>
    </asp:Content>



