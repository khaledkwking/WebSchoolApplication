<%@ Page Title="" Language="C#" MasterPageFile="MasterPageMain.master" AutoEventWireup="true" Inherits="Admin_MainHR" Codebehind="MainHR.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <%-- <div class="bodyContainer">
        <div class="pageTitle">
            <div class="container">
                <div class="row">
                    <div class="col-12">         
                          <h1 style="  width: 100%; height:100%"> برنامج المثالى  </h1>
                    </div>
                </div>
            </div>
        </div>--%>
    <div class="container TexRight">
            <div class="row" style="text-align: center">
                <div class="col-12">
                    <div class="formContactUs">
                      <%--  <div class="form-group row">--%>

            
            <div class="w3-container w3-padding-64 w3-white w3-center">
             
               
                <h1 class="Titlepage" style="margin-bottom: 15px">المثالى لشئون الموظفين</h1>
                <div class="w3-row" >
                  <%--  --%>
   
                    <div class="w3-col s3">
                        <a href="../admin/App_OfferShops.aspx"><i class="fa fa-usd w3-text-blue w3-xxxlarge"></i></a>
                        <p class="inputTxt"> الرواتب الموظفين</p>
                    </div>
                    <div class="w3-col s3 ">
                        <a href="../admin/DisOfferDicountApplications.aspx"><i class="fa fa-edit w3-text-orange w3-xxxlarge" ></i></a>
                        <p class="inputTxt">متابعة الموظفـين</p>
                    </div>
                      <div class="w3-col s3">
                        <a href="../admin/EmpList.aspx"><i class="fa fa-users w3-text-cyan w3-xxxlarge"></i></a>
                        <p class="inputTxt"> بيانات الموظفين</p>
                    </div>
                    
                    <div class="w3-col s3">
                       
                        <a href="../admin/EmpAddData.aspx"><i class="fa fa-male w3-text-cyan w3-xxxlarge"></i></a>
                        <p class="inputTxt">أدخال موظف جديد</p>

                    </div>

                 
                </div>

                <div class="w3-row" style="margin-top: 40px">
                   
                       
                      <div class="w3-col s3">
                        <a href="../admin/CompaniesOfferApplications.aspx"><i class="fa fa-folder-open-o w3-text-cyan w3-xxxlarge"></i></a>
                        <p class="inputTxt">الشئـؤن والجـوزات</p>
                    </div>
                    
                     <div class="w3-col s3">
                        <a href="../admin/DisGeneralSaleApplications.aspx"><i class="fa fa-calendar-o w3-text-red w3-xxxlarge"></i></a>
                        <p class="inputTxt">نمـاذج اخـري متنوعه</p>
                    </div>

                   <div class="w3-col s3">
                        <a href="../admin/DisOfferDistribApplications.aspx"><i class="fa fa-car w3-text-green w3-xxxlarge"></i></a>
                        <p class="inputTxt">نماذج خاصة المرور</p>
                    </div>

                     <div class="w3-col s3">
                       
                        <a href="../admin/EmpData.aspx"><i class="fa fa-book w3-text-amber w3-xxxlarge"></i></a>
                        <p class="inputTxt">تقارير الموظفين</p>

                    </div>
                
                </div>
                <div class="w3-row" style="margin-top: 40px">
                   
                    <div class="w3-col s3">
                        <a href="../admin/App_OfferShopsList.aspx"><i class="fa fa-graduation-cap w3-text-blue w3-xxxlarge"></i></a>
                        <p class="inputTxt">تقرير العلاوات الموظفين</p>
                    </div>
                    <div class="w3-col s3">
                        <a href="../admin/DisOfferDicountApplicationsList.aspx"><i class="fa fa-get-pocket w3-text-red w3-xxxlarge"></i></a>
                        <p class="inputTxt">سلف الموظفـين</p>
                    </div>
                    <div class="w3-col s3">
                        <a href="../admin/CompanyMoneyAdvAppApplications.aspx"><i class="fa fa-user-times w3-text-cyan w3-xxxlarge"></i></a>
                        <p class="inputTxt">تقرير غياب الموظفـين</p>
                    </div>

                    <div class="w3-col s3">
                        <a href="DisOfferDistribShopApplications.aspx"><i class="fa  fa-scissors w3-text-yellow w3-xxxlarge"></i></a>
                        <p class="inputTxt">تقرير خصم الموظفين</p>
                    </div>
                    
                   
                </div>



            </div>
  
                       <%-- </div>--%>
                    </div>
                </div>
       </div>
         </div>
       <%--  </div>--%>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    
    
    
</asp:Content>
