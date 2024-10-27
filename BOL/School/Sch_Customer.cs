using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.CustomersTableAdapters;
namespace BOL
{
    [System.ComponentModel.DataObject()]
    public partial class Sch_Customer
    {
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private Sch_CustomerTableAdapter _Sch_CustomerTableAdapter = null;
        protected Sch_CustomerTableAdapter Sch_CustomerTableAdapter
        {
            get
            {
                if (_Sch_CustomerTableAdapter == null)
                {
                    _Sch_CustomerTableAdapter = new Sch_CustomerTableAdapter();
                }
                return _Sch_CustomerTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </>
        #region "Read Section"
        public DAL.Customers.Sch_CustomerDataTable  Read(string ActionCode, long OrgId, long CustId,long AreaId,long BranchId, int UserId, string SearchText)
        {
            return Sch_CustomerTableAdapter.Read(ActionCode, CustId,AreaId, OrgId, BranchId,UserId, SearchText);
        }
        #endregion


        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>
        #region "DML Section"


        public long DML(string ActionCode,long Id, string CustName,
    int AreaId, string AreaDesc,string Tel,string Mobile,long UserId,string StageName, string Tel1,string Tel2,string Schoolname,long BranchId,long OrgId,int CreatedBy,int UpdateBy,int DeletedBy, ref int? InsertedId)

        {
            long Result = 0;

            DAL.Customers.Sch_CustomerDataTable tbl = Sch_CustomerTableAdapter.Read(ActionCode, Id, AreaId, OrgId, BranchId,0, Tel);
            if (ActionCode == "1")
            {
                if (tbl.Count == 0)
                {
                    Result = Convert.ToInt64((Sch_CustomerTableAdapter.DML(ActionCode, Id, CustName, AreaId, AreaDesc, Tel, Mobile, UserId, StageName, Tel1, Tel2, Schoolname
                    , BranchId, OrgId, CreatedBy, UpdateBy, DeletedBy, ref InsertedId)));
                }
                else
                {
                    Result = -1;
                }
            }
            else
            {
                Result = Convert.ToInt64((Sch_CustomerTableAdapter.DML(ActionCode, Id, CustName, AreaId, AreaDesc, Tel, Mobile, UserId, StageName, Tel1, Tel2, Schoolname
                  , BranchId, OrgId, CreatedBy, UpdateBy, DeletedBy, ref InsertedId)));
            }
            return Result;
        }
        #endregion
    }
}
