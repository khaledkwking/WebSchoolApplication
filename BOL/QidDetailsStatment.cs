using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.ERPAssetDataSetTableAdapters;

namespace BOL
{
    [System.ComponentModel.DataObject()]
    public partial class QidDetailsStatmentStatment
    {
      
         public static int QidInValue=7;
         public static int QidOutValue = 6;
        DAL.ERPAssetDataSet.QidDetailsStatmentDataTable Tbl;
        DAL.ERPAssetDataSet.AccountsDataTable AccountTbl;
        DAL.ERPAssetDataSet.AccountsDataTable TblTemp = new DAL.ERPAssetDataSet.AccountsDataTable();
        DAL.ERPAssetDataSet.QidDetailsStatmentDataTable TblQidDetsTemp = new DAL.ERPAssetDataSet.QidDetailsStatmentDataTable();
        private AccountsTableAdapter AccountsTableAdapter = new AccountsTableAdapter();
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private QidDetailsStatmentTableAdapter _QidDetailsStatmentTableAdapter = null;
        protected QidDetailsStatmentTableAdapter QidDetailsStatmentAdapter
        {
            get
            {
                if (_QidDetailsStatmentTableAdapter == null)
                {
                    _QidDetailsStatmentTableAdapter = new QidDetailsStatmentTableAdapter();
                }
                return _QidDetailsStatmentTableAdapter;
            }
        }
        #endregion

        public DAL.ERPAssetDataSet.QidDetailsStatmentDataTable ReadQids(string ActionCode, string StartDate, string EndDate, int recitetype, long QidId, long Id, long OrgId, long BRANCHId, int EmpId, int Detcode, long AccountId, long ParentAccountId, long CostId, string SearchText)
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


            Tbl = QidDetailsStatmentAdapter.Read(ActionCode, StartDate, EndDate, recitetype, QidId, Id, OrgId, BRANCHId, EmpId, Detcode, AccountId, ParentAccountId, CostId, SearchText);
            //AccountTbl = AccountsTableAdapter.Read("5", AccountId, OrgId, BRANCHId, ParentAccountId, CostId, StartDate, EndDate, SearchText);
            //GetDataLevel(ParentAccountId);
            return Tbl;


        }
        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </>
        #region "Read Section"
        public DAL.ERPAssetDataSet.QidDetailsStatmentDataTable Read(string ActionCode, string StartDate, string EndDate, int recitetype, long QidId,long Id, long OrgId, long BRANCHId, int EmpId,int Detcode,long AccountId, long ParentAccountId, long CostId, string SearchText)
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

           
            Tbl = QidDetailsStatmentAdapter.Read(ActionCode, StartDate, EndDate, recitetype, QidId, Id, OrgId, BRANCHId, EmpId, Detcode, AccountId, ParentAccountId,CostId, SearchText);
            AccountTbl = AccountsTableAdapter.Read("5",AccountId,OrgId,BRANCHId, ParentAccountId,CostId, StartDate, EndDate,"","",SearchText);
            
            string Filter = "AccountId=" + ParentAccountId.ToString();
            DAL.ERPAssetDataSet.AccountsRow[] NewRows = (DAL.ERPAssetDataSet.AccountsRow[])AccountTbl.Select(Filter);
            bool curMainNode = false;
            if (NewRows.Length > 0)
            {
              
                if (NewRows[0]["MainNode"] != DBNull.Value)
                {
                     curMainNode = Boolean.Parse(NewRows[0]["MainNode"].ToString());
                }
            }
            GetDataLevel(ParentAccountId, curMainNode);

            
            //DataView v = TblQidDetsTemp.DefaultView;
            //v.Sort = "qidDate";
            //TblQidDetsTemp = (DAL.ERPAssetDataSet.QidDetailsStatmentDataTable) v.Table;
            return TblQidDetsTemp;


        }
        #endregion

        private void GetDataLevel(long AccountId,bool bMainNode)
        {
            Stack vegStack = new Stack();

            //nEWERPDataSetTemp.accounting.Clear();

            //this.accountingViewTableAdapter.FillBy(nEWERPDataSetTemp.AccountingView, AccountId, BranchId, FromDate, ToDate, ProductId,CostId );
            //this.accountingViewTableAdapter.FillByNotStart(nEWERPDataSetTemp.AccountingView, AccountId, BranchId, FromDate, ToDate, ProductId, CostId);

            //if (nEWERPDataSetTemp.AccountingView.Rows.Count > 0)
            //{
            //    GetSum();
            //}
            //for (int j = 0; j < nEWERPDataSetTemp.AccountingView.Rows.Count; j++)
            //{
            //    TotBeforeBlance = decimal.Parse(accountingViewTableAdapter.GetBeforeTotBalance(AccountId, BranchId, FromDate, ToDate, FromDateB, ToDateB).ToString());
            //    TotBeforeBlance = TotBeforeBlance * -1;
            //    nEWERPDataSetTemp.AccountingView.Rows[j]["TotBeforeBlance"] = TotBeforeBlance;

            //    nEWERPDataSet.AccountingView.ImportRow(nEWERPDataSetTemp.AccountingView.Rows[j]);
            //}
            //if (nEWERPDataSetTemp.AccountingView.Rows.Count == 0)
            //{
            //    TotBeforeBlance = decimal.Parse(accountingViewTableAdapter.GetBeforeTotBalance(AccountId, BranchId, FromDate, ToDate, FromDateB, ToDateB).ToString());
            //    TotBeforeBlance = TotBeforeBlance * -1;
            //}

            //if (nEWERPDataSetTemp.AccountingView.Rows.Count == 0)
            //{
            //    this.accountingViewTableAdapter.FillByNotStartMove(nEWERPDataSetTemp.AccountingView, AccountId, BranchId, FromDate, ToDate, ProductId, CostId);
            //    for (int j = 0; j < nEWERPDataSetTemp.AccountingView.Rows.Count; j++)
            //    {


            //        nEWERPDataSet.AccountingView.ImportRow(nEWERPDataSetTemp.AccountingView.Rows[j]);
            //    }
            //}
            string Filter = "";
            if (bMainNode)
            {
                 Filter = "AccountparentId=" + AccountId.ToString();
               
            }
            else
            {
                Filter = "AccountId=" + AccountId.ToString();
            }

            DAL.ERPAssetDataSet.AccountsRow[] NewRows = (DAL.ERPAssetDataSet.AccountsRow[])AccountTbl.Select(Filter);
            //TblTemp = NewRows.CopyToDataTable();

            //accountingTableAdapter.FillByAccId(nEWERPDataSetTemp.accounting, AccountId);

            if (NewRows.Length > 0)
            {

                for (int j = 0; j < NewRows.Length; j++)
                {
                    Boolean curMainNode = false;

                    string QidFilter = "accountid=" + NewRows[j]["accountid"].ToString();
                    DAL.ERPAssetDataSet.QidDetailsStatmentRow[] QidDetsRows = (DAL.ERPAssetDataSet.QidDetailsStatmentRow[])Tbl.Select(QidFilter);
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
                        if (QidDetsRows.Length > 0)
                        {
                            for (int k = 0; k < QidDetsRows.Length; k++)
                            {
                                TblQidDetsTemp.ImportRow(QidDetsRows[k]);
                            }
                        }
                        else
                        {
                            DAL.ERPAssetDataSet.QidDetailsStatmentRow row = (DAL.ERPAssetDataSet.QidDetailsStatmentRow)TblQidDetsTemp.NewRow();
                            row["accountid"] = NewRows[j]["accountid"].ToString();
                            row["accountname"] = NewRows[j]["accountname"].ToString();
                            row["AccountCode"] = NewRows[j]["AccountCode"].ToString();
                            row["TotalBalanceBefore"] = NewRows[j]["TotalBeforeBalance"].ToString();
                            //row["TotalBalanceBefore"] = NewRows[j]["MainNode"].ToString();
                            row["acclevel"] = NewRows[j]["acclevel"].ToString();

                            TblQidDetsTemp.Rows.Add (row);

                        }

                    }
                    else
                    {
                        if (QidDetsRows.Length > 0)
                        {
                            TblQidDetsTemp.ImportRow(QidDetsRows[0]);
                            GetDataLevel(int.Parse(NewRows[j]["accountid"].ToString()), curMainNode);
                        }
                        //vegStack.Push(NewRows[j]["accountid"].ToString());
                    }
                }
            }

            //int count = NewRows.Length;
            //for (int i = 0; i < count; i++)
            //{
            //    //nEWERPDataSet.AccountingView.ImportRow(nEWERPDataSetTemp.accounting.Rows[i]);
            //    vegStack.Push(NewRows[i]["accountid"].ToString());

            //}
            //if (count > 0)
            //{
            //    for (int j = 0; j < count; j++)
            //    {
            //        GetDataLevel(int.Parse(vegStack.Pop().ToString()));
            //    }
            //}


        }
        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>
      
        #region "DML Section"


        //    public long DML(string ActionCode, long ID ,    long qidid ,decimal FromValue ,decimal ToValue ,long ACCOUNTID ,    short Type,
        //string Description ,    string EnterDate ,    int Detcode  ,int QidType  ,decimal TotalPrice , int ActionType  ,long CostId , int CreatedBy  ,  int UpdateBy  , int DeletedBy   )
        //    {
        //        long Result = 0;
        //        Nullable<decimal> tempFromValue = null;
        //        Nullable<decimal> tempToValue = null;
        //        Nullable<long> tempCostId = null;
        //        if (FromValue > 0) { tempFromValue= FromValue; }
        //        if (ToValue > 0) { tempToValue = ToValue; }
        //        if (CostId > 0) { tempCostId = CostId; }

        //        if (!String.IsNullOrEmpty(EnterDate))
        //        {
        //            DateTime CurDate = DateTime.ParseExact(EnterDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
        //            EnterDate = CurDate.ToString("MM/dd/yyyy");
        //        }

        //        Result = Convert.ToInt64((QidDetailsStatmentAdapter.DML( ActionCode,  ID, qidid, tempFromValue, tempToValue, ACCOUNTID, Type,   Description,  EnterDate,  Detcode,  QidType,  TotalPrice,  ActionType, tempCostId,  CreatedBy,  UpdateBy,  DeletedBy)));
        //        return Result;
        //    }
        #endregion
    }
}