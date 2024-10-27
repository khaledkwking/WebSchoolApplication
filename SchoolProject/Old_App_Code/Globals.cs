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
        public static string[,] strarrPssportType = new string[,] { { "1", "√Ê· „—…" }, { "2", "»œ· ›«ﬁœ" }, { "3", "√” »œ«·" }, { "4", "»œ·  «·›" } };
        public static string[,] strarrFormsTypes = new string[,] { { "1", "√’œ«—" }, { "2", " ÕÊÌ·" }, { "3", " ÃœÌœ" }, { "4", "«·€«¡" }, { "5", " ’—ÌÕ «·⁄„·" }, { "6", "√–‰ «·⁄„·" }, { "7", " ‰«“·" } };

        public static string[,] strarrLicenseTypes = new string[,] { { "1", "⁄«œÌ" }, { "2", "Œ«’Â" } };
        public static string[,] strarrContractType = new string[,] { { "1", "⁄«œÌ" }, { "2", "Œ«’Â" } };
        public static string[,] strarrStatusType = new string[,] { { "1", "Ì⁄„· ·œÌ «·‘—ﬂ…" }, { "2", "„›’Ê·" }, { "2", "„ ﬁ«⁄œ" } };
        public static string[,] strarrReligionTypes = new string[,] { { "1", "„”·„" }, { "2", "„”ÌÕÏ" } };

        public static string[,] strarrGetTypes = new string[,] { { "1", "›« Ê—… „‘ —Ì« " }, { "2", "„—œÊœ«  „»Ì⁄« " }, { "3", "”‰œ ’—›" } };
        public static string[,] strarrOffersTypes = new string[,] { { "1", "„”„ÊÕ" }, { "2", "„”„ÊÕ Œ·«· › —…" }, { "3", "€Ì— „”„ÊÕ" } };
        public static string[,] strarrPriceRules = new string[,] { { "1", "„Ê”„Ì" }, { "2", "„› ÊÕÂ" } };
        public static string[,] strarrItemSorted = new string[,] { { "1", "»œÊ‰  — Ì»" }, { "2", "Õ”» «·«”„" }, { "3", "Õ”» «·ﬂÊœ" } };

        public static string[,] strarrBillType = new string[,] { { "1", "√Ã·" }, { "2", "‰ﬁœ«" }, { "3", " ﬁ”Ìÿ" } };
        public static string[,] strarrBillTypeEng = new string[,] { { "1", "Credit" }, { "2", "Cash" }, { "3", "Admeasure" } };

        public static string[,] strarrPaymentTypes = new string[,] { { "1", "ÌÊ„Ì" }, { "2", "«”»Ê⁄Ï" }, { "3", "‘Â—Ì" } };

        public static string[,] strarrAccountTypes = new string[,] { { "1", "Õ”«»" }, { "3", "⁄„Ì·" }, { "4", "„Ê—œ" }, { "5", "„ÊŸ›" }, { "6", "„‰œÊ»" } };
        public static string[,] strarrEngAccountTypes = new string[,] { { "1", "Account" }, { "3", "Customer" }, { "4", "Supplier" }, { "5", "Employee" }, { "6", "Commisser" } };

        public static string[,] strarrQidTypes = new string[,] { { "1", "⁄«œÌ" }, { "2", "„—ﬂ»" }, { "3", "›« Ê—… „»Ì⁄« " }, { "4", "›« Ê—… „‘ —Ì« " }, { "5", "„—›ﬁ" }, { "6", "’—›" }, { "7", "ﬁ»÷" }, { "8", "„—œÊœ«  «·„»Ì⁄« " }, { "9", "„—œÊœ«  «·„‘ —Ì« " }, { "10", " Õ’Ì·" }, { "11", "«·«ﬁ”«ÿ" }, { "12", "«€·ﬁ" } };
        public static string[,] strarrRefBalanceTypes = new string[,] { { "1", "√—’œÂ" }, { "2", "„Ã«„Ì⁄" }, { "3", "„Ã«„Ì⁄ Ê«—’œÂ" } };

        public static string[,] strarrGenderTypes = new string[,] { { "1", "–ﬂ—" }, { "2", "√‰ÀÌ" } };
        public static string[,] strarrMalStatusType = new string[,] { { "1", "√⁄“«»" }, { "2", "„ “ÊÃ" }, { "3", "„ÿ·ﬁ" } };


        public static string[,] strarrInterfaceType = new string[,] { { "1", "Arabic" }, { "2", "English" } };

        public static string[,] strarrInvType = new string[,] { { "1", "„‘ —Ì« " }, { "2", "„»Ì⁄« " } };

        public static string[,] strarrProductTypes = new string[,] { { "1", "„Œ“Ê‰" }, { "2", " Ã„Ì⁄" }, { "3", "Œœ„…" }, { "4", "„’›Ê›…" } };

        public static string[,] strarrAttendanceType = new string[,] { { "1", "«Œ— «·‘Â—" }, { "2", "‰’› ‘Â—" }, { "3", "«”»Ê⁄Ì" }, { "3", "ÌÊ„ „Õœœ" } };
        public static string[,] strarrCalSalaryType = new string[,] { { "1", "Õ”» «·œÊ«„" }, { "2", "Õ”» «·«‰ﬁÿ«⁄ ⁄‰ «·⁄„·" } };

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
            // QtyTxt1 = " œÌ‰«— " 
            // QtyTxt2 = " œÌ‰«—«‰ " 
            // QtyTxt3 = " œ‰«‰Ì— " 
            // QtyTxt4 = "»œÊ‰ √Ì ﬁÌ„… «·„«·Ì…" 
            // Case Is = 2 
            // QtyTxt1 = " ﬂÌ” √”„‰  " 
            // QtyTxt2 = " ﬂÌ”«‰ √”„‰  " 
            // QtyTxt3 = " √ﬂÌ«” √”„‰  " 
            // QtyTxt4 = "»œÊ‰ √Ì ﬂ„Ì… „‰ «·√”„‰ " 
            // Case Is = 3 
            // QtyTxt1 = " ÿ‰ ÕœÌœ " 
            // QtyTxt2 = " ÿ‰«‰ ÕœÌœ " 
            // QtyTxt3 = " √ÿ‰«‰ ÕœÌœ " 
            // QtyTxt4 = "»œÊ‰ √Ì ﬂ„Ì… „‰ «·ÕœÌœ" 
            // Case Is = 4 
            // QtyTxt1 = " ÿ«»Êﬁ… ÃÌ—Ì… " 
            // QtyTxt2 = " ÿ«»Êﬁ «‰ ÃÌ—Ì «‰ " 
            // QtyTxt3 = " ÿ«»Êﬁ ÃÌ—Ì " 
            // QtyTxt4 = "»œÊ‰ √Ì ﬂ„Ì… „‰ «·ÿ«»Êﬁ «·ÃÌ—Ì" 
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
                                GroupTxT = " »·ÌÊ‰ ";
                                break;
                            case 2:// ERROR: Case labels with binary operators are unsupported : Equality 2: 
                                GroupTxT = " „·ÌÊ‰ ";
                                break;
                            case 3: // ERROR: Case labels with binary operators are unsupported : Equality 3: 
                                GroupTxT = " «·› ";
                                break;
                            case 4:// ERROR: Case labels with binary operators are unsupported : Equality 4: 
                                GroupTxT = "Ê«Õœ";
                                break;
                            case 5:// ERROR: Case labels with binary operators are unsupported : Equality 5: 
                                break;
                                // GroupTxT = " ›·” ";
                        }
                        goto BuildText;
                        break;
                    case 2:// ERROR: Case labels with binary operators are unsupported : Equality 2: 
                        switch (GroupCtr)
                        {
                            case 1:// ERROR: Case labels with binary operators are unsupported : Equality 1: 
                                GroupTxT = " »·ÌÊ‰«‰ ";
                                break;
                            case 2:// ERROR: Case labels with binary operators are unsupported : Equality 2: 
                                GroupTxT = " „·ÌÊ‰«‰ ";
                                break;
                            case 3:// ERROR: Case labels with binary operators are unsupported : Equality 3: 
                                GroupTxT = " «·›«‰ ";
                                break;
                            case 4:// ERROR: Case labels with binary operators are unsupported : Equality 4: 
                                GroupTxT = "«À‰«‰ ";
                                break;
                            case 5:// ERROR: Case labels with binary operators are unsupported : Equality 5: 
                                break;
                                // GroupTxT = " ›·” " 
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
                            GroupTxT = " »·«ÌÌ‰ ";
                            break;
                        case 2:// ERROR: Case labels with binary operators are unsupported : Equality 2: 
                            GroupTxT = " „·«ÌÌ‰ ";
                            break;
                        case 3:// ERROR: Case labels with binary operators are unsupported : Equality 3: 
                            GroupTxT = " ¬·«› ";
                            break;
                        case 4:// ERROR: Case labels with binary operators are unsupported : Equality 4: 
                            break;
                        //297 GroupTxT = QtyTxt3 
                        case 5:// ERROR: Case labels with binary operators are unsupported : Equality 5: 
                            break;
                            // GroupTxT = " ›·” " 
                    }
                }
                else
                {
                    switch (GroupCtr)
                    {
                        case 1:// ERROR: Case labels with binary operators are unsupported : Equality 1: 
                            GroupTxT = " »·ÌÊ‰ ";
                            break;
                        case 2:// ERROR: Case labels with binary operators are unsupported : Equality 2: 
                            GroupTxT = " „·ÌÊ‰ ";
                            break;
                        case 3:// ERROR: Case labels with binary operators are unsupported : Equality 3: 
                            GroupTxT = " «·› ";
                            break;
                        case 4:// ERROR: Case labels with binary operators are unsupported : Equality 4: 
                            break;
                        //297 GroupTxT = QtyTxt1 
                        case 5:// ERROR: Case labels with binary operators are unsupported : Equality 5: 
                            break;
                            // GroupTxT = " ›·” " 
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
                    Wa2 = " Ê ";
                }
                else
                {
                    Wa2 = " ";
                }

                NumTxT = NumTxT + Wa + HundredTxt + Wa2 + TenUnitTxt + " " + GroupTxT;
                //if (HundredNum > 0)

                Wa = "œÌ‰«— ﬂÊÌ Ì Ê  ";

                GroupTxT = "";

                //NextGroupCtr: 

            }
            //MyRecordset.Close() 

            if (NumTxT == " ")
            {
                switch (QtyTyp)
                {
                    case 1:// ERROR: Case labels with binary operators are unsupported : Equality 1: 
                        QtyTxt1 = "»œÊ‰ √Ì ﬁÌ„… «·„«·Ì…";
                        break;
                    case 2:// ERROR: Case labels with binary operators are unsupported : Equality 2: 
                        QtyTxt1 = "»œÊ‰ √Ì ﬂ„Ì… „‰ «·√”„‰ ";
                        break;
                    case 3:// ERROR: Case labels with binary operators are unsupported : Equality 3: 
                        QtyTxt1 = "»œÊ‰ √Ì ﬂ„Ì… „‰ «·ÕœÌœ";
                        break;
                    case 4:// ERROR: Case labels with binary operators are unsupported : Equality 4: 
                        QtyTxt1 = "»œÊ‰ √Ì ﬂ„Ì… „‰ «·ÿ«»Êﬁ «·ÃÌ—Ì";
                        break;
                }
                functionReturnValue = NumTxT + QtyTxt1;
            }
            else
            {
                if (HundredNum > 0 || TenUnitNum > 0)
                {
                    Wa2 = " ›·”";
                }
                else
                {
                    Wa2 = " œÌ‰«— ﬂÊÌ Ì";

                }
                NumTxT = NumTxT + Wa2;
                switch (QtyTyp)
                {
                    case 1:// ERROR: Case labels with binary operators are unsupported : Equality 1: 
                        QtyTxt1 = "  ›ﬁÿ ·«€Ì—"; //" œÌ‰«— ﬂÊÌ Ì ›ﬁÿ ·«€Ì—";
                        break;
                    case 2:// ERROR: Case labels with binary operators are unsupported : Equality 2: 
                        QtyTxt1 = " ﬂÌ” √”„‰  ›ﬁÿ ·«€Ì—";
                        break;
                    case 3:// ERROR: Case labels with binary operators are unsupported : Equality 3: 
                        QtyTxt1 = " ÿ‰ ÕœÌœ ›ﬁÿ ·«€Ì—";
                        break;
                    case 4:// ERROR: Case labels with binary operators are unsupported : Equality 4: 
                        QtyTxt1 = " ÿ«»Êﬁ ÃÌ—Ì ›ﬁÿ ·«€Ì—";
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

        public static int boxAccid; // Õ”«» «·’‰œÊﬁ
        public static int bankaccid;// Õ”«» «·»‰ﬂ
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

        public static readonly string ClickToAdd = "≈÷€ÿ ··≈÷«›…";
        public static readonly string stringClickToGoBack = "≈÷€ÿ ··⁄Êœ…";
        //Add, Edit
        public static readonly string ClickToSave = "≈÷€ÿ ·Õ›Ÿ «·»Ì«‰";
        public static readonly string ClickToCancelAdd = "≈÷€ÿ ·≈·€«¡ ⁄„·Ì… «·≈÷«›…";
        //Edit
        public static readonly string ClickToDelete = "≈÷€ÿ ·Õ–› «·»Ì«‰";
        public static readonly string ClickToCancelEdit = "≈÷€ÿ ·≈·€«¡ ⁄„·Ì… «· ⁄œÌ·";

        //'------------ Error --------------------------------------------------------
        public static readonly string ErrRowAlreadyExists = "Â–« «·»Ì«‰ „”Ã· „‰ ﬁ»·";
        public static readonly string ErrUnableToLoadData = "·„ Ì „ «·⁄ÀÊ— ⁄·Ï «·»Ì«‰";
        public static readonly string printFound = " „ ÿ»«⁄… Â–Â «·«Ì’«·«  „‰ ﬁ»·";
        // '------------- Info --------------------------------------------------------
        public static readonly string CheckInvPrintMsg = "ﬁ„ «Ê·« »Õ›Ÿ «·›« Ê—… ·ﬂÏ Ì‰„ﬂ‰ﬂ «·ÿ«»⁄…";

        public static readonly string CheckProdcutAddMsg = "«·’‰› €Ì— „ÊÃÊœ Â·  —Ìœ «÷«›… «·’‰›";
        public static readonly string CheckProdcutCodeMsg = "«·’‰› €Ì— „ÊÃÊœ ";
        public static readonly string CustNotFoundMsg = "Â–« «·⁄„Ì· €Ì— „ÊÃÊœ Â·  —Ìœ «œ—«ÃÂ";

        public static readonly string CheckDel = "Â·  —Ìœ «·Õ–›";
        public static readonly string CheckDelE = "Do you want to Delete";

        public static readonly string CheckTotVaule = " «·„»·€ «·«Ã„«·Ï ·« Ì”«ÊÌ «Ã„«·Ï «·„»·€ «·„” Õﬁ ";
        public static readonly string CheckTotVauleE = "Value Error";


        public static readonly string CheckSaveMsg = "Â·  —Ìœ «·Õ›Ÿ";
        public static readonly string CheckSaveMsgE = "Do you want to save";

        public static readonly string CheckCancelMsg = "Â·  —Ìœ «·€«¡ «·„⁄·Ê„« ";
        public static readonly string CheckCancelMsgE = "Do you cancel Information";

        public static readonly string SaveMesg = " „ «·Õ›Ÿ »‰Ã«Õ";
        public static readonly string SaveMesgE = "Saving Success";

        public static readonly string ConfirmSaveMesg = "Â·  —Ìœ «·Õ›Ÿ";
        public static readonly string ConfirmExitMesg = "Â·  —Ìœ «€·ﬁ «·»—‰«„Ã";

        public static readonly string ConfirmSaveMesgE = "Do you want to Save";

        public static readonly string TabSaveMesg = "ﬁ„ «Ê·« »Õ›Ÿ «·»Ì«‰«  «·«”«”Ì…";
        public static readonly string TabProductMesg = "·« Ì„ﬂ‰ «· ⁄«„· „⁄ Â–« «·’‰›";
        public static readonly string ErrorSaveMesg = "ÌÊÃœ Œÿ« ›Ï «·»Ì«‰«  «· Ï Ì „ Õ›ŸÂ«";
        public static readonly string ErrorDelMesg = "·« Ì„ﬂ‰ Õ–› Â–« «·»Ì«‰ ·ÊÃÊœ… »Ì«‰«  „— »ÿ… »Â";
        public static readonly string CemenetDateCheck = " «œŒ·  «—ÌŒ  ’—ÌÕ «·«”„‰  »ÿ—Ìﬁ… ”·Ì„…Ê·« Ì„ﬂ‰ Õ›Ÿ »Ì«‰«  «·ﬁ—÷";
        public static readonly string CatCodeCheck = " √œŒ· ﬂÊœ «·’‰› «·⁄«„ «Ê·«";
        public static readonly string CatDescCheck = " √œŒ· √”„ «·’‰› «·⁄«„ «Ê·«";
        public static readonly string ChangeTypeMessage = " ·« Ì„ﬂ‰  €Ì— Â–« «·Õ”«» «·Ï Â–« «·‰Ê⁄ ";
        public static readonly string AccSearchMessage = " Â–« «·Õ”«» €Ì— „ÊÃÊœ ";
        public static readonly string QidNotBalanceMesg = "ÿ—›Ì‰ «·ﬁÌœ €Ì— „ ”«ÊÌ‰ ";
        public static readonly string QidEmptyMesg = "Œÿ√ ﬁÌœ ›«—€";
        public static readonly string NoAccountMesg = "„‰ ›÷·ﬂ «œŒ· «·Õ”«» ";
        public static readonly string NoToValueMesg = "«œŒ· «·ﬁÌ„… «·„œ›Ê⁄ »ÿ—Ì›… ’ÕÌÕ… ";
        public static readonly string NoFromValueMesg = "«œŒ· «·ﬁÌ„… «·„ﬁ»Ê÷Â »ÿ—Ì›… ’ÕÌÕ… ";
        public static readonly string ProductInvMesg = "«œŒ· „Õ ÊÌ«  «·›« Ê—… ";
        public static readonly string StockQtyMesg = "«·ﬂ„Ì… «·„ÊÃÊœ… ›Ï «·„Œ“‰ √ﬁ· „‰ «·„ÿ·Ê»";
        public static readonly string StockNullQtyMesg = "«œŒ· «·ﬂ„Ì… «·„ÿ·Ê»Â";

        public static readonly string MinPriceMesg = "Â–« «·”⁄— √ﬁ· „‰ √ﬁ· ”⁄— «·»Ì⁄";
        public static readonly string EmpSaveMesg = "ÌÃ» «œŒ«· «·„ÊŸ› «Ê·«";
        public static readonly string InvaildInvMesg = "Œÿ√ ›« Ê—… ›«—€… Ê·« Ì„ﬂ‰ «·Õ›Ÿ";
        public static readonly string InvaildDataInvMesg = "«œŒ· »Ì«‰«  «·›« Ê—… »ÿ—Ìﬁ… ”·Ì„…";
        public static readonly string InvNotfoundMesg = "Â–Â «·›« Ê—… €Ì— „ÊÃÊœ…";
        public static readonly string QidNotfoundMesg = "Â–Â «·”‰œ €Ì— „ÊÃÊœ…";
        public static readonly string QidNotBankfoundMesg = "«œŒ· Õ”«» «·»‰ﬂ";
        public static readonly string EmpNotfoundMesg = "Â–Â Â–« «·„ÊŸ› €Ì— „ÊÃÊœ…";

        public static readonly string CheckDate = "√œŒ· «· «—ÌŒ »ÿ—Ìﬁ… ”·Ì„…";
        public static readonly string ProductLevelMesg = "·«Ì„ﬂ‰ «÷«›… ’‰› ÃœÌœ  Õ  Â–« «·’‰›";
        public static readonly string EnterCustomerMesg = "√œŒ· «·⁄„Ì· »ÿ—Ìﬁ… ’ÕÌÕ…";
        public static readonly string EnterAccountMesg = "√œŒ· «·Õ”«» »ÿ—Ìﬁ… ’ÕÌÕ…";
        public static readonly string ProductUnitsMesg = "«œŒ· ÊÕœ«  «·’‰›";
        public static readonly string codeErrorMesg = "Â–« «·ﬂÊœ „ÊÃÊœ „‰ ﬁ»·";
        public static readonly string AccountProcessErrorMesg = "·«Ì„ﬂ‰ Õ–› Â–« «·Õ”«» ·«‰Â  „  —ÕÌ· ﬁÌÊœ";
        public static readonly string ProductProcessErrorMesg = "·«Ì„ﬂ‰ Õ–› Â–« «·’‰› ·«‰Â „— »ÿ »«·»Ì«‰«  «Œ—Ì ÊÕ–›Â ”Ê› Ì „ ›ﬁœ Â–Â «·»Ì«‰«  ﬁ„ «Ê·« »Õ–› «·»«‰«  «·— »ÿ »Â";

        public static readonly string AccountErrorMesg = " ·«Ì„ﬂ‰ Õ–› Â–« «·Õ”«» ÌÊÃœ Õ”«»«  „œ—Ã…  Õ Â";
        public static readonly string ProductErrorMesg = " ·«Ì„ﬂ‰ Õ–› Â–« «·’‰› ÌÊÃœ Õ”«»«  „œ—Ã…  Õ Â";
        public static readonly string AccountdelRightMesg = " „ «·Õ–› »‰Ã«Õ";
        public static readonly string AccountdelRightMesgE = "Deleting Success";
        public static readonly string ErrorUnitsMesg = "·«Ì„ﬂ‰ «‰ ÌﬂÊ‰ ··’‰› «ﬂÀ— „‰ ÊÕœ… «”«”Ì…";
        public static readonly string ErrorMainUnitMesg = "ÌÃ»  ÕœÌœ «·ÊÕœ… «·«”«”Ì… ··’‰›";
        public static readonly string CheckInvTaksatMsg = "√œŒ· Õ”«» «·⁄„Ì· «Ê·«";

        public static readonly string CheckInvTaksatValueMsg = "«œŒ· ﬁÌ„… «·ﬁ”ÿ";

        public static readonly string AccountMoveRightMesg = " „ «·‰ﬁ· »‰Ã«Õ";
        public static readonly string InstallRequiredMesg = "Â·  —Ìœ «·Õ›Ÿ Ê Ê·Ìœ ”‰œ«  «·«” Õﬁ«ﬁ";
        public static readonly string InstallPaymentMesg = "Â·  —Ìœ «·Õ›Ÿ Ê Ê·Ìœ ”‰œ«  «· ”œÌœ";

        public static readonly string RegPath = @"HKEY_CURRENT_USER\Software\VB and VBA Program Settings\MSArabSoft\A";
        public static readonly string ArabLang = "ar-KW";
        public static readonly string EngLang = "en-US";
        public static readonly string CheckTotTaksatMsg = "«·„Ã„Ê⁄ «·ﬂ·Ï ··«ﬁ”«ÿ ·«Ì”«ÊÌ «·„Ã„Ê⁄ «·ﬂ·Ï ··›« Ê—…";
        public static readonly string ShowInvMesg = "Â·  —Ìœ ⁄—÷ «·›« Ê—…";
        public static readonly string InvalidBoxAccMesg = "„·ÕÊŸ… Õ”«» «·’‰œÊﬁ Õ”«»  „ «‰‘«¡Â Õ”«» —∆Ì”Ï ⁄·Ï ‘Ã—… «·Õ”«»«  ";
        public static readonly string DBNameError = "√œŒ· «”„ ﬁ«⁄œ… «·»Ì«‰« ";
        public static readonly string DBNameAddSuccess = " „ «‰‘«¡ ﬁ«⁄œ… «·»Ì«‰«  «·ÃœÌœ… »‰Ã«Õ";
        public static readonly string DBNameSel = "ﬁ«„ »«Œ Ì«— ﬁ«⁄œ… «·»Ì«‰«  «·„—«œ «‰  Ã·Â« «·Õ«·Ì… «Ê·«";
        public static readonly string DBaseClose = "”Ê› Ì „ «€·ﬁ «·»—‰«„Ã ÊÀ„ ﬁ«„ »ﬁ Õ «·»—‰«„Ã „‰ ÃœÌœ Ê”Ê› Ì „  €Ì— ﬁ«⁄œ… «·»Ì«‰« ";
        public static readonly string DBaseDefError = "·« Ì„ﬂ‰ Õ–› ﬁ«⁄œ… «·»Ì«‰«  «·«”«”Ì…";
        public static readonly string DBFoundError = "ÌÊÃœ ﬁ«⁄œ… »‰›” «·«”„ „‰ ﬁ»·";
        public static readonly string MoveStockProdcutMsg = "ﬁ„ «Ê·« »«Œ Ì«— «·„Œ«“‰ ·ﬂ Ì „ ⁄—÷ «·«’‰«› «·„ÊÃÊœ…";
        public static readonly string EnterMoveStoreMesg = "√œŒ· √”„ «·„Œ“‰ »ÿ—Ìﬁ… ’ÕÌÕ…";
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
        public const string helpString = "ÌÊÃœ ÿ·» ”«»ﬁ «·› —… »Ì‰Â Ê»Ì‰ Â–« «·ÿ·» ·« Ì ⁄œÌ ‘Â—";
        public static string[,] strarrStausTypes = new string[,] { { "1", "≈’œ«—" }, { "2", " ⁄œÌ·" }, { "3", " ÃœÌœ" }, { "4", "»œ· ›«ﬁœ" }, { "5", "Õ–›" }, { "6", "ÿ»«⁄…" }, { "7", " «·›" } };

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
