using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.SchoolTableAdapters;
namespace BOL
{
    [System.ComponentModel.DataObject()]
    public partial class CDE_NATIONALITY
    {
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private CDE_NATIONALITYTableAdapter _CDE_NATIONALITYTableAdapter = null;
        protected CDE_NATIONALITYTableAdapter StagesTableAdapter
        {
            get
            {
                if (_CDE_NATIONALITYTableAdapter == null)
                {
                    _CDE_NATIONALITYTableAdapter = new CDE_NATIONALITYTableAdapter();
                }
                return _CDE_NATIONALITYTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </>
        #region "Read Section"
        public DAL.School.CDE_NATIONALITYDataTable Read(string ActionCode, long OrgId)
        {
            return StagesTableAdapter.Read(ActionCode, OrgId);
        }
        #endregion


        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>
        #region "DML Section"


        public long DML(string ActionCode, long StageId, string StageName, decimal PaymentValue, long OrgId, long BranchId,
    bool IsActive, int CreatedBy, int UpdateBy, int DeletedBy)

        {
            long Result = 0;

            //Result = Convert.ToInt64((StagesTableAdapter.DML(ActionCode,StageId,  StageName,  PaymentValue,   OrgId,  BranchId, IsActive,CreatedBy,  UpdateBy,  DeletedBy)));
            return Result;
        }
        #endregion
    }
}
