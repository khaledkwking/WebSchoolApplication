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
    public partial class TemplateAccounting
    {
        DAL.ERPAssetDataSet.TemplateAccountingDataTable AccountTbl;
        AccountsTableAdapter AccountDt=new AccountsTableAdapter ();
        long CurOrgId = 0;
        DAL.ERPAssetDataSet.TemplateAccountingDataTable TblTemp = new DAL.ERPAssetDataSet.TemplateAccountingDataTable();
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private TemplateAccountingTableAdapter _TemplateAccountingTableAdapter = null;
        protected TemplateAccountingTableAdapter TemplateAccountingAdapter
        {
            get
            {
                if (_TemplateAccountingTableAdapter == null)
                {
                    _TemplateAccountingTableAdapter = new TemplateAccountingTableAdapter();
                }
                return _TemplateAccountingTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </>
        #region "Read Section"
        public DAL.ERPAssetDataSet.TemplateAccountingDataTable Read(string ActionCode, long AccountId, long ParentAccountId, long OrgId,int level,
                string SearchText)
        {
           
            return TemplateAccountingAdapter.Read(ActionCode, AccountId, ParentAccountId,  OrgId, level, SearchText);
        }
        #endregion

        public DAL.ERPAssetDataSet.TemplateAccountingDataTable ReadTree(string ActionCode, long AccountId, long ParentAccountId, long OrgId, int level,
                string SearchText)
        {
           

            //return TemplateAccountingAdapter.Read(ActionCode, AccountId, OrgId, BRANCHId, ParentAccountId, CostId, StartDate, EndDate, SearchText);

            AccountTbl = TemplateAccountingAdapter.Read(ActionCode, AccountId, 0, 0, level, SearchText);
            //AccountTbl = TemplateAccountingTableAdapter.Read("5", AccountId, OrgId, BRANCHId, ParentAccountId, CostId, StartDate, EndDate, SearchText);
            CurOrgId = OrgId;
            GetDataLevel(ParentAccountId, ParentAccountId);
            return TblTemp;

        }
        private void GetDataLevel(long AccountId, long  NewParentId)
        {
            Stack vegStack = new Stack();

            
            string Filter = "AccountparentId=" + AccountId.ToString();
            DAL.ERPAssetDataSet.TemplateAccountingRow[] NewRows = (DAL.ERPAssetDataSet.TemplateAccountingRow[])AccountTbl.Select(Filter);
            //TblTemp = NewRows.CopyToDataTable();

            //accountingTableAdapter.FillByAccId(nEWERPDataSetTemp.accounting, AccountId);
            string notes = "";
            if (NewRows.Length > 0)
            {

                for (int j = 0; j < NewRows.Length; j++)
                {
                    string AccountCode = NewRows[j]["AccountCode"].ToString ();
                    string accountname = NewRows[j]["accountname"].ToString(); ;
                    string AccountSName = NewRows[j]["AccountSName"].ToString(); ;
                    long AccountparentId = NewParentId;
                    bool root = NewRows[j]["root"] !=DBNull.Value ? bool.Parse (NewRows[j]["root"].ToString()): false ;
                    decimal Totalfromvalue= NewRows[j]["Totalfromvalue"] != DBNull.Value ? decimal.Parse(NewRows[j]["Totalfromvalue"].ToString()) : 0;
                    decimal Totaltovalue= NewRows[j]["Totaltovalue"] != DBNull.Value ? decimal.Parse(NewRows[j]["Totaltovalue"].ToString()) : 0;
                   
                    double startbalancefrom=  0;
                    double startbalanceto = 0 ;
                    int accountType = NewRows[j]["accountType"] != DBNull.Value ? int.Parse(NewRows[j]["accountType"].ToString()) : 0;
                    long ClosedTo = NewRows[j]["ClosedTo"] != DBNull.Value ? int.Parse(NewRows[j]["ClosedTo"].ToString()) : 0;
                    bool MainNode = NewRows[j]["MainNode"] != DBNull.Value ? bool.Parse(NewRows[j]["MainNode"].ToString()) : false;
                    bool ProcessFlag = NewRows[j]["ProcessFlag"] != DBNull.Value ? bool.Parse(NewRows[j]["ProcessFlag"].ToString()) : false;
                    bool display_Flag = NewRows[j]["root"] != DBNull.Value ? bool.Parse(NewRows[j]["root"].ToString()) : false;
                    int AccLevel = NewRows[j]["AccLevel"] != DBNull.Value ? int.Parse(NewRows[j]["AccLevel"].ToString()) : 0;
                    long MainParentAccId = NewRows[j]["MainParentAccId"] != DBNull.Value ? long.Parse(NewRows[j]["MainParentAccId"].ToString()) : 0;
                    string LastSerialNo = NewRows[j]["LastSerialNo"].ToString(); ;
                    long CurId = NewRows[j]["CurId"] != DBNull.Value ? long.Parse(NewRows[j]["CurId"].ToString()) : 0;
                    long OrgId = CurOrgId;
                    int CreatedBy = 0;
                    int UpdateBy = 0 ;
                    int DeletedBy = 0 ;
                    long? InsertedId = 0 ;

                    AccountDt.DML("1", 0, AccountCode, accountname, AccountSName, AccountparentId, root,
                             Totalfromvalue, Totaltovalue, notes, startbalancefrom, startbalanceto, accountType, ClosedTo, MainNode, ProcessFlag, display_Flag, AccLevel, MainParentAccId, LastSerialNo, CurId, OrgId, CreatedBy,
                             UpdateBy, DeletedBy, ref InsertedId);

                    Boolean curMainNode = false;
                    //string QidFilter = "accountid=" + NewRows[j]["accountid"].ToString();
                    //DAL.ERPAssetDataSet.TemplateAccountingRow[] QidDetsRows = (DAL.ERPAssetDataSet.TemplateAccountingRow[])AccountTbl.Select(QidFilter);

                    if (NewRows[j]["MainNode"] != DBNull.Value)
                    {
                        curMainNode = Boolean.Parse(NewRows[j]["MainNode"].ToString());
                    }
                    if (!curMainNode)
                    {
                        int curAccountId = int.Parse(NewRows[j]["AccountId"].ToString());
                        
                          //TblTemp.ImportRow(NewRows[j]);
                       

                    }
                    else
                    {
                        //if (QidDetsRows.Length > 0)
                        //{
                            //TblTemp.ImportRow(NewRows[j]);
                            GetDataLevel(long.Parse(NewRows[j]["accountid"].ToString()), long.Parse (InsertedId.ToString ()));
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


        //public long DML(string ActionCode,	long accountid ,    string  AccountCode  ,string accountname  ,	string TemplateAccountingName  ,	long AccountparentId ,bool  root  ,
	       // decimal Totalfromvalue ,  decimal otaltovalue ,string notes  ,	double startbalancefrom  ,	double startbalanceto ,
        //    int accountType  ,	long ClosedTo ,    bool MainNode  ,    bool ProcessFlag ,    bool display_Flag  , 	int AccLevel  ,	long MainParentAccId , string LastSerialNo  , long  CurId ,    long OrgId  ,	int CreatedBy  ,
	       // int UpdateBy  ,	int DeletedBy  ,  ref int? InsertedId)
        //{
        //    long Result = 0;
        //    //Nullable<long> tempInvId = null;
        //    //if (InvId > 0) { tempInvId = InvId; }
        //    //if (!String.IsNullOrEmpty(qidDate))
        //    //{
        //    //    DateTime CurDate = DateTime.ParseExact(qidDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
        //    //    qidDate = CurDate.ToString("MM/dd/yyyy");
        //    //}
        //    Result = Convert.ToInt64((TemplateAccountingAdapter.DML( ActionCode,  accountid,   AccountCode,  accountname,  TemplateAccountingName,  AccountparentId,   root,
        //     Totalfromvalue,  otaltovalue,  notes,  startbalancefrom,  startbalanceto, accountType,  ClosedTo,  MainNode,  ProcessFlag,  display_Flag,  AccLevel,  MainParentAccId,  LastSerialNo,   CurId,  OrgId,  CreatedBy,
        //     UpdateBy,  DeletedBy,  ref InsertedId)));
        //    return Result;
        //}
        #endregion
    }
}
