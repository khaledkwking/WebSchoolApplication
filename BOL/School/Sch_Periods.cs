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
    public partial class Sch_Periods
    {
        /// <summary>
        /// Declaration to make a connection in between the Dataset and the class 
        /// </summary>
        #region "Declaration"
        private Sch_PeriodsTableAdapter _Sch_PeriodsTableAdapter = null;
        protected Sch_PeriodsTableAdapter Sch_PeriodsTableAdapter
        {
            get
            {
                if (_Sch_PeriodsTableAdapter == null)
                {
                    _Sch_PeriodsTableAdapter = new Sch_PeriodsTableAdapter();
                }
                return _Sch_PeriodsTableAdapter;
            }
        }
        #endregion


        /// <summary>
        /// Read Section is for connect between the dataset and the user controls to execute the select statements 
        /// </>
        #region "Read Section"
        public DAL.School.Sch_PeriodsDataTable  Read(string ActionCode,long PeriodId,long StageId, long OrgId, long BranchId)
        {
            return Sch_PeriodsTableAdapter.Read(ActionCode, PeriodId, StageId, OrgId, BranchId);
        }
        #endregion


        /// <summary>
        /// DML Section is for connect between the dataset and the user controls  execute the insert,update and delete statements 
        /// </summary>
        #region "DML Section"


        public long DML(string ActionCode,long PeriodId, string PeriodName, string Notes , int StageId , long OrgId, long BranchId ,  int CreatedBy,int UpdateBy,int DeletedBy)
            
        {
            long Result = 0;
          
            Result = Convert.ToInt64((Sch_PeriodsTableAdapter.DML(ActionCode, PeriodId,  PeriodName,  Notes,  StageId,  OrgId,  BranchId,  CreatedBy,  UpdateBy,  DeletedBy)));
            return Result;
        }
        #endregion
    }
}
