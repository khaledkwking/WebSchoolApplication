using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using WebSchool.NEWERPDataSetTableAdapters;
using WebSchool;

/// <summary>
/// Summary description for Globals
/// </summary>

    public class StaticList : System.Collections.Hashtable
    {
        private DataTable _DataTable;

        public StaticList(string[,] strArr)
        {
            if (strArr.GetLength(1) != 2) return;

            _DataTable = new DataTable();
            _DataTable.Columns.Add("ID", typeof(string));
            _DataTable.Columns.Add("Desc", typeof(string));

            for (int i = strArr.GetLowerBound(0); i <= strArr.GetUpperBound(0); i++)
            {
                try
                {
                    this.Add(strArr[i, 0], strArr[i, 1]);
                    _DataTable.Rows.Add(new object[] { strArr[i, 0], strArr[i, 1] });
                }
                catch { }
            }
        }

        public DataTable ToDataTable()
        {
            return _DataTable;
        }
    }

    public class GLibrary
    {
        public static string[,] strarrPssportType = new string[,] { { "1", "��� ���" }, { "2", "��� ����" }, { "3", "�������" }, { "4", "��� ����" } };
        public static string[,] strarrFormsTypes = new string[,] { { "1", "�����" }, { "2", "�����" }, { "3", "�����" }, { "4", "�����" }, { "5", "����� �����" }, { "6", "��� �����" }, { "7", "�����" } };

        public static string[,] strarrLicenseTypes = new string[,] { { "1", "����" }, { "2", "����" } };
        public static string[,] strarrContractType = new string[,] { { "1", "����" }, { "2", "����" } };
        public static string[,] strarrStatusType = new string[,] { { "1", "���� ��� ������" }, { "2", "�����" }, { "2", "������" } };
        public static string[,] strarrReligionTypes = new string[,] { { "1", "����" }, { "2", "�����" } };

        public static string[,] strarrGetTypes = new string[,] { { "1", "������ �������" }, { "2", "������� ������" }, { "3", "��� ���" } };
        public static string[,] strarrOffersTypes = new string[,] { { "1", "�����" }, { "2", "����� ���� ����" }, { "3", "��� �����" } };
        public static string[,] strarrPriceRules = new string[,] { { "1", "�����" }, { "2", "������" } };
        public static string[,] strarrItemSorted = new string[,] { { "1", "���� �����" }, { "2", "��� �����" }, { "3", "��� �����" } };

        public static string[,] strarrBillType = new string[,] { { "1", "���" }, { "2", "����" }, { "3", "�����" } };
        public static string[,] strarrBillTypeEng = new string[,] { { "1", "Credit" }, { "2", "Cash" }, { "3", "Admeasure" } };

        public static string[,] strarrPaymentTypes = new string[,] { { "1", "����" }, { "2", "������" }, { "3", "����" } };

        public static string[,] strarrAccountTypes = new string[,] { { "1", "����" }, { "3", "����" }, { "4", "����" }, { "5", "����" }, { "6", "�����" } };
        public static string[,] strarrEngAccountTypes = new string[,] { { "1", "Account" }, { "3", "Customer" }, { "4", "Supplier" }, { "5", "Employee" }, { "6", "Commisser" } };

        public static string[,] strarrQidTypes = new string[,] { { "1", "����" }, { "2", "����" }, { "3", "������ ������" }, { "4", "������ �������" }, { "5", "����" }, { "6", "���" }, { "7", "���" }, { "8", "������� ��������" }, { "9", "������� ���������" }, { "10", "�����" }, { "11", "�������" }, { "12", "����" } };
        public static string[,] strarrRefBalanceTypes = new string[,] { { "1", "�����" }, { "2", "������" }, { "3", "������ ������" } };

        public static string[,] strarrGenderTypes = new string[,] { { "1", "���" }, { "2", "����" } };
        public static string[,] strarrMalStatusType = new string[,] { { "1", "�����" }, { "2", "�����" }, { "3", "����" } };


        public static string[,] strarrInterfaceType = new string[,] { { "1", "Arabic" }, { "2", "English" } };

        public static string[,] strarrInvType = new string[,] { { "1", "�������" }, { "2", "������" } };

        public static string[,] strarrProductTypes = new string[,] { { "1", "�����" }, { "2", "�����" }, { "3", "����" }, { "4", "������" } };

        public static string[,] strarrAttendanceType = new string[,] { { "1", "��� �����" }, { "2", "��� ���" }, { "3", "������" }, { "3", "��� ����" } };
        public static string[,] strarrCalSalaryType = new string[,] { { "1", "��� ������" }, { "2", "��� �������� �� �����" } };

        public static Boolean IsDate(string anyString)
        {
            if (anyString == null)
            {
                anyString = "";
            }
            if (anyString.Length > 0)
            {
                DateTime dummyOut;
                return DateTime.TryParse(anyString, out dummyOut);
            }
            else
            {
                return false;
            }
        }
        public static Boolean IsNumeric(string anyString)
        {
            if (anyString == null)
            {
                anyString = "";
            }
            if (anyString.Length > 0)
            {
                double dummyOut = new Double();
                System.Globalization.CultureInfo cultureInfo = new System.Globalization.CultureInfo("en-US", true);
                return Double.TryParse(anyString, System.Globalization.NumberStyles.Any, cultureInfo.NumberFormat, out dummyOut);
            }
            else
            {
                return false;
            }
        }




        //Function ValidatetxtBox(ByVal ErrorProvider1 As ErrorProvider, ByVal txtboxCntrl As TextBox, ByVal msg As String, ByVal title As String, ByVal force As Boolean) As Boolean
        //    If txtboxCntrl.Text.Length = 0 Then
        //        ErrorProvider1.SetError(txtboxCntrl, msg)
        //        If force Then
        //            MessageBox.Show(msg, title, MessageBoxButtons.OK, MessageBoxIcon.Warning)
        //        End If
        //        Return False
        //    Else
        //        ErrorProvider1.SetError(txtboxCntrl, String.Empty)
        //        Return True
        //    End If
        //End Function



        public static string FigureInWordsNumType(double Num, int QtyTyp)
        {
            string functionReturnValue = null;

            //ERPSYS.NEWERPDataSetTableAdapters.FIGURESTableAdapter FIGURESTableAdapter = new ERPSYS.NEWERPDataSetTableAdapters.FIGURESTableAdapter();
            //ERPSYS.NEWERPDataSet IntrentDataSet;
            ////Public CustBindingSource As System.Windows.Forms.BindingSource 
            //ERPSYS.NEWERPDataSet.FIGURESDataTable objFigures = new ERPSYS.NEWERPDataSet.FIGURESDataTable();
            //FIGURESTableAdapter.Fill(objFigures);
            //ERPSYS.NEWERPDataSet.FIGURESRow FiguresRow;

            FIGURESTableAdapter FIGURESTableAdapter = new FIGURESTableAdapter();
            NEWERPDataSet IntrentDataSet;
            //Public CustBindingSource As System.Windows.Forms.BindingSource 
            NEWERPDataSet.FIGURESDataTable objFigures = new NEWERPDataSet.FIGURESDataTable();
            FIGURESTableAdapter.Fill(objFigures);
            NEWERPDataSet.FIGURESRow FiguresRow;
            string Wa;
            string Wa2;
            string NumStr;
            string NumTxT;
            string GroupTxT = "";
            string HundredTxt;
            string TenUnitTxt;
            string QtyTxt1 = "";
            int GroupCtr;
            int GroupNum;
            int SubGroupNum;
            int HundredNum = 0;
            int TenUnitNum = 0;
            int StartPos;

            //Static MyDB As Database, MyRecordset As Recordset 
            //MyDB = DBEngine.Workspaces(0).Databases(0) 
            //MyRecordset = MyDB.OpenRecordset("Figures", DB_OPEN_TABLE) 
            //MyRecordset.Index = "PrimaryKey" 

            //**297************************************************ 
            //Select Case QtyTyp 
            // Case Is = 1 
            // QtyTxt1 = " ����� " 
            // QtyTxt2 = " ������� " 
            // QtyTxt3 = " ������ " 
            // QtyTxt4 = "���� �� ���� �������" 
            // Case Is = 2 
            // QtyTxt1 = " ��� ����� " 
            // QtyTxt2 = " ����� ����� " 
            // QtyTxt3 = " ����� ����� " 
            // QtyTxt4 = "���� �� ���� �� �������" 
            // Case Is = 3 
            // QtyTxt1 = " �� ���� " 
            // QtyTxt2 = " ���� ���� " 
            // QtyTxt3 = " ����� ���� " 
            // QtyTxt4 = "���� �� ���� �� ������" 
            // Case Is = 4 
            // QtyTxt1 = " ������ ����� " 
            // QtyTxt2 = " �������� ������� " 
            // QtyTxt3 = " ����� ���� " 
            // QtyTxt4 = "���� �� ���� �� ������� ������" 
            //End Select 
            //**297************************************************297** 
            //objFigures.LoadAll() 
            Wa = "";
            Wa2 = "";
            NumTxT = "";
            NumStr = String.Format("{0:+000,000,000,000.000}", Num);
            StartPos = 1;


            for (GroupCtr = 1; GroupCtr <= 5; GroupCtr++)
            {
                mark:
                GroupNum = Convert.ToInt32(NumStr.Substring(StartPos, 3));
                SubGroupNum = Convert.ToInt32(NumStr.Substring(StartPos + 1, 2));
                HundredNum = Convert.ToInt32(NumStr.Substring(StartPos, 1) + "00");
                TenUnitNum = Convert.ToInt32(NumStr.Substring(StartPos + 1, 2));
                TenUnitTxt = "";
                HundredTxt = "";
                StartPos = StartPos + 4;
                if (GroupNum == 0)
                {
                    GroupCtr++;
                    if (GroupCtr > 5) break;
                    //return GroupCtr;
                    goto mark;

                    //goto NextGroupCtr; 
                }
                switch (GroupNum)
                {
                    // Select Case SubGroupNum 
                    case 1: // ERROR: Case labels with binary operators are unsupported : Equality 1: 
                        switch (GroupCtr)
                        {
                            case 1:
                                GroupTxT = " ����� ";
                                break;
                            case 2:// ERROR: Case labels with binary operators are unsupported : Equality 2: 
                                GroupTxT = " ����� ";
                                break;
                            case 3: // ERROR: Case labels with binary operators are unsupported : Equality 3: 
                                GroupTxT = " ��� ";
                                break;
                            case 4:// ERROR: Case labels with binary operators are unsupported : Equality 4: 
                                GroupTxT = "����";
                                break;
                            case 5:// ERROR: Case labels with binary operators are unsupported : Equality 5: 
                                break;
                                // GroupTxT = " ��� ";
                        }
                        goto BuildText;
                        break;
                    case 2:// ERROR: Case labels with binary operators are unsupported : Equality 2: 
                        switch (GroupCtr)
                        {
                            case 1:// ERROR: Case labels with binary operators are unsupported : Equality 1: 
                                GroupTxT = " ������� ";
                                break;
                            case 2:// ERROR: Case labels with binary operators are unsupported : Equality 2: 
                                GroupTxT = " ������� ";
                                break;
                            case 3:// ERROR: Case labels with binary operators are unsupported : Equality 3: 
                                GroupTxT = " ����� ";
                                break;
                            case 4:// ERROR: Case labels with binary operators are unsupported : Equality 4: 
                                GroupTxT = "����� ";
                                break;
                            case 5:// ERROR: Case labels with binary operators are unsupported : Equality 5: 
                                break;
                                // GroupTxT = " ��� " 
                        }
                        goto BuildText;
                        break;
                }

                //297 If GroupNum > 2 And GroupNum < 11 Then 
                if (SubGroupNum > 2 & SubGroupNum < 11)
                {
                    switch (GroupCtr)
                    {
                        case 1:// ERROR: Case labels with binary operators are unsupported : Equality 1: 
                            GroupTxT = " ������ ";
                            break;
                        case 2:// ERROR: Case labels with binary operators are unsupported : Equality 2: 
                            GroupTxT = " ������ ";
                            break;
                        case 3:// ERROR: Case labels with binary operators are unsupported : Equality 3: 
                            GroupTxT = " ���� ";
                            break;
                        case 4:// ERROR: Case labels with binary operators are unsupported : Equality 4: 
                            break;
                        //297 GroupTxT = QtyTxt3 
                        case 5:// ERROR: Case labels with binary operators are unsupported : Equality 5: 
                            break;
                            // GroupTxT = " ��� " 
                    }
                }
                else
                {
                    switch (GroupCtr)
                    {
                        case 1:// ERROR: Case labels with binary operators are unsupported : Equality 1: 
                            GroupTxT = " ����� ";
                            break;
                        case 2:// ERROR: Case labels with binary operators are unsupported : Equality 2: 
                            GroupTxT = " ����� ";
                            break;
                        case 3:// ERROR: Case labels with binary operators are unsupported : Equality 3: 
                            GroupTxT = " ��� ";
                            break;
                        case 4:// ERROR: Case labels with binary operators are unsupported : Equality 4: 
                            break;
                        //297 GroupTxT = QtyTxt1 
                        case 5:// ERROR: Case labels with binary operators are unsupported : Equality 5: 
                            break;
                            // GroupTxT = " ��� " 
                    }
                }
                if (TenUnitNum > 0)
                {
                    FiguresRow = objFigures.FindByFigure(short.Parse(TenUnitNum.ToString()));
                    //objFigures.Filter = "Figure=" & TenUnitNum 
                    //MyRecordset.Seek("=", TenUnitNum) 
                    //If MyRecordset.NoMatch Then 
                    if (FiguresRow == null)
                    {
                        TenUnitTxt = "***ERROR***";
                    }
                    else
                    {
                        TenUnitTxt = FiguresRow.FigureInWords;
                    }
                }
                //objFigures.Filter = "" 

                if (HundredNum > 0)
                {
                    FiguresRow = objFigures.FindByFigure(short.Parse(HundredNum.ToString()));
                    //objFigures.Filter = "Figure=" & HundredNum 
                    //MyRecordset.Seek("=", HundredNum) 
                    //If MyRecordset.NoMatch Then 
                    if (FiguresRow == null)
                    {
                        HundredTxt = "***ERROR***";
                    }
                    else
                    {
                        HundredTxt = FiguresRow.FigureInWords;
                    }
                }
                BuildText:

                if (TenUnitNum > 0 & HundredNum > 0)
                {
                    Wa2 = " � ";
                }
                else
                {
                    Wa2 = " ";
                }

                NumTxT = NumTxT + Wa + HundredTxt + Wa2 + TenUnitTxt + " " + GroupTxT;
                //if (HundredNum > 0)

                Wa = "����� ����� �  ";

                GroupTxT = "";

                //NextGroupCtr: 

            }
            //MyRecordset.Close() 

            if (NumTxT == " ")
            {
                switch (QtyTyp)
                {
                    case 1:// ERROR: Case labels with binary operators are unsupported : Equality 1: 
                        QtyTxt1 = "���� �� ���� �������";
                        break;
                    case 2:// ERROR: Case labels with binary operators are unsupported : Equality 2: 
                        QtyTxt1 = "���� �� ���� �� �������";
                        break;
                    case 3:// ERROR: Case labels with binary operators are unsupported : Equality 3: 
                        QtyTxt1 = "���� �� ���� �� ������";
                        break;
                    case 4:// ERROR: Case labels with binary operators are unsupported : Equality 4: 
                        QtyTxt1 = "���� �� ���� �� ������� ������";
                        break;
                }
                functionReturnValue = NumTxT + QtyTxt1;
            }
            else
            {
                if (HundredNum > 0 || TenUnitNum > 0)
                {
                    Wa2 = " ���";
                }
                else
                {
                    Wa2 = " ����� �����";

                }
                NumTxT = NumTxT + Wa2;
                switch (QtyTyp)
                {
                    case 1:// ERROR: Case labels with binary operators are unsupported : Equality 1: 
                        QtyTxt1 = "  ��� �����"; //" ����� ����� ��� �����";
                        break;
                    case 2:// ERROR: Case labels with binary operators are unsupported : Equality 2: 
                        QtyTxt1 = " ��� ����� ��� �����";
                        break;
                    case 3:// ERROR: Case labels with binary operators are unsupported : Equality 3: 
                        QtyTxt1 = " �� ���� ��� �����";
                        break;
                    case 4:// ERROR: Case labels with binary operators are unsupported : Equality 4: 
                        QtyTxt1 = " ����� ���� ��� �����";
                        break;
                }
                functionReturnValue = NumTxT + QtyTxt1;
            }
            return functionReturnValue;

        }


    
    }
    public class Messages
    {
        //Accounts
        public static Boolean[] SalInvPrim = new Boolean[5] { true, true, true, true, true };
        public static Boolean[] PurInvPrim = new Boolean[5] { true, true, true, true, true };

        public static Boolean[] SalQidPrim = new Boolean[5] { true, true, true, true, true };
        public static Boolean[] SalQidInPrim = new Boolean[5] { true, true, true, true, true };
        public static Boolean[] SalQidOutPrim = new Boolean[5] { true, true, true, true, true };

        public static int MovmentProfitsAccid;
        public static int BalanceAccid = 4;
        public static int ProfitAccid = 2;
        public static int CommercingAccid = 2;
        public static int Osoalaccid = 5;
        public static int Khosomaccid = 134;

        public static int Budgetaccid = 4;
        public static int BoxValue = 1;
        public static int BankValue = 2;
        public static int KeyNetValue = 3;

        public static int boxAccid; // ���� �������
        public static int bankaccid;// ���� �����
        public static int custaccid;
        public static int suppaccid;
        public static int salesaccid;
        public static int salesAgalaccid;
        public static int purchaseaccid;
        public static int purchaseAgalaccid;

        public static int Discountaccid;
        public static int PurReorderaccid;
        public static int SalReorderaccid;
        public static int PurReorderAgalaccid;
        public static int SalReorderAgalaccid;
        public static int Paymentsaccid;

        public static int MainPurchaseaccid;
        public static int MainSalesAccid;

        public static int purchasePayaccid;
        public static int ProfitLossAccId = 2;
        public static int OsalAccId;
        public static int DeductAccId;

        public static int Visaaccid;
        public static int Masteraccid;
        public static int KeyNetaccid;
        public static int Otheraccid;

        public static int VisaComaccid;
        public static int MasterComaccid;
        public static int KeyNetComaccid;
        public static int OtherComaccid;

        public static int PosBoxaccid;
        public static int PosBankaccid;
        public static int PosSalesaccid;
        public static int PosPruchaseaccid;
        public static int PosAgalaccid;
        public static int PosPurAgalaccid;
        public static int SalesTakastaccid;

        //System Codes
        public static string BasicDBName = "NEWERP";
        public static string SysSupCode;
        public static string SysCustCode;
        public static string SysinvSaleCode;
        public static string SysInvpurchasesCode;
        public static string SysStoresCode;
        public static string SysACCountCode;
        public static string SysQid;
        public static string SysQidIn;
        public static string SysQidOut;
        public static string BranchCode;
        public static string CurLang = "";

        public static string CurUser = "";
        public static string CurUserId = "";
        public static string CurBranch = "";
        public static string CurBranchName = "";

        public static int Usertype = 0;
        public static string BackGround = "";
        public static readonly string SupFlag = "1";
        public static readonly string CustFlag = "2";
        public static readonly string CustSupFlag = "3";

        public const int InvpurchasesFlag = 1;
        public const int InvSalesFlag = 2;

        public static readonly string qidTypeId = "1";
        public static readonly string qidOutTypeId = "2";
        public static readonly string qidInTypeId = "3";
        public static string InterfaceType = "1";
        public static int DayHours = 8;
        public static int AdminUser = 1;
        public static int DayInYear = 365;


        public static int AccountFlag = 0;
        public static int ProductFlag = 0;
        public static int StockFlag = 0;
        public static int CostcenterFlag = 0;

        public static readonly string ClickToAdd = "���� �������";
        public static readonly string stringClickToGoBack = "���� ������";
        //Add, Edit
        public static readonly string ClickToSave = "���� ���� ������";
        public static readonly string ClickToCancelAdd = "���� ������ ����� �������";
        //Edit
        public static readonly string ClickToDelete = "���� ���� ������";
        public static readonly string ClickToCancelEdit = "���� ������ ����� �������";

        //'------------ Error --------------------------------------------------------
        public static readonly string ErrRowAlreadyExists = "��� ������ ���� �� ���";
        public static readonly string ErrUnableToLoadData = "�� ��� ������ ��� ������";
        public static readonly string printFound = "�� ����� ��� ��������� �� ���";
        // '------------- Info --------------------------------------------------------
        public static readonly string CheckInvPrintMsg = "�� ���� ���� �������� ��� ������ �������";

        public static readonly string CheckProdcutAddMsg = "����� ��� ����� �� ���� ����� �����";
        public static readonly string CheckProdcutCodeMsg = "����� ��� ����� ";
        public static readonly string CustNotFoundMsg = "��� ������ ��� ����� �� ���� ������";

        public static readonly string CheckDel = "�� ���� �����";
        public static readonly string CheckDelE = "Do you want to Delete";

        public static readonly string CheckTotVaule = " ������ �������� �� ����� ������ ������ ������� ";
        public static readonly string CheckTotVauleE = "Value Error";


        public static readonly string CheckSaveMsg = "�� ���� �����";
        public static readonly string CheckSaveMsgE = "Do you want to save";

        public static readonly string CheckCancelMsg = "�� ���� ����� ���������";
        public static readonly string CheckCancelMsgE = "Do you cancel Information";

        public static readonly string SaveMesg = "�� ����� �����";
        public static readonly string SaveMesgE = "Saving Success";

        public static readonly string ConfirmSaveMesg = "�� ���� �����";
        public static readonly string ConfirmExitMesg = "�� ���� ���� ��������";

        public static readonly string ConfirmSaveMesgE = "Do you want to Save";

        public static readonly string TabSaveMesg = "�� ���� ���� �������� ��������";
        public static readonly string TabProductMesg = "�� ���� ������� �� ��� �����";
        public static readonly string ErrorSaveMesg = "���� ��� �� �������� ���� ��� �����";
        public static readonly string ErrorDelMesg = "�� ���� ��� ��� ������ ������ ������ ������ ��";
        public static readonly string CemenetDateCheck = " ���� ����� ����� ������� ������ �������� ���� ��� ������ �����";
        public static readonly string CatCodeCheck = " ���� ��� ����� ����� ����";
        public static readonly string CatDescCheck = " ���� ��� ����� ����� ����";
        public static readonly string ChangeTypeMessage = " �� ���� ���� ��� ������ ��� ��� ����� ";
        public static readonly string AccSearchMessage = " ��� ������ ��� ����� ";
        public static readonly string QidNotBalanceMesg = "����� ����� ��� ������� ";
        public static readonly string QidEmptyMesg = "��� ��� ����";
        public static readonly string NoAccountMesg = "�� ���� ���� ������ ";
        public static readonly string NoToValueMesg = "���� ������ ������� ������ ����� ";
        public static readonly string NoFromValueMesg = "���� ������ �������� ������ ����� ";
        public static readonly string ProductInvMesg = "���� ������� �������� ";
        public static readonly string StockQtyMesg = "������ �������� �� ������ ��� �� �������";
        public static readonly string StockNullQtyMesg = "���� ������ ��������";

        public static readonly string MinPriceMesg = "��� ����� ��� �� ��� ��� �����";
        public static readonly string EmpSaveMesg = "��� ����� ������ ����";
        public static readonly string InvaildInvMesg = "��� ������ ����� ��� ���� �����";
        public static readonly string InvaildDataInvMesg = "���� ������ �������� ������ �����";
        public static readonly string InvNotfoundMesg = "��� �������� ��� ������";
        public static readonly string QidNotfoundMesg = "��� ����� ��� ������";
        public static readonly string QidNotBankfoundMesg = "���� ���� �����";
        public static readonly string EmpNotfoundMesg = "��� ��� ������ ��� ������";

        public static readonly string CheckDate = "���� ������� ������ �����";
        public static readonly string ProductLevelMesg = "������ ����� ��� ���� ��� ��� �����";
        public static readonly string EnterCustomerMesg = "���� ������ ������ �����";
        public static readonly string EnterAccountMesg = "���� ������ ������ �����";
        public static readonly string ProductUnitsMesg = "���� ����� �����";
        public static readonly string codeErrorMesg = "��� ����� ����� �� ���";
        public static readonly string AccountProcessErrorMesg = "������ ��� ��� ������ ���� �� ����� ����";
        public static readonly string ProductProcessErrorMesg = "������ ��� ��� ����� ���� ����� ��������� ���� ����� ��� ��� ��� ��� �������� �� ���� ���� ������� ������ ��";

        public static readonly string AccountErrorMesg = " ������ ��� ��� ������ ���� ������ ����� ����";
        public static readonly string ProductErrorMesg = " ������ ��� ��� ����� ���� ������ ����� ����";
        public static readonly string AccountdelRightMesg = "�� ����� �����";
        public static readonly string AccountdelRightMesgE = "Deleting Success";
        public static readonly string ErrorUnitsMesg = "������ �� ���� ����� ���� �� ���� ������";
        public static readonly string ErrorMainUnitMesg = "��� ����� ������ �������� �����";
        public static readonly string CheckInvTaksatMsg = "���� ���� ������ ����";

        public static readonly string CheckInvTaksatValueMsg = "���� ���� �����";

        public static readonly string AccountMoveRightMesg = "�� ����� �����";
        public static readonly string InstallRequiredMesg = "�� ���� ����� ������ ����� ���������";
        public static readonly string InstallPaymentMesg = "�� ���� ����� ������ ����� �������";

        public static readonly string RegPath = @"HKEY_CURRENT_USER\Software\VB and VBA Program Settings\MSArabSoft\A";
        public static readonly string ArabLang = "ar-KW";
        public static readonly string EngLang = "en-US";
        public static readonly string CheckTotTaksatMsg = "������� ����� ������� ������� ������� ����� ��������";
        public static readonly string ShowInvMesg = "�� ���� ��� ��������";
        public static readonly string InvalidBoxAccMesg = "������ ���� ������� ���� �� ������ ���� ����� ��� ���� �������� ";
        public static readonly string DBNameError = "���� ��� ����� ��������";
        public static readonly string DBNameAddSuccess = "�� ����� ����� �������� ������� �����";
        public static readonly string DBNameSel = "��� ������� ����� �������� ������ �� ����� ������� ����";
        public static readonly string DBaseClose = "��� ��� ���� �������� ��� ��� ���� �������� �� ���� ���� ��� ���� ����� ��������";
        public static readonly string DBaseDefError = "�� ���� ��� ����� �������� ��������";
        public static readonly string DBFoundError = "���� ����� ���� ����� �� ���";
        public static readonly string MoveStockProdcutMsg = "�� ���� ������� ������� �� ��� ��� ������� ��������";
        public static readonly string EnterMoveStoreMesg = "���� ��� ������ ������ �����";
    }
    public class Globals
    {
        public static Boolean[] SubscriptionsPrim = new Boolean[5] { true, true, true, true, true };
        public static Boolean[] UsersPrim = new Boolean[5] { true, true, true, true, true };

        public static Boolean[] RenewSubscriptionPrim = new Boolean[5] { true, true, true, true, true };
        public static Boolean[] SubscribersPrim = new Boolean[5] { true, true, true, true, true };
        public static Boolean[] ExpiredSubscriptionsPrim = new Boolean[5] { true, true, true, true, true };
        public static Boolean[] setupPrim = new Boolean[5] { true, true, true, true, true };
        public static Boolean[] PriceListPrim = new Boolean[5] { true, true, true, true, true };
        public static string CompanyName = "";
        public const string helpString = "���� ��� ���� ������ ���� ���� ��� ����� �� ����� ���";
        public static string[,] strarrStausTypes = new string[,] { { "1", "�����" }, { "2", "�����" }, { "3", "�����" }, { "4", "��� ����" }, { "5", "���" }, { "6", "�����" }, { "7", "����" } };

    public static string TotalNotPayDate = "";
    public static string TotalNotInv = "";
    public static string TotalNotGroup = "";
    public static Boolean IsDate(string anyString)
        {
            if (anyString == null)
            {
                anyString = "";
            }
            if (anyString.Length > 0)
            {
                DateTime dummyOut;
                return DateTime.TryParse(anyString, out dummyOut);
            }
            else
            {
                return false;
            }
        }
        public static Boolean IsNumeric(string anyString)
        {
            if (anyString == null)
            {
                anyString = "";
            }
            if (anyString.Length > 0)
            {
                Double dummyOut = new Double();
                System.Globalization.CultureInfo cultureInfo = new System.Globalization.CultureInfo("en-US", true);
                return Double.TryParse(anyString, System.Globalization.NumberStyles.Any, cultureInfo.NumberFormat, out dummyOut);
            }
            else
            {
                return false;
            }
        }
        public static int getColumnID(string columnName, GridView GridView1)
        {
            foreach (DataControlField column in GridView1.Columns)
            {
                if (column.HeaderText == columnName)
                {

                    int columnID = GridView1.Columns.IndexOf(column);

                    return columnID;

                }


            }
            return -1;

        }
        public static void MessageBox(string msg, System.Web.UI.Page page1)
        {
            Label lbl = new Label();
            lbl.Text = "<script language='javascript'>" + Environment.NewLine + "window.alert('" + msg + "')</script>";
            page1.Controls.Add(lbl);
        }
        public static void opennew(string msg, System.Web.UI.Page page1)
        {
            Label lbl = new Label();
            lbl.Text = "<script language='javascript'>" + Environment.NewLine + "window.open('" + msg + "')</script>";
            page1.Controls.Add(lbl);
        }

    }

    public class Node
    {
        public Node()
        {
            nodes = new List<Node>();
        }
        public string id { get; set; }
        public int Level { get; set; }
        public string MainNode { get; set; }
        public string text { get; set; }
        public string icon { get; set; }

        public string css { get; set; }
        public string color { get; set; }
        public bool selectable { get; set; }
        public State state { get; set; }

        public List<Node> nodes { get; set; }
    }

    public class State
    {
        public bool checkedd { get; set; }
        public bool disabled { get; set; }
        public bool expanded { get; set; }
        public bool selected { get; set; }
    }
