<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageMain.master" AutoEventWireup="true" Inherits="Admin_BranchList" Codebehind="BranchList.aspx.cs" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="bodyContainer">
        <div class="pageTitle">
            <div class=" container">
                <div class="row">
                    <div class="col-12">         
                          <h1 style="height: 50px;">عرض بيانات الافراع </h1>
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
        DataSourceID="ObjectDataSourceBranch" Width="100%"  ForeColor="#333333" GridLines="None"  AllowPaging="True" AllowSorting="True" DataKeyNames="BRANCHCODE" PageSize="25"  Font-Size="Medium" OnRowCommand="GridView1_RowCommand">
        <FooterStyle BackColor="#507CD1" ForeColor="White"  />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1"  ForeColor="#333333" />
        <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#2461BF" />
        <HeaderStyle BackColor="#507CD1"  ForeColor="White" />
        <Columns>
            <asp:BoundField DataField="BRANCHCODE" HeaderText="الكود" InsertVisible="False" ReadOnly="True" SortExpression="BRANCHCODE" />
            <asp:BoundField DataField="BRANCHNAME" HeaderText="أسم الفرع" SortExpression="BRANCHNAME" />
            <asp:BoundField DataField="CompanyName" HeaderText="الاسم الانجليزي" SortExpression="CompanyName" />
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" Visible="False" />
            <asp:BoundField DataField="HintName" HeaderText="HintName" SortExpression="HintName" Visible="False" />
            <asp:BoundField DataField="SalInvSerial" HeaderText="SalInvSerial" SortExpression="SalInvSerial" Visible="False" />
            <asp:BoundField DataField="PurchInvSerial" HeaderText="PurchInvSerial" SortExpression="PurchInvSerial" Visible="False" />
            <asp:BoundField DataField="InvOrderSerial" HeaderText="InvOrderSerial" SortExpression="InvOrderSerial" Visible="False" />
            <asp:BoundField DataField="OrderSerial" HeaderText="OrderSerial" SortExpression="OrderSerial" Visible="False" />
            <asp:BoundField DataField="MovementSerial" HeaderText="MovementSerial" SortExpression="MovementSerial" Visible="False" />
            <asp:BoundField DataField="salesaccid" HeaderText="salesaccid" SortExpression="salesaccid" Visible="False" />
            <asp:BoundField DataField="purchaseaccid" HeaderText="purchaseaccid" SortExpression="purchaseaccid" Visible="False" />
            <asp:BoundField DataField="boxaccid" HeaderText="boxaccid" SortExpression="boxaccid" Visible="False" />
            <asp:BoundField DataField="bankaccid" HeaderText="bankaccid" SortExpression="bankaccid" Visible="False" />
            <asp:BoundField DataField="Visaaccid" HeaderText="Visaaccid" SortExpression="Visaaccid" Visible="False" />
            <asp:BoundField DataField="Masteraccid" HeaderText="Masteraccid" SortExpression="Masteraccid" Visible="False" />
            <asp:BoundField DataField="KeyNetaccid" HeaderText="KeyNetaccid" SortExpression="KeyNetaccid" Visible="False" />
            <asp:BoundField DataField="Otheraccid" HeaderText="Otheraccid" SortExpression="Otheraccid" Visible="False" />
            <asp:BoundField DataField="VisaComaccid" HeaderText="VisaComaccid" SortExpression="VisaComaccid" Visible="False" />
            <asp:BoundField DataField="MasterComaccid" HeaderText="MasterComaccid" SortExpression="MasterComaccid" Visible="False" />
            <asp:BoundField DataField="KeyNetComaccid" HeaderText="KeyNetComaccid" SortExpression="KeyNetComaccid" Visible="False" />
            <asp:BoundField DataField="OtherComaccid" HeaderText="OtherComaccid" SortExpression="OtherComaccid" Visible="False" />
            <asp:BoundField DataField="salesAgalaccid" HeaderText="salesAgalaccid" SortExpression="salesAgalaccid" Visible="False" />
            <asp:BoundField DataField="purchaseAgalaaccid" HeaderText="purchaseAgalaaccid" SortExpression="purchaseAgalaaccid" Visible="False" />
            <asp:BoundField DataField="OwnerName" HeaderText="OwnerName" SortExpression="OwnerName" Visible="False" />
            <asp:BoundField DataField="OwnerNat" HeaderText="OwnerNat" SortExpression="OwnerNat" Visible="False" />
            <asp:BoundField DataField="BlockNo" HeaderText="BlockNo" SortExpression="BlockNo" Visible="False" />
            <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area" Visible="False" />
            <asp:BoundField DataField="GovId" HeaderText="GovId" SortExpression="GovId" Visible="False" />
            <asp:BoundField DataField="Gada" HeaderText="Gada" SortExpression="Gada" Visible="False" />
            <asp:BoundField DataField="HouseType" HeaderText="HouseType" SortExpression="HouseType" Visible="False" />
            <asp:BoundField DataField="Floor" HeaderText="Floor" SortExpression="Floor" Visible="False" />
            <asp:BoundField DataField="FlatNo" HeaderText="FlatNo" SortExpression="FlatNo" Visible="False" />
            <asp:BoundField DataField="Street" HeaderText="Street" SortExpression="Street" Visible="False" />
            <asp:BoundField DataField="MailSign" HeaderText="MailSign" SortExpression="MailSign" Visible="False" />
            <asp:BoundField DataField="MailBox" HeaderText="MailBox" SortExpression="MailBox" Visible="False" />
            <asp:BoundField DataField="SignatureOwner" HeaderText="SignatureOwner" SortExpression="SignatureOwner" Visible="False" />
            <asp:BoundField DataField="FileNo" HeaderText="FileNo" SortExpression="FileNo" Visible="False" />
            <asp:BoundField DataField="CommerName" HeaderText="CommerName" SortExpression="CommerName" Visible="False" />
            <asp:BoundField DataField="CommerRecord" HeaderText="CommerRecord" SortExpression="CommerRecord" Visible="False" />
            <asp:BoundField DataField="CivilId" HeaderText="CivilId" SortExpression="CivilId" Visible="False" />
            <asp:BoundField DataField="uinNum" HeaderText="uinNum" SortExpression="uinNum" Visible="False" />
            <asp:BoundField DataField="ActivityEng" HeaderText="ActivityEng" SortExpression="ActivityEng" Visible="False" />
            <asp:BoundField DataField="CompanyNameEng" HeaderText="CompanyNameEng" SortExpression="CompanyNameEng" Visible="False" />
            <asp:BoundField DataField="SignatureOwnerEng" HeaderText="SignatureOwnerEng" SortExpression="SignatureOwnerEng" Visible="False" />
            <asp:BoundField DataField="ContractNo" HeaderText="ContractNo" SortExpression="ContractNo" Visible="False" />
            <asp:BoundField DataField="LawNo" HeaderText="LawNo" SortExpression="LawNo" Visible="False" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" Visible="False" />
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
          </div>
    
    
    <asp:ObjectDataSource ID="ObjectDataSourceBranch" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByOrgId"
        TypeName="PersonalDataSetTableAdapters.BRANCHESTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_BRANCHCODE" Type="Int64" />
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
            <asp:Parameter Name="CivilId" Type="String" />
            <asp:Parameter Name="uinNum" Type="String" />
            <asp:Parameter Name="ActivityEng" Type="String" />
            <asp:Parameter Name="CompanyNameEng" Type="String" />
            <asp:Parameter Name="SignatureOwnerEng" Type="String" />
            <asp:Parameter Name="ContractNo" Type="String" />
            <asp:Parameter Name="LawNo" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="OrgId" Type="Int64" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtOrgId" Name="OrgId" PropertyName="Text" Type="Int64" />
        </SelectParameters>
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
            <asp:Parameter Name="CivilId" Type="String" />
            <asp:Parameter Name="uinNum" Type="String" />
            <asp:Parameter Name="ActivityEng" Type="String" />
            <asp:Parameter Name="CompanyNameEng" Type="String" />
            <asp:Parameter Name="SignatureOwnerEng" Type="String" />
            <asp:Parameter Name="ContractNo" Type="String" />
            <asp:Parameter Name="LawNo" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="OrgId" Type="Int64" />
            <asp:Parameter Name="Original_BRANCHCODE" Type="Int64" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:TextBox ID="txtid" runat="server" Visible="False"  ></asp:TextBox>
    
    <asp:TextBox ID="txtOrgId" runat="server" Visible="False"  ></asp:TextBox>
    
    </asp:Content>


<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
   
</asp:Content>



