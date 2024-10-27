using System;
using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.ERPAssetDataSetTableAdapters;
namespace BOL
{
    [System.ComponentModel.DataObject()]
    public partial class Accounts
    {
        DAL.ERPAssetDataSet.AccountsDataTable AccountTbl;
        DAL.ERPAssetDataSet.AccountsDataTable TblTemp = new DAL.ERPAssetDataSet.AccountsDataTable();
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private AccountsTableAdapter _AccountsTableAdapter = null;
        protected AccountsTableAdapter AccountsAdapter
        {
            get
            {
                if (_AccountsTableAdapter == null)
                {
                    _AccountsTableAdapter = new AccountsTableAdapter();
                }
                return _AccountsTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </>
        #region "Read Section"
        public DAL.ERPAssetDataSet.AccountsDataTable Read(string ActionCode, long AccountId, long OrgId,long BRANCHId,long ParentAccountId,
               long CostId ,    string StartDate,string EndDate , string SearchText, string AccountCode,string AccountName)
        {
            if (!String.IsNullOrEmpty(StartDate))
            {
                DateTime CurDate = DateTime.ParseExact(StartDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                StartDate = CurDate.ToString("MM/dd/yyyy");
            }

            if (!String.IsNullOrEmpty(EndDate))
            {
                DateTime CurDate = DateTime.ParseExact(EndDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                EndDate = CurDate.ToString("MM/dd/yyyy");
            }
            return AccountsAdapter.Read(ActionCode, AccountId,  OrgId,  BRANCHId, ParentAccountId,  CostId, StartDate,  EndDate, AccountCode, AccountName, SearchText);
        }
        #endregion

        public DAL.ERPAssetDataSet.AccountsDataTable ReadTree(string ActionCode, long AccountId, long OrgId, long BRANCHId, long ParentAccountId,
              long CostId, string StartDate, string EndDate, string SearchText)
        {
            if (!String.IsNullOrEmpty(StartDate))
            {
                DateTime CurDate = DateTime.ParseExact(StartDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                StartDate = CurDate.ToString("MM/dd/yyyy");
            }

            if (!String.IsNullOrEmpty(EndDate))
            {
                DateTime CurDate = DateTime.ParseExact(EndDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                EndDate = CurDate.ToString("MM/dd/yyyy");
            }

            //return AccountsAdapter.Read(ActionCode, AccountId, OrgId, BRANCHId, ParentAccountId, CostId, StartDate, EndDate, SearchText);

            AccountTbl = AccountsAdapter.Read(ActionCode, AccountId, OrgId, BRANCHId, ParentAccountId, CostId, StartDate, EndDate, "","", SearchText);
            //AccountTbl = AccountsTableAdapter.Read("5", AccountId, OrgId, BRANCHId, ParentAccountId, CostId, StartDate, EndDate, SearchText);
            GetDataLevel(ParentAccountId);
            return TblTemp;

        }
        private void GetDataLevel(long AccountId)
        {
            Stack vegStack = new Stack();

            
            string Filter = "AccountparentId=" + AccountId.ToString();
            DAL.ERPAssetDataSet.AccountsRow[] NewRows = (DAL.ERPAssetDataSet.AccountsRow[])AccountTbl.Select(Filter);
            //TblTemp = NewRows.CopyToDataTable();

            //accountingTableAdapter.FillByAccId(nEWERPDataSetTemp.accounting, AccountId);

            if (NewRows.Length > 0)
            {

                for (int j = 0; j < NewRows.Length; j++)
                {
                    Boolean curMainNode = false;
                    //string QidFilter = "accountid=" + NewRows[j]["accountid"].ToString();
                    //DAL.ERPAssetDataSet.AccountsRow[] QidDetsRows = (DAL.ERPAssetDataSet.AccountsRow[])AccountTbl.Select(QidFilter);
                    if (NewRows[j]["MainNode"] != DBNull.Value)
                    {
                        curMainNode = Boolean.Parse(NewRows[j]["MainNode"].ToString());
                    }
                    if (!curMainNode)
                    {
                        int curAccountId = int.Parse(NewRows[j]["AccountId"].ToString());
                        //TotBeforeBlance = decimal.Parse(accountingViewTableAdapter.GetBeforeTotBalance(curAccountId, BranchId, FromDate, ToDate, FromDateB, ToDateB).ToString());
                        //TotBeforeBlance = TotBeforeBlance * -1;
                        //nEWERPDataSetTemp.accounting.Rows[j]["TotalBalanceB"] = TotBeforeBlance;
                        //if (QidDetsRows.Length > 0)
                        //{
                        //    for (int k = 0; k < QidDetsRows.Length; k++)
                        //    {
                             TblTemp.ImportRow(NewRows[j]);
                        //    }
                        //}
                        //else
                        //{
                        //    DAL.ERPAssetDataSet.QidDetailsStatmentRow row = (DAL.ERPAssetDataSet.QidDetailsStatmentRow)TblQidDetsTemp.NewRow();
                        //    row["accountid"] = NewRows[j]["accountid"].ToString();
                        //    row["accountname"] = NewRows[j]["accountname"].ToString();
                        //    row["AccountCode"] = NewRows[j]["AccountCode"].ToString();
                        //    row["TotalBalanceBefore"] = NewRows[j]["TotalBeforeBalance"].ToString();
                        //    //row["TotalBalanceBefore"] = NewRows[j]["MainNode"].ToString();
                        //    row["acclevel"] = NewRows[j]["acclevel"].ToString();

                        //    TblQidDetsTemp.Rows.Add(row);

                        //}

                    }
                    else
                    {
                        //if (QidDetsRows.Length > 0)
                        //{
                            TblTemp.ImportRow(NewRows[j]);
                            GetDataLevel(int.Parse(NewRows[j]["accountid"].ToString()));
                       // }
                        //vegStack.Push(NewRows[j]["accountid"].ToString());
                    }
                }
            }

         


        }
        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>
        #region "DML Section"

        public DAL.ERPAssetDataSet.AccountsDataTable ReadIncome(string ActionCode, long AccountId, long OrgId, long BRANCHId, long MainPurchaseaccid, long Paymentsaccid, long MainSalesAccid,
        long CostId, string StartDate, string EndDate, string SearchText)

        {
            if (!String.IsNullOrEmpty(StartDate))
            {
                DateTime CurDate = DateTime.ParseExact(StartDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                StartDate = CurDate.ToString("MM/dd/yyyy");
            }

            if (!String.IsNullOrEmpty(EndDate))
            {
                DateTime CurDate = DateTime.ParseExact(EndDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                EndDate = CurDate.ToString("MM/dd/yyyy");
            }


            //المبيعات
            // Tbl = QidDetailsStatmentAdapter.Read(ActionCode, StartDate, EndDate, recitetype, QidId, Id, OrgId, BRANCHId, EmpId, Detcode, AccountId, MainSalesAccid, CostId, SearchText);
            AccountTbl = AccountsAdapter.Read(ActionCode, AccountId, OrgId, BRANCHId, MainSalesAccid, CostId, StartDate, EndDate, "", "", SearchText);
            //AccountTbl = AccountsTableAdapter.Read("5", AccountId, OrgId, BRANCHId, ParentAccountId, CostId, StartDate, EndDate, SearchText);
            string Filter = "accountid=" + MainSalesAccid.ToString();
            DAL.ERPAssetDataSet.AccountsRow[] NewRows = (DAL.ERPAssetDataSet.AccountsRow[])AccountTbl.Select(Filter);
            if (NewRows.Length > 0)
            {
                TblTemp.ImportRow(NewRows[0]);
            }

            //TblTemp.ImportRow(NewRows[j]);

            //string Filter = "AccountId=" + ParentAccountId.ToString();
            //DAL.ERPAssetDataSet.AccountsRow[] NewRows = (DAL.ERPAssetDataSet.AccountsRow[])AccountTbl.Select(Filter);
            //bool curMainNode = false;
            if (AccountTbl.Rows.Count > 0)
            {
                GetDataLevel(MainSalesAccid);


            }
            //المشتريات
            //Tbl = QidDetailsStatmentAdapter.Read(ActionCode, StartDate, EndDate, recitetype, QidId, Id, OrgId, BRANCHId, EmpId, Detcode, AccountId, MainPurchaseaccid, CostId, SearchText);
         
            AccountTbl = AccountsAdapter.Read(ActionCode, AccountId, OrgId, BRANCHId, MainPurchaseaccid, CostId, StartDate, EndDate, "", "", SearchText);
            Filter = "accountid=" + MainPurchaseaccid.ToString();
            NewRows = (DAL.ERPAssetDataSet.AccountsRow[])AccountTbl.Select(Filter);
            if (NewRows.Length > 0)
            {
                TblTemp.ImportRow(NewRows[0]);
            }
            //string Filter = "AccountId=" + ParentAccountId.ToString();
            //DAL.ERPAssetDataSet.AccountsRow[] NewRows = (DAL.ERPAssetDataSet.AccountsRow[])AccountTbl.Select(Filter);
            //bool curMainNode = false;
            if (AccountTbl.Rows.Count > 0)
            {
                GetDataLevel(MainPurchaseaccid);


            }

            //المصاريف
            AccountTbl = AccountsAdapter.Read(ActionCode, AccountId, OrgId, BRANCHId, Paymentsaccid, CostId, StartDate, EndDate, "", "", SearchText);
            Filter = "accountid=" + Paymentsaccid.ToString();
            NewRows = (DAL.ERPAssetDataSet.AccountsRow[])AccountTbl.Select(Filter);
            if (NewRows.Length > 0)
            {
                TblTemp.ImportRow(NewRows[0]);
            }
            //string Filter = "AccountId=" + ParentAccountId.ToString();
            //DAL.ERPAssetDataSet.AccountsRow[] NewRows = (DAL.ERPAssetDataSet.AccountsRow[])AccountTbl.Select(Filter);
            //bool curMainNode = false;
            if (AccountTbl.Rows.Count > 0)
            {
                GetDataLevel(Paymentsaccid);
            }
            //DataView v = TblQidDetsTemp.DefaultView;
            //v.Sort = "qidDate";
            //TblQidDetsTemp = (DAL.ERPAssetDataSet.QidDetailsStatmentDataTable) v.Table;
            return TblTemp;


        }
        public long DML(string ActionCode,	long accountid ,    string  AccountCode  ,string accountname  ,	string AccountSName  ,	long AccountparentId ,bool  root  ,
	        decimal Totalfromvalue ,  decimal totaltovalue ,string notes  ,	double startbalancefrom  ,	double startbalanceto ,
            int accountType  ,	long ClosedTo ,    bool MainNode  ,    bool ProcessFlag ,    bool display_Flag  , 	int AccLevel  ,	long MainParentAccId , string LastSerialNo  , long  CurId ,    long OrgId  ,	int CreatedBy  ,
	        int UpdateBy  ,	int DeletedBy  ,  ref long? InsertedId)
        {
            long Result = 0;
            //Nullable<long> tempInvId = null;
            //if (InvId > 0) { tempInvId = InvId; }
            //if (!String.IsNullOrEmpty(qidDate))
            //{
            //    DateTime CurDate = DateTime.ParseExact(qidDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            //    qidDate = CurDate.ToString("MM/dd/yyyy");
            //}
            Result = Convert.ToInt64((AccountsAdapter.DML( ActionCode,  accountid,   AccountCode,  accountname,  AccountSName,  AccountparentId,   root,
             Totalfromvalue,  totaltovalue,  notes,  startbalancefrom,  startbalanceto, accountType,  ClosedTo,  MainNode,  ProcessFlag,  display_Flag,  AccLevel,  MainParentAccId,  LastSerialNo,   CurId,  OrgId,  CreatedBy,
             UpdateBy,  DeletedBy,  ref InsertedId)));
            return Result;
        }
        #endregion
    }
}
