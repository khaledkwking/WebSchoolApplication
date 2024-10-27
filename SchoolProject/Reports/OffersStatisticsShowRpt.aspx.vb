Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared
Imports CrystalDecisions.Web
'Imports G.Globals
Partial Class OffersStatisticsShowRpt
    Inherits System.Web.UI.Page



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CrystalReportSource1.ReportDocument.SetDatabaseLogon("sa", "sa", "KHALED\SQLEXPRESS", "HRWEBDB")
        Dim arg As New DataSourceSelectArguments
        Dim Empd As New PersonalDataSetTableAdapters.EmpViewTableAdapter
        Dim EmpDs As New PersonalDataSet

        Dim rpt As New ReportDocument()
        rpt.Load(Server.MapPath("PerEmpDataRpt.rpt"))

        Empd.Fill(EmpDs.EmpView)
        rpt.SetDataSource(EmpDs)
        CrystalReportViewer1.ReportSource = rpt


        'pER_EMPLOYEE_DATATableAdapter.FillByEmpCode(personalDataSet.PER_EMPLOYEE_DATA, null, FName, SName, TName, FoName, Empcode, Title, Gender, CurCivilId, PassFromDate, PassToDate, ResidenceFromDate, ResidenceToDate, BranchId, HireFromDate, HireToDate, locationId, DeptCode, SALARYFrom, SALARYTo, AclSALARYFrom, AclSALARYTo, StatusId);
        CrystalReportViewer1.Visible = True
        'rpt111.SetDataSource(personalDataSet);
        'crystalReportViewer1.ReportSource = rpt111;

        'Dim v As Data.DataView = ObjectDataSourceGetAppByYearMonth.Select()

   
        'ObjectDataSourceEmp.DataBind()
        'Dim v2 As Data.DataView = SqlDataSourceComp.Select(arg)
        'Dim v3 As Data.DataView = SqlDataSourceMonth.Select(arg)
        'If (v.Count) Then


        '    'txtRemoveImportAmountMed.Text = v.Table.Rows(0)("RemoveImportAmountMed").ToString()
        '    'txtRemoveImportAmountHealth.Text = v.Table.Rows(0)("RemoveImportAmountHealth").ToString()

        'Else
        '    'txtDeathNumLife.Text = 0
        '    'txtDeathNumPension.Text = 0



        'End If

        'Catch ex As Exception
        '    Dim i As Integer
        '    i = 98
        '    Dim s As String = ex.ToString()
        'End Try

        Dim cookieFromDate As HttpCookie
        'cookieFromDate = HttpContext.Current.Request.Cookies.Get("FromDate")
        'If Not cookieFromDate Is Nothing Then
        '    txtFromDate.Text = cookieFromDate.Value
        'End If

        'Dim cookieToDate As HttpCookie
        'cookieToDate = HttpContext.Current.Request.Cookies.Get("ToDate")
        'If Not cookieToDate Is Nothing Then
        '    txtOrgId.Text = cookieToDate.Value
        'End If

        'Dim cookieName As HttpCookie
        'cookieName = HttpContext.Current.Request.Cookies.Get("Name")
        'If Not cookieName Is Nothing Then
        '    txtUserSign.Text = cookieName.Value
        'End If


    End Sub
End Class
